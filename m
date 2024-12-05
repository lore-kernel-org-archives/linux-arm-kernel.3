Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDA6E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TeU21f2/gzBOxQVVYAFoJs6zNxfWr5ZjMAtgv/QGkUY=; b=w5hFhwoMwIRJOJMt4Nwohy5REZ
	BUdH1/HrfQ+iax/HrFzfKV/vjOz3Zfntt2gJZYCI/zEcPdvf6KAkPHWDAX2DCgj1mMXo0k6TQcurv
	tJI0dJVjdBRfRrwTOtM//tYMSGvVt3Lhch63u++f0C9Rj6mIX2LOiry3/sRuKX7IvJi0yFtOcDa0w
	ia8VZN5w77B1C072Jb7hBPolTj+bb0TH9KHuffuUeyQ0elynBLWrH2OCiBZqXZrYxakjAa2R51nz9
	gH0BbbIJwTYL/IkECpf7mzH15TPiKvqGp0vR0NjG3Thm8HNr0GIAx5JHnHixYB/BPvAmNzouL3ruw
	IT7K9fDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDj4-0000000GWhG-3hqC;
	Thu, 05 Dec 2024 15:25:10 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDi2-0000000GWQ2-1nnG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:24:08 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-434a1095fe4so1244705e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 07:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733412244; x=1734017044; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TeU21f2/gzBOxQVVYAFoJs6zNxfWr5ZjMAtgv/QGkUY=;
        b=D2GBLBjBXsW5YrQFCb8LRC/r3TTbi3/quGHf2lpl/WvPttHjgTeQ1q2aMl7QwYCNCp
         J+ib9O25oD10Xccu4wRtITS0J7zEO73Es0nG2vIhdMzac4v0nyi+N3f/ugTSSBZwnESq
         ZeKQg1zY8YBzx7hQK762qcrAJr9Lq0cnoUdW9SpFipQ8rhQn1Opo73F2cC7/FUON/jyU
         S1d/DtOiYHnJD55uDb50KCuXwW2AO3RapbFpsHjXoZDRaeMRi1IWLcUJEmNytxK0TcB7
         1DkYV7R9SiMDNI4tjqNbtiLdG1kYjO8Lbf/71/Xa57dba3v1D5MDMtPm7MlIZ+xJpPcs
         JYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733412244; x=1734017044;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TeU21f2/gzBOxQVVYAFoJs6zNxfWr5ZjMAtgv/QGkUY=;
        b=kHaMJjWVt8kkJALoaKIvA7JuGsjyfHILxMA5lyHFUoDKCd3gCaApmAgfGRnnxK5/YM
         1cyZ/2261iGdJcFZsD9hqbshFUpBqz8sz3mZuKBJtGdRrU3YQZfDgBSgoKs3u4SSr072
         vhs3jawfaFKuKM4ZZLv3M5bDVGS5sTJppiwg7vHTQ+d0nOctMl71syvePCCETkUiPwlu
         8Jb7sssbepMz7Tj6kGRyzsmpr77Yrfmdh36ZXSEqLXGoxnzDdbnFCbezuXyL7J4sY6q0
         vZrqZqPA66eSOTQNGcatQvr9HV/PSsv+vxOsqPU0i2RBDxjBVBJazonIJLAPIHyIiysP
         gicw==
X-Forwarded-Encrypted: i=1; AJvYcCXRNzm48gyEd8TICUnIdfl3NYftwnYDeSc+OF9RFE2nm7r4aGbpdUTUcdO/SRvmXe+KxVlugkMUMurnZvDPjNfH@lists.infradead.org
X-Gm-Message-State: AOJu0YzeOnIuPLWw6Z01taIsI6HfqVsB5xLYULJRNQxkDal5RR7a9Z8P
	lymY59XyrMb8kGwm5GsLUt56H9E8rAjQeHqkDEa/Hx+AA0plfJQOWSgEgx6e8Tk=
