Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12D3C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 15:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnsHBRMSS57g5A6Zsxv5fUehUSBOq6hPCzrwmSugvPA=; b=XTOlP97Mby0wxtvwLbhnO0cj6o
	EqowwkOkXL2+n1fg+l0/ZU9mxKYghACdi4qd4GrpALHdDBqvvExIaHAibsfoFO9IbWYl17iGqK2y5
	lAY6sjs4MbQRQFYL5lZK+q+HPLM3u8E/I+Ccd4rOIEDjy4anY61DlASmkuXwHQi87QylOIEUnxuMr
	ZeFQFSExFsv9zQ9aPR68wrJ/q+84mhv/CwxuSTm8gFn5YNQ+WGaZzOXCMTG0JE9b/Q9WWZcNlqWWs
	tEeBUJUiGoGXHblri4YhgkHFCR3eSso+LchxEsU9/qDlHU1onVCZUqMnkbbPbVQrgIEc7UGcYpHUk
	3LIvjz2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7bu-00000001PA3-1q16;
	Thu, 22 May 2025 15:13:30 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7Ho-00000001KSQ-2EfR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:52:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-441ab63a415so87078915e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 07:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925563; x=1748530363; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnsHBRMSS57g5A6Zsxv5fUehUSBOq6hPCzrwmSugvPA=;
        b=sc//9pJJBpO8W1Kt1yoIWpGLBoEcEG3uVleEkqjEy8v6fDtK94ifkkhyIHM8tbDgrK
         6hn8pGLQDkkClrsiy9ubbJUKVkYakwmcg+P5qAoSDUbaz1EXqG3tZOHHhLLSHtEqWrAm
         E1tU0yNaFMTB3yifG3knefLOtB/uAqviYVtqmodonDvnqqinI/gX/jxSIsceY357iXsJ
         oi1KybmZHKDQxNVWyhdAT5E/WjLQAMv7/QqjVnKbbUhEliK1cvTtxcYBLuAp/ZfhhyI6
         0+A9hJNK3ZPPMucybzs1iGOWeKF8bThfF3jSId7UId0CEnVDZZEWJdPSiarYD8TfyQss
         Xb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925563; x=1748530363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnsHBRMSS57g5A6Zsxv5fUehUSBOq6hPCzrwmSugvPA=;
        b=rTkQIsasGPRbR3Lb67JBcOzZwynpCEq2s+4BsYFd7ps1PNo8aGVY7Ppb6hAbODsQyw
         bSfyyEQ68FsY3K/haaHq9yURsIrp+nQBXC/vWy/k/O9BP431Jdz9YInGgHR+4juHNi+0
         TaNU23O2dHA4vBX7zJod2pxZuIfgYN9Vk6ySOKfm/QTZcGfWOVXJdjL8qdCcdc/9svf7
         qkLyOzjNCb8xGbyrySab4IvUBq6fgSf3QIK5YHsO5yb1oXSE9FDp2pOukawFEsdPg29l
         inaX84397xSqUCbBSMXqMTzjEVWV7ofn8HRZUl5z7h3vCBQyIrR0uQBuNcZBZPGvUU0T
         SYlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoEve2+Td3YMomDjTA3mh21EBuRTGgqs19XB8l7CpYPAYUSdJTSkn7f7LZJ59SYsmBfAhB49Wm8GSaMwVPsbe5@lists.infradead.org
X-Gm-Message-State: AOJu0YybHyPiQWzLUJgSN2dIGRSHLcxona5bBw9DCDvhNyAkCxFhtuZ4
	pNa1rKONEYrY+Reol//ABQjMU6RQEzthoS/YIqLaH9Azdzhkx+bLz6eTpmKDMxO9A5U=
X-Gm-Gg: ASbGnctOfUTuqAi50nb24W2a+lmIFGncWO1yLiZ5gIvryPnNEFtrr/DqTmbNDzqK+mW
	JJWmcWq7goKARDJUSqD0hxanGmhb4NW299V8kfrV16t3T+q5lX84Uu0XJ0Lm19S/30dGqHMFX2o
	25GfAl4luckBQNCJO89NhzoHTeEVYjvHN/F5zVcsU8Vl4cJoYfBQw/ZVmSAVLPrd4rWGLnELXvE
	y9C8kAcYTu3nW9fjcpRwagRER5hIXE/ZJrVlx9t1hl02dVKAhycxCFzA2Wq5RPTRsMWYLvrMc4j
	j/T5UtORXELHuCZWFf1g4mPmaotLxZmm5255l2l3kzlTMSSgvrOUUuvM0zL2
