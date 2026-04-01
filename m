Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2368AD3514A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHAJzxBi4jtiVuEdQes88GJtJsxfjTpth99yOnhHr4I=; b=kLxDQQ2HVjREtSr8ZeTn4wpR3C
	7KEPIrOAB3jUqxqBsIwC6etn066PlpiniQli8WdSRF4QTOnzhAI1zJ7EzN+9t4mLs7vZmmzSPrhgU
	tUXjxneOxHlEoLl1hj/pZShVXLw21h/ClOeVQ3GbirXjt5u3BZ10zdJX0rzsKQVjBO7aTu09f1WPd
	L3KhTsxnCPqNJlKHL4pOepkfx3cPoKlXp9xl2hmdFyBOO0eMdgOO2zCBqk9HvHxTSNHeWSw6AAJX9
	vEri46VzfuFB3POrtupr4IlsWsiJGX0S3Wx21Odg3Ty6MzJy/zWOajM6cjVSaaNTEAT1++dnSzd/+
	x1Kms6Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ptM-0000000ECCp-2lpq;
	Wed, 01 Apr 2026 07:21:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ptK-0000000ECBD-3HIM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hHAJzxBi4jtiVuEdQes88GJtJsxfjTpth99yOnhHr4I=; b=am8nDDvdRVCzrRXXyLUGH8rSy5
	TixduHQN8xllopGhkG0DaIiMbmH6MAKBovr9zGzj0vMfy4jeDjt0U+MhuwgPP10kkhusOXP435mVU
	ih/pozTHlnRM7IHdPSsJVZMmZTFg4D0KjSUePG9QhVzbeOc7M5eyguIvtiB3q0AG9fP5CQRnA99Ix
	BcfTOLug9IrMZJ5XjZFzWi4evMvH+PZkBRBcnkwltLRFCorKq/B3wovl0TKxB9Gu+kkWW4DvHIPQy
	IBKWUTRSIU4ORIgTRiFTZLPceYruebhtujNTp4AU8On+sTuEYoCLGdmJJfPuSMmv6MvMkwZ31RJgw
	5RE7Rqow==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37612 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w7ptF-000000002fz-2J51;
	Wed, 01 Apr 2026 08:21:25 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w7ptE-0000000Easz-28tv;
	Wed, 01 Apr 2026 08:21:24 +0100
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
Subject: [PATCH net-next v2 03/14] net: stmmac: fix TSO support when some
 channels have TBS available
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w7ptE-0000000Easz-28tv@rmk-PC.armlinux.org.uk>
Date: Wed, 01 Apr 2026 08:21:24 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_002130_829515_DA2C709C 
X-CRM114-Status: GOOD (  19.16  )
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

According to the STM32MP25xx manual, which is dwmac v5.3, TBS (time
based scheduling) is not permitted for channels which have hardware
TSO enabled. Intel's commit 5e6038b88a57 ("net: stmmac: fix TSO and
TBS feature enabling during driver open") concurs with this, but it
is incomplete.

This commit avoids enabling TSO support on the channels which have
TBS available, which, as far as the hardware is concerned, means we
do not set the TSE bit in the DMA channel's transmit control register.

However, the net device's features apply to all queues(channels), which
means these channels may still be handed TSO skbs to transmit, and the
driver will pass them to stmmac_tso_xmit(). This will generate the
descriptors for TSO, even though the channel has the TSE bit clear.

Fix this by checking whether the queue(channel) has TBS available,
and if it does, fall back to software GSO support.

Fixes: 5e6038b88a57 ("net: stmmac: fix TSO and TBS feature enabling during driver open")
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 32 ++++++++++++++++---
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c80b4a375ddb..890a1efb8733 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3619,6 +3619,17 @@ static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
 	}
 }
 
+/* STM32MP25xx (dwmac v5.3) states "Do not enable time-based scheduling for
+ * channels on which the TSO feature is enabled." If we have a skb for a
+ * channel which has TBS enabled, fall back to software GSO.
+ */
+static bool stmmac_tso_channel_permitted(struct stmmac_priv *priv,
+					 unsigned int chan)
+{
+	/* TSO and TBS cannot co-exist */
+	return !(priv->dma_conf.tx_queue[chan].tbs & STMMAC_TBS_AVAIL);
+}
+
 /**
  * stmmac_hw_setup - setup mac in a usable state.
  *  @dev : pointer to the device structure.
@@ -3707,10 +3718,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 	/* Enable TSO */
 	if (priv->dma_cap.tsoen && priv->plat->flags & STMMAC_FLAG_TSO_EN) {
 		for (chan = 0; chan < tx_cnt; chan++) {
-			struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[chan];
-
-			/* TSO and TBS cannot co-exist */
-			if (tx_q->tbs & STMMAC_TBS_AVAIL)
+			if (!stmmac_tso_channel_permitted(priv, chan))
 				continue;
 
 			stmmac_enable_tso(priv, priv->ioaddr, 1, chan);
@@ -4919,6 +4927,21 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	return NETDEV_TX_OK;
 }
 
+static netdev_features_t stmmac_features_check(struct sk_buff *skb,
+					       struct net_device *dev,
+					       netdev_features_t features)
+{
+	u16 queue;
+
+	if (skb_is_gso(skb)) {
+		queue = skb_get_queue_mapping(skb);
+		if (!stmmac_tso_channel_permitted(netdev_priv(dev), queue))
+			features &= ~NETIF_F_GSO_MASK;
+	}
+
+	return vlan_features_check(skb, features);
+}
+
 static void stmmac_rx_vlan(struct net_device *dev, struct sk_buff *skb)
 {
 	struct vlan_ethhdr *veth = skb_vlan_eth_hdr(skb);
@@ -7214,6 +7237,7 @@ static void stmmac_get_stats64(struct net_device *dev, struct rtnl_link_stats64
 static const struct net_device_ops stmmac_netdev_ops = {
 	.ndo_open = stmmac_open,
 	.ndo_start_xmit = stmmac_xmit,
+	.ndo_features_check = stmmac_features_check,
 	.ndo_stop = stmmac_release,
 	.ndo_change_mtu = stmmac_change_mtu,
 	.ndo_fix_features = stmmac_fix_features,
-- 
2.47.3


