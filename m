Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8575BCFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 11:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UuRrMhunT9TDWnZHLII8BIXNolS7BUSymKB5ka4d4O0=; b=dewaJHqtqgt3cMRaGYKf5coOeM
	ISJjRsRHqDgxCV1E86lFeZ0yNn8Q+JX+kw4sLbF+Qh0X94QOBpiJ+DDLh5WWYwVWhPWCt39dMPPKS
	UpbLpBcOcalw3ifJseCcY3m07tY+Fc+7IksPr2yyYdluSUjbd5sz3Mb+XXcLIkzWPhTYGjRKCDxC8
	t/YD49gs839tRKvGRIK8YRxA9GYyricQf7p7/ZsJyCs2U1M6hNUS8c3lHMNBdEIZuw1xrx54rfjl7
	59z5zl/fl52YHdjM/UA6OqOtSPmkyFvWkRwh2DFCpS3qmlDxJAN5c76o9qsYPVJoXQK6hyxpylONA
	latG5KSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUYf-0000000BXWo-2b8K;
	Mon, 24 Nov 2025 11:16:37 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUYc-0000000BXWI-3163
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 11:16:36 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-477b91680f8so33185295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 03:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763982993; x=1764587793; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UuRrMhunT9TDWnZHLII8BIXNolS7BUSymKB5ka4d4O0=;
        b=UcqZtiQP6GBbvZyUQ4kNVv/EUE1ddddfnl0tfM5tE+/Zs7x18vTDi52ibGllvTxFVL
         NSVQVulthPYxEd2fbHd+pRK0Dvp2o00Du0DN4bRm9Y1esqQfsQfASv4TF/Wj395+2FSi
         myTi+tJ8cK5reDwa4GL9H3ROrTb6UZv64lab1Qc38DYBb0xtBF3nDkMlUnH8BPD05SF/
         j86FBKnNVUYKtj2ut0HTmW77kEtMnF8KZvwjHdGsFdPLbXhkv7CWIS6c+juKuJJoEfhe
         SitshmnaiNkn78WgM7Dswpf+tnOiQnIvCK0vW1FvXr/jK/Hbcjvc/bBF5lc2OqjTPyOi
         nP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763982993; x=1764587793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuRrMhunT9TDWnZHLII8BIXNolS7BUSymKB5ka4d4O0=;
        b=cfKxASLuuNHWPAa1/+LTkl00tHz4K9SnMXEXY7IjEJRRbWKvuPSVfQxLbJLeQSrsNx
         bYqDit/dyqigDIw+rddBGLDSHuPZpuyNSDcpYnHU73ZEwFljfOubf8zfkBjD9+S2zWtr
         aMTEwcrPtibjv9OG+JR+mZFj1Hx+a3gdf0ggOS/MXktUKFYPaLLYTz9f4b2FiOy7Ks+E
         dJQOPzdPB5b/IIQYkEgFeh6Yd8GNZytZba0NxdjqppWPOxTbuWW1z+r69YdzCMZ/5Mua
         EFwJLV47SDMEfLstJtNbCCBRd0yVdk2BNyTViXHSjB0szM/J+dXArFP8w7NSk7jxF6sV
         V8UA==
X-Forwarded-Encrypted: i=1; AJvYcCXB8rUMvS7268CtN4/E62y/0WbfiC5KevCrDjgerCdILCaFez6fSdl+iuW+wY96M2NdS8LOyClEOKClLmPlRdvI@lists.infradead.org
X-Gm-Message-State: AOJu0YwbSv83kcnXvh79NCJH9kgVi0aZ4NaAaCLVJ+SVmA63ygVMmHIQ
	Ayejr7vDWqv0CYTSe823GkqoJyI+z8zp5kcLrsqwN+5gq5n3EhaNzaQwKdKxrHvI+Oo=
X-Gm-Gg: ASbGncuRT3hTL/SEkH+caLANI1FzYRPkNR+kdSfMB9L58tGw53Nw1I/zHG2seLU1z9j
	ToFP6A+EdniLUyQiSkjkpeMjCPKDUnwGr1Fye9/Ty2i8mSuXdau83NgW3rRIN5i+RjlIXZyl9ll
	GvqJfG+rOBfXrq8sVowxb9bU/MCiUql0lqumpnEvVT+2NHIA6ahxsm6Io/0fiSw50kovhf7ETKj
	rs+kIn9t/qhNxunzdBiDns9SP9TgUjPwJTiJwiWmOnFGa3eaoIEpOsWtRV+fKLN3kPsksttaoF0
	/Ct4bmV9klOhz/b5DEK57S877pn77i2PNEXWThbPmL/Hu/IaFlauoOiOtyaL0A39pvT4pZs51dr
	uHaEsgCK/QujIViWS/QfxcUBmLmgb7HaQSXHCw7RtZnef7vnMNYItw7CGZYbYWfOowsTvt+6UWM
	/ezFrSmRiBWIVKPgejelralNHsc0HUVXyKlh5+icNt/NrObAStiP35hABB3otkUsd8GA==
