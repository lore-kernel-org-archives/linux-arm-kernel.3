Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E99C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 15:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0z6hcyVZAe0X+PJjkOMiFN3VGBYDX0qmANiIo/JWNSc=; b=EbaKbz5L5KdN2mg6S8daa49Yjz
	AJwntAEJCiL/OJ+h3sv8AXh3q9kN9dJFEmvjkFm9Cev2njIaoIUXYNTTxpC1e/8MHIiO2bCY/HoCj
	8i9ki5SN4mgEXxBv2mK9Zd1gc5vCjdrMDYlhkznqeo/bZNGq5F/kQfspA644+0D5g6RjwLc6Vvsnu
	Yp2b1RD44k/hZalFnRICHcNDmM7cVxdqOM7wzctVKemrku8RzitkABlEpCLE1GLSs4YhzUkyRdIhg
	t9w9Lfl52v+fSnopRrGVWzMEbx9aMZesftxftj2vJARHpB3tupaID9UrnaAZjx1+N435s21cHHxnW
	hPjLVq3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7jt-00000001QWh-457i;
	Thu, 22 May 2025 15:21:46 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7Hu-00000001KW1-2H07
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:52:51 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-44b1f5b917fso1396325e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 07:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925569; x=1748530369; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0z6hcyVZAe0X+PJjkOMiFN3VGBYDX0qmANiIo/JWNSc=;
        b=iyFL3yERvEbZIES8MoUh6ABpvm9kTiqAJv54YW3dxhTgio5sMz0WgufIoDoQjYcInK
         xu0G+/Tq6Ah1foe4mJsTQtyUc16BAiV3OgmYD04nmWJfyPE7cahNp7385FPRveIJ7wV0
         KAj4VULOrIyEXBaf+qXL0fQCsNhqyKd9CeB8E8AmrDOAE68n9VHjitQBeMUv6P0cTlhP
         1yozd/EqUTOMbgLMH+9rhke66ducDNIMHrbUJYO6W5Z1BHbgwKuqI7knRCjBJbhKSIcU
         B+V1FgvCQMVhz0FeLsJbCVOEAOt7KOO1tIaLU75LvuMvjFmJtsF0vOAJauS3EpsnXZ/0
         nSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925569; x=1748530369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0z6hcyVZAe0X+PJjkOMiFN3VGBYDX0qmANiIo/JWNSc=;
        b=gew6wPtO+Zi4d5Ya6rvXX/ZrP952UrJSsj1uX0E8wyfrMBbTiL1jcC1igkTq4IJurZ
         8hwiJQ5xwLOFslWFH6wM6DvASWkIAS5v8C6M6d3VA1HcRiEpEOifePahFo5Eo7AU99M+
         BL1y9/F9zSbXFWIEKEQuLV7es0u92P7Qx2JgIE8d2feJ8Ct90btsD/gFxh3bxP235Geq
         Ypw5d9N1JYmMU7uwE63OL588mTmXP4nNdLG2etmLx76zk5EQzs+9BVY/hJqv2oroAKgx
         6QhGVpONAi/Za5L0j8S47aEVeXMZy9/s/WBQsy2JFfPz1YAClxUmXY7ejUuZmKXGuXqe
         26Tg==
X-Forwarded-Encrypted: i=1; AJvYcCW3xbTInxKcry2wCYkARoaGqb2lHtUntm714mhO8Ji3+9JAqUE+1yZMSvQ6Zj0L0EndwGnp5lCdGiBSa0vnFF6Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8qN04EdYi1C1ByXFao0Jxq+93vCcpi8aBvmhsrjTPBsTjUECR
	34HhMHcaFDgLGJNnOAQAgaH+TTSKzRUGC+MjszWa8gpSZ/Xpkp4Yp1vH2oYiCi9Fj1Y=
X-Gm-Gg: ASbGncuprYcl4FN7l+/rB6owfjP1aeiEUysWSKOFPjmBfe9sC++B8P+My04s1+7b6RB
	XadpAqQQpfKtPw0Y55kbeNuf+xoBw8BaFSaECSHfzKcPMSOuGkHiPCy+7cpcZ+e1FBd3eI8WXQC
	Xf8DdVJWRH5k9SdEvOhcwtLMo5vakjX2eDJxfZbktOiHLR3RD7+iuXDStQ2g8HrEK5JtEH+ni2y
	aFLSvZ+l8Hce2crNQTqXD+EKAJ8t0SEnRMaMAuEBvqFOZnyESSl6QlHAHH5sGxkdSD3PBe314HN
	1MGwd9WPnDYypKRdc8Totrrw3aQYb4tPThpKModH4aCWZkm9LCOW939cO8tCAB4YgYOcXaU=
X-Google-Smtp-Source: AGHT+IHLLDacG6DJNXNgMnaF7nWhkFGvXH5XjtvmKDssa24rTSeprfh0E2gKpdqYxF8Xn+tcyTPTow==
X-Received: by 2002:a05:600c:c0d2:20b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-442fda2e7d3mr147957455e9.27.1747925569155;
        Thu, 22 May 2025 07:52:49 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:48 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:35 +0100
Subject: [PATCH v2 06/14] spi: spi-fsl-dspi: Add config and regmaps for
 S32G platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-6-bea884630cfb@linaro.org>
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
 Larisa Grigore <larisa.grigore@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_075250_604659_EEF956D9 
