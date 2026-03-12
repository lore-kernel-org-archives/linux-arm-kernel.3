Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CE1FED2FF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 10:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSDqBN/DmAWeozPDEC8b1qloPDPE+0ZqAmxNNyAd8yY=; b=yyg83MfNNc6WyYTw78fSGbrrII
	woL+lp2OyevjoVOwjJqoIU9KBFpNQkTcMdan1F3tDA8yE3F5H6PDw8KkwfNzysNwjrbznJ7j6umtq
	1KPwD3yZY4+5a1Akl/h5uejvlP0kZ10L/3oJWofPxx7a0Bi6lg3JC/e2O3CqiZScQ/qnD63yjDDh1
	ah9ufN2E2EvhaABVMJrWqxgX91CfGE04XlOi3IRIpMiaQFUkNOWO+3QuYEuK1g8P9csdrBZz48x0H
	iNIFqu3CAPYvsCfGm6SnvXvu+oNP2m+dN+79Yujoaf7x5XNq1SdL4RaXXX7F+dSowc8+j9CP2YwcL
	xbCzoHnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0czk-0000000Dpmy-3BTd;
	Thu, 12 Mar 2026 10:10:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0czg-0000000Dpgj-05cb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 10:10:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QSDqBN/DmAWeozPDEC8b1qloPDPE+0ZqAmxNNyAd8yY=; b=XUPP/svawOQWdBhHt/uTr0jo/o
	/Cg35pr+863OtYiPMxNemOThYu3lx/T24MMxEiOIQa9+RtrE7lez6Da8CgJ+9cqyHkE70n4tY4Y7A
	MbuNHzNJBa52Q66KpH1iqRdAdbydtmgn7XlatHPjSu9m/13xEyt+LKSwm3mIiH4vaDEKkVHgSj1gO
	4H45fvjJirQuZFhwD/byLKc3+1hM+OVSGc2w1G45Dua1c9+AhtyHSJmufKcsmGgNFTpdgFW9vS/qT
	l5bvUjZYEloT99RGSGzd1EcPMVqdzSMgHk8wLc1L2UefzrWbQu0mwWHmPsgNkua6+RXL4rcqeSnUQ
	DuIvP/KQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49110 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0czJ-000000007aa-32WV;
	Thu, 12 Mar 2026 10:09:54 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0czF-0000000CzH1-0fqS;
	Thu, 12 Mar 2026 10:09:49 +0000
In-Reply-To: <abKQWloxp9_4OuJh@shell.armlinux.org.uk>
References: <abKQWloxp9_4OuJh@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next v2 12/15] net: stmmac: add helper to get size of a
 transmit descriptor
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0czF-0000000CzH1-0fqS@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Mar 2026 10:09:49 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_031016_055282_3DA3D853 
X-CRM114-Status: GOOD (  12.82  )
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

Add and use a helper to get the size of the hardware transmit
descriptor.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 40 +++++++------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 76e4dcf8f697..da1726b887f3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -362,6 +362,17 @@ static inline u32 stmmac_tx_avail(struct stmmac_priv *priv, u32 queue)
 			  priv->dma_conf.dma_tx_size);
 }
 
+static size_t stmmac_get_tx_desc_size(struct stmmac_priv *priv,
+				      struct stmmac_tx_queue *tx_q)
+{
+	if (priv->extend_desc)
+		return sizeof(struct dma_extended_desc);
+	else if (tx_q->tbs & STMMAC_TBS_AVAIL)
+		return sizeof(struct dma_edesc);
+	else
+		return sizeof(struct dma_desc);
+}
+
 static struct dma_desc *stmmac_get_tx_desc(struct stmmac_priv *priv,
 					   struct stmmac_tx_queue *tx_q,
 					   unsigned int index)
@@ -1501,14 +1512,8 @@ static void stmmac_display_tx_rings(struct stmmac_priv *priv,
 
 		pr_info("\tTX Queue %d rings\n", queue);
 
-		if (priv->extend_desc)
-			desc_size = sizeof(struct dma_extended_desc);
-		else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-			desc_size = sizeof(struct dma_edesc);
-		else
-			desc_size = sizeof(struct dma_desc);
-
 		head_tx = stmmac_get_tx_desc(priv, tx_q, 0);
+		desc_size = stmmac_get_tx_desc_size(priv, tx_q);
 
 		stmmac_display_ring(priv, head_tx, dma_conf->dma_tx_size, false,
 				    tx_q->dma_tx_phy, desc_size);
@@ -2186,17 +2191,14 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
 	dma_free_tx_skbufs(priv, dma_conf, queue);
 
 	if (priv->extend_desc) {
-		size = sizeof(struct dma_extended_desc);
 		addr = tx_q->dma_etx;
 	} else if (tx_q->tbs & STMMAC_TBS_AVAIL) {
-		size = sizeof(struct dma_edesc);
 		addr = tx_q->dma_entx;
 	} else {
-		size = sizeof(struct dma_desc);
 		addr = tx_q->dma_tx;
 	}
 
-	size *= dma_conf->dma_tx_size;
+	size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
 
 	dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);
 
@@ -2358,14 +2360,7 @@ static int __alloc_dma_tx_desc_resources(struct stmmac_priv *priv,
 	if (!tx_q->tx_skbuff)
 		return -ENOMEM;
 
-	if (priv->extend_desc)
-		size = sizeof(struct dma_extended_desc);
-	else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-		size = sizeof(struct dma_edesc);
-	else
-		size = sizeof(struct dma_desc);
-
-	size *= dma_conf->dma_tx_size;
+	size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
 
 	addr = dma_alloc_coherent(priv->device, size,
 				  &tx_q->dma_tx_phy, GFP_KERNEL);
@@ -4333,12 +4328,7 @@ static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
 	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
 	int desc_size;
 
-	if (likely(priv->extend_desc))
-		desc_size = sizeof(struct dma_extended_desc);
-	else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-		desc_size = sizeof(struct dma_edesc);
-	else
-		desc_size = sizeof(struct dma_desc);
+	desc_size = stmmac_get_tx_desc_size(priv, tx_q);
 
 	/* The own bit must be the latest setting done when prepare the
 	 * descriptor and then barrier is needed to make sure that
-- 
2.47.3


