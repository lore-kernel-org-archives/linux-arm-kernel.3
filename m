Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2D4C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2NzlMux4LrqC/vPkr6or5eWcOWLuQXUxiLC+yJIl8I=; b=vLgtFESsf72wvFCjDFFmQ4N0Oi
	vHIAONOmpS/UcSdUep8bJ5urSfdkJUHXQY8L9iYC+cAMzVtuXQFlYTFRNQaY8hL3aferXegtqiGQo
	3dQQBRqh1tQAwZVHoiEX/a5rm94VG+zSNe/HhdQyv2TlPCVEXKLv/wRS2o/DBvXk4cCpxHN0Bpjv8
	VxOKIejHP/Y9FO+jEeQND+kfnZSKhMJBbz/jgvMdw3/g7LA7ueeYW6tQgZjPPUJucKG+BsVN5Yuo6
	oM65oGHNywYsmiKCqa1s6RxTmT6yyASrktK2I8mZxCC6XR+bMXCIfwABliq4WynoWnXYzpOz/s6H3
	kE8C4ifg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASo9-0000000FTo8-0aeu;
	Thu, 01 May 2025 12:14:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASMU-0000000FJOO-1TOq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 11:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y2NzlMux4LrqC/vPkr6or5eWcOWLuQXUxiLC+yJIl8I=; b=oheLXXR5lGWOjntwJ41mwnesps
	+hVg0vxSx3kC3VSHIMVsNlulhX3Jxnd7v/LE6oiJDZiOkg2qzBwkbd/k075b/Gfijz5hqnDOUrCUr
	HqiatDSeZrnLTQur8k0gU6knMFpVloA9HPhtBavKVFIf97/ZD6+mqEGfcnRWWipShqdZZ/7bVtmhn
	p9Q1GuKcxMtg1kEZYm+x0wd2IwGfNnoUovDqiM0e8w7EwR2EKxFHSU55qCd7xvIujcWEsbpx372DT
	gtPSzvCxr0hOr1MjpQ5oXOUfdN368z6lxoTtaeZ+7VpkoQJOMmG1p2pBPZheFAnkALBMZiZ59Aj9V
	XPkTcPfA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59436 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uASMK-000050-2M;
	Thu, 01 May 2025 12:45:44 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uASLi-0021QX-HG; Thu, 01 May 2025 12:45:06 +0100
In-Reply-To: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
References: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 2/6] net: stmmac: use priv->plat->phy_interface
 directly
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uASLi-0021QX-HG@rmk-PC.armlinux.org.uk>
Date: Thu, 01 May 2025 12:45:06 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_044554_386401_2717AE11 
X-CRM114-Status: GOOD (  11.93  )
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

Avoid using a local variable for priv->plat->phy_interface as this
may be modified in the .get_interfaces() method added in a future
commit.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fe7f9e3a92a5..ac6ab121eb33 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1258,7 +1258,6 @@ static int stmmac_init_phy(struct net_device *dev)
 static int stmmac_phy_setup(struct stmmac_priv *priv)
 {
 	struct stmmac_mdio_bus_data *mdio_bus_data;
-	int mode = priv->plat->phy_interface;
 	struct phylink_config *config;
 	struct fwnode_handle *fwnode;
 	struct phylink_pcs *pcs;
@@ -1287,7 +1286,7 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	/* Set the platform/firmware specified interface mode. Note, phylink
 	 * deals with the PHY interface mode, not the MAC interface mode.
 	 */
-	__set_bit(mode, config->supported_interfaces);
+	__set_bit(priv->plat->phy_interface, config->supported_interfaces);
 
 	/* If we have an xpcs, it defines which PHY interfaces are supported. */
 	if (priv->hw->xpcs)
@@ -1315,7 +1314,8 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	if (!fwnode)
 		fwnode = dev_fwnode(priv->device);
 
-	phylink = phylink_create(config, fwnode, mode, &stmmac_phylink_mac_ops);
+	phylink = phylink_create(config, fwnode, priv->plat->phy_interface,
+				 &stmmac_phylink_mac_ops);
 	if (IS_ERR(phylink))
 		return PTR_ERR(phylink);
 
-- 
2.30.2


