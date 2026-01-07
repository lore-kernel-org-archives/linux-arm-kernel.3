Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2288CFD647
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 15:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0Pws4NtPsPRxukEoeD3BXEjgSe94jnWPW/vfPUBfDg=; b=Ler0frzvcKr0eTIDP8f9kkxkXm
	fqnk0v6WUZT2JZUaiGr+f+FMNJzqwAdwLKZY5zzX1uvJjrfEFWheOGqvpGUOsPVva9CsihKI6CZzt
	5YCkrxRzaboVA0HraG5tEVid8kw2uBF3+mcnjSBzl/eSYclzD2wqWQ0zxhTP2KWCkWEJsuP/1YRxu
	rZXkLESNbd952PM+I1QJsvHxSdWUFD8B8CR6xfb2rjjLZUTXjgoiFuFsYNAyylKSZflJsWRoE/dW6
	LGk7Kt4z5jXEJJT5MzxMSqAf7rTEe/AVykr1U+dwDY6eJz/IsMZ27tc1OjrQGB2aJwr85u1bhE/AT
	oBfebrTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVMh-0000000FATG-23vx;
	Wed, 07 Jan 2026 15:22:27 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVMe-0000000FAST-2fap
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 15:22:26 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso18335195e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 07:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767799342; x=1768404142; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J0Pws4NtPsPRxukEoeD3BXEjgSe94jnWPW/vfPUBfDg=;
        b=oUxPomFLx6XUug7+CHNwTKrMn0TVhTD8dQxSx+03XlBtbunaGBgsv00a6J9EpaIWaj
         oXBzV9eEjIfydxXBytT5R93ReDE8TaJ1l7Q4JOANc5KCuHFJfmzti8I2lPKh0U008z73
         zcpeJgJZF8itL9aPWYoJ2ibtOvdM90QXdGr8Cq+TJq3RPUPMudonU/SSWrsJ/9AsU2/O
         MDlg4bJWpUgAqQ2wgohcVHiPj8P0tg/SmpF/gQpR3/VR3Wtj03QBHBT9MrRSvE/2QE/x
         X7gCrmgblHN8DLMQBo92lHG007YsGd6Hqg9ylO96yOg7nvdlK4G1HG6m3et9kqX9WZ7a
         BXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799342; x=1768404142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0Pws4NtPsPRxukEoeD3BXEjgSe94jnWPW/vfPUBfDg=;
        b=UO4T568Er05pxQ6V1QHWFPts0dNE7AmPZWFMMNPiFJKmf1wYqlZCL1h3N/GwQB++7g
         fSw+JxUEd5BR4YxYk2XiscXmDUy/DCeiiF0oY74D6JzGkcrKBuRLEz0iIAFgChkpaCn5
         HZJMbgMVGu/FJ/QemZklt8gLXl7eIKdncqN/lMRORT+TXZRC+nNGp5WjjpjA3FC9ywWs
         4DH19Q0GIYqCNX8M+Qc4V4k8PBrwu1XXq6qnFCLw4ypCv92ZVJRDJmHd7XyAjbmIG3WB
         TXVwwDZeqhqK8mAe3fvcnx5zDedsVJutjGIEr1P9zemQnpyLGQFBTraBp5zwCclUgeD9
         GuzA==
X-Forwarded-Encrypted: i=1; AJvYcCW9bP741KQoA2cNbnmRmG+mwjyCyZ02SA2QujOFp2TBUC+ay2xxROEvzQ/DMnVTQt3VeE6ORpUIEMvt0F6IUzqe@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw8BZQCyNa/C1z03Rwi6YJRVT3M7hYv+lxlexR8N/4CNlc4/dh
	h7KudirLLCkjF0UHGJQnnvLnFSDS5LKDIgUKQ3op62eunpB26JThFC7McvTaFXteGEg=
