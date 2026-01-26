Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE723CF65DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 11:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qGx8UYOulSnUg11qGU4L409UfzsYItsrQ97nAr/FR8=; b=OeD+pgcgwD+JaUGuHzyLpnsDBn
	p4nDAeWz+BeCyYXnma/s9duygz1sFgIZbZk1o1O059aGtpfHPKUg3sJccTefhMGZN940Ilu3kB9U1
	rltsl1AZQ5H/cdCOk/wrO4RAI+k/sFkhbbUzV/93XdSt3ty3xeh2hJYV5P+ZzGaXK0m8Q/JQ96lj6
	vxV0CLpSvEQ89gZCmYslVIjroOQ8r4LCyHHKgu0zqjxcptMY2arknEUo6XrMRO1La4utcIGedXWcn
	eOGWCfxnFDJSAMzENuM1NDjM1gKowpHx0q295HioC70S8NhMb9vlVo10kPI554VFsYXTz7M5lNw/l
	XK1n7eWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL24-0000000CQeP-2J7y;
	Mon, 26 Jan 2026 11:45:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL20-0000000CQb1-10ig;
	Mon, 26 Jan 2026 11:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0qGx8UYOulSnUg11qGU4L409UfzsYItsrQ97nAr/FR8=; b=hHpaLz43MGySpdGbuqLG8yse+9
	TEbi0kl4ewILB0Ej8AJj1w8zjDshHtoEl9a8T0gBDvD+FKIDLewIZKg0s/pq5/E4/QJiJOAAFdrRu
	E8mVl1F6VaLq9UcUB+p1855s2E6+sZ/hJOMwTdVCGbWpvwfNjyJErOoBBB+4tUnrRQq1EIAar1MwT
	w2OE0HpUoNe3jgVP1/eG5z1mt5rKGMo9QfTjXVbxVv9T03a64+GHYAJDJqH/WSrH4v3P076ZhAJOQ
	vxAjwSvuLaZyRO+sD0vlyb2rkAslkpQgbn3wavH4L1WwM6XJQ9yFCqPy4BRJT7RKetiSM6OryJydd
	IRKgbLVw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41130 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vkL1u-000000004e2-0T9G;
	Mon, 26 Jan 2026 11:45:14 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vkL1t-00000005usQ-0vjt;
	Mon, 26 Jan 2026 11:45:13 +0000
In-Reply-To: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
References: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 03/22] net: stmmac: rk: convert rk3328 to use
 bsp_priv->id
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vkL1t-00000005usQ-0vjt@rmk-PC.armlinux.org.uk>
Date: Mon, 26 Jan 2026 11:45:13 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_034520_287166_FC74CB52 
X-CRM114-Status: GOOD (  14.07  )
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

rk3328 contains two GMAC instances - gmac2io and gmac2phy. While the
gmac2io instance may be connected to an external PHY, the gmac2phy
instance is permanently connected via RMII to an on-SoC integrated PHY.

The driver currently tests for the gmac2phy instance by checking
bsp_priv->integrated_phy (determined from the PHY's phy-is-integrated
property) and sometimes that the interface mode is RMII. This works
because the rk3328.dtsi has:

	gmac2phy: ethernet@ff550000 {
		compatible = "rockchip,rk3328-gmac";
		phy-mode = "rmii";
		phy-handle = <&phy>;

		mdio {
			phy: ethernet-phy@0 {
				phy-is-integrated;
			};
		};
	};

The driver contains a mechanism to look up the MMIO address in a table
to determine bsp_priv->id, which is used for every other Rockchip
device. Switch rk3328 to use this mechanism to determine bsp_priv->id
and use that to select which GRF register is used for configuration,
similarly to how the other Rockchip SoCs handle such differences.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 0e66252eb5ae..c8b49ed2064a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -570,8 +570,7 @@ static void rk3328_set_to_rmii(struct rk_priv_data *bsp_priv)
 {
 	unsigned int reg;
 
-	reg = bsp_priv->integrated_phy ? RK3328_GRF_MAC_CON2 :
-		  RK3328_GRF_MAC_CON1;
+	reg = bsp_priv->id ? RK3328_GRF_MAC_CON2 : RK3328_GRF_MAC_CON1;
 
 	regmap_write(bsp_priv->grf, reg,
 		     RK3328_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RMII) |
@@ -591,10 +590,7 @@ static int rk3328_set_speed(struct rk_priv_data *bsp_priv,
 {
 	unsigned int reg;
 
-	if (interface == PHY_INTERFACE_MODE_RMII && bsp_priv->integrated_phy)
-		reg = RK3328_GRF_MAC_CON2;
-	else
-		reg = RK3328_GRF_MAC_CON1;
+	reg = bsp_priv->id ? RK3328_GRF_MAC_CON2 : RK3328_GRF_MAC_CON1;
 
 	return rk_set_reg_speed(bsp_priv, &rk3328_reg_speed_data, reg,
 				interface, speed);
@@ -614,6 +610,13 @@ static const struct rk_gmac_ops rk3328_ops = {
 	.set_speed = rk3328_set_speed,
 	.integrated_phy_powerup = rk3328_integrated_phy_powerup,
 	.integrated_phy_powerdown = rk_gmac_integrated_ephy_powerdown,
+
+	.regs_valid = true,
+	.regs = {
+		0xff540000, /* gmac2io */
+		0xff550000, /* gmac2phy */
+		0, /* sentinel */
+	},
 };
 
 #define RK3366_GRF_SOC_CON6	0x0418
-- 
2.47.3


