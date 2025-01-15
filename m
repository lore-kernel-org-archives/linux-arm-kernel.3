Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C67C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 19:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYIRfzMIoEey6eiQZC1qlV3nAdw1Yt+nNSYPyfY46Hk=; b=XWpAwDB8HX6cUpqfKjNSNdE2U1
	CHaoEv24XxQiAYQ7kFuG5RzqatOIWe8qRepnUqUQ67k4QYK5T/aKn4uXu1opMWRXX8NzyyNsivIIy
	W1xbcJtFQHmG9jg0B53g0yZdZ+AgNse1HCJ/2t6SzxStSAQ/1/E68KsFj2mcndWZCPAEcWxDm/2TO
	IMK1UOVczVGBsDfNTWzBx1zEvDImJjT9s7dV7jVk9NMsdHWB9zv/CHaKddyksZmBjoRj6KSA8W6qt
	CAbdeqbgI4c6U//MRoAzbpwy40RpseR6e0prhDWrIFhjq4OVlIJNd7oc2dGJBaIx+BLDVJ9dBkXhl
	LSYooVKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8xo-0000000CtXE-1bGY;
	Wed, 15 Jan 2025 19:22:04 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8wW-0000000CtH1-1iLK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 19:20:45 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ab2f33766e6so2655766b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 11:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736968843; x=1737573643; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nYIRfzMIoEey6eiQZC1qlV3nAdw1Yt+nNSYPyfY46Hk=;
        b=dc61bTqgTJqVYwGB74OU4sie5OWfTK8Sp0hKe51u9oC+u0+9EufaT0iF1LXHQnj2Ns
         A3um8fBN32EtGMB9iCsu5HYE2gY7u+97MLyxENrT6XWe+NGAADKPiHCnOKpdtuAiy5dF
         9KTZWdyIQXBodvM8BdHKrsUDSM9fpzewKWfKefeTLIA7mKId14Zvg1jXlh6yvYhhb0bk
         kscTM3otCPgjEL4GQ+CguttCoMMXeMQxHX7JSJNhuWMvXctPvVgdXE+cYo92+fO3Le4w
         RBKcGHBupopyvQMVYaT7+CJahzZYNvGPSjq2DaU5e+pbOVDpkcdglH7UG0GzKGOJHMa5
         AGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736968843; x=1737573643;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nYIRfzMIoEey6eiQZC1qlV3nAdw1Yt+nNSYPyfY46Hk=;
        b=TuV5HtUqEVG9tgAllt+A4p8TDurT7h+oYb0OWH7Krul5i/PAgm8ra2qYxUxbfEr3as
         CjEveEQX83XLy+Fa4BS5oKYcEeoYJ47UEVA9jjrZJovqOo1OLyX8F+q/yZd5cXESheH9
         RfiM8ObgGE6diU3BNiGYB4uWVO/Lbiht0ZroThwUmxpZ5Jhdcp49wSZWQyTuWM2NgmIP
         RjA6HShEhgbBFzo2OPenihQ9O8erD5hlvZ7XIvfl2NqabRf5HTDvrg8S/gV6yKA4LMAL
         ilEhJt8yjAhBFaWKVZxsKO1P1f9+TdYuxT+0opMVxgA52LqwX1ZPVYyuiGlSTkwyTbOy
         aYBw==
X-Forwarded-Encrypted: i=1; AJvYcCVm5KlGUgzx52bzTfmglCtOMWi4/TZN6+L/YCPu+0TfFFWGnOzbWVqjiB2Jbhr+IB5JdjVO5f2t0t69LUkMjnaZ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi/LLMvAW0jbF3JFKiYYlgdQKLZ3WiIf70O6L0h3qWUWcXPAGK
	ZF2lHT0Y9LVqzaIVaopbzJTVdo79sfWqzkO0dQEdv2jNo7RFQ3IRAgGXQYyS6GLPIbRRPJsooCd
	P
X-Gm-Gg: ASbGncvW8cOaEmCmoM3qDbeOG9izF6ToR4vtbv7OI3St1iaCdjMfuuvZgxFlIobaG/B
	sLu2Ss5/JauRDQp8p5Y9b4ga6IJ0AZBEXt+8CZyX7q21wkOGw6ji2sV+ldPkXV40U7oQQjspSyP
	qozuYia6kIyiA2Imco9bVV5L8m76LwK5St1pxtMTZguOK/Ynu28wt8aoZNzPmHnsxZOshvzRB7u
	cszxtURaNmxPRN5ybxbU9uKktl5YlWrLkC4C4l19TgOGYk8GHUN2+pFx6FV1/cB1mLhMAlrB9NM
X-Google-Smtp-Source: AGHT+IEobeKPSb66dhQJB8BVuTHa5PVEBMft92rOBD4aCHAR3KxGt12rfIWH0l1xEEGi6zqG+032uw==
X-Received: by 2002:a17:907:bb8d:b0:ab3:2719:ca30 with SMTP id a640c23a62f3a-ab32719d024mr384947066b.10.1736968842769;
        Wed, 15 Jan 2025 11:20:42 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9565517sm800167966b.130.2025.01.15.11.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 11:20:42 -0800 (PST)
Message-ID: <37603c73-cab7-4973-8705-1deee6445a7d@linaro.org>
Date: Wed, 15 Jan 2025 20:20:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ufs: Use str_enable_disable-like helpers
To: Bart Van Assche <bvanassche@acm.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250114200716.969457-1-krzysztof.kozlowski@linaro.org>
 <ca5482da-1612-4fab-bfeb-bdc72cd65662@acm.org>
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
In-Reply-To: <ca5482da-1612-4fab-bfeb-bdc72cd65662@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_112044_472738_EB0AEA8B 
X-CRM114-Status: GOOD (  15.38  )
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

On 15/01/2025 18:53, Bart Van Assche wrote:
> On 1/14/25 12:07 PM, Krzysztof Kozlowski wrote:
>> 2. Is slightly shorter thus also easier to read.
> 
> Does this change really make code easier to read? It forces readers
> of the code to look up a function definition. Isn't there a general

There is no general preference, up to you.

> preference in the Linux kernel to inline function definitions if the
> function body is shorter than or close to the length of the function
> name? I'm referring to functions like this one:
> 
> static inline const char *str_up_down(bool v)
> {
> 	return v ? "up" : "down";
> }
> 
> Bart.


It's subjective - in some places ternary is really complicating, from my
other patch:

	data & XCSI_DLXINFR_SOTERR ? "true" : "false",
	video->hq_mode ? "on" : "off", video->jpeg_hq_quality);

note that's ternary is split here:

	dstat & BT848_DSTATUS_HLOC
	? "yes" : "no");

I understand if you don't find the code here better.

Best regards,
Krzysztof

