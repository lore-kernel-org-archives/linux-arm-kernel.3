Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E79D41C04
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 12:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMEezIrbG45XSlk8ozlnEhS19DhrTeauVnopkxDTc54=; b=tNick3m0bcBMAX9bhh/6wFgUiI
	Gbyz6tN+Y9us0NphQu06hvd6CFuJaCXvm+WbcPRS8hi33V4/0KcqYYzq4GubH46iY/qwVQNUSpB9V
	X3qx2bXp+kDZ6y8mwsU1BgnD3bnHV9+VFznsSXBqBphPqvmxIvjMO65vbXU6sVqB4STSY7t67erxx
	3iayvs1M9H2PVzZoAAxlJ7n2lnta2GNQHET0Y/RmQEXvIJmO9/Fe6SbZfO2ivSuNXwimC/dm/sx3m
	/4opEJokurNrka6VICo5oe6yu8M0PWj6o0omb2Mzmaac2l1db9LYA6E+amisUSO/FVOS7s3ZCWwgK
	YH6BGiww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBCQK-00000006kwa-0aMW;
	Wed, 13 Nov 2024 12:24:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBCKm-00000006jpn-1riW
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Nov 2024 12:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GMEezIrbG45XSlk8ozlnEhS19DhrTeauVnopkxDTc54=; b=ZU2kbsAkfQCC2VAp83ETJ0Xerm
	pSRyrm0c4dVdcqOC7SpUCcg0LIgT9gGZYCpIC4B0xKk41BsTq4CfiDPKcPA4sAgfTcKUxPqkISbjz
	mArzj+u+f/1LX9D3DQI2Ce/eFW0U0NOOekwNinJQnREidBpPAn05c2aZtUE8KRuq20KXSx5XydKlC
	H0v8BnHYIyb+3QleokbflBLauidXsiny0qI5jN49J8ZBk2LGuq3vj2/L6rxwwaPZpdjHGX+Xjx2An
	dMovdlIah5KqEZjCBJAtH4ACnAVYCTx6ic5xqbSmSCIUKSfjt5sDUmeqwYM4NwbwG9HgB7kUDwmP0
	OjaqsWiQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBCKj-0000000DGfX-0DHf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 12:18:54 +0000
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1tBCKh-0004eO-30; Wed, 13 Nov 2024 13:18:51 +0100
From: Jonas Rebmann <jre@pengutronix.de>
Date: Wed, 13 Nov 2024 13:18:32 +0100
Subject: [PATCH v2 2/2] spi: imx: support word delay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-imx-spi-word-delay-v2-2-2b65b737bf29@pengutronix.de>
References: <20241113-imx-spi-word-delay-v2-0-2b65b737bf29@pengutronix.de>
In-Reply-To: <20241113-imx-spi-word-delay-v2-0-2b65b737bf29@pengutronix.de>
To: Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: kernel@pengutronix.de, linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6686; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=RB5ncjyV6HWHMW6Ku4phOVB4ibjx4PCnoNOb1IvN9EM=;
 b=owGbwMvMwCF2ZcYT3onnbjcwnlZLYkg3malVFDOraPW/RctcxDtUpgq2iKxlYhTctrdc5z67u
 neDiwt/RykLgxgHg6yYIkusmpyCkLH/dbNKu1iYOaxMIEMYuDgFYCKcbQz/9MQ51vGzK53eKVHZ
 rsbM3Pi11vLgu/AvYv+OxnJmlRVHM/wz5Wjf2X2oZuJ2hS0Xn72+ZHT+989FOQ2TDltVzE9n2f6
 eFQA=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_121853_300929_81BDF0C2 
X-CRM114-Status: GOOD (  23.65  )
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
 drivers/spi/spi-imx.c | 95 +++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 85 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 65a8303b80b1191cd2c19d61f88836e7fd3c7ae9..29b83659b8036d1cffe076012ad5cb229509abd8 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -3,6 +3,7 @@
 // Copyright (C) 2008 Juergen Beisert
 
 #include <linux/bits.h>
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
@@ -13,7 +14,10 @@
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
+#include <linux/math.h>
+#include <linux/math64.h>
 #include <linux/module.h>
+#include <linux/overflow.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -302,6 +306,18 @@ static bool spi_imx_can_dma(struct spi_controller *controller, struct spi_device
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
 
@@ -653,6 +669,7 @@ static int mx51_ecspi_prepare_transfer(struct spi_imx_data *spi_imx,
 				       struct spi_device *spi, struct spi_transfer *t)
 {
 	u32 ctrl = readl(spi_imx->base + MX51_ECSPI_CTRL);
+	u64 word_delay_sck;
 	u32 clk;
 
 	/* Clear BL field and set the right value */
@@ -684,6 +701,49 @@ static int mx51_ecspi_prepare_transfer(struct spi_imx_data *spi_imx,
 
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
 
@@ -1264,11 +1324,13 @@ static int spi_imx_setupxfer(struct spi_device *spi,
 
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
@@ -1611,12 +1673,30 @@ static int spi_imx_pio_transfer_target(struct spi_device *spi,
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
@@ -1635,15 +1715,10 @@ static int spi_imx_transfer_one(struct spi_controller *controller,
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


