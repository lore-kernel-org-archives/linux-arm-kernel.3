Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD63C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 12:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XL5TAnfEOTO/vqai8gV9bDBZY8LnK2YPH5SnaEJ2W0=; b=xdJbGUbHyFq7uVjeOfMoHFlnYD
	CxdXgpFk3RctSuZohFbRIJaYFNr/sMKyGLofcG5oTHniEZMzPDbqXxq6EXSOvHDJ9yeVCQR50hpoP
	OigAiowdfySTNujWVI5aubwpWAvG4gffpAfauGb5A1C2bSFumMTscXB5jHpA3/qLIQqLbGJk4XisK
	FMVxn15R4oLlhl6/l0/CVRZBn3WZSAik9vTWG8wNc+ojDYoa8GCX4xA1tec1UmZcPFrB16h8HYKqw
	O2qWNmNTA9S1CdWSWJ3CooaXSPNkBUYvzPXybBf3EczhSkEQI72TrnyBoWiVTtUHVyaSoyQhXaKQJ
	ePw6ngYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY1hL-0000000GTdI-1yoX;
	Sat, 05 Jul 2025 12:08:51 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY1f0-0000000GTTZ-0D3D
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 12:06:27 +0000
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 53A227A0183;
	Sat,  5 Jul 2025 08:06:22 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 05 Jul 2025 08:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751717182;
	 x=1751803582; bh=5XL5TAnfEOTO/vqai8gV9bDBZY8LnK2YPH5SnaEJ2W0=; b=
	Bk+5cKsM1PrtuSEN6JOKPqsPseHJotFde4rKGAbiOyTuMktD8LQuSlPLpID07IW3
	jFxbZOJ0To1XYym0kJyRKewdcmQhAlfXQY7nnBxVwpfn2VV+8G7YjqHY/uF0oAfA
	b7I9bqwpEypyUND5gDzE5wH3wFpEF1UJIrShQsT/A1EFd1le94MAwLijTRq0D0jy
	hp7+5FX6umglOupbm6OO4yUZ2JKeCFgqxyVssgV4spbE4IQDSMqHvM41R45J3pzW
	BXdAF1LcelhkJ7L+s+iE7FIy697k11+yTYOXijdfOBGZwyA6dkmUqV2stndz4t4O
	tarncCJ+VE662kkXXilGfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751717182; x=
	1751803582; bh=5XL5TAnfEOTO/vqai8gV9bDBZY8LnK2YPH5SnaEJ2W0=; b=T
	Jhw2D5Pnan8YB27hKGjURQukajChtTX9fv5tIBN+zg9jNFP+5cUU/v85uoXIEamm
	0zvvC+HI7bOXN3HMI0w4/sEmZxmr7/EQUjUzibmYuudviurYi43lyflObNb1/fhU
	Wx7TSCHBW5WYt2y8B5SwELZnNAefJLr5UP6Sq6bYkgnRSQRqb3ppVekzodG6eqUL
	gjwlMlD8TUGvgrnQ69MxKcTK7lROiFWBq+CqueTg3uneSxPgUIIZ9LeXIyhUBgYE
	JHXlyp9KaywzWnwXLUMlE2vBTco5MtjPkdASFKtbZsV/dnkcEbLVDLhiZh9f1R4D
	IGRt6lI+q9FXVd5epJhIw==
X-ME-Sender: <xms:PBVpaH-D6N48mQvTud8gL4RuMeQjrSKeh2YFmGK8r33JcXkZjP15Pw>
    <xme:PBVpaDszLnLWWvne-o5o-D-ztMj3aBHzUtPBPMRQ_5RL2FKEYbBLXDvFd9pJroCvi
    xoRo9Xt7F-Vmz16lF8>
X-ME-Received: <xmr:PBVpaFAqd3vVW30NjitRlmstXeyGLxqcbbOvbJ0PWa5Grha_hb6SWqVsdSPdzJ0ftlsBTEBLOI4Ag5jrVdzCAFISWAvXP2xGVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvheellecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertd
    dttdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdr
    shhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpe
    fftdegfeevfefguedtveevlefgleekuedvfeeggfefheefieejhedulefhjeekgfenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohepudejpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphht
    thhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghlrd
    hlvgiitggrnhhosehlihhnrghrohdrohhrghdprhgtphhtthhopehruhhirdiihhgrnhhg
    sehinhhtvghlrdgtohhmpdhrtghpthhtoheplhhukhgrshiirdhluhgsrgesrghrmhdrtg
    homhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhr
    iihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggv
    rhdrsggv
