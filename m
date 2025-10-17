Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35876CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 06:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cHXLOAwEvcy9UIgkozyYOGs1v1yD8dzwDhhGeGpwklk=; b=oRqzhuRqwLiQmh6Iio53Ld3XNv
	ztAM4gYbPZ1t/CaxL+SYhPX5WUaVfEuRQH/sUVnCsPG3kg6FwvABZnElxgfCKfZEg+H3ZQNNfM3yt
	5IbEeoimWZcfDwdthxfyz0DVsiRTiAhlK80OpJOngzdM0216NKu2rWIDP2EbYpUpo/9TGimU7f2yk
	7sxP2EtOPOiG3YkI8j6yaE68za7uyu/JG4UYBO7vQpOjaXu46bziq4xCJzrZvzWkjpqOBbxgAjBZX
	8w2QhguSqKGV+O1icwfqNAw/zuz960HX4Dh5Vaidb7QjZkkF8FtLXdHCHLjx+eXi0cTjAeCsrh0Dk
	pIIxnlEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dgd-00000006hg5-18yS;
	Fri, 17 Oct 2025 06:11:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dgb-00000006he5-2RgB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 06:11:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 051166420B;
	Fri, 17 Oct 2025 06:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99E9FC4CEE7;
	Fri, 17 Oct 2025 06:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760681492;
	bh=kiZ/E3EReHUX0M1b+8d/q62Wo1VPS2A4vlagRzx83LQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VV9GcW2BRCikIQ/H/scyfCtOqIlylreOp9hSMMar9qBsNRDjR2FfDavrq1orN+xUv
	 iDCpag2j+5thSXgq8CSbVvzzcinNNVzIk82q0zKtQ3cyVB2pTSvpWQJjVyX4MWZy/o
	 HNgAKnmZ3qTn9bWZ2myXJoSqNdYI2u9QKeQxFS+krIxmS5NgT9U9QkYdjIKPQmzIpj
	 hNqxD7jMhVq1QR1w3YKWdo5tju09UCubQaZVxyhaKcQmIDcgDxkVp7LM3yZ+3nPHj/
	 oe3PykmzNnrpP7ysKNuMLGCfHgC9khHuDejK+58Fy54bDqVb2+zUsQiNreIyHP88nX
	 i3PNqg0ah3WdA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A87CCD199;
	Fri, 17 Oct 2025 06:11:32 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Fri, 17 Oct 2025 14:11:20 +0800
Subject: [PATCH net v3 2/3] net: stmmac: Consider Tx VLAN offload tag
 length for maxSDU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-qbv-fixes-v3-2-d3a42e32646a@altera.com>
References: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
In-Reply-To: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>, 
 Rohan G Thomas <rohan.g.thomas@intel.com>, 
 Boon Khai Ng <boon.khai.ng@altera.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rohan G Thomas <rohan.g.thomas@altera.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760681491; l=2216;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=jcxjbVsIAOtq9pkhXrGNK9OcxDQoYMmKdVWnGqUpw8w=;
 b=Sf2ajyE8ADotRUn+QZuwv0vYNgHn1PxaIwhGA+1sNu7EqNI5uMqNDQLYoGjwMAydQpYdRHBmB
 cWANmRpfenMDn0Q5bBFAHqTWti0xS4jdZW2KTBb06OTgtKIwsk+KSni
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
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
Reply-To: rohan.g.thomas@altera.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Rohan G Thomas <rohan.g.thomas@altera.com>

On hardware with Tx VLAN offload enabled, add the VLAN tag length to
the skb length before checking the Qbv maxSDU if Tx VLAN offload is
requested for the packet. Add 4 bytes for 802.1Q tag.

Fixes: c5c3e1bfc9e0 ("net: stmmac: Offload queueMaxSDU from tc-taprio")
Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index dedaaef3208bfadc105961029f79d0d26c3289d8..23bf4a3d324b7f8e8c3067ed4d47b436a89c97d3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4500,6 +4500,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	bool has_vlan, set_ic;
 	int entry, first_tx;
 	dma_addr_t des;
+	u32 sdu_len;
 
 	tx_q = &priv->dma_conf.tx_queue[queue];
 	txq_stats = &priv->xstats.txq_stats[queue];
@@ -4516,13 +4517,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 			return stmmac_tso_xmit(skb, dev);
 	}
 
-	if (priv->est && priv->est->enable &&
-	    priv->est->max_sdu[queue] &&
-	    skb->len > priv->est->max_sdu[queue]){
-		priv->xstats.max_sdu_txq_drop[queue]++;
-		goto max_sdu_err;
-	}
-
 	if (unlikely(stmmac_tx_avail(priv, queue) < nfrags + 1)) {
 		if (!netif_tx_queue_stopped(netdev_get_tx_queue(dev, queue))) {
 			netif_tx_stop_queue(netdev_get_tx_queue(priv->dev,
@@ -4535,8 +4529,18 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		return NETDEV_TX_BUSY;
 	}
 
+	sdu_len = skb->len;
 	/* Check if VLAN can be inserted by HW */
 	has_vlan = stmmac_vlan_insert(priv, skb, tx_q);
+	if (has_vlan)
+		sdu_len += VLAN_HLEN;
+
+	if (priv->est && priv->est->enable &&
+	    priv->est->max_sdu[queue] &&
+	    skb->len > priv->est->max_sdu[queue]){
+		priv->xstats.max_sdu_txq_drop[queue]++;
+		goto max_sdu_err;
+	}
 
 	entry = tx_q->cur_tx;
 	first_entry = entry;

-- 
2.43.7



