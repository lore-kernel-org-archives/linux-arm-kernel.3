Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E789C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X9YN8+8rnHDsp/b09Y/xOR9H3TlYqB2jpDQsHdPnIdk=; b=InTY3ZSfpTV5vPkv9TKNO4tSaD
	m5BcHeTrJj2XHAzrw0FbT7Z3H78lFRhkTWSPDBFhXKk5UJMXFOF//BllD4syz+0NG3tlXOrgLY660
	Ixs8ilpjSQ97qF8MIdloECL47PSK2m7atNDhn4afAc73nrCpJYNp2NNSpGKI1brPsOmTHpZz6ata/
	4qLwtlqjrp1hjV7vixFM0DFyGrVowjBMAg9DE/XQxpgjc/3xul+wwucGhcSrNdoKK6czwkxn9oUa/
	OTFN7b9Ws48HSw0k1DRfiHA0dE2U+BA6ptpQllVjkYfsAzIyuUgyBqqEy1PXJhwQC6xqtRJuD5Wm6
	0u7sMROw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMZk-00000003Xkq-4BKJ;
	Fri, 09 May 2025 12:11:37 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLZL-00000003Ndi-1bBP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:07:12 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso12820635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788826; x=1747393626; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9YN8+8rnHDsp/b09Y/xOR9H3TlYqB2jpDQsHdPnIdk=;
        b=H1RxL61dryIeY3kU5dg/swdMEgOtOovPrmIcKfDBRu7BR89dW2PvGtxMjYJk6rsZXl
         trmawIStYTgnw2dhok9Ek8dokZWEjK5nh/7IUtu3qId+8RyBgovBSuEpV2iGazx+542B
         j+taBOZcWS0pf09hSg3datlZ8+OmfSvO9htVKKckXOiS18+yJO1T1JHunVqZCU8+fpV9
         NaN9eTjF2l44674MHEqsL5MnnUgQ2h5zXfH9HS5uZxIh5C3oEWHB46FFFWClmOEU1Sve
         cIhKfwV9i6K/8w+8pugodpW2+UNXxV0J0/ebRQk120a820KqAvVrol8Cx9o/wN5pvaiH
         BJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788826; x=1747393626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X9YN8+8rnHDsp/b09Y/xOR9H3TlYqB2jpDQsHdPnIdk=;
        b=DVC7pHcD/8knE6DGqPyrF7lBxiILaT6gyizH5NWddnZxqDYJxu3lLG2HsO/fLmWmPo
         HcZ4va1nePH8tX9SaOcA1KRPCemCoVnDboKlqhTsC3sHKUXp4UpUv4igKIGF2lPSyWfu
         tx+V9IAdxmKkDHxOtRALzWVRd2X3mbVIeYqylJuFxQJyY/Q0Q0+gREfRVcvv7FB5iE0Y
         EjSceb3uy4r4qssNyDxgngNI4n0lBRDvEYsPZ4ba2c7uCu32atthYUASWDPnm7/HQsLS
         xBo+a+ir2fpuBififVjYqwH6FkjdppaMV1/GLPA6OiKzN4Q8uB76qO47AEV1xYljqnIJ
         43fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvnMpaHEU5ylt3Eep5cIef9/EjWwD978jkiYzffxyJ4cC3EM46KfcHLhx6ffzHN3mrXgvIVOTZbjg/a+2IeZAd@lists.infradead.org
X-Gm-Message-State: AOJu0YyO82votKerwBbfGXERBc3ufPl7L7hob4F/6uXRIY1+NYc+7d3U
	+TQj3HjvZwNG6zfriPTLCJtHBf8q19n4HpxgHxWyNvKFWHLmsmLktR1fXG/QLbg=
X-Gm-Gg: ASbGnctaD4C9AAABzAp86h9VuBqkrQ7OdAP6MA9seuZq7OUEmButMOnoMgT9wOF5hE/
	wjIR3WkvOMlEm3XiP05rlhxA/LFFCuatttWyWPoKD5JxzKIEKgJXsGTKtvRHeEHtgMQ2xl0RHe1
	dkzpbWMT86PaY2qvNbnF4yl3RkGre2RZ3gd0KLPR3OsaaBZdQ20D2jDevJj06euV1mvbYkm7uVj
	z/XC1+Q+HVW0zuSICJACqBPDBRq+3Kuf1I7OufkHNmVcr6FuQxbY2en4bBe7kdySn6CV05bn8Pq
	FcA2qJyPQQwik74Mi5Odut/jBBASt8+6+qGz+gD7LwbGJ7E=
