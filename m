Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C09AC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 11:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUoeaJOnz98LhxzrB2OQnuTIO89rQsZt/lwrASJetuQ=; b=Gg5298k8cIX4lIWluNkC+4fb8g
	h39UsrmwMIiODnvd1mgJggXpXq8oPfO4B/piKz9dF0cYIZU69ipQHyYFj6xWE/EC3CoQvx/gAVmpF
	9xG0027XKM8sYZivBKOtkoGc/1JSK61m62cWyFDURyEXcU+okU1k8NB+yIGUk2tKu9nX6q+ky/UTj
	wxcXnFKG1Zksl1Ir7wVLoeAXSlobSxgcMVIi2XDGCmSboZd8UgVd3WhbZyD1nDmmRNdAKsOBRV8zP
	LQqf80ylYwG+Xti0IR4L2OOZtcyhGOCp4oR139qhDDTRWM/pAMhrCpl4s+UdlGzYqIMyV2ihyvZ5c
	7LkH5FKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMIL-00000003UwZ-21PG;
	Fri, 09 May 2025 11:53:37 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLZB-00000003NZe-14Cx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:07:00 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a0b9303998so977730f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788816; x=1747393616; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUoeaJOnz98LhxzrB2OQnuTIO89rQsZt/lwrASJetuQ=;
        b=pAZfhfleDVY7TGP33YLfMBKx7d7Lh5HKOBLwe3vs8N68Aahdciy44NAofMhXHYGZRb
         +oynsqb2yTpvSS6et/XgOP3OPoEsrcZkpZraT21DUhXbX0w65XLtbIXH/NPwDMzhAn/I
         hD+vNFPMyjrcZim8p7o3jiIps/XkjPOS+B5gnzv2EsHTSZRxWRNG6nFwN7TFWzNcU5ZZ
         LgHqaViulQplsnFz3vbfAu4/K79I+omk9CI9CssNLJiCVrMUHqXtP6NqHgyaWd0owb6o
         mGvj73dBHzoa7YO18G3xm/rnEtAcxZaLU9s3xkwzksqsplVMKxN1xjYcebRzYAX+SZKB
         +IHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788816; x=1747393616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUoeaJOnz98LhxzrB2OQnuTIO89rQsZt/lwrASJetuQ=;
        b=Zf5J5Fz+BrnJVXq+Ie681Dx7jef5vryDdO644p7jpS0DjEO2rSelPmOiSs5OYtNpUN
         vbSxmt4OSh0Rs1RhOZHYb7o9taGI+iyds+PGHc74DsyK/nNNzG28axVJl2man9oj/nXt
         wCvWIq9Wd1Hxq7EqjSYMKGbbPUJiu6+mdA0h/Msk9rb2IirOVuVy2NYypffc4s+UOI5v
         UFZVEQi7ko9/XXXxgD4DSPXFiKwDhsQz8mnCdto/vzlt8l8a1c3nVTdRt+BYq9oSZh8g
         lpuItIgWm1gKxGQjyNNiqn+AFiiR/plxn+SSR1fMVe1RGjP1m+KaCUvlHY0bkloGpSmo
         fR0A==
X-Forwarded-Encrypted: i=1; AJvYcCUbQb1lxbUpja1YYsUplpRCExLbHHsh7fQXGrmzH2WQ70lG4VhFEbFKbCZpxzKLRfsDTsCUQAmBDF0PZGNT1b1I@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2AYMdKlra1Dp9qtrvl0imzQDh8tWZqNDzqF7EFft0tDZuItqW
	a+5SZjfyAJzFLkwCaIBM4TVdQ1uOuFZeJn9DlVn0d9FLIi9yQ3wbruYg2RNkvxx+p8qJ8rJpo4r
	w2Ok=