X-Gm-Gg: AY/fxX6hifyrjXlDAi8dZnS49QlwMJatRfiZRR+9cHfRFCFXS0pZh60BwYel8sFhqPf
	sy3tQevxiXUs/wSDf20mO665xILJMmPyPUxjJHNPjaOnQrhhOnqEEZe8RtIcoE/sTU6Hh8nfkkQ
	bkhvOXqVEsQQGPe4W1CfSSFQ6vvtfgL2vnOrI+Ed01nRmZLd7SnvFEd2XeIOIVvtv53a7LoEhVg
	5zOEQzZ3U0cZKMLMgiNv8uxZlG0tIcmw4SpBXEOahh0jlh+5i0hHPShVdI2BhzJQGRtHBLlHJr4
	K2rRDj/MXmQEqulF2zgUqM1uNq4O0V5T8cAKi7qn6IdLN0f/vDlklO9JXxJLqZDc1+baWtCG3ml
	B42ZgfTRDC18zRGYsQgrKSHeEhfSoWODc/Kuegh8efs/V+7EufnGoZQPd/K4dd2l3GGJ8B+Lhno
	2s098bqx19DVS0UbObDYMyeVVFPfi0SXQKsJzj7PVNDlP2s8KqpmskzHVX7GPPCvwGsg==
X-Google-Smtp-Source: AGHT+IFoLsxtQi0WIUi1v3LIMML3pRO8IdEjUBUo95e82dMoSm2M06CCFS48DLPXjrbdM1PsiseKLw==
X-Received: by 2002:a05:600c:4e16:b0:477:df3:1453 with SMTP id 5b1f17b1804b1-47d84b3a064mr36947125e9.28.1767799342054;
        Wed, 07 Jan 2026 07:22:22 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:edca:100f:ed11:66f2? ([2a05:6e02:1041:c10:edca:100f:ed11:66f2])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47d8702534dsm16861105e9.2.2026.01.07.07.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 07:22:21 -0800 (PST)
Message-ID: <86748f89-8bed-4435-98c4-991e649e5b87@linaro.org>
Date: Wed, 7 Jan 2026 16:22:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] thermal: imx91: Add support for i.MX91 thermal
 monitoring unit
To: Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Pengfei Li <pengfei.li_1@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, ye.li@nxp.com, joy.zou@nxp.com,
 Peng Fan <peng.fan@nxp.com>
References: <20251020-imx91tmu-v7-0-48d7d9f25055@nxp.com>
 <20251020-imx91tmu-v7-2-48d7d9f25055@nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251020-imx91tmu-v7-2-48d7d9f25055@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_072224_852650_26FE0F72 
X-CRM114-Status: GOOD (  43.02  )
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

