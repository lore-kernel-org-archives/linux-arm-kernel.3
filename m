Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E77C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 12:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDaiKVIvoDREmF5dBkk40+XBWsu5AZxMK34kj8iTAes=; b=r6G+ovvfmbcw9rJ6/clrLGBJVq
	MPBFTPD+Q0B2sGSPEhi/NkkpUQcYC+CVM5D/PLuNNRX3C4rMOtvPkue8k9lpjBkzNz52Qn1nAgdH+
	X7A58VkbeYm9WJraCLoo8lGLcJuUgZx+Bm85H50INEz8G1JpYm9pZPflH0wjcbnW6efxkYxM5xnq0
	664mWE2JR2EAszSY/rQLqKDLh5bM7wOM4Xxt6WoKEGXTJJpMUIEls3lpuh0Pe6wqpWMuL+Gc4y1Ca
	DMaarqYSU2Tz0kA7huZPt5hXikcgY8aJahYgMqh0GUV3ghCqlCfa/JPzHtJEaF+Y4o2Y+RWGnQmid
	2u5pZ3lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th6bS-0000000Esgt-2KSU;
	Sun, 09 Feb 2025 12:40:02 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th6JY-0000000EpnL-2egw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 12:21:33 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-38dc6b40e91so121004f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 04:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739103690; x=1739708490; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VDaiKVIvoDREmF5dBkk40+XBWsu5AZxMK34kj8iTAes=;
        b=B6S8MynCU8ZdmXZFrrizqCCAow2clQ/uOuHDhDv73EOIs1lVrmnTq4hkTs7CTpKX85
         i4huqCWrS6sgo2NE6hYYzrlbGYZLu/y6jF/anYLhJ1NQmEPTsqfh0gncXOfYk4l3zntv
         cqs1/uK1yh/EhByE3YEsohE8/enrTCojWW9rR0/PFZ6eg9ZLgr2YCgfnLxhBYgoSgqPA
         c2Ml6FU46VhwseiW3M3J+Vh5ziqg6NiLcLFpp9vERUhEfp77ajqLIFaSQzxF4PHKdNQF
         pv4xcmjeURgcDSBTsdF/6UZf4Q28Bww0QYPFsvkjPT6jB7Cc/eWRBUzVOgRIg1rKduUv
         uyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739103690; x=1739708490;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDaiKVIvoDREmF5dBkk40+XBWsu5AZxMK34kj8iTAes=;
        b=N/9pXsAwC2OTMKErPUBVSKKRcDqYbxh4p0/I2ADQi5iTOfhF2D/+cVjeZIgDkojsLj
         pBU8qhu8uWrthO+4gkvSH06vL0My8ZY1VQ2QojCedoe+6YIgnyMIso/MDIeC4SkzSVKy
         hei5DJ+NDQXMRLYOJhOIvkrKmIgH9BW7+pKDiOOC0R6elQK33ny3WBOoWTHuQQhf3pJ6
         bCHqsq9Tu/NN/q/DADUDjrG3kkUidwG709MFCKk1cOnX+AsOR2aGOq9KrXgsgONwbyIH
         tcQig1fiF1uI8Jftbgwjft/dJ+ua+1o2qo9bWgdo2Xv3U3j8YWg0/KyzfrBCedxdmnP5
         rBzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX91ahr4m9Bpk/ZwH/HgXdrHqjtRNYIAC9sJlMWxEn58Q9lw/1mDC+A+vFZhYZzmf7R2QGGCFK7W1RgdULkqgr2@lists.infradead.org
X-Gm-Message-State: AOJu0YybdQwAYKp5/pIrSswPQq/RSsyK21UxfewUkHVfBgVJ+5dAAEX6
	sFuZaXCe1I8oSB/02PpS6UdeAS+0Zeis+JVf/dI61us3M3Hobe7q0YSrlpq+1GU=
