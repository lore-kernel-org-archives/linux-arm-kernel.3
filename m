Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610B1C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 10:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTlk+jYHZEiHwrDu7oq1VdZKiF0Z5rQ01+MOkfIYifY=; b=K0Y6vvl+DEaoI5qMBiY7Ay4M3p
	B0aKyg8w9mOpTkIKabS49S8EgWZIg/L+OyuQW2+0TQrstv08pGk0wlSK0NYdkFEAHUCwUuR45C/TN
	r4Fvee/MhjsvIsdG5AdLqp3IKMYX0AGH8XzdcCd1SgV3GvhSBfNS/Wx08Z6Rn82GDfCLl68sGDLBc
	nw9xVDIW0YQJ9aoTyoQnSpf7PMNp4oPqBurWvGFk9a+3uvjc4xCqkgTkx3GYIKKJoqPOYnqonaQDK
	QTgRW2RJMxvZT6zgEc4fj4Tzsrk4URVzpINH3vtITN8GEJykSThnGN5UdVtAf6A2mVPghMd7GQTnj
	xdjfqhLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5j92-0000000FtKr-0bCH;
	Fri, 18 Apr 2025 10:40:28 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5j1b-0000000FsHq-15O8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 10:32:48 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ac289147833so333260566b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 03:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744972365; x=1745577165; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CTlk+jYHZEiHwrDu7oq1VdZKiF0Z5rQ01+MOkfIYifY=;
        b=nHvslv4y+mPsogigWQsrftI+859ZCosT4Jyb43x9w9h38Va1ABQcpOUrtefcyT6hij
         DRCplOmPYLtfpznL8NLMM+XPU9DNOZNl4Cs0KltnsCgP74sJfi9zxff4vDpBLkwWsZiF
         1IaS8793LMNMLM1lMbUFwajIp9O0xsUxYTQww3/S/5/vtIg8GQ+a85Mnl+e2/owlb//T
         LRtk+Mw5n7QEtnyo7Ifmiq9Pa+GxcE5GwdyN6zUqAYiVM41Z/5MhOb5hTMEMNxzEkSi1
         An8drbGU3NEaPVcSBB//K0CK9VGWN9wwxHtZWwdYo4/6HdZln/H8ynMGPRR2i84T2D6J
         UeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744972365; x=1745577165;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CTlk+jYHZEiHwrDu7oq1VdZKiF0Z5rQ01+MOkfIYifY=;
        b=d+aaQ/w42rruzlo1S272QOuukKVpHGTjm69uf5KmKM4v0lh8jxMMHHQicH1/CQuY+q
         ptIRT2YVr8gMS7fTtj7mGgrhqYcy6UF4fI459z6g3AJE8Y5yrV2qPQXbSwtDp1VfULcu
         6ITx2Ji4gZp5bssFr/OEdZhiAfSksM36sMVv82gstMOwBlb6o3vIzmqBhjCoqwYO6K2Z
         23Y8Tw9q5AUgWCZzjrjlnRH+86gWRLFe24gW061yz7DiU53Q6fdb72yN7ESYE/zPHFEz
         vHc8tZJq6nN1ywXKwGeTZRupISgN4GJYsiU2FCFv7mUIgPwxzz8TOe/N+thhm2LjCdlN
         RQMA==
X-Forwarded-Encrypted: i=1; AJvYcCVPskqOOFDB7Gy0Wj5i4Ncqj1oxVMrfEnHQY5mMGwZgdxoSBtMMMJNNdqcG8EuSSuVEz6kN7hFLO/p13v6quiJX@lists.infradead.org
X-Gm-Message-State: AOJu0YyAiOmfeImdzcJgvShHMpi6CK+jvBoRdtiLU0JWvJybJxH/YnLl
	X2aLof7b7ZuwyvvnEKreJpN0xN+IJTeBaZ7TaDxLndtQuXi20rcsF2q0ViUNS4crvHZ5aLCJ9fE
	m