X-Gm-Gg: ASbGncvoUdHIFASwlHiTAJ/V4kHq2UZ7YjuV1tywjMidZMyAq0V7AehBqllszgxYiFQ
	lPinHB8fSFv/8Zavxp2U1KLmhRKT0R8sj2rcYLRhF2jz7FEhZe+yeZ6ZhosVnipcCTT5fEoMieL
	aQDRMo9rXa1Fnwm2cfREN+XZ5+I9/nWxJG2iB6bTcnOBfh+vF/ClrLEtfLGh4VJt9KeXGYzF3cd
	53lnmlvDGcsJbTFulI9Neg6fXEHnhFVJngpx7t8iJoY6vKTjjMvs97S9r6oOYI2UVLe6A==
X-Google-Smtp-Source: AGHT+IHLXWIJves++ZMhfFZ9YnRFSus0l3v1nMxTqppBY8H9rgds0EQOScsxeweq65UPC5yR6ftVxA==
X-Received: by 2002:a05:6000:1787:b0:385:f479:ef46 with SMTP id ffacd0b85a97d-385fd42316bmr3426787f8f.13.1733412244461;
        Thu, 05 Dec 2024 07:24:04 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52c12a4sm64628455e9.30.2024.12.05.07.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 07:24:03 -0800 (PST)
Message-ID: <97d7b661-8b9b-4c56-aa85-3833718f4e01@linaro.org>
Date: Thu, 5 Dec 2024 16:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: rockchip: increase gmac rx_delay on
 rk3399-puma
To: Jakob Unterwurzacher <jakobunt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Iskander Amara <iskander.amara@theobroma-systems.com>,
 Sasha Levin <sashal@kernel.org>,
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
 Vahe Grigoryan <vahe.grigoryan@theobroma-systems.com>,
 Klaus Goger <klaus.goger@theobroma-systems.com>
Cc: stable@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241205151827.282130-1-jakob.unterwurzacher@cherry.de>
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
In-Reply-To: <20241205151827.282130-1-jakob.unterwurzacher@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_072406_477523_31A099A8 
X-CRM114-Status: GOOD (  15.50  )
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

On 05/12/2024 16:18, Jakob Unterwurzacher wrote:
> During mass manufacturing, we noticed the mmc_rx_crc_error counter,
> as reported by "ethtool -S eth0 | grep mmc_rx_crc_error", to increase
> above zero during nuttcp speedtests. Most of the time, this did not
> affect the achieved speed, but it prompted this investigation.
> 
> Cycling through the rx_delay range on six boards (see table below) of
> various ages shows that there is a large good region from 0x12 to 0x35
> where we see zero crc errors on all tested boards.
> 
> The old rx_delay value (0x10) seems to have always been on the edge for
> the KSZ9031RNX that is usually placed on Puma.
> 
> Choose "rx_delay = 0x23" to put us smack in the middle of the good
> region. This works fine as well with the KSZ9131RNX PHY that was used
> for a small number of boards during the COVID chip shortages.
> 
> 	Board S/N        PHY        rx_delay good region
> 	---------        ---        --------------------
> 	Puma TT0069903   KSZ9031RNX 0x11 0x35
> 	Puma TT0157733   KSZ9031RNX 0x11 0x35
> 	Puma TT0681551   KSZ9031RNX 0x12 0x37
> 	Puma TT0681156   KSZ9031RNX 0x10 0x38
> 	Puma 17496030079 KSZ9031RNX 0x10 0x37 (Puma v1.2 from 2017)
> 	Puma TT0681720   KSZ9131RNX 0x02 0x39 (alternative PHY used in very few boards)
> 
> 	Intersection of good regions = 0x12 0x35
> 	Middle of good region = 0x23
> 
> Relates-to: PUMA-111

Drop 3rd party tags.

Also you you CC-ed an address, which suggests you do not work on
mainline kernel or you do not use get_maintainers.pl/b4/patman.
Regardless of the reason, process needs improvement: please rebase and
always work on mainline or start using mentioned tools tools, so correct
addresses will be used.


Best regards,
Krzysztof

