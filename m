Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CCACF65E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 11:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrvVZwtNMg6Z73jUZdb4aDJ6/1AUnZabnXeJiRAdzL0=; b=T0vYChcUaS17qGa59kSut13e42
	I/RV2X2BGIGcpKNeEPqyoTxBvjaTYuGd8b1K+djDvthNa7jaBEVzn0jxxXyNbdFd2QskGYWqWSSE4
	Nnr5bu9lxbDYcQ2IgiyTV9Emv0YIyI+s0Pt4C/xHjiqBTw7rQA6nsXEUtAQWeZi0yWBduebtumMiO
	5q2Zy9rYLhX3J3+C/iM2BWsxrERxi/yRd7k+N/opy2QnUJSyhDJV0weAn2Nd9Oz59qFx1RCM6cxjk
	wrYLrAAL+hU2+lDNXVWob+8H+T0QvywwyGFIaPcvt6s/MYRzqK28PJvTRJoD/wKloeN+UHQ29DMVp
	Kvo8J24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL2Z-0000000CR5U-2HWV;
	Mon, 26 Jan 2026 11:45:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL2U-0000000CR0Z-3BSD;
	Mon, 26 Jan 2026 11:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jrvVZwtNMg6Z73jUZdb4aDJ6/1AUnZabnXeJiRAdzL0=; b=bAnmRT/pLUl6YjWnaqLl/s924+
	AiRjIwIFUOXow1TzUC7D/oxei+J8YD9+rd5LzIAkYUwse/XSWNhETyQyuCuqkBVHeulj7lF2SdDQ1
	TlGADGhjdvYfdoofGQlBmddyq4oQY/aJD219f/LD4NbfdtGL6vHRsLp1jKw3VZxexyQBastiLr7sz
	WqabHUlS4OtJck+9UWLh85hvMqVsvEr09y21xP/13O7QUGoKkzy0DbgLqz/sLh+pw/mYSJyvpUpDn
	QVnkHFwWGVhaTSasfADxcYELQWl6QexN7QcFA6/1/pT+UYuXO7Y7HxGAU+VxZ82xdg+9+IsB0Ge6F
	AtJDrLMA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57372 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vkL2K-000000004fY-0kKv;
	Mon, 26 Jan 2026 11:45:40 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vkL2I-00000005usu-42Hy;
	Mon, 26 Jan 2026 11:45:38 +0000
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
Subject: [PATCH net-next v2 08/22] net: stmmac: rk: convert rk3588 to
 mask-based interface mode config
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vkL2I-00000005usu-42Hy@rmk-PC.armlinux.org.uk>
Date: Mon, 26 Jan 2026 11:45:38 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_034550_847171_9BBFC552 
X-CRM114-Status: GOOD (  15.57  )
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

rk3588 has a quirk compared to the other Rockchip implementations in
that the interface mode configuration register is in the php_grf
regmap rather than the grf regmap. Add a flag to indicate this, and
a separate function to write to the appropriate regmap. This allows
rk3588 to be converted.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 45 ++++++++++++++-----
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 35836ffdfc1d..5bbdcc963430 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -50,6 +50,7 @@ struct rk_gmac_ops {
 	u16 gmac_phy_intf_sel_mask;
 	u16 gmac_rmii_mode_mask;
 
+	bool gmac_grf_reg_in_php;
 	bool php_grf_required;
 	bool regs_valid;
 	u32 regs[];
@@ -126,6 +127,18 @@ static u32 rk_encode_wm16(u16 val, u16 mask)
 	return reg_val;
 }
 