On 10/20/25 21:00, Frank Li wrote:
> From: Pengfei Li <pengfei.li_1@nxp.com>
> 
> Introduce support for the i.MX91 thermal monitoring unit, which features a
> single sensor for the CPU. The register layout differs from other chips,
> necessitating the creation of a dedicated file for this.
> 
> This sensor provides a resolution of 1/64°C (6-bit fraction). For actual
> accuracy, refer to the datasheet, as it varies depending on the chip grade.
> Provide an interrupt for end of measurement and threshold violation and
> Contain temperature threshold comparators, in normal and secure address
> space, with direction and threshold programmability.
> 
> Datasheet Link: https://www.nxp.com/docs/en/data-sheet/IMX91CEC.pdf
> 
> Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v7
> - remove enable field because framework already check mode before call
> get_temp();
> - only call runtime_pm_get(put) in set_mode function
> - remove enable irq at get_temp.
> - Enable GE compare irq at set_trip() call back
> - Config GE irq at set_mode() when start measure to avoid issue unnecessary
> irq when clear Compare mask (generate one LE irq).
> 
> Change from v5 to v6
> - remove Macro's review tag
> - remove mutex lock
> - use set_trips callback
> 
> Change from v4 to v5
> - add irq support
> - use period mode
> - Marco, if need drop review tag, let me know
> 
> Change from v3 to v4
> - Add Macro's review tag
> - Use devm_add_action()
> - Move pm_runtim_put before thermal_of_zone_register()
> 
> change from v2 to v3
> - add IMX91_TMU_ prefix for register define
> - remove unused register define
> - fix missed pm_runtime_put() at error path in imx91_tmu_get_temp()
> - use dev variable in probe function
> - use pm_runtime_set_active() in probe
> - move START to imx91_tmu_get_temp()
> - use DEFINE_RUNTIME_DEV_PM_OPS()
> - keep set reset value because there are not sw "reset" bit in controller,
> uboot may change and enable tmu.
> 
> change from v1 to v2
> - use low case for hexvalue
> - combine struct imx91_tmu and tmu_sensor
> - simplify imx91_tmu_start() and imx91_tmu_enable()
> - use s16 for imx91_tmu_get_temp(), which may negative value
> - use reverse christmas tree style
> - use run time pm
> - use oneshot to sample temp
> - register thermal zone after hardware init
> ---
>   drivers/thermal/Kconfig         |  10 ++
>   drivers/thermal/Makefile        |   1 +
>   drivers/thermal/imx91_thermal.c | 384 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 395 insertions(+)
> 
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index a09c188b9ad11377afe232d89c60504eb7000417..b10080d618604ddd90295bff973e337ae0509059 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -296,6 +296,16 @@ config IMX8MM_THERMAL
>   	  cpufreq is used as the cooling device to throttle CPUs when the passive
>   	  trip is crossed.
>   
> +config IMX91_THERMAL
> +	tristate "Temperature sensor driver for NXP i.MX91 SoC"
> +	depends on ARCH_MXC || COMPILE_TEST
> +	depends on OF
> +	help
> +	  Include one sensor and six comparators. Each of them compares the
> +	  temperature value (from the sensor) against the programmable
> +	  threshold values. The direction of the comparison is configurable
> +	  (greater / lesser than).
> +
>   config K3_THERMAL
>   	tristate "Texas Instruments K3 thermal support"
>   	depends on ARCH_K3 || COMPILE_TEST
> diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
> index d7718978db245faffba98ff95a07c7bcbc776fd2..bb21e7ea7fc6b70aa84e5fed7cfdc7096e3fb1f7 100644
> --- a/drivers/thermal/Makefile
> +++ b/drivers/thermal/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_ARMADA_THERMAL)	+= armada_thermal.o
>   obj-$(CONFIG_IMX_THERMAL)	+= imx_thermal.o
>   obj-$(CONFIG_IMX_SC_THERMAL)	+= imx_sc_thermal.o
>   obj-$(CONFIG_IMX8MM_THERMAL)	+= imx8mm_thermal.o
> +obj-$(CONFIG_IMX91_THERMAL)	+= imx91_thermal.o
>   obj-$(CONFIG_MAX77620_THERMAL)	+= max77620_thermal.o
>   obj-$(CONFIG_QORIQ_THERMAL)	+= qoriq_thermal.o
>   obj-$(CONFIG_DA9062_THERMAL)	+= da9062-thermal.o
> diff --git a/drivers/thermal/imx91_thermal.c b/drivers/thermal/imx91_thermal.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..9b20be03d6dec18553967548d0ca31d1c1fb387c
> --- /dev/null
> +++ b/drivers/thermal/imx91_thermal.c
> @@ -0,0 +1,384 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 NXP.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/iopoll.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/thermal.h>
> +#include <linux/units.h>
> +
> +#define REG_SET					0x4
> +#define REG_CLR					0x8
> +#define REG_TOG					0xc
> +
> +#define IMX91_TMU_CTRL0				0x0
> +#define   IMX91_TMU_CTRL0_THR1_IE		BIT(9)
> +#define   IMX91_TMU_CTRL0_THR1_MASK		GENMASK(3, 2)
> +#define   IMX91_TMU_CTRL0_CLR_FLT1		BIT(21)
> +
> +#define IMX91_TMU_THR_MODE_LE			0
> +#define IMX91_TMU_THR_MODE_GE			1
> +
> +#define IMX91_TMU_STAT0				0x10
> +#define   IMX91_TMU_STAT0_THR1_IF		BIT(9)
> +#define   IMX91_TMU_STAT0_THR1_STAT		BIT(13)
> +#define   IMX91_TMU_STAT0_DRDY0_IF_MASK		BIT(16)
> +
> +#define IMX91_TMU_DATA0				0x20
> +
> +#define IMX91_TMU_CTRL1				0x200
> +#define IMX91_TMU_CTRL1_EN			BIT(31)
> +#define IMX91_TMU_CTRL1_START			BIT(30)
> +#define IMX91_TMU_CTRL1_STOP			BIT(29)
> +#define IMX91_TMU_CTRL1_RES_MASK		GENMASK(19, 18)
> +#define IMX91_TMU_CTRL1_MEAS_MODE_MASK		GENMASK(25, 24)
> +#define   IMX91_TMU_CTRL1_MEAS_MODE_SINGLE	0
> +#define   IMX91_TMU_CTRL1_MEAS_MODE_CONTINUES	1
> +#define   IMX91_TMU_CTRL1_MEAS_MODE_PERIODIC	2
> +
> +#define IMX91_TMU_THR_CTRL01			0x30
> +#define   IMX91_TMU_THR_CTRL01_THR1_MASK	GENMASK(31, 16)
> +
> +#define IMX91_TMU_REF_DIV			0x280
> +#define IMX91_TMU_DIV_EN			BIT(31)
> +#define IMX91_TMU_DIV_MASK			GENMASK(23, 16)
> +#define IMX91_TMU_DIV_MAX			255
> +
> +#define IMX91_TMU_PUD_ST_CTRL			0x2b0
> +#define IMX91_TMU_PUDL_MASK			GENMASK(23, 16)
> +
> +#define IMX91_TMU_TRIM1				0x2e0
> +#define IMX91_TMU_TRIM2				0x2f0
> +
> +#define IMX91_TMU_TEMP_LOW_LIMIT		-40000
> +#define IMX91_TMU_TEMP_HIGH_LIMIT		125000
> +
> +#define IMX91_TMU_DEFAULT_TRIM1_CONFIG		0xb561bc2d
> +#define IMX91_TMU_DEFAULT_TRIM2_CONFIG		0x65d4
> +
> +#define IMX91_TMU_PERIOD_CTRL			0x270
> +#define   IMX91_TMU_PERIOD_CTRL_MEAS_MASK	GENMASK(23, 0)
> +
> +#define IMX91_TMP_FRAC				64
> +
> +struct imx91_tmu {
> +	void __iomem *base;
> +	struct clk *clk;
> +	struct device *dev;
> +	struct thermal_zone_device *tzd;
> +};
> +
> +static void imx91_tmu_start(struct imx91_tmu *tmu, bool start)
> +{
> +	u32 val = start ? IMX91_TMU_CTRL1_START : IMX91_TMU_CTRL1_STOP;
> +
> +	writel_relaxed(val, tmu->base + IMX91_TMU_CTRL1 + REG_SET);

Why do you need the 'relaxed' version of the readl / writel ?

> +}
> +
> +static void imx91_tmu_enable(struct imx91_tmu *tmu, bool enable)
> +{
> +	u32 reg = IMX91_TMU_CTRL1;
> +
> +	reg += enable ? REG_SET : REG_CLR;
> +
> +	writel_relaxed(IMX91_TMU_CTRL1_EN, tmu->base + reg);
> +}

