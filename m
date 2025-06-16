Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48CBC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGOH8Yvcz0WgyTH+Nb2rF8MG3xwZ18CiFbl2INC4Pwc=; b=jfVPMk1CMnrqqht5ICvU5wIXhy
	6DPlg3jYNlRavEHcE+hJ5ZcmMZhGWjdPBU7KQTz3kQMOY69MjjMv4v6lQdq/FT7cCkf1Td9uv/QHM
	ZNXwX6frardnvAippiwiuIb0UIymvO2z9eXf0x20mFf+JW6NpeDFCRHyAByp5yzeoNiX38/YtvlBu
	0yuKeN4TrnQl1AEHBKt0HXAr0oy7OJdiNxKAbKOAxgcjGs37eQ36mprxy7SOTxHSP/wVb+LGNZhvF
	S8NUszkiOgcwK2OFdaeqVqvWfwL4EVoI8P9AUKToxhMKaGiW36jxyx7JTldE5zuSFX2Jl/VenN/hm
	90FUAxKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRI9M-00000005gIW-2oup;
	Mon, 16 Jun 2025 22:17:56 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHtN-00000005e9D-0Bth
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 22:01:26 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750111283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NGOH8Yvcz0WgyTH+Nb2rF8MG3xwZ18CiFbl2INC4Pwc=;
	b=vpEA3/2lKQLW1KlQy0fAkRGHmm41rLVtpUYTk/FtQEClVaZDGiw59+7LhF+lpXDM4UzepZ
	fb4cLEp2SSBV37UlS50QI9aUP5JoKCOYg8XHGzaXk3p8SXV1m7VcZ9qcay0zX7+/bT9NfA
	vwKxcXFL30SFCIuAsagUKLA+gFHt3mw=
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
Subject: [PATCH v2 7/9] spi: zynqmp-gqspi: Configure SPI mode dynamically
Date: Mon, 16 Jun 2025 18:00:52 -0400
Message-Id: <20250616220054.3968946-8-sean.anderson@linux.dev>
In-Reply-To: <20250616220054.3968946-1-sean.anderson@linux.dev>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_150125_243456_A37226AA 
X-CRM114-Status: GOOD (  12.37  )
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

The SPI mode (phase/polarity) can change between spi_transfers. In
preparation for transfer_one support, program the SPI mode on every
operation instead of once during init.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

(no changes since v1)

 drivers/spi/spi-zynqmp-gqspi.c | 43 +++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index a17e77dc4e27..b36159dbaff0 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -184,7 +184,8 @@ struct qspi_platform_data {
  * @mode:		Defines the mode in which QSPI is operating
  * @data_completion:	completion structure
  * @op_lock:		Operational lock
- * @speed_hz:          Current SPI bus clock speed in hz
+ * @speed_hz:		Current SPI bus clock speed in hz
+ * @spi_mode:		Current SPI bus mode
  * @has_tapdelay:	Used for tapdelay register available in qspi
  */
 struct zynqmp_qspi {
@@ -207,6 +208,7 @@ struct zynqmp_qspi {
 	struct completion data_completion;
 	struct mutex op_lock;
 	u32 speed_hz;
+	u32 spi_mode;
 	bool has_tapdelay;
 };
 
@@ -387,16 +389,11 @@ static void zynqmp_qspi_init_hw(struct zynqmp_qspi *xqspi)
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
@@ -535,6 +532,7 @@ static inline u32 zynqmp_qspi_selectspimode(struct zynqmp_qspi *xqspi,
  *				transfer
  * @xqspi: Pointer to the zynqmp_qspi structure
  * @req_speed_hz: Requested frequency
+ * @mode: Requested SPI mode
  *
  * Sets the operational mode of QSPI controller for the next QSPI transfer and
  * sets the requested clock frequency.
@@ -551,7 +549,8 @@ static inline u32 zynqmp_qspi_selectspimode(struct zynqmp_qspi *xqspi,
  *	by the QSPI controller the driver will set the highest or lowest
  *	frequency supported by controller.
  */
-static int zynqmp_qspi_config_op(struct zynqmp_qspi *xqspi, u32 req_speed_hz)
+static int zynqmp_qspi_config_op(struct zynqmp_qspi *xqspi, u32 req_speed_hz,
+				 u32 mode)
 {
 	ulong clk_rate;
 	u32 config_reg, baud_rate_val = 0;
@@ -577,7 +576,23 @@ static int zynqmp_qspi_config_op(struct zynqmp_qspi *xqspi, u32 req_speed_hz)
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
 
@@ -1050,7 +1065,7 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
 	u64 opaddr;
 
 	mutex_lock(&xqspi->op_lock);
-	zynqmp_qspi_config_op(xqspi, op->max_freq);
+	zynqmp_qspi_config_op(xqspi, op->max_freq, mem->spi->mode);
 	zynqmp_qspi_chipselect(mem->spi, false);
 	genfifoentry |= xqspi->genfifocs;
 	genfifoentry |= xqspi->genfifobus;
-- 
2.35.1.1320.gc452695387.dirty


