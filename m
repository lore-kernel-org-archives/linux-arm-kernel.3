Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDBCC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 06:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xn1GsXy/diGxVFrv85ZRHExp7S4RFK96jXwzNpNnSoI=; b=RTkPt65CtZypJNLUOf2pdrl6wj
	wEYkQj9XHPWhYnZIg+PdbZpVh1rpORG0HrYGXNzLCBZaw18+U5BD+ali/IauK0t6o6Wc6lBdKjBup
	1Jm6NGJYOqN1n9lV3R5EHhzsUYQ3Rj8RktaP1rPuLXiRi7S6bO2HIhBcLBzxyv7u7iMwNk5Y9TVIL
	I9KYxW5GZjCbZpsZFzoKyQpyS1w/z+XjSwSfEPOUgIN/B0RYzOPGO0ma56CUPlqUVNoYr4lDscHEq
	Lq3y1Tzin5ROVGGnghHlfjXBehRgryWW53SYP56TWw/0kPTaAhsLydlqVzqGakw6vh9cr8sZmZmDD
	zCdSTXmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKA7D-0000000CHXI-0Vsp;
	Wed, 28 May 2025 06:18:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKA31-0000000CH7B-03OZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 06:13:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1748412835; x=1779948835;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=timdkqszBy9pRJGN5hJ0FwkI0yGkdV1tziqvIcqNk+w=;
  b=OWatpCnLvhiWTMp8VyDL6TI8fIOdj8xuzcAGLjSwkvk9JAQO3d1IrmAl
   7ltb/OetaXvVcSckB+aPKzL0fYfwSRmv0VbiJ/wgk9XBIXtMLh4tLO2as
   X7sA1UsMydlPF7U/wSAqFGI0uJz7NU4boLrLH/l3dWInWZbO/uPS7WZ6d
   UjrL4fntwtUaIZIf/N5yOoXfSnMI2y7kmG9qDsnHWl7VjEuHP56MgC+pV
   GOe+U5oOl3xMjEggJPVkRSnS0aeMJ4osLxCf5bBORtCXLghPaBiPhoV7M
   1SIcmKjqt4p6Bs9rFR4FZcrSJCrp5UIxnpuCuK3m0viQKSv9rFF9KO15O
   Q==;
X-CSE-ConnectionGUID: Na4ii3iOTbObYzT6z7QrlA==
X-CSE-MsgGUID: /JIRnDJ9QduRg7sJME2snQ==
X-IronPort-AV: E=Sophos;i="6.15,320,1739862000"; 
   d="scan'208";a="42149725"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 May 2025 23:13:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 27 May 2025 23:13:23 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 27 May 2025 23:13:20 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 28 May 2025 11:43:05 +0530
Subject: [PATCH 2/2] counter: microchip-tcb-capture: Add DMA support for
 TC_RAB register reads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250528-mchp-tcb-dma-v1-2-083a41fb7b51@microchip.com>
References: <20250528-mchp-tcb-dma-v1-0-083a41fb7b51@microchip.com>
In-Reply-To: <20250528-mchp-tcb-dma-v1-0-083a41fb7b51@microchip.com>
To: Kamel Bouhara <kamel.bouhara@bootlin.com>, William Breathitt Gray
	<wbg@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dharma Balasubiramani
	<dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748412791; l=5988;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=timdkqszBy9pRJGN5hJ0FwkI0yGkdV1tziqvIcqNk+w=;
 b=kPxGwSciC4VTlx2DjWq3wGdOzg0lsJ2YPOQbl09O2vKiubiXkJp0NNdYlmqYdQtozf2ws0mrT
 dhSgpNfyYhMDglCAnrOIjUz24hCHa9UU4MXRWgLVVcf1Q8F0yXkqeEC
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_231355_063417_ABC1BA74 
X-CRM114-Status: GOOD (  21.01  )
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

Add optional DMA-based data transfer support to read the TC_RAB register,
which provides the next unread captured value from either RA or RB. This
improves performance and offloads CPU when mchp,use-dma-cap is enabled in
the device tree.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 drivers/counter/microchip-tcb-capture.c | 110 +++++++++++++++++++++++++++++++-
 include/soc/at91/atmel_tcb.h            |   1 +
 2 files changed, 108 insertions(+), 3 deletions(-)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index 9634da75bd1a..fa177edc6803 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -6,6 +6,9 @@
  */
 #include <linux/clk.h>
 #include <linux/counter.h>
+#include <linux/dmaengine.h>
+#include <linux/dma-direction.h>
+#include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -28,9 +31,19 @@
 #define ATMEL_TC_QDEN			BIT(8)
 #define ATMEL_TC_POSEN			BIT(9)
 
+struct mchp_tc_dma {
+	struct dma_chan *chan;
+	struct dma_slave_config slave_cfg;
+	u32 *buf;
+	dma_addr_t addr;
+	phys_addr_t phy_addr;
+	bool enabled;
+};
+
 struct mchp_tc_data {
 	const struct atmel_tcb_config *tc_cfg;
 	struct platform_device *pdev;
+	struct mchp_tc_dma dma;
 	struct regmap *regmap;
 	void __iomem *base;
 	int qdec_mode;
@@ -74,6 +87,61 @@ static struct counter_synapse mchp_tc_count_synapses[] = {
 	}
 };
 