Can you explain the register layout ? It is unclear how it starts / 
stops / is enabled ...

For instance doing reg += enable ? REG_SET : REG_CLR is confusing


> +static int imx91_tmu_to_mcelsius(int x)

	(short x)

> +{
> +	return x * MILLIDEGREE_PER_DEGREE / IMX91_TMP_FRAC;
> +}
> +
> +static int imx91_tmu_from_mcelsius(int x)
> +{
> +	return x * IMX91_TMP_FRAC / MILLIDEGREE_PER_DEGREE;
> +}> +static int imx91_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
> +{
> +	struct imx91_tmu *tmu = thermal_zone_device_priv(tz);
> +	s16 data;
> +
> +	/* DATA0 is 16bit signed number */
> +	data = readw_relaxed(tmu->base + IMX91_TMU_DATA0);

Does the routine works for a negative value ?

> +	*temp = imx91_tmu_to_mcelsius(data);
> +
> +	return 0;
> +}
> +
> +static int imx91_tmu_set_trips(struct thermal_zone_device *tz, int low, int high)
> +{
> +	struct imx91_tmu *tmu = thermal_zone_device_priv(tz);
> +	int val;
> +
> +	if (high >= IMX91_TMU_TEMP_HIGH_LIMIT)
> +		return -EINVAL;
> +
> +	writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_CLR);
> +
> +	/* Comparator1 for temperature threshold */
> +	writel_relaxed(IMX91_TMU_THR_CTRL01_THR1_MASK, tmu->base + IMX91_TMU_THR_CTRL01 + REG_CLR);
> +	val = FIELD_PREP(IMX91_TMU_THR_CTRL01_THR1_MASK, imx91_tmu_from_mcelsius(high));
> +
> +	writel_relaxed(val, tmu->base + IMX91_TMU_THR_CTRL01 + REG_SET);
> +
> +	writel_relaxed(IMX91_TMU_STAT0_THR1_IF, tmu->base + IMX91_TMU_STAT0 + REG_CLR);
> +
> +	writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_SET);
> +

