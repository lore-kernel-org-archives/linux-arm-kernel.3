Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B5CC531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 16:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U01kuOATGHA1fUMiHEUhqkKZsOtYtgmMdQbRp82P+Hk=; b=AIgvFM7SnzbW8oWCkVAxdgCFjk
	YOKxiTv011miF3cDWfawt0M9oL/UUW/e9iW+Oi01cp5izriyLsHz4JLYTsdQVvXWyGd7PCWNhuuvL
	PQmpP/uJLwriK9pApJE7M0V9D2CW5TyTmeLbBYGWjagwiefLurKJ47aGvZVZTWLffZ6/1M00BlmcQ
	6QP+Tb2pjGTpzzBYS5WD45SJE34wwglpoAbuf6q1Y/sT337/XMk/SmtJNUddj51W/vXSSBq0Tab1I
	+GqhO2bYuHUMZEr2TmJRcxoUa7FgjsXrcX6nHgCxgA1e1iXYGfefi+tnnbd/+Z6MVD2W1KVBZrp83
	6Ybmsq3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvfi-0000000EdWE-30BX;
	Thu, 23 Jul 2026 15:49:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvfh-0000000EdVt-0gQc;
	Thu, 23 Jul 2026 15:49:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 94C6560A62;
	Thu, 23 Jul 2026 15:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE281F000E9;
	Thu, 23 Jul 2026 15:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784821756;
	bh=U01kuOATGHA1fUMiHEUhqkKZsOtYtgmMdQbRp82P+Hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PHCmPjDn1fSziPa+BM08GsiE+UPsJZ+fv77G5TEjtX+n6njvYj954SkQE4kKDhyD0
	 ARpcyfZBX47nlpJnStKP0X1dtnLyWywBBJGj70iLej4kgNq2vFiYkQ9S7GpIAxFLFy
	 tIbmrHq/FBnLK3zhL1iJ+NqabGwQCB4aq8klAXD01ICeeiK2g08aPTovK3PfhXQzYe
	 AJjqS3Mji+tLWvi2plC928sXlaJCD6D8OhCoYb/DKe/jhIW8jFLCfEcE+6l7YQWU8J
	 rZRD+y4Q7wxUcYQnBMYhnBWfL/bHl2JaKdzUoscYO4pCBDwvHJ1Wl1TIDaERFlc3+c
	 T4oX6zLKQLnLg==
Date: Thu, 23 Jul 2026 16:48:47 +0100
From: Lee Jones <lee@kernel.org>
To: linux-kernel-dev@aliel.fr
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v8 4/8] mfd: khadas-mcu: Add support for VIM4 MCU variant
Message-ID: <20260723154847.GP3363113@google.com>
References: <20260702-add-mcu-fan-khadas-vim4-v8-0-244feee91a36@aliel.fr>
 <20260702-add-mcu-fan-khadas-vim4-v8-4-244feee91a36@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260702-add-mcu-fan-khadas-vim4-v8-4-244feee91a36@aliel.fr>
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

/* Sashiko Automation: Reviewed (0 Findings) */

On Thu, 02 Jul 2026, Ronald Claveau via B4 Relay wrote:

> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Refactor probe() to use per-variant values
> instead of hardcoded globals.
> 
> Add dedicated regmap configuration for the VIM4 MCU,
> with its own volatile/writeable registers.
> 
> Add the fan control register
> (0–100 levels vs 0–3 for previous supported boards).
> 
> Add a new compatible string "khadas,vim4-mcu".
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
> 
>  drivers/mfd/khadas-mcu.c | 118 ++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 102 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
> index ba981a7886921..d2ca7deda45c6 100644
> --- a/drivers/mfd/khadas-mcu.c
> +++ b/drivers/mfd/khadas-mcu.c
> @@ -13,6 +13,9 @@
>  #include <linux/module.h>
>  #include <linux/regmap.h>
>  
> #define KHADAS_MCU_FAN_LEVEL_MAX 3
> #define KHADAS_MCU_VIM4_FAN_LEVEL_MAX 0x64
> +
>  static bool khadas_mcu_reg_volatile(struct device *dev, unsigned int reg)
>  {
>  	if (reg >= KHADAS_MCU_USER_DATA_0_REG &&
> @@ -75,47 +78,129 @@ static const struct regmap_config khadas_mcu_regmap_config = {
>  	.cache_type	= REGCACHE_MAPLE,
>  };
>  
> -static struct mfd_cell khadas_mcu_fan_cells[] = {
> +static const struct khadas_mcu_fan_pdata khadas_mcu_fan_pdata = {
> +	.fan_reg	= KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
> +	.max_level	= KHADAS_MCU_FAN_LEVEL_MAX,
> +};
> +
> +static const struct mfd_cell khadas_mcu_fan_cells[] = {
>  	/* VIM1/2 Rev13+ and VIM3 only */
> -	{ .name = "khadas-mcu-fan-ctrl", },
> +	{
> +		.name = "khadas-mcu-fan-ctrl",
> +		.platform_data = &khadas_mcu_fan_pdata,
> +		.pdata_size = sizeof(khadas_mcu_fan_pdata),
> +	},
>  };

If you're tweaking, feel free to get more upstream creds by laying down
a prelim patch changing these to MFD_CELL_*().

> -static struct mfd_cell khadas_mcu_cells[] = {
> +static const struct mfd_cell khadas_mcu_cells[] = {
>  	{ .name = "khadas-mcu-user-mem", },
>  };
>  
> +static bool khadas_mcu_vim4_reg_volatile(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case KHADAS_MCU_PWR_OFF_CMD_REG:
> +	case KHADAS_MCU_VIM4_REST_CONF_REG:
> +	case KHADAS_MCU_WOL_INIT_START_REG:
> +	case KHADAS_MCU_VIM4_LED_ON_RAM_REG:
> +	case KHADAS_MCU_VIM4_FAN_CTRL_REG:
> +	case KHADAS_MCU_VIM4_WDT_EN_REG:
> +	case KHADAS_MCU_VIM4_SYS_RST_REG:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool khadas_mcu_vim4_reg_writeable(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case KHADAS_MCU_VERSION_0_REG:
> +	case KHADAS_MCU_VERSION_1_REG:
> +	case KHADAS_MCU_SHUTDOWN_NORMAL_STATUS_REG:
> +		return false;
> +	default:
> +		return true;
> +	}
> +}
> +
> +static const struct regmap_config khadas_mcu_vim4_regmap_config = {
> +	.reg_bits	= 8,
> +	.reg_stride	= 1,
> +	.val_bits	= 8,
> +	.max_register	= KHADAS_MCU_VIM4_SYS_RST_REG,
> +	.volatile_reg	= khadas_mcu_vim4_reg_volatile,
> +	.writeable_reg	= khadas_mcu_vim4_reg_writeable,
> +	.cache_type	= REGCACHE_MAPLE,
> +};
> +
> +static const struct khadas_mcu_fan_pdata khadas_vim4_fan_pdata = {
> +	.fan_reg	= KHADAS_MCU_VIM4_FAN_CTRL_REG,
> +	.max_level	= KHADAS_MCU_VIM4_FAN_LEVEL_MAX,
> +};
> +
> +static const struct mfd_cell khadas_mcu_vim4_cells[] = {
> +	{
> +		.name		= "khadas-mcu-fan-ctrl",
> +		.platform_data	= &khadas_vim4_fan_pdata,
> +		.pdata_size	= sizeof(khadas_vim4_fan_pdata),
> +	},
> +};
> +
>  static int khadas_mcu_probe(struct i2c_client *client)
>  {
> +	const struct mfd_cell *cells, *fan_cells;
> +	const struct regmap_config *regmap_cfg;
>  	struct device *dev = &client->dev;
> +	int ncells, nfan_cells, ret;
>  	struct khadas_mcu *ddata;
> -	int ret;
>  
>  	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
>  	if (!ddata)
>  		return -ENOMEM;
>  
> +	switch ((uintptr_t)i2c_get_match_data(client)) {

Let's pull this out of the switch():

	const void *match;

	match = i2c_get_match_data(client);
	if (!match)
		return -ENODEV;

This would separate the declaration from the potentially failing
function call and prevent implicitly matching 'KHADAS_MCU_GENERIC' (if
its value is 0) should the lookup fail.

> +	case KHADAS_MCU_GENERIC:
> +		regmap_cfg	= &khadas_mcu_regmap_config;
> +		cells		= khadas_mcu_cells;
> +		ncells		= ARRAY_SIZE(khadas_mcu_cells);
> +		fan_cells	= khadas_mcu_fan_cells;
> +		nfan_cells	= ARRAY_SIZE(khadas_mcu_fan_cells);
> +		break;
> +	case KHADAS_MCU_VIM4:
> +		regmap_cfg	= &khadas_mcu_vim4_regmap_config;
> +		cells		= NULL;
> +		ncells		= 0;
> +		fan_cells	= khadas_mcu_vim4_cells;
> +		nfan_cells	= ARRAY_SIZE(khadas_mcu_vim4_cells);
> +		break;
> +	default:
> +		return -ENODEV;
> +	}
> +
>  	i2c_set_clientdata(client, ddata);
>  
>  	ddata->dev = dev;
>  
> -	ddata->regmap = devm_regmap_init_i2c(client, &khadas_mcu_regmap_config);
> +	ddata->regmap = devm_regmap_init_i2c(client, regmap_cfg);
>  	if (IS_ERR(ddata->regmap)) {
>  		ret = PTR_ERR(ddata->regmap);
> -		dev_err(dev, "Failed to allocate register map: %d\n", ret);
> -		return ret;
> +		return dev_err_probe(dev, ret, "Failed to allocate register map\n");
>  	}
>  
> -	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
> -				   khadas_mcu_cells,
> -				   ARRAY_SIZE(khadas_mcu_cells),
> -				   NULL, 0, NULL);
> -	if (ret)
> -		return ret;
> +	if (cells && ncells) {
> +		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
> +					   cells,
> +					   ncells,
> +					   NULL, 0, NULL);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	if (of_property_present(dev->of_node, "#cooling-cells"))
>  		return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
> -					    khadas_mcu_fan_cells,
> -					    ARRAY_SIZE(khadas_mcu_fan_cells),
> +					    fan_cells,
> +					    nfan_cells,
>  					    NULL, 0, NULL);
>  
>  	return 0;
> @@ -123,7 +208,8 @@ static int khadas_mcu_probe(struct i2c_client *client)
>  
>  #ifdef CONFIG_OF
>  static const struct of_device_id khadas_mcu_of_match[] = {
> -	{ .compatible = "khadas,mcu", },
> +	{ .compatible = "khadas,mcu", .data = (void *)KHADAS_MCU_GENERIC },
> +	{ .compatible = "khadas,vim4-mcu", .data = (void *)KHADAS_MCU_VIM4 },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, khadas_mcu_of_match);
> 
> -- 
> 2.49.0
> 
> 

-- 
Lee Jones

