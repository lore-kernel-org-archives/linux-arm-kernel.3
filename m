Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F7ED5AE5E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 12:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDLNS/qPby703vO1F+zowX9M9g0jDDg8xaH4NFHT2lM=; b=TwV0PfI9qZzo4qh0LWZa8kbD7x
	j5dPxVGOB/t3VJgHYwyqlBfSCSOHrb4vxTKS3+uof+nNwUZLSYBKe4vyVSV6/XmK0jqRFGkAtdiDV
	BRww/Xhwkf8CFL7KfxrsUksUfEnxUgIgjxwP8s/dDPNlhFGLTY1QQttdftTf9M4HdnDLjJzHNl9/T
	CxgqsYDEZvazKfeNrkxUr/3ObAaanc/QoHAdg/YEc5IOhVkUiTz3JLJy2fZGEX1tVhHM8MsLW03yc
	KgYYcnk7jgm8wpIZExcWFKeghbWk48kno586iqV3vGHlG7HKGdgoFlPChGjuJAQvvYew/ANgYn9hS
	mLh+qaTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Nel-0000000AR1F-3ugT;
	Fri, 08 Nov 2024 12:00:03 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Mth-0000000AImc-09Ng
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 11:11:26 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4314c006fa4so1814275e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 03:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731064283; x=1731669083; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QDLNS/qPby703vO1F+zowX9M9g0jDDg8xaH4NFHT2lM=;
        b=FKAUGQ44WNmnGkDpLhSgWZc/YhJdSoMFlriwtNIIT57LtjwUPxN54vgmIAo75WUjrt
         nOnF6BGQsKpijayQYU83bqYV4BKnYnVi7CAxbM92YBs9EOjRSHJ3K0HYu+tzn0w3hu5I
         mYePfnJUqqahUp5f7Yepc1UmItmz7HhBwgJ+DLqw9/ZmaOK/bFKe52w/66AycAM5hHFP
         TMLDGAe4O5gLmgt1FLQF7gfnCh/SLiFS17AZUvAUIpq2Q9SDdfPhkFJkt0O0Gkl4yFA/
         /E3gkvSFyMKjdBaMCBBjCxlqujpIvASWHopZ1cEqyZfGPgnWvN7vkMhFFpJDVn5eYsKk
         M/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731064283; x=1731669083;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QDLNS/qPby703vO1F+zowX9M9g0jDDg8xaH4NFHT2lM=;
        b=de4jLjBuV2sSavtuVtc+JY0d5GAAXWIcq+V9VedK1ji7UDLs0eX0p1ug59/nW4xIyY
         PabNjjsyu2tfjeRsmWq1G0qRxoKb1ORaCXtbnXju5W1jro6P7zve6xHWKsshfe2q3uwr
         ePeCiVLfggi/JUs3NYvvjb3TeUpAB/QJWl5aAC59cIqAS7Jb5w65r2q0uQCbV7LUEUoO
         stz9MZy6xcfHpb5a+aqvQJSoclCBi7YN77cURpuL5Bs+5cnJcmhtydjiI9K/TVIminy4
         xEErt+w6HIt7C0aZNdNrjbabVArAPecmNS1ONXJ7lXPBEQQqyGMocSu4BarKpgWzEe/H
         Btjw==
X-Forwarded-Encrypted: i=1; AJvYcCUHxypyGRU/B1vUhN2ADCh6Qw7ywGdu8d+rPU4Tdx4xijuPPTOTNAQqPzjI/xS1I3Nk6YK/PTcaKSU+2u94aDTe@lists.infradead.org
X-Gm-Message-State: AOJu0YxZeQkMU01LiFrW8w62U0iraC0ufoj3UNr0vZfztD3uNiY7kOQl
	JfEM7KMym+CRhTlEMnOMlJs4fvsRDjmlhuBFbN1lPifl3B5id/D/gY0w3K4wGt8=
X-Google-Smtp-Source: AGHT+IGgoDiDtUOfkG5Qw2tR51xgA+74Y2eRmiyJYpAZtUIt17I/3OpoI+McKMfI86SYpBbPB+XszQ==
X-Received: by 2002:a05:600c:1c27:b0:42c:aeee:80a with SMTP id 5b1f17b1804b1-432b752038cmr9147825e9.7.1731064283374;
        Fri, 08 Nov 2024 03:11:23 -0800 (PST)
Received: from [172.16.24.83] ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97ce1bsm4266761f8f.36.2024.11.08.03.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 03:11:22 -0800 (PST)
Message-ID: <fccee5aa-9ced-4773-809e-1ee66ccb74cc@linaro.org>
Date: Fri, 8 Nov 2024 12:11:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos8895: Add cmu, mct, serial_0/1
 and spi_0/1
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Mark Brown <broonie@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
 <172994467264.24870.11860096857422265131.b4-ty@linaro.org>
 <f232dbb0-9036-46d6-83f9-27363813930d@gmail.com>
 <cd326e01-75b8-495c-bc15-1d9ebde8c4fc@gmail.com>
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
In-Reply-To: <cd326e01-75b8-495c-bc15-1d9ebde8c4fc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_031125_140134_BA0D8A5D 
X-CRM114-Status: GOOD (  15.12  )
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

On 07/11/2024 17:02, Ivaylo Ivanov wrote:
> 
> 
> 
> On 10/26/24 15:18, Ivaylo Ivanov wrote:
>>
>>
>> On 10/26/24 15:12, Krzysztof Kozlowski wrote:
>>> On Wed, 23 Oct 2024 12:17:29 +0300, Ivaylo Ivanov wrote:
>>>> Hey folks,
>>>>
>>>> This patchset adds device tree nodes for multiple clock management unit
>>>> blocks, MCT, SPI and UART for Exynos8895.
>>>>
>>>> Exynos8895 uses USIv1 for most of its serial buses, except a few that
>>>> have been implemented in this series. Support for USIv1 and HSI2C will
>>>> be added in the future.
>>>>
>>>> [...]
>>> NOT applied patch 4/5 - I wait for bindings to be accepted by Greg.
>> Alright, thanks for applying the rest!
>>
>> Best regards, Ivo.
> 
> Bump - now that the uart patches are merged, are you gonna merge the DT
> changes after the merge window? If not, I can send a new patchset that
> includes them and also adds PMU compatible node for the mongoose cores,
> since that got merged with exynos9810.
> 
> Best regards, Ivo.

It is too late in the cycle for me to pick it up. I will take it after
the merge window, so feel free to send new version with some other changes.


Best regards,
Krzysztof


