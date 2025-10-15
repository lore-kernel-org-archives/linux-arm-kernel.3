Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395B7CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 16:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gb/wZg//idgP0aJjQsDqyZi+MpDmhmg/7WfGvBfMh50=; b=eanXxodEvup1F2JLoc5cJw+s8S
	WNFS8ITZUjT97BIk/ZKWi0yIyyd/AgHPkCRCbPzUnC4hIIx/DFv2Z33+TAtaVNB5MtexaSO66RE18
	ArzS7oFrW5Hcs1dm636pn0ZuchgBWYppjJIPLgPXaobtvxsY7aslmU2tjVCY4ZiMYda79zPQIMb7D
	jMZ+mL0R2iypTCYmHjRnx+c3WuelGtxQdRVX+LVXohvfy+/9gYDwefKpuU13oX1ad+Zd5q9uHKaRZ
	nr7wDDgfdKQjFceElOWr84yNHG/cah+TDaHrpfImbrsqxbiAE+846PuS1tnqD7E67KwMBlxfpWY1g
	GDy2JRfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v945d-00000002FGJ-3xxB;
	Wed, 15 Oct 2025 16:11:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v945b-00000002FDy-0Xql
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 16:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Gb/wZg//idgP0aJjQsDqyZi+MpDmhmg/7WfGvBfMh50=; b=j3X4MWu7b4hQ1UJETH24Z2neRa
	ojTTrMUmEq6CCu2PgjNIr1pMf343ftlBy4+AIBohE11sMULn2XFTc3WS932Y1v0WFEsnP/ZNPKvNP
	j/556CK+p/UAX+i9D0FSngfkZHQd8xAMa57/Vbbeefrd4TgO8ltCRzeMQPtOMQwn04yxvzLJNBIly
	Mf8UdYiLQK4r2oE0acJTHzLZ/FtkNCK7Z3spBcL4HL35paQdkAcSW2bDEtoUkGxBAMRcTCHbnZFIW
	70zdlXhye57aWXXUoZNiu2+eN5rGu6XBOjP9AJE13GNGmcNWj9DlLqa9jDfYU7d1UkzjFEDMcBcuJ
	cEUfLjcg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34166 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v945U-000000005AH-2gB7;
	Wed, 15 Oct 2025 17:10:52 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v945T-0000000AmeV-2BvU;
	Wed, 15 Oct 2025 17:10:51 +0100
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
Subject: [PATCH net-next 3/5] net: stmmac: avoid PHY speed change when
 configuring MTU
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v945T-0000000AmeV-2BvU@rmk-PC.armlinux.org.uk>
Date: Wed, 15 Oct 2025 17:10:51 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_091059_178530_296624C1 
X-CRM114-Status: GOOD (  13.32  )
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

There is no need to do the speed-down, speed-up dance when changing
the MTU as there is little power saving that can be gained from such
a brief interval between these, and the autonegotiation they cause
takes much longer.

Move the calls to phylink_speed_up() and phylink_speed_down() into
stmmac_open() and stmmac_release() respectively, reducing the work
done in the __-variants of these functions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3728afa701c6..500cfd19e6b5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3963,8 +3963,6 @@ static int __stmmac_open(struct net_device *dev,
 	stmmac_init_coalesce(priv);
 
 	phylink_start(priv->phylink);
-	/* We may have called phylink_speed_down before */
-	phylink_speed_up(priv->phylink);
 
 	ret = stmmac_request_irq(dev);
 	if (ret)
@@ -4015,6 +4013,9 @@ static int stmmac_open(struct net_device *dev)
 
 	kfree(dma_conf);
 
+	/* We may have called phylink_speed_down before */
+	phylink_speed_up(priv->phylink);
+
 	return ret;
 
 err_disconnect_phy:
@@ -4032,13 +4033,6 @@ static void __stmmac_release(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 chan;
 
-	/* If the PHY or MAC has WoL enabled, then the PHY will not be
-	 * suspended when phylink_stop() is called below. Set the PHY
-	 * to its slowest speed to save power.
-	 */
-	if (device_may_wakeup(priv->device))
-		phylink_speed_down(priv->phylink, false);
-
 	/* Stop and disconnect the PHY */
 	phylink_stop(priv->phylink);
 
@@ -4078,6 +4072,13 @@ static int stmmac_release(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
+	/* If the PHY or MAC has WoL enabled, then the PHY will not be
+	 * suspended when phylink_stop() is called below. Set the PHY
+	 * to its slowest speed to save power.
+	 */
+	if (device_may_wakeup(priv->device))
+		phylink_speed_down(priv->phylink, false);
+
 	__stmmac_release(dev);
 
 	phylink_disconnect_phy(priv->phylink);
-- 
2.47.3


