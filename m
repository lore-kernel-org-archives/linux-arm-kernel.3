Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083F5C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEyehrM+Fx4o61r/yR0u4BgsTY9lmtx/SKx/NBJ8aCc=; b=O3zKlLMFOdKNO2UlLPSUr/+H1U
	8P7iX3470YupOP+bTyPp5YD9ZG6MlGIy6w2cC2ahFGtXRc4NKRpjTHX0ataLQMFPKj5VCv/Qq5rF2
	lY+GSX80Ua2Aqjamdi5BL0NTtwouKBxrR1/WtCdwbq2YlmG5eQp5BfxPrC2fTLlUJvV1H59IXWhxq
	LOGlLBqicZCmLPh8Tb7DPBCqTpjHyxAp3o4rjzwbam9XfPV6N/XysXArY5m2rXJw1WsPYNYEXdNIT
	sIItK4dz/knoNHHXolH+wtvm5E3FY4oRlKUgetYd9xcOgEMhLqf6fafuwuBV2WdFMcGSubql1GU71
	vNwJzshg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMVt-00000003XN0-2K93;
	Fri, 09 May 2025 12:07:37 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLZM-00000003NeO-3a8R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:07:11 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a0b637db6eso1184952f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788827; x=1747393627; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEyehrM+Fx4o61r/yR0u4BgsTY9lmtx/SKx/NBJ8aCc=;
        b=sftrapesn8jIIdKYdtJjGT+CaxvundVhNGV83kWZODLxrf9RjBenlt3e0+N332t0B5
         L14rHX8IbBDO/HFTBHKaz5feEZjbwPqcJpp3XWPzy4dmMY02L/C4xWoBFYGSzaI6tYHf
         BTbPFV+PUXjdG1zWIvbeZTA4Bdhsu7l2i00rxq3/eZDO/iV3YqEjt0/feiSTb/7glNr7
         bTW1v5r1MNMi3pYP5GYQo70/n0T7cOROuBBB4hHdqFMfNZmmbrdwT0+tghiiXmov2YXu
         QvAPkqzF8t3/KZ1+nkSn2egUMRCR5vZZzwgRQH7O8cHpbFadtzb7qD3ZAraxen/OK+v1
         jLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788827; x=1747393627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEyehrM+Fx4o61r/yR0u4BgsTY9lmtx/SKx/NBJ8aCc=;
        b=Q5g5+ducnHGPC/bj4mH8J9+BNz74YWjlO8HtrCOtQADjlwbw+4UZUYO5h7mtrWNJ4k
         S+wtHf9VFLDujbx87hFp8+IFZ/dB5JJETY1xGIjXcBj6keT55WTKoQDdzIuKJXQfHyI5
         NTsHFMU6wsjzfHRMaVJylFAJyt1Bqtzf8+yGLrWpRMDUDToJHvIjC+e+9DDmKamwN8vM
         nfRp0FjtPuGk7puYJmykF/ROd+jNdtgKTZnkv0gfHRmg3/giqzy0DG3EBJVauWMLyGdL
         2PQM5f9/7m4O0O0uVvErEgHPXn0vrtxVCsTOKpUgft/H0/r2XKobpdykiPgsI4FxES7A
         U0Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWawkQcY5hqzRrqDMO6kN7FHyoqSmkxkKt1772VacsJxy70W8HfCmWxSLQI2mRG6BQgPxB2ouQJkPxJlB8wdmx3@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt3nH8jr0WdXnuv0woDMU2oYDHnmY62DWrHI+4oyhQQiqzGOM9
	RaWDYW2ImrKyK0rJL0OpQc0avXOP/uYYET5PZUdBK/bH8d3AyCTz4eIIKMNDssA=
X-Gm-Gg: ASbGncus7bpI3bNnSdaU00HCrD1eon7Tvj9+nvE9zbaJMI8Zywt8dQUuCZe0Yl6XPqJ
	+uIZycotQXXySbCo89RKElVfPEnoYFCaejZfu6v+LVY4ndQJ9RJqrBiR1WW43sKhelrw4f07JWU
	Q+0u+fLgSXdV39LiQa10AxM7si28hGaR/7H4hdN6PnUS+7OwTc5lre9lMwKkcMzNTapM6QlLae/
	YhJ3lz+1uCdlYRuZn5unOj2K7FONaylTrgZndMY5QZMDeTIdB4Uhw1eML2Q2xVNfU3EGbmVxanW
	arBAmp7BL7kuH+z61b6OuleLF2qiNB8GuJbMZwdFc+Qt6nA=
