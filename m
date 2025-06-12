Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15617C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64CpcFM6H4Vg52rc57aO+fncDZ9t6GSrZTLajMibm0A=; b=hjPNIZweMbQRjvr4IQVf/ovFAP
	utAnv2FS7U4fUxjrdHv/WaPnNNafWoBKYsNmu2Zg0YO2kqEjnM0LOVjVFMEKf9/WlnSxbgWJM/Whc
	D7b63abqErOsQWSGtYdN1uHpHOXU8jppzOWnFXChBWORHidcFKZJNzj8nmw0UTqCCcg6M60WkKX3v
	bhpWiVKiglHQTY0JqmugA7VBUpscIplBZDa2dZxgx95xlQ4Bkx8DdTNHmguexDcc1UlV5PVS1ZnuU
	TiSyHe3tm4cKVv01N8oGzereuOATK1Ivmk74FS3IWzFGvMiHRzp6rogtRk8ibd49dC1+F5UXr8Ihq
	PgVQFP1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnrN-0000000EKIb-1lSe;
	Thu, 12 Jun 2025 19:45:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPk3i-0000000DpBi-0j6t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=64CpcFM6H4Vg52rc57aO+fncDZ9t6GSrZTLajMibm0A=; b=GdOcwzr1kJJxKsUOvBySQ2rKLK
	3jOiO26DYmylhL3sbABgwpnvvuxsqzd+zT/lhEr1ftyIaSx0HUA16mMV1ek2b1olV3RomKEF/6LfU
	xZv3fIAdSPLjVLJY73nnx4L+RAydUbE9X7UITyN6FCVf4OpWEsnrU1NRPaY3et3dAAQh03fmQKJHe
	wfRlt6hqi3/aGDhKXI9ThEDO6Yext49HvEJDh43CvFNO13+GlTlgbqR4qD4GemX4Y5SH933nnrDwT
	plg61K4WUgFU9rrvqxbRg2Q2jB+hpe+P6Nm6ONvBSxlKDqEhkTxfHo/zxYAD13D9xL6vikBYNbvly
	8KXBzgtw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38864 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uPk3d-000846-18;
	Thu, 12 Jun 2025 16:41:37 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uPk2z-004CFT-0e; Thu, 12 Jun 2025 16:40:57 +0100
In-Reply-To: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
References: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 4/9] net: stmmac: rk: combine rv1126 set_*_speed()
 methods
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uPk2z-004CFT-0e@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Jun 2025 16:40:57 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_084142_209902_CE5FC96C 
X-CRM114-Status: GOOD (  12.22  )
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

Just like rk3568, there is no need to have separate RGMII and RMII
methods to set clk_mac_speed() as rgmii_clock() can be used to return
the clock rate for both RGMII and RMII interface modes. Combine these
two methods.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 33 +++----------------
 1 file changed, 4 insertions(+), 29 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 7b5e989bb77f..c7b64f0a2931 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1496,7 +1496,7 @@ static void rv1126_set_to_rmii(struct rk_priv_data *bsp_priv)
 		     RV1126_GMAC_PHY_INTF_SEL_RMII);
 }
 
-static void rv1126_set_rgmii_speed(struct rk_priv_data *bsp_priv, int speed)
+static void rv1126_set_clk_mac_speed(struct rk_priv_data *bsp_priv, int speed)
 {
 	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
 	struct device *dev = &bsp_priv->pdev->dev;
@@ -1505,32 +1505,7 @@ static void rv1126_set_rgmii_speed(struct rk_priv_data *bsp_priv, int speed)
 
 	rate = rgmii_clock(speed);
 	if (rate < 0) {
-		dev_err(dev, "unknown speed value for RGMII speed=%d", speed);
-		return;
-	}
-
-	ret = clk_set_rate(clk_mac_speed, rate);
-	if (ret)
-		dev_err(dev, "%s: set clk_mac_speed rate %ld failed %d\n",
-			__func__, rate, ret);
-}
-
-static void rv1126_set_rmii_speed(struct rk_priv_data *bsp_priv, int speed)
-{
-	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
-	struct device *dev = &bsp_priv->pdev->dev;
-	unsigned long rate;
-	int ret;
-
-	switch (speed) {
-	case 10:
-		rate = 2500000;
-		break;
-	case 100:
-		rate = 25000000;
-		break;
-	default:
-		dev_err(dev, "unknown speed value for RGMII speed=%d", speed);
+		dev_err(dev, "unknown speed value for GMAC speed=%d", speed);
 		return;
 	}
 
@@ -1543,8 +1518,8 @@ static void rv1126_set_rmii_speed(struct rk_priv_data *bsp_priv, int speed)
 static const struct rk_gmac_ops rv1126_ops = {
 	.set_to_rgmii = rv1126_set_to_rgmii,
 	.set_to_rmii = rv1126_set_to_rmii,
-	.set_rgmii_speed = rv1126_set_rgmii_speed,
-	.set_rmii_speed = rv1126_set_rmii_speed,
+	.set_rgmii_speed = rv1126_set_clk_mac_speed,
+	.set_rmii_speed = rv1126_set_clk_mac_speed,
 };
 
 static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
-- 
2.30.2


