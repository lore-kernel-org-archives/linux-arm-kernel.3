Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0921BC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 18:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pX1Xn48JWPNWwoKS70iDCarEMhnhyPor/kZZ40HpF8o=; b=4SsGU2XKv/1+0/5Ka00JnuXTNu
	dHDcR6vDStjslOLah9NAzylV+LdiPbNOowsCWxBckknySQgC1nZm9UFyDQ8TthMZo+R46wTbYEC9I
	mde6PY7SQSaNKOD95tf/WdwAubYq8TpKcR8KFYlbOrSYbzfSQKqjV3NYcPT1FsTX5cGESo35bWjbF
	iTetWx9XcyQ7tkoETNGBG/ctrMcMX8SD0HgCK/cXXhmqw8//6wgNNKNN/RSDHjJm4vTl1xJDa0z2E
	jjE0oCCBJT/mjL6DMrIl5udXOina2AbwjAMSjh3OBgomQ04OHLoZjDBAfAEMFSyq5Ek7bkQm0oOux
	Ay85oSgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSGX-00000004Y2R-3pp4;
	Fri, 09 May 2025 18:16:09 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQDL-00000004CyZ-31II
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 16:04:44 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac79fa6e1c2so42225366b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746806681; x=1747411481; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pX1Xn48JWPNWwoKS70iDCarEMhnhyPor/kZZ40HpF8o=;
        b=Jk2mlVHqbbq9VFlGU1/rExwjtpSWh7JQXBT/FnOXnCWULWwnR1Gx1SF9lEkqqgJYD/
         9EoDTkYJK9n6ZigB0Hasgb10lcPcLM2Iul58MXS6Fzam1YJEe6q/eSK4Aoalm9+Dod7b
         NP7n7yLsBhPOgo6uJpIWQh/Bbd2+4H8KnTGYGh0g/JhPMtksh5pY3pcDLV/reiy8xzEI
         rMvhZ1AeSb7oSOrVHCdLUWByN+EYx1qyfhzTk/4mwC9UjyoeXZVr0m/wuU6YSQKdkkLC
         rJ8okbfrnhQO6dZ4vmEXHn7Pwvf/9BEHSDED/WPc8txhD3RkS4lnPmsncmVkvX8ogtCU
         0ZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746806681; x=1747411481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pX1Xn48JWPNWwoKS70iDCarEMhnhyPor/kZZ40HpF8o=;
        b=KuBPMqWHtEAhxajSgQuAuVXrOByN1eftNgJ6AdUY4YWiORKSqN0f+Zyze9735pCctm
         ms0w58OVcexCWE5KbzpFw45UDm6rkb529oHazBGYfzsWY2X8Q1pQnF1va1tdqrpRC+b4
         yKkS4UpRm3WAsgGKoR1IFG2jyTZhajBUzLxCwrW9B4ASCtZ4PsU2YaFWqM4giaUkgFL3
         t0vE7UqbtpYZLjmHGNr+L/C1/wd9yBD28ZSXkoqubLQqgbA3K0knfm2Ihl/TlOV5BjvE
         zj3BwNuDlvvEyXjb8ezIj1j2xfxudYs+CnzZMMVPCrcgMKuVbD4guRYbmJfqACCf5Q1K
         L0Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWHojS3PpQpgAJc+5MgRTpKkoyXbr/D0fQCpvaYzTT8d7cUCDclCpG0UNxnupeCHCyF4G8ZuULN4no1UPTtm3kX@lists.infradead.org
X-Gm-Message-State: AOJu0YwO55dYomwJeax/GyvZhhYhW1CmKVJEYg5Gg71GKOK86w7y8fLH
	Ge09uVklz1DdJaK5u6x3LrmehbAeHFiM04KoKvoDBVKswxjteKjP