X-Gm-Gg: ASbGnctWmQxeb+zxg+t6aBSJ5Whf1+PlNT569H9LnI0iJAcAQ3nXfy6rr1o/zgYG7d+
	JpkBc/e+vGdrgN1QYLq3BMfcYoW8PifLItfAHGQv0k3MzPu6cE6P1SwCcbyy83o0DkFo+mKxfG+
	CCL/fN+h/lrrRE2dxGH1aSO0rnfSBU0Ym8FtICyEoICJ5dg9mrzY82aA81Xvo75FILnDmBKz9Rj
	XP65QtbzKHUFMCDNp76r2ZW9F1QEMKw4YZXbYIBKMwg9/aSJ70KMA5ZIUl09nRSkMEa31Tgn/xM
	dU5jJq9NE9+svecugFxOz46gEphdjcjK6hs=
X-Google-Smtp-Source: AGHT+IFuXsp9sstavdPA9gOZO+V3HNaUNGICg6DdYxO+seNxQN7zlceF78JaHywilg98L3EI8R1dTA==
X-Received: by 2002:a05:6000:1f84:b0:38b:f3a4:4e15 with SMTP id ffacd0b85a97d-38dc8dc7e9emr2649978f8f.4.1739103690201;
        Sun, 09 Feb 2025 04:21:30 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc5e6f027sm7763436f8f.4.2025.02.09.04.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 04:21:29 -0800 (PST)
Message-ID: <f9a2247e-e0eb-4e22-8626-80e87afa9386@linaro.org>
Date: Sun, 9 Feb 2025 13:21:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Andrew Davis <afd@ti.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
 <20250122-topic-am62-dt-syscon-v6-13-v1-2-515d56edc35e@baylibre.com>
 <20250124-heavy-jaybird-of-vitality-4cbe24@krzk-bin>
 <20250124-able-beagle-of-prowess-f5eb7a@krzk-bin>
 <mocfnpebc67xegcis6tx3ekhsjcsqnvhwtipufycrtq2be4nbh@pmxhir5gmkos>
 <639b4e3a-3f68-4fba-aa33-c46dcb6fc88f@linaro.org>
 <d6252b73-0bcc-4724-8144-d6a98c8980f8@ti.com>
 <74ee6d9b-fd78-4d8a-a94f-b2c4dc794b60@linaro.org>
 <ebsbaaxyatrcikoem75t2blkhhceuidq3wnj3r2hbezfcmtc3u@ptffexrigbff>
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
In-Reply-To: <ebsbaaxyatrcikoem75t2blkhhceuidq3wnj3r2hbezfcmtc3u@ptffexrigbff>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_042132_696271_FD0A421D 
X-CRM114-Status: GOOD (  30.81  )
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

