Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE721C02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 14:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weZd1YPhQuUCvQ4RDNP5bOvLU3u0h0XqN020or2wmR4=; b=3ZvLnx3Cu9Gvf/LM3YkPAI3S76
	ArGZpfWr6XGmirQhA4kC3H/dh/TsIrLjamZdkOHuPDQmCF+bLD9Es2OzOq3V/fjTSc01tdTwrgvQx
	lTRTJ0WWBujgmGZzdEM/pTUXYQYOITodD1ftwLp6uzgFPRZWNcTGsS5aKIF6mmZgfOZkGLhh+dm0z
	0CUTlRYeXV8YsLp7I4xrMk/j7+LOt5TUnTN1+XBdMV73xyCN3WjG/FrpZmXjs8vuRzp7p4ZjxvFui
	M/8nEO8+ew15IeGgXq1feLcOmB0q3DpviZz8vjBCXLRzeZ+e6WkQ/F3mAIOVcDx/IvtK3lHi6ScAh
	CShLAVyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLW0-00000005QSV-3QJg;
	Mon, 13 Jan 2025 14:34:04 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLTL-00000005Pnv-39YQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 14:31:21 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aab73e995b5so56928566b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 06:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736778678; x=1737383478; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=weZd1YPhQuUCvQ4RDNP5bOvLU3u0h0XqN020or2wmR4=;
        b=WbTa/dtT9AHtxKU1KQwiQGGwaBQTK6GjRCc9Z4JgYAL0SqfNnoEd3ExD4MqUIiTG60
         YrGGG6pkGl8Xs4o6I2HKlgOCZIE8PM4vQs93KvfKngjkoC+tzFohWmRxXFsOx3IrjdYt
         il5CkK4gj5F52eh1wzdmd3zI1SRv8mLNr7wQ6eiu8yy3KVWmBP9Q9uCfkUFHm9jUYv/U
         Xjc4jkybf+6VxqoxN5r4MD7zQc3vqb9X4Q+0wbazFHrmw8ELdCxInXLnI1DKl7Mo8pJ3
         1xTZcLF+EiSqvKve+JnA/yH7Vzeik8a0kj68jHzJ6KXDHtmzWq1uDF5z8L4eEDchMKua
         N9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736778678; x=1737383478;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=weZd1YPhQuUCvQ4RDNP5bOvLU3u0h0XqN020or2wmR4=;
        b=k+TquRHVJQu/025DQ66seVR6tJayIorj3bIXqp20yF+XHnCq6T58eizZqQKwHlCpFh
         tBxzo1iR2WpYQFVJyap+32rR5GxhLRYN5qJ9GWkX0qhWPKSIOnflQ8B25aULAHewcB3p
         4lpvgOgHRBYWymVSLXvZlboeHKXUHvzVYJD+oQrBcQfeJq/kdxbiapE8VqJ/tYI2sDz4
         PYl0vzlR+V0qLc2JPDb6qwzgouzv+d5sZRmRt4+sXf5wLCRYSGodxroOPoX4jeIJHGO4
         fRe17uflVx2FjmR+BGR1MeSEqo+aEWrsW72RY6/TZbwmCImS7ZRPBkeZr3+PLhPQnIZH
         pb2g==
X-Forwarded-Encrypted: i=1; AJvYcCVPhb+hr5BR6esZWyj6NNDaeqaPgPuzy2y+9mUS52aXW+IcqZy54eNBXiWAf0P96QolSEjTkoeXT5m4jLKpYLpe@lists.infradead.org
X-Gm-Message-State: AOJu0YwVGqp2Ul9LAMxJ/T/Ny6rTJKDvyuwMwA7aln7lwWT6oBfLkE3x
	u6f27EMKKOhjXeKLqmjAQd6hiE9zQREnwfCLgUeuPHmWh6pKc9uC2vMXRElNHIRmwssswiFdQ3y
	h