IMO, it is a good practice to wrap those calls into single line 
functions with a self-explanatory name

> +	return 0;
> +}
> +
> +static int imx91_init_from_nvmem_cells(struct imx91_tmu *tmu)
> +{
> +	struct device *dev = tmu->dev;
> +	u32 trim1, trim2;
> +	int ret;
> +
> +	ret = nvmem_cell_read_u32(dev, "trim1", &trim1);
> +	if (ret)
> +		return ret;
> +
> +	ret = nvmem_cell_read_u32(dev, "trim2", &trim2);
> +	if (ret)
> +		return ret;
> +
> +	if (trim1 == 0 || trim2 == 0)
> +		return -EINVAL;
> +
> +	writel_relaxed(trim1, tmu->base + IMX91_TMU_TRIM1);
> +	writel_relaxed(trim2, tmu->base + IMX91_TMU_TRIM2);
> +
> +	return 0;
> +}
> +
> +static void imx91_tmu_action_remove(void *data)
> +{
> +	struct imx91_tmu *tmu = data;
> +
> +	/* disable tmu */
> +	imx91_tmu_enable(tmu, false);
> +}
> +
> +static irqreturn_t imx91_tmu_alarm_irq(int irq, void *data)
> +{
> +	struct imx91_tmu *tmu = data;
> +	u32 val;
> +
> +	val = readl_relaxed(tmu->base + IMX91_TMU_STAT0);
> +
> +	/* Check if comparison interrupt occurred */
> +	if (val & IMX91_TMU_STAT0_THR1_IF) {
> +		/* Clear irq flag and disable interrupt until reconfigured */
> +		writel(IMX91_TMU_STAT0_THR1_IF, tmu->base + IMX91_TMU_STAT0 + REG_CLR);
> +		writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_CLR);
> +
> +		return IRQ_WAKE_THREAD;
> +	}
> +
> +	return IRQ_NONE;

Why is this routine needed ? Is it a shared interrupt ?

