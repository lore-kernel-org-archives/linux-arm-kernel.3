Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B6AC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 15:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ekxEvpWuS4igVbh6hI/u8pSgKuhpUkBiZlEGiziAPKA=; b=jEEc3w/94wk+lZRREVLcR5w9Iq
	3HEiFqsGW/j2AW1s9O3pe0+x+T2UwEEl+FTQ5Xx0a8IuO2O8xrYpl7hbRMYq+Kf8uiEMoKjAJlqfz
	hMtlKykkqobJpdxYJsBVxyQG0tQZGzkrh5qSytAmzqGMu4fHrT+E1OCmlMT7AQOBzPtWuCXrO7Q+M
	wFx8La1HJOar52IrLLdDrdYQ65qbyyzETPu2vPvNpJSbJaEvs/qHjn8iMYc5D4o3kxL0qNQdfUW6a
	cn9OVThyJ8kEa88a1RTCXcxrcL+2RAVmeNr1yNHghXP+6odOVoeAYI5V0yAVHDpwkTy2r5dsAH1Ln
	CU3V6Sng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7hu-00000001QDn-0nw6;
	Thu, 22 May 2025 15:19:42 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7Hs-00000001KUU-1xHe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:52:49 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso63729715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 07:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925567; x=1748530367; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekxEvpWuS4igVbh6hI/u8pSgKuhpUkBiZlEGiziAPKA=;
        b=BPdtiUd4iOAqzKCEnz3hTn39jdwDx6LVMmv7x13jcyfkkBHgz2e8odbmC5hQ2lLxzB
         GoNWlMR2SbvKviY6p9AtFL8R0yiOYl7nS+h7+5swDl9G8JieA4mU8qUaSITCMIX8PRty
         CS/w44LDhl5lcEF2HezRf/SWlNYg7QA1RrHhmNwLvUStU+R6/hLqqX8Te/CrQ2yZSLjV
         PXM/0lUhRRbxaJzevbVfCX+kTaev0IyX0nVsUo5QHkRLy0WtbquOiBMs5YBCrLSQMXET
         iJA8ZN7tSjyJXXgPGR3iHZ47EdGTEIYt/j8icRU4bm1mnOrMDlScJCI2gi/qligv7TyF
         9Hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925567; x=1748530367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekxEvpWuS4igVbh6hI/u8pSgKuhpUkBiZlEGiziAPKA=;
        b=sxBw5Fhy2AlTNPjXxgyGqFVCYpzlXIAEInpbh9DExaimFRF5cPVBfdpGjkVjb8rf0u
         wdLy5Pdk0snJKqvIsUsbllRFYMAnFO7aXNVPigbC26uefRMVgcNm18HUeUrKStg8+lVJ
         vxxQzbIABCfLx7aWqiaCU7+6yJPWrUrRjKUiiMfuoEJ47XKykh7pzG3ETc0HLI5aJtN3
         +x1RjZJe75p7occ1r77Zvwxz7tCGYRsX+6YBZbyVNNPJOdXtcthnTgxcsSXC1qkIKRyq
         myZfwXCudLUA9U94p5DHQ5qAn+9lkJIlcwEtZkaFx7oHqeRraB9CwNeEnQvwvNbv1FfN
         Bhtw==
X-Forwarded-Encrypted: i=1; AJvYcCWUUzXLtFKIcA6wFu4GnGvDe5/+l6/xj4oa2fVzFd7cY4lHWAsnP1WYFv36uQzWivkeFyo9hclzXic8z3+5kjL4@lists.infradead.org
X-Gm-Message-State: AOJu0YwoePsSx4CIF1/EdE6hAOXPWCrDuwajUaMkscOE+oH1gj78IS3b
	4JiCPz+dTf5HXS/KgBsTenvp0E1uZHqwEPTGFINt19z30bjJKQIMbvBpCUhJp1u6mBc=