X-Gm-Gg: ASbGnct3Dk5kmyF8cDqof09IxGjR44jpq6WGFCka0mHTDfp6bimIMrhfs6ypfFHTioP
	/7q7HesCVTlJfWsS1eGkWmtEnoiI7Txo6Qzh++nua1+iuBBiZcZJhWc5XexZrfxxOLx/PPwhXSx
	oFaKR6HfMAj3n35l63QwX1DvGtHHPtrNiWGZvfizFOB5qfVu0wFnxSFTKv/kov/g6hFpk489uHM
	QGxz0Fk8s6bRxPaz2iPnZLWUXtuZWjrtur3DIHoBU4RBi/Jga7AK/yywNaT2I80uPWbFgO5UHDe
	Xqiyx+utIbcNRQUbU822taJ/RckuqyNlBjDh+vqh2n96A10=
X-Google-Smtp-Source: AGHT+IFJQRyVMr2U93vokfpSUulnWLDfNfE0bAch8J9y68HcjUDSO608e30Saz1ZNqv66Dvdty+TYw==
X-Received: by 2002:a05:6000:2ab:b0:39f:c05:c220 with SMTP id ffacd0b85a97d-3a0b9941e27mr6449970f8f.22.1746788815916;
        Fri, 09 May 2025 04:06:55 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:06:55 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:48 +0100
Subject: [PATCH 01/14] spi: spi-fsl-dspi: Define regmaps per device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-1-32bfcd2fea11@linaro.org>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
In-Reply-To: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org, 
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_040657_321207_F1A82DC9 
X-CRM114-Status: GOOD (  16.44  )
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

Refactor the regmaps so they can be defined per device rather than
programmatically. This will allow us to add two new regmaps for S32G in
a later commit.

No functional changes.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 121 ++++++++++++++++++++++++---------------------
 1 file changed, 66 insertions(+), 55 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 067c954cb6ea..31ea8ce81e98 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -121,6 +121,7 @@ struct fsl_dspi_devtype_data {
 	enum dspi_trans_mode	trans_mode;
 	u8			max_clock_factor;
 	int			fifo_size;
+	const struct regmap_config *regmap;
 };
 
 enum {
@@ -136,60 +137,123 @@ enum {
 	VF610,
 };
 
+static const struct regmap_range dspi_volatile_ranges[] = {
+	regmap_reg_range(SPI_MCR, SPI_TCR),
+	regmap_reg_range(SPI_SR, SPI_SR),
+	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
+};
+
+static const struct regmap_access_table dspi_volatile_table = {
+	.yes_ranges	= dspi_volatile_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(dspi_volatile_ranges),
+};
+
+static const struct regmap_range dspi_xspi_volatile_ranges[] = {
+	regmap_reg_range(SPI_MCR, SPI_TCR),
+	regmap_reg_range(SPI_SR, SPI_SR),
+	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
+	regmap_reg_range(SPI_SREX, SPI_SREX),
+};
+
+static const struct regmap_access_table dspi_xspi_volatile_table = {
+	.yes_ranges	= dspi_xspi_volatile_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(dspi_xspi_volatile_ranges),
+};
+
+enum {
+	DSPI_REGMAP,
+	DSPI_XSPI_REGMAP,
+	DSPI_PUSHR
+};
+
+static const struct regmap_config dspi_regmap_config[] = {
+	[DSPI_REGMAP] = {
+		.reg_bits	= 32,
+		.val_bits	= 32,
+		.reg_stride	= 4,
+		.max_register	= 0x88,
+		.volatile_table	= &dspi_volatile_table
+	},
+	[DSPI_XSPI_REGMAP] = {
+		.reg_bits	= 32,
+		.val_bits	= 32,
+		.reg_stride	= 4,
+		.max_register	= 0x13c,
+		.volatile_table	= &dspi_xspi_volatile_table
+	},
+	[DSPI_PUSHR] = {
+		.name		= "pushr",
+		.reg_bits	= 16,
+		.val_bits	= 16,
+		.reg_stride	= 2,
+		.max_register	= 0x2
+	}
+};
+
 static const struct fsl_dspi_devtype_data devtype_data[] = {
 	[VF610] = {
 		.trans_mode		= DSPI_DMA_MODE,
 		.max_clock_factor	= 2,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_REGMAP]
 	},
 	[LS1021A] = {
 		/* Has A-011218 DMA erratum */
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
 	},
 	[LS1012A] = {
 		/* Has A-011218 DMA erratum */
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 16,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
 	},
 	[LS1028A] = {
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
 	},
 	[LS1043A] = {
 		/* Has A-011218 DMA erratum */
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 16,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
 	},
 	[LS1046A] = {
 		/* Has A-011218 DMA erratum */
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 16,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
 	},
 	[LS2080A] = {
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
 	},
 	[LS2085A] = {
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
 	},
 	[LX2160A] = {
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
 	},
 	[MCF5441X] = {
 		.trans_mode		= DSPI_DMA_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 16,
+		.regmap			= &dspi_regmap_config[DSPI_REGMAP]
 	},
 };
 
