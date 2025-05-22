Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC10C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 15:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nr/NDCyDgVLU7UV6iODdNqGZbsP83lb1uZk463tdmVs=; b=Hchn3Z4z0gROIupdQq5H5loPb/
	3Mx5Updnnt083M1bXcwW45VtSTL1Mq8d2O9lZXFW88/5ETED2uCult3vP0Vex472UlZRbvbpY2k7j
	cq+PultQGFjp7kRaoxawRGdM6f4hvkS8z0eCPq/aEH6obprH+IvyQBdMfAJsEZKR2Eto9oIxDGKVD
	7ruApZch9yMYtF0tZUFNIioIFcTAu3IvJ96i3K3nNAE8jmE9OJ282j3DQhW+E/xYTxqW2wCFvy0rR
	ovqWzM75CitGyiH56NVBy8cQBcpesbScpMh8FBcpUHh+/6xvcCkRhft9iPtvviyJ+YHE1JfbX3G+/
	Z6s9XbYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7ts-00000001RnH-310F;
	Thu, 22 May 2025 15:32:04 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7I3-00000001Kaz-12gs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:53:00 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a35b7e60cbso5549746f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925577; x=1748530377; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nr/NDCyDgVLU7UV6iODdNqGZbsP83lb1uZk463tdmVs=;
        b=LmLCQL0gm5alQxHXaFwPL9rx/gdVahQW4Av75B9S9OS5F/G/bvXMMngeYodwJqYxOZ
         CQSvuVxz6yJoujszGwWi97ogmzmBIOmRnC64wagYpWUfeUyDxvL4j6AUNUknOJMTclSX
         jKzEaBVP/cgLbAsIGifu64uYAOYGqWldEnGbi3OA4ohqDyaSg1+uyYVZ7gRq/Sob55VU
         GHob8bEzf9EPzQuHvrxxEF84a8jYkMFgOmKiEWHTM3cRZrQyHFsfH3jmIZoEXMEztIHQ
         acD1Vmcpq5K4ge0Dj80TmHa++reBf9QbsgtQuRKiEDswkYOYgfIL5hf7xnIDnclG2Y2O
         SnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925577; x=1748530377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nr/NDCyDgVLU7UV6iODdNqGZbsP83lb1uZk463tdmVs=;
        b=jFmdmp28oJ95d2boCciV5IAqaEr56igAscPXQR3vFq1bL6CmoTxEfmXq1jZO35dFRh
         2j0wosLKf15O4zuCkc5LIIj9SJ+gD+SutrjV++staozRdqkiLN7gOiTj4KwMu0drWQ5S
         KLlz77Jnqu6UzWYMAn1m09hPpqLHeohiuV5gQWMAJ/FNxTPB2XoONAVUV3N1QtqKSr8q
         DyL4bnUy0hodeWNuwOh6fnebwzdYz2vCF6CBAD1r+6+yIB3SoB7MOuEvCZeUHuQUbLSF
         rk8/iAZJfxBF/MTe/mkYzHKSuHSZ2Y3kdGglQSB0Erato1vau11imqQbkZ+ovJv1h44d
         eUVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2HE+pyGzwnxXhk/5vzNLqLbgwnhvbSOj6MpoW8boDAdQ8wFqYWavJYWemodK9k4nlyTJQ/3q0iJRUdbfADMzM@lists.infradead.org
X-Gm-Message-State: AOJu0YwEEv/PILOqYjuqKdAQ9ueUJS5oymCV1Y3PR2nWvyyd1Oa1azcz
	L0rXohxKTjZO5rDFB58T707YbTOF/hJFgSoKRQ4VuRRMJqFbgVCU8NrCq4Ko7xbMb7o=
X-Gm-Gg: ASbGncuEUsbiE6PQZ7GnQiSZHZ1pBx8kbX/6/TxPc7Rm0CSy3Y0gGH/EzwxcBeRHy8r
	fm22DHG1zQppSMCWUXhpIKLNPrY5pzh3ue3y98odUYHGFS3J5/UGwKDQmfOpk9ZjVcfKug/8G1y
	uFglJBDZYKrkZznZeLWGtWdokPQXbPA6iXTpJTDaL41RQp7sjPEaoGlcNj6n3s2z9vbMatFYMGL
	rBezOe8B51N8PM+zDtrjddPuzI/JFMmGOLsCQzCyxRRN/ClOhsb9zM94Kkuj7LLqwdgMqPXNfPv
	JMl/6Q3unUd0X3yMho6bmsdYW+UrBDpx8ZdWlC9KKtNpoH2qJ/4Q9JnkzL7sGP7XZ06Axrc=
X-Google-Smtp-Source: AGHT+IG/V3Opgz2PDL+bVOZGX8atJ6mbWrBQT/ugzNjANyQS6gfJjv43GgKxrWWCOwUGCfdzPvI8vg==
X-Received: by 2002:a5d:5f8a:0:b0:3a3:6b16:3bb3 with SMTP id ffacd0b85a97d-3a36b163d10mr15401385f8f.3.1747925577440;
        Thu, 22 May 2025 07:52:57 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:56 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:40 +0100
Subject: [PATCH v2 11/14] spi: spi-fsl-dspi: Enable modified transfer
 protocol on S32G
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-11-bea884630cfb@linaro.org>
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
 Andra-Teodora Ilie <andra.ilie@nxp.com>, 
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_075259_295992_2E9EBF5C 
X-CRM114-Status: GOOD (  18.70  )
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