X-Google-Smtp-Source: AGHT+IGTcDbYuLQC5gOTqBLxhDeYoC8oTLnNT0OALiU2xxGu34CRv1e+8uSkOAx/4GXBO/mVq1Dayg==
X-Received: by 2002:a5d:584b:0:b0:3a1:f635:1136 with SMTP id ffacd0b85a97d-3a1f6487d80mr2603233f8f.28.1746788825706;
        Fri, 09 May 2025 04:07:05 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:05 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:55 +0100
Subject: [PATCH 08/14] spi: spi-fsl-dspi: Use DMA for S32G controller in
 target mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-8-32bfcd2fea11@linaro.org>
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
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_040707_424253_1E39451B 
X-CRM114-Status: GOOD (  16.58  )
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

Switch to DMA for target mode otherwise the controller is too slow to
feed TX FIFO and UNDERFLOW occurs frequently. DMA can work only with 8
and 16 bits per word. 32bits per word is not supported, this is a
hardware limitation, so we keep the controller mode in TCFQ mode.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index b7363cfc649d..50cec3b94322 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -137,7 +137,8 @@ enum {
 	LX2160A,
 	MCF5441X,
 	VF610,
-	S32G
+	S32G,
+	S32G_TARGET
 };
 
 static const struct regmap_range dspi_yes_ranges[] = {
@@ -182,6 +183,7 @@ static const struct regmap_access_table dspi_volatile_table = {
 
 enum {
 	DSPI_REGMAP,
+	S32G_DSPI_REGMAP,
 	DSPI_XSPI_REGMAP,
 	S32G_DSPI_XSPI_REGMAP,
 	DSPI_PUSHR
@@ -197,6 +199,15 @@ static const struct regmap_config dspi_regmap_config[] = {
 		.wr_table	= &dspi_access_table,
 		.rd_table	= &dspi_access_table
 	},
+	[S32G_DSPI_REGMAP] = {
+		.reg_bits	= 32,
+		.val_bits	= 32,
+		.reg_stride	= 4,
+		.max_register	= 0x8C,
+		.volatile_table	= &dspi_volatile_table,
+		.wr_table	= &s32g_dspi_access_table,
+		.rd_table	= &s32g_dspi_access_table,
+	},
 	[DSPI_XSPI_REGMAP] = {
 		.reg_bits	= 32,
 		.val_bits	= 32,
@@ -294,6 +305,12 @@ static const struct fsl_dspi_devtype_data devtype_data[] = {
 		.max_clock_factor	= 1,
 		.fifo_size		= 5,
 		.regmap			= &dspi_regmap_config[S32G_DSPI_XSPI_REGMAP]
+	},
+	[S32G_TARGET] = {
+		.trans_mode		= DSPI_DMA_MODE,
+		.max_clock_factor	= 1,
+		.fifo_size		= 5,
+		.regmap			= &dspi_regmap_config[S32G_DSPI_REGMAP]
 	}
 };
 
@@ -350,6 +367,12 @@ struct fsl_dspi {
 	void (*dev_to_host)(struct fsl_dspi *dspi, u32 rxdata);
 };
 
+static bool is_s32g_dspi(struct fsl_dspi *data)
+{
+	return data->devtype_data == &devtype_data[S32G] ||
+	       data->devtype_data == &devtype_data[S32G_TARGET];
+}
+
 static void dspi_native_host_to_dev(struct fsl_dspi *dspi, u32 *txdata)
 {
 	switch (dspi->oper_word_size) {
@@ -1398,6 +1421,9 @@ static int dspi_probe(struct platform_device *pdev)
 		dspi->pushr_tx = 0;
 	}
 
+	if (spi_controller_is_target(ctlr) && is_s32g_dspi(dspi))
+		dspi->devtype_data = &devtype_data[S32G_TARGET];
+
 	if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE)
 		ctlr->bits_per_word_mask = SPI_BPW_RANGE_MASK(4, 32);
 	else

-- 
2.34.1


