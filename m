Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB89DCFD315
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 09:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbnniyQBYsSv8LXOy0SkndmtRMhR+Nd17w4wSUmMqng=; b=KIqnYFmtMNfSWelTUtEnrf51Ig
	7aBaLDuRd6gz2a9l6aM14dqMHJAj3qSW6axcwrYZqp2UC9h7GRX0OAsxmOlqCOVEimQV+UfzHf4V3
	Fm4S+yZH/7ACxUmnX4g4oS53yqwYuATu4EOveHOFao81b4dHBI5UnDK01f8iAMeEeTlhG6kwzLgd2
	wydZqooF+EIR9fbJqwr+LBedXcNOaBGu9kBSWOyH9hn5AqMPg36CeTH9Nr5i6syIFcpdnoeS3iODQ
	1DndK1kX+iqIqXHOTPV0g9bgHPanou5iF0fowyzu7CmnDYJMmFfiu8MEZucPIzCf5JMYjtUWk6cvH
	ECj2Pljw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNp94-0000000D0w1-3bE3;
	Tue, 25 Nov 2025 09:15:36 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNp91-0000000D0ve-2jN7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 09:15:33 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4775895d69cso21734565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 01:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764062130; x=1764666930; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WbnniyQBYsSv8LXOy0SkndmtRMhR+Nd17w4wSUmMqng=;
        b=TgnJnxtLfcrmsj9jgtbPcBKGbNcW/dtjPePG/QOSfhs/CAah9ndiJ8dcqa1qIQRLhl
         FA74xcodLGOZwqMeaM463dN+zHLL+pbyblnl04bM0WiZq6Npd/ylSlqkE9Ppq6EHxyYk
         g/ZgIdlYMjwwHBEi9AS8ddGbAicENl7tOpSumMUUJ9ZTC3G7QaB0sY1PGw2yNOQsOcIE
         PEBuVhV1T42SZNLCBJm5WGsBrYRhV2e9kRf9+mz8rhsPFp+129oUHJs6BlSSUhv2Tqc5
         MN1ZfxCgHr2r+hZul6BjHNbo1S1rwA0eFoE8KVGhUF55zVLb5Ajl81w0tRszucar23V1
         kapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764062130; x=1764666930;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WbnniyQBYsSv8LXOy0SkndmtRMhR+Nd17w4wSUmMqng=;
        b=d6v6Fd89QkC79aNT39CGEeng0k4Wk12IE8Ay7A6ob6qDMWt/qXXnqM+9ZLwqEq/8XJ
         ts8dEr628geC0klrMXsJc0di0MuoNvyLjJ6Aon7HraRA5hzNs8ssWI9gnAsyAK+wzigN
         HseZ+6DNMNaM0fthTD/gd4Qr25k0Z5o3QQlcvbHRdcqdWZuRKx0/e6AZ8hl9AfIYf6xH
         3nYlyRBjNQhdeahJjeGXG2VZUEBHV7XxkTgfo97TpfcSRdHhiWFLltY3e0Njv7QwfyRD
         QvPoG5oiHl/Lo3du/0N59rbUtqm9AjCQvxOzKStZxsXX+fcTQL171RE5usuCqaftpdL0
         pqCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmco4iNwpk4uitzY9iKm5GIeENBARmbBPJjdQ8x+NIcfW6180jHNYIhDRl4iRo/JBzHIroOlQr+ssEJI2NNSCt@lists.infradead.org
X-Gm-Message-State: AOJu0YyLRt0NgQ9BR9W6dWy57Uxs2wnYD0OWhNB752E0Nsz12Kvx7u22
	Ly9FLtp/nYpddcLWgVliiyGZh5sy4nQT5ppOzBeRYEHzmPom2O5PWx/P6Hz+w5Q8xiU=
X-Gm-Gg: ASbGncvd/SSayPuoBvEIvc1J59lJX2qtKiGfQpUd2UlRF/nmMrF60KmInLbdGaIypkO
	X+ZIM+4gT1eB5coUCcaumhgOvtDsCCPzHX/EjlqSWO7Nm7nQaoe+ig8OdxShQ/Y4v1WlEy7jRKv
	7usmu39wD71yUYT7nCXtJI9MUm4u9oC1Gg8ZrZdpwrtjbresH4h1O/1SOj3MePWB7x3BDHK6ez/
	0R7iTWNw4TbR53fR6dlYRqiVGMokdyfzo/UhAkSUtkL3yJXNW6J3bAoYl5RfM6UrNQjfvDKnU7V
	FCOOlZjnQ8ClO0PbJj1LNBaFfKlsgvB6eEJ7oQp6y/tgl1fUGAL9F3X6Mz+bjcQ3ftW9zmH9BF1
	+7JC0iTqfj/Op7bOh66lV08XlT4SnJW86OIiXJWjRmD3gpV3tLJ6Ci1T5MoU3ajk5wo1lqTYh5d
	zIzxFEJ2RCU92caVe5