X-Gm-Gg: ASbGncsarhfoAf/RpGPy8jgPUX4N+lgJ0H+oQRm2zXZjbUmT/AzNHXT5YAJ/IZ9/c5K
	rcqklLhNBTRsaxD4yO+OUOHtkCcK2yPYr456VIcMj1OIZZbd4fSuzT+HStSsIcasRJ2nZn2PwNJ
	li/ju0BhxlSGLI5I0aANWujmP7hGDXlWb1ZVY5g60DKd3DBUN7ejURVpDJQG/5NGxyudZbThwuv
	m/4dhDw2yH9lgux0Nt0QgDsj0AEkQeC08ZGDwgwuBsOcwzm4axCOKQ0yXUpDOyG77TGDm7biiig
	vTPYutUZqd/8WAQthpczRQUjIHPSdEXqvIv637CYMgP7QPB+GPDJziESKJtu
X-Google-Smtp-Source: AGHT+IEjdoLRI1UrwQMZZYK9VyQtOn7WHlwOVEzQNmbeaE/Kx2oQJzrZySZ4Otg4xaleKcsb0UIPug==
X-Received: by 2002:a05:600c:3e84:b0:442:e9eb:1b48 with SMTP id 5b1f17b1804b1-442ff029b73mr227361635e9.24.1747925566943;
        Thu, 22 May 2025 07:52:46 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:46 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:34 +0100
Subject: [PATCH v2 05/14] spi: spi-fsl-dspi: Define regmaps per device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-5-bea884630cfb@linaro.org>
References: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
In-Reply-To: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chao Fu <B44548@freescale.com>, 
 Xiubo Li <Li.Xiubo@freescale.com>, Lukasz Majewski <lukma@denx.de>, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_075248_517089_1AD9B8A3 
X-CRM114-Status: GOOD (  16.73  )
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

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 136 ++++++++++++++++++++++++---------------------
 1 file changed, 74 insertions(+), 62 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 09b2b25ed274..437a8db9fa2b 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -122,6 +122,7 @@ struct fsl_dspi_devtype_data {
 	enum dspi_trans_mode	trans_mode;
 	u8			max_clock_factor;
 	int			fifo_size;
+	const struct regmap_config *regmap;
 };
 
 enum {
@@ -137,60 +138,130 @@ enum {
 	VF610,
 };
 
+static const struct regmap_range dspi_yes_ranges[] = {
+	regmap_reg_range(SPI_MCR, SPI_MCR),
+	regmap_reg_range(SPI_TCR, SPI_CTAR(3)),
+	regmap_reg_range(SPI_SR, SPI_TXFR3),
+	regmap_reg_range(SPI_RXFR0, SPI_RXFR3),
+	regmap_reg_range(SPI_CTARE(0), SPI_CTARE(3)),
+	regmap_reg_range(SPI_SREX, SPI_SREX),
+};
+
+static const struct regmap_access_table dspi_access_table = {
+	.yes_ranges	= dspi_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(dspi_yes_ranges),
+};
+
+static const struct regmap_range dspi_volatile_ranges[] = {
+	regmap_reg_range(SPI_MCR, SPI_TCR),
+	regmap_reg_range(SPI_SR, SPI_SR),
+	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
+	regmap_reg_range(SPI_SREX, SPI_SREX),
+};
+
+static const struct regmap_access_table dspi_volatile_table = {
+	.yes_ranges	= dspi_volatile_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(dspi_volatile_ranges),
+};
+
+enum {
+	DSPI_REGMAP,
+	DSPI_XSPI_REGMAP,
+	DSPI_PUSHR,
+};
+
+static const struct regmap_config dspi_regmap_config[] = {
+	[DSPI_REGMAP] = {
+		.reg_bits	= 32,
+		.val_bits	= 32,
+		.reg_stride	= 4,
+		.max_register	= SPI_RXFR3,
+		.volatile_table	= &dspi_volatile_table,
+		.rd_table	= &dspi_access_table,
+		.wr_table	= &dspi_access_table,
+	},
+	[DSPI_XSPI_REGMAP] = {
+		.reg_bits	= 32,
+		.val_bits	= 32,
+		.reg_stride	= 4,
+		.max_register	= SPI_SREX,
+		.volatile_table	= &dspi_volatile_table,
+		.rd_table	= &dspi_access_table,
+		.wr_table	= &dspi_access_table,
+	},
+	[DSPI_PUSHR] = {
+		.name		= "pushr",
+		.reg_bits	= 16,
+		.val_bits	= 16,
+		.reg_stride	= 2,
+		.max_register	= 0x2,
+	},
+};
+
 static const struct fsl_dspi_devtype_data devtype_data[] = {
 	[VF610] = {
 		.trans_mode		= DSPI_DMA_MODE,
 		.max_clock_factor	= 2,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_REGMAP],
 	},
 	[LS1021A] = {
 		/* Has A-011218 DMA erratum */
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP],
 	},
 	[LS1012A] = {
 		/* Has A-011218 DMA erratum */
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 16,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP],
 	},
 	[LS1028A] = {
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP],
 	},
 	[LS1043A] = {
 		/* Has A-011218 DMA erratum */
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 16,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP],
 	},
 	[LS1046A] = {
 		/* Has A-011218 DMA erratum */
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 16,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP],
 	},
 	[LS2080A] = {
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP],
 	},
 	[LS2085A] = {
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP],
 	},
 	[LX2160A] = {
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP],
 	},
 	[MCF5441X] = {
 		.trans_mode		= DSPI_DMA_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 16,
+		.regmap			= &dspi_regmap_config[DSPI_REGMAP],
 	},
 };
 
