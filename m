Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FF5C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kS0UyNciGcvIX/4wvXI4EYR5mKVhADe3ICPtGq7iTLM=; b=DOe76OipmqFexUr5a0VY8H0r4Y
	CNMj1BVj6asJCIdEcglG/BWwjTlIF7Bp4hvfNQojqGo/hntE0xXcGs+7yzwVPa/KGF050Lp1gXzFW
	GGKxvdhndU66YBXO+I4vitqX6UnFu6fjRckNT4CzhElCtQwMQY+3+kzziJ0xcasSVCTw6xBsjdQCb
	OPqHP0nZpv7632dzrGpZTsj9LAmb/vJy1yGpoGtq4mLUgPv2I6319eD/znF4iRbYRfRa7dC3RbIP3
	bfMgAm0+cI3CN/C2EOWe+PkkE+DrNAkuKCL5K8+vL/BFdM86/EcmRiGxasiiSwpIwu7SAaEbGoEgl
	wkbXQN2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMQ5-00000003WNF-1nB3;
	Fri, 09 May 2025 12:01:37 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLZF-00000003NbY-3joT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:07:05 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a1fb17a9beso183027f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788820; x=1747393620; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kS0UyNciGcvIX/4wvXI4EYR5mKVhADe3ICPtGq7iTLM=;
        b=QQXZspxuUG82X2afwok+7G4qRKSw/xyI65kPLoh8uOg73+RX7/mxUqv12ItoErZ77L
         ugOM+AEO1mGNb0EGQWbJEHUxEQpwsMTy4mPFglgwVZHMUBKMNBSTfKukBID+OaSnR9+4
         6jCfYgRzyfzZUezeCyYvXAkmMf7akrKV0n1KS55sjxpRtJhYad1Tr/TQ9gHkxym+GUOW
         0J/aNYV8aQZ1Q1YXJ6CipxDo3SUmlOub6GwCGMpL8NA2+OV3v0bJKDLyJxkIiVr58Vx9
         PRQts8SkZ73H3dsWnetfdOTtT4VltzINl7hEhV6NfZ7w5wmHWBxIiZQeo/lyCgTofyzp
         s5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788820; x=1747393620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kS0UyNciGcvIX/4wvXI4EYR5mKVhADe3ICPtGq7iTLM=;
        b=VKaoIMnyUY+tOTGlEvdZ1HPJsWkFuJWSvKE214VVogsvJCPz3wshad89bVFydOeQy4
         W0IClksjwCUHSXw+maDDg4/Y1kpwYI1ObMdkeFwATQsxdfZPlsvSESiqovVt1+sp/fKI
         BWvIF7VgiQCDA093BL0m+9momDfX21aUqnt2OBrJtplV+fULil8dh6F6ZY09cpCsgL0L
         sbaEefVL8+mMdRv/yla3Tvi7TkCqWbvkTI0EXGIH94wljvOKrUYcfIu33vu8nfMEZG4Y
         uTMTq+tlqG2FbGoRFAyijBv4V5YoNy1U6E/CzrI4SLbstzTQeMN7kiIfCBKwPSO4FLeL
         b/+g==
X-Forwarded-Encrypted: i=1; AJvYcCVoWrI0c4Fw1qNB+m1dGOgRXnMl2nhlEro8BZoQWnFjdEO57U7nnqF1I7xDnvAwAZbg1FCJhTOqooKfeEdjUiSQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7gRLRXutoUwlmd6bpIAIpQ2WNw/VLi/b9/ocsPjJjbxoPpRTf
	bq9nzS1HqpUz/LUrtuCzl/r0ewx8dS0F5CB6ekmcJrUZse6/WbHgl9CVqIC1s4A=
X-Gm-Gg: ASbGnctH/MDG753GGntKY4gOfcpkKjm45rTiuJBC0vz3htpxvnKYDxe2gkNt/y38ZWZ
	ssE/qW/91UNflfLdyF6Y8xZsBL7gPg92VllBm/gLx4iT/rBWZgRUR1e0UWUJB1TxPsqexvTEzyO
	1HIB5zeptuINi+DKYSR3isYnvff8FtOyuJ7hYNYao821a916TCVtXSvWm/jD1rc1FT3jlfDBk8J
	FVrVO/o8frueNnS5Rv2FkJyh40aw4uDfLLlcIJW8eCGo9yAKJyLFMG599s4X0prZ9HaGyAQoTv1
	8ZwbRWR1d1IfWGSiWGs89XU0v9wo4Iuu91evVQSFlp8+Pr57sKyzvVhPDQ==
X-Google-Smtp-Source: AGHT+IEjLExiBo/pTRwIXb6nfVt9VVnMblJ/vXH80y5StmUX3A8QBF3za9FzG7eNZqTpd9SVfNtr1w==
X-Received: by 2002:a05:6000:2dc4:b0:39c:dfa:c3de with SMTP id ffacd0b85a97d-3a1f64a383dmr2369977f8f.47.1746788820116;
        Fri, 09 May 2025 04:07:00 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:06:59 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:51 +0100
Subject: [PATCH 04/14] spi: spi-fsl-dspi: Add config and regmaps for S32G
 platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-4-32bfcd2fea11@linaro.org>
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
X-CRM114-CacheID: sfid-20250509_040701_934943_8313F572 
X-CRM114-Status: GOOD (  13.69  )
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
index 701cf56d28e7..df6f85122bfe 100644
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
@@ -92,12 +92,14 @@
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
 
@@ -135,6 +137,7 @@ enum {
 	LX2160A,
 	MCF5441X,
 	VF610,
+	S32G
 };
 
 static const struct regmap_range dspi_yes_ranges[] = {
@@ -146,15 +149,29 @@ static const struct regmap_range dspi_yes_ranges[] = {
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
 	regmap_reg_range(SPI_SREX, SPI_SREX)
 };
 
@@ -166,6 +183,7 @@ static const struct regmap_access_table dspi_volatile_table = {
 enum {
 	DSPI_REGMAP,
 	DSPI_XSPI_REGMAP,
+	S32G_DSPI_XSPI_REGMAP,
 	DSPI_PUSHR
 };
 
@@ -188,6 +206,15 @@ static const struct regmap_config dspi_regmap_config[] = {
 		.wr_table	= &dspi_access_table,
 		.rd_table	= &dspi_access_table
 	},
+	[S32G_DSPI_XSPI_REGMAP] = {
+		.reg_bits	= 32,
+		.val_bits	= 32,
+		.reg_stride	= 4,
+		.max_register	= 0x13c,
+		.volatile_table	= &dspi_volatile_table,
+		.wr_table	= &s32g_dspi_access_table,
+		.rd_table	= &s32g_dspi_access_table,
+	},
 	[DSPI_PUSHR] = {
 		.name		= "pushr",
 		.reg_bits	= 16,
@@ -262,6 +289,12 @@ static const struct fsl_dspi_devtype_data devtype_data[] = {
 		.fifo_size		= 16,
 		.regmap			= &dspi_regmap_config[DSPI_REGMAP]
 	},
+	[S32G] = {
+		.trans_mode		= DSPI_XSPI_MODE,
+		.max_clock_factor	= 1,
+		.fifo_size		= 5,
+		.regmap			= &dspi_regmap_config[S32G_DSPI_XSPI_REGMAP]
+	}
 };
 
 struct fsl_dspi_dma {

-- 
2.34.1


