Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85ABFCFD317
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 10:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPMaYfKvhruxz/7aEIx8rHbzh3ajqn2UKQXi0f0Mf6g=; b=dYpVcmRU9VlCqMx9MTxvusc4O8
	w7h72y3bS8o7rSJ7xtVzsB9CJjkcKSsUva/VT71aO/vZiAlxAPDkW4xaYOQx2oI+/l9rvNDBf0y7p
	BporVaozmlFjFLFfmLsi7t0aXX+BxjFhK+Yz2aaxPOG2xNO9a040LmoVjggi/5r3WpuTQ4iUXT0OA
	d3eMMiZp/9i6x6Bk0oVPWDqDbQN+iCs8QEK3VXRHtd5o8wztirGKrWYXFnsj7mts8WWla+fjmFlvx
	Kw1v6C/8dyUqnXQV6TCl3S21oftE89FqtMt2u5/UmwemOG8q49H2wlA3SVkUdV48KfIx3uu/ebe14
	GiHypvmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNU2d-0000000BRlW-27OR;
	Mon, 24 Nov 2025 10:43:31 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNU2a-0000000BRl6-3eh1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 10:43:30 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-477aa218f20so25457895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 02:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763981006; x=1764585806; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IPMaYfKvhruxz/7aEIx8rHbzh3ajqn2UKQXi0f0Mf6g=;
        b=SIHVAHjsgLOKOco59vKvDtVGCIHvkpnkLxc0d2D6hTGeXDgP5kNo/EKpgQcr4qu6mf
         5nDBrsAGtnrXNpsTRrfWaRDPVsoC/VZBwRwRMNAAv277fQt5I9lXa0w81sGnT9zkuiFx
         Qdw/tqmbIZYFYxVbdlBbZz702PKNStyxu3dcW8RlyCNqbp0w4407vDjyJV+Ebq3SXwN9
         VvB4/SxdKdrxsaEvrI/KTVQb9MKrqXa/amwcqO12JadFweQDr6JFwQ5RAUFR5s9+0S8b
         IoZGBoHnga8Gn/p1dnoSOd/3rEgeWVD+0AeNc0pyrUe1XLDr1T9DXP5JhiCjC3iqONg8
         hvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763981006; x=1764585806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IPMaYfKvhruxz/7aEIx8rHbzh3ajqn2UKQXi0f0Mf6g=;
        b=w8bfflVxQJA1thg18iGop8HbA2VYgaq95EldmLaAoebfjhYgOjhSOKMCbmd5qZQHEO
         PZqeyGUiYlAeTLqXtkyVA5uOO/2UVFgN0GYbgWev8LQH+A8RIPEdlRb3zcX2zpMo4c56
         dqXRXcc8eiBw/tXtwbeNLKWuxuIqF43MI+rl2EMfqTio0ch1ioUFAxX9PCcTcOqdfI6b
         OFW/duXY9FYhQt3WEAi7h8M52IbTrjp+rdPAl3ZTFaskGAX7OcfS8Fpwmn0tZ6UBNZJH
         u4TDe5raOX0B5a22FHEe9jza7BPXhgLmSck7MZof+gkejjZzvFdXzQNSE9wQZLLFX+rF
         qHLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgfqjNp5bkybyieglozVmp9kkV1SqsHo3E87qDNCpKLR5kdaEdl7nnDRWQAFzkk2V5y00a0IJ8JYYrupTpURyi@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1cLL06QB2RUxnbzQD4O133HT+cxMoqZSMhjRGiv3SXTT/xCXu
	KoxmoH1EE2FE71uA/2TBSxvnUPPp9KIcc5m7Hjr/9/vleiYAYMJKC6EA48R6kLs6RFo=
X-Gm-Gg: ASbGncv2AoqZ9qvr2VKWyFI6YcFtBdC1NVy0SNE18XlzitAo02EiVxMr3Jxoh8+VbVz
	vxsIxKhFpSHifYBnV1nYcrWuzFoV7+6mWg21lOUCQT3MSUolArFLXJinVIInl2KIUmxKQlV5Jra
	vpNpbzR9vmjX0BwU/IsjEsFtlbXDmnho36XQphnqbvh+8+6vZ/HDb8FLkuIWZTAmswj9NUlrEzX
	Xkv9zly/SlS3L0Tr6ZkibpVXauui903p1lHLViu+/qVxSecyOmocc52pE3I9EDfflDNyb7B8mZj
	oe6hkFeWfy7FQp9Dzi2UjWbHYRwXWGZ02HzhStjOt0eDCqQzh5z628a705Hvj3EnZ4V7SgMs23Q
	ZseVh9ef4nkN9vFLidLqKJWfBhBbMWiojh9NEcAQ6480T+OS7OmPWrsPGBiYIWyoV5qXwzPobo8
	dogqjofoc6UanUpbK2CHey6vIPg/g=