@@ -1191,61 +1262,6 @@ static int dspi_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(dspi_pm, dspi_suspend, dspi_resume);
 
-static const struct regmap_range dspi_yes_ranges[] = {
-	regmap_reg_range(SPI_MCR, SPI_MCR),
-	regmap_reg_range(SPI_TCR, SPI_CTAR(3)),
-	regmap_reg_range(SPI_SR, SPI_TXFR3),
-	regmap_reg_range(SPI_RXFR0, SPI_RXFR3),
-	regmap_reg_range(SPI_CTARE(0), SPI_CTARE(3)),
-	regmap_reg_range(SPI_SREX, SPI_SREX),
-};
-
-static const struct regmap_access_table dspi_access_table = {
-	.yes_ranges	= dspi_yes_ranges,
-	.n_yes_ranges	= ARRAY_SIZE(dspi_yes_ranges),
-};
-
-static const struct regmap_range dspi_volatile_ranges[] = {
-	regmap_reg_range(SPI_MCR, SPI_TCR),
-	regmap_reg_range(SPI_SR, SPI_SR),
-	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
-	regmap_reg_range(SPI_SREX, SPI_SREX),
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
-	.max_register	= SPI_RXFR3,
-	.volatile_table	= &dspi_volatile_table,
-	.rd_table	= &dspi_access_table,
-	.wr_table	= &dspi_access_table,
-};
-
-static const struct regmap_config dspi_xspi_regmap_config[] = {
-	{
-		.reg_bits	= 32,
-		.val_bits	= 32,
-		.reg_stride	= 4,
-		.max_register	= SPI_SREX,
-		.volatile_table	= &dspi_volatile_table,
-		.rd_table	= &dspi_access_table,
-		.wr_table	= &dspi_access_table,
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
@@ -1305,7 +1321,6 @@ static int dspi_target_abort(struct spi_controller *host)
 static int dspi_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	const struct regmap_config *regmap_config;
 	struct fsl_dspi_platform_data *pdata;
 	struct spi_controller *ctlr;
 	int ret, cs_num, bus_num = -1;
@@ -1388,11 +1403,8 @@ static int dspi_probe(struct platform_device *pdev)
 		goto out_ctlr_put;
 	}
 
-	if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE)
-		regmap_config = &dspi_xspi_regmap_config[0];
-	else
-		regmap_config = &dspi_regmap_config;
-	dspi->regmap = devm_regmap_init_mmio(&pdev->dev, base, regmap_config);
+	dspi->regmap = devm_regmap_init_mmio(&pdev->dev, base,
+					     dspi->devtype_data->regmap);
 	if (IS_ERR(dspi->regmap)) {
 		dev_err(&pdev->dev, "failed to init regmap: %ld\n",
 				PTR_ERR(dspi->regmap));
@@ -1403,7 +1415,7 @@ static int dspi_probe(struct platform_device *pdev)
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