X-Gm-Gg: ASbGnctln14NCNxdmOovmL7hFPSZfZn44m+tvZ3xQiAb4HHaFcl88s2DYRdwTy1WiLR
	CBV2oA5olqj9fB5owPOO/H87QofTBPP8idbkbS8KCw2aWb/je+rjrr9oCB40LWeOZgeZbYyAWn/
	FpqdDzSsUD2q4JvXMK7WquVX/Yjce32WD3rotSr2bH7pk8jACT+PfAyqByOReN9UzPqVkVO1KAC
	EqeSmabA3eqXzTDKDSUDZi7tENWVJvhcpE4GFUmzdabU/o1IVH53rFEoVfQu3P9vUI0JjkJnfPY
	GCXu+hkxEx5+tbLUnwO3a972Xu2NySqHBUWoL+PcbktoKIHnhSqF+j0zkMv1J200UD0fRalKMdm
	qwsSa8JP/lyi1qw==
X-Google-Smtp-Source: AGHT+IE32VVV4WI0syEHCfftDy3qQR8UsE5hWgnvTO3T4+yc+FIYsXr0vx8CYH0HyyE7uZXj039ibg==
X-Received: by 2002:a05:600c:1c07:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-4406aba5a1amr20867675e9.15.1744970754834;
        Fri, 18 Apr 2025 03:05:54 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5bbd5fsm16485565e9.22.2025.04.18.03.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 03:05:54 -0700 (PDT)
Date: Fri, 18 Apr 2025 12:05:52 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengfei Li <pengfei.li_1@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ye.li@nxp.com, joy.zou@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RESEND v6 2/2] thermal: imx91: Add support for i.MX91
 thermal monitoring unit
Message-ID: <aAIkAF_AHta8_vuS@mai.linaro.org>
References: <20250407-imx91tmu-v6-0-e48c2aa3ae44@nxp.com>
 <20250407-imx91tmu-v6-2-e48c2aa3ae44@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407-imx91tmu-v6-2-e48c2aa3ae44@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_033247_323369_FC39D7D7 
X-CRM114-Status: GOOD (  44.28  )
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

