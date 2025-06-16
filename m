Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6409BC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 21:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5HK7OaVp0TjYPgWKg6AXOdVH8aRtHfxReV5dlUnGC6E=; b=F+wq2tUikSOPH94uAlVVtTQvbv
	e6S4UMDXPle2ShD10Yv75KRbqdGiwc33A+RnLb0z8Mw/C5w1TZO1SPMIBd8zrWtLK8evmHNn+h/FL
	PowWc/vrOTJreN8sb+1mPqIIURw1SZt9v/7xI9Oje8JB7oaZvuJMJIQSrBGeAH75eAoHRYOHRLV66
	8BFP5MFlcxUc976x6be89biC7YES5gI1ZqthxSUrxKfW8w0/29HbdE4HBF9QV0+bWhxwKt58Oz8/b
	HIMlqKsXx9fJHNgE4pDpEtCeSFzOVCC+Uyhgy1BeS7LApTQ5gxEfpX5PRG6+Bgu5CtQRosllBZG+m
	I6F5z3fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRH64-00000005XIT-0acE;
	Mon, 16 Jun 2025 21:10:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRH2k-00000005X1v-3WhG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 21:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5HK7OaVp0TjYPgWKg6AXOdVH8aRtHfxReV5dlUnGC6E=; b=Tk68rq9H+KaChngKJ0QD67osy4
	w9KFNxZ0Feeh9u2QD7iIna981ocDOaw9iFpFjEdWP4V4k4r7ip4RvL/yZVyQ2PjhHyQQDBsxCrGB/
	LQt+zg0qC3skTIdkitvQ+GMhU8kY0C3Zhp+walESCi5gdGLOkX5oZcdS/rZZUnqBnn4Dl1ksHPsBS
	54QxSg/yxnECwJBfUa7ddFYA9SXyKgCZOe4FcoTKcEzHDyN30HAF86FP0RI/CNZJ8vH5GEPwpcZZp
	sXOGkbEH3nhSlzPdtL5Zf9E/2q82tJvc7DnteekFeE/f+0ALDMUfqPHmBuuo1J5h54tOAua+F5jCF
	TU4TM/XA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43774 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uRH2f-0004Ge-1b;
	Mon, 16 Jun 2025 22:06:57 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uRH21-004UyG-50; Mon, 16 Jun 2025 22:06:17 +0100
In-Reply-To: <aFCHJWXSLbUoogi6@shell.armlinux.org.uk>
References: <aFCHJWXSLbUoogi6@shell.armlinux.org.uk>
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
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 1/4] net: stmmac: visconti: re-arrange speed decode
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uRH21-004UyG-50@rmk-PC.armlinux.org.uk>
Date: Mon, 16 Jun 2025 22:06:17 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_140702_879616_46A039D8 
X-CRM114-Status: GOOD (  12.84  )
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

Re-arrange the speed decode in visconti_eth_set_clk_tx_rate() to be
more readable by first checking to see if we're using RGMII or RMII
and then decoding the speed, rather than decoding the speed and then
testing the interface mode.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-visconti.c  | 44 +++++++++++--------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
index 5e6ac82a89b9..ef86f9dce791 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
@@ -57,30 +57,38 @@ static int visconti_eth_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 					phy_interface_t interface, int speed)
 {
 	struct visconti_eth *dwmac = bsp_priv;
-	struct net_device *netdev = dev_get_drvdata(dwmac->dev);
 	unsigned int val, clk_sel_val = 0;
 
-	switch (speed) {
-	case SPEED_1000:
-		if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RGMII)
+	if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RGMII) {
+		switch (speed) {
+		case SPEED_1000:
 			clk_sel_val = ETHER_CLK_SEL_FREQ_SEL_125M;
-		break;
-	case SPEED_100:
-		if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RGMII)
+			break;
+
+		case SPEED_100:
 			clk_sel_val = ETHER_CLK_SEL_FREQ_SEL_25M;
-		if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RMII)
-			clk_sel_val = ETHER_CLK_SEL_DIV_SEL_2;
-		break;
-	case SPEED_10:
-		if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RGMII)
+			break;
+
+		case SPEED_10:
 			clk_sel_val = ETHER_CLK_SEL_FREQ_SEL_2P5M;
-		if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RMII)
+			break;
+
+		default:
+			return -EINVAL;
+		}
+	} else if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RMII) {
+		switch (speed) {
+		case SPEED_100:
+			clk_sel_val = ETHER_CLK_SEL_DIV_SEL_2;
+			break;
+
+		case SPEED_10:
 			clk_sel_val = ETHER_CLK_SEL_DIV_SEL_20;
-		break;
-	default:
-		/* No bit control */
-		netdev_err(netdev, "Unsupported speed request (%d)", speed);
-		return -EINVAL;
+			break;
+
+		default:
+			return -EINVAL;
+		}
 	}
 
 	/* Stop internal clock */
-- 
2.30.2