X-Gm-Gg: ASbGncs8ppmhxS9XhSC7H8HpITUU8JADb/QdnQjZt/RyS8kpORDv5ynUKwfUVzGEBDf
	o08DM/oPMAWrxzjEqKJbXL1WUlDoeM7+Svq/2cCV6P0SONu6cgjmsYBjjJIzYooz1qxryMuXnmS
	lskhPtO8SrNQAX3l8YsCcztUud/SzTJ+f0xa9T5rphkVceu5epWhsPhYzAtQ927qUrMBjZ9J6ZD
	pVMdSKpy2mY4uxvwctv5S1JoznpOFZjnBAwhnhVidzWoOSuE4XLhCQLPidhxsXHsrWG2lm4UZCN
	unldIOR5zDmgT1h/4H2tPIfB0Ro7
X-Google-Smtp-Source: AGHT+IF3sn8zNRPNDYSOtNhbc70HEDVqm9+kB+9U0d1DvOs91XcZhkaM1rCdhEtleM44NPXP0GTkbA==
X-Received: by 2002:a17:907:75f2:b0:ad2:2493:8361 with SMTP id a640c23a62f3a-ad2249383e7mr65020566b.11.1746806680433;
        Fri, 09 May 2025 09:04:40 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8f98sm172443166b.10.2025.05.09.09.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 09:04:39 -0700 (PDT)
Date: Fri, 9 May 2025 19:04:36 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com,
	arnd@linaro.org, andrei.stefanescu@nxp.com,
	dan.carpenter@linaro.org, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/14] spi: spi-fsl-dspi: Define regmaps per device
Message-ID: <20250509160436.ohx57lp7a3w2dhog@skbuf>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-1-32bfcd2fea11@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-james-nxp-spi-v1-1-32bfcd2fea11@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_090443_761514_D8A215D8 
X-CRM114-Status: GOOD (  20.35  )
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

