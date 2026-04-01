Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A320D3514A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=savUdynNQeYEd7h5mjaKKtMm1gt1Y/kK7gCSnE5/gVQ=; b=mQPAGg9BHM+BdyQt0T8csHBBvB
	mhezgQcZh+yv78DNrR0G4o7sB0aZxe2xPh75OklsDlkRfvBIneIZp1MwwytWKKDBjlCHhM82RtFmU
	BRjY9cSSarCcOsbSlgxBMTdL5ZyQXhqmQCHLIQuAvaRnkRDPIut3/wTt9F8/KAhkOEOSFw9dozmOG
	m/xclR/0+IJa9fulo3FzRGUN29uCb+Bwsg/bCKhrzydciM8y7SSd4K28DlDWH4eVZTdAXcXThVFFx
	KqLUCxCSZjpf51BzsrlVWcKTK8ZfvSG7UXvei9Wd9kcs+wA2cMsf4vbGRsq52w7BDZt0A1Co1C6Pf
	afMZP2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ptt-0000000ECXX-2HY1;
	Wed, 01 Apr 2026 07:22:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ptr-0000000ECT9-175k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=savUdynNQeYEd7h5mjaKKtMm1gt1Y/kK7gCSnE5/gVQ=; b=DKQkXiJCaGisM+oe3gHGjQnzDI
	giGBbjJUh3zc0agDIuQRMGAAu/vtPUYBw1ODRzXcAbGqKltXdQH0iqdt8tm10MOcCUJj9Ph3neVYd
	DK01z+W8Xu4p/O8Xs+SWq3m9K2oPm4GZbATUjASW3BUqNN9uvIie7M1QyfHBFsppVHE7zDx56hxet
	/c/yJQc5uDBxjVzfCqOhPtOjFDQ6jUhOz7CpIExiNeVlRKnT9z84bhfZz7GSYMQ+8wGxeP15Ku/mS
	XhIn/IvCLQ95SSBUhXjeNiDoR9c04uPMJf2+caqziTYctGoGKBSVz3XezwEYokEnLQweP6PIQ154g
	d59gDxpQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57418 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w7ptk-000000002ht-1Lqh;
	Wed, 01 Apr 2026 08:21:56 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w7ptj-0000000Eatb-11zK;
	Wed, 01 Apr 2026 08:21:55 +0100
In-Reply-To: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
References: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 09/14] net: stmmac: simplify GSO/TSO test in
 stmmac_xmit()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w7ptj-0000000Eatb-11zK@rmk-PC.armlinux.org.uk>
Date: Wed, 01 Apr 2026 08:21:55 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_002203_317192_B65CA52B 
X-CRM114-Status: GOOD (  17.61  )
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

The test in stmmac_xmit() to see whether we should pass the skbuff to
stmmac_tso_xmit() is more complex than it needs to be. This test can
be simplified by storing the mask of GSO types that we will pass, and
setting it according to the enabled features.

Note that "tso" is a mis-nomer since commit b776620651a1 ("net:
stmmac: Implement UDP Segmentation Offload"). Also note that this
commit controls both via the TSO feature. We preserve this behaviour
in this commit.

Also, this commit unconditionally accessed skb_shinfo(skb)->gso_type
for all frames, even when skb_is_gso() was false. This access is
eliminated.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  3 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 28 +++++++++++--------
 2 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 919a93a52390..8ba8f03e1ce0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -265,8 +265,9 @@ struct stmmac_priv {
 	u32 rx_coal_frames[MTL_MAX_RX_QUEUES];
 
 	int hwts_tx_en;
+	/* skb_shinfo(skb)->gso_type types that we handle */
+	unsigned int gso_enabled_types;
 	bool tx_path_in_lpi_mode;
-	bool tso;
 	bool sph_active;
 	bool sph_capable;
 	u32 sarc_type;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d3cbe71b9af1..42e2196e82a4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4373,6 +4373,18 @@ static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
 	stmmac_set_queue_tx_tail_ptr(priv, tx_q, queue, tx_q->cur_tx);
 }
 
+static void stmmac_set_gso_types(struct stmmac_priv *priv, bool tso)
+{
+	if (!tso) {
+		priv->gso_enabled_types = 0;
+	} else {
+		/* Manage oversized TCP frames for GMAC4 device */
+		priv->gso_enabled_types = SKB_GSO_TCPV4 | SKB_GSO_TCPV6;
+		if (priv->plat->core_type == DWMAC_CORE_GMAC4)
+			priv->gso_enabled_types |= SKB_GSO_UDP_L4;
+	}
+}
+
 static size_t stmmac_tso_header_size(struct sk_buff *skb)
 {
 	size_t size;
@@ -4706,7 +4718,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	u32 queue = skb_get_queue_mapping(skb);
 	int nfrags = skb_shinfo(skb)->nr_frags;
 	unsigned int first_entry, tx_packets;
-	int gso = skb_shinfo(skb)->gso_type;
 	struct stmmac_txq_stats *txq_stats;
 	struct dma_desc *desc, *first_desc;
 	struct stmmac_tx_queue *tx_q;
@@ -4718,14 +4729,9 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (priv->tx_path_in_lpi_mode && priv->eee_sw_timer_en)
 		stmmac_stop_sw_lpi(priv);
 
-	/* Manage oversized TCP frames for GMAC4 device */
-	if (skb_is_gso(skb) && priv->tso) {
-		if (gso & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6))
-			return stmmac_tso_xmit(skb, dev);
-		if (priv->plat->core_type == DWMAC_CORE_GMAC4 &&
-		    (gso & SKB_GSO_UDP_L4))
-			return stmmac_tso_xmit(skb, dev);
-	}
+	if (skb_is_gso(skb) &&
+	    skb_shinfo(skb)->gso_type & priv->gso_enabled_types)
+		return stmmac_tso_xmit(skb, dev);
 
 	if (priv->est && priv->est->enable &&
 	    priv->est->max_sdu[queue]) {
@@ -6151,7 +6157,7 @@ static int stmmac_set_features(struct net_device *netdev,
 			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
 	}
 
-	priv->tso = !!(features & NETIF_F_TSO);
+	stmmac_set_gso_types(priv, features & NETIF_F_TSO);
 
 	if (features & NETIF_F_HW_VLAN_CTAG_RX)
 		priv->hw->hw_vlan_en = true;
@@ -7886,7 +7892,7 @@ static int __stmmac_dvr_probe(struct device *device,
 		ndev->hw_features |= NETIF_F_TSO | NETIF_F_TSO6;
 		if (priv->plat->core_type == DWMAC_CORE_GMAC4)
 			ndev->hw_features |= NETIF_F_GSO_UDP_L4;
-		priv->tso = true;
+		stmmac_set_gso_types(priv, true);
 		dev_info(priv->device, "TSO feature enabled\n");
 	}
 
-- 
2.47.3


