Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07835D72374
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 11:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SkAk/HQjq++pv0D7MjbKmK0nTCeSLlFCfgp7rotRsM=; b=z3ceZplVLWGZbTDlWRPbOzriU/
	oTj3J23obmK8nxlpvctL61N45KDcPO1unwl/fkbIUZjogtClUEqjkKrJsJkVbUJAX+dbYZmLf6T7v
	4AeXejyX9LKlPbLUoDg5xLwMymcTWcSo9JYZT0UM2NKMfkDNPF1jrh/SXyP1I+kx6iNAxHxJwjGPY
	/kpWk7agrl4LyHG01j5jfdRJbHjh8mYF7LdTXaTBBdiNi/d99hknC1CjU/Hih8CG+Jg3Y4AqO1X0i
	8QykeJC471TLzakt+42sUq+2Nnd7YBM98qvhLRRByvQoVhoL9VVZ7h0aahjXufx11BIMmW2UctLGd
	/ru84J3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEu4-00000008lXn-3gvx;
	Fri, 23 Jan 2026 11:00:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEu2-00000008lWH-2vyG;
	Fri, 23 Jan 2026 11:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/SkAk/HQjq++pv0D7MjbKmK0nTCeSLlFCfgp7rotRsM=; b=bcQG+bs9TDd0iXwWwXRjJrrFRN
	UfV9Mw1uNTB7w23NQtlpt2Im7gfYrpCWDqsTBge3SiFvQfhVhUEgZnwsLsPT6oBkRPstKS3vAnZxD
	E0GAFCS49eQg3UseH2abrz+cTMkUnpd8bI3lYWyWxQecxstHL42/iI3Dim9E7Ay0wjbT0uCIR2WIy
	n44Kgd10bPjsaigVEdl/5ul/bDXTNUdH83sG7Hon2IGwSe1EUHLPj6LSBX2oWjo7XUyQkIkBy3Es7
	oUrd+R35dMFvBUONDqAJfW0FwZ3FuWN0bGFa4/OPiMFhAG0NeERowuaQJKXAjTYvCkwaE6EwHCiKj
	nP51azZQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56120 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vjEtw-000000001mg-31oF;
	Fri, 23 Jan 2026 11:00:28 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vjEtv-00000005gfk-3npH;
	Fri, 23 Jan 2026 11:00:27 +0000
In-Reply-To: <aXNUlVZilT-CTgph@shell.armlinux.org.uk>
References: <aXNUlVZilT-CTgph@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 02/21] net: stmmac: rk: get rid of rk_phy_power_ctl()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vjEtv-00000005gfk-3npH@rmk-PC.armlinux.org.uk>
Date: Fri, 23 Jan 2026 11:00:27 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_030034_741741_1EA20E69 
X-CRM114-Status: GOOD (  13.40  )
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

It is not worth having a common rk_phy_power_ctl() when the only
difference is which regulator function is called. Also, passing
true/false is non-descriptive. Split this function, moving the code
appropriately into rk_phy_powerup() and rk_phy_powerdown().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 31 ++++++++++---------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index de420997e21f..0e66252eb5ae 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1498,23 +1498,26 @@ static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
 	return 0;
 }
 
-static int rk_phy_power_ctl(struct rk_priv_data *bsp_priv, bool enable)
+static int rk_phy_powerup(struct rk_priv_data *bsp_priv)
 {
 	struct regulator *ldo = bsp_priv->regulator;
-	struct device *dev = bsp_priv->dev;
 	int ret;
 
-	if (enable) {
-		ret = regulator_enable(ldo);
-		if (ret)
-			dev_err(dev, "fail to enable phy-supply\n");
-	} else {
-		ret = regulator_disable(ldo);
-		if (ret)
-			dev_err(dev, "fail to disable phy-supply\n");
-	}
+	ret = regulator_enable(ldo);
+	if (ret)
+		dev_err(bsp_priv->dev, "fail to enable phy-supply\n");
 
-	return 0;
+	return ret;
+}
+
+static void rk_phy_powerdown(struct rk_priv_data *bsp_priv)
+{
+	struct regulator *ldo = bsp_priv->regulator;
+	int ret;
+
+	ret = regulator_disable(ldo);
+	if (ret)
+		dev_err(bsp_priv->dev, "fail to disable phy-supply\n");
 }
 
 static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
@@ -1692,7 +1695,7 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 		dev_err(dev, "NO interface defined!\n");
 	}
 
-	ret = rk_phy_power_ctl(bsp_priv, true);
+	ret = rk_phy_powerup(bsp_priv);
 	if (ret) {
 		gmac_clk_enable(bsp_priv, false);
 		return ret;
@@ -1713,7 +1716,7 @@ static void rk_gmac_powerdown(struct rk_priv_data *gmac)
 
 	pm_runtime_put_sync(gmac->dev);
 
-	rk_phy_power_ctl(gmac, false);
+	rk_phy_powerdown(gmac);
 	gmac_clk_enable(gmac, false);
 }
 
-- 
2.47.3