X-ME-Proxy: <xmx:PBVpaDdQZEiBP073SX3mskUvQUY_rXi21uk95i3p3makmYLO2Sb0vQ>
    <xmx:PBVpaMNVv9Nu5t1p9atFDiBcRDtg6pUC8nzLYqOa8XO9i_rDOypJyg>
    <xmx:PBVpaFlSL7qtSskt6Z3gILrWlCARodFt3ST-ypx9aSkaWLgwgpLJng>
    <xmx:PBVpaGuXy1SwaaZPkIzGDm1fiU1UsTG95RoVXz7f0SkrKlB0iwfyeA>
    <xmx:PhVpaApX0Vo78FOKct9ugQTkG3_yO5FZNOM1_CeynZkbouZGNiKFXm2->
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 5 Jul 2025 08:06:20 -0400 (EDT)
Date: Sat, 5 Jul 2025 14:06:17 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 2/4] thermal: renesas: rzg3s: Add thermal driver for
 the Renesas RZ/G3S SoC
Message-ID: <20250705120617.GA671672@ragnatech.se>
References: <20250324135701.179827-1-claudiu.beznea.uj@bp.renesas.com>
 <20250324135701.179827-3-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250324135701.179827-3-claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_050626_588271_75957DC4 
X-CRM114-Status: GOOD (  39.93  )
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

Hi Claudiu,

Thanks for your work. 

Sorry for late review, Geert only alerted me to the series a few days 
ago.

