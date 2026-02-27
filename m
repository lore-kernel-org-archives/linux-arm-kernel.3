Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A041FFD5326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34kwHl9xQl8nf46ADhM6ax9RyPXjkoV/C1HTsw/j13I=; b=trWB+p12Kznge37swLWEadUEYh
	G/8qn9QCrWcxxoDBoKYlzpaxR1Ulp0PxGMllq4OVyrEzS0o6nWooJP8kf+X9+NrnkdFuNqaOoRwSz
	dQgPkZqOzibf93pgtly2KFjIhHF2+PIvs7tgEcsL6eotnQrk/9ieyExoj60+p58o2M1h5ULj9glfr
	NxlMc+vDKihcVmA8hPgB7NH/VV1UcnKmPXCkemcQiONIhMBIj7a7u06trApSjXvK6VGGj5f83ZKXM
	YFdKUjUh6DBL/wEKFnmtg/4X2ajIlq/4fbGb6/1x+lTgDiITy7a8fHYyrqdD0c7jFSFsncvuy21Hk
	B3tz3uMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuXC-00000008B2n-33Bl;
	Fri, 27 Feb 2026 09:53:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuX9-00000008B16-3ZmQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=34kwHl9xQl8nf46ADhM6ax9RyPXjkoV/C1HTsw/j13I=; b=bK141D0rurm+3WWpoLYAa83cqD
	iFZxUv6WjHvFuxMkxzI0aQNp3lhFu1ujYbjn+YbSIc+C8EJgEzSXnJlEpOE3KsbOmIRgk6xrq9Nvx
	e8AIr1n5Pl2oM6GVJ30iEjJDA3IYfzrgPghuTKlNTH0vm98/PphLqAxU1sD93ZJiOSaBWPqWAiBbP
	zelrcjQ0sexpOMIw26X+tArkc+b89cHOdu3HB1zFkKVBlMi1jalCaEbEE2A93fuk7AMPs9/8Re2wI
	cQbtpT6+RfD/2a8GmhJKMckkDG4GLyBZhvBWrn/t/tKenqs3Ol6jHjZjD5gKqwNLFkWK9qNk/tJhw
	GzNxrn9Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51880 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvuX4-000000000c7-3VTJ;
	Fri, 27 Feb 2026 09:53:14 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvuX3-0000000Avme-3oej;
	Fri, 27 Feb 2026 09:53:13 +0000
In-Reply-To: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
References: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 02/14] net: stmmac: remove plat_dat->port_node
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvuX3-0000000Avme-3oej@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 09:53:13 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_015319_906679_B9B084DA 
X-CRM114-Status: GOOD (  15.59  )
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

There are repeated instances of:

	fwnode = priv->plat->port_node;
	if (!fwnode)
		fwnode = dev_fwnode(priv->device);

However, the only place that ->port_node is set is
stmmac_probe_config_dt():

	struct device_node *np = pdev->dev.of_node;
...
	/* PHYLINK automatically parses the phy-handle property */
	plat->port_node = of_fwnode_handle(np);

which is equivalent to dev_fwnode(&pdev->dev) and, as priv->device
will be &pdev->dev, is also equivalent to dev_fwnode(priv->device).

Thus, plat_dat->port_node doesn't provide any extra benefit over
using dev_fwnode(priv->device) directly.

There is one case where port_node is used directly, which can be
found in stmmac_pcs_setup(). This may cause a change of behaviour
as PCI drivers do not populate plat_dat->port_node, but
dev_fwnode(priv->device) may be valid. PCI-based stmmac should
be tested.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   | 13 +++----------
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c   |  7 ++-----
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c   |  3 ---
 include/linux/stmmac.h                              |  1 -
 4 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2b21cc839146..3f74766f6e21 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1252,10 +1252,7 @@ static int stmmac_init_phy(struct net_device *dev)
 	    xpcs_get_an_mode(priv->hw->xpcs, mode) == DW_AN_C73)
 		return 0;
 
-	fwnode = priv->plat->port_node;
-	if (!fwnode)
-		fwnode = dev_fwnode(priv->device);
-
+	fwnode = dev_fwnode(priv->device);
 	if (fwnode)
 		phy_fwnode = fwnode_get_phy_node(fwnode);
 	else
@@ -1313,7 +1310,6 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
 {
 	struct stmmac_mdio_bus_data *mdio_bus_data;
 	struct phylink_config *config;
-	struct fwnode_handle *fwnode;
 	struct phylink_pcs *pcs;
 	struct phylink *phylink;
 
@@ -1405,11 +1401,8 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
 			config->wol_mac_support |= WAKE_MAGIC;
 	}
 
-	fwnode = priv->plat->port_node;
-	if (!fwnode)
-		fwnode = dev_fwnode(priv->device);
-
-	phylink = phylink_create(config, fwnode, priv->plat->phy_interface,
+	phylink = phylink_create(config, dev_fwnode(priv->device),
+				 priv->plat->phy_interface,
 				 &stmmac_phylink_mac_ops);
 	if (IS_ERR(phylink))
 		return PTR_ERR(phylink);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index a7c2496b39f2..485a0d790baa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -430,7 +430,7 @@ int stmmac_pcs_setup(struct net_device *ndev)
 	struct dw_xpcs *xpcs = NULL;
 	int addr, ret;
 
-	devnode = priv->plat->port_node;
+	devnode = dev_fwnode(priv->device);
 
 	if (priv->plat->pcs_init) {
 		ret = priv->plat->pcs_init(priv);
@@ -649,10 +649,7 @@ int stmmac_mdio_register(struct net_device *ndev)
 		stmmac_xgmac2_mdio_read_c45(new_bus, 0, 0, 0);
 
 	/* If fixed-link is set, skip PHY scanning */
-	fwnode = priv->plat->port_node;
-	if (!fwnode)
-		fwnode = dev_fwnode(priv->device);
-
+	fwnode = dev_fwnode(priv->device);
 	if (fwnode) {
 		fixed_node = fwnode_get_named_child_node(fwnode, "fixed-link");
 		if (fixed_node) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 5c9fd91a1db9..c34998486293 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -446,9 +446,6 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	 * they are not converted to phylink. */
 	plat->phy_node = of_parse_phandle(np, "phy-handle", 0);
 
-	/* PHYLINK automatically parses the phy-handle property */
-	plat->port_node = of_fwnode_handle(np);
-
 	/* Get max speed of operation from device tree */
 	of_property_read_u32(np, "max-speed", &plat->max_speed);
 
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index b489e2c6d710..cc6c89769d82 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -226,7 +226,6 @@ struct plat_stmmacenet_data {
 	phy_interface_t phy_interface;
 	struct stmmac_mdio_bus_data *mdio_bus_data;
 	struct device_node *phy_node;
-	struct fwnode_handle *port_node;
 	struct device_node *mdio_node;
 	struct stmmac_dma_cfg *dma_cfg;
 	struct stmmac_safety_feature_cfg *safety_feat_cfg;
-- 
2.47.3


