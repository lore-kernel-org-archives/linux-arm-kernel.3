Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E73EC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 15:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQcMbg+mj75exB6fMqaj4+6mofUOuhQ1ONizqDxy1LQ=; b=fDAHrs/Q1n2zmWal4Z1bhFd073
	l7doNfzBnJPU+fUg5r1HVkVYC7uirdzFU3eY6E+OYxS8BfgCXoiYyfahPRi1MFNeaa3mqW97W06OW
	zRDbgMoxt4fEr7Ab9OAv9At76/JtDnBumiA1RhWM9xJfaJ+aixObO9KZ4aLHJ4uaa09i2X6SmeLIJ
	RAmVVR6wh52Cg6aqRa9nHNwvx6MLnmKb462+fMJoZ0GRKYnS3xghSqsdd93EfbeIjzAcI/YnHzs3t
	Ta2X7gPZHzZKZuTB23WcdoNFVuSVbsZn9usltFRKsHEUMu9m+nwF+VBUarjx3BUGRq1BVPjPXH89g
	P/umHPVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7pt-00000001RM1-0dAa;
	Thu, 22 May 2025 15:27:57 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7Hz-00000001KYg-05g5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:52:56 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-443a787bd14so43249985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 07:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925574; x=1748530374; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQcMbg+mj75exB6fMqaj4+6mofUOuhQ1ONizqDxy1LQ=;
        b=eyB7s+am/3QG09HPDGKDQBrV0xkBN4LhVa2Q/YKm9cFUeRveqf0K0HRRiOCSbSPVhb
         oT8Yv/yGohZcDos0epj2BeO18ofMJF+ZtnzQPzBCt6MZvJcRCo9n4UdS+UMtKY9VLFkZ
         4t+Il6tg67WcQE7MbGhlJnMy32w+qFJBSWsexdNQNx4bq0DIcUD95k/VWvJmfBVknVsX
         fDgyVREsSTEr/GuyPzypIDoxdenex9E0BMcxJE4mpzvmUNOqg9BriogdfdnpVw/GEa4R
         k+yAAabfhlDhoCCItcTNTszpROumqZmBXtyMQ+ROSMJEzVhyn5I9n+tBaqkPh0iRImni
         U+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925574; x=1748530374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQcMbg+mj75exB6fMqaj4+6mofUOuhQ1ONizqDxy1LQ=;
        b=ZdlX8ZsvAz9CH2LSJi76+KpCt4FHlm2vARgTDBjVdGxWUynN3y7PVKMBG+Y5GeD/nb
         0d/aZpfILxbj7+0OUkmz3XjSxaVGBwOnthub3PS+gXDbQNuJwXvW8uuWQ0G5obYT6Eci
         yqC8SJo0xlR5CAHoi5KtLzSYDkMtRIGuPpQ5cThM308bYVsmGP1yJUBLwm02MtYniVAW
         zP/Rin7NYNaexcUErPu5kl79YfKld1Tz0dBElhHJc3lkbNqEZabUuNElJcNbONIrUl+y
         0+Lf527807qvCGi7c8unIVhKt0eWY4Sa2tuVqX9yGX4o5OW9NLx1Xj8qXHkdCcmEqS5A
         9j4g==
X-Forwarded-Encrypted: i=1; AJvYcCXJozISXdGiLKXTPn9qbGC4VImelakIX6MHVuiSRWQ4TU90eBqG21FeHZh80Cyh5KzYlY94DRWrMDHOK3h1ub6c@lists.infradead.org
X-Gm-Message-State: AOJu0YyrrjBk7E5mznqL07hKJuDXPYm8eWDQdJzs+Wx2FHRoxmLvA9vM
	bVD/ZCdVvzEz2byODfqCRbJibJFta8YuVbWc3cE+RuImFbtv2s2LKqihUy5t5tVR3To=
X-Gm-Gg: ASbGncsk+pqtGjAMNBgvV/HRjhBB6tnjN3I3gwdlB4eA4ZB8bq5O13SGD47pI1Z793K
	87sV32z66MXLlMrFBqnEhOSLP5ZM7mWWF7Xic/DaCCF7pWZOlgr8ygMqo2mM1vsFuXBBbc47NdV
	R8eY5eKimL0DgBNngY31gyTOeW3s1XxcixWpGveXJMi36IU9zMVilhl2knacuWLf8TKmGxnbdA/
	kPyIVE3hOY1YsvBz1S1v5WjfDhuBKw8dmsocqnedbVz4XHd82Lu9LyWXHpJIdmiz6a++52MkQ4y
	1wjMvAB43AoFCG/AX4ME/WWhMHvuCZlITKvPgqIJFmjdLUw2/HwO3qX/qwMSq6srZcVZ7kg=
X-Google-Smtp-Source: AGHT+IFcpjDviXjWNB7+EBIbhpiq2tpPR7sQlo7rFyrWtoBHLAjxGUQNW2PIVbs7fj19J7u5oXlJ7g==
X-Received: by 2002:a05:600c:a40a:b0:43b:c592:7e16 with SMTP id 5b1f17b1804b1-442f84c2092mr260241495e9.3.1747925573711;
        Thu, 22 May 2025 07:52:53 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:53 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:38 +0100
Subject: [PATCH v2 09/14] spi: spi-fsl-dspi: Use DMA for S32G controller in
 target mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-9-bea884630cfb@linaro.org>
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
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_075255_075474_3B7C690E 
X-CRM114-Status: GOOD (  14.68  )
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
 drivers/spi/spi-fsl-dspi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 24a51267cb4d..db5a2ed66f68 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -139,6 +139,7 @@ enum {
 	MCF5441X,
 	VF610,
 	S32G,
+	S32G_TARGET,
 };
 
 static const struct regmap_range dspi_yes_ranges[] = {
@@ -183,6 +184,7 @@ static const struct regmap_access_table dspi_volatile_table = {
 
 enum {
 	DSPI_REGMAP,
+	S32G_DSPI_REGMAP,
 	DSPI_XSPI_REGMAP,
 	S32G_DSPI_XSPI_REGMAP,
 	DSPI_PUSHR,
@@ -198,6 +200,15 @@ static const struct regmap_config dspi_regmap_config[] = {
 		.rd_table	= &dspi_access_table,
 		.wr_table	= &dspi_access_table,
 	},
+	[S32G_DSPI_REGMAP] = {
+		.reg_bits	= 32,
+		.val_bits	= 32,
+		.reg_stride	= 4,
+		.max_register	= SPI_RXFR4,
+		.volatile_table	= &dspi_volatile_table,
+		.wr_table	= &s32g_dspi_access_table,
+		.rd_table	= &s32g_dspi_access_table,
+	},
 	[DSPI_XSPI_REGMAP] = {
 		.reg_bits	= 32,
 		.val_bits	= 32,
@@ -296,6 +307,12 @@ static const struct fsl_dspi_devtype_data devtype_data[] = {
 		.fifo_size	  = 5,
 		.regmap		  = &dspi_regmap_config[S32G_DSPI_XSPI_REGMAP],
 	},
+	[S32G_TARGET] = {
+		.trans_mode	  = DSPI_DMA_MODE,
+		.max_clock_factor = 1,
+		.fifo_size	  = 5,
+		.regmap		  = &dspi_regmap_config[S32G_DSPI_REGMAP],
+	},
 };
 
 struct fsl_dspi_dma {
@@ -351,6 +368,12 @@ struct fsl_dspi {
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
@@ -1426,6 +1449,9 @@ static int dspi_probe(struct platform_device *pdev)
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


