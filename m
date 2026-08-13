Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4DEC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6G3NRNZL8dSdQJqaXUc7ZO7iQogO5DBd4K7lMUQSdA=; b=QVNkJ3VhOAJ/+1n6zwqw7SxvAM
	b3bAUp3JKydePB2so+iCQkCSoYJkjz4j+nAdPkEwfXZoWewhlldgkQCaDsqO3Y1XQxNUUwheAHy4p
	u81IGt2N48mSsVNk/s3bRZtFZiVKza4GGKBbCNIQ+dOln3PZmAtgb4HeMcxo30aqmZJcx4OXvR1ij
	d0HdLDZVA8IuNNNErtnXZoJk1Oek0ygFW82MvIgSPOSdJKRpsfwScei9eQilr/+fZfgB08+kU7Xbg
	uQdLq3Mb6kwXnaImYEubjP8C2cy0FHYJ8ScENIcUtzATKveOr1T+ThVO+3XVCCm44e/kwag3C8nwc
	Mk+ZTXMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQMs-0000000048c-2fKv;
	Thu, 13 Aug 2026 08:00:50 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQMp-0000000047H-31VE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:00:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 41D611A15EF;
	Thu, 13 Aug 2026 08:00:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 157C1602B8;
	Thu, 13 Aug 2026 08:00:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 883CC11C4DA87;
	Thu, 13 Aug 2026 10:00:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786608041; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N6G3NRNZL8dSdQJqaXUc7ZO7iQogO5DBd4K7lMUQSdA=;
	b=ib4VW7KYU46KzTXHYDafEspQZM4S0cqhD1JqOA6kHiAMR1t96rkndmvEXnUyFyWu62pRvw
	lqseLjWi8grmQtjTm/FNTVZUj3sehmAkn1UxOUrSTFRtUtSg82UETwqqmLLt7lFmMUzzeT
	nVeHPxkpNTBgJo69u9jNbGNpCqnGUrFNfNEWqJlPySsfcixqd7ezWFjkI6HeA85W3WtkFU
	OwLkhSfrxUpptGVFGBuf0v7Z5QcsoVbVe5mqBZXHKTWxqmjTekIp5gsEG1KDdrpS6qrH/x
	4N2lq6qx6jdcW9mgusEZpG3pwMjuIqYZhQM3F7gbxyy1u0p+v8JQ39er7cy1Qg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 13 Aug 2026 10:00:22 +0200
Subject: [PATCH 2/5] spi: ma35d1-qspi: Move speed setting to bus
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-perso-ma35d1-upstream-qspi-v1-2-b217b9870eb1@bootlin.com>
References: <20260813-perso-ma35d1-upstream-qspi-v1-0-b217b9870eb1@bootlin.com>
In-Reply-To: <20260813-perso-ma35d1-upstream-qspi-v1-0-b217b9870eb1@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_010047_914751_C5D37C1A 
X-CRM114-Status: GOOD (  14.48  )
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

The speed setting is wrongly placed inside the "setup transfer" helper,
since the bus configuration may require the speed to be correct. Indeed,
DTR mode (not yet available) divides by 2 the bus clock when enabled. As
a result, to remain at a constant clock speed (and improve the data
rate), we must double the bus clock when enabling DTR. In order to
prepare for this change, move all the bus configuration required for
each step of the operation inside a unique helper called
nuvoton_qspi_configure_bus().

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-ma35d1-qspi.c | 69 +++++++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 25 deletions(-)

diff --git a/drivers/spi/spi-ma35d1-qspi.c b/drivers/spi/spi-ma35d1-qspi.c
index 929546dbe38f..b4fd0ab4bd31 100644
--- a/drivers/spi/spi-ma35d1-qspi.c
+++ b/drivers/spi/spi-ma35d1-qspi.c
@@ -131,11 +131,15 @@ static int nuvoton_qspi_reset_fifo(struct nuvoton_qspi *qspi)
 					 1, NUVOTON_QSPI_TIMEOUT_US);
 }
 
-static int nuvoton_qspi_set_speed(struct nuvoton_qspi *qspi, u32 speed_hz)
+static int nuvoton_qspi_set_speed(struct spi_device *spi, u32 speed_hz)
 {
+	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
 	unsigned long clk_rate;
 	u32 div;
 
+	if (!speed_hz)
+		speed_hz = spi->max_speed_hz;
+
 	if (!speed_hz)
 		return -EINVAL;
 
@@ -174,24 +178,16 @@ static int nuvoton_qspi_set_bits_per_word(struct nuvoton_qspi *qspi, u8 bpw)
 	return 0;
 }
 