On Mon, Apr 07, 2025 at 04:05:40PM -0400, Frank Li wrote:
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
>  drivers/thermal/Kconfig         |  10 +
>  drivers/thermal/Makefile        |   1 +
>  drivers/thermal/imx91_thermal.c | 398 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 409 insertions(+)
> 
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index d3f9686e26e71..78a05d1030882 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -296,6 +296,16 @@ config IMX8MM_THERMAL
>  	  cpufreq is used as the cooling device to throttle CPUs when the passive
>  	  trip is crossed.
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
>  config K3_THERMAL
>  	tristate "Texas Instruments K3 thermal support"
>  	depends on ARCH_K3 || COMPILE_TEST
> diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
> index 9abf43a74f2bb..08da241e6a598 100644
> --- a/drivers/thermal/Makefile
> +++ b/drivers/thermal/Makefile
> @@ -50,6 +50,7 @@ obj-$(CONFIG_ARMADA_THERMAL)	+= armada_thermal.o
>  obj-$(CONFIG_IMX_THERMAL)	+= imx_thermal.o
>  obj-$(CONFIG_IMX_SC_THERMAL)	+= imx_sc_thermal.o
>  obj-$(CONFIG_IMX8MM_THERMAL)	+= imx8mm_thermal.o
> +obj-$(CONFIG_IMX91_THERMAL)	+= imx91_thermal.o
>  obj-$(CONFIG_MAX77620_THERMAL)	+= max77620_thermal.o
>  obj-$(CONFIG_QORIQ_THERMAL)	+= qoriq_thermal.o
>  obj-$(CONFIG_DA9062_THERMAL)	+= da9062-thermal.o
> diff --git a/drivers/thermal/imx91_thermal.c b/drivers/thermal/imx91_thermal.c
> new file mode 100644
> index 0000000000000..e8deb0b07dc98
> --- /dev/null
> +++ b/drivers/thermal/imx91_thermal.c
> @@ -0,0 +1,398 @@
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
> +	int high;
> +	bool enable;
> +};
> +
> +static void imx91_tmu_start(struct imx91_tmu *tmu, bool start)
> +{
> +	u32 val = start ? IMX91_TMU_CTRL1_START : IMX91_TMU_CTRL1_STOP;
> +
> +	writel_relaxed(val, tmu->base + IMX91_TMU_CTRL1 + REG_SET);
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
> +
> +static int imx91_tmu_to_mcelsius(int x)
> +{
> +	return x * MILLIDEGREE_PER_DEGREE / IMX91_TMP_FRAC;
> +}
> +
> +static int imx91_tmu_from_mcelsius(int x)
> +{
> +	return x * IMX91_TMP_FRAC / MILLIDEGREE_PER_DEGREE;
> +}
> +
> +static int imx91_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
> +{
> +	struct imx91_tmu *tmu = thermal_zone_device_priv(tz);
> +	s16 data;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(tmu->dev);
> +	if (ret < 0)
> +		return ret;

Why using pm_runtime* all over the place ?

It would make sense to have in the probe/remove functions (or in the set_mode -
enabled / disabled), suspend / resume but the other place it does not make
sense IMO. If the sensor is enabled by the set_mode function and then
pm_runtime_get() is called, then the ref is taken during all the time the
sensor is in use, so others pm_runtime_get / pm_runtime_put will be helpless,
no ?


> +	/* DATA0 is 16bit signed number */
> +	data = readw_relaxed(tmu->base + IMX91_TMU_DATA0);
> +	*temp = imx91_tmu_to_mcelsius(data);
> +	if (*temp < IMX91_TMU_TEMP_LOW_LIMIT || *temp > IMX91_TMU_TEMP_HIGH_LIMIT)
> +		ret = -EAGAIN;

When the measured temperature can be out of limits ?

> +	if (*temp <= tmu->high && tmu->enable) {

I suggest to provide a change in the thermal core to return -EAGAIN if the
thermal zone is not enabled when calling thermal_zone_get_temp() and get rid of the tmu->enable

> +		writel_relaxed(IMX91_TMU_STAT0_THR1_IF, tmu->base + IMX91_TMU_STAT0 + REG_CLR);
> +		writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_SET);
> +	}

For my understanding what are for these REG_CLR and REG_SET in this function?

> +	pm_runtime_put(tmu->dev);
> +
> +	return ret;
> +}
> +
> +static int imx91_tmu_set_trips(struct thermal_zone_device *tz, int low, int high)
> +{
> +	struct imx91_tmu *tmu = thermal_zone_device_priv(tz);
> +	int val;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(tmu->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (high >= IMX91_TMU_TEMP_HIGH_LIMIT)
> +		return -EINVAL;
> +
> +	writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_CLR);
> +
> +	/* Comparator1 for temperature threshold */
> +	writel_relaxed(IMX91_TMU_THR_CTRL01_THR1_MASK, tmu->base + IMX91_TMU_THR_CTRL01 + REG_CLR);
> +	val = FIELD_PREP(IMX91_TMU_THR_CTRL01_THR1_MASK, imx91_tmu_from_mcelsius(high));
> +	writel_relaxed(val, tmu->base + IMX91_TMU_THR_CTRL01 + REG_SET);
> +
> +	writel_relaxed(IMX91_TMU_STAT0_THR1_IF, tmu->base + IMX91_TMU_STAT0 + REG_CLR);
> +
> +	tmu->high = high;

Why is 'high' needed?

> +
> +	writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_SET);
> +	pm_runtime_put(tmu->dev);
> +
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
> +static irqreturn_t imx91_tmu_alarm_irq_thread(int irq, void *dev)
> +{
> +	struct imx91_tmu *tmu = dev;
> +	int val;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(tmu->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	thermal_zone_device_update(tmu->tzd, THERMAL_EVENT_UNSPECIFIED);

Ack the IRQ before calling thermal_zone_device_update()

> +	val = readl_relaxed(tmu->base + IMX91_TMU_STAT0);

One blank line to let the code breath

> +	/* Have to use CLR register to clean up w1c bits */
> +	writel_relaxed(val, tmu->base + IMX91_TMU_STAT0 + REG_CLR);
> +
> +	writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_CLR);
> +
> +	pm_runtime_put(tmu->dev);
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
> +		imx91_tmu_start(tmu, true);
> +		writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_SET);
> +		tmu->enable = true;
> +	} else {
> +		writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_CLR);
> +		imx91_tmu_start(tmu, false);
> +		pm_runtime_put(tmu->dev);
> +		tmu->enable = false;
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

[ ... ]

