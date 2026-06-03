Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADE9CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 06:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iC+uS4ZP82VJD953nLEW4lqTruY47tW/e9JwQJuoejQ=; b=1/ivm2/demEUJXxJLpBZu7lLZU
	NpT0uWJ10XQFMdDzbRCTiep6aFSxWIvDwmskSaqgK2emDNoXIorW3cPoj3kF1popCX69qoMvTqyue
	GBhkySkIM7iFsXiUx2UpIKwCBURJ9MFZeTq+bONQWtJpSpdQvbAfDxFpX1MWw82t+oDoEz2O/9c5/
	shIvA5Z4iow7qwepN+cqnZ+QUOiVTplRIKFRjFfaUVH6nlirIV6P1cvHiLLYcs8R6I9qag/gZlR1G
	bnGQju9OlATHzSOXEAP1qa10CwlLVtWetoFbSShW+1gvYh/dhyFLLt69gwHRxWZ1G5MXnnZiIHiLg
	yX0fuvqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUef7-0000000ELuq-3eib;
	Wed, 03 Jun 2026 06:01:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUef5-0000000ELro-0RJr;
	Wed, 03 Jun 2026 06:01:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B7AD60228;
	Wed,  3 Jun 2026 06:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95801F00893;
	Wed,  3 Jun 2026 06:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780466466;
	bh=iC+uS4ZP82VJD953nLEW4lqTruY47tW/e9JwQJuoejQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SzKMMwi14DTNZkaCzbC0VIpEZc9yCYa+827mhsdpD2H8f3g6BNaLNqnjEfReb/6Gg
	 loj9KrSOFWXRyFc3t2D9fKSZbRBV6VfbzjuluX6gko3cRQ+16HosHWqMAm6lEDvdzu
	 SI6gQ54gYN4zfxpHbdALBwZrvHSBjJ7oG6lSt6nAnXGVZ4PM0vZeDKtfC7QWbNG+Qg
	 c50n99jJqa97kMkxC+FdDOoB8OPZBUjKzjElfvD5ZP/A9hXUwXt6w7bFdTHTUbPXHr
	 5VEOrNlQh1JYE65QJ0fA1OY+1z1JkK9dlVEUZcAcxeMomByM6HxE2rEqiw/7tn2Mim
	 62Y62soBQxq2g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 03 Jun 2026 08:00:16 +0200
Subject: [PATCH net-next v9 2/6] net: airoha: Remove private net_device
 pointer in airoha_gdm_dev struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-airoha-eth-multi-serdes-v9-2-5d476bc2f426@kernel.org>
References: <20260603-airoha-eth-multi-serdes-v9-0-5d476bc2f426@kernel.org>
In-Reply-To: <20260603-airoha-eth-multi-serdes-v9-0-5d476bc2f426@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
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

Remove redundant net_device pointer inside airoha_gdm_dev struct and
rely on netdev_from_priv routine instead. Please note this patch does
not introduce any logical change, just code refactoring.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 23 ++++++++++++++---------
 drivers/net/ethernet/airoha/airoha_eth.h |  1 -
 drivers/net/ethernet/airoha/airoha_ppe.c |  2 +-
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 6574901ebd19..57a16de0a2ec 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -629,7 +629,7 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
 		if (!port->dev)
 			goto free_frag;
 
-		netdev = port->dev->dev;
+		netdev = netdev_from_priv(port->dev);
 		if (!q->skb) { /* first buffer */
 			q->skb = napi_build_skb(e->buf - AIROHA_RX_HEADROOM,
 						q->buf_size);
@@ -853,6 +853,7 @@ static void airoha_qdma_wake_netdev_txqs(struct airoha_queue *q)
 	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
 		struct airoha_gdm_port *port = eth->ports[i];
 		struct airoha_gdm_dev *dev;
+		struct net_device *netdev;
 		int j;
 
 		if (!port)
@@ -865,11 +866,12 @@ static void airoha_qdma_wake_netdev_txqs(struct airoha_queue *q)
 		if (dev->qdma != qdma)
 			continue;
 
-		for (j = 0; j < dev->dev->num_tx_queues; j++) {
+		netdev = netdev_from_priv(dev);
+		for (j = 0; j < netdev->num_tx_queues; j++) {
 			if (airoha_qdma_get_txq(qdma, j) != qid)
 				continue;
 
-			netif_wake_subqueue(dev->dev, j);
+			netif_wake_subqueue(netdev, j);
 		}
 	}
 	q->txq_stopped = false;
@@ -1867,7 +1869,7 @@ static int airoha_dev_init(struct net_device *netdev)
 
 	/* QDMA0 is used for lan ports while QDMA1 is used for WAN ports */
 	dev->qdma = &eth->qdma[!airoha_is_lan_gdm_dev(dev)];
-	dev->dev->irq = dev->qdma->irq_banks[0].irq;
+	netdev->irq = dev->qdma->irq_banks[0].irq;
 	airoha_set_macaddr(dev, netdev->dev_addr);
 
 	switch (port->id) {
@@ -3038,7 +3040,6 @@ static int airoha_alloc_gdm_device(struct airoha_eth *eth,
 	}
 
 	dev = netdev_priv(netdev);
-	dev->dev = netdev;
 	dev->port = port;
 	port->dev = dev;
 	dev->eth = eth;
@@ -3101,7 +3102,7 @@ static int airoha_register_gdm_devices(struct airoha_eth *eth)
 		if (!port)
 			continue;
 
-		err = register_netdev(port->dev->dev);
+		err = register_netdev(netdev_from_priv(port->dev));
 		if (err)
 			return err;
 	}
@@ -3216,8 +3217,12 @@ static int airoha_probe(struct platform_device *pdev)
 			continue;
 
 		dev = port->dev;
-		if (dev && dev->dev->reg_state == NETREG_REGISTERED)
-			unregister_netdev(dev->dev);
+		if (dev) {
+			struct net_device *netdev = netdev_from_priv(dev);
+
+			if (netdev->reg_state == NETREG_REGISTERED)
+				unregister_netdev(netdev);
+		}
 		airoha_metadata_dst_free(port);
 	}
 	airoha_hw_cleanup(eth);
@@ -3245,7 +3250,7 @@ static void airoha_remove(struct platform_device *pdev)
 
 		dev = port->dev;
 		if (dev)
-			unregister_netdev(dev->dev);
+			unregister_netdev(netdev_from_priv(dev));
 		airoha_metadata_dst_free(port);
 	}
 	airoha_hw_cleanup(eth);
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index fbb50dc73af8..1f162fa1405e 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -540,7 +540,6 @@ struct airoha_qdma {
 struct airoha_gdm_dev {
 	struct airoha_gdm_port *port;
 	struct airoha_qdma *qdma;
-	struct net_device *dev;
 	struct airoha_eth *eth;
 
 	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 047141b2d6d8..c9711bb7ef1c 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1475,8 +1475,8 @@ void airoha_ppe_check_skb(struct airoha_ppe_dev *dev, struct sk_buff *skb,
 
 void airoha_ppe_init_upd_mem(struct airoha_gdm_dev *dev)
 {
+	struct net_device *netdev = netdev_from_priv(dev);
 	struct airoha_gdm_port *port = dev->port;
-	struct net_device *netdev = dev->dev;
 	struct airoha_eth *eth = dev->eth;
 	const u8 *addr = netdev->dev_addr;
 	u32 val;

-- 
2.54.0


