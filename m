Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8065FD43370
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 15:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLZv2hZapQf0Pn2+hYeiUM3OJTQ+xkP1KiCe6pE/VBY=; b=BMFCc9UqHwBAU/eUXvagH5u6FP
	mRbe19NS7Zx0SD8nig+EXZo2w2WQWYNIdnoDptebNHphtWRYGQujZy4XZGB6hlKcP+F2sW/yDR3xi
	gKp51LqikFjoYp7wZNO6TqYk/pUE0lir1DlkfH+bjfJktypzsPCKbSe0sjpzeTypkHUhbwL3lX8/k
	RpaF5DLs6e62Ua4323tgSzezw8nRg/uJmL4VJXS0lhCJxiloyYnMBlGjLwqp/OTNgD8dOANHTtJlN
	0MU6f8VBY7FWmun2J+ov07ILt/g0UhR7FHlrLkGPvwlO7nCog/PZ7gGtpLNpwCJM2uZWRLN1d6M3X
	1qtlY0yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t94eZ-00000007TOO-0KDh;
	Thu, 07 Nov 2024 15:42:35 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t94Xs-00000007ScW-2wKa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 15:37:40 +0000
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1t94Xf-0005DD-T8; Thu, 07 Nov 2024 16:35:27 +0100
From: Jonas Rebmann <jre@pengutronix.de>
Date: Thu, 07 Nov 2024 16:35:21 +0100
Subject: [PATCH 2/2] spi: imx: support word delay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-imx-spi-word-delay-v1-2-2a969214d796@pengutronix.de>
References: <20241107-imx-spi-word-delay-v1-0-2a969214d796@pengutronix.de>
In-Reply-To: <20241107-imx-spi-word-delay-v1-0-2a969214d796@pengutronix.de>
To: Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_073540_788829_04C71003 
X-CRM114-Status: GOOD (  23.70  )
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

Implement support for the word delay feature of i.MX51 (and onwards) via
the ECSPI interface.

Convert the requested delay to SPI cycles and account for an extra
inter-word delay inserted by the controller in addition to the requested
number of cycles, which was observed when testing this patch.

Disable dynamic burst when word delay is set. As the configurable delay
period in the controller is inserted after bursts, the burst length must
equal the word length.

Account for word delay in the transfer time estimation for
polling_limit_us.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 drivers/spi/spi-imx.c | 93 +++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 83 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 65a8303b80b1191cd2c19d61f88836e7fd3c7ae9..c50c256e6e695659c23d5292949a98bda0a2cd1a 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -13,7 +13,9 @@
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
+#include <linux/math.h>
 #include <linux/module.h>
+#include <linux/overflow.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -302,6 +304,18 @@ static bool spi_imx_can_dma(struct spi_controller *controller, struct spi_device
 #define MX51_ECSPI_STAT		0x18
 #define MX51_ECSPI_STAT_RR		(1 <<  3)
 
+#define MX51_ECSPI_PERIOD	0x1c
+#define MX51_ECSPI_PERIOD_MASK		0x7fff
+/*
+ * As measured on the i.MX6, the SPI host controller inserts a 4 SPI-Clock
+ * (SCLK) delay after each burst if the PERIOD reg is 0x0. This value will be
+ * called MX51_ECSPI_PERIOD_MIN_DELAY_SCK.
+ *
+ * If the PERIOD register is != 0, the controller inserts a delay of
+ * MX51_ECSPI_PERIOD_MIN_DELAY_SCK + register value + 1 SCLK after each burst.
+ */
+#define MX51_ECSPI_PERIOD_MIN_DELAY_SCK 4
+
 #define MX51_ECSPI_TESTREG	0x20
 #define MX51_ECSPI_TESTREG_LBC	BIT(31)
 
