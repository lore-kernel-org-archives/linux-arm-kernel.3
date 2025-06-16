Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D897C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8s2DHgn3w9rCn5wed99fTlnLPjizNqzhROnC2hjDTA=; b=Qlyucx0Hm+paT+By7w+lTq0wrT
	OmCh0P4XSxMoftLqR5k8d581Lkcscf5txKTPVvbGncxZkckFz6SLt53FaHZJa9bSi13CnKp2Wf1Cc
	5HSER+ASPaqMpusc1p5ieSDhE5UEzL/PenOIFMW2NKwsmJ48MxXBPDFCBjZgZJGnudfkl+O7QIPEr
	fM4IzEpezaNC1y6YjRl6BMk093D+auSOFE6VlzMkqNYQZhNvlxYKuSU37J0Lx4LbL+GemDzeOZ6/c
	zollRF09KiXDKa7FNGVUMhuzNREIsTxHW5lKZ6uxDA0jxytJq403MLAzTXZmt9rpsBPAeKHszbdBv
	s5JsPpzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRIDk-00000005gZ8-0UEu;
	Mon, 16 Jun 2025 22:22:28 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHtO-00000005e9R-2Afl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 22:01:28 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750111284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U8s2DHgn3w9rCn5wed99fTlnLPjizNqzhROnC2hjDTA=;
	b=fRpI7zM8EJ3lvBmGn2ZK6cQPnRoS5fEUqpX4uEe/Q79CiQkoJ8ri/t072mO5lxXCYc/qbc
	3KTVhRUQHgYXwCYzio47tXfi1X9NhHR5sreoEhqfjwuviauAq0QTq/k8y7nquFpMCUJpxW
	RNJwGK6tuqfrBzMKUy133m4n6EGrudc=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 8/9] spi: zynqmp-gqspi: Support GPIO chip selects
Date: Mon, 16 Jun 2025 18:00:53 -0400
Message-Id: <20250616220054.3968946-9-sean.anderson@linux.dev>
In-Reply-To: <20250616220054.3968946-1-sean.anderson@linux.dev>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_150126_840616_FD38ACBB 
X-CRM114-Status: GOOD (  16.77  )
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

GPIO chipselects use the traditional SPI API instead of the SPIMEM API.
Implement it with transfer_one and set_cs (for non-GPIO chipselects). At
the moment we only support half-duplex transfers, which is good enough
to access SPI flashes.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v2:
- Use ->buses instead of an upper/lower split

 drivers/spi/spi-zynqmp-gqspi.c | 93 ++++++++++++++++++++++++++++++----
 1 file changed, 84 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index b36159dbaff0..87d375fae653 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -499,6 +499,15 @@ static void zynqmp_qspi_chipselect(struct spi_device *qspi, bool is_high)
 		dev_err(xqspi->dev, "Chip select timed out\n");
 }
 
