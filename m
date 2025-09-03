Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD669CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 16:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJbP+jkiv+uFpdeVaMS8y2Yuusv2pdSxLvYXoPdMVb4=; b=YN77JlzKBlcYiiVeC97JFDO5Ns
	Z8jgzZb0g3FYcJISIlaFo/7DYkEmjFsJmJy5Hz5YEaDqWLXfnI3OvgcP8JsrBvCvLOhNF3nK5lh1u
	QHAFqqFi69ZS7hoDSz5DPgzHA/8CloR1Zg5MrILhxCYZ0tGts/8DwFcEEW9ZUCIr8NgiIZvRdyqqI
	aILPqLOL7H1X9tkUhFU3IE687zEFLgZ9us9bn2T8TLYnY1EWmARcQM9V05LaoyA0uE1gGREVcDv0v
	O1x6EYvOYZkZlfO8ufc6kuAW/pgTwBizKJcW592MAnUiW/npPNfTd/ASSsYpX5TrJViAmBHLz5V93
	rLWL9Urg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utqG6-000000072zl-1pG0;
	Wed, 03 Sep 2025 16:22:54 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnBp-00000006W5F-2jcT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:06:21 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1utnBm-00006Z-2s; Wed, 03 Sep 2025 15:06:14 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Wed, 03 Sep 2025 15:06:19 +0200
Subject: [PATCH 11/11] dmaengine: imx-sdma: fix spba-bus handling for
 i.MX8M
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-v6-16-topic-sdma-v1-11-ac7bab629e8b@pengutronix.de>
References: <20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de>
In-Reply-To: <20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jiada Wang <jiada_wang@mentor.com>
Cc: dmaengine@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_060617_832526_DED2F116 
X-CRM114-Status: GOOD (  18.77  )
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

Starting with i.MX8M* devices there are multiple spba-busses so we can't
just search the whole DT for the first spba-bus match and take it.
Instead we need to check for each device to which bus it belongs and
setup the spba_{start,end}_addr accordingly per sdma_channel.