+static int rk_write_gmac_grf_reg(struct rk_priv_data *bsp_priv, u32 val)
+{
+	struct regmap *regmap;
+
+	if (bsp_priv->ops->gmac_grf_reg_in_php)
+		regmap = bsp_priv->php_grf;
+	else
+		regmap = bsp_priv->grf;
+
+	return regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
+}
+
 static int rk_set_reg_speed(struct rk_priv_data *bsp_priv,
 			    const struct rk_reg_speed_data *rsd,
 			    unsigned int reg, phy_interface_t interface,
@@ -1225,9 +1238,6 @@ static const struct rk_gmac_ops rk3576_ops = {
 #define RK3588_GRF_GMAC_CON0			0X0008
 #define RK3588_GRF_CLK_CON1			0X0070
 
-#define RK3588_GMAC_PHY_INTF_SEL(id, val)	\
-	(GRF_FIELD(5, 3, val) << ((id) * 6))
-
 #define RK3588_GMAC_CLK_RMII_MODE(id)		GRF_BIT(5 * (id))
 #define RK3588_GMAC_CLK_RGMII_MODE(id)		GRF_CLR_BIT(5 * (id))
 
@@ -1243,6 +1253,22 @@ static const struct rk_gmac_ops rk3576_ops = {
 #define RK3588_GMAC_CLK_RMII_GATE(id)		GRF_BIT(5 * (id) + 1)
 #define RK3588_GMAC_CLK_RMII_NOGATE(id)		GRF_CLR_BIT(5 * (id) + 1)
 
+static int rk3588_init(struct rk_priv_data *bsp_priv)
+{
+	switch (bsp_priv->id) {
+	case 0:
+		bsp_priv->gmac_phy_intf_sel_mask = GENMASK_U16(5, 3);
+		return 0;
+
+	case 1:
+		bsp_priv->gmac_phy_intf_sel_mask = GENMASK_U16(11, 9);
+		return 0;
+
+	default:
+		return -EINVAL;
+	}
+}
+
 static void rk3588_set_to_rgmii(struct rk_priv_data *bsp_priv,
 				int tx_delay, int rx_delay)
 {
@@ -1251,9 +1277,6 @@ static void rk3588_set_to_rgmii(struct rk_priv_data *bsp_priv,
 	offset_con = bsp_priv->id == 1 ? RK3588_GRF_GMAC_CON9 :
 					 RK3588_GRF_GMAC_CON8;
 
-	regmap_write(bsp_priv->php_grf, RK3588_GRF_GMAC_CON0,
-		     RK3588_GMAC_PHY_INTF_SEL(id, PHY_INTF_SEL_RGMII));
-
 	regmap_write(bsp_priv->php_grf, RK3588_GRF_CLK_CON1,
 		     RK3588_GMAC_CLK_RGMII_MODE(id));
 
@@ -1268,9 +1291,6 @@ static void rk3588_set_to_rgmii(struct rk_priv_data *bsp_priv,
 
 static void rk3588_set_to_rmii(struct rk_priv_data *bsp_priv)
 {
-	regmap_write(bsp_priv->php_grf, RK3588_GRF_GMAC_CON0,
-		     RK3588_GMAC_PHY_INTF_SEL(bsp_priv->id, PHY_INTF_SEL_RMII));
-
 	regmap_write(bsp_priv->php_grf, RK3588_GRF_CLK_CON1,
 		     RK3588_GMAC_CLK_RMII_MODE(bsp_priv->id));
 }
@@ -1323,10 +1343,15 @@ static void rk3588_set_clock_selection(struct rk_priv_data *bsp_priv, bool input
 }
 
 static const struct rk_gmac_ops rk3588_ops = {
+	.init = rk3588_init,
 	.set_to_rgmii = rk3588_set_to_rgmii,
 	.set_to_rmii = rk3588_set_to_rmii,
 	.set_speed = rk3588_set_gmac_speed,
 	.set_clock_selection = rk3588_set_clock_selection,
+
+	.gmac_grf_reg_in_php = true,
+	.gmac_grf_reg = RK3588_GRF_GMAC_CON0,
+
 	.php_grf_required = true,
 	.regs_valid = true,
 	.regs = {
@@ -1712,7 +1737,7 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 		val |= rk_encode_wm16(intf == PHY_INTF_SEL_RMII,
 				      bsp_priv->gmac_rmii_mode_mask);
 
-		ret = regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
+		ret = rk_write_gmac_grf_reg(bsp_priv, val);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.47.3


