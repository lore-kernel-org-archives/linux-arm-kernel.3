Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67F7CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jn6quJozA0dZ0o+Vt4UNa4IDJ23z5u6M24XuSHT1lfg=; b=YXrdgZ91GopKIwsBp838mxQgbB
	WJ26TSnEYQ2BtQL5sUm3xPyGfHZxHBDtcNFhDB9OeVuarXX4JxHlBiPPBYPGwalAk6vlWeur4e4Dp
	5f0ouKb+DAjKXS5YyzUW8EnXD+Za7/IClY0anwyb8IltZbgT2jvsOQiMYgrCSMcqo6QmIfgQl/CIt
	ou6u/RsFqs2yORXmLkIcO7UhxiJpP4gPcemaIv7BR0zQwtMFx8Wazx1zTTAWOetloJerqcsH/Cj0X
	48+w8D2EBaDva+APhapNi8ErU/8xm7GMzKbkLoSrX+OsFHl0qLAHoW8xttCt1+SRKlh4C35gLDeb3
	FHnOd1tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0SQ-00000008Alo-0yez;
	Tue, 09 Sep 2025 15:40:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuvH-000000066Dv-0Ypy;
	Tue, 09 Sep 2025 09:45:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 85A12601BA;
	Tue,  9 Sep 2025 09:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0BE4C4CEF4;
	Tue,  9 Sep 2025 09:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757411158;
	bh=rlFTvTC0egOdAE+QSLqXFbAwVR7McxUqvmf6yHKeZ0k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tiqvlMUMK2nh714lgMmesQZ0s6jpNoAaLvzc1ozUYMiltHDedmd2/1JsISpEdTaM0
	 M1xMY2kgCAFiMPDfRL6InlMwll6qzhTfMJszTj27SGL7EqPWDIH6HhJkVPYRhZUfea
	 Sr1o5XOrqkjW0i5ek4oH+5dXCgnBVuwiKWiZdVG77gJStF8wIO0byq96ISu7jx3hgC
	 qluJrHz0KXGLNJhXdxxNyLE/X8LuiejN6KkWGxF9tr1XWQi12G+tHLGoUJ1qqqIjCZ
	 RjC40FXpNhoo1qLgYHVw6xW+dV3bEYRlmvcK82xPgKAGlLiQGhWUdC2HgaL0R1Wxwz
	 2+haabaJ+QZ1A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 09 Sep 2025 11:45:21 +0200
Subject: [PATCH mt76 v5 13/16] wifi: mt76: Add rx_queue_init callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-mt7996-rro-rework-v5-13-7d66f6eb7795@kernel.org>
References: <20250909-mt7996-rro-rework-v5-0-7d66f6eb7795@kernel.org>
In-Reply-To: <20250909-mt7996-rro-rework-v5-0-7d66f6eb7795@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Rex Lu <rex.lu@mediatek.com>
X-Mailer: b4 0.14.2
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

Introduce rx_queue_init DMA callback. This is a preliminary patch to
configure RRO RX queues and decouple RRO logic from WED support.

Co-developed-by: Rex Lu <rex.lu@mediatek.com>
Signed-off-by: Rex Lu <rex.lu@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c  | 14 +++++++++++---
 drivers/net/wireless/mediatek/mt76/mt76.h |  4 ++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index b8bb8cdfb69bd6aa8102bff474d8a25a881fb29d..081a3f5d387864ad596fec93542797038eed26f1 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -937,6 +937,15 @@ int mt76_dma_rx_poll(struct napi_struct *napi, int budget)
 }
 EXPORT_SYMBOL_GPL(mt76_dma_rx_poll);
 
+static void
+mt76_dma_rx_queue_init(struct mt76_dev *dev, enum mt76_rxq_id qid,
+		       int (*poll)(struct napi_struct *napi, int budget))
+{
+	netif_napi_add(dev->napi_dev, &dev->napi[qid], poll);
+	mt76_dma_rx_fill_buf(dev, &dev->q_rx[qid], false);
+	napi_enable(&dev->napi[qid]);
+}
+
 static int
 mt76_dma_init(struct mt76_dev *dev,
 	      int (*poll)(struct napi_struct *napi, int budget))
@@ -973,9 +982,7 @@ mt76_dma_init(struct mt76_dev *dev,
 		    mt76_queue_is_wed_rro(&dev->q_rx[i]))
 			continue;
 
-		netif_napi_add(dev->napi_dev, &dev->napi[i], poll);
-		mt76_dma_rx_fill_buf(dev, &dev->q_rx[i], false);
-		napi_enable(&dev->napi[i]);
+		mt76_dma_rx_queue_init(dev, i, poll);
 	}
 
 	return 0;
@@ -988,6 +995,7 @@ static const struct mt76_queue_ops mt76_dma_ops = {
 	.tx_queue_skb_raw = mt76_dma_tx_queue_skb_raw,
 	.tx_queue_skb = mt76_dma_tx_queue_skb,
 	.tx_cleanup = mt76_dma_tx_cleanup,
+	.rx_queue_init = mt76_dma_rx_queue_init,
 	.rx_cleanup = mt76_dma_rx_cleanup,
 	.rx_reset = mt76_dma_rx_reset,
 	.kick = mt76_dma_kick_queue,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 60a3f13ac99125f66f3af406a2a37c25b257a762..8dcf593a0151310648043b5ac7528570c61aea0b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -286,6 +286,9 @@ struct mt76_queue_ops {
 	void (*tx_cleanup)(struct mt76_dev *dev, struct mt76_queue *q,
 			   bool flush);
 
+	void (*rx_queue_init)(struct mt76_dev *dev, enum mt76_rxq_id qid,
+			      int (*poll)(struct napi_struct *napi, int budget));
+
 	void (*rx_cleanup)(struct mt76_dev *dev, struct mt76_queue *q);
 
 	void (*kick)(struct mt76_dev *dev, struct mt76_queue *q);
@@ -1221,6 +1224,7 @@ static inline int mt76_wed_dma_setup(struct mt76_dev *dev, struct mt76_queue *q,
 #define mt76_tx_queue_skb(dev, ...)	(dev)->mt76.queue_ops->tx_queue_skb(&((dev)->mphy), __VA_ARGS__)
 #define mt76_queue_rx_reset(dev, ...)	(dev)->mt76.queue_ops->rx_reset(&((dev)->mt76), __VA_ARGS__)
 #define mt76_queue_tx_cleanup(dev, ...)	(dev)->mt76.queue_ops->tx_cleanup(&((dev)->mt76), __VA_ARGS__)
+#define mt76_queue_rx_init(dev, ...)	(dev)->mt76.queue_ops->rx_queue_init(&((dev)->mt76), __VA_ARGS__)
 #define mt76_queue_rx_cleanup(dev, ...)	(dev)->mt76.queue_ops->rx_cleanup(&((dev)->mt76), __VA_ARGS__)
 #define mt76_queue_kick(dev, ...)	(dev)->mt76.queue_ops->kick(&((dev)->mt76), __VA_ARGS__)
 #define mt76_queue_reset(dev, ...)	(dev)->mt76.queue_ops->reset_q(&((dev)->mt76), __VA_ARGS__)

-- 
2.51.0


