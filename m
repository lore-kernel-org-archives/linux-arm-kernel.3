Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC07C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3GA3VBxYsAdWyRrkEkHQX1wHmh0RFEv+jCHyRHk2lUc=; b=vWPoTtMqlqjPm1LoEiONeKbskR
	aejviYdOFHUA4zHfPNhoxf/YKU0cfa+rs2JckdEtLOqyO7CryjDfN1Id5iepWnDjOJQWoeV9HnjEh
	ApAKq0ISIUlgWGsqYxQ1z/nGpAP7j0LVCcfzXoV99rff9XDaXOwM+OLbIBzkctzZNC0chGKibrYTA
	iaGzj/SsV56Aan/w95mT4lUMsZ/xApwOVCG8tmjuAyFfQkQ38EpJLNF9ZzuhtYaEfCyxFFMF3jAiL
	sDj92UgjqYY3FIZXVOZ2S2a7Olyh2JrRQRxdpReQy6KNNdC0OpRvD+HyHM2YJKsKkvKi0scEamFpp
	qKu8PCGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ff9-0000000EcPy-2hfX;
	Thu, 10 Sep 2026 14:22:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ff8-0000000EcPa-1zoa;
	Thu, 10 Sep 2026 14:22:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B4EC160202;
	Thu, 10 Sep 2026 14:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57EE01F000FF;
	Thu, 10 Sep 2026 14:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789050121;
	bh=3GA3VBxYsAdWyRrkEkHQX1wHmh0RFEv+jCHyRHk2lUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M6lEFhFPI0HqQqh792hXfyIkouPRsBrvGOM6hkXa66AA677QkuX2dHr6P+t34qQm5
	 gMHY95utCfz1PBOzanOh0qDkC/v/bMl89U2GBjqIE55miQ4pQB0l+98q7ixVEqFhsL
	 zI3y/2ICZCEBB2rYWThHLp+NfJOOCoNorYDnVYm66lzIKUWj954ueuNG+UJhwrYxuL
	 BgzI77gCw83JDYl/UNeSmwJQ9IQ4GsDrDPC00Y8ooN9nQwZQxVuBwSm3v8P9T+CO8H
	 tnZoz6jchdxj5iYBQDncU1lA7TvhLBApCUNq+onWVA1t+nbczLh7Wx0boSg0Qe5R97
	 WRHqBg1N6A2hg==
Date: Thu, 10 Sep 2026 15:21:53 +0100
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
	linux-pm@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v11 3/6] mfd: khadas-mcu: Add support for VIM4 MCU variant
Message-ID: <20260910142153.GF1051768@google.com>
References: <20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr>
 <20260902-add-mcu-fan-khadas-vim4-v11-3-5f1610d83bf0@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902-add-mcu-fan-khadas-vim4-v11-3-5f1610d83bf0@aliel.fr>
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

On Wed, 02 Sep 2026, Ronald Claveau via B4 Relay wrote:

> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Refactor probe() to use per-variant values
> instead of hardcoded globals.
> 
> Add dedicated regmap configuration for the VIM4 MCU,
> with its own volatile/writeable registers.
> 
> Introduce struct khadas_mcu_fan_pdata to pass the fan
> control register and duty-cycle levels per variant.
> VIM4 uses a different register and level set (0-100)
>  declared as a list (0, 30, 40, 55, 75, 100) compared
>  to previous boards (0-3).
> 
> Add a new compatible string "khadas,vim4-mcu".
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Generally fine.

> ---
>  drivers/mfd/khadas-mcu.c | 120 +++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 106 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
> index 0e74efe14f367..4cb305ac915e1 100644
> --- a/drivers/mfd/khadas-mcu.c
> +++ b/drivers/mfd/khadas-mcu.c
> @@ -75,47 +75,138 @@ static const struct regmap_config khadas_mcu_regmap_config = {
>  	.cache_type	= REGCACHE_MAPLE,
>  };
>  
> +static const unsigned int khadas_mcu_fan_levels[] = {
> +	0, 1, 2, 3,
> +};
> +
> +static const struct khadas_mcu_fan_pdata khadas_mcu_fan_pdata = {
> +	.fan_reg	= KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
> +	.levels		= khadas_mcu_fan_levels,
> +	.nlevels	= ARRAY_SIZE(khadas_mcu_fan_levels),
> +};

I still don't think these belong in here.

>  static const struct mfd_cell khadas_mcu_fan_cells[] = {
>  	/* VIM1/2 Rev13+ and VIM3 only */
> -	MFD_CELL_NAME("khadas-mcu-fan-ctrl"),
> +	MFD_CELL_BASIC("khadas-mcu-fan-ctrl", NULL, &khadas_mcu_fan_pdata,
> +		       sizeof(khadas_mcu_fan_pdata), 0),
>  };
>  
>  static const struct mfd_cell khadas_mcu_cells[] = {
>  	MFD_CELL_NAME("khadas-mcu-user-mem"),
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
> +static const unsigned int khadas_mcu_vim4_fan_levels[] = {
> +	0, 30, 40, 55, 75, 100,
> +};
> +
> +static const struct khadas_mcu_fan_pdata khadas_mcu_vim4_fan_pdata = {
> +	.fan_reg	= KHADAS_MCU_VIM4_FAN_CTRL_REG,
> +	.levels		= khadas_mcu_vim4_fan_levels,
> +	.nlevels	= ARRAY_SIZE(khadas_mcu_vim4_fan_levels),
> +};
> +
> +static const struct mfd_cell khadas_mcu_vim4_fan_cells[] = {
> +	MFD_CELL_BASIC("khadas-mcu-fan-ctrl", NULL, &khadas_mcu_vim4_fan_pdata,
> +		       sizeof(khadas_mcu_vim4_fan_pdata), 0),
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
> +	const void *match;
>  
>  	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
>  	if (!ddata)
>  		return -ENOMEM;
>  
> +	match = i2c_get_match_data(client);

The nomenclature can be improved here.

What are these?  Device ID?  Chip ID?  Revision?

> +	if (!match)
> +		return -ENODEV;
> +
> +	switch ((uintptr_t)match) {
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
> +		fan_cells	= khadas_mcu_vim4_fan_cells;
> +		nfan_cells	= ARRAY_SIZE(khadas_mcu_vim4_fan_cells);
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
> @@ -123,7 +214,8 @@ static int khadas_mcu_probe(struct i2c_client *client)
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