X-Gm-Gg: ASbGncvvs/Fq5plrdps4WBmGNckFzd1jErxlj7t4WpyjHMtHXhuL+BL8CLevTe74Esv
	PxxRXCwrWSh4jFCKfMOxmL4IvXOSTYrFVyU+PiRAd/ewwHtfrimugiyeyfMaTcxhgoECveyviHX
	q5AiA3nX2wqEsxiA6/m8cVh0OQV3zGkf9QLEEDd6xnZ8mkg7wXVi8VIMTcfKQ+d97QWznpknEN2
	hzR1vwKkqMxi6bAVoMAt2Zq5eRSlKgYff3INu6/SPnBi1zvhGhHeYA48+2hLwdDC3m/EdaI9FwM
X-Google-Smtp-Source: AGHT+IEAnOrirhqKrZI35EhezJop8U5ASFryXKh28Rcj0FE/w9WQIIxkrVg+p1gB3+++8zgOwVFz+A==
X-Received: by 2002:a17:907:9686:b0:aa6:193c:f391 with SMTP id a640c23a62f3a-ab2ab170994mr728819566b.2.1736778677847;
        Mon, 13 Jan 2025 06:31:17 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9134403sm516717666b.90.2025.01.13.06.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 06:31:17 -0800 (PST)
Message-ID: <48e4def6-3d40-4cbe-8008-a299869342b0@linaro.org>
Date: Mon, 13 Jan 2025 15:31:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/mediatek/hdmi: Use
 syscon_regmap_lookup_by_phandle_args
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
 <516d16e3-6fc6-49ba-a0ce-f451b65a6c1a@collabora.com>
 <fef6b198-d916-4b71-86ed-0cbdd55cb3c4@linaro.org>
 <fcf8ebde-46c9-406e-b4d9-933623a9786b@collabora.com>
 <e64ab0c7-25da-449e-abd2-e4c70dee3041@linaro.org>
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
In-Reply-To: <e64ab0c7-25da-449e-abd2-e4c70dee3041@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_063119_802937_2DC108C9 
X-CRM114-Status: GOOD (  13.41  )
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

On 13/01/2025 15:27, Krzysztof Kozlowski wrote:
> On 13/01/2025 14:58, AngeloGioacchino Del Regno wrote:
>> Il 13/01/25 14:05, Krzysztof Kozlowski ha scritto:
>>> On 13/01/2025 13:41, AngeloGioacchino Del Regno wrote:
>>>> Il 12/01/25 14:47, Krzysztof Kozlowski ha scritto:
>>>>> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
>>>>> syscon_regmap_lookup_by_phandle() combined with getting the syscon
>>>>> argument.  Except simpler code this annotates within one line that given
>>>>> phandle has arguments, so grepping for code would be easier.
>>>>>
>>>>> There is also no real benefit in printing errors on missing syscon
>>>>> argument, because this is done just too late: runtime check on
>>>>> static/build-time data.  Dtschema and Devicetree bindings offer the
>>>>> static/build-time check for this already.
>>>>>
>>>>
>>>> I agree with this change but can you please rebase it over [1]?
>>>>
>>>> The same code got migrated to mtk_hdmi_common.c instead :-)
>>>>
>>>> [1]:
>>>> https://lore.kernel.org/r/20250108112744.64686-1-angelogioacchino.delregno@collabora.com
>>> My is 2-patch cleanup, your is 34 patch rework and new features with
>>> existing build reports, so rebase is not reasonable. It would make this
>>> 2-patch cleanup wait for many cycles.
>>>
>> If adding the `#include <linux/bitfield.h>` line to a file would take
>> *many cycles*, that'd be a bit weird, wouldn't it? :-)
> It's not about include, it is about rebase. If I rebase on 34-patchset,
> that's my dependency and this work cannot be merged before yours is.
> 
> And yours already have kbuild reports, so there will be v5, maybe v6 etc.


Although "NO!!!! No more huge patch bombs to
linux-kernel@vger.kernel.org people!" was removed, but its spirit is
kind of still valid and requesting to rebase cleanups on top of patch
bombs with new features is just not reasonable.

Best regards,
Krzysztof

