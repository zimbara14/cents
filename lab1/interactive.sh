#!/bin/bash
echo -e "\033[43m- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\e[0m"
echo $'\033[96m		  		   *     INTERACTIVE MENU     *\e[0m'
echo $'You can:\na - use calculator (command is: \033[31mcalc\e[0m)\nb - use reverse (command is: \033[32mreverse\e[0m)\nc - find the length of a string (command is: \033[33mstrlen\e[0m)\nd - warnings and information (command is: \033[92mlog\e[0m)\ne - exit with a code (command is: \033[35mexit\e[0m)\nf - see manual for everything (command is: \033[36mhelp\e[0m)\ng - use function search (command is: \033[34msearch\e[0m)\nTo use the command you like, you just need to input either the letter of the command or the specific coloured identifier. Try!'
read inp
case "$inp" in
	calc|a)
	echo "Enter sum/sub/mul/div and two ints in one line!"
	read var n1 n2
	echo &(./text_calc.sh " " "$var" "$n1" "$n2")
	. ./text_interactive.sh
	;;
	
#permission denied reverse, its a dir; exit x - nan;  var interactive...in reverse check if its a directory, if there is a possibility to write in a file and yeahh

	reverse|b)
	echo "Enter the two name files"
	read var3 var4
	echo "Done! Check out the $var4 file!"
	. ./text_interactive.sh
	;;

	strlen|c)
	echo "Enter a string:"
	read str
	echo &(./text_string.sh " " "$str")
	. ./text_interactive.sh
	;;
	
	log|d)
	var7=&(./text_log.sh)
	. ./text_interactive.sh
	;;
	
	exit|e)
	echo "Would you like to input exit code? If not, just hit the enter button"
	read varr
	if [[ -z "$varr" ]]; then
		exit 0
	fi
	. ./text_exit.sh " " "$varr"
	;;

	help|f)
	echo "This is a manual."
	echo "$(<help.txt)"
	echo " "
	./text_interactive.sh
	;;

	search|g)
	echo "Enter directory and a regular expression"
	read diir reeg
	var9=&(./text_search.sh " " "$diir" "$reeg")
	. ./text_interactive.sh
	;;

	*)
	echo $'\033[31mInvalid option. Try again.\e[0m'
	. ./text_interactive.sh
	;;

esac

exit 0
