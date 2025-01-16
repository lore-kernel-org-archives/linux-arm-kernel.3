Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4496AC02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tR7y50rU9pbEgmCCWcpvtHmGNRcuzBMssivVLFdASTM=; b=gSmyXM3V7z0isjsN74A51SP2/9
	OCHm1HxEwfEE+R1h3CTFKCRYnFfB8eeeTOMaMTwP3rb5g2pqWUqxfPCLZ2ZC+SQGULez7TmULjZ92
	qaEATtBtK5c5uLv5Ahs3mog3HyBKzAj9VmaoCXoRmdKLp1wpb3JkF94bczYMhQrOBvI0rgAR2mZsC
	quLHz7b+935TRg/2l+cJ27d9VGYeEPB1w1W32i86jWGDvT9nWMkKrtoWWtwZTZgZwBhAmvyT+KmFg
	gKU23fQH5E74nEqwnt8E89VqPaMrF7jzJeiw2myDAsY1CrCg67yfM3QS0Qv174tQRe+gaf5rv74PP
	r0+eThWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZEr-0000000GQde-08uD;
	Thu, 16 Jan 2025 23:25:25 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZBA-0000000GOz8-0khG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:21:37 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737069694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tR7y50rU9pbEgmCCWcpvtHmGNRcuzBMssivVLFdASTM=;
	b=Jh8CpEMOdwgu6Pnxq6Tet2VsuOjmAyePO/p+VNLWKjABgzvL3GoB5J3dnw7d+pGa15dY7k
	S5bmlvFxriK1IFnsBAEETSMU66FWKCV5JGzYlVxaZm6Wm0r/gAyWaPfX387I8VOl3zrlj3
	v0NQ8XVoezZsntJrgtUCD6hgn6XMByw=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 3/7] spi: zynqmp-gqspi: Configure SPI mode dynamically
Date: Thu, 16 Jan 2025 18:21:13 -0500
Message-Id: <20250116232118.2694169-4-sean.anderson@linux.dev>
In-Reply-To: <20250116232118.2694169-1-sean.anderson@linux.dev>
References: <20250116232118.2694169-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_152136_370683_51E34A14 
X-CRM114-Status: GOOD (  11.88  )
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

The SPI mode (phase /polarity) can change between spi_transfers.  In
preparation for transfer_one support, program the SPI mode on every
operation instead of once during init.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/spi/spi-zynqmp-gqspi.c | 43 +++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index ba12adec8632..a1233897dc88 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -186,7 +186,8 @@ struct qspi_platform_data {
  * @mode:		Defines the mode in which QSPI is operating
  * @data_completion:	completion structure
  * @op_lock:		Operational lock
- * @speed_hz:          Current SPI bus clock speed in hz
+ * @speed_hz:		Current SPI bus clock speed in hz
+ * @spi_mode:		Current SPI bus mode
  * @has_tapdelay:	Used for tapdelay register available in qspi
  */
 struct zynqmp_qspi {
@@ -210,6 +211,7 @@ struct zynqmp_qspi {
 	struct completion data_completion;
 	struct mutex op_lock;
 	u32 speed_hz;
+	u32 spi_mode;
 	bool has_tapdelay;
 };
 
@@ -397,16 +399,11 @@ static int zynqmp_qspi_init_hw(struct zynqmp_qspi *xqspi)
 	config_reg |= GQSPI_CFG_WP_HOLD_MASK;
 	/* Clear pre-scalar by default */
 	config_reg &= ~GQSPI_CFG_BAUD_RATE_DIV_MASK;
-	/* Set CPHA */
-	if (xqspi->ctlr->mode_bits & SPI_CPHA)
-		config_reg |= GQSPI_CFG_CLK_PHA_MASK;
-	else
-		config_reg &= ~GQSPI_CFG_CLK_PHA_MASK;
-	/* Set CPOL */
-	if (xqspi->ctlr->mode_bits & SPI_CPOL)
-		config_reg |= GQSPI_CFG_CLK_POL_MASK;
-	else
-		config_reg &= ~GQSPI_CFG_CLK_POL_MASK;
+
+	/* Set default mode */
+	xqspi->spi_mode = SPI_MODE_3;
+	config_reg |= GQSPI_CFG_CLK_PHA_MASK;
+	config_reg |= GQSPI_CFG_CLK_POL_MASK;
 
 	/* Set the clock frequency */
 	clk_rate = clk_get_rate(xqspi->refclk);
@@ -547,6 +544,7 @@ static inline u32 zynqmp_qspi_selectspimode(struct zynqmp_qspi *xqspi,
  *				transfer
  * @xqspi: Pointer to the zynqmp_qspi structure
  * @req_speed_hz: Requested frequency
+ * @mode: Requested SPI mode
  *
  * Sets the operational mode of QSPI controller for the next QSPI transfer and
  * sets the requested clock frequency.
@@ -563,7 +561,8 @@ static inline u32 zynqmp_qspi_selectspimode(struct zynqmp_qspi *xqspi,
  *	by the QSPI controller the driver will set the highest or lowest
  *	frequency supported by controller.
  */
-static int zynqmp_qspi_config_op(struct zynqmp_qspi *xqspi, u32 req_speed_hz)
+static int zynqmp_qspi_config_op(struct zynqmp_qspi *xqspi, u32 req_speed_hz,
+				 u32 mode)
 {
 	ulong clk_rate;
 	u32 config_reg, baud_rate_val = 0;
@@ -589,7 +588,23 @@ static int zynqmp_qspi_config_op(struct zynqmp_qspi *xqspi, u32 req_speed_hz)
 		zynqmp_qspi_set_tapdelay(xqspi, baud_rate_val);
 	}
 
-	dev_dbg(xqspi->dev, "config speed %u\n", req_speed_hz);
+	mode &= SPI_MODE_X_MASK;
+	if (xqspi->spi_mode != mode) {
+		xqspi->spi_mode = mode;
+
+		config_reg = zynqmp_gqspi_read(xqspi, GQSPI_CONFIG_OFST);
+		if (mode & SPI_CPHA)
+			config_reg |= GQSPI_CFG_CLK_PHA_MASK;
+		else
+			config_reg &= ~GQSPI_CFG_CLK_PHA_MASK;
+		if (mode & SPI_CPOL)
+			config_reg |= GQSPI_CFG_CLK_POL_MASK;
+		else
+			config_reg &= ~GQSPI_CFG_CLK_POL_MASK;
+		zynqmp_gqspi_write(xqspi, GQSPI_CONFIG_OFST, config_reg);
+	}
+
+	dev_dbg(xqspi->dev, "config speed %u mode %x\n", req_speed_hz, mode);
 	return 0;
 }
 
@@ -1091,7 +1106,7 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
 		op->dummy.buswidth, op->data.buswidth);
 
 	mutex_lock(&xqspi->op_lock);
-	zynqmp_qspi_config_op(xqspi, mem->spi->max_speed_hz);
+	zynqmp_qspi_config_op(xqspi, mem->spi->max_speed_hz, mem->spi->mode);
 	zynqmp_qspi_chipselect(mem->spi, false);
 	genfifoentry |= xqspi->genfifocs;
 	genfifoentry |= xqspi->genfifobus;
-- 
2.35.1.1320.gc452695387.dirty