X-Google-Smtp-Source: AGHT+IGoaXb9zqkluRUTXSsxY7Elb/IIHiZ+I4IVLxjc5bpkpHjrfyygfT2RwN8BHb50RMQMY1Fuxg==
X-Received: by 2002:a05:600c:1ca5:b0:475:dde5:d91b with SMTP id 5b1f17b1804b1-477c1115ff6mr126002295e9.17.1763982992722;
        Mon, 24 Nov 2025 03:16:32 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:a756:bb6c:7b35:af9b? ([2a05:6e02:1041:c10:a756:bb6c:7b35:af9b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e5b6sm27447425f8f.1.2025.11.24.03.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 03:16:32 -0800 (PST)
Message-ID: <ec51f257-e961-4e21-94d9-68825cbfe287@linaro.org>
Date: Mon, 24 Nov 2025 12:16:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 RESEND 2/3] thermal: exynos_tmu: Support new hardware
 and update TMU interface
To: Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?B?7IaQ7Iug?=
 <shin.son@samsung.com>, 'Bartlomiej Zolnierkiewicz' <bzolnier@gmail.com>,
 'Krzysztof Kozlowski' <krzk@kernel.org>,
 "'Rafael J . Wysocki'" <rafael@kernel.org>, 'Zhang Rui'
 <rui.zhang@intel.com>, 'Lukasz Luba' <lukasz.luba@arm.com>,
 'Rob Herring' <robh@kernel.org>, 'Conor Dooley' <conor+dt@kernel.org>,
 'Alim Akhtar' <alim.akhtar@samsung.com>
Cc: 'Henrik Grimler' <henrik@grimler.se>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 William McVicker <willmcvicker@google.com>, jyescas@google.com
References: <20251113064022.2701578-1-shin.son@samsung.com>
 <CGME20251113064044epcas2p1b87addb21473eca7cc52052e4e2e9237@epcas2p1.samsung.com>
 <20251113064022.2701578-3-shin.son@samsung.com>
 <2180a854-8ba6-4424-add2-eb34637530c1@linaro.org>
 <000001dc5d2a$0697bf10$13c73d30$@samsung.com>
 <12346382-7718-4942-a497-4de278b1d5a0@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <12346382-7718-4942-a497-4de278b1d5a0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_031634_797109_9013953A 
X-CRM114-Status: GOOD (  13.13  )
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

Hi Tudor,

On 11/24/25 11:43, Tudor Ambarus wrote:
> Hi, Shin,
> 
> On 11/24/25 12:06 PM, 손신 wrote:
>>>> +static void update_con_reg(struct exynos_tmu_data *data) {
>>>> +	u32 val, t_buf_vref_sel, t_buf_slope_sel;
>>>> +
>>>> +	val = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
>>>> +	t_buf_vref_sel = (val >> EXYNOSAUTOV920_TMU_T_BUF_VREF_SEL_SHIFT)
>>>> +				& EXYNOSAUTOV920_TMU_T_BUF_VREF_SEL_MASK;
>>>> +	t_buf_slope_sel = (val >> EXYNOSAUTOV920_TMU_T_BUF_SLOPE_SEL_SHIFT)
>>>> +				& EXYNOSAUTOV920_TMU_T_BUF_SLOPE_SEL_MASK;
>>>> +
>>>> +	val = readl(data->base +  EXYNOSAUTOV920_TMU_REG_CONTROL);
>>>> +	val &= ~(EXYNOS_TMU_REF_VOLTAGE_MASK <<
>>> EXYNOS_TMU_REF_VOLTAGE_SHIFT);
>>>> +	val |= (t_buf_vref_sel << EXYNOS_TMU_REF_VOLTAGE_SHIFT);
>>>> +	val &= ~(EXYNOS_TMU_BUF_SLOPE_SEL_MASK <<
>>> EXYNOS_TMU_BUF_SLOPE_SEL_SHIFT);
>>>> +	val |= (t_buf_slope_sel << EXYNOS_TMU_BUF_SLOPE_SEL_SHIFT);
>>>> +	writel(val, data->base + EXYNOSAUTOV920_TMU_REG_CONTROL);
>>>> +
>>>> +	val = readl(data->base + EXYNOSAUTOV920_TMU_REG_CONTROL1);
>>>> +	val &= ~(EXYNOSAUTOV920_TMU_NUM_PROBE_MASK <<
>>> EXYNOSAUTOV920_TMU_NUM_PROBE_SHIFT);
>>>> +	val &= ~(EXYNOSAUTOV920_TMU_LPI_MODE_MASK <<
>>> EXYNOSAUTOV920_TMU_LPI_MODE_SHIFT);
>>>> +	val |= (data->sensor_count << EXYNOSAUTOV920_TMU_NUM_PROBE_SHIFT);
>>>> +	writel(val, data->base + EXYNOSAUTOV920_TMU_REG_CONTROL1);
>>>> +
>>>> +	writel(1, data->base + EXYNOSAUTOV920_TMU_SAMPLING_INTERVAL);
>>>> +	writel(EXYNOSAUTOV920_TMU_AVG_CON_UPDATE, data->base +
>>> EXYNOSAUTOV920_TMU_REG_AVG_CONTROL);
>>>> +	writel(EXYNOSAUTOV920_TMU_COUNTER_VALUE0_UPDATE,
>>>> +	       data->base + EXYNOSAUTOV920_TMU_REG_COUNTER_VALUE0);
>>>> +	writel(EXYNOSAUTOV920_TMU_COUNTER_VALUE1_UPDATE,
>>>> +	       data->base + EXYNOSAUTOV920_TMU_REG_COUNTER_VALUE1);
>>>> +}
>>>> +
>>> This is unreadable; please make it understandable for those who don’t have
>>> the documentation (explicit static inline functions, comments, etc ...).
>> I'll restructure this code by introducing explicit static inline helper functions and proper comments to improve readability.
> 
> We likely shouldn't use inlines here, see Linus's reply from 2006:
> https://lore.kernel.org/all/Pine.LNX.4.64.0601021105000.3668@g5.osdl.org/T/#u

We should not use inline functions when they can be called from 
different places and if they contain a significant amount of code inside.

But for one line functions, inside a driver it may help for the 
readability when the function name is self-explanatory.


> I guess you can make this easier to read if you use FIELD_GET/SET from
> bitfield.h. Other improvement would be using the regmap api.

regmap would be too overkill to write unshared registers.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