On 2025-03-24 15:56:59 +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The Renesas RZ/G3S SoC features a Thermal Sensor Unit (TSU) that reports
> the junction temperature. The temperature is reported through a dedicated
> ADC channel. Add a driver for the Renesas RZ/G3S TSU.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v3:
> - drop the runtime resume/suspend from rzg3s_thermal_get_temp(); this
>   is not needed as the temperature is read with ADC
> - opened the devres group id in rzg3s_thermal_probe() and rename
>   previsouly rzg3s_thermal_probe() to rzg3s_thermal_probe_helper(), to
>   have simpler code; this approach was suggested by Jonathan in [1];
>   as there is no positive feedback for the generic solution [2] this
>   looks currently the best approach
> 
> [1] https://lore.kernel.org/all/20250224120608.1769039-2-claudiu.beznea.uj@bp.renesas.com
> [2] https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com
> 
> 
> Changes in v2:
> - use a devres group for the devm resources obtained though this
>   driver to avoid issue described in [1]; with this dropped the
>   following calls:
> -- thermal_add_hwmon_sysfs(priv->tz);
> -- thermal_of_zone_register(priv->tz);
> -- pm_runtime_enable(priv->dev);
>   and use devm variants
> - used signed variables for temperature computation
> - convert to mili degree Celsius before applying the computation formula
>   to avoid losing precision
> 
> [1] https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/
> 
>  MAINTAINERS                             |   7 +
>  drivers/thermal/renesas/Kconfig         |   8 +
>  drivers/thermal/renesas/Makefile        |   1 +
>  drivers/thermal/renesas/rzg3s_thermal.c | 313 ++++++++++++++++++++++++
>  4 files changed, 329 insertions(+)
>  create mode 100644 drivers/thermal/renesas/rzg3s_thermal.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a9b8fa5f032..f3795fbcdcba 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20594,6 +20594,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/potentiometer/renesas,x9250.yaml
>  F:	drivers/iio/potentiometer/x9250.c
>  
> +RENESAS RZ/G3S THERMAL SENSOR UNIT DRIVER
> +M:	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> +L:	linux-pm@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml
> +F:	drivers/thermal/renesas/rzg3s_thermal.c
> +
>  RESET CONTROLLER FRAMEWORK
>  M:	Philipp Zabel <p.zabel@pengutronix.de>
>  S:	Maintained
> diff --git a/drivers/thermal/renesas/Kconfig b/drivers/thermal/renesas/Kconfig
> index dcf5fc5ae08e..566478797095 100644
> --- a/drivers/thermal/renesas/Kconfig
> +++ b/drivers/thermal/renesas/Kconfig
> @@ -26,3 +26,11 @@ config RZG2L_THERMAL
>  	help
>  	  Enable this to plug the RZ/G2L thermal sensor driver into the Linux
>  	  thermal framework.
> +
> +config RZG3S_THERMAL
> +	tristate "Renesas RZ/G3S thermal driver"
> +	depends on ARCH_R9A08G045 || COMPILE_TEST
> +	depends on OF && IIO && RZG2L_ADC
> +	help
> +	  Enable this to plug the RZ/G3S thermal sensor driver into the Linux
> +	  thermal framework.
> diff --git a/drivers/thermal/renesas/Makefile b/drivers/thermal/renesas/Makefile
> index bf9cb3cb94d6..1feb5ab78827 100644
> --- a/drivers/thermal/renesas/Makefile
> +++ b/drivers/thermal/renesas/Makefile
> @@ -3,3 +3,4 @@
>  obj-$(CONFIG_RCAR_GEN3_THERMAL)	+= rcar_gen3_thermal.o
>  obj-$(CONFIG_RCAR_THERMAL)	+= rcar_thermal.o
>  obj-$(CONFIG_RZG2L_THERMAL)	+= rzg2l_thermal.o
> +obj-$(CONFIG_RZG3S_THERMAL)	+= rzg3s_thermal.o
> diff --git a/drivers/thermal/renesas/rzg3s_thermal.c b/drivers/thermal/renesas/rzg3s_thermal.c
> new file mode 100644
> index 000000000000..e0bc51943875
> --- /dev/null
> +++ b/drivers/thermal/renesas/rzg3s_thermal.c
> @@ -0,0 +1,313 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/G3S TSU Thermal Sensor Driver
> + *
> + * Copyright (C) 2024 Renesas Electronics Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/iio/consumer.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +#include <linux/thermal.h>
> +#include <linux/units.h>
> +
> +#include "../thermal_hwmon.h"
> +
> +#define TSU_SM			0x0
> +#define TSU_SM_EN		BIT(0)
> +#define TSU_SM_OE		BIT(1)
> +#define OTPTSUTRIM_REG(n)	(0x18 + (n) * 0x4)
> +#define OTPTSUTRIM_EN_MASK	BIT(31)
> +#define OTPTSUTRIM_MASK		GENMASK(11, 0)
> +
> +#define TSU_READ_STEPS		8
> +
> +/* Default calibration values, if FUSE values are missing. */
> +#define SW_CALIB0_VAL		1297
> +#define SW_CALIB1_VAL		751
> +
> +#define MCELSIUS(temp)		((temp) * MILLIDEGREE_PER_DEGREE)
> +
> +/**
> + * struct rzg3s_thermal_priv - RZ/G3S thermal private data structure
> + * @base: TSU base address
> + * @dev: device pointer
> + * @tz: thermal zone pointer
> + * @rstc: reset control
> + * @channel: IIO channel to read the TSU
> + * @devres_group_id: devres group for the driver devres resources
> + *		      obtained in probe
> + * @mode: current device mode
> + * @calib0: calibration value
> + * @calib1: calibration value
> + */
> +struct rzg3s_thermal_priv {
> +	void __iomem *base;
> +	struct device *dev;
> +	struct thermal_zone_device *tz;
> +	struct reset_control *rstc;
> +	struct iio_channel *channel;
> +	void *devres_group_id;
> +	enum thermal_device_mode mode;
> +	u16 calib0;
> +	u16 calib1;
> +};
> +
> +static int rzg3s_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
> +{
> +	struct rzg3s_thermal_priv *priv = thermal_zone_device_priv(tz);
> +	int ts_code_ave = 0;
> +	int ret, val;
> +
> +	if (priv->mode != THERMAL_DEVICE_ENABLED)
> +		return -EAGAIN;
> +
> +	for (u8 i = 0; i < TSU_READ_STEPS; i++) {
> +		ret = iio_read_channel_raw(priv->channel, &val);
> +		if (ret < 0)
> +			return ret;
> +
> +		ts_code_ave += val;
> +		/*
> +		 * According to the HW manual (section 40.4.4 Procedure for Measuring the
> +		 * Temperature) we need to wait here at leat 3us.
> +		 */
> +		usleep_range(5, 10);
> +	}
> +
> +	ret = 0;
> +	ts_code_ave = DIV_ROUND_CLOSEST(MCELSIUS(ts_code_ave), TSU_READ_STEPS);
> +
> +	/*
> +	 * According to the HW manual (section 40.4.4 Procedure for Measuring the Temperature)
> +	 * the computation formula is as follows:
> +	 *
> +	 * Tj = (ts_code_ave - priv->calib1) * 165 / (priv->calib0 - priv->calib1) - 40
> +	 *
> +	 * Convert everything to mili Celsius before applying the formula to avoid
> +	 * losing precision.
> +	 */
> +
> +	*temp = DIV_ROUND_CLOSEST((s64)(ts_code_ave - MCELSIUS(priv->calib1)) * MCELSIUS(165),
> +				  MCELSIUS(priv->calib0 - priv->calib1)) - MCELSIUS(40);

The issue Geert points out, can that not be solved by holding off 
converting to MCELSIUS() to after you have done the calculation?

Other then this issue I think this change is very clear and ready.

> +
> +	/* Report it in mili degrees Celsius and round it up to 0.5 degrees Celsius. */
> +	*temp = roundup(*temp, 500);
> +
> +	return ret;
> +}
> +
> +static void rzg3s_thermal_set_mode(struct rzg3s_thermal_priv *priv,
> +				   enum thermal_device_mode mode)
> +{
> +	struct device *dev = priv->dev;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return;
> +
> +	if (mode == THERMAL_DEVICE_DISABLED) {
> +		writel(0, priv->base + TSU_SM);
> +	} else {
> +		writel(TSU_SM_EN, priv->base + TSU_SM);
> +		/*
> +		 * According to the HW manual (section 40.4.1 Procedure for
> +		 * Starting the TSU) we need to wait here 30us or more.
> +		 */
> +		usleep_range(30, 40);
> +
> +		writel(TSU_SM_OE | TSU_SM_EN, priv->base + TSU_SM);
> +		/*
> +		 * According to the HW manual (section 40.4.1 Procedure for
> +		 * Starting the TSU) we need to wait here 50us or more.
> +		 */
> +		usleep_range(50, 60);
> +	}
> +
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +}
> +
> +static int rzg3s_thermal_change_mode(struct thermal_zone_device *tz,
> +				     enum thermal_device_mode mode)
> +{
> +	struct rzg3s_thermal_priv *priv = thermal_zone_device_priv(tz);
> +
> +	if (priv->mode == mode)
> +		return 0;
> +
> +	rzg3s_thermal_set_mode(priv, mode);
> +	priv->mode = mode;
> +
> +	return 0;
> +}
> +
> +static const struct thermal_zone_device_ops rzg3s_tz_of_ops = {
> +	.get_temp = rzg3s_thermal_get_temp,
> +	.change_mode = rzg3s_thermal_change_mode,
> +};
> +
> +static int rzg3s_thermal_read_calib(struct rzg3s_thermal_priv *priv)
> +{
> +	struct device *dev = priv->dev;
> +	u32 val;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return ret;
> +
> +	val = readl(priv->base + OTPTSUTRIM_REG(0));
> +	if (val & OTPTSUTRIM_EN_MASK)
> +		priv->calib0 = FIELD_GET(OTPTSUTRIM_MASK, val);
> +	else
> +		priv->calib0 = SW_CALIB0_VAL;
> +
> +	val = readl(priv->base + OTPTSUTRIM_REG(1));
> +	if (val & OTPTSUTRIM_EN_MASK)
> +		priv->calib1 = FIELD_GET(OTPTSUTRIM_MASK, val);
> +	else
> +		priv->calib1 = SW_CALIB1_VAL;
> +
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return 0;
> +}
> +
> +static int rzg3s_thermal_probe_helper(struct platform_device *pdev, void *devres_group_id)
> +{
> +	struct rzg3s_thermal_priv *priv;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->devres_group_id = devres_group_id;
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->channel = devm_iio_channel_get(dev, "tsu");
> +	if (IS_ERR(priv->channel))
> +		return dev_err_probe(dev, PTR_ERR(priv->channel), "Failed to get IIO channel!\n");
> +
> +	priv->rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
> +	if (IS_ERR(priv->rstc))
> +		return dev_err_probe(dev, PTR_ERR(priv->rstc), "Failed to get reset!\n");
> +
> +	priv->dev = dev;
> +	priv->mode = THERMAL_DEVICE_DISABLED;
> +	platform_set_drvdata(pdev, priv);
> +
> +	pm_runtime_set_autosuspend_delay(dev, 300);
> +	pm_runtime_use_autosuspend(dev);
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable runtime PM!\n");
> +
> +	ret = rzg3s_thermal_read_calib(priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to read calibration data!\n");
> +
> +	priv->tz = devm_thermal_of_zone_register(dev, 0, priv, &rzg3s_tz_of_ops);
> +	if (IS_ERR(priv->tz))
> +		return dev_err_probe(dev, PTR_ERR(priv->tz), "Failed to register thermal zone!\n");
> +
> +	ret = devm_thermal_add_hwmon_sysfs(dev, priv->tz);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add hwmon sysfs!\n");
> +
> +	return 0;
> +}
> +
> +static int rzg3s_thermal_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	void *devres_group_id;
> +	int ret;
> +
> +	/*
> +	 * Open a devres group to allow using devm_pm_runtime_enable()
> +	 * w/o interfeering with dev_pm_genpd_detach() in the platform bus
> +	 * remove. Otherwise, durring repeated unbind/bind operations,
> +	 * the TSU may be runtime resumed when it is not part of its power
> +	 * domain, leading to accessing TSU registers (through
> +	 * rzg3s_thermal_change_mode()) without its clocks being enabled
> +	 * and its PM domain being turned on.
> +	 */
> +	devres_group_id = devres_open_group(dev, NULL, GFP_KERNEL);
> +	if (!devres_group_id)
> +		return -ENOMEM;
> +
> +	ret = rzg3s_thermal_probe_helper(pdev, devres_group_id);
> +	if (ret)
> +		devres_release_group(dev, devres_group_id);
> +
> +	return ret;
> +}
> +
> +static void rzg3s_thermal_remove(struct platform_device *pdev)
> +{
> +	struct rzg3s_thermal_priv *priv = dev_get_drvdata(&pdev->dev);
> +
> +	devres_release_group(priv->dev, priv->devres_group_id);
> +}
> +
> +static int rzg3s_thermal_suspend(struct device *dev)
> +{
> +	struct rzg3s_thermal_priv *priv = dev_get_drvdata(dev);
> +
> +	rzg3s_thermal_set_mode(priv, THERMAL_DEVICE_DISABLED);
> +
> +	return reset_control_assert(priv->rstc);
> +}
> +
> +static int rzg3s_thermal_resume(struct device *dev)
> +{
> +	struct rzg3s_thermal_priv *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = reset_control_deassert(priv->rstc);
> +	if (ret)
> +		return ret;
> +
> +	if (priv->mode != THERMAL_DEVICE_DISABLED)
> +		rzg3s_thermal_set_mode(priv, priv->mode);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops rzg3s_thermal_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(rzg3s_thermal_suspend, rzg3s_thermal_resume)
> +};
> +
> +static const struct of_device_id rzg3s_thermal_dt_ids[] = {
> +	{ .compatible = "renesas,r9a08g045-tsu" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rzg3s_thermal_dt_ids);
> +
> +static struct platform_driver rzg3s_thermal_driver = {
> +	.driver = {
> +		.name = "rzg3s_thermal",
> +		.of_match_table = rzg3s_thermal_dt_ids,
> +		.pm = pm_ptr(&rzg3s_thermal_pm_ops),
> +	},
> +	.probe = rzg3s_thermal_probe,
> +	.remove = rzg3s_thermal_remove,
> +};
> +module_platform_driver(rzg3s_thermal_driver);
> +
> +MODULE_DESCRIPTION("Renesas RZ/G3S Thermal Sensor Unit Driver");
> +MODULE_AUTHOR("Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.43.0
> 
> 

-- 
Kind Regards,
Niklas Söderlund