X-Google-Smtp-Source: AGHT+IEm/t82lB7n4D+jawYNq22d+sbqAeLEow+7pvP2Bzn0+lqXr94xgdIsdIfmG8+O8swf/6lS3g==
X-Received: by 2002:a05:600c:3112:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-442fd606b99mr238110635e9.7.1747925562768;
        Thu, 22 May 2025 07:52:42 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:41 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:31 +0100
Subject: [PATCH v2 02/14] spi: spi-fsl-dspi: Halt the module after a new
 message transfer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-2-bea884630cfb@linaro.org>
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
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_075244_593055_001E91C8 
X-CRM114-Status: GOOD (  19.02  )
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

From: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>

The XSPI mode implementation in this driver still uses the EOQ flag to
signal the last word in a transmission and deassert the PCS signal.
However, at speeds lower than ~200kHZ, the PCS signal seems to remain
asserted even when SR[EOQF] = 1 indicates the end of a transmission.
This is a problem for target devices which require the deassertation of
the PCS signal between transfers.

Hence, this commit 'forces' the deassertation of the PCS by stopping the
module through MCR[HALT] after completing a new transfer. According to
the reference manual, the module stops or transitions from the Running
state to the Stopped state after the current frame, when any one of the
following conditions exist:
- The value of SR[EOQF] = 1.
- The chip is in Debug mode and the value of MCR[FRZ] = 1.
- The value of MCR[HALT] = 1.

This shouldn't be done if the last transfer in the message has cs_change
set.

Fixes: ea93ed4c181b ("spi: spi-fsl-dspi: Use EOQ for last word in buffer even for XSPI mode")
Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index effb460d436d..1fa96e8189cf 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -62,6 +62,7 @@
 #define SPI_SR_TFIWF			BIT(18)
 #define SPI_SR_RFDF			BIT(17)
 #define SPI_SR_CMDFFF			BIT(16)
+#define SPI_SR_TXRXS			BIT(30)
 #define SPI_SR_CLEAR			(SPI_SR_TCFQF | \
 					SPI_SR_TFUF | SPI_SR_TFFF | \
 					SPI_SR_CMDTCF | SPI_SR_SPEF | \
@@ -921,9 +922,20 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 	struct spi_transfer *transfer;
 	bool cs = false;
 	int status = 0;
+	u32 val = 0;
+	bool cs_change = false;
 
 	message->actual_length = 0;
 
+	/* Put DSPI in running mode if halted. */
+	regmap_read(dspi->regmap, SPI_MCR, &val);
+	if (val & SPI_MCR_HALT) {
+		regmap_update_bits(dspi->regmap, SPI_MCR, SPI_MCR_HALT, 0);
+		while (regmap_read(dspi->regmap, SPI_SR, &val) >= 0 &&
+		       !(val & SPI_SR_TXRXS))
+			;
+	}
+
 	list_for_each_entry(transfer, &message->transfers, transfer_list) {
 		dspi->cur_transfer = transfer;
 		dspi->cur_msg = message;
@@ -953,6 +965,7 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 				dspi->tx_cmd |= SPI_PUSHR_CMD_CONT;
 		}
 
+		cs_change = transfer->cs_change;
 		dspi->tx = transfer->tx_buf;
 		dspi->rx = transfer->rx_buf;
 		dspi->len = transfer->len;
@@ -988,6 +1001,15 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 			dspi_deassert_cs(spi, &cs);
 	}
 
+	if (status || !cs_change) {
+		/* Put DSPI in stop mode */
+		regmap_update_bits(dspi->regmap, SPI_MCR,
+				   SPI_MCR_HALT, SPI_MCR_HALT);
+		while (regmap_read(dspi->regmap, SPI_SR, &val) >= 0 &&
+		       val & SPI_SR_TXRXS)
+			;
+	}
+
 	message->status = status;
 	spi_finalize_current_message(ctlr);
 
@@ -1245,6 +1267,8 @@ static int dspi_init(struct fsl_dspi *dspi)
 	if (!spi_controller_is_target(dspi->ctlr))
 		mcr |= SPI_MCR_HOST;
 
+	mcr |= SPI_MCR_HALT;
+
 	regmap_write(dspi->regmap, SPI_MCR, mcr);
 	regmap_write(dspi->regmap, SPI_SR, SPI_SR_CLEAR);
 

-- 
2.34.1