From: Andra-Teodora Ilie <andra.ilie@nxp.com>

S32G supports modified transfer protocol where both host and target
devices sample later in the SCK period than in Classic SPI mode to allow
the logic to tolerate more delays in device pads and board traces. Set
MTFE bit in MCR register for frequencies higher than 25MHz.

Signed-off-by: Andra-Teodora Ilie <andra.ilie@nxp.com>
Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 45 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index a3efe1bd3b37..01af641fa757 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -24,6 +24,7 @@
 
 #define SPI_MCR				0x00
 #define SPI_MCR_HOST			BIT(31)
+#define SPI_MCR_MTFE			BIT(26)
 #define SPI_MCR_PCSIS(x)		((x) << 16)
 #define SPI_MCR_CLR_TXF			BIT(11)
 #define SPI_MCR_CLR_RXF			BIT(10)
@@ -37,6 +38,7 @@
 
 #define SPI_CTAR(x)			(0x0c + (((x) & GENMASK(2, 0)) * 4))
 #define SPI_CTAR_FMSZ(x)		(((x) << 27) & GENMASK(30, 27))
+#define SPI_CTAR_DBR			BIT(31)
 #define SPI_CTAR_CPOL			BIT(26)
 #define SPI_CTAR_CPHA			BIT(25)
 #define SPI_CTAR_LSBFE			BIT(24)
@@ -111,6 +113,8 @@
 
 #define DMA_COMPLETION_TIMEOUT		msecs_to_jiffies(3000)
 
+#define SPI_25MHZ			25000000
+
 struct chip_data {
 	u32			ctar_val;
 };
@@ -346,6 +350,7 @@ struct fsl_dspi {
 	const void				*tx;
 	void					*rx;
 	u16					tx_cmd;
+	bool					mtf_enabled;
 	const struct fsl_dspi_devtype_data	*devtype_data;
 
 	struct completion			xfer_done;
@@ -722,7 +727,7 @@ static void dspi_release_dma(struct fsl_dspi *dspi)
 }
 
 static void hz_to_spi_baud(char *pbr, char *br, int speed_hz,
-			   unsigned long clkrate)
+			   unsigned long clkrate, bool mtf_enabled)
 {
 	/* Valid baud rate pre-scaler values */
 	int pbr_tbl[4] = {2, 3, 5, 7};
@@ -739,7 +744,13 @@ static void hz_to_spi_baud(char *pbr, char *br, int speed_hz,
 
 	for (i = 0; i < ARRAY_SIZE(brs); i++)
 		for (j = 0; j < ARRAY_SIZE(pbr_tbl); j++) {
-			scale = brs[i] * pbr_tbl[j];
+			if (mtf_enabled) {
+				/* In MTF mode DBR=1 so frequency is doubled */
+				scale = (brs[i] * pbr_tbl[j]) / 2;
+			} else {
+				scale = brs[i] * pbr_tbl[j];
+			}
+
 			if (scale >= scale_needed) {
 				if (scale < minscale) {
 					minscale = scale;
@@ -1146,6 +1157,20 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 	return status;
 }
 
+static int dspi_set_mtf(struct fsl_dspi *dspi)
+{
+	if (spi_controller_is_target(dspi->ctlr))
+		return 0;
+
+	if (dspi->mtf_enabled)
+		regmap_update_bits(dspi->regmap, SPI_MCR, SPI_MCR_MTFE,
+				   SPI_MCR_MTFE);
+	else
+		regmap_update_bits(dspi->regmap, SPI_MCR, SPI_MCR_MTFE, 0);
+
+	return 0;
+}
+
 static int dspi_setup(struct spi_device *spi)
 {
 	struct fsl_dspi *dspi = spi_controller_get_devdata(spi->controller);
@@ -1204,7 +1229,16 @@ static int dspi_setup(struct spi_device *spi)
 		cs_sck_delay, sck_cs_delay);
 
 	clkrate = clk_get_rate(dspi->clk);
-	hz_to_spi_baud(&pbr, &br, spi->max_speed_hz, clkrate);
+
+	if (is_s32g_dspi(dspi) && spi->max_speed_hz > SPI_25MHZ)
+		dspi->mtf_enabled = true;
+	else
+		dspi->mtf_enabled = false;
+
+	dspi_set_mtf(dspi);
+
+	hz_to_spi_baud(&pbr, &br, spi->max_speed_hz, clkrate,
+		       dspi->mtf_enabled);
 
 	/* Set PCS to SCK delay scale values */
 	ns_delay_scale(&pcssck, &cssck, cs_sck_delay, clkrate);
@@ -1226,6 +1260,9 @@ static int dspi_setup(struct spi_device *spi)
 				  SPI_CTAR_PBR(pbr) |
 				  SPI_CTAR_BR(br);
 
+		if (dspi->mtf_enabled)
+			chip->ctar_val |= SPI_CTAR_DBR;
+
 		if (spi->mode & SPI_LSB_FIRST)
 			chip->ctar_val |= SPI_CTAR_LSBFE;
 	}
@@ -1352,6 +1389,8 @@ static int dspi_resume(struct device *dev)
 		return ret;
 	}
 
+	dspi_set_mtf(dspi);
+
 	if (dspi->irq)
 		enable_irq(dspi->irq);
 

-- 
2.34.1


