Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7310ACAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtZeWx9KqJQHyw/RwePAF9k/RAwt4wluWSxKJcfUeCU=; b=yhqm1OO4gaT584TgR7VXbO9F9g
	wx2KQxda0CNKQO4UpHYkig7+KDJqRbwkhzTq92IDdkICt+vYQJFgXuh/B1MTkaicZPH5hyhvk4dDm
	QmyQwcSAFAJ//VvWEClDp6Tlvo/3T0qurk5Og7JN0BHi+3OyBwn53rM4FuMTRFQGWt8+MlTaM5fi2
	nNXpwkj2knbqWGZqbs2wqN17pWxIoUE/muh1+lnQTbLDg8sAyrEPHDU5qkbNYd6nsHhz64xdGs8wv
	k2fI2n6U5ven/D8/hSh1L+THPVTMizX3kprhB9n8IOB5zwX+bqFccu/ibRE+M8UFB+WH7kgwDvm4P
	VbLKmvAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyu60-0000000CiFo-1jAo;
	Wed, 17 Sep 2025 15:29:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyu5z-0000000CiEg-0USx;
	Wed, 17 Sep 2025 15:29:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=xtZeWx9KqJQHyw/RwePAF9k/RAwt4wluWSxKJcfUeCU=; b=hVSRfj/1ZYidgMtQ+CVZuMJmrk
	SBb+3F6F0avg/WzRSqMVbpbcFAa8exLI4d33ix/Dc9x78sHyQ2GbcA5QTdUIAvEUzJ1S/Tt6iDYth
	r9c4cMHvu6L8jzyMq7hj/F/Hdc3rqkzirbautr24L8EyMdSm6iYvHBjqUuOV85MIUPOucISr9kjsn
	OBsO2hVAT1NJcMw/N4EDbnd99fJwycmZiOp1FJ8yfxcvpfbBOr/PPImdpfKVfketmNck3JmTE976m
	YCBunubq+lvKmcLwrKDCscQasaRDXe5AuuSkevtzE0Qx2c5/x0jWI+9I/2x7VtYOsLpgkXjomay2a
	kUuZ03xA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyu5v-00000007Qsz-3eCv;
	Wed, 17 Sep 2025 15:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xtZeWx9KqJQHyw/RwePAF9k/RAwt4wluWSxKJcfUeCU=; b=cmLmfPjnvDCQAT+4j4CDP/CqP2
	f9se6tU2GSHHFs2/ZKmDFUJECu+41yF3IJuR3tgPqhxBrmeKO00vPY4wEJsBuiXrROerDtefj0e5L
	3uxX34vV3QCJgBKz9rY9eTWSUDFR3A6UMaWCOAgXwFljG9OFlctEbZIjvIbTo65S+IWe3uSk62+ta
	vJEZQOlRae+y+ZlL/MZhPc4wm2RWWSiHhmToiL8nbMTCFDwMv+WozI8us5n1RVKhj2iGYxVWXBrQs
	we6nbF3GePtbZP3AHiSy+yEMfMAIWSQagl/ymveh19RWWdpor5uHVFj4foxiGRFdSir85U72CO2OU
	OAY1GLZA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57100 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uytq1-000000004nF-1c12;
	Wed, 17 Sep 2025 16:12:53 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uytpv-00000006H2x-196h;
	Wed, 17 Sep 2025 16:12:47 +0100
In-Reply-To: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
References: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <fustini@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH net-next 10/10] net: stmmac: remove mac_interface
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uytpv-00000006H2x-196h@rmk-PC.armlinux.org.uk>
Date: Wed, 17 Sep 2025 16:12:47 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_162920_037136_51F6E3B9 
X-CRM114-Status: GOOD (  20.67  )
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

mac_interface has served little purpose, and has only caused confusion.
Now that we have cleaned up all platform glue drivers which should not
have been using mac_interface, there are no users remaining. Remove
mac_interface.

This results in the special dwmac specific "mac-mode" DT property
becoming redundant, and an in case, no DTS files in the kernel make use
of this property. Add a warning if the property is set, and it is
different from the "phy-mode".

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c  |  2 --
 drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c   |  1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     |  5 +----
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c |  6 +++++-
 include/linux/stmmac.h                                | 11 +++--------
 5 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index dd82dc2189e9..592aa9d636e5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -98,8 +98,6 @@ static void loongson_default_data(struct pci_dev *pdev,
 	/* Set default value for multicast hash bins */
 	plat->multicast_filter_bins = 256;
 
-	plat->mac_interface = PHY_INTERFACE_MODE_NA;
-
 	/* Set default value for unicast filter entries */
 	plat->unicast_filter_entries = 1;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
index c0c44916f849..2562a6d036a2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
@@ -41,7 +41,6 @@ static int lpc18xx_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
-	plat_dat->mac_interface = PHY_INTERFACE_MODE_NA;
 	plat_dat->has_gmac = true;
 
 	reg = syscon_regmap_lookup_by_compatible("nxp,lpc1850-creg");
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a23017a886f3..d17820d9e7f1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1118,10 +1118,7 @@ static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
  */
 static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 {
-	int interface = priv->plat->mac_interface;
-
-	if (interface == PHY_INTERFACE_MODE_NA)
-		interface = priv->plat->phy_interface;
+	int interface = priv->plat->phy_interface;
 
 	if (priv->dma_cap.pcs) {
 		if ((interface == PHY_INTERFACE_MODE_RGMII) ||
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index a3e077f225d1..712ef235f0f4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -453,8 +453,12 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		return ERR_PTR(phy_mode);
 
 	plat->phy_interface = phy_mode;
+
 	rc = stmmac_of_get_mac_mode(np);
-	plat->mac_interface = rc < 0 ? plat->phy_interface : rc;
+	if (rc >= 0 && rc != phy_mode)
+		dev_warn(&pdev->dev,
+			 "\"mac-mode\" property used for %s but differs to \"phy-mode\" of %s, and will be ignored. Please report.\n",
+			 phy_modes(rc), phy_modes(phy_mode));
 
 	/* Some wrapper drivers still rely on phy_node. Let's save it while
 	 * they are not converted to phylink. */
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index f14f34ec6d5e..fa1318bac06c 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -190,8 +190,8 @@ struct plat_stmmacenet_data {
 	int bus_id;
 	int phy_addr;
 	/* MAC ----- optional PCS ----- SerDes ----- optional PHY ----- Media
-	 *                          ^            ^
-	 *                    mac_interface phy_interface
+	 *                                       ^
+	 *                                  phy_interface
 	 *
 	 * The Synopsys dwmac core only covers the MAC and an optional
 	 * integrated PCS. Where the integrated PCS is used with a SerDes,
@@ -208,12 +208,7 @@ struct plat_stmmacenet_data {
 	 * is used, this counts as "the rest of the SoC" in the above
 	 * paragraph.
 	 *
-	 * Thus, mac_interface is of little use inside the stmmac code;
-	 * please do not use unless there is a definite requirement, and
-	 * make sure to gain review feedback first.
-	 */
-	phy_interface_t mac_interface;
-	/* phy_interface is the PHY-side interface - the interface used by
+	 * phy_interface is the PHY-side interface - the interface used by
 	 * an attached PHY or SFP etc. This is equivalent to the interface
 	 * that phylink uses.
 	 */
-- 
2.47.3


