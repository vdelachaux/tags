var $t : Text
var $bottom; $containerWidth; $height; $i; $left; $offset : Integer
var $right; $top; $width : Integer
var $e; $font : Object
var $color : cs:C1710.color
var $svg : cs:C1710.svg

$e:=FORM Event:C1606

Case of 
		
		//______________________________________________________
	: ($e.code=On Load:K2:1)
		
		Form:C1466.tags:=["France"; "Martinique"; "Guadeloupe"; "Ghana"; "Burkina Faso"; "République Démocratique du Congo"]
		Form:C1466.colors:=["silver"; "crimson"; "tomato"; "peachpuff"; "steelblue"; "lightgreen"]
		
		SET TIMER:C645(-1)
		
		//______________________________________________________
	: ($e.code=On Resize:K2:27)
		
		SET TIMER:C645(-1)
		
		//______________________________________________________
	: ($e.code=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		OBJECT GET COORDINATES:C663(*; "tags"; $left; $top; $right; $bottom)
		$containerWidth:=$right-$left
		
		$svg:=cs:C1710.svg.new()
		
		$left:=10
		$top:=10
		$offset:=10
		$height:=25
		
		$color:=cs:C1710.color.new()
		
		$font:={font: "'Courier New'"; size: 15}
		
		For each ($t; Form:C1466.tags)
			
			$width:=svg_Get_string_width($t; $font.font; $font.size)
			$width+=$offset
			
			If (($left+$width+$offset)>$containerWidth)
				
				$top+=$height+$offset
				$left:=10
				
			End if 
			
			$svg.rect($width; $height).position($left; $top).radius(10).color(Form:C1466.colors[$i])
			$svg.textArea($t).font($font).position($left+5; $top+5).color($color.fontColor(Form:C1466.colors[$i]))
			
			$left+=$width
			$left+=$offset
			
			$i+=1
			
		End for each 
		
		OBJECT SET VALUE:C1742("tags"; $svg.picture())
		
		//______________________________________________________
End case 