X-CRM114-Status: GOOD (  13.58  )
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

From: Larisa Grigore <larisa.grigore@nxp.com>

S32G adds SPI_{T,R}XFR4 and extends SPI_CTAR registers to 5. Add the
new regmaps, configs and bits.

dspi_volatile_ranges gets SPI_{T,R}XFR4 added which affects all
platforms, however they are further limited by dspi_yes_ranges.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 39 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 437a8db9fa2b..10e511ba1cd8 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -35,7 +35,7 @@
 #define SPI_TCR				0x08
 #define SPI_TCR_GET_TCNT(x)		(((x) & GENMASK(31, 16)) >> 16)
 
-#define SPI_CTAR(x)			(0x0c + (((x) & GENMASK(1, 0)) * 4))
+#define SPI_CTAR(x)			(0x0c + (((x) & GENMASK(2, 0)) * 4))
 #define SPI_CTAR_FMSZ(x)		(((x) << 27) & GENMASK(30, 27))
 #define SPI_CTAR_CPOL			BIT(26)
 #define SPI_CTAR_CPHA			BIT(25)
@@ -93,12 +93,14 @@
 #define SPI_TXFR1			0x40
 #define SPI_TXFR2			0x44
 #define SPI_TXFR3			0x48
+#define SPI_TXFR4			0x4C
 #define SPI_RXFR0			0x7c
 #define SPI_RXFR1			0x80
 #define SPI_RXFR2			0x84
 #define SPI_RXFR3			0x88
+#define SPI_RXFR4			0x8C
 
-#define SPI_CTARE(x)			(0x11c + (((x) & GENMASK(1, 0)) * 4))
+#define SPI_CTARE(x)			(0x11c + (((x) & GENMASK(2, 0)) * 4))
 #define SPI_CTARE_FMSZE(x)		(((x) & 0x1) << 16)
 #define SPI_CTARE_DTCP(x)		((x) & 0x7ff)
 
@@ -136,6 +138,7 @@ enum {
 	LX2160A,
 	MCF5441X,
 	VF610,
+	S32G,
 };
 
 static const struct regmap_range dspi_yes_ranges[] = {
@@ -147,15 +150,29 @@ static const struct regmap_range dspi_yes_ranges[] = {
 	regmap_reg_range(SPI_SREX, SPI_SREX),
 };
 
+static const struct regmap_range s32g_dspi_yes_ranges[] = {
+	regmap_reg_range(SPI_MCR, SPI_MCR),
+	regmap_reg_range(SPI_TCR, SPI_CTAR(5)),
+	regmap_reg_range(SPI_SR, SPI_TXFR4),
+	regmap_reg_range(SPI_RXFR0, SPI_RXFR4),
+	regmap_reg_range(SPI_CTARE(0), SPI_CTARE(5)),
+	regmap_reg_range(SPI_SREX, SPI_SREX),
+};
+
 static const struct regmap_access_table dspi_access_table = {
 	.yes_ranges	= dspi_yes_ranges,
 	.n_yes_ranges	= ARRAY_SIZE(dspi_yes_ranges),
 };
 
+static const struct regmap_access_table s32g_dspi_access_table = {
+	.yes_ranges	= s32g_dspi_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(s32g_dspi_yes_ranges),
+};
+
 static const struct regmap_range dspi_volatile_ranges[] = {
 	regmap_reg_range(SPI_MCR, SPI_TCR),
 	regmap_reg_range(SPI_SR, SPI_SR),
-	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
+	regmap_reg_range(SPI_PUSHR, SPI_RXFR4),
 	regmap_reg_range(SPI_SREX, SPI_SREX),
 };
 
@@ -167,6 +184,7 @@ static const struct regmap_access_table dspi_volatile_table = {
 enum {
 	DSPI_REGMAP,
 	DSPI_XSPI_REGMAP,
+	S32G_DSPI_XSPI_REGMAP,
 	DSPI_PUSHR,
 };
 
@@ -189,6 +207,15 @@ static const struct regmap_config dspi_regmap_config[] = {
 		.rd_table	= &dspi_access_table,
 		.wr_table	= &dspi_access_table,
 	},
+	[S32G_DSPI_XSPI_REGMAP] = {
+		.reg_bits	= 32,
+		.val_bits	= 32,
+		.reg_stride	= 4,
+		.max_register	= SPI_SREX,
+		.volatile_table	= &dspi_volatile_table,
+		.wr_table	= &s32g_dspi_access_table,
+		.rd_table	= &s32g_dspi_access_table,
+	},
 	[DSPI_PUSHR] = {
 		.name		= "pushr",
 		.reg_bits	= 16,
@@ -263,6 +290,12 @@ static const struct fsl_dspi_devtype_data devtype_data[] = {
 		.fifo_size		= 16,
 		.regmap			= &dspi_regmap_config[DSPI_REGMAP],
 	},
+	[S32G] = {
+		.trans_mode	  = DSPI_XSPI_MODE,
+		.max_clock_factor = 1,
+		.fifo_size	  = 5,
+		.regmap		  = &dspi_regmap_config[S32G_DSPI_XSPI_REGMAP],
+	},
 };
 
 struct fsl_dspi_dma {

-- 
2.34.1