X-Google-Smtp-Source: AGHT+IEQntKAHHe5FBbl7TvKgw8FWGCOZDWYXdtRsViQGulRTo3e/GMO/aV0MJn1nNmDeMFHI32nUQ==
X-Received: by 2002:a05:6000:2506:b0:3a0:a0e5:d28b with SMTP id ffacd0b85a97d-3a1f6421ecemr2453655f8f.3.1746788827070;
        Fri, 09 May 2025 04:07:07 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:06 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:56 +0100
Subject: [PATCH 09/14] spi: spi-fsl-dspi: Reinitialize DSPI regs after
 resuming for S32G
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-9-32bfcd2fea11@linaro.org>
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
X-CRM114-CacheID: sfid-20250509_040708_940595_D51F7F6C 
X-CRM114-Status: GOOD (  15.10  )
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

After resuming, DSPI registers (MCR and SR) need to be reinitialized for
S32G platforms.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 73 +++++++++++++++++++++++++---------------------
 1 file changed, 40 insertions(+), 33 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 50cec3b94322..0613642d769d 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1258,6 +1258,39 @@ static const struct of_device_id fsl_dspi_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, fsl_dspi_dt_ids);
 
+static int dspi_init(struct fsl_dspi *dspi)
+{
+	unsigned int mcr;
+
+	/* Set idle states for all chip select signals to high */
+	mcr = SPI_MCR_PCSIS(GENMASK(dspi->ctlr->max_native_cs - 1, 0));
+
+	if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE)
+		mcr |= SPI_MCR_XSPI;
+	if (!spi_controller_is_target(dspi->ctlr))
+		mcr |= SPI_MCR_HOST;
+
+	regmap_write(dspi->regmap, SPI_MCR, mcr);
+	regmap_write(dspi->regmap, SPI_SR, SPI_SR_CLEAR);
+
+	switch (dspi->devtype_data->trans_mode) {
+	case DSPI_XSPI_MODE:
+		regmap_write(dspi->regmap, SPI_RSER, SPI_RSER_CMDTCFE);
+		break;
+	case DSPI_DMA_MODE:
+		regmap_write(dspi->regmap, SPI_RSER,
+			     SPI_RSER_TFFFE | SPI_RSER_TFFFD |
+			     SPI_RSER_RFDFE | SPI_RSER_RFDFD);
+		break;
+	default:
+		dev_err(&dspi->pdev->dev, "unsupported trans_mode %u\n",
+			dspi->devtype_data->trans_mode);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int dspi_suspend(struct device *dev)
 {
@@ -1284,6 +1317,13 @@ static int dspi_resume(struct device *dev)
 	if (ret)
 		return ret;
 	spi_controller_resume(dspi->ctlr);
+
+	ret = dspi_init(dspi);
+	if (ret) {
+		dev_err(dev, "failed to initialize dspi during resume\n");
+		return ret;
+	}
+
 	if (dspi->irq)
 		enable_irq(dspi->irq);
 
@@ -1293,39 +1333,6 @@ static int dspi_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(dspi_pm, dspi_suspend, dspi_resume);
 
-static int dspi_init(struct fsl_dspi *dspi)
-{
-	unsigned int mcr;
-
-	/* Set idle states for all chip select signals to high */
-	mcr = SPI_MCR_PCSIS(GENMASK(dspi->ctlr->max_native_cs - 1, 0));
-
-	if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE)
-		mcr |= SPI_MCR_XSPI;
-	if (!spi_controller_is_target(dspi->ctlr))
-		mcr |= SPI_MCR_HOST;
-
-	regmap_write(dspi->regmap, SPI_MCR, mcr);
-	regmap_write(dspi->regmap, SPI_SR, SPI_SR_CLEAR);
-
-	switch (dspi->devtype_data->trans_mode) {
-	case DSPI_XSPI_MODE:
-		regmap_write(dspi->regmap, SPI_RSER, SPI_RSER_CMDTCFE);
-		break;
-	case DSPI_DMA_MODE:
-		regmap_write(dspi->regmap, SPI_RSER,
-			     SPI_RSER_TFFFE | SPI_RSER_TFFFD |
-			     SPI_RSER_RFDFE | SPI_RSER_RFDFD);
-		break;
-	default:
-		dev_err(&dspi->pdev->dev, "unsupported trans_mode %u\n",
-			dspi->devtype_data->trans_mode);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int dspi_target_abort(struct spi_controller *host)
 {
 	struct fsl_dspi *dspi = spi_controller_get_devdata(host);

-- 
2.34.1


