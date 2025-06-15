Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8854EC71135
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 15:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+4Fhd4ocII9lpkmXR6H0SugqzwdoLPQH4LwtiRqyCc=; b=GYR4pTY/8u0JVkeGGaYQ0UWoAw
	BVVrVrGP8WKPuFoXD8BAm5P5qJjWrK1cirfyN4XnYXIzjarXvu3YPQRoggRDu9YuEG/diSgCOut0j
	rSEsBbZMrdwa5GgmDcpCT0yDm+0a6jhSW6e8jyLilEs+abZwOlaAHl3YiBENN0Zzk8rtH8velAXSk
	0QwnHl2SslJhzrRpL+qqAvF9jQ1xU7Wz6mr00+hcXfNe/6xc4cPfSI7koAJXfR0kbzHM8d7lOrWeT
	vuIWxOpefgBmn+3iNVaXJpVhKB9X+VhVLUfKGIQ3Kew/n4DFTIE2wIbbEFTOd//FhjbGuFRKJQU9o
	19sXZy4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQp0S-00000002ams-3qgJ;
	Sun, 15 Jun 2025 15:10:48 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQoti-00000002aDs-3qrY;
	Sun, 15 Jun 2025 15:03:53 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 2823B5FBA1;
	Sun, 15 Jun 2025 15:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1749999829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8+4Fhd4ocII9lpkmXR6H0SugqzwdoLPQH4LwtiRqyCc=;
	b=PsANyjPF0b03jF6W/HJSynxOLkuwREAJS8ozumrnEefluiJCFdhSv+DO19RftOA3dkvbWd
	L9BaHERIPEj2CI5qs9IdVIbA2IhVsKAf21J5JNEvC0TlW1OJhI9dFvLd/my/54OXy3py0b
	KeofimBCKKNtw0Wb3VxRsxVKQTQh+hA=
Received: from frank-u24.. (fttx-pool-217.61.157.124.bambit.de [217.61.157.124])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id E0D4F1226A7;
	Sun, 15 Jun 2025 15:03:48 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Simon Horman <horms@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>
Subject: [net-next v3 2/3] net: ethernet: mtk_eth_soc: add consts for irq index
Date: Sun, 15 Jun 2025 17:03:17 +0200
Message-ID: <20250615150333.166202-3-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250615150333.166202-1-linux@fw-web.de>
References: <20250615150333.166202-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_080351_244836_C5AB3BCF 
X-CRM114-Status: GOOD (  16.30  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Use consts instead of fixed integers for accessing IRQ array.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 22 ++++++++++-----------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  5 +++++
 2 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index f91ea87d2f72..9aec67c9c6d7 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3340,14 +3340,14 @@ static int mtk_get_irqs(struct platform_device *pdev, struct mtk_eth *eth)
 {
 	int i;
 
-	eth->irq[1] = platform_get_irq_byname(pdev, "tx");
-	eth->irq[2] = platform_get_irq_byname(pdev, "rx");
-	if (eth->irq[1] >= 0 && eth->irq[2] >= 0)
+	eth->irq[MTK_ETH_IRQ_TX] = platform_get_irq_byname(pdev, "tx");
+	eth->irq[MTK_ETH_IRQ_RX] = platform_get_irq_byname(pdev, "rx");
+	if (eth->irq[MTK_ETH_IRQ_TX] >= 0 && eth->irq[MTK_ETH_IRQ_RX] >= 0)
 		return 0;
 
-	for (i = 0; i < 3; i++) {
+	for (i = 0; i < MTK_ETH_IRQ_MAX; i++) {
 		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
-			eth->irq[i] = eth->irq[0];
+			eth->irq[i] = eth->irq[MTK_ETH_IRQ_SHARED];
 		else
 			eth->irq[i] = platform_get_irq(pdev, i);
 
@@ -3413,7 +3413,7 @@ static void mtk_poll_controller(struct net_device *dev)
 
 	mtk_tx_irq_disable(eth, MTK_TX_DONE_INT);
 	mtk_rx_irq_disable(eth, eth->soc->rx.irq_done_mask);
-	mtk_handle_irq_rx(eth->irq[2], dev);
+	mtk_handle_irq_rx(eth->irq[MTK_ETH_IRQ_RX], dev);
 	mtk_tx_irq_enable(eth, MTK_TX_DONE_INT);
 	mtk_rx_irq_enable(eth, eth->soc->rx.irq_done_mask);
 }
@@ -4899,7 +4899,7 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	eth->netdev[id]->features |= eth->soc->hw_features;
 	eth->netdev[id]->ethtool_ops = &mtk_ethtool_ops;
 
-	eth->netdev[id]->irq = eth->irq[0];
+	eth->netdev[id]->irq = eth->irq[MTK_ETH_IRQ_SHARED];
 	eth->netdev[id]->dev.of_node = np;
 
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
@@ -5176,17 +5176,17 @@ static int mtk_probe(struct platform_device *pdev)
 	}
 
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT)) {
-		err = devm_request_irq(eth->dev, eth->irq[0],
+		err = devm_request_irq(eth->dev, eth->irq[MTK_ETH_IRQ_SHARED],
 				       mtk_handle_irq, 0,
 				       dev_name(eth->dev), eth);
 	} else {
-		err = devm_request_irq(eth->dev, eth->irq[1],
+		err = devm_request_irq(eth->dev, eth->irq[MTK_ETH_IRQ_TX],
 				       mtk_handle_irq_tx, 0,
 				       dev_name(eth->dev), eth);
 		if (err)
 			goto err_free_dev;
 
-		err = devm_request_irq(eth->dev, eth->irq[2],
+		err = devm_request_irq(eth->dev, eth->irq[MTK_ETH_IRQ_RX],
 				       mtk_handle_irq_rx, 0,
 				       dev_name(eth->dev), eth);
 	}
@@ -5232,7 +5232,7 @@ static int mtk_probe(struct platform_device *pdev)
 		} else
 			netif_info(eth, probe, eth->netdev[i],
 				   "mediatek frame engine at 0x%08lx, irq %d\n",
-				   eth->netdev[i]->base_addr, eth->irq[0]);
+				   eth->netdev[i]->base_addr, eth->irq[MTK_ETH_IRQ_SHARED]);
 	}
 
 	/* we run 2 devices on the same DMA ring so we need a dummy device
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 6f72a8c8ae1e..6b1208d05f79 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -642,6 +642,11 @@
 
 #define MTK_MAC_FSM(x)		(0x1010C + ((x) * 0x100))
 
+#define MTK_ETH_IRQ_SHARED	0
+#define MTK_ETH_IRQ_TX		1
+#define MTK_ETH_IRQ_RX		2
+#define MTK_ETH_IRQ_MAX		3
+
 struct mtk_rx_dma {
 	unsigned int rxd1;
 	unsigned int rxd2;
-- 
2.43.0


