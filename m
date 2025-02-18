Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A00C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6NET/R65D4fhygY4ZNz4mV2mBN1Fn/fSAZnL4GhO6k=; b=DVIuCnlVT6Cba7kuMIHtor/QYU
	zeAs5asiLbN9f0JnLVDxSxdStqgR+I/axMxev8+7m0IVon+mc2l7MtsjTncMrzAd2Fh/03am6Zx6l
	hPzCOTioeDxYj80gqbW9TyLog9XzJG+sud7YUuvA7fe1NcF4MWZQtuFIIlTo587BUl3scV5Mn/FNC
	dcYJac3IHFYDN0sMm4sb6clzKM+eOn5jGRxNsa0EuPcz4W/fynNWcOwxgupTd+PJPtCKgGRApbCCy
	CMtfh8YAgq2oPB/kn+EeegY4HdwzQBvzBazA1n1ww49+3ondNhoO9e6YE7eG+oaN9zu5DwMZMRZw2
	Q9+rWqoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkU3n-00000009jP4-10Le;
	Tue, 18 Feb 2025 20:19:15 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTVR-00000009cyC-1B2x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 19:43:46 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so40047685e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 11:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739907823; x=1740512623; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t6NET/R65D4fhygY4ZNz4mV2mBN1Fn/fSAZnL4GhO6k=;
        b=BQjmN69IAcPxSqT8FfxAoIayMEAvuDWKBkuJgsSpbyeebPJ3nbBlnYBtu/fH9WcSOV
         5Jdu9utW+htPWnmNJkiUbrcI8+bLKBqqwIxaSTPrgQzz/gheU5ZYuub0s0nz1WAcxp/m
         +qhZtu47WjBuWm5U7IJGDO8WzIEtnAIT/cBJMzDvTyejTuSi9Esgs03YM6Gcr8n4q8Z/
         B9CJ5LpGl7pRReM99iTEjmrV2YbWgqRNF2CgIR6F/FlKJ/hIJVkIf1GmySdzZ/v2fgt0
         vlIuZvXYBRlxim5jp+Ym69vUQCvjtFcwX6dpuV+KYOebR5g5TKj6rr21Fv47PJjQeaT8
         26eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907823; x=1740512623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t6NET/R65D4fhygY4ZNz4mV2mBN1Fn/fSAZnL4GhO6k=;
        b=jBM/jDzOh9yqgEoKHGb+PD6t5ClQYPgSUhAKWfZzerazd7NXPDM1Yv5ml4Ay//d5ky
         Zkb44JaYx5aMG9+bnFvFwygeNbRGO3gbGPfpAtLDOGde94HDNa+On8q+hp0WbCeqXIEN
         0mZkOvXxeelc7k0ZhgED9PebC55eQYhw2hTCqthFcO3wzYHtZ5vwP+pHKLOsqy+PLLyp
         qwjMUGrnwfo1L/8clsEtTjnDEeSQ8cziM0JzbLppARWs1YxkyG0C9RTIxGnve3SiHYtt
         NHm0ZB8wOW9NgOQDsYXL/ZSqGpXA33lc/nFJRRwMb6H0jvc1he12scD/IZKCGZFP1WMZ
         cfDw==
X-Forwarded-Encrypted: i=1; AJvYcCVwOUNvClVcM66Q8QNbVVrJAVuhjASQ7Uvoqdz2CvTYn/bLccHVfJVFYX/Q1OYrrjZvdW6nRS8cnufFpSpEo2FN@lists.infradead.org
X-Gm-Message-State: AOJu0YwkKGatzNwM/UxWV6VKpqOEMntNXOrv4FPiR6wAqf7Bzf61sQ9t
	fndKvRhgWLaJkRFCwuxgePRggbXzAQfsadvZw7u3DcoJ4CVKiq0dJA/ns5ivtbk=
X-Gm-Gg: ASbGncvNLZmA0+6GyzMnGVkMNkGhYXdCanQSvZIQj/g9yPSC8X7JOjJwMArAKAWhoE2
	F+orDBXpom+AygHBO4kv8PoC32xPbggh66s8P4aVqRV12OP6UznzB28uoC9FKgfPOdYWyhOGt44
	ySfbUYpavZMsF+LGKu+WyH+h8+TbCsvVJujEhJIdp+NzHBakSeGOLKc7uwRndAYOp1hLy8iQiL6
	mXE5WGH+CjGpGme78UNcjDnXrlflmXqqNsTgITnaTCUxPZVFnKJucS5RoQvgYPQwjliW2djBEI5
	mjm/FMkKZGAkqocsETl7YXrmafPOOOvAbPJJBU+uYVjC48GbMCY222E=