+static void zynqmp_qspi_set_cs(struct spi_device *qspi, bool is_high)
+{
+	struct zynqmp_qspi *xqspi = spi_controller_get_devdata(qspi->controller);
+
+	mutex_lock(&xqspi->op_lock);
+	zynqmp_qspi_chipselect(qspi, is_high);
+	mutex_unlock(&xqspi->op_lock);
+}
+
 /**
  * zynqmp_qspi_selectspimode - Selects SPI mode - x1 or x2 or x4.
  * @xqspi:	xqspi is a pointer to the GQSPI instance
@@ -1197,6 +1206,73 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
 	return err;
 }
 
+static int zynqmp_qspi_transfer_one(struct spi_controller *ctlr,
+				    struct spi_device *spi,
+				    struct spi_transfer *transfer)
+{
+	struct zynqmp_qspi *xqspi = spi_controller_get_devdata(ctlr);
+	unsigned long timeout;
+	u32 genfifoentry;
+	u32 mask = 0;
+	int ret;
+
+	dev_dbg(xqspi->dev, "xfer %u/%u %u\n", transfer->tx_nbits,
+		transfer->rx_nbits, transfer->len);
+
+	if (transfer->tx_nbits && transfer->rx_nbits)
+		return -EOPNOTSUPP;
+
+	guard(mutex)(&xqspi->op_lock);
+	zynqmp_qspi_config_op(xqspi, transfer->speed_hz, spi->mode);
+	if (spi_get_csgpiod(spi, 0)) {
+		xqspi->genfifobus =
+			FIELD_PREP(GQSPI_GENFIFO_BUS_MASK, spi->buses);
+		xqspi->genfifocs = 0;
+	}
+	genfifoentry = xqspi->genfifocs | xqspi->genfifobus;
+
+	reinit_completion(&xqspi->data_completion);
+	if (transfer->tx_nbits) {
+		xqspi->txbuf = transfer->tx_buf;
+		xqspi->rxbuf = NULL;
+		xqspi->bytes_to_transfer = transfer->len;
+		xqspi->bytes_to_receive = 0;
+		zynqmp_qspi_write_op(xqspi, transfer->tx_nbits, genfifoentry);
+		mask = GQSPI_IER_TXEMPTY_MASK | GQSPI_IER_GENFIFOEMPTY_MASK |
+		       GQSPI_IER_TXNOT_FULL_MASK;
+		timeout = zynqmp_qspi_timeout(xqspi, transfer->tx_nbits,
+					      transfer->len);
+	} else {
+		xqspi->txbuf = NULL;
+		xqspi->rxbuf = transfer->rx_buf;
+		xqspi->bytes_to_transfer = 0;
+		xqspi->bytes_to_receive = transfer->len;
+		ret = zynqmp_qspi_read_op(xqspi, transfer->rx_nbits,
+					  genfifoentry);
+		if (ret)
+			return ret;
+
+		if (xqspi->mode != GQSPI_MODE_DMA)
+			mask = GQSPI_IER_GENFIFOEMPTY_MASK |
+			       GQSPI_IER_RXNEMPTY_MASK | GQSPI_IER_RXEMPTY_MASK;
+		timeout = zynqmp_qspi_timeout(xqspi, transfer->rx_nbits,
+					      transfer->len);
+	}
+
+	zynqmp_gqspi_write(xqspi, GQSPI_CONFIG_OFST,
+			   zynqmp_gqspi_read(xqspi, GQSPI_CONFIG_OFST) |
+			   GQSPI_CFG_START_GEN_FIFO_MASK);
+	if (mask)
+		zynqmp_gqspi_write(xqspi, GQSPI_IER_OFST, mask);
+	else
+		zynqmp_gqspi_write(xqspi, GQSPI_QSPIDMA_DST_I_EN_OFST,
+				   GQSPI_QSPIDMA_DST_I_EN_DONE_MASK);
+
+	if (!wait_for_completion_timeout(&xqspi->data_completion, timeout))
+		return -ETIMEDOUT;
+	return 0;
+}
+
 static const struct dev_pm_ops zynqmp_qspi_dev_pm_ops = {
 	SET_RUNTIME_PM_OPS(zynqmp_runtime_suspend,
 			   zynqmp_runtime_resume, NULL)
@@ -1316,27 +1392,26 @@ static int zynqmp_qspi_probe(struct platform_device *pdev)
 	if (ret)
 		goto clk_dis_all;
 
+	ctlr->max_native_cs = 2;
 	ret = of_property_read_u32(np, "num-cs", &num_cs);
-	if (ret < 0) {
+	if (ret < 0)
 		ctlr->num_chipselect = GQSPI_DEFAULT_NUM_CS;
-	} else if (num_cs > GQSPI_MAX_NUM_CS) {
-		ret = -EINVAL;
-		dev_err(&pdev->dev, "only %d chip selects are available\n",
-			GQSPI_MAX_NUM_CS);
-		goto clk_dis_all;
-	} else {
+	else
 		ctlr->num_chipselect = num_cs;
-	}
 
 	ctlr->num_buses = 2;
-	ctlr->flags = SPI_CONTROLLER_DEFAULT_BUS_IS_CS;
+	ctlr->flags = SPI_CONTROLLER_DEFAULT_BUS_IS_CS |
+		      SPI_CONTROLLER_HALF_DUPLEX;
 	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
 	ctlr->mem_ops = &zynqmp_qspi_mem_ops;
 	ctlr->mem_caps = &zynqmp_qspi_mem_caps;
 	ctlr->setup = zynqmp_qspi_setup_op;
+	ctlr->set_cs = zynqmp_qspi_set_cs;
+	ctlr->transfer_one = zynqmp_qspi_transfer_one;
 	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
 	ctlr->dev.of_node = np;
 	ctlr->auto_runtime_pm = true;
+	ctlr->use_gpio_descriptors = true;
 
 	ret = devm_spi_register_controller(&pdev->dev, ctlr);
 	if (ret) {
-- 
2.35.1.1320.gc452695387.dirty


