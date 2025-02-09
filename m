Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB312C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 20:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RGz6LGAgvawN6AjjS8OE8xM5iM+s41gvkEim96ZKyA=; b=CxAKtn/fs9gP114eCTbye2RUcv
	hjZvA+9Oao+IR1Dc/QYxcC02Yx3jFkn1MvCADrLCtevFAlTONlRRMCC0P1NilXTokioyjVLopQymL
	auOPfWk2kQv1ksHJMPQUmZvifFXPoPq5l3Y02SVC51R2/JAla44iWrZJcr0VE0jDWGHkzVKG4Ofmm
	+iqEV1/h0b1TQKxJAE2Wm4mqO2cQiHd8Vor3nhKV7tz11UWObWdgAMjvTG7+NhTge9yxRxxg0Atqz
	PRAXFhjHfndyEjJuJKERe4v866h/plaNY0GCrrhN9T/vYJKUnkptAeCd8PAduhlByC+z7vuNrpTbY
	VoWeUs/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thEAi-0000000FX73-3gwu;
	Sun, 09 Feb 2025 20:44:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thE82-0000000FWcL-2eBt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 20:42:13 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4393f097dafso970645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 12:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739133729; x=1739738529; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5RGz6LGAgvawN6AjjS8OE8xM5iM+s41gvkEim96ZKyA=;
        b=uhyRppsuSbb4OkS7mjwXBVHZNXCht8ohXXqc8GknJu6GXSRpyuNDASv3ixinKBFutI
         qpXP1O+9OqTW9cmjiOjy8cQlM/dazMKLG9PG/hSzbUe5ouqzZvkl87H3lrkOSbp3dhtc
         FsY76FYEsYOcxrXtEPUYYAz0BF+A1o6Q/jTshvyFaj0I+BQkF5Q/f/Nlc8nrG3QpbGaV
         zJjUcKH3bV4DqOgcCSGtsUeYLJNHE2myHYS7LQ5MYqfuMVW/OfaCqgZe/bw0EybhkXBn
         qffPailbQOTHDo6uITnQ54XBqXfX0CygtYzBxI4949Vn1lVfR0WNQB/inBL4A+y+bYnh
         MTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739133729; x=1739738529;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RGz6LGAgvawN6AjjS8OE8xM5iM+s41gvkEim96ZKyA=;
        b=oDFg1aoCXUIqQuySIyVOgJnQKiKRpb/BFifrbDtFYp0Ng2e6rT8ygbe3AdGLhtFjkZ
         z2tlkNBCZUSzOooponXD/vi2OepZ7t4q97WdeJWkmo+VOCZZ+6xN029SPXGxZ4knh36q
         f0XZhjgxcbMhKIjOTz4eujdYnlIYgR6Y6Lin/CrnAnhJpMwHe4oPzRhfPP2nMhDAXWHu
         YZolqgHcOqxAtm3S8tDlPO3Q/d0ajEu6iGvU1IvqJbmOKmjl4L9x1z6np0RmNrOGzT3w
         R9ybK5T4vQDjOn/p9TBjFob4XbQZWJd4eWyUuR/yvnEPVqKUJZpnepBkp6aoDypFJb2+
         bDgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfMhOWR+tGkhaWSBQjEyfi7vQ42pQDByiMWxPzjWh1dzGayEHo94e0zGTFUSOqtOdCO4/bgvzf7csDlvn0jHON@lists.infradead.org
X-Gm-Message-State: AOJu0YzNNx5sRwSRLjt+sXk4s5kCoFr4+AXqpZmtVRcTZAIGkfGGD+f1
	lW61A52hvZjnBVgLpeM1IEKnMCgYcDmDhvbVZ1ZT4J9Y6Nqf1H6J/Oz/tdWhd7c=