X-Google-Smtp-Source: AGHT+IE0UW/mzN+qXiFnRcnySUoZloCoBhk1jxMNyKm7/6Uvfk8YLL036J9/dJuG/NFnq4RdsX52mw==
X-Received: by 2002:a05:600c:3b0e:b0:439:987c:2309 with SMTP id 5b1f17b1804b1-439987c256dmr19864515e9.27.1739907823188;
        Tue, 18 Feb 2025 11:43:43 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4395a055910sm190528525e9.9.2025.02.18.11.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 11:43:42 -0800 (PST)
Message-ID: <e36a5771-d277-41d3-af9c-c5841c4060a2@linaro.org>
Date: Tue, 18 Feb 2025 20:43:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal: rockchip: Support the rk3562 SoC in thermal
 driver
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Shaohan Yao <shaohan.yao@rock-chips.com>, linux-pm@vger.kernel.org,
 Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 Zhang Rui <rui.zhang@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20241224094015.3816301-1-kever.yang@rock-chips.com>
 <20241224094015.3816301-2-kever.yang@rock-chips.com>
 <7f17cc55-a741-4bb8-9513-0580ca6fedd3@linaro.org> <17758610.geO5KgaWL5@diego>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <17758610.geO5KgaWL5@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_114345_329524_8F0B312F 
X-CRM114-Status: GOOD (  18.36  )
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

On 11/02/2025 11:19, Heiko Stübner wrote:
> Hey Daniel,
> 
> Am Dienstag, 11. Februar 2025, 10:36:09 MEZ schrieb Daniel Lezcano:
>> On 24/12/2024 10:40, Kever Yang wrote:
>>> From: Shaohan Yao <shaohan.yao@rock-chips.com>
>>>
>>> There are one Temperature Sensor on rk3562, channel 0 is for chip.
>>
>> A bit stingy in terms of description, no ?
>>
>>
>>> Signed-off-by: Shaohan Yao <shaohan.yao@rock-chips.com>
>>> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> [...]
>>> +static const struct tsadc_table rk3562_code_table[] = {
>>> +	{0, -40000},
>>> +	{1419, -40000},
>>> +	{1428, -35000},
>>> +	{1436, -30000},
>>> +	{1445, -25000},
>>> +	{1453, -20000},
>>> +	{1462, -15000},
>>> +	{1470, -10000},
>>> +	{1479, -5000},
>>> +	{1487, 0},
>>> +	{1496, 5000},
>>> +	{1504, 10000},
>>> +	{1512, 15000},
>>> +	{1521, 20000},
>>> +	{1529, 25000},
>>> +	{1538, 30000},
>>> +	{1546, 35000},
>>> +	{1555, 40000},
>>> +	{1563, 45000},
>>> +	{1572, 50000},
>>> +	{1580, 55000},
>>> +	{1589, 60000},
>>> +	{1598, 65000},
>>> +	{1606, 70000},
>>> +	{1615, 75000},
>>> +	{1623, 80000},
>>> +	{1632, 85000},
>>> +	{1640, 90000},
>>> +	{1648, 95000},
>>> +	{1657, 100000},
>>> +	{1666, 105000},
>>> +	{1674, 110000},
>>> +	{1682, 115000},
>>> +	{1691, 120000},
>>> +	{1699, 125000},
>>> +	{TSADCV2_DATA_MASK, 125000},
>>> +};
>>
>> May be it is time to optimize all these tables out of the memory driver?
>>
>> It is the 9th table introduced.
> 
> just to see if we think differently, what do you have in mind?
> 
> For me the adc-to-temperature conversion _is_ part of the hw-block itself,
> so should likely not spill into the devicetree, but you're right, defining
> a big table for each soc also isn't really great.
> 
> For the rk3562 in question, the stepping seems to be 8,9,8,9,....
> where for the rk3568 the value stepping seems to be 32,36,32,36,...
> and it looks similar for the other socs too, with the driver is already
> interpolating between values it seems.
> 
> So even just halving (or more) all the big tables (dropping every second
> entry for example) should not really loose us real granularity.

It can be just a formula to be reused in the adc_to_temp, temp_to_adc or 
precompute the table from the formula:

For instance the following formulas:

rk3588_code_table:

	y = ((x^2 + 23315x - 5949300) * 100) / 2457

rk3568_code_table:

	y = ((x^2 - 2660x + 1547712) * 625) / 2448

etc ...


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