> +}
> +
> +static irqreturn_t imx91_tmu_alarm_irq_thread(int irq, void *data)
> +{
> +	struct imx91_tmu *tmu = data;
> +
> +	thermal_zone_device_update(tmu->tzd, THERMAL_EVENT_UNSPECIFIED);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int imx91_tmu_change_mode(struct thermal_zone_device *tz, enum thermal_device_mode mode)
> +{
> +	struct imx91_tmu *tmu = thermal_zone_device_priv(tz);
> +	int ret;
> +
> +	if (mode == THERMAL_DEVICE_ENABLED) {
> +		ret = pm_runtime_get(tmu->dev);
> +		if (ret < 0)
> +			return ret;
> +
> +		writel_relaxed(IMX91_TMU_CTRL0_THR1_IE | IMX91_TMU_CTRL0_THR1_MASK,
> +			       tmu->base + IMX91_TMU_CTRL0 + REG_CLR);
> +
> +		writel_relaxed(FIELD_PREP(IMX91_TMU_CTRL0_THR1_MASK, IMX91_TMU_THR_MODE_GE),
> +			       tmu->base + IMX91_TMU_CTRL0 + REG_SET);
> +		imx91_tmu_start(tmu, true);
> +	} else {
> +		writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_CLR);
> +		imx91_tmu_start(tmu, false);
> +		pm_runtime_put(tmu->dev);
> +	}
> +
> +	return 0;
> +}
> +
> +static struct thermal_zone_device_ops tmu_tz_ops = {
> +	.get_temp = imx91_tmu_get_temp,
> +	.change_mode = imx91_tmu_change_mode,
> +	.set_trips = imx91_tmu_set_trips,
> +};
> +
> +static int imx91_tmu_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct imx91_tmu *tmu;
> +	unsigned long rate;
> +	int irq, ret;
> +	u32 div;
> +
> +	tmu = devm_kzalloc(dev, sizeof(struct imx91_tmu), GFP_KERNEL);
> +	if (!tmu)
> +		return -ENOMEM;
> +
> +	tmu->dev = dev;
> +
> +	tmu->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(tmu->base))
> +		return dev_err_probe(dev, PTR_ERR(tmu->base), "failed to get io resource");
> +
> +	tmu->clk = devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(tmu->clk))
> +		return dev_err_probe(dev, PTR_ERR(tmu->clk), "failed to get tmu clock\n");
> +
> +	platform_set_drvdata(pdev, tmu);
> +
> +	/* disable the monitor during initialization */
> +	imx91_tmu_enable(tmu, false);
> +	imx91_tmu_start(tmu, false);
> +
> +	ret = imx91_init_from_nvmem_cells(tmu);
> +	if (ret) {
> +		dev_warn(dev, "can't get trim value, use default settings\n");
> +
> +		writel_relaxed(IMX91_TMU_DEFAULT_TRIM1_CONFIG, tmu->base + IMX91_TMU_TRIM1);
> +		writel_relaxed(IMX91_TMU_DEFAULT_TRIM2_CONFIG, tmu->base + IMX91_TMU_TRIM2);
> +	}
> +
> +	/* The typical conv clk is 4MHz, the output freq is 'rate / (div + 1)' */
> +	rate = clk_get_rate(tmu->clk);
> +	div = (rate / (4 * HZ_PER_MHZ)) - 1;
> +	if (div > IMX91_TMU_DIV_MAX)
> +		return dev_err_probe(dev, -EINVAL, "clock divider exceed hardware limitation");
> +
> +	/* Set divider value and enable divider */
> +	writel_relaxed(IMX91_TMU_DIV_EN | FIELD_PREP(IMX91_TMU_DIV_MASK, div),
> +		       tmu->base + IMX91_TMU_REF_DIV);
> +
> +	/* Set max power up delay: 'Tpud(ms) = 0xFF * 1000 / 4000000' */
> +	writel_relaxed(FIELD_PREP(IMX91_TMU_PUDL_MASK, 100U), tmu->base + IMX91_TMU_PUD_ST_CTRL);
> +
> +	/*
> +	 * Set resolution mode
> +	 * 00b - Conversion time = 0.59325 ms
> +	 * 01b - Conversion time = 1.10525 ms
> +	 * 10b - Conversion time = 2.12925 ms
> +	 * 11b - Conversion time = 4.17725 ms
> +	 */
> +	writel_relaxed(FIELD_PREP(IMX91_TMU_CTRL1_RES_MASK, 0x3),
> +		       tmu->base + IMX91_TMU_CTRL1 + REG_CLR);
> +	writel_relaxed(FIELD_PREP(IMX91_TMU_CTRL1_RES_MASK, 0x1),
> +		       tmu->base + IMX91_TMU_CTRL1 + REG_SET);
> +
> +	writel_relaxed(IMX91_TMU_CTRL1_MEAS_MODE_MASK, tmu->base + IMX91_TMU_CTRL1 + REG_CLR);
> +	writel_relaxed(FIELD_PREP(IMX91_TMU_CTRL1_MEAS_MODE_MASK,
> +				  IMX91_TMU_CTRL1_MEAS_MODE_PERIODIC),
> +		       tmu->base + IMX91_TMU_CTRL1 + REG_SET);
> +
> +	/*
> +	 * Set Periodic Measurement Frequency to 25Hz:
> +	 * tMEAS_FREQ = tCONV_CLK * PERIOD_CTRL[MEAS_FREQ]
> +	 */
> +	writel_relaxed(FIELD_PREP(IMX91_TMU_PERIOD_CTRL_MEAS_MASK, 4 * HZ_PER_MHZ / 25),
> +		       tmu->base + IMX91_TMU_PERIOD_CTRL);
> +
> +	imx91_tmu_enable(tmu, true);
> +	ret = devm_add_action(dev, imx91_tmu_action_remove, tmu);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failure to add action imx91_tmu_action_remove()\n");
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_get_noresume(dev);
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
> +	tmu->tzd = devm_thermal_of_zone_register(dev, 0, tmu, &tmu_tz_ops);
> +	if (IS_ERR(tmu->tzd))
> +		return dev_err_probe(dev, PTR_ERR(tmu->tzd),
> +				     "failed to register thermal zone sensor\n");
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_threaded_irq(dev, irq, imx91_tmu_alarm_irq,
> +					imx91_tmu_alarm_irq_thread,
> +					IRQF_ONESHOT, "imx91_thermal", tmu);
> +
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to request alarm irq\n");
> +
> +	pm_runtime_put(dev);
> +
> +	return 0;
> +}
> +
> +static int imx91_tmu_runtime_suspend(struct device *dev)
> +{
> +	struct imx91_tmu *tmu = dev_get_drvdata(dev);
> +
> +	/* disable tmu */
> +	imx91_tmu_enable(tmu, false);
> +
> +	clk_disable_unprepare(tmu->clk);
> +
> +	return 0;
> +}
> +
> +static int imx91_tmu_runtime_resume(struct device *dev)
> +{
> +	struct imx91_tmu *tmu = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(tmu->clk);
> +	if (ret)
> +		return ret;
> +
> +	imx91_tmu_enable(tmu, true);
> +
> +	return 0;
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(imx91_tmu_pm_ops, imx91_tmu_runtime_suspend,
> +				 imx91_tmu_runtime_resume, NULL);
> +
> +static const struct of_device_id imx91_tmu_table[] = {
> +	{ .compatible = "fsl,imx91-tmu", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, imx91_tmu_table);
> +
> +static struct platform_driver imx91_tmu = {
> +	.driver = {
> +		.name	= "imx91_thermal",
> +		.pm	= pm_ptr(&imx91_tmu_pm_ops),
> +		.of_match_table = imx91_tmu_table,
> +	},
> +	.probe = imx91_tmu_probe,
> +};
> +module_platform_driver(imx91_tmu);
> +
> +MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
> +MODULE_DESCRIPTION("i.MX91 Thermal Monitor Unit driver");
> +MODULE_LICENSE("GPL");
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

