files=(
standard.scel
'https://pinyin.sogou.com/d/dict/download_cell.php?id=11640&name=%E6%90%9C%E7%8B%97%E6%A0%87%E5%87%86%E8%AF%8D%E5%BA%93'
popular.scel
'https://pinyin.sogou.com/d/dict/download_cell.php?id=4&name=%E7%BD%91%E7%BB%9C%E6%B5%81%E8%A1%8C%E6%96%B0%E8%AF%8D%E3%80%90%E5%AE%98%E6%96%B9%E6%8E%A8%E8%8D%90%E3%80%91'
poetry.scel 
'https://pinyin.sogou.com/d/dict/download_cell.php?id=2&name=%E5%8F%A4%E8%AF%97%E8%AF%8D%E5%90%8D%E5%8F%A5%E3%80%90%E5%AE%98%E6%96%B9%E6%8E%A8%E8%8D%90%E3%80%91'
chengyu.scel
'https://pinyin.sogou.com/d/dict/download_cell.php?id=15097&name=%E6%88%90%E8%AF%AD%E4%BF%97%E8%AF%AD%E3%80%90%E5%AE%98%E6%96%B9%E6%8E%A8%E8%8D%90%E3%80%91'
computer.scel
'https://pinyin.sogou.com/d/dict/download_cell.php?id=15117&name=%E8%AE%A1%E7%AE%97%E6%9C%BA%E8%AF%8D%E6%B1%87%E5%A4%A7%E5%85%A8%E3%80%90%E5%AE%98%E6%96%B9%E6%8E%A8%E8%8D%90%E3%80%91'
mobile.scel
'https://pinyin.sogou.com/d/dict/download_cell.php?id=15185&name=%E6%89%8B%E6%9C%BA%E8%AF%8D%E6%B1%87%E5%A4%A7%E5%85%A8%E3%80%90%E5%AE%98%E6%96%B9%E6%8E%A8%E8%8D%90%E3%80%91'
coding.scel
'https://pinyin.sogou.com/d/dict/download_cell.php?id=75228&name=%E5%BC%80%E5%8F%91%E5%A4%A7%E7%A5%9E%E4%B8%93%E7%94%A8%E8%AF%8D%E5%BA%93%E3%80%90%E5%AE%98%E6%96%B9%E6%8E%A8%E8%8D%90%E3%80%91'
java.scel
'https://pinyin.sogou.com/d/dict/download_cell.php?id=80764&name=Java%E3%80%90%E5%AE%98%E6%96%B9%E6%8E%A8%E8%8D%90%E3%80%91'
)

for ((i=0;i< ${#files[@]} ;i+=2));
do  
    # 删除原来的词库      
    rm ./dictionaries/luna_pinyin.sogou.${files[i]}.dict.yaml
    # # 下载搜狗词库
    wget ${files[i+1]} -O ./dictionaries/${files[i]}
    # # 生成rime格式词库
    ./lib/cli.js ./dictionaries/${files[i]}    
done
# 复制到
cp ./dictionaries/*.yaml ~/.config/ibus/rime
# 重新部署
rm ~/.config/ibus/rime/build/default.yaml
ibus-daemon -drx