-static int nuvoton_qspi_setup_transfer(struct spi_device *spi,
-				       u32 speed_hz, u8 bpw)
+static int nuvoton_qspi_setup_transfer(struct spi_device *spi, u8 bpw)
 {
 	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
 	u32 mode = spi->mode & SPI_MODE_X_MASK;
 	u32 ctl = 0;
 	int ret;
 
-	if (!speed_hz)
-		speed_hz = spi->max_speed_hz;
-
 	if (!bpw)
 		bpw = NUVOTON_QSPI_DEFAULT_BPW;
 
-	ret = nuvoton_qspi_set_speed(qspi, speed_hz);
-	if (ret)
-		return ret;
-
 	ret = nuvoton_qspi_set_bits_per_word(qspi, bpw);
 	if (ret)
 		return ret;
@@ -216,11 +212,18 @@ static int nuvoton_qspi_setup_transfer(struct spi_device *spi,
 	return 0;
 }
 
-static void nuvoton_qspi_set_bus_width(struct nuvoton_qspi *qspi,
-				       unsigned int buswidth,
-				       enum spi_mem_data_dir dir)
+static int nuvoton_qspi_configure_bus(struct spi_device *spi,
+				      unsigned int buswidth,
+				      enum spi_mem_data_dir dir,
+				      u32 speed_hz)
 {
+	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
 	u32 ctl = 0;
+	int ret;
+
+	ret = nuvoton_qspi_set_speed(spi, speed_hz);
+	if (ret)
+		return ret;
 
 	if (buswidth == 4)
 		ctl |= NUVOTON_QSPI_CTL_QUADIOEN_MASK;
@@ -234,6 +237,8 @@ static void nuvoton_qspi_set_bus_width(struct nuvoton_qspi *qspi,
 				 NUVOTON_QSPI_CTL_QUADIOEN_MASK |
 				 NUVOTON_QSPI_CTL_DUALIOEN_MASK |
 				 NUVOTON_QSPI_CTL_DATDIR_MASK, ctl);
+
+	return 0;
 }
 
 static u32 nuvoton_qspi_tx_byte(const void *txbuf, unsigned int idx)
@@ -459,14 +464,17 @@ static int nuvoton_qspi_mem_exec_op(struct spi_mem *mem,
 	int ret;
 	int i;
 
-	ret = nuvoton_qspi_setup_transfer(spi, op->max_freq,
-					  NUVOTON_QSPI_DEFAULT_BPW);
+	ret = nuvoton_qspi_setup_transfer(spi, NUVOTON_QSPI_DEFAULT_BPW);
 	if (ret)
 		return ret;
 
 	nuvoton_qspi_mem_set_cs(spi, true);
 
-	nuvoton_qspi_set_bus_width(qspi, op->cmd.buswidth, SPI_MEM_DATA_OUT);
+	ret = nuvoton_qspi_configure_bus(spi, op->cmd.buswidth, SPI_MEM_DATA_OUT,
+					 op->max_freq);
+	if (ret)
+		goto out_deassert_cs;
+
 	ret = nuvoton_qspi_txrx(qspi, &opcode, NULL, 1);
 	if (ret)
 		goto out_deassert_cs;
@@ -475,24 +483,33 @@ static int nuvoton_qspi_mem_exec_op(struct spi_mem *mem,
 		for (i = 0; i < op->addr.nbytes; i++)
 			addr[i] = op->addr.val >> (8 * (op->addr.nbytes - i - 1));
 
-		nuvoton_qspi_set_bus_width(qspi, op->addr.buswidth,
-					   SPI_MEM_DATA_OUT);
+		ret = nuvoton_qspi_configure_bus(spi, op->addr.buswidth, SPI_MEM_DATA_OUT,
+						 op->max_freq);
+		if (ret)
+			goto out_deassert_cs;
+
 		ret = nuvoton_qspi_txrx(qspi, addr, NULL, op->addr.nbytes);
 		if (ret)
 			goto out_deassert_cs;
 	}
 
 	if (op->dummy.nbytes) {
-		nuvoton_qspi_set_bus_width(qspi, op->dummy.buswidth,
-					   SPI_MEM_DATA_OUT);
+		ret = nuvoton_qspi_configure_bus(spi, op->dummy.buswidth, SPI_MEM_DATA_OUT,
+						 op->max_freq);
+		if (ret)
+			goto out_deassert_cs;
+
 		ret = nuvoton_qspi_txrx(qspi, NULL, NULL, op->dummy.nbytes);
 		if (ret)
 			goto out_deassert_cs;
 	}
 
 	if (op->data.nbytes) {
-		nuvoton_qspi_set_bus_width(qspi, op->data.buswidth,
-					   op->data.dir);
+		ret = nuvoton_qspi_configure_bus(spi, op->data.buswidth, op->data.dir,
+						 op->max_freq);
+		if (ret)
+			goto out_deassert_cs;
+
 		ret = nuvoton_qspi_txrx(qspi,
 					op->data.dir == SPI_MEM_DATA_OUT ?
 					op->data.buf.out : NULL,
@@ -528,8 +545,7 @@ static int nuvoton_qspi_transfer_one(struct spi_controller *ctlr,
 	unsigned int buswidth = 1;
 	int ret;
 
-	ret = nuvoton_qspi_setup_transfer(spi, xfer->speed_hz,
-					  xfer->bits_per_word);
+	ret = nuvoton_qspi_setup_transfer(spi, xfer->bits_per_word);
 	if (ret)
 		return ret;
 
@@ -552,7 +568,10 @@ static int nuvoton_qspi_transfer_one(struct spi_controller *ctlr,
 			buswidth = 2;
 	}
 
-	nuvoton_qspi_set_bus_width(qspi, buswidth, dir);
+	ret = nuvoton_qspi_configure_bus(spi, buswidth, dir, xfer->speed_hz);
+	if (ret)
+		return ret;
+
 	ret = nuvoton_qspi_txrx(qspi, xfer->tx_buf, xfer->rx_buf,
 				xfer->len);
 

-- 
2.54.0