X-Google-Smtp-Source: AGHT+IHUwHL8Ak/SSQPUMF7+OGU9CxDUvw1EzBytBVdE43sHRPf2JfCvp+pEC30Sy8UWing4gkJFBg==
X-Received: by 2002:a05:600c:450f:b0:46d:ba6d:65bb with SMTP id 5b1f17b1804b1-477c01eb9bdmr122420585e9.31.1763981006460;
        Mon, 24 Nov 2025 02:43:26 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf22ea00sm190158965e9.14.2025.11.24.02.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 02:43:25 -0800 (PST)
Message-ID: <12346382-7718-4942-a497-4de278b1d5a0@linaro.org>
Date: Mon, 24 Nov 2025 12:43:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 RESEND 2/3] thermal: exynos_tmu: Support new hardware
 and update TMU interface
To: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>,
 'Daniel Lezcano' <daniel.lezcano@linaro.org>,
 'Bartlomiej Zolnierkiewicz' <bzolnier@gmail.com>,
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
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <000001dc5d2a$0697bf10$13c73d30$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_024328_960873_90BA176A 
X-CRM114-Status: GOOD (  10.72  )
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

Hi, Shin,

On 11/24/25 12:06 PM, 손신 wrote:
>>> +static void update_con_reg(struct exynos_tmu_data *data) {
>>> +	u32 val, t_buf_vref_sel, t_buf_slope_sel;
>>> +
>>> +	val = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
>>> +	t_buf_vref_sel = (val >> EXYNOSAUTOV920_TMU_T_BUF_VREF_SEL_SHIFT)
>>> +				& EXYNOSAUTOV920_TMU_T_BUF_VREF_SEL_MASK;
>>> +	t_buf_slope_sel = (val >> EXYNOSAUTOV920_TMU_T_BUF_SLOPE_SEL_SHIFT)
>>> +				& EXYNOSAUTOV920_TMU_T_BUF_SLOPE_SEL_MASK;
>>> +
>>> +	val = readl(data->base +  EXYNOSAUTOV920_TMU_REG_CONTROL);
>>> +	val &= ~(EXYNOS_TMU_REF_VOLTAGE_MASK <<
>> EXYNOS_TMU_REF_VOLTAGE_SHIFT);
>>> +	val |= (t_buf_vref_sel << EXYNOS_TMU_REF_VOLTAGE_SHIFT);
>>> +	val &= ~(EXYNOS_TMU_BUF_SLOPE_SEL_MASK <<
>> EXYNOS_TMU_BUF_SLOPE_SEL_SHIFT);
>>> +	val |= (t_buf_slope_sel << EXYNOS_TMU_BUF_SLOPE_SEL_SHIFT);
>>> +	writel(val, data->base + EXYNOSAUTOV920_TMU_REG_CONTROL);
>>> +
>>> +	val = readl(data->base + EXYNOSAUTOV920_TMU_REG_CONTROL1);
>>> +	val &= ~(EXYNOSAUTOV920_TMU_NUM_PROBE_MASK <<
>> EXYNOSAUTOV920_TMU_NUM_PROBE_SHIFT);
>>> +	val &= ~(EXYNOSAUTOV920_TMU_LPI_MODE_MASK <<
>> EXYNOSAUTOV920_TMU_LPI_MODE_SHIFT);
>>> +	val |= (data->sensor_count << EXYNOSAUTOV920_TMU_NUM_PROBE_SHIFT);
>>> +	writel(val, data->base + EXYNOSAUTOV920_TMU_REG_CONTROL1);
>>> +
>>> +	writel(1, data->base + EXYNOSAUTOV920_TMU_SAMPLING_INTERVAL);
>>> +	writel(EXYNOSAUTOV920_TMU_AVG_CON_UPDATE, data->base +
>> EXYNOSAUTOV920_TMU_REG_AVG_CONTROL);
>>> +	writel(EXYNOSAUTOV920_TMU_COUNTER_VALUE0_UPDATE,
>>> +	       data->base + EXYNOSAUTOV920_TMU_REG_COUNTER_VALUE0);
>>> +	writel(EXYNOSAUTOV920_TMU_COUNTER_VALUE1_UPDATE,
>>> +	       data->base + EXYNOSAUTOV920_TMU_REG_COUNTER_VALUE1);
>>> +}
>>> +
>> This is unreadable; please make it understandable for those who don’t have
>> the documentation (explicit static inline functions, comments, etc ...).
> I'll restructure this code by introducing explicit static inline helper functions and proper comments to improve readability.

We likely shouldn't use inlines here, see Linus's reply from 2006:
https://lore.kernel.org/all/Pine.LNX.4.64.0601021105000.3668@g5.osdl.org/T/#u

I guess you can make this easier to read if you use FIELD_GET/SET from
bitfield.h. Other improvement would be using the regmap api.

Shin, a bit unrelated with the patch, but I wanted to let you know that
I started looking at the GS101 TMU. I assume it's very similar with the 
TMU on exynosautov920. Do you know if they share the same IP version?

I noticed GS101 uses ACPM calls to communicate with the TMU. Why did you
choose to not use ACPM for exynosautov920 TMU?

Thanks!
ta

