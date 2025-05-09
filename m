Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5420DC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vT4KOWN4uTm3QxGCYySEGWVVZs5ryN1meRZIg3C7iIY=; b=jM1onmpRo9QBV8637YPx6jGJH4
	cN5SMUr3PnHHXpka+FAj10THwqQCfrDt782jewPvz9aIH+2/LC1lOo55nKQUxAdiheIFwvolD96Cw
	EQ2omUliy6JAG1ZMKSwFpqTljvfz2gJhYxgeeHBd/QK6GVES82KTauHM+y7av4iZUhh92hzhja8vO
	AgMV3PhJPFBZ9ugRvXKRiR8pINpjrIC6Abbs4eN5EzpNRrCiCLCakSwYZ4oT6NWgAdFIbeRR7eIQO
	Pv5kLX3T1OQPLhH2XF5NpuH2CXsx2jzdi1C7T/bwpvY3YEnPEM166GxGNAkukk7Z9P8O3inODiKX0
	E9OQoa6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMbf-00000003XuA-3AAE;
	Fri, 09 May 2025 12:13:35 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLZP-00000003Nfa-2yz5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:07:13 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-391342fc0b5so1647280f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788830; x=1747393630; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vT4KOWN4uTm3QxGCYySEGWVVZs5ryN1meRZIg3C7iIY=;
        b=RU5EKOAi3/W6xExXLFfKesbdRzAtL5Qz/qIO+PD4D8orGCTDEp1tEbY/0FLiNZwiGo
         Z+OF4/4bq9SfrFHpjyMsGruTE0TbYTZOUNG30o7v+R+gCczbYl8tDpPXt/+5BCk/Y1/F
         QUR8hGcOq6sLp82xnhy8P7QFn+rCNVo4TGEc1F3KY4W4pMFISLROk2nEN/PIM6egwg6g
         lsYlO7h/lGVH2o+cgo1kW3Vbq6HjVaD3ol/rUvLCa0/OwweIClmyll1i2n50sVOBCizu
         jpUqJ3CjHXRJMv0TfvpHdDpmUe5qcCQyWswTBQnbuFvAQ/2i6ZtLrxB3z84rBntuAr7k
         f6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788830; x=1747393630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vT4KOWN4uTm3QxGCYySEGWVVZs5ryN1meRZIg3C7iIY=;
        b=D5F7QFhGDxn+IVdaEgVqJ2wPvnr+n9PXaYunKdYxI6zFV3mnArjgTlEWpIpU3kXhaw
         RAcTUTek8ikTf8Y1eiUIS84UHOXGq7geS+Yc4oyqPwbDuT5vTzLn9BnZde/HRR6fQkbu
         9x+pY9oitu05KVkIXZyySfptQ64/HpFSKW9xS4/wKH8qav6isABHe7cWjvnE3KrIthZd
         O0+zMouPZL4Yjbs3vtzdcUu+Kvqi486DwtlvEW3wZe+UKhkE9QWnAaNVK3QbmsHWocG7
         lLGWgvBDDdFf+xtE52DSW1jMQkl8H/lzL9VAatlg4OLWSDS2P7s4ftBeTN3ev+K6kDyC
         Egqw==
X-Forwarded-Encrypted: i=1; AJvYcCUIGoLy0ilcoKiclHTS798G88uhY9Xs2DAyumxfHywHvJht/FdjshNJ4XmrIOHURxCNw+XtJfxuKDkHpQshDVjm@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8iq5zgtOIQuzRigMEMxTSo2uEMAW7bZsopLaREff54oY451AD
	apA9hE6H/EXyon4Cym18NEN+f4ewVzxL2sacducvLhyDjATyRsj/eTDlV1mxE90=
X-Gm-Gg: ASbGncuzhKUYK00RvS3qJyjcF1yfXwbWRe9Hd0JaE6DG7xn200y59CKEakTmtJQ0zYa
	nUDjbrf7jmJSMh4TUolrTK7Msm/Q/8D69+wPEaqv/cwyXRmiONfT9InL3lwnmsyUOqcD+zx3TxN
	9Cqud6gLdpJtovA+ysYSUGffu67q0tpnLd2khcDSJosBuyakS2yBXFq6yhE4W/MvGzN2uq8B7If
	UlWLpdZvKjI0fQCRTJvnUTyL8q6pdKQ1chErxdsquhredcN38hVc3wStoMdXt6+SNNoC4vVXCIS
	pF/Le/TZSake2vYlA7CthpyLRCU04j5F1QhElflKRUm5sXo=
X-Google-Smtp-Source: AGHT+IGGXkJ58sLQbmi3wU/ta+YdLpsygJwEMpejLEliNzR91iBPwbbisuUDIlnG+jy75pghXWkjdg==
X-Received: by 2002:a05:6000:1ac5:b0:39a:cb5b:78fe with SMTP id ffacd0b85a97d-3a1f647a5b5mr2514501f8f.34.1746788829944;
        Fri, 09 May 2025 04:07:09 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:09 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:58 +0100
Subject: [PATCH 11/14] spi: spi-fsl-dspi: Halt the module after a new
 message transfer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-11-32bfcd2fea11@linaro.org>
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
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_040711_753526_10E4AE7A 
X-CRM114-Status: GOOD (  19.20  )
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

Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 31521dac1580..db921ee6305f 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -64,6 +64,7 @@
 #define SPI_SR_TFIWF			BIT(18)
 #define SPI_SR_RFDF			BIT(17)
 #define SPI_SR_CMDFFF			BIT(16)
+#define SPI_SR_TXRXS			BIT(30)
 #define SPI_SR_CLEAR			(SPI_SR_TCFQF | \
 					SPI_SR_TFUF | SPI_SR_TFFF | \
 					SPI_SR_CMDTCF | SPI_SR_SPEF | \
@@ -1056,9 +1057,20 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
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
@@ -1088,6 +1100,7 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 				dspi->tx_cmd |= SPI_PUSHR_CMD_CONT;
 		}
 
+		cs_change = transfer->cs_change;
 		dspi->tx = transfer->tx_buf;
 		dspi->rx = transfer->rx_buf;
 		dspi->len = transfer->len;
@@ -1125,6 +1138,15 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
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
 
@@ -1306,6 +1328,8 @@ static int dspi_init(struct fsl_dspi *dspi)
 	if (!spi_controller_is_target(dspi->ctlr))
 		mcr |= SPI_MCR_HOST;
 
+	mcr |= SPI_MCR_HALT;
+
 	regmap_write(dspi->regmap, SPI_MCR, mcr);
 	regmap_write(dspi->regmap, SPI_SR, SPI_SR_CLEAR);
 

-- 
2.34.1