On 07/02/2025 15:40, Markus Schneider-Pargmann wrote:
> Hi Krzysztof,
> 
> On Mon, Jan 27, 2025 at 01:09:49PM +0100, Krzysztof Kozlowski wrote:
>> On 24/01/2025 23:35, Andrew Davis wrote:
>>> On 1/24/25 10:48 AM, Krzysztof Kozlowski wrote:
>>>> On 24/01/2025 17:05, Markus Schneider-Pargmann wrote:
>>>>> Hi Krzysztof,
>>>>>
>>>>> On Fri, Jan 24, 2025 at 09:22:54AM +0100, Krzysztof Kozlowski wrote:
>>>>>> On Fri, Jan 24, 2025 at 09:19:49AM +0100, Krzysztof Kozlowski wrote:
>>>>>>> On Wed, Jan 22, 2025 at 11:24:33AM +0100, Markus Schneider-Pargmann wrote:
>>>>>>>> Add compatible for ti,am62-ddr-pmctrl to the list. There is a DDR pmctrl
>>>>>>>> register in the wkup-conf register space of am62a and am62p. This
>>>>>>>> register controls DDR power management.
>>>>>>>>
>>>>>>>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>>>>>>>> ---
>>>>>>>>   Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>>>>>>>>   1 file changed, 2 insertions(+)
>>>>>>>
>>>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>
>>>>>> Un-acked, I missed the point that you really speak in commit msg about
>>>>>> register and you really treat one register is a device. I assumed you
>>>>>> only need that register from this device, but no. That obviously is not
>>>>>> what this device is. Device is not a single register among 10000 others.
>>>>>> IOW, You do not have 10000 devices there.
>>>>>
>>>>> Do I understand you correctly that the whole register range of the
>>>>> wkup_conf node as seen in arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
>>>>> should be considered a single syscon device?
>>>>
>>>> I don't have the datasheets (and not my task to actually check this),
>>>> but you should probably follow datasheet. I assume it describes what is
>>>> the device, more or less.
>>>>
>>>> I assume entire wkup_conf is considered a device.
>>>>
>>>>>
>>>>> Unfortunately wkup_conf is modeled as a simple-bus with currently 5
>>>>> subnodes defined of which 4 of them consist of a single register. Most
>>>>> of them are syscon as well. So I think I can't change the simple-bus
>>>>> back to syscon.
>>>>
>>>> Huh... Maybe TI folks will help us understand why such design was chosen.
>>>>
>>>
>>> Many of the devices inside the wkup_conf are already modeled as such.
>>> Clocks and muxes for instance already have drivers and bindings, this
>>> is nothing new to TI.
>>>
>>> If we just use a blank "syscon" over the entire region we would end up
>>> with drivers that use phandles to the top level wkup_conf node and
>>> poke directly the registers they need from that space.
>>>
>>> Would you rather have
>>>
>>> some-device {
>>> 	ti,epwm_tbclk = <&wkup_conf>;
>>> }
>>>
>>> or
>>>
>>> some-device {
>>> 	clocks = <&epwm_tbclk 0>;
>>> }
>>
>> How is this comparable? These are clocks. You would have clocks property
>> in both cases.
>>
>>
>>>
>>> with that epwm_tbclk being a proper clock node inside wkup_conf?
>>> I would much prefer the second, even though the clock node
>>> only uses a single register. And in the first case, we would need
>>> to have the offset into the wkup_conf space hard-coded in the
>>> driver for each new SoC. Eventually all that data would need to be
>>> put in tables and we end up back to machine board files..
>>>
>>> I'm not saying every magic number in all drivers should
>>> be offloaded into DT, but there is a line somewhere between
>>> that and having the DT simply contain the SoC's name compatible
>>
>> That's not the question here.
>>
>>> and all other data going into the kernel. That line might be a
>>> personal preference, so my question back is: what is wrong
>>> if we do want "1000 new syscons per each register" for our
>>> SoCs DT?
>>
>> Because it is false representation of hardware. You do not have 1000
>> devices. You have only one device.
>>
>>
>>>
>>> (and the number is not 1000, scanning the kernel I can see
>>> the largest wkup_conf region node we have today has a grand
>>> total number sub-nodes of 6)
>>
>> But what is being added here is device per each register, not per feature.
> 
> The register layout is like this:

The register layout of what? How is the device called? Is datasheet
available anywhere?

> 
> 0x8010 - 0x803c contains 4 clockselect registers
> 0x80d0 is the DDR16SS_PMCTRL regsiter
> 0x8190 - 0x8600 contains another 7 clockselect registers
> 
> I see the feature here in the block being clockselect registers. But the
> ddr-pmctrl register doesn't fit into this so I opted to describe this
> single register as one node as it looked to me like one feature. Of
> course I would have preferred this to be different but it is not. Would
> you prefer the clockselect registers and the pmctrl register to be
> described as one syscon?
No, because all the time you speak register=device and all the time I
was explaining that this is not correct. Device is the collection of
registers. I already said it - entire block is the syscon, not one
register in the middle, not 2 registers in the middle, not even 4+7
registers in the middle.


Best regards,
Krzysztof

