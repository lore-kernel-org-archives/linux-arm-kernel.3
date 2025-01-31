Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91F4C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 10:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMKEFp2iY1ooXPFXuah13Z2j8Gd6Pr/iXVngt99gS+c=; b=kI0BiW6E6t5GpXhCgQEDLFh2+6
	PIeFt9Jb5RbDEBqhYpaPk0CzDJfPM+fyknvlhxVr+eExanBR7dv48B5ZLqEP3x/mqNXchsGaCjgWX
	kJjluZG40U23QEEPq2DttdTN3pl5unp5TkkyERDBtGjTzOD4hFF4X57VBIiywl3xwWC/r4qpd3yBt
	M1Si4SZ7Jnpo4JeD8R+gXLDkTTTBcVT5UdgxTcuH2N4p4FMgp/bgJtSNdZnRuSNh0al74GwT355Tz
	rFMoPtU9JGwsJc8feMy/uXgYV7RZyZaj4+oXqc5BXxPO8BpLX/WCA6OUli6lC8cWTQP/wUeiMJhf3
	F3KyVGqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdo9J-0000000ANhm-0NhP;
	Fri, 31 Jan 2025 10:21:21 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdo7z-0000000ANaU-2MqG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 10:20:01 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-436a39e4891so12332265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 02:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738318798; x=1738923598; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sMKEFp2iY1ooXPFXuah13Z2j8Gd6Pr/iXVngt99gS+c=;
        b=WvpDqJYMn0wUP5NbqnFP72fwSB9v5bhuHIkOKh9wKieeww2vYjfAF+ixfkrnRoSuRM
         RPKrO6Oz1RUIbrue8t/zPRJzNKw8PUwKtTB7NuDQnsxq9uEEcniLHdqmJQ5a2ZsXheNe
         nfwkOw7Tdq4kgtI1r8fGBjdxTsBMt4vd6wUXfW2Fto1ZydD/klHy/o4h2+XdT4gY0/Dw
         QiYNEbwSlHYYMQYnS8/dL62jVoEyplmIuqwra4gMdMdt88eZxuFRsfDg3O4d5uVqet8a
         WtocCaBJzm0RORyz3cLUVJqUIX03f9LRt+8RHfejB16yJ34pgWl2vJNnzaL8UdZ79/60
         aLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738318798; x=1738923598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sMKEFp2iY1ooXPFXuah13Z2j8Gd6Pr/iXVngt99gS+c=;
        b=lRcXY8+Q3NE5V5xKamwQWEdfr7qIc0BwcJp+tIY5G0W26VIzLsnc5xeEVabJJhqPdk
         42e4WrdVD4XmJZJU+75fWohLwWMDBRifk6lJxb363qKogOBUWXALh1sx6HdSydDjB3Qv
         7mv7JBI1es/KHk/wFtTWimMz5EE6X9DC2C5Rv6NW2BIKna/d9BjaXzqu0gTEDs1Qf8i0
         /1C8shVAd90FjT5u/piEqZ+9pcP0p5qerxcZLC2WonzYmWaIMT3NPpnMUDx7vWMRG8NS
         QlDmP0cIMKZLeT1zB0Q/rkC76Lv7ONrrsNyt/9MfkvDx72qQBkgsQpMon0EIf5kioeLo
         wzXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVckT+rWiP2g/hLsYbJj9nAYNkJbdkv9xilgRjxKwBnBc/ymABso6FYHsege0V5WtkeaYHPA23H7bFQ2MsGiHG+@lists.infradead.org
X-Gm-Message-State: AOJu0YwtXQV9/8Et5hibz+OYqewoifIm0yX7NFqkrERAiJ2u4tCWFKqK
	8k7XCb1nX+UwAOG/mH67TznSwNjgvwG1fR2V/9Eyo74Ho9Oa9sOANzX6SGtLKbU=
X-Gm-Gg: ASbGncvXxDz9JPZ75rO+OUqBm+YCnBzUqf4YY1xBeAz3QKhljM8WJPa1DLrS5heYURC
	SClc+GV0q/V1jgQCNJsBDCJd3hRlm1uG1kw1A7/f/Oh3VVndOlFsDYqK03npKnmnz2ms5+6kk+p
	VRUSyQPtyI/0kEv8IxiwKk78VTjxjlgj9x8HfX0a1WrVCWXTw8S2jhHN35Zzi/ki846YyjbhKi8
	FbM2RdF3CMfwTVg2CvEQO7k0I2iIk8L2hUszsCA+UQjoUJbJ4LyWbYjrBP7ckT+cuohulCaMAg7
	EBOSvKWmwlJzXyRBA9mPuDrg22CrdE1yA5sG+ng5M/3kmi7bEBI0e88=