While on it, don't ignore errors from of_address_to_resource() if they
are valid.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/dma/imx-sdma.c | 56 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 18 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index c31785977351163d6fddf4d8b2f90dfebb508400..3ef415aa578a96e35a969ac2488d08bcab9fadc3 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -461,6 +461,8 @@ struct sdma_channel {
 	dma_addr_t			per_address, per_address2;
 	unsigned long			event_mask[2];
 	unsigned long			watermark_level;
+	u32				spba_start_addr;
+	u32				spba_end_addr;
 	u32				shp_addr, per_addr;
 	enum dma_status			status;
 	struct imx_dma_data		data;
@@ -534,8 +536,6 @@ struct sdma_engine {
 	u32				script_number;
 	struct sdma_script_start_addrs	*script_addrs;
 	const struct sdma_driver_data	*drvdata;
-	u32				spba_start_addr;
-	u32				spba_end_addr;
 	unsigned int			irq;
 	dma_addr_t			bd0_phys;
 	struct sdma_buffer_descriptor	*bd0;
@@ -1236,8 +1236,6 @@ static void sdma_channel_synchronize(struct dma_chan *chan)
 
 static void sdma_set_watermarklevel_for_p2p(struct sdma_channel *sdmac)
 {
-	struct sdma_engine *sdma = sdmac->sdma;
-
 	int lwml = sdmac->watermark_level & SDMA_WATERMARK_LEVEL_LWML;
 	int hwml = (sdmac->watermark_level & SDMA_WATERMARK_LEVEL_HWML) >> 16;
 
@@ -1263,12 +1261,12 @@ static void sdma_set_watermarklevel_for_p2p(struct sdma_channel *sdmac)
 		swap(sdmac->event_mask[0], sdmac->event_mask[1]);
 	}
 
-	if (sdmac->per_address2 >= sdma->spba_start_addr &&
-			sdmac->per_address2 <= sdma->spba_end_addr)
+	if (sdmac->per_address2 >= sdmac->spba_start_addr &&
+			sdmac->per_address2 <= sdmac->spba_end_addr)
 		sdmac->watermark_level |= SDMA_WATERMARK_LEVEL_SP;
 
-	if (sdmac->per_address >= sdma->spba_start_addr &&
-			sdmac->per_address <= sdma->spba_end_addr)
+	if (sdmac->per_address >= sdmac->spba_start_addr &&
+			sdmac->per_address <= sdmac->spba_end_addr)
 		sdmac->watermark_level |= SDMA_WATERMARK_LEVEL_DP;
 
 	sdmac->watermark_level |= SDMA_WATERMARK_LEVEL_CONT;
@@ -1447,6 +1445,31 @@ static void sdma_desc_free(struct virt_dma_desc *vd)
 	kfree(desc);
 }
 
+static int sdma_config_spba_slave(struct dma_chan *chan)
+{
+	struct sdma_channel *sdmac = to_sdma_chan(chan);
+	struct device_node *spba_bus;
+	struct resource spba_res;
+	int ret;
+
+	spba_bus = of_get_parent(chan->slave->of_node);
+	/* Device doesn't belong to the spba-bus */
+	if (!of_device_is_compatible(spba_bus, "fsl,spba-bus"))
+		return 0;
+
+	ret = of_address_to_resource(spba_bus, 0, &spba_res);
+	of_node_put(spba_bus);
+	if (ret) {
+		dev_err(sdmac->sdma->dev, "Failed to get spba-bus resources\n");
+		return -EINVAL;
+	}
+
+	sdmac->spba_start_addr = spba_res.start;
+	sdmac->spba_end_addr = spba_res.end;
+
+	return 0;
+}
+
 static int sdma_alloc_chan_resources(struct dma_chan *chan)
 {
 	struct sdma_channel *sdmac = to_sdma_chan(chan);
@@ -1527,6 +1550,8 @@ static void sdma_free_chan_resources(struct dma_chan *chan)
 
 	sdmac->event_id0 = 0;
 	sdmac->event_id1 = 0;
+	sdmac->spba_start_addr = 0;
+	sdmac->spba_end_addr = 0;
 
 	sdma_set_channel_priority(sdmac, 0);
 
@@ -1837,6 +1862,7 @@ static int sdma_config(struct dma_chan *chan,
 {
 	struct sdma_channel *sdmac = to_sdma_chan(chan);
 	struct sdma_engine *sdma = sdmac->sdma;
+	int ret;
 
 	memcpy(&sdmac->slave_config, dmaengine_cfg, sizeof(*dmaengine_cfg));
 
@@ -1867,6 +1893,10 @@ static int sdma_config(struct dma_chan *chan,
 		sdma_event_enable(sdmac, sdmac->event_id1);
 	}
 
+	ret = sdma_config_spba_slave(chan);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -2251,11 +2281,9 @@ static int sdma_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *spba_bus;
 	const char *fw_name;
 	int ret;
 	int irq;
-	struct resource spba_res;
 	int i;
 	struct sdma_engine *sdma;
 	s32 *saddr_arr;
@@ -2379,14 +2407,6 @@ static int sdma_probe(struct platform_device *pdev)
 
 	devm_add_action_or_reset(dev, sdma_dma_of_dma_controller_unregister_action, sdma);
 
-	spba_bus = of_find_compatible_node(NULL, NULL, "fsl,spba-bus");
-	ret = of_address_to_resource(spba_bus, 0, &spba_res);
-	if (!ret) {
-		sdma->spba_start_addr = spba_res.start;
-		sdma->spba_end_addr = spba_res.end;
-	}
-	of_node_put(spba_bus);
-
 	/*
 	 * Because that device tree does not encode ROM script address,
 	 * the RAM script in firmware is mandatory for device tree

-- 
2.47.2


