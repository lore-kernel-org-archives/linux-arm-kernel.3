Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E71CCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 03:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qAFowZ1y6BOoIVO6v58PSEPsSoMANk3xj3Kq9zHLct8=; b=j39dD/dGwd41i+mkWATeLTn43u
	mq5BIZa5cciTI72REW5BkbO9I8vKFO0yNyjlDrpnZNqPUPskNcsK8dW+eiCRmw7uGvvSiGo5IvBo7
	HtjuemajkQBvR78U+QY7LmamvWb1KgAPTb8h0fC1nVARsQDJWOqtRRzicneFQes6BWfrZTxn0hE7O
	TKdKcYoGYpk7J+OUkHrtvy3bCR/XI0J8va51j5U0BytZvs5JarFgJuq8PJeBVu1YL8N2sMcLncqAw
	UgP/3BaJNuvcm5W+1G5G+US8zPjoUDxlt96mV6H36eMGmsOp4BrdRvobYcTIb2CmfMwhFhLPps/1E
	6yHbN6iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDaEt-0000000F9xI-05BT;
	Tue, 28 Oct 2025 03:19:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDaEl-0000000F9uu-2qLP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 03:19:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FE3E45909;
	Tue, 28 Oct 2025 03:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4850FC4CEFB;
	Tue, 28 Oct 2025 03:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761621546;
	bh=hSMjXziVpPMEtbuIC86BFTIcw4ntPZpdEiitAvSj+tY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mBwCMk+yM52E8gR3aBMJB+YT6svhs9WzDS/MZgefCEljgwhUuVb5PFFcVelEXRJT6
	 7CoRciHg1bISWi/pfDeQhCc3jJ27mGucNVX0uT7V2Ym2NzgPyJZTTsctKrswcBxM4S
	 eYIRDZcgKn4408Kn5PaP7y+yS1GlGVp7x/zpWmPI0bCpdvk73TbpRKl2K+RROU9eOs
	 o0XE7CaVVUs3oftPwbqs1gvWKKd+lkSvLeX4S7tEf2nPAt7KrgnuGFDJAyyc2k0PJ+
	 X3EiD0XP44EDyKf9qTyBD9Ku7nZZABhIb/ozCsUIfnoDa94vdG6pDUlghy5qffxMRZ
	 okUEKm8Qyot1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399C0CCD1BF;
	Tue, 28 Oct 2025 03:19:06 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Tue, 28 Oct 2025 11:18:44 +0800
Subject: [PATCH net v4 2/3] net: stmmac: Consider Tx VLAN offload tag
 length for maxSDU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-qbv-fixes-v4-2-26481c7634e3@altera.com>
References: <20251028-qbv-fixes-v4-0-26481c7634e3@altera.com>
In-Reply-To: <20251028-qbv-fixes-v4-0-26481c7634e3@altera.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761621544; l=2209;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=CO26pwlKR66OKT0ufmF/QwQbSxoYj3sToTSLa+5EzgI=;
 b=Gx526F+k/ZNMujmfc2ZDc8kjxctS/U7dvX8WX5u1qa+DoeQOX4uMPftUDysPHK0eIcXFcqg6f
 z96MVfr+AWPA9DUEipfGr9/X2Y0tjgBGEbyththa8HqFWE+xwgXnZb4
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_201907_764136_09475AE9 
X-CRM114-Status: GOOD (  12.32  )
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

Queue maxSDU requirement of 802.1 Qbv standard requires mac to drop
packets that exceeds maxSDU length and maxSDU doesn't include
preamble, destination and source address, or FCS but includes
ethernet type and VLAN header.

On hardware with Tx VLAN offload enabled, VLAN header length is not
included in the skb->len, when Tx VLAN offload is requested. This
leads to incorrect length checks and allows transmission of
oversized packets. Add the VLAN_HLEN to the skb->len before checking
the Qbv maxSDU if Tx VLAN offload is requested for the packet.

Fixes: c5c3e1bfc9e0 ("net: stmmac: Offload queueMaxSDU from tc-taprio")
Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 0e2dc0a464d5516b8aabe2f9afc60c6e37f0209e..042c823bbced88070fa26003c6b513257c0f2bb6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4518,6 +4518,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	bool has_vlan, set_ic;
 	int entry, first_tx;
 	dma_addr_t des;
+	u32 sdu_len;
 
 	tx_q = &priv->dma_conf.tx_queue[queue];
 	txq_stats = &priv->xstats.txq_stats[queue];
@@ -4536,10 +4537,15 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	}
 
 	if (priv->est && priv->est->enable &&
-	    priv->est->max_sdu[queue] &&
-	    skb->len > priv->est->max_sdu[queue]){
-		priv->xstats.max_sdu_txq_drop[queue]++;
-		goto max_sdu_err;
+	    priv->est->max_sdu[queue]) {
+		sdu_len = skb->len;
+		/* Add VLAN tag length if VLAN tag insertion offload is requested */
+		if (priv->dma_cap.vlins && skb_vlan_tag_present(skb))
+			sdu_len += VLAN_HLEN;
+		if (sdu_len > priv->est->max_sdu[queue]) {
+			priv->xstats.max_sdu_txq_drop[queue]++;
+			goto max_sdu_err;
+		}
 	}
 
 	if (unlikely(stmmac_tx_avail(priv, queue) < nfrags + 1)) {

-- 
2.43.7