X-Google-Smtp-Source: AGHT+IFZNXsQuum6x6xRWf12F8+xm9RtbvKoDUhlQmJkPtJJdDXPK7wmN6KvRldwONlJY8dd+oDrNA==
X-Received: by 2002:a05:6000:1563:b0:385:ee40:2d75 with SMTP id ffacd0b85a97d-38c51960d9amr8876284f8f.20.1738318796298;
        Fri, 31 Jan 2025 02:19:56 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438dcc2c4ddsm85201155e9.17.2025.01.31.02.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 02:19:55 -0800 (PST)
Message-ID: <b69fe059-5aff-4fbd-879e-166d67310563@linaro.org>
Date: Fri, 31 Jan 2025 11:19:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] thermal: imx91: Add support for i.MX91 thermal
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
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
References: <20241216-imx91tmu-v4-0-75caef7481b8@nxp.com>
 <20241216-imx91tmu-v4-2-75caef7481b8@nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20241216-imx91tmu-v4-2-75caef7481b8@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_021959_623444_BCF65EE3 
X-CRM114-Status: GOOD (  41.84  )
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

On 16/12/2024 20:25, Frank Li wrote:
> From: Pengfei Li <pengfei.li_1@nxp.com>
> 
> Introduce support for the i.MX91 thermal monitoring unit, which features a
> single sensor for the CPU. The register layout differs from other chips,
> necessitating the creation of a dedicated file for this.

Please a bit more information about the sensor (eg. resolution, I guess 1°C)

> Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
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
>   drivers/thermal/imx91_thermal.c | 263 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 274 insertions(+)
> 
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index d3f9686e26e71..da403ed86aeb1 100644
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

s/OF/THERMAL_OF/

> +	help
> +	  Support for Temperature sensor found on NXP i.MX91 SoC.
> +	  It supports one critical trip point and one passive trip point. The
> +	  cpufreq is used as the cooling device to throttle CPUs when the passive
> +	  trip is crossed.

This help message is inaccurate. It should describe the sensor not the 
thermal configuration which is coming from the device tree for a 
specific platform.

