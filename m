Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477ADD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 14:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWbyBP63uvCTssWzZZ2tOggk/sZ4stCJWuHR4DBcl2M=; b=TZkevWQ/ZdYViqpaMOPaMYcL3m
	UxyutPtVJruK3LqgB0Q23A02S+eChunn6c8C2VA2k35TLef5b6GcwXdkQm8PJZ1UKnD+L64aYmE2v
	7Hr+KiRYth666e59CRS6R4TD/jkLK513wwjCQ7uZhsP0jkm8RjEiPKkXQqL+bP3aMxaPDeLN+ZYej
	KUb7ezDpcZD+nico/GGsskXz446GqvdGtShW4LfNE7fASjBf9Jv+E7G2Q5mTE7PqYa4rEMqe8/g42
	j9bOo9CCWQq4H9xhPObnVI80VAulX8CV5SrssZqu5SefL2V9Xr1Ybpgc7DbAJY2ISrdkGdFA9h7tO
	s2akuEmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ5GK-000000047oY-0HFO;
	Mon, 01 Dec 2025 14:52:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ5GG-000000047jP-1KlB;
	Mon, 01 Dec 2025 14:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fWbyBP63uvCTssWzZZ2tOggk/sZ4stCJWuHR4DBcl2M=; b=PL9UgYn9Y1fpsv/YH5p1RcJPlB
	0vP1B7PV892h7IIHSdksFtTL67trIJ5hum3N462aYcfm5WBMx/QEGfhiVgv7dYIVHCseLazkr0yTW
	v5SqDL5/uWhsmY9uK/NzLfG1X7VNdAvwg1qaJ3o4qb4sf3J3I4IsaIJdSAQKdrqcs+xcpzvfPSFIZ
	pf/p0/SkB/W56Z/T6CRXXi51SXS08M0tCu9SGNCMKiaJ0fQxMbBDsNlSppNeGLfkNQjUNKioFyUQ2
	fWsBFyvcBJKtEDdtTUdRWJtjRb7CyRH19U4+VMTqTnNWVNV1OyUO8gD1cTIvvReNSAgxvNNhIbNaH
	Q22uelKw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49796 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vQ5Fl-000000000hr-1b36;
	Mon, 01 Dec 2025 14:51:49 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vQ5Fg-0000000GNwZ-0aYc;
	Mon, 01 Dec 2025 14:51:44 +0000
In-Reply-To: <aS2rFBlz1jdwXaS8@shell.armlinux.org.uk>
References: <aS2rFBlz1jdwXaS8@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next 12/15] net: stmmac: rk: introduce flags
 indicating support for RGMII/RMII
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vQ5Fg-0000000GNwZ-0aYc@rmk-PC.armlinux.org.uk>
Date: Mon, 01 Dec 2025 14:51:44 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_065220_391896_BFCBF02B 
X-CRM114-Status: GOOD (  12.99  )
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

Introduce two boolean flags into struct rk_priv_data indicating
whether RGMII and/or RMII is supported for this instance. Use these
to configure the supported_interfaces mask for phylink, validate the
interface mode. Initialise these from equivalent flags in the
rk_gmac_ops or depending on the presence of the ops->set_to_rgmii and
ops->set_to_mii methods. Finally, make ops->set_to_* optional.

This will allow us to get rid of empty set_to_rmii() methods.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 35 +++++++++++++------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 4c80a73bbf74..fbc0e50519f6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -48,6 +48,8 @@ struct rk_gmac_ops {
 	u16 mac_speed_mask;
 
 	bool speed_reg_php_grf;
+	bool supports_rgmii;
+	bool supports_rmii;
 	bool php_grf_required;
 	bool regs_valid;
 	u32 regs[];
@@ -81,6 +83,8 @@ struct rk_priv_data {
 	bool clk_enabled;
 	bool clock_input;
 	bool integrated_phy;
+	bool supports_rgmii;
+	bool supports_rmii;
 
 	struct clk_bulk_data *clks;
 	int num_clks;
@@ -1387,6 +1391,9 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
 	bsp_priv->rmii_clk_sel_mask = ops->rmii_clk_sel_mask;
 	bsp_priv->mac_speed_mask = ops->mac_speed_mask;
 
+	bsp_priv->supports_rgmii = ops->supports_rgmii || !!ops->set_to_rgmii;
+	bsp_priv->supports_rmii = ops->supports_rmii || !!ops->set_to_rmii;
+
 	if (ops->init) {
 		ret = ops->init(bsp_priv);
 		if (ret) {
@@ -1405,11 +1412,11 @@ static int rk_gmac_check_ops(struct rk_priv_data *bsp_priv)
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		if (!bsp_priv->ops->set_to_rgmii)
+		if (!bsp_priv->supports_rgmii)
 			return -EINVAL;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		if (!bsp_priv->ops->set_to_rmii)
+		if (!bsp_priv->supports_rmii)
 			return -EINVAL;
 		break;
 	default:
@@ -1455,24 +1462,32 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 	switch (bsp_priv->phy_iface) {
 	case PHY_INTERFACE_MODE_RGMII:
 		dev_info(dev, "init for RGMII\n");
-		bsp_priv->ops->set_to_rgmii(bsp_priv, bsp_priv->tx_delay,
-					    bsp_priv->rx_delay);
+		if (bsp_priv->ops->set_to_rgmii)
+			bsp_priv->ops->set_to_rgmii(bsp_priv,
+						    bsp_priv->tx_delay,
+						    bsp_priv->rx_delay);
 		break;
 	case PHY_INTERFACE_MODE_RGMII_ID:
 		dev_info(dev, "init for RGMII_ID\n");
-		bsp_priv->ops->set_to_rgmii(bsp_priv, 0, 0);
+		if (bsp_priv->ops->set_to_rgmii)
+			bsp_priv->ops->set_to_rgmii(bsp_priv, 0, 0);
 		break;
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 		dev_info(dev, "init for RGMII_RXID\n");
-		bsp_priv->ops->set_to_rgmii(bsp_priv, bsp_priv->tx_delay, 0);
+		if (bsp_priv->ops->set_to_rgmii)
+			bsp_priv->ops->set_to_rgmii(bsp_priv,
+						    bsp_priv->tx_delay, 0);
 		break;
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 		dev_info(dev, "init for RGMII_TXID\n");
-		bsp_priv->ops->set_to_rgmii(bsp_priv, 0, bsp_priv->rx_delay);
+		if (bsp_priv->ops->set_to_rgmii)
+			bsp_priv->ops->set_to_rgmii(bsp_priv,
+						    0, bsp_priv->rx_delay);
 		break;
 	case PHY_INTERFACE_MODE_RMII:
 		dev_info(dev, "init for RMII\n");
-		bsp_priv->ops->set_to_rmii(bsp_priv);
+		if (bsp_priv->ops->set_to_rmii)
+			bsp_priv->ops->set_to_rmii(bsp_priv);
 		break;
 	default:
 		dev_err(dev, "NO interface defined!\n");
@@ -1508,10 +1523,10 @@ static void rk_get_interfaces(struct stmmac_priv *priv, void *bsp_priv,
 {
 	struct rk_priv_data *rk = bsp_priv;
 
-	if (rk->ops->set_to_rgmii)
+	if (rk->supports_rgmii)
 		phy_interface_set_rgmii(interfaces);
 
-	if (rk->ops->set_to_rmii)
+	if (rk->supports_rmii)
 		__set_bit(PHY_INTERFACE_MODE_RMII, interfaces);
 }
 
-- 
2.47.3


