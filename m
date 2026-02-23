Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DADEA4FB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4TUBah16GDdhtaKN61j6qNC6e187hWuNZSPnIGunkaw=; b=Hjm5qS353pEe6fgDUKIs3tsJzY
	Y3DK+r5trq4sl8eaYLxKhAcKaZwP2ERThG+B8hh53JQLUjkZu+lHngwte2A7+E3Ji8Z53AIFsCsGN
	EhhNbDcy/CUk9Fv9cwm1h6LFmsYhgAi1+r06QFAzkkTFF7CCSjyx5j+nD70ROtjSF73YUUEfQfjg0
	SzWeYaRmmx/aCBfYAWDfFwAL0wIEJIrFVmtmcoZqErvjcRxa8ybGw4BjgkWSYYjITXlSJZnubLk5n
	whHQvkk81bsFMG3XQjVaqayD8xq/GaQ2rl2Kxt2USEJ5bs3RvrwGwH6WhHEstwO6SZSH9mpb2uSm4
	47hx+BEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuU3g-00000000Aqm-2UF9;
	Mon, 23 Feb 2026 11:25:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuU3e-00000000AqM-1RYb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 11:24:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4TUBah16GDdhtaKN61j6qNC6e187hWuNZSPnIGunkaw=; b=ldmf4dqbIJ3Gox+YeX2Xt8Y5LB
	+wDBfhh0dm00zjJym+zp2X9/5D/n5ylJWylwro9vWWWZ6RXZxj6blJK3CYbwlrGuuthCl2o60NiSE
	eAz+7iKEGEbIs7oCXiv79ZahT0/4YmTXh9MBpGkt6WOHaPfKMKnIk1vy0CU2lBWpI4zyK9L7Ea7CF
	RkRfL+gzsVAcN8iXeB9lp6sXZehZQKZtI1NZOWSJDjRJwSmy3oEJw3mxjsEvjkbFEp1b2j/9Mjxe6
	j3clX/cpymOnCuJKSGKg2gvGm6En3y3JKtOd9WaaG0uQYJfj1emqukt3vRP181jgrl7jwSU82UkwQ
	6tjaeHEg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45166 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vuU3Y-000000003xp-04Ul;
	Mon, 23 Feb 2026 11:24:52 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vuU3X-0000000Ae9G-1Er8;
	Mon, 23 Feb 2026 11:24:51 +0000
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
Subject: [PATCH net-next] net: stmmac: fix .ndo_fix_features()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vuU3X-0000000Ae9G-1Er8@rmk-PC.armlinux.org.uk>
Date: Mon, 23 Feb 2026 11:24:51 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_032458_387622_DE394F64 
X-CRM114-Status: GOOD (  11.69  )
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

netdev features documentation requires that .ndo_fix_features() is
stateless: it shouldn't modify driver state. Yet, stmmac_fix_features()
does exactly that, changing whether GSO frames are processed by the
driver.

Move this code to stmmac_set_features() instead, which is the correct
place for it. We don't need to check whether TSO is supported; this
is already handled via the setup of netdev->hw_features, and we are
guaranteed that if netdev->hw_features indicates that a feature is
not supported, .ndo_set_features() won't be called with it set.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 82375d34ad57..a2a0985e8c37 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6105,14 +6105,6 @@ static netdev_features_t stmmac_fix_features(struct net_device *dev,
 	if (priv->plat->bugged_jumbo && (dev->mtu > ETH_DATA_LEN))
 		features &= ~NETIF_F_CSUM_MASK;
 
-	/* Disable tso if asked by ethtool */
-	if ((priv->plat->flags & STMMAC_FLAG_TSO_EN) && (priv->dma_cap.tsoen)) {
-		if (features & NETIF_F_TSO)
-			priv->tso = true;
-		else
-			priv->tso = false;
-	}
-
 	return features;
 }
 
@@ -6144,6 +6136,8 @@ static int stmmac_set_features(struct net_device *netdev,
 	else
 		priv->hw->hw_vlan_en = false;
 
+	priv->tso = !!(features & NETIF_F_TSO);
+
 	phylink_rx_clk_stop_block(priv->phylink);
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
 	phylink_rx_clk_stop_unblock(priv->phylink);
-- 
2.47.3


