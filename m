Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E543DD3514B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3zNFXyOKF+BLz89Sva1o0uRJQ4NNntdmHQyPfgJhJ4=; b=DRzMoZcWoWHCJrIk3cO8I9+yAr
	qs2fmIaGzwdDpvltYbrFvBwKcY6e8va4gFOAsJMtUOmHTDqgo+TxpBJXaHnJhbPDKm4oDzxgElSiJ
	a+QvJb8ipZg2PEFBajrhTp+7JzVhtN2+iGqyr13QXIcqA6eI+HIjEgFwesvWEiWe7F/N4IKPuHywN
	l1BpjW4g04sArSxtfo7zHrkKsCOpzbn13BJ2SEtMJ6WGCaUNo/DWQGn5eqElFBBzjO4kVF+sZA2CT
	TKRJxkbCN/h55prKuZWs+erUBOXYzfQZclgB8Wem7XOgsNZJUp7msgaLlBo5sZwkGWOb0URhNTjw5
	w8vbxYvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ptq-0000000ECTa-0oms;
	Wed, 01 Apr 2026 07:22:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ptm-0000000ECPf-2yaQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:22:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=r3zNFXyOKF+BLz89Sva1o0uRJQ4NNntdmHQyPfgJhJ4=; b=YPWoPzivQBHQrro+coYNy2DvvG
	jQyG8o4qVCZbJgTTipRgxggrJAz2LZCbyyb0/bR8tGDIVB8+iCFnvP4T7984cOt9VH8p5xG8P1yap
	AokkJp34dL0o/0J14ojiqEqfXLg9R2jWZ7QtKc9EF1bvD6DH30BXpAwA/QLt1dTVwshx/rur9IO+A
	0hFfKB2Vd+nUFnnZTjsYRyl44AQYp9tbiXKN8mWZF/jeABZA3nl+XbP41FA2YULN1dEDohu3Dbwku
	3p0m4D0fDLXBdfOxVIGpjlBhz2EhQnzMzhsOQhG7g2XxEpIMPyd6JwTKbjy4+5BcWJ4mUB4e7lCRj
	LSBf5m8Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57410 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w7ptf-000000002hX-1Ygn;
	Wed, 01 Apr 2026 08:21:51 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w7pte-0000000EatU-0ILt;
	Wed, 01 Apr 2026 08:21:50 +0100
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
Subject: [PATCH net-next v2 08/14] net: stmmac: move check for hardware
 checksum supported
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w7pte-0000000EatU-0ILt@rmk-PC.armlinux.org.uk>
Date: Wed, 01 Apr 2026 08:21:50 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_002159_440535_CE64A1EC 
X-CRM114-Status: GOOD (  17.19  )
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

Add a check in .ndo_features_check() to indicate whether hardware
checksum can be performed on the skbuff. Where hardware checksum is
not supported - either because the channel does not support Tx COE
or the skb isn't suitable (stmmac uses a tighter test than
can_checksum_protocol()) we also need to disable TSO, which will be
done by harmonize_features() in net/core/dev.c

This fixes a bug where a channel which has COE disabled may still
receive TSO skbuffs.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c67f042a90af..d3cbe71b9af1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4757,22 +4757,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	/* Check if VLAN can be inserted by HW */
 	has_vlan = stmmac_vlan_insert(priv, skb, tx_q);
 
-	csum_insertion = (skb->ip_summed == CHECKSUM_PARTIAL);
-	/* DWMAC IPs can be synthesized to support tx coe only for a few tx
-	 * queues. In that case, checksum offloading for those queues that don't
-	 * support tx coe needs to fallback to software checksum calculation.
-	 *
-	 * Packets that won't trigger the COE e.g. most DSA-tagged packets will
-	 * also have to be checksummed in software.
-	 */
-	if (csum_insertion &&
-	    (priv->plat->tx_queues_cfg[queue].coe_unsupported ||
-	     !stmmac_has_ip_ethertype(skb))) {
-		if (unlikely(skb_checksum_help(skb)))
-			goto dma_map_err;
-		csum_insertion = !csum_insertion;
-	}
-
 	entry = tx_q->cur_tx;
 	first_entry = entry;
 	WARN_ON(tx_q->tx_skbuff[first_entry]);
@@ -4788,6 +4772,8 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (enh_desc)
 		is_jumbo = stmmac_is_jumbo_frm(priv, skb->len, enh_desc);
 
+	csum_insertion = skb->ip_summed == CHECKSUM_PARTIAL;
+
 	if (unlikely(is_jumbo)) {
 		entry = stmmac_jumbo_frm(priv, tx_q, skb, csum_insertion);
 		if (unlikely(entry < 0) && (entry != -EINVAL))
@@ -4949,11 +4935,25 @@ static netdev_features_t stmmac_features_check(struct sk_buff *skb,
 					       struct net_device *dev,
 					       netdev_features_t features)
 {
-	u16 queue;
+	struct stmmac_priv *priv = netdev_priv(dev);
+	u16 queue = skb_get_queue_mapping(skb);
+
+	/* DWMAC IPs can be synthesized to support tx coe only for a few tx
+	 * queues. In that case, checksum offloading for those queues that don't
+	 * support tx coe needs to fallback to software checksum calculation.
+	 *
+	 * Packets that won't trigger the COE e.g. most DSA-tagged packets will
+	 * also have to be checksummed in software.
+	 *
+	 * Note that disabling hardware checksumming also disables TSO. See
+	 * harmonize_features() in net/core/dev.c
+	 */
+	if (priv->plat->tx_queues_cfg[queue].coe_unsupported ||
+	    !stmmac_has_ip_ethertype(skb))
+		features &= ~(NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM);
 
 	if (skb_is_gso(skb)) {
-		queue = skb_get_queue_mapping(skb);
-		if (!stmmac_tso_channel_permitted(netdev_priv(dev), queue) ||
+		if (!stmmac_tso_channel_permitted(priv, queue) ||
 		    !stmmac_tso_valid_packet(skb))
 			features &= ~NETIF_F_GSO_MASK;
 
-- 
2.47.3