@@ -653,6 +667,7 @@ static int mx51_ecspi_prepare_transfer(struct spi_imx_data *spi_imx,
 				       struct spi_device *spi, struct spi_transfer *t)
 {
 	u32 ctrl = readl(spi_imx->base + MX51_ECSPI_CTRL);
+	u64 word_delay_sck;
 	u32 clk;
 
 	/* Clear BL field and set the right value */
@@ -684,6 +699,49 @@ static int mx51_ecspi_prepare_transfer(struct spi_imx_data *spi_imx,
 
 	writel(ctrl, spi_imx->base + MX51_ECSPI_CTRL);
 
+	/* calculate word delay in SPI Clock (SCLK) cycles */
+	if (t->word_delay.value == 0) {
+		word_delay_sck = 0;
+	} else if (t->word_delay.unit == SPI_DELAY_UNIT_SCK) {
+		word_delay_sck = t->word_delay.value;
+
+		if (word_delay_sck <= MX51_ECSPI_PERIOD_MIN_DELAY_SCK)
+			word_delay_sck = 0;
+		else if (word_delay_sck <= MX51_ECSPI_PERIOD_MIN_DELAY_SCK + 1)
+			word_delay_sck = 1;
+		else
+			word_delay_sck -= MX51_ECSPI_PERIOD_MIN_DELAY_SCK + 1;
+	} else {
+		int word_delay_ns;
+
+		word_delay_ns = spi_delay_to_ns(&t->word_delay, t);
+		if (word_delay_ns < 0)
+			return word_delay_ns;
+
+		if (word_delay_ns <= mul_u64_u32_div(NSEC_PER_SEC,
+						     MX51_ECSPI_PERIOD_MIN_DELAY_SCK,
+						     spi_imx->spi_bus_clk)) {
+			word_delay_sck = 0;
+		} else if (word_delay_ns <= mul_u64_u32_div(NSEC_PER_SEC,
+							    MX51_ECSPI_PERIOD_MIN_DELAY_SCK + 1,
+							    spi_imx->spi_bus_clk)) {
+			word_delay_sck = 1;
+		} else {
+			word_delay_ns -= mul_u64_u32_div(NSEC_PER_SEC,
+							 MX51_ECSPI_PERIOD_MIN_DELAY_SCK + 1,
+							 spi_imx->spi_bus_clk);
+
+			word_delay_sck = DIV_U64_ROUND_UP((u64)word_delay_ns * spi_imx->spi_bus_clk,
+							  NSEC_PER_SEC);
+		}
+	}
+
+	if (!FIELD_FIT(MX51_ECSPI_PERIOD_MASK, word_delay_sck))
+		return -EINVAL;
+
+	writel(FIELD_PREP(MX51_ECSPI_PERIOD_MASK, word_delay_sck),
+	       spi_imx->base + MX51_ECSPI_PERIOD);
+
 	return 0;
 }
 
@@ -1264,11 +1322,13 @@ static int spi_imx_setupxfer(struct spi_device *spi,
 
 	/*
 	 * Initialize the functions for transfer. To transfer non byte-aligned
-	 * words, we have to use multiple word-size bursts, we can't use
-	 * dynamic_burst in that case.
+	 * words, we have to use multiple word-size bursts. To insert word
+	 * delay, the burst size has to equal the word size. We can't use
+	 * dynamic_burst in these cases.
 	 */
 	if (spi_imx->devtype_data->dynamic_burst && !spi_imx->target_mode &&
 	    !(spi->mode & SPI_CS_WORD) &&
+	    !(t->word_delay.value) &&
 	    (spi_imx->bits_per_word == 8 ||
 	    spi_imx->bits_per_word == 16 ||
 	    spi_imx->bits_per_word == 32)) {
@@ -1611,12 +1671,30 @@ static int spi_imx_pio_transfer_target(struct spi_device *spi,
 	return ret;
 }
 
+static unsigned int spi_imx_transfer_estimate_time_us(struct spi_transfer *transfer)
+{
+	u64 result;
+
+	result = DIV_U64_ROUND_CLOSEST((u64)USEC_PER_SEC * transfer->len * BITS_PER_BYTE,
+				       transfer->effective_speed_hz);
+	if (transfer->word_delay.value) {
+		unsigned int word_delay_us;
+		unsigned int words;
+
+		words = DIV_ROUND_UP(transfer->len * BITS_PER_BYTE, transfer->bits_per_word);
+		word_delay_us = DIV_ROUND_CLOSEST(spi_delay_to_ns(&transfer->word_delay, transfer),
+						  NSEC_PER_USEC);
+		result += words * word_delay_us;
+	}
+
+	return min(result, U32_MAX);
+}
+
 static int spi_imx_transfer_one(struct spi_controller *controller,
 				struct spi_device *spi,
 				struct spi_transfer *transfer)
 {
 	struct spi_imx_data *spi_imx = spi_controller_get_devdata(spi->controller);
-	unsigned long hz_per_byte, byte_limit;
 
 	spi_imx_setupxfer(spi, transfer);
 	transfer->effective_speed_hz = spi_imx->spi_bus_clk;
@@ -1635,15 +1713,10 @@ static int spi_imx_transfer_one(struct spi_controller *controller,
 	 */
 	if (spi_imx->usedma)
 		return spi_imx_dma_transfer(spi_imx, transfer);
-	/*
-	 * Calculate the estimated time in us the transfer runs. Find
-	 * the number of Hz per byte per polling limit.
-	 */
-	hz_per_byte = polling_limit_us ? ((8 + 4) * USEC_PER_SEC) / polling_limit_us : 0;
-	byte_limit = hz_per_byte ? transfer->effective_speed_hz / hz_per_byte : 1;
 
 	/* run in polling mode for short transfers */
-	if (transfer->len < byte_limit)
+	if (transfer->len == 1 || (polling_limit_us &&
+				   spi_imx_transfer_estimate_time_us(transfer) < polling_limit_us))
 		return spi_imx_poll_transfer(spi, transfer);
 
 	return spi_imx_pio_transfer(spi, transfer);

-- 
2.39.5


