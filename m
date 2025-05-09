Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657F9C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkUQ+DSZxqBk+Ct1g7deBrSh7xiTRYDOYQ8ekYGl/Lc=; b=Qn3vnlNWvdAsSENU3LAPmW3EZS
	0XK1LWB6aRxZLIN5KKjnCjJdlBWQtF/SI4eC9tyqczcvqAq7XcvMYB8vS5Bwz0JvVIa5ZEe5SJNeh
	5QsD3e8bS5oGJ8JpHgUlXErGT6Qx2jYGQWyyv/W+/toOHhv5S0GrMFdK8afVuw0Wx19wXN/BTFW3x
	YQsiHzrLFpOXpEhBVDGG60FZPsEIIOwsLakDhoyxHWM9goh+5vmnFGk1nDHkPizmmBUdtvqv/3qi9
	GhmBVCkfx8r6ckWmGifSSm5kSmhQH4tjpIwaMC+lIyB4IzJxIOPyUWbhodB2WX0Qw2VDwMj49nJoi
	Mwu8IwZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMXo-00000003XZ3-1RpR;
	Fri, 09 May 2025 12:09:36 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLZO-00000003Nex-1jHW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:07:12 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cf257158fso13094305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788829; x=1747393629; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkUQ+DSZxqBk+Ct1g7deBrSh7xiTRYDOYQ8ekYGl/Lc=;
        b=XdkwdqccuwuWeA6+m7kPzmAPrZ8OYmMawoH/84eLUVbXSxyv3mo0EiGpQr4eS8Xb+q
         WN7SgjgzA4IIJ1/KvVqhtflNklxOpZUvpWNmj8TDbI8kaLzkXlbL1Kd9/HXeO8dw5Gum
         JBiPcuSPirScNwIaIJM+Y0X4MOgkdiG8VlSuC4G1n9DmxdLRSBoWSxcYhRqtAY3BppHc
         MSamHWnQGduWSU2hvWsrIPpOCqIP21kqfRsLp/LoJbwDhlf6QrqRB6ReX62D2aH10JXB
         MCIGnpXVCd2Wv4B7oCYlK2LE3yg52p+bA468cZh77mxdkXnaRv8egwsTiixTnMKEn/9Y
         aDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788829; x=1747393629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkUQ+DSZxqBk+Ct1g7deBrSh7xiTRYDOYQ8ekYGl/Lc=;
        b=qGEhhTll8hlT79KXqIKnjxbwoXQ4hfKuRsN5eECvv7myVGa3vnEt6/19RNGMf0Ib2Y
         Qh62kwez6DbuxNKm4eJr8KrBC1n7ByWJSxM4aougxL8zj4w3GN+6eESlHbYoYlIiq0Hq
         CHHeiK702obhCw9eg/n+19gARB3K+C08xErnYuc7OZRQSEq8gj2Q3jV/CLICc2nTQVfF
         +GAwmSiFjfjo3jh5czahJtkL4RrJncPOQ2AyDTfk4+jxZGSTHnvAFEFo8JaFSCpKaBMq
         hKnuY4CBU+IMcolMILevHd4RpjNn0Mt/iT7gjwLt/HDimG4wvLNqGOua01I50CyL0rc+
         AD1A==
X-Forwarded-Encrypted: i=1; AJvYcCUh+ev4bmS7YFPUuaeMgyBk1JpAHK5hwDlxCwpFvWDNaxHANW8XfSWJqRP7U+e0oAYjjSTgnvmRtqno8u9kP69n@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6Uz/KmaSBR72sMQ5203EBB+W4TZeT9kiqNXFF9fm4vmBFp51m
	/lxYDx9LHDP7FoLGb3yivfBf+PWpKXlzWoNalC5MMuyyDLm03Rqch82UQJBafYA=