>   config K3_THERMAL
>   	tristate "Texas Instruments K3 thermal support"
>   	depends on ARCH_K3 || COMPILE_TEST
> diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
> index 9abf43a74f2bb..08da241e6a598 100644
> --- a/drivers/thermal/Makefile
> +++ b/drivers/thermal/Makefile
> @@ -50,6 +50,7 @@ obj-$(CONFIG_ARMADA_THERMAL)	+= armada_thermal.o
>   obj-$(CONFIG_IMX_THERMAL)	+= imx_thermal.o
>   obj-$(CONFIG_IMX_SC_THERMAL)	+= imx_sc_thermal.o
>   obj-$(CONFIG_IMX8MM_THERMAL)	+= imx8mm_thermal.o
> +obj-$(CONFIG_IMX91_THERMAL)	+= imx91_thermal.o
>   obj-$(CONFIG_MAX77620_THERMAL)	+= max77620_thermal.o
>   obj-$(CONFIG_QORIQ_THERMAL)	+= qoriq_thermal.o
>   obj-$(CONFIG_DA9062_THERMAL)	+= da9062-thermal.o
> diff --git a/drivers/thermal/imx91_thermal.c b/drivers/thermal/imx91_thermal.c
> new file mode 100644
> index 0000000000000..ef5e8e181dd0f
> --- /dev/null
> +++ b/drivers/thermal/imx91_thermal.c
> @@ -0,0 +1,263 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2024 NXP.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/iopoll.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/thermal.h>
> +
> +#define IMX91_TMU_STAT0				0x10
> +#define IMX91_TMU_STAT0_DRDY0_IF_MASK		BIT(16)
> +
> +#define IMX91_TMU_DATA0				0x20
> +
> +#define IMX91_TMU_CTRL1_SET			0x204
> +#define IMX91_TMU_CTRL1_CLR			0x208
> +#define IMX91_TMU_CTRL1_EN			BIT(31)
> +#define IMX91_TMU_CTRL1_START			BIT(30)
> +#define IMX91_TMU_CTRL1_STOP			BIT(29)
> +#define IMX91_TMU_CTRL1_RES_MASK		GENMASK(19, 18)
> +#define IMX91_TMU_CTRL1_MEAS_MODE_MASK		GENMASK(25, 24)
> +#define   IMX91_TMU_CTRL1_MEAS_MODE_SINGLE	0
> +#define   IMX91_TMU_CTRL1_MEAS_MODE_CONTINUES	1
> +#define   IMX91_TMU_CTRL1_MEAS_MODE_PERIODIC	2
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
> +struct imx91_tmu {
> +	void __iomem *base;
> +	struct clk *clk;
> +	struct device *dev;
> +	struct thermal_zone_device *tzd;

This field is pointless because used only in the probe function.

> +};
> +
> +static void imx91_tmu_start(struct imx91_tmu *tmu, bool start)
> +{
> +	u32 val = start ? IMX91_TMU_CTRL1_START : IMX91_TMU_CTRL1_STOP;
> +
> +	writel_relaxed(val, tmu->base + IMX91_TMU_CTRL1_SET);
> +}
> +
> +static void imx91_tmu_enable(struct imx91_tmu *tmu, bool enable)
> +{
> +	u32 reg = enable ? IMX91_TMU_CTRL1_SET : IMX91_TMU_CTRL1_CLR;
> +
> +	writel_relaxed(IMX91_TMU_CTRL1_EN, tmu->base + reg);
> +}
> +
> +static int imx91_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
> +{
> +	struct imx91_tmu *tmu = thermal_zone_device_priv(tz);
> +	s16 data;
> +	int ret;
> +	u32 val;
> +
> +	ret = pm_runtime_resume_and_get(tmu->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	imx91_tmu_start(tmu, true);

Same question as [1]

Do you really want to start and stop the sensor between two reads ?

> +	ret = readl_relaxed_poll_timeout(tmu->base + IMX91_TMU_STAT0, val,
> +					 val & IMX91_TMU_STAT0_DRDY0_IF_MASK, 1000, 40000);
> +	if (ret) {
> +		ret = -EAGAIN;
> +		goto out;
> +	}
> +
> +	/* DATA0 is 16bit signed number */
> +	data = readw_relaxed(tmu->base + IMX91_TMU_DATA0);
> +	*temp = data * 1000 / 64;

cf units.h

	*temp = (data * MILLIDEGREE_PER_DEGREE) / A_LITERAL;

> +	if (*temp < IMX91_TMU_TEMP_LOW_LIMIT || *temp > IMX91_TMU_TEMP_HIGH_LIMIT)
> +		ret = -EAGAIN;
> +
> +out:
> +	pm_runtime_put(tmu->dev);
> +
> +	return ret;
> +}
> +
> +static struct thermal_zone_device_ops tmu_tz_ops = {
> +	.get_temp = imx91_tmu_get_temp,

Why not add the change_mode ops ?

> +};
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
> +static int imx91_tmu_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct imx91_tmu *tmu;
> +	unsigned long rate;
> +	u32 div;
> +	int ret;
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
> +		writel_relaxed(IMX91_TMU_DEFAULT_TRIM1_CONFIG, tmu->base + IMX91_TMU_TRIM1);
> +		writel_relaxed(IMX91_TMU_DEFAULT_TRIM2_CONFIG, tmu->base + IMX91_TMU_TRIM2);
> +	}
> +
> +	/* The typical conv clk is 4MHz, the output freq is 'rate / (div + 1)' */
> +	rate = clk_get_rate(tmu->clk);
> +	div = (rate / 4000000) - 1;

Use literals please (eg. 4 * HZ_PER_MHZ)

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
> +	writel_relaxed(FIELD_PREP(IMX91_TMU_CTRL1_RES_MASK, 0x3), tmu->base + IMX91_TMU_CTRL1_CLR);
> +	writel_relaxed(FIELD_PREP(IMX91_TMU_CTRL1_RES_MASK, 0x1), tmu->base + IMX91_TMU_CTRL1_SET);
> +
> +	writel_relaxed(IMX91_TMU_CTRL1_MEAS_MODE_MASK, tmu->base + IMX91_TMU_CTRL1_CLR);
> +	writel_relaxed(FIELD_PREP(IMX91_TMU_CTRL1_MEAS_MODE_MASK, IMX91_TMU_CTRL1_MEAS_MODE_SINGLE),
> +		       tmu->base + IMX91_TMU_CTRL1_SET);
> +
> +	pm_runtime_set_active(dev);
> +	devm_pm_runtime_enable(dev);
> +	pm_runtime_put(dev);
> +
> +	tmu->tzd = devm_thermal_of_zone_register(dev, 0, tmu, &tmu_tz_ops);
> +	if (IS_ERR(tmu->tzd))
> +		return dev_err_probe(dev, PTR_ERR(tmu->tzd),
> +				     "failed to register thermal zone sensor\n");
> +
> +	ret = devm_add_action(dev, imx91_tmu_action_remove, tmu);

Should it be moved before devm_thermal_of_zone_register(), so if the 
thermal zone creation fails, it will stop the sensor which was 
previously started ?

> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failure to add action imx91_tmu_action_remove()\n");
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