+static void mchp_tc_dma_remove(void *data)
+{
+	struct mchp_tc_data *priv = data;
+
+	if (priv->dma.buf)
+		dma_free_coherent(&priv->pdev->dev, sizeof(u32),
+				  priv->dma.buf, priv->dma.addr);
+
+	if (priv->dma.chan)
+		dma_release_channel(priv->dma.chan);
+}
+
+static int mchp_tc_dma_transfer(struct mchp_tc_data *priv, u32 *val)
+{
+	struct dma_async_tx_descriptor *desc;
+	struct device *dev = &priv->pdev->dev;
+	dma_cookie_t cookie;
+	int ret;
+
+	ret = dmaengine_slave_config(priv->dma.chan, &priv->dma.slave_cfg);
+	if (ret) {
+		dev_err(dev, "DMA slave_config failed (%d)\n", ret);
+		return ret;
+	}
+
+	desc = dmaengine_prep_dma_memcpy(priv->dma.chan,
+					 priv->dma.addr,
+					 priv->dma.slave_cfg.src_addr,
+					 sizeof(u32),
+					 DMA_CTRL_ACK | DMA_PREP_INTERRUPT);
+	if (!desc) {
+		dev_err(dev, "DMA prep descriptor failed\n");
+		return -ENOMEM;
+	}
+
+	cookie = dmaengine_submit(desc);
+	if (dma_submit_error(cookie)) {
+		dev_err(dev, "DMA submit error (%d)\n", cookie);
+		return cookie ?: -EIO;
+	}
+
+	dma_async_issue_pending(priv->dma.chan);
+
+	ret = dma_sync_wait(priv->dma.chan, cookie);
+	if (ret) {
+		dev_err(dev, "DMA transfer timed out (%d)\n", ret);
+		return ret;
+	}
+
+	/* Retrieve the 32-bit value the engine just copied */
+	*val = le32_to_cpu(*(u32 *)priv->dma.buf);
+
+	return 0;
+}
+
 static int mchp_tc_count_function_read(struct counter_device *counter,
 				       struct counter_count *count,
 				       enum counter_function *function)
@@ -260,20 +328,25 @@ static int mchp_tc_count_cap_read(struct counter_device *counter,
 				  struct counter_count *count, size_t idx, u64 *val)
 {
 	struct mchp_tc_data *const priv = counter_priv(counter);
-	u32 cnt;
+	u32 cnt, reg_offset;
 	int ret;
 
 	switch (idx) {
 	case COUNTER_MCHP_EXCAP_RA:
-		ret = regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], RA), &cnt);
+		reg_offset = ATMEL_TC_REG((priv->channel[0]), RA);
 		break;
 	case COUNTER_MCHP_EXCAP_RB:
-		ret = regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], RB), &cnt);
+		reg_offset = ATMEL_TC_REG((priv->channel[0]), RB);
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	if (!priv->dma.enabled)
+		ret = regmap_read(priv->regmap, reg_offset, &cnt);
+	else
+		ret = mchp_tc_dma_transfer(priv, &cnt);
+
 	if (ret < 0)
 		return ret;
 
@@ -578,6 +651,7 @@ static int mchp_tc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	priv->dma.phy_addr = parent_res->start;
 	priv->tc_cfg = tcb_config;
 	priv->regmap = regmap;
 	priv->pdev = pdev;
@@ -589,6 +663,36 @@ static int mchp_tc_probe(struct platform_device *pdev)
 	counter->num_signals = ARRAY_SIZE(mchp_tc_count_signals);
 	counter->signals = mchp_tc_count_signals;
 
+	/* Check the dma flag */
+	priv->dma.enabled = of_property_read_bool(np, "mchp,use-dma-cap") ? true : false;
+
+	if (priv->dma.enabled) {
+		/* Initialise DMA */
+		priv->dma.buf = dma_alloc_coherent(&pdev->dev, sizeof(u32),
+						   &priv->dma.addr, GFP_KERNEL);
+		if (!priv->dma.buf)
+			return -ENOMEM;
+
+		priv->dma.chan = dma_request_chan(&parent_pdev->dev, "rx");
+		if (IS_ERR(priv->dma.chan))
+			return -EINVAL;
+
+		dev_info(&pdev->dev, "Using %s (rx) for DMA transfers\n",
+			 dma_chan_name(priv->dma.chan));
+
+		/* Configure DMA channel to read TC AB register */
+		priv->dma.slave_cfg.direction = DMA_DEV_TO_MEM;
+		priv->dma.slave_cfg.src_addr = priv->dma.phy_addr + ATMEL_TC_REG(priv->channel[0],
+										 RAB);
+		priv->dma.slave_cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		priv->dma.slave_cfg.src_maxburst = 1;
+		priv->dma.slave_cfg.dst_maxburst = 1;
+
+		ret = devm_add_action_or_reset(&pdev->dev, mchp_tc_dma_remove, priv);
+		if (ret)
+			return ret;
+	}
+
 	i = of_irq_get(np->parent, 0);
 	if (i == -EPROBE_DEFER)
 		return -EPROBE_DEFER;
diff --git a/include/soc/at91/atmel_tcb.h b/include/soc/at91/atmel_tcb.h
index 26b56a07bd1f..9fad7f58a56a 100644
--- a/include/soc/at91/atmel_tcb.h
+++ b/include/soc/at91/atmel_tcb.h
@@ -243,6 +243,7 @@ extern const u8 atmel_tc_divisors[5];
 #define ATMEL_TC_RA	0x14		/* register A */
 #define ATMEL_TC_RB	0x18		/* register B */
 #define ATMEL_TC_RC	0x1c		/* register C */
+#define ATMEL_TC_RAB	0x0c		/* register AB */
 
 #define ATMEL_TC_SR	0x20		/* status (read-only) */
 /* Status-only flags */

-- 
2.43.0


