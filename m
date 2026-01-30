Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF749D49C92
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 11:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zywiIYip9INWXQADAtjh5YpZ//IGbM2WaNbXBkX94mM=; b=xbOFlqw8fiiJcYIACASd/OLxfC
	3eztqgNWYEgyByZuJQlp9mK4fyy4yHLs7FfVx9TvHBwyA7W4r3UGcZCwjL3FlpVcA2t7ito1ez0iT
	1RIP/AWfzh6KABAQN04V1U24nNnbgqWdj8h2jpBjuh+ZYH2cbwDELW7kTxwZcVhJ8NuqqXuFh87Ck
	n5O0ej6rbY4UUhqktIdbRYgNG87ZdxWULrx8nFVxSysRbKYXgawxrC3Y0evIqzVHeV/cYq9yjADd5
	4kgmretiRojyqHFUq29w7amM6sjhS8tePwGqz1yPTNsgAJEsk6GOlJJaoK0JFeIE/l0sTli5hUdv5
	TzfGWf6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmF4-00000001Lp7-1MYj;
	Fri, 30 Jan 2026 11:00:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmF0-00000001LkG-0B7R;
	Fri, 30 Jan 2026 11:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zywiIYip9INWXQADAtjh5YpZ//IGbM2WaNbXBkX94mM=; b=jzx4rtGLD03/+fPrs2fz+VtlZt
	rQ5cbmDZb9+doznFUCC8QKJ0qqHj5XJa2z2K6wH+VWh63ZJFVGXw494PT7J51xzHh1593qRY3lZZ7
	LF3ssRKM3XWR/J/GiNDjda8Qy+vR4ZHuf6CPu9S+ZPSzKni4v8O1IBRae838wdu5c9gfvt7ACocK/
	SEeSU5JTnp8523j78m1+eIp8sLiEdAYaoaqDN+ZEBhsjwdOSLQCUJrBFVYd17kln8tMZZO9fvzsTo
	vp8hl/lK5Z90ww4Gt6bljsxhk7BkdZV696oRrUSxHAIfezGdzZlASipS28HCq8jrYGGKL3noJOJmr
	yHfB/urA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50638 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vlmEq-000000000xo-0jio;
	Fri, 30 Jan 2026 11:00:32 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vlmEn-00000006zo6-1sgO;
	Fri, 30 Jan 2026 11:00:29 +0000
In-Reply-To: <aXyPK9rlMt8h_fze@shell.armlinux.org.uk>
References: <aXyPK9rlMt8h_fze@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 04/10] net: stmmac: rk: convert rk3588 to
 rk_set_reg_speed()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vlmEn-00000006zo6-1sgO@rmk-PC.armlinux.org.uk>
Date: Fri, 30 Jan 2026 11:00:29 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_030042_123504_14D50063 
X-CRM114-Status: GOOD (  12.85  )
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

Update rk_set_reg_speed() to use either the grf or php_grf regmap
depending on the SoC's requirements and convert rk3588, removing
its custom code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 63 ++++++++++---------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 4b103a2e9c1f..5bb805330cbc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -53,6 +53,7 @@ struct rk_gmac_ops {
 	u16 clock_grf_reg;
 
 	bool gmac_grf_reg_in_php;
+	bool clock_grf_reg_in_php;
 	bool php_grf_required;
 	bool regs_valid;
 	u32 regs[];
@@ -145,7 +146,14 @@ static int rk_write_gmac_grf_reg(struct rk_priv_data *bsp_priv, u32 val)
 
 static int rk_write_clock_grf_reg(struct rk_priv_data *bsp_priv, u32 val)
 {
-	return regmap_write(bsp_priv->grf, bsp_priv->clock_grf_reg, val);
+	struct regmap *regmap;
+
+	if (bsp_priv->ops->clock_grf_reg_in_php)
+		regmap = bsp_priv->php_grf;
+	else
+		regmap = bsp_priv->grf;
+
+	return regmap_write(regmap, bsp_priv->clock_grf_reg, val);
 }
 
 static int rk_set_reg_speed(struct rk_priv_data *bsp_priv,
@@ -1338,39 +1346,33 @@ static void rk3588_set_to_rmii(struct rk_priv_data *bsp_priv)
 		     RK3588_GMAC_CLK_RMII_MODE(bsp_priv->id));
 }
 
