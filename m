Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F138C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8OnpIVRMDsCvWvEU627B7xFOFqUm/Prfg2szCnr5fc=; b=mjX5YdWLWqMpuA74Al12qLloMt
	/h3aJDqh3z6cW2CoKsWTbDTaNOA79zVvIRRAZrq+Tzdr//cE7yvAQjdsWI+Q+JbZjzyfG1X79ATCm
	jsmMv6qojdzqJgkDuRuFWwtpBMCppkHwq67etFM4pPKnGgkycnbh049vDlnsOZb1tECbqdBifV6rY
	MU3qUY35PreESG+eqa+9IKC2IxCjBNRcQwkDfA04LYUDSWKr0EE75YrvoAh5eIr8d0W0+ETj1LbMW
	gBKzr/VrUtMRv5n8csaVW4XnS8ltvC9ibkhS+t2C7gelUlI/r5tG79caApTa0ayHu7JGrwD4V+2LD
	kP6dYLHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnrQ-0000000EKOc-2pJe;
	Thu, 12 Jun 2025 19:45:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPk3w-0000000DpG0-2Jbu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=U8OnpIVRMDsCvWvEU627B7xFOFqUm/Prfg2szCnr5fc=; b=GrvY1SOCPxPv97W26JYreUrBFT
	GnkuxBm7nYyHeUfamWkF81FFBqf6p2jGGsjkbk7zbJgaFcplaCsNn7z9Z8IdCG9gQ6AUABI65UUER
	oMCowzW5X0+H4rcfduxN+0ijLU+8bkB9AY0KdRNWowMsOeAbV97zhHBQeGN5PM5lUlMZIqYdOhhwE
	YnUQz48g2qTMgeX6V5hRFIM+WpXMPFWVYpTJmxSKDWqt0cPbb2I7wOyKgn52wolYjbXwYJJgFQRbC
	hDq9M9wOm6Ke9xtrmDNafvMwQ2SJZ5MjK4UZHLNnowMEEIzRAZ8GWM3HsxYSo1Ga5sjMwSek9h54E
	CzC5CaVA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42644 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uPk3s-00084s-1R;
	Thu, 12 Jun 2025 16:41:52 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uPk3E-004CFl-BZ; Thu, 12 Jun 2025 16:41:12 +0100
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
Subject: [PATCH net-next 7/9] net: stmmac: rk: simplify px30_set_rmii_speed()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uPk3E-004CFl-BZ@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Jun 2025 16:41:12 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_084156_587326_7C92D06D 
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

px30_set_rmii_speed() doesn't need to be as verbose as it is - it
merely needs the values for the register and clock rate which depend
on the speed, and then call the appropriate functions. Rewrite the
function to make it so.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 8ad6b3b0e282..72f2b80bf3bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -250,6 +250,8 @@ static void px30_set_rmii_speed(struct rk_priv_data *bsp_priv, int speed)
 {
 	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
 	struct device *dev = &bsp_priv->pdev->dev;
+	unsigned int con1;
+	long rate;
 	int ret;
 
 	if (!clk_mac_speed) {
@@ -258,25 +260,22 @@ static void px30_set_rmii_speed(struct rk_priv_data *bsp_priv, int speed)
 	}
 
 	if (speed == 10) {
-		regmap_write(bsp_priv->grf, PX30_GRF_GMAC_CON1,
-			     PX30_GMAC_SPEED_10M);
-
-		ret = clk_set_rate(clk_mac_speed, 2500000);
-		if (ret)
-			dev_err(dev, "%s: set clk_mac_speed rate 2500000 failed: %d\n",
-				__func__, ret);
+		con1 = PX30_GMAC_SPEED_10M;
+		rate = 2500000;
 	} else if (speed == 100) {
-		regmap_write(bsp_priv->grf, PX30_GRF_GMAC_CON1,
-			     PX30_GMAC_SPEED_100M);
-
-		ret = clk_set_rate(clk_mac_speed, 25000000);
-		if (ret)
-			dev_err(dev, "%s: set clk_mac_speed rate 25000000 failed: %d\n",
-				__func__, ret);
-
+		con1 = PX30_GMAC_SPEED_100M;
+		rate = 25000000;
 	} else {
 		dev_err(dev, "unknown speed value for RMII! speed=%d", speed);
+		return;
 	}
+
+	regmap_write(bsp_priv->grf, PX30_GRF_GMAC_CON1, con1);
+
+	ret = clk_set_rate(clk_mac_speed, rate);
+	if (ret)
+		dev_err(dev, "%s: set clk_mac_speed rate %ld failed: %d\n",
+			__func__, rate, ret);
 }
 
 static const struct rk_gmac_ops px30_ops = {
-- 
2.30.2


