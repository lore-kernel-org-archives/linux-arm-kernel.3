Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43666C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 09:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Inio5hItYIE7Gfl8ekEhk3c3MGH8gDi+Zkltf8koQq0=; b=i8BJ8Yz2bNAoxJefqWjta3QxT0
	L1jIJ1UP2DcT3UraYd0F6ZXcE/ih8yfkIdZ32w0bVgEQ9CL1Is5oddJ7Gao2fWA69pCkoU8mS4qLq
	yGXQD8TOLSXA+MK7hOizeTXHNFGNMucdF7ktw+btcA4nJYVPfPILmo5sQYioZ20O7ZinHC8Pb1GtA
	oZpaYP54XqdATGLhl6U+TtjYgZfqXebUIsKbxBzIoUdEFXo8EgEw0Qcb+bgmnQrb+WjgjTwWDx2sb
	LnBKRuQdy/CYcGc4fwROmovbgyHXq10abIvLldrOQElvEDAOHVYZ44ZGXhIUA4YgiM/GQksmY3AiB
	0gBaArVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubc3z-00000004hWH-0IA2;
	Tue, 15 Jul 2025 09:35:03 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbQC-00000004aTt-2mBC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 08:53:59 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4535fc0485dso6642705e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 01:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752569635; x=1753174435; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Inio5hItYIE7Gfl8ekEhk3c3MGH8gDi+Zkltf8koQq0=;
        b=Gcx5gF+RxzR7kh3rf7Q2FEjYBiuA5za2kLCu2gj7J0wzwTScMfzHk6rTvhr9oi1sjS
         eJk+TNrLgYSMplkS/Ayyqevmvo6KdfaEogFa9XlwXNbOVPxulKERVr75vj66y4vEAAit
         o9oz5xbjpkFoFLw3GURy52fSBiPneDsWzNYoF/5sBBAJoC8xR7Dm9mbmkEE0gSBDs9RP
         2Jm8DDmAisOCy3rDOUouUUSGIoKxqrNnQF0mzciMZwpkanBm2WVvhOE0oQdbTJ4+S/zb
         Chap8ZhKQK6u4gmeM9vPlr8ncEmUpZSJmQ4JjNo2Yr1wY6224fl1UxgN04ltyZRVENaQ
         UpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752569635; x=1753174435;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Inio5hItYIE7Gfl8ekEhk3c3MGH8gDi+Zkltf8koQq0=;
        b=mSUFgaivbYIOTGvIsYVrlJ7IG1aYnfFRDGj3+KLTbBWLDVKb4uNCnvjeqGkkZhORhe
         4uEQgfnEi2kTnD62pqif4V2Ouocr+uS8Qe8Ilvx3/S8/hUKA61TueLiGgqHHXhV89QeB
         wgOwYIhbJe4wEctlWZ03ZmLzVtZ0lFns1NnxJ44+Hi2ueTb15BEHsoqS1JNFnMLB6SpM
         HB5F5qP/1rJXWZfegeRAxYIREQ0xM7l/q7gO2kbPMefN+Dl/EbjKkX3lTrK7JPW2a71N
         /HwKHbNe4+chF/wxQ41rUgVTM1CcImw9oz2q6gBoQTHry/nhKwAex2PnCcBAty8G1+o7
         303A==
X-Forwarded-Encrypted: i=1; AJvYcCXgvtttpAPBjlfUjWH0htgsUVBxjfbmgaSv8Q9Y3HJiKQi7ao6MEI3CFyDyeLPD4GrI4N/RNS6Eal/xi2wj+hQ/@lists.infradead.org
X-Gm-Message-State: AOJu0YzGhtRUI1Q5TzNPHLfVm1gaOs0FRJCq+f1gEKlXAF94Xo4xgwnE
	eoVAGJHoyaA1kqkijZRwx27gA2Yayhad/S+L/FtGL3UMNTGhqmTWgEShpKA0tRLWAoU=