X-Gm-Gg: ASbGncv2Y56GaQvtIvMw+v4r3TMqrgDzhwbmWYKjsVi9hDEuNx3AYDCH9DQAhjMgSdX
	+VKtt4g313S178F/wmz50JtWBPdR1KNPP43PgD804CflnaeApgQFK3YBiHLQ/3mfwhb4TecrLWq
	o0V7ds+qFEdFomdrHv0Hmw1ZikPuFIujC75q5lMeyEq2E/DTo66SueYwIYbHTHoE2Q2+kgEhgwQ
	ESe0AFTJtiqQCs8vqmkC/8lrgj8lWmLCcI1DOSE771gPK7SOrvzFLUzrMj0nL+qP/KJTAGBP+2A
	+ZKpUw+ueJy/pSDAlNlbDEKEdWsXbBJKuHk=
X-Google-Smtp-Source: AGHT+IHavxVn/g//pI/tj743lyQj9IQgBXD+xK+zca5kRGYd7NJ/QZZbL6fGqI1Nq1uUaAm5IKE3zg==
X-Received: by 2002:a5d:5889:0:b0:38c:5db6:69cb with SMTP id ffacd0b85a97d-38dc9355cacmr2960535f8f.13.1739133728818;
        Sun, 09 Feb 2025 12:42:08 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dcae80dsm122161845e9.22.2025.02.09.12.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 12:42:08 -0800 (PST)
Message-ID: <5c0c716c-3f82-4b10-aceb-c85ecba52a53@linaro.org>
Date: Sun, 9 Feb 2025 21:42:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: media: i2c: align filenames format
 with standard
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Heidelberg <david@ixit.cz>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Ramesh Shanmugasundaram <rashanmu@gmail.com>,
 Tim Harvey <tharvey@gateworks.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Akinobu Mita <akinobu.mita@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250209195517.148700-1-david@ixit.cz>
 <20250209201833.GE21843@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250209201833.GE21843@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_124210_693113_755D5F0C 
X-CRM114-Status: GOOD (  14.45  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 09/02/2025 21:18, Laurent Pinchart wrote:
> Hi David,
> 
> Thank you for the patch.
> 
> On Sun, Feb 09, 2025 at 08:53:43PM +0100, David Heidelberg wrote:
>> Append missing vendor and align with other sony definitions.
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>  .../media/i2c/{ad5820.txt => adi,ad5820.txt}  |  0
>>  .../i2c/{adp1653.txt => adi,adp1653.txt}      |  0
>>  .../i2c/{adv7180.yaml => adi,adv7180.yaml}    |  2 +-
>>  .../i2c/{adv7343.txt => adi,adv7343.txt}      |  0
>>  .../i2c/{adv748x.yaml => adi,adv748x.yaml}    |  2 +-
>>  .../i2c/{adv7604.yaml => adi,adv7604.yaml}    |  2 +-
>>  .../i2c/{mt9v032.txt => aptina,mt9v032.txt}   |  0
>>  .../i2c/{max2175.txt => maxim,max2175.txt}    |  0
>>  .../i2c/{mt9m111.txt => micron,mt9m111.txt}   |  0
>>  .../i2c/{tda1997x.txt => nxp,tda1997x.txt}    |  0
>>  .../i2c/{mt9m001.txt => onnn,mt9m001.txt}     |  0
>>  .../media/i2c/{ov2640.txt => ovti,ov2640.txt} |  0
>>  .../media/i2c/{ov2659.txt => ovti,ov2659.txt} |  0
>>  .../media/i2c/{ov7670.txt => ovti,ov7670.txt} |  0
>>  .../media/i2c/{ov7740.txt => ovti,ov7740.txt} |  0
>>  .../media/i2c/{ov9650.txt => ovti,ov9650.txt} |  0
>>  .../i2c/{imx219.yaml => sony,imx219.yaml}     |  2 +-
> 
> I've submitted
> https://lore.kernel.org/r/20250208195202.23164-1-laurent.pinchart@ideasonboard.com
> ("[PATCH] dt-bindings: media: imx219: Rename binding file with vendor
> prefix") that does the same for imx219.yaml. I don't mind if this patch
> gets merged instead.


David's patch was submitted in December:
https://lore.kernel.org/all/6djxfcuroxlth2th3tpuesauhdnowatzgnyhesewjfz32v6gbz@q2dj7jsxiqlw/

and also earlier:
https://lore.kernel.org/all/20200715140951.90753-9-jacopo+renesas@jmondi.org/

Best regards,
Krzysztof