X-Gm-Gg: ASbGnct2tzthPkwue1xJTnuvefRpdTLzh+uh4vOHCaVxQbnM3C6cSOLAAzJ/QY+Mhvm
	hagnmmosNPyiPEiFVbtFVUlCyf0XepbaprxVC0buwmtStYbYaUtYQKIQ9cljOvslkvB49KeAVfI
	DOcUErd0kDvbfaHgDBT72bF9rsTaEZdLiiI18skp+xCwk3sZoPkUoWmWoQxT+GWskLep73+yVhA
	6i4suZqD0wbaRDVJl7hATeEpZyBAgbuLcSKOEI992pSmk5AIi1eh1NUoIuyYSP9mkse4gKskT9D
	H/mhQvVLlQZLYLizI3NikLomRp4lIQD44fUDMbc1/9tb1Co7whH0kDBUKA==
X-Google-Smtp-Source: AGHT+IHMGiWT8oT8oip5II6TERPV8HSSBR3AVz0wr78GflY0E9YVDL5RBtpoaYK37Au/6LAl5XIwnA==
X-Received: by 2002:a5d:64cd:0:b0:3a0:b5ec:f076 with SMTP id ffacd0b85a97d-3a1f643106amr2707885f8f.18.1746788828530;
        Fri, 09 May 2025 04:07:08 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:08 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:57 +0100
Subject: [PATCH 10/14] spi: spi-fsl-dspi: Enable modified transfer protocol
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-10-32bfcd2fea11@linaro.org>
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
 linux-arm-kernel@lists.infradead.org, 
 Andra-Teodora Ilie <andra.ilie@nxp.com>, 
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_040710_458204_74483FBC 
X-CRM114-Status: GOOD (  17.82  )
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

Set MTFE bit in MCR register for frequencies higher than 25MHz.

Signed-off-by: Andra-Teodora Ilie <andra.ilie@nxp.com>
Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 44 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 0613642d769d..31521dac1580 100644
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
@@ -110,6 +112,8 @@
 
 #define DMA_COMPLETION_TIMEOUT		msecs_to_jiffies(3000)
 
+#define SPI_25MHZ			25000000
+
 struct chip_data {
 	u32			ctar_val;
 };
@@ -345,6 +349,7 @@ struct fsl_dspi {
 	const void				*tx;
 	void					*rx;
 	u16					tx_cmd;
+	bool					mtf_enabled;
 	const struct fsl_dspi_devtype_data	*devtype_data;
 
 	struct completion			xfer_done;
@@ -721,7 +726,7 @@ static void dspi_release_dma(struct fsl_dspi *dspi)
 }
 
 static void hz_to_spi_baud(char *pbr, char *br, int speed_hz,
-			   unsigned long clkrate)
+			   unsigned long clkrate, bool mtf_enabled)
 {
 	/* Valid baud rate pre-scaler values */
 	int pbr_tbl[4] = {2, 3, 5, 7};
@@ -738,7 +743,13 @@ static void hz_to_spi_baud(char *pbr, char *br, int speed_hz,
 
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
@@ -1120,6 +1131,20 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
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
@@ -1178,7 +1203,15 @@ static int dspi_setup(struct spi_device *spi)
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
+	hz_to_spi_baud(&pbr, &br, spi->max_speed_hz, clkrate, dspi->mtf_enabled);
 
 	/* Set PCS to SCK delay scale values */
 	ns_delay_scale(&pcssck, &cssck, cs_sck_delay, clkrate);
@@ -1200,6 +1233,9 @@ static int dspi_setup(struct spi_device *spi)
 				  SPI_CTAR_PBR(pbr) |
 				  SPI_CTAR_BR(br);
 
+		if (dspi->mtf_enabled)
+			chip->ctar_val |= SPI_CTAR_DBR;
+
 		if (spi->mode & SPI_LSB_FIRST)
 			chip->ctar_val |= SPI_CTAR_LSBFE;
 	}
@@ -1324,6 +1360,8 @@ static int dspi_resume(struct device *dev)
 		return ret;
 	}
 
+	dspi_set_mtf(dspi);
+
 	if (dspi->irq)
 		enable_irq(dspi->irq);
 

-- 
2.34.1