On Fri, May 09, 2025 at 12:05:48PM +0100, James Clark wrote:
>  static const struct fsl_dspi_devtype_data devtype_data[] = {
>  	[VF610] = {
>  		.trans_mode		= DSPI_DMA_MODE,
>  		.max_clock_factor	= 2,
>  		.fifo_size		= 4,
> +		.regmap			= &dspi_regmap_config[DSPI_REGMAP]

Comma at the end, please. Just like you didn't have to modify the
previous line to add this new assignment, so shouldn't any future
contributor. The comment applies throughout the entire patch set.

>  	},
>  	[LS1021A] = {
>  		/* Has A-011218 DMA erratum */
>  		.trans_mode		= DSPI_XSPI_MODE,
>  		.max_clock_factor	= 8,
>  		.fifo_size		= 4,
> +		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
>  	},
>  	[LS1012A] = {
>  		/* Has A-011218 DMA erratum */
>  		.trans_mode		= DSPI_XSPI_MODE,
>  		.max_clock_factor	= 8,
>  		.fifo_size		= 16,
> +		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
>  	},
>  	[LS1028A] = {
>  		.trans_mode		= DSPI_XSPI_MODE,
>  		.max_clock_factor	= 8,
>  		.fifo_size		= 4,
> +		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
>  	},
>  	[LS1043A] = {
>  		/* Has A-011218 DMA erratum */
>  		.trans_mode		= DSPI_XSPI_MODE,
>  		.max_clock_factor	= 8,
>  		.fifo_size		= 16,
> +		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
>  	},
>  	[LS1046A] = {
>  		/* Has A-011218 DMA erratum */
>  		.trans_mode		= DSPI_XSPI_MODE,
>  		.max_clock_factor	= 8,
>  		.fifo_size		= 16,
> +		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
>  	},
>  	[LS2080A] = {
>  		.trans_mode		= DSPI_XSPI_MODE,
>  		.max_clock_factor	= 8,
>  		.fifo_size		= 4,
> +		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
>  	},
>  	[LS2085A] = {
>  		.trans_mode		= DSPI_XSPI_MODE,
>  		.max_clock_factor	= 8,
>  		.fifo_size		= 4,
> +		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
>  	},
>  	[LX2160A] = {
>  		.trans_mode		= DSPI_XSPI_MODE,
>  		.max_clock_factor	= 8,
>  		.fifo_size		= 4,
> +		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
>  	},
>  	[MCF5441X] = {
>  		.trans_mode		= DSPI_DMA_MODE,
>  		.max_clock_factor	= 8,
>  		.fifo_size		= 16,
> +		.regmap			= &dspi_regmap_config[DSPI_REGMAP]
>  	},
>  };
>  
> @@ -1167,54 +1231,6 @@ static int dspi_resume(struct device *dev)
>  
>  static SIMPLE_DEV_PM_OPS(dspi_pm, dspi_suspend, dspi_resume);
>  
> -static const struct regmap_range dspi_volatile_ranges[] = {
> -	regmap_reg_range(SPI_MCR, SPI_TCR),
> -	regmap_reg_range(SPI_SR, SPI_SR),
> -	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
> -};
> -
> -static const struct regmap_access_table dspi_volatile_table = {
> -	.yes_ranges	= dspi_volatile_ranges,
> -	.n_yes_ranges	= ARRAY_SIZE(dspi_volatile_ranges),
> -};
> -
> -static const struct regmap_config dspi_regmap_config = {
> -	.reg_bits	= 32,
> -	.val_bits	= 32,
> -	.reg_stride	= 4,
> -	.max_register	= 0x88,
> -	.volatile_table	= &dspi_volatile_table,
> -};
> -
> -static const struct regmap_range dspi_xspi_volatile_ranges[] = {
> -	regmap_reg_range(SPI_MCR, SPI_TCR),
> -	regmap_reg_range(SPI_SR, SPI_SR),
> -	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
> -	regmap_reg_range(SPI_SREX, SPI_SREX),
> -};
> -
> -static const struct regmap_access_table dspi_xspi_volatile_table = {
> -	.yes_ranges	= dspi_xspi_volatile_ranges,
> -	.n_yes_ranges	= ARRAY_SIZE(dspi_xspi_volatile_ranges),
> -};
> -
> -static const struct regmap_config dspi_xspi_regmap_config[] = {
> -	{
> -		.reg_bits	= 32,
> -		.val_bits	= 32,
> -		.reg_stride	= 4,
> -		.max_register	= 0x13c,
> -		.volatile_table	= &dspi_xspi_volatile_table,
> -	},
> -	{
> -		.name		= "pushr",
> -		.reg_bits	= 16,
> -		.val_bits	= 16,
> -		.reg_stride	= 2,
> -		.max_register	= 0x2,
> -	},
> -};
> -
>  static int dspi_init(struct fsl_dspi *dspi)
>  {
>  	unsigned int mcr;
> @@ -1272,7 +1288,6 @@ static int dspi_target_abort(struct spi_controller *host)
>  static int dspi_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> -	const struct regmap_config *regmap_config;
>  	struct fsl_dspi_platform_data *pdata;
>  	struct spi_controller *ctlr;
>  	int ret, cs_num, bus_num = -1;
> @@ -1355,11 +1370,7 @@ static int dspi_probe(struct platform_device *pdev)
>  		goto out_ctlr_put;
>  	}
>  
> -	if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE)
> -		regmap_config = &dspi_xspi_regmap_config[0];
> -	else
> -		regmap_config = &dspi_regmap_config;
> -	dspi->regmap = devm_regmap_init_mmio(&pdev->dev, base, regmap_config);
> +	dspi->regmap = devm_regmap_init_mmio(&pdev->dev, base, dspi->devtype_data->regmap);

I know there are other coding conventions floating around, but for this
driver please try to stick to a limit of ~80 characters limit for lines
which don't contain strings.

>  	if (IS_ERR(dspi->regmap)) {
>  		dev_err(&pdev->dev, "failed to init regmap: %ld\n",
>  				PTR_ERR(dspi->regmap));
> @@ -1370,7 +1381,7 @@ static int dspi_probe(struct platform_device *pdev)
>  	if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE) {
>  		dspi->regmap_pushr = devm_regmap_init_mmio(
>  			&pdev->dev, base + SPI_PUSHR,
> -			&dspi_xspi_regmap_config[1]);
> +			&dspi_regmap_config[DSPI_PUSHR]);
>  		if (IS_ERR(dspi->regmap_pushr)) {
>  			dev_err(&pdev->dev,
>  				"failed to init pushr regmap: %ld\n",
> 
> -- 
> 2.34.1
> 

With the change request addressed, please add my tag and keep it in
subsequent submissions.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