@@ -1167,54 +1231,6 @@ static int dspi_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(dspi_pm, dspi_suspend, dspi_resume);
 
-static const struct regmap_range dspi_volatile_ranges[] = {
-	regmap_reg_range(SPI_MCR, SPI_TCR),
-	regmap_reg_range(SPI_SR, SPI_SR),
-	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
-};
-
-static const struct regmap_access_table dspi_volatile_table = {
-	.yes_ranges	= dspi_volatile_ranges,
-	.n_yes_ranges	= ARRAY_SIZE(dspi_volatile_ranges),
-};
-
-static const struct regmap_config dspi_regmap_config = {
-	.reg_bits	= 32,
-	.val_bits	= 32,
-	.reg_stride	= 4,
-	.max_register	= 0x88,
-	.volatile_table	= &dspi_volatile_table,
-};
-
-static const struct regmap_range dspi_xspi_volatile_ranges[] = {
-	regmap_reg_range(SPI_MCR, SPI_TCR),
-	regmap_reg_range(SPI_SR, SPI_SR),
-	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
-	regmap_reg_range(SPI_SREX, SPI_SREX),
-};
-
-static const struct regmap_access_table dspi_xspi_volatile_table = {
-	.yes_ranges	= dspi_xspi_volatile_ranges,
-	.n_yes_ranges	= ARRAY_SIZE(dspi_xspi_volatile_ranges),
-};
-
-static const struct regmap_config dspi_xspi_regmap_config[] = {
-	{
-		.reg_bits	= 32,
-		.val_bits	= 32,
-		.reg_stride	= 4,
-		.max_register	= 0x13c,
-		.volatile_table	= &dspi_xspi_volatile_table,
-	},
-	{
-		.name		= "pushr",
-		.reg_bits	= 16,
-		.val_bits	= 16,
-		.reg_stride	= 2,
-		.max_register	= 0x2,
-	},
-};
-
 static int dspi_init(struct fsl_dspi *dspi)
 {
 	unsigned int mcr;
@@ -1272,7 +1288,6 @@ static int dspi_target_abort(struct spi_controller *host)
 static int dspi_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	const struct regmap_config *regmap_config;
 	struct fsl_dspi_platform_data *pdata;
 	struct spi_controller *ctlr;
 	int ret, cs_num, bus_num = -1;
@@ -1355,11 +1370,7 @@ static int dspi_probe(struct platform_device *pdev)
 		goto out_ctlr_put;
 	}
 
-	if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE)
-		regmap_config = &dspi_xspi_regmap_config[0];
-	else
-		regmap_config = &dspi_regmap_config;
-	dspi->regmap = devm_regmap_init_mmio(&pdev->dev, base, regmap_config);
+	dspi->regmap = devm_regmap_init_mmio(&pdev->dev, base, dspi->devtype_data->regmap);
 	if (IS_ERR(dspi->regmap)) {
 		dev_err(&pdev->dev, "failed to init regmap: %ld\n",
 				PTR_ERR(dspi->regmap));
@@ -1370,7 +1381,7 @@ static int dspi_probe(struct platform_device *pdev)
 	if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE) {
 		dspi->regmap_pushr = devm_regmap_init_mmio(
 			&pdev->dev, base + SPI_PUSHR,
-			&dspi_xspi_regmap_config[1]);
+			&dspi_regmap_config[DSPI_PUSHR]);
 		if (IS_ERR(dspi->regmap_pushr)) {
 			dev_err(&pdev->dev,
 				"failed to init pushr regmap: %ld\n",

-- 
2.34.1