X-Gm-Gg: ASbGncvAkfioT229zIdkHZNDH45bXGwTIdu9Z0QY5kcDJsqlQBp4RMUsc85d4ZMjH85
	GWVAOEdvdKAxOrx/itbcSjmOLkx+/Uu11pR6GRlbrbUggD9b0dwxYknJXrz6MyJ+PejQ0JE5BKK
	JT6Wxpy/044RWKdKRwFGWB1+5c9BXjh0FXkUzcqUQQ6AH2Hih6knVPRP+56PoFKYllYwgT2AUNy
	VyCP6CZT71BYx8YLuaLuzdasFQggpu9+m3Wwj+WhkT/4SpDe11rVkg5N0O792zjK5i0VwWWDk8b
	TkhVLlgkjTRGqLIF11zW77C4skY0C7MINJLLg2nltWpUBcbMLYlu8DXEscZHpaATHbYckQ1EHLX
	Whz+Syy9zWVkV7hypbNw0SIvW/GTH9uXOd57XRQkpnA==
X-Google-Smtp-Source: AGHT+IGGFf611I4xGD+mAyQMZaK74muYs6u8nJ4rajE19UqGLjgCRcydVsweJTptw446w0tSfdYTpA==
X-Received: by 2002:a05:600c:3d94:b0:442:e0e0:24d with SMTP id 5b1f17b1804b1-456291af6e6mr3125305e9.7.1752569634736;
        Tue, 15 Jul 2025 01:53:54 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4560c50b7b4sm93657195e9.25.2025.07.15.01.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 01:53:54 -0700 (PDT)
Message-ID: <aae14c58-cf11-45a2-b036-96ce02eb9648@linaro.org>
Date: Tue, 15 Jul 2025 10:53:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/19] dt-bindings: media: Add bindings for ARM
 mali-c55
To: Dan Scally <dan.scally@ideasonboard.com>, Rob Herring <robh@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
 jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
 <20250714-c55-v11-7-bc20e460e42a@ideasonboard.com>
 <20250714212510.GA3193902-robh@kernel.org>
 <f81e4f88-3fb5-4ae6-a861-08ec7f44c990@ideasonboard.com>
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
 DFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92Vcmzn/jaEBcq
 yT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbThLsSN1AuyP8wF
 KChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH5lSCjhP4VXiG
 q5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpFc1D/9NV/zIWB
 G1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzePt/SvC0RhQXNj
 XKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60RtThnhKc2kLI
 zd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7qVT41xdJ6KqQM
 NGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZv+PKIVf+zFKu
 h0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1qwom6QbU06ltb
 vJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHpcwzYbmi/Et7T
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <f81e4f88-3fb5-4ae6-a861-08ec7f44c990@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_015356_723899_5C29BEF3 
X-CRM114-Status: GOOD (  13.60  )
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

On 15/07/2025 08:28, Dan Scally wrote:
> 
> On 14/07/2025 22:25, Rob Herring wrote:
>> On Mon, Jul 14, 2025 at 04:06:33PM +0100, Daniel Scally wrote:
>>> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
>>>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
>>> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>> ---
>>> Changes in v11:
>>>
>>> 	- Dropped in arm,inline_mode property. This is now identical to the
>>> 	  reviewed version 8, so I have kept the tags on there.
>> [...]
>>
>>> +  arm,inline_mode:
>>> +    description:
>>> +      The ISP can be either electrically connected to sensor and CSI-2 receiver
>>> +      or driven through a DMA input device. This property declares the ISP as
>>> +      being electrically connected to the source of image data.
>>> +    type: boolean
>> Except you didn't drop it.
> 
> 
> Argh, how did I miss that. Sorry (and sorry Krzysztof too!). Thanks for the heads up...I'll re-send 
> this patch.

No worries, happens. I appreciate the work.

Best regards,
Krzysztof