+static const struct rk_reg_speed_data rk3588_gmac0_speed_data = {
+	.rgmii_10 = RK3588_GMAC_CLK_RGMII(0, GMAC_CLK_DIV50_2_5M),
+	.rgmii_100 = RK3588_GMAC_CLK_RGMII(0, GMAC_CLK_DIV5_25M),
+	.rgmii_1000 = RK3588_GMAC_CLK_RGMII(0, GMAC_CLK_DIV1_125M),
+	.rmii_10 = RK3588_GMA_CLK_RMII_DIV20(0),
+	.rmii_100 = RK3588_GMA_CLK_RMII_DIV2(0),
+};
+
+static const struct rk_reg_speed_data rk3588_gmac1_speed_data = {
+	.rgmii_10 = RK3588_GMAC_CLK_RGMII(1, GMAC_CLK_DIV50_2_5M),
+	.rgmii_100 = RK3588_GMAC_CLK_RGMII(1, GMAC_CLK_DIV5_25M),
+	.rgmii_1000 = RK3588_GMAC_CLK_RGMII(1, GMAC_CLK_DIV1_125M),
+	.rmii_10 = RK3588_GMA_CLK_RMII_DIV20(1),
+	.rmii_100 = RK3588_GMA_CLK_RMII_DIV2(1),
+};
+
 static int rk3588_set_gmac_speed(struct rk_priv_data *bsp_priv,
 				 phy_interface_t interface, int speed)
 {
-	unsigned int val = 0, id = bsp_priv->id;
-
-	switch (speed) {
-	case 10:
-		if (interface == PHY_INTERFACE_MODE_RMII)
-			val = RK3588_GMA_CLK_RMII_DIV20(id);
-		else
-			val = RK3588_GMAC_CLK_RGMII(id, GMAC_CLK_DIV50_2_5M);
-		break;
-	case 100:
-		if (interface == PHY_INTERFACE_MODE_RMII)
-			val = RK3588_GMA_CLK_RMII_DIV2(id);
-		else
-			val = RK3588_GMAC_CLK_RGMII(id, GMAC_CLK_DIV5_25M);
-		break;
-	case 1000:
-		if (interface != PHY_INTERFACE_MODE_RMII)
-			val = RK3588_GMAC_CLK_RGMII(id, GMAC_CLK_DIV1_125M);
-		else
-			goto err;
-		break;
-	default:
-		goto err;
-	}
+	const struct rk_reg_speed_data *rsd;
 
-	regmap_write(bsp_priv->php_grf, RK3588_GRF_CLK_CON1, val);
+	if (bsp_priv->id == 0)
+		rsd = &rk3588_gmac0_speed_data;
+	else
+		rsd = &rk3588_gmac1_speed_data;
 
-	return 0;
-err:
-	return -EINVAL;
+	return rk_set_reg_speed(bsp_priv, rsd, interface, speed);
 }
 
 static void rk3588_set_clock_selection(struct rk_priv_data *bsp_priv, bool input,
@@ -1395,6 +1397,9 @@ static const struct rk_gmac_ops rk3588_ops = {
 	.gmac_grf_reg_in_php = true,
 	.gmac_grf_reg = RK3588_GRF_GMAC_CON0,
 
+	.clock_grf_reg_in_php = true,
+	.clock_grf_reg = RK3588_GRF_CLK_CON1,
+
 	.php_grf_required = true,
 	.regs_valid = true,
 	.regs = {
-- 
2.47.3


