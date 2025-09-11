Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411EACAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 08:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYf3XSWs5DgORgo0szgQTHys2+ugluYWzyi56J/4QJo=; b=nAICccRGfSYeTCl4vnsDL8ev/t
	9mXuCMtOWB7/C5CPQYmZVsjyTyac6oEA6ha/d1NtS9tEd+NH1LRJhKzIePNCjofjpWkNNAi2TIyQp
	ZGW76T94h4G6S8IkHX1Fv+7vULqvOG0fU0fjUmlkYZWYIk7xCp4FE3/qqWJ0K2p4xhQyblFmJ0Pr9
	e36BGAf9NsGn/sc9eFIk/C/1yft42SWjGLjjVrXsztMTOJUhdYZZdQ17qyzlOEK8O9rcgldWFcvLx
	gPrY/KI0zRCAJTQ/2tH3aiqcXZuJDlqLdJktkhU0MLDsfGIK+M4m4hmUtiJzUyC7llfNCKiwqgqJR
	HS5PGQXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcad-00000001nDa-2IWC;
	Thu, 11 Sep 2025 08:23:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcaY-00000001nAx-26Z8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 08:23:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9907444B09;
	Thu, 11 Sep 2025 08:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 752B9C4CEF5;
	Thu, 11 Sep 2025 08:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757579009;
	bh=ypoWEn4gEmwpXn2cEWB0XS0dYLbndFFpNSdqJXTOW4Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LyfXX21pQXJ8sPOmu/nEoHgenMeHVbEWPnevO04aNHJfFWHVHQYCllOtTDzBE+vZe
	 sv9BVRDORO/daHD/fSfiXPoqv31NG2VGPRIMMWD5npOm+0zYRXY1J9orIrJAam3ZKp
	 VjmoMdl0Jfn44UOfCi+2YVwt489tNkN8wDkn4puRG8xi84YFMHDfXz1eV1GIZ7OFIc
	 Pt2t4BYxWLut0BdJq3ut/sMzhOZdceL9unHevQN+b4fmv/Jgs8Dob2SR80f3YJFDPi
	 d8npjehLvZR92R6W1ijcUITRR+bARkntqnsZIzzvcVZ9vSk8ULjKH4ubyAieKwczPG
	 KV3WOQi+ChMcQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669FECAC592;
	Thu, 11 Sep 2025 08:23:29 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Thu, 11 Sep 2025 16:23:00 +0800
Subject: [PATCH net 2/2] net: stmmac: Consider Tx VLAN offload tag length
 for maxSDU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qbv-fixes-v1-2-e81e9597cf1f@altera.com>
References: <20250911-qbv-fixes-v1-0-e81e9597cf1f@altera.com>
In-Reply-To: <20250911-qbv-fixes-v1-0-e81e9597cf1f@altera.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>, 
 Rohan G Thomas <rohan.g.thomas@intel.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rohan G Thomas <rohan.g.thomas@altera.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757579008; l=2479;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=eTWmL606f3oYOV0qUeKRaPXnGZ0t6qItbR3wWeC6D1c=;
 b=EDvj8phpndTc3hNkoyw7M0iVbCa4P7nqQt6SJ1KQa45vJvvOkJC8WbBXDlreFnKXxieSCVo3x
 kfKcEo9wqWYB19X/Va7sRFb63+luJvaYFcmDC06AF0n9burngz9EWNu
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_012330_587073_ECDE862B 
X-CRM114-Status: GOOD (  12.84  )
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

From: Rohan G Thomas <rohan.g.thomas@intel.com>

On hardware with Tx VLAN offload enabled, add the VLAN tag
length to the skb length before checking the Qbv maxSDU.
Add 4 bytes for 802.1Q an add 8 bytes for 802.1AD tagging.

Fixes: c5c3e1bfc9e0 ("net: stmmac: Offload queueMaxSDU from tc-taprio")
Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 25 ++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 419cb49ee5a25519a60a84bae6bcdb0be655384e..c487ce95436c2a1f502f96d00afab6270d77c0bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4531,6 +4531,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	bool has_vlan, set_ic;
 	int entry, first_tx;
 	dma_addr_t des;
+	u32 sdu_len;
 
 	tx_q = &priv->dma_conf.tx_queue[queue];
 	txq_stats = &priv->xstats.txq_stats[queue];
@@ -4547,13 +4548,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
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
@@ -4569,6 +4563,23 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	/* Check if VLAN can be inserted by HW */
 	has_vlan = stmmac_vlan_insert(priv, skb, tx_q);
 
+	sdu_len = skb->len;
+	if (has_vlan) {
+		/* Add VLAN tag length to sdu length in case of txvlan offload */
+		if (priv->dev->features & NETIF_F_HW_VLAN_CTAG_TX)
+			sdu_len += VLAN_HLEN;
+		if (skb->vlan_proto == htons(ETH_P_8021AD) &&
+		    priv->dev->features & NETIF_F_HW_VLAN_STAG_TX)
+			sdu_len += VLAN_HLEN;
+	}
+
+	if (priv->est && priv->est->enable &&
+	    priv->est->max_sdu[queue] &&
+	    sdu_len > priv->est->max_sdu[queue]) {
+		priv->xstats.max_sdu_txq_drop[queue]++;
+		goto max_sdu_err;
+	}
+
 	entry = tx_q->cur_tx;
 	first_entry = entry;
 	WARN_ON(tx_q->tx_skbuff[first_entry]);

-- 
2.25.1