X-Google-Smtp-Source: AGHT+IGWFG0HxUIp9tkL1HpcvIFQSl/Uv/HgoNmqz7nTca4y0bOHNVljGRRpohMOzuAV8p5abC+yhg==
X-Received: by 2002:a05:600c:3545:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-47904ac3ca4mr16226075e9.1.1764062129519;
        Tue, 25 Nov 2025 01:15:29 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479040c70c5sm14596605e9.4.2025.11.25.01.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 01:15:28 -0800 (PST)
Message-ID: <5a6a749b-b2b7-41bb-bcb4-a2342e7f4e98@linaro.org>
Date: Tue, 25 Nov 2025 11:15:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH v7 RESEND 2/3] thermal: exynos_tmu: Support new hardware
 and update TMU interface
To: Shin Son <shin.son@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Henrik Grimler <henrik@grimler.se>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 William McVicker <willmcvicker@google.com>, jyescas@google.com
References: <20251113064022.2701578-1-shin.son@samsung.com>
 <CGME20251113064044epcas2p1b87addb21473eca7cc52052e4e2e9237@epcas2p1.samsung.com>
 <20251113064022.2701578-3-shin.son@samsung.com>
Content-Language: en-US
In-Reply-To: <20251113064022.2701578-3-shin.son@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_011531_773720_582F255F 
X-CRM114-Status: GOOD (  18.84  )
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

Hi, Shin Son,

Just trivial notes on registers description for now.

On 11/13/25 8:40 AM, Shin Son wrote:
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/ 
> thermal/ samsung/exynos_tmu.c index 47a99b3c5395..8fa188928b79 
> 100644 --- a/ drivers/thermal/samsung/exynos_tmu.c +++ b/drivers/ 
> thermal/samsung/ exynos_tmu.c @@ -121,8 +121,51 @@
> 
> #define EXYNOS_NOISE_CANCEL_MODE		4
> 
> +/* ExynosAutov920 specific registers */ +#define 
> EXYNOSAUTOV920_SLOPE_COMP		25 +#define 
> EXYNOSAUTOV920_SLOPE_COMP_MASK		0xf

Register fields shall be named
SOC_REG_NAME_FIELD_NAME

If you include <linux/bits.h> you can substitute the above 2 definitions
with just one:
EXYNOSAUTOV920_TRIMINFO_SLOPE_COMP	GENMASK(28, 25)

and later on in the code, instead of doing the shift and the mask, you
can include <linux/bitfield.h> and do:

data->slope_comp = FIELD_GET(EXYNOSAUTOV920_TRIMINFO_SLOPE_COMP, val);

btw, above matches the GS101 definitions.

> +#define EXYNOSAUTOV920_CALIB_SEL_TEMP		30 +#define 
> EXYNOSAUTOV920_CALIB_SEL_TEMP_MASK	0x2 +

is this BIT(31)?
EXYNOSAUTOV920_TRIMINFO2_CALIB_SEL_TEMP		BIT(31)

GS101 differs, it has this field defined at:
GS101_TRIMINFO_CALIB_SEL_TEMP			BIT(0)
where TRIMINFO is at Base Address + 0x0, not at Base Address + 0x4 as in
your case.

> +#define EXYNOSAUTOV920_SENSOR0_TRIM_INFO	0x10

GS101 does not have any SENSOR0 in the reg name, so maybe rename it to:
#define EXYNOSAUTOV920_TRIMINFO0		0x10

> +#define EXYNOSAUTOV920_TRIM_MASK		0x1ff +#define 
> EXYNOSAUTOV920_TRIMINFO_25_SHIFT	0 +#define 
> EXYNOSAUTOV920_TRIMINFO_85_SHIFT	9

#define EXYNOSAUTOV920_TRIMINFO_85_P0		GENMASK(17, 9)
#define EXYNOSAUTOV920_TRIMINFO_25_P0		GENMASK(8, 0)

> + +#define EXYNOSAUTOV920_TMU_REG_TRIMINFO2	0x04

Is this a TRIMINFO_CONFIG2 register? I don't have such thing on GS101.

> + +#define EXYNOSAUTOV920_TMU_REG_THRESHOLD(p)	(((p)) * 0x50 + 
> 0x00d0)

#define EXYNOSAUTOV920_THRESHOLD_TEMP_RISE7_6(p)	(((p)) * 0x50 + 0xd0)
and then:
#define EXYNOSAUTOV920_THRESHOLD_TEMP_RISE7_6_RISE7 	GENMASK(24, 16)
#define EXYNOSAUTOV920_THRESHOLD_TEMP_RISE7_6_RISE6 	GENMASK(8, 0)
you'll stop passing the shift and mask as function arguments :)


> +#define EXYNOSAUTOV920_TMU_REG_INTEN(p)		(((p)) * 0x50 + 0x00f0)

#define EXYNOSAUTOV920_INTEN(p)				(((p)) * 0x50 + 0xf0)

I see you use just BIT(7) from this register. Let's define it and stop passing
the bit offset as function argument:

#define EXYNOSAUTOV920_INTEN_RISE7			BIT(7)

