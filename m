Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FE6CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6URo8niGMKARuPcsUCTDXFgaK8xd8lSeSzhNHpfQFaQ=; b=j4VBNHx1kc08CtatBtzieGznsF
	J/x1XWomIjo7RkzwbArogv78pH/Fb+HOvHr1IHbToGm8gA1aKK2mvJYEL/mvU6+56TOeD2UDuudCN
	DSPGiKpmQpCxJwb2Fddw4+NaJ0Owqb68TjHIHilDdlgj3nf6U/RTXrIyDJVnDXP7W5k29nEJGQt+9
	iyLt3HkvMej9rLdO/010zxXtgT8YFGjWZcPDUoaKE5Cl2M8oNgYYmvMCxiIBjIlOL4aI6p2RbwSPk
	8E/setUxf3i9cIcV5LnOxi1TFphrNfv+A84l3ZkRtC4S5IM3LbowS0OX3B2Axec1IE6wZWg8qZ+ZB
	sY2LTnFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDoT-0000000EK9M-1avt;
	Mon, 01 Sep 2025 23:19:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utBc3-0000000DtOE-2nbH;
	Mon, 01 Sep 2025 20:58:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69C2B4404D;
	Mon,  1 Sep 2025 20:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBAAFC4CEF0;
	Mon,  1 Sep 2025 20:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756760331;
	bh=znKJ9nC54lsSWItEe6JUCBFCQm719fqJmv5yai3fHu8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GIUjhL4GQvOjoPgdQY0cnraz804Xe8GSx+dO4IHEBQlEmKzYqNJlrFHa09KYPQ3bE
	 02zsCZqy0k2UvjkL2hD4rbLLa0AbGhGUn2l0cyVo4UJFtcYecLQsFtVgmdLCyBI8AO
	 +Qs/miBZsuE82EAGlmxeF1eresaQbC43JZl7pc7JFnQex9nDiY+7bZukMJHiYVscvn
	 W0jMUNU4CDpQLY1IJw84h00p2xPLAtEQ6aTM9z3F1C5eUHku2B2USokiP+tRY3gxbr
	 johs7pszS7tL/KTmcUPGbeVSefTsO/Mb1ccip3GHbjckgiF2VMk7ohy6QHL4bJJ/dH
	 oIdOzfr2/0xTw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 01 Sep 2025 22:58:07 +0200
Subject: [PATCH mt76 v2 11/14] wifi: mt76: Add rx_queue_init callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-mt7996-rro-rework-v2-11-1f95086b51d1@kernel.org>
References: <20250901-mt7996-rro-rework-v2-0-1f95086b51d1@kernel.org>
In-Reply-To: <20250901-mt7996-rro-rework-v2-0-1f95086b51d1@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Rex Lu <rex.lu@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_135851_749408_30BF5C62 
X-CRM114-Status: GOOD (  10.61  )
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
2.50.1


