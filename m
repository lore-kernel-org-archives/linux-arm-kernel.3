Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FC3CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 16:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOOQYLd96M6BO1COUjospMceQ2X16bQTz+GpJfxe6dU=; b=p/v6fphdfp2ldcYFEwvcs6/Rwf
	9Wuza94zJwS+TUr3dRpQ7pAErnVM+R29e5czDgUjYlvQxu6jjhciOtJxD4MSA/v/croLi3uXez6s4
	z/QMsCgh8jYH11cW3/aPhZ6NnCOGx3s5QJfLVzFoKWdnHJcRjJSuBJInzBpAdVMoH610gz//4IRQs
	vzGYLu1XqVvky4VZrMpm69PLca1Ubeyxk9mdWs2znMwvNj5KVVnZUC5tVBN37F2HU0qcaMI2nQQYh
	eZNCjHRL5ivP16pc2VQv+J0LpolPWlSqItvhtkT1N0m7tNSE8usNnSHb1qGljY+CTEyeZKHXkI5ou
	BbQ0Sg0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v945Y-00000002FDO-2akS;
	Wed, 15 Oct 2025 16:10:56 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v945V-00000002FAt-2vZK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 16:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EOOQYLd96M6BO1COUjospMceQ2X16bQTz+GpJfxe6dU=; b=VoghqnzDrcZJxEVOdC2xWrRT3X
	nHqifRzkO528MOkPURnD8VoPgtrmjyps5vYoKwyCM53/zeoJ32ZpDbiZ4k7tcqkFfKsjHuOL2C8Cz
	9TowXX+ukPT+1uZU55H5Nipu259oleebKCdZ6F0NX6pSrHUZ1XGRUhsDX0Btseg1KoU3tAv7HgGRb
	OSpZiABMKfd4KNw34C6qAUvWAcjQ+aPuoCpvlovKR7ipGJ377Saz8Mmwg4EGJSm0x/mu5DKnckY3k
	+OKiu3pSIhiMaE0fiZAKXBAv/KU/8extcC5uz4NyJixKji+wvMz16A0G1y4vXpNoFP7WwCNeG/BCI
	YOFZlz0w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38624 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v945P-000000005A0-23CF;
	Wed, 15 Oct 2025 17:10:47 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v945O-0000000AmeP-1k0t;
	Wed, 15 Oct 2025 17:10:46 +0100
In-Reply-To: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 2/5] net: stmmac: place .mac_finish() method more
 appropriately
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v945O-0000000AmeP-1k0t@rmk-PC.armlinux.org.uk>
Date: Wed, 15 Oct 2025 17:10:46 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_091053_734649_343ABAD5 
X-CRM114-Status: GOOD (  10.92  )
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

Place the .mac_finish() initialiser and implementation after the
.mac_config() initialiser and method which reflects the order that
they appear in struct phylink_mac_ops, and the order in which they
are called. This keeps logically similar code together.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 650d75b73e0b..3728afa701c6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -859,6 +859,18 @@ static void stmmac_mac_config(struct phylink_config *config, unsigned int mode,
 	/* Nothing to do, xpcs_config() handles everything */
 }
 
+static int stmmac_mac_finish(struct phylink_config *config, unsigned int mode,
+			     phy_interface_t interface)
+{
+	struct net_device *ndev = to_net_dev(config->dev);
+	struct stmmac_priv *priv = netdev_priv(ndev);
+
+	if (priv->plat->mac_finish)
+		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode, interface);
+
+	return 0;
+}
+
 static void stmmac_mac_link_down(struct phylink_config *config,
 				 unsigned int mode, phy_interface_t interface)
 {
@@ -1053,27 +1065,15 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 	return 0;
 }
 
-static int stmmac_mac_finish(struct phylink_config *config, unsigned int mode,
-			     phy_interface_t interface)
-{
-	struct net_device *ndev = to_net_dev(config->dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-
-	if (priv->plat->mac_finish)
-		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode, interface);
-
-	return 0;
-}
-
 static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
 	.mac_get_caps = stmmac_mac_get_caps,
 	.mac_select_pcs = stmmac_mac_select_pcs,
 	.mac_config = stmmac_mac_config,
+	.mac_finish = stmmac_mac_finish,
 	.mac_link_down = stmmac_mac_link_down,
 	.mac_link_up = stmmac_mac_link_up,
 	.mac_disable_tx_lpi = stmmac_mac_disable_tx_lpi,
 	.mac_enable_tx_lpi = stmmac_mac_enable_tx_lpi,
-	.mac_finish = stmmac_mac_finish,
 };
 
 /**
-- 
2.47.3


