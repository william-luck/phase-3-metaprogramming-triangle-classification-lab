require 'pry'

class Triangle
  
  attr_accessor :side1, :side2, :side3

  @kind = ''

  def initialize(value1, value2, value3)
    @side1 = value1
    @side2 = value2
    @side3 = value3
  end

  class TriangleError < StandardError
    def message
      "ERROR: invalid triangle"
    end
  end


  def kind
    if side1 > 0
      if side2 > 0
        if side3 > 0
          triangle_inequality_check
        else raise TriangleError
        end
      else raise TriangleError
      end
    else raise TriangleError
    end
  end

  private

  def classification_check
    if (side1 == side2) && (side1 == side3)
      kind = :equilateral
    elsif (side1 == side2 || side1 == side3) || (side2 == side1 || side2 == side3)
      kind = :isosceles
    else
      kind = :scalene
    end
  end

  private

  def triangle_inequality_check
    if side1 < (side2 + side3)
      if side2 < (side1 + side3)
        if side3 < (side1 + side2)
          classification_check
        else raise TriangleError
        end
      else raise TriangleError
      end
    else raise TriangleError
    end
  end


end

binding.pry 
0
