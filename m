Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414EA10987A9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZ2KERFjyyQf8dxQP/UdKYTPcwvV1gn7poLNdNWhNwc=; b=HxVosC5zns2rU6KffyjD+bzvyI
	En2WNZKXKrsbVkfCwdnzYGm9+Kx1pgPnoVOXLO31+Vhu5M2euQjH4L6/GalWxjSuEvAdOAD6KiETr
	nn32Cyy0qL+8BWSt3TS9OYAVOSNjfkeEbCzujMDIWvBoKviBL2Y3i6qo50+IMwObHvXpHUOMkTc2D
	rPI7GrlRxvlFQhC8XZWLVkPWMJwdqRuXZG+TlL9y6Fa+E61z19hG+e6Sre+kP1zK1RlV+uZSj627U
	+AeQTvbtJewiAd1067KiKn6AYzbwGT3H/WO0/wjq2W3qCQjJDac3eJL96V1nWTit5mOJTuLXDoQNL
	8EUI5+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d0a-0000000DBUk-1V8D;
	Fri, 20 Mar 2026 16:47:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d0Y-0000000DBT5-18Wv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:47:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eZ2KERFjyyQf8dxQP/UdKYTPcwvV1gn7poLNdNWhNwc=; b=RokbSFW1YJaX5DndiPpnSPZipq
	nvI5JqJpgi4FGAoenz7kBeFm5T8xsfWEvrKGq2BQ5vRSa7zqyut9pEqx5fF6h4VfjvfgUTb0aIcO8
	AwPi+xPfVhV19p9rsf9eZAHiOR0xTl5K4YesEAHm8dVd1EYblLAqvPqbomVuI5vtSWipJzjhDEp0R
	ccZqXDTrG0AlehxC/dxivmMJO48y1pHwarH0iNajxZGl0KKecUFOoedjmt5yjrTi4029LeXREtiH+
	c9ueZOdtsKIRvQFdw0DlJO96d/gpEhjvutmJeNLAwJySINj0WlHBjLMVNRhr3fjUzwu8NZIhjM72S
	t3xiNjmg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34054 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w3d0S-000000006M2-27Lp;
	Fri, 20 Mar 2026 16:47:28 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w3d0R-0000000DfM1-1itN;
	Fri, 20 Mar 2026 16:47:27 +0000
In-Reply-To: <ab15_JvLGFtUH_3x@shell.armlinux.org.uk>
References: <ab15_JvLGFtUH_3x@shell.armlinux.org.uk>
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
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 4/6] net: stmmac: move stmmac_xmit() initial variable
 init
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w3d0R-0000000DfM1-1itN@rmk-PC.armlinux.org.uk>
Date: Fri, 20 Mar 2026 16:47:27 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_094734_310556_733B5247 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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

Move tx_q, first_tx and txq_stats just before their first use.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d5e28ecf9fb4..95da2940cc3d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4692,10 +4692,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	dma_addr_t dma_addr;
 	u32 sdu_len;
 
-	tx_q = &priv->dma_conf.tx_queue[queue];
-	txq_stats = &priv->xstats.txq_stats[queue];
-	first_tx = tx_q->cur_tx;
-
 	if (priv->tx_path_in_lpi_mode && priv->eee_sw_timer_en)
 		stmmac_stop_sw_lpi(priv);
 
@@ -4732,6 +4728,9 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		return NETDEV_TX_BUSY;
 	}
 
+	tx_q = &priv->dma_conf.tx_queue[queue];
+	first_tx = tx_q->cur_tx;
+
 	/* Check if VLAN can be inserted by HW */
 	has_vlan = stmmac_vlan_insert(priv, skb, tx_q);
 
@@ -4889,6 +4888,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		netif_tx_stop_queue(netdev_get_tx_queue(priv->dev, queue));
 	}
 
+	txq_stats = &priv->xstats.txq_stats[queue];
 	u64_stats_update_begin(&txq_stats->q_syncp);
 	u64_stats_add(&txq_stats->q.tx_bytes, skb->len);
 	if (set_ic)
-- 
2.47.3