> +#define EXYNOSAUTOV920_TMU_REG_INT_PEND(p)	(((p)) * 0x50 + 0x00f8)

#define EXYNOSAUTOV920_PEND(p)				(((p)) * 0x50 + 0xf8)

Are you using GENMASK(15, 0) for this register?

On GS101 GENMASK(15, 9) is reserved. Here's how the bits are defined for GS101:

#define EXYNOSAUTOV920_PEND_FALL(i)			BIT(16 + (i))
#define EXYNOSAUTOV920_PEND_RISE_MASK			GENMASK(23, 16)
#define EXYNOSAUTOV920_PEND_RISE(i)			BIT(i)
#define EXYNOSAUTOV920_PEND_RISE_MASK			GENMASK(8, 0)

Would you please verify and let me know if EXYNOSAUTOV920 differs or not?

> +#define EXYNOSAUTOV920_CURRENT_TEMP_P1_P0	0x084

no leading 0
#define EXYNOSAUTOV920_CURRENT_TEMP_P1_P0		0x84
then define the fields:
#define EXYNOSAUTOV920_CURRENT_TEMP_P1			GENMASK(24, 16)
#define EXYNOSAUTOV920_CURRENT_TEMP_P0			GENMASK(8, 0)


> +#define EXYNOSAUTOV920_TMU_REG_EMUL_CON		0x0b0

no TMU_REG in the name, no leading 0, define the fields as GENMASK
#define EXYNOSAUTOV920_EMUL_CON				0xb0
#define EXYNOSAUTOV920_EMUL_CON_EMUL_NEXT_TIME		GENMASK(31, 16)
#define EXYNOSAUTOV920_EMUL_CON_EMUL_NEXT_DATA		GENMASK(15, 7)
#define EXYNOSAUTOV920_EMUL_CON_EMUL_EN			BIT(0)


> +
> +#define EXYNOSAUTOV920_TMU_REG_CONTROL		0x50

no reg in the name, control0
#define EXYNOSAUTOV920_TMU_CONTROL0			0x50

define fields as GENMASK and BIT

> +#define EXYNOSAUTOV920_TMU_REG_CONTROL1		0x54

ditto

> +#define EXYNOSAUTOV920_TMU_REG_AVG_CONTROL	0x58

ditto

> +#define EXYNOSAUTOV920_TMU_SAMPLING_INTERVAL	0x70

no TMU in the name, respect the registers name from the datasheet please.
define the full genmask
#define EXYNOSAUTOV920_SAMPLING_INTERVAL_MASK		GENMASK(31, 0)

> +#define EXYNOSAUTOV920_TMU_REG_COUNTER_VALUE0	0x74
> +#define EXYNOSAUTOV920_TMU_REG_COUNTER_VALUE1	0x78

no TMU_REG in the name, define fields> +
> +#define EXYNOSAUTOV920_TMU_T_BUF_VREF_SEL_SHIFT		8
> +#define EXYNOSAUTOV920_TMU_T_BUF_VREF_SEL_MASK		0x1f
> +#define EXYNOSAUTOV920_TMU_T_BUF_SLOPE_SEL_SHIFT	3
> +#define EXYNOSAUTOV920_TMU_T_BUF_SLOPE_SEL_MASK		0xf
> +#define EXYNOSAUTOV920_TMU_NUM_PROBE_MASK		0xf
> +#define EXYNOSAUTOV920_TMU_NUM_PROBE_SHIFT		16
> +#define EXYNOSAUTOV920_TMU_LPI_MODE_MASK		1
> +#define EXYNOSAUTOV920_TMU_LPI_MODE_SHIFT		10

you won't need these if you define the register fields, isn't it?> +
> +#define EXYNOSAUTOV920_TMU_AVG_CON_UPDATE		0x0008011a

no leading zeros. You better construct the fields dynamically, by using bitfields,
no full register magic number, humans don't understand this.

> +#define EXYNOSAUTOV920_TMU_COUNTER_VALUE0_UPDATE	0x030003c0
> +#define EXYNOSAUTOV920_TMU_COUNTER_VALUE1_UPDATE	0x03c0004d

same for both

> +
>  #define MCELSIUS	1000
>  
> +#define EXYNOS_DEFAULT_SENSOR_COUNT			1
> +#define EXYNOS_MAX_SENSOR_COUNT	
would it make sense to have the tzd_array to fit just the sensor count that
we're using so that we don't waste memory? i.e. allocate tzd_array dynamically.

Looking at the exynosautov9 registers that you described and comparing them with
gs101 I see just 2 differences:
1/ exnosautov2 has a TRIMINFO_CONFIG2 register, while gs101 doesn't
2/ EXYNOSAUTOV920_PEND register fields differ from GS101

Given the similarities, and considering the EXYNOS9_ registers rename from:
https://lore.kernel.org/linux-samsung-soc/20251117074140.4090939-5-youngmin.nam@samsung.com/
would it make sense to use the SoC-era name instead of specific SoC, i.e.
s/EXYNOSAUTOV920_/EXYNOS9_ and use the latter for both exynosautov9 and gs101?

Cheers,
ta


