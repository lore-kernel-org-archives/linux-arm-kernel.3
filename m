Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3DACAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 08:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1oVnAqIRynEdvtoz62JGVAuoit/j3pFYMM2fpFBQec=; b=nkIx1aU8bMI/dU0Wsw/vFw4fWI
	LBFoPyuZNA/tZFu5a41VtRLfBmsFQTv31KjyNqRWALfELTZtFpqeAlSLYgM/EdM3TOI4kFZLxcSrC
	LMBlTGIIEdd2uQqrptHrzqh0W18z8XFJtOdX++ip2lRkMA6wkIgRucUY6dy/F1o8krqfW4DRdKIEt
	xG5WftIe0uuwn+nPOEVe61WaOWjIw9DsaHDos8qlrv4tSliyoJKHJxCapvHjjE4ep9iuKZ0LfCK4j
	MBS9N2klyP2rYdig9SHIw2Iw7+jAEASOWI2BGt5yETMf2kxM3MvvPlqB8eChkROjv3AeoMGZjacck
	z9YIrrLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2nFy-0000000EV5C-3VnG;
	Sun, 28 Sep 2025 08:59:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2nFt-0000000EUzG-2aQ6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 08:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g1oVnAqIRynEdvtoz62JGVAuoit/j3pFYMM2fpFBQec=; b=DqgYUnERY07W98n11vJicdqk2c
	go4P3eNuR4PhwpX9UriGbqN914adWhCxKX1xklzqxcuTc4WmC5k02LkVbwLSVp54/6p8645fclIJn
	vueeOYLqex3ojNdfYWAuFARcfeBNOWUVCfQLP6Q2RSygJEgzcmt3+9I5f+SfaroLxbOhYpFRqa4i7
	wpGNXMxzMSWFf3888PzzEy89aR38G61KzonQZNpJ/aIXPbJO+M47tOWIvUPRUyLG1o8CPZhZKvjga
	Sg74MoNL7UDBbccqR6Xv+4k7MPU3ZshqYrn3D7T8YbGTE7ovXzAYVZ1IntRvaAC2zvvbmiGXor5cC
	kTqK31iA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40264 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v2nFd-000000005Bv-3hCj;
	Sun, 28 Sep 2025 09:59:26 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v2nFX-00000007jXn-2pUD;
	Sun, 28 Sep 2025 09:59:19 +0100
In-Reply-To: <aNj4HY_mk4JDsD_D@shell.armlinux.org.uk>
References: <aNj4HY_mk4JDsD_D@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	 Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Tristram Ha <Tristram.Ha@microchip.com>
Subject: [PATCH RFC net-next 6/6] net: stmmac: convert to phylink managed WoL
 PHY speed
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v2nFX-00000007jXn-2pUD@rmk-PC.armlinux.org.uk>
Date: Sun, 28 Sep 2025 09:59:19 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_015941_665406_767ABD61 
X-CRM114-Status: GOOD (  13.34  )
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

Convert stmmac to use phylink's management of the PHY speed when
Wake-on-Lan is enabled.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  5 -----
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c  |  7 +------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 15 +--------------
 3 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index db4f82672d9a..d10da13ad645 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -376,11 +376,6 @@ enum stmmac_state {
 
 extern const struct dev_pm_ops stmmac_simple_pm_ops;
 
-static inline bool stmmac_wol_enabled_phy(struct stmmac_priv *priv)
-{
-	return !priv->plat->pmt && device_may_wakeup(priv->device);
-}
-
 int stmmac_mdio_unregister(struct net_device *ndev);
 int stmmac_mdio_register(struct net_device *ndev);
 int stmmac_mdio_reset(struct mii_bus *mii);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index fd29b551a082..7ab736de308f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -793,13 +793,8 @@ static void stmmac_get_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 static int stmmac_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	int ret;
 
-	ret = phylink_ethtool_set_wol(priv->phylink, wol);
-	if (!ret)
-		device_set_wakeup_enable(priv->device, !!wol->wolopts);
-
-	return ret;
+	return phylink_ethtool_set_wol(priv->phylink, wol);
 }
 
 static int stmmac_ethtool_op_get_eee(struct net_device *dev,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index abe88b74239a..7b4f0c54b9ec 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1189,14 +1189,6 @@ static int stmmac_init_phy(struct net_device *dev)
 		phylink_ethtool_set_eee(priv->phylink, &eee);
 	}
 
-	if (!priv->plat->pmt) {
-		struct ethtool_wolinfo wol = { .cmd = ETHTOOL_GWOL };
-
-		phylink_ethtool_get_wol(priv->phylink, &wol);
-		device_set_wakeup_capable(priv->device, !!wol.supported);
-		device_set_wakeup_enable(priv->device, !!wol.wolopts);
-	}
-
 	return 0;
 }
 
@@ -1265,6 +1257,7 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 		config->eee_enabled_default = true;
 	}
 
+	config->wol_phy_speed_ctrl = true;
 	if (priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL) {
 		config->wol_phy_legacy = true;
 	} else {
@@ -7795,9 +7788,6 @@ int stmmac_suspend(struct device *dev)
 	mutex_unlock(&priv->lock);
 
 	rtnl_lock();
-	if (stmmac_wol_enabled_phy(priv))
-		phylink_speed_down(priv->phylink, false);
-
 	phylink_suspend(priv->phylink, !!priv->wolopts);
 	rtnl_unlock();
 
@@ -7936,9 +7926,6 @@ int stmmac_resume(struct device *dev)
 	 * workqueue thread, which will race with initialisation.
 	 */
 	phylink_resume(priv->phylink);
-	if (stmmac_wol_enabled_phy(priv))
-		phylink_speed_up(priv->phylink);
-
 	rtnl_unlock();
 
 	netif_device_attach(ndev);
-- 
2.47.3


