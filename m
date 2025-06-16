Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313B5C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 21:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxsrAg54BDPUoWOTh34lObpoeyszGT90sFygSRlocmo=; b=GAhLTnTkAmiKzMcCHSsEBpWjfO
	uYMe4xSbDJ7XvyHpE1jXjk9/XOT3DeP4w4/7J3akt5RKtJyj5Vg9f2TlbiVyx2HU3JELif2hRBIfB
	L9Ht186F7hax6u8zZ9NdkkeVT8Iw7MzKaoFWU0fCodyCejkEMo76OabTbJOhfzEq6/5j/ABQyHUNQ
	rrrMmLg05VSKpUhRHqF3crNpdUmAJKg80QQ09a+oXChip1Bh8Yhc2ofFC6h55VS8xQJEytmmouxX9
	4fZ/Scn97iuqmxgwS/hLaXXN0COTP+fWx/h0Qhn8cTjpH8K/8LPpYJ6Mhop8eM9sdsdkSrLITiO5g
	VXwq6SOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRH8G-00000005XZW-3WAH;
	Mon, 16 Jun 2025 21:12:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRH2q-00000005X2I-0dPM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 21:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dxsrAg54BDPUoWOTh34lObpoeyszGT90sFygSRlocmo=; b=ov0fxDhmCwmNxTg/MGXYEZIWvb
	pkozhIu9suju9ow8/A07/I5CcG9ahAe13kDxtI8rhiRgjtpDubrO+wrdJh34IptHZPnBWKxpaEGJ7
	7eGxJxlt5dEhBgucBiLmRJTPa15XA+nsaJtkMX9LtrOFEUDMtx1+m2pVocYhmFO1uCbuCTd2dPyAH
	+Wtz2RNUFOiA6OAzLOTiVAhsZ6FItJwkO1qQsN2S6KKf15xQja1WeqEKeWsBKupXgsDrakKmm54yQ
	L3gKnL9hlUa0ffVEP+W1ZhMiVimWWTpPE4ba6JayL/0W6sR5u/21J8D8CUKGnhZf9Dy/gAKaALWJa
	RRcApiDA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41064 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uRH2l-0004Gr-0B;
	Mon, 16 Jun 2025 22:07:03 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uRH26-004UyM-9G; Mon, 16 Jun 2025 22:06:22 +0100
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
Subject: [PATCH net-next 2/4] net: stmmac: visconti: reorganise
 visconti_eth_set_clk_tx_rate()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uRH26-004UyM-9G@rmk-PC.armlinux.org.uk>
Date: Mon, 16 Jun 2025 22:06:22 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_140708_193801_5AD154B7 
X-CRM114-Status: GOOD (  12.34  )
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

Rather than testing dwmac->phy_intf_sel several times for the same
values in this function, group the code together. The only part
which was common was stopping the internal clock before programming
the clock setting.

This further improves the readability of this function.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-visconti.c  | 51 +++++++++++--------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
index ef86f9dce791..c2aaac4a5ac1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
@@ -76,6 +76,22 @@ static int visconti_eth_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 		default:
 			return -EINVAL;
 		}
+
+		/* Stop internal clock */
+		val = readl(dwmac->reg + REG_ETHER_CLOCK_SEL);
+		val &= ~(ETHER_CLK_SEL_RMII_CLK_EN | ETHER_CLK_SEL_RX_TX_CLK_EN);
+		val |= ETHER_CLK_SEL_TX_O_E_N_IN;
+		writel(val, dwmac->reg + REG_ETHER_CLOCK_SEL);
+
+		/* Set Clock-Mux, Start clock, Set TX_O direction */
+		val = clk_sel_val | ETHER_CLK_SEL_RX_CLK_EXT_SEL_RXC;
+		writel(val, dwmac->reg + REG_ETHER_CLOCK_SEL);
+
+		val |= ETHER_CLK_SEL_RX_TX_CLK_EN;
+		writel(val, dwmac->reg + REG_ETHER_CLOCK_SEL);
+
+		val &= ~ETHER_CLK_SEL_TX_O_E_N_IN;
+		writel(val, dwmac->reg + REG_ETHER_CLOCK_SEL);
 	} else if (dwmac->phy_intf_sel == ETHER_CONFIG_INTF_RMII) {
 		switch (speed) {
 		case SPEED_100:
@@ -89,27 +105,14 @@ static int visconti_eth_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 		default:
 			return -EINVAL;
 		}
-	}
-
-	/* Stop internal clock */
-	val = readl(dwmac->reg + REG_ETHER_CLOCK_SEL);
-	val &= ~(ETHER_CLK_SEL_RMII_CLK_EN | ETHER_CLK_SEL_RX_TX_CLK_EN);
-	val |= ETHER_CLK_SEL_TX_O_E_N_IN;
-	writel(val, dwmac->reg + REG_ETHER_CLOCK_SEL);
 
-	/* Set Clock-Mux, Start clock, Set TX_O direction */
-	switch (dwmac->phy_intf_sel) {
-	case ETHER_CONFIG_INTF_RGMII:
-		val = clk_sel_val | ETHER_CLK_SEL_RX_CLK_EXT_SEL_RXC;
-		writel(val, dwmac->reg + REG_ETHER_CLOCK_SEL);
-
-		val |= ETHER_CLK_SEL_RX_TX_CLK_EN;
+		/* Stop internal clock */
+		val = readl(dwmac->reg + REG_ETHER_CLOCK_SEL);
+		val &= ~(ETHER_CLK_SEL_RMII_CLK_EN | ETHER_CLK_SEL_RX_TX_CLK_EN);
+		val |= ETHER_CLK_SEL_TX_O_E_N_IN;
 		writel(val, dwmac->reg + REG_ETHER_CLOCK_SEL);
 
-		val &= ~ETHER_CLK_SEL_TX_O_E_N_IN;
-		writel(val, dwmac->reg + REG_ETHER_CLOCK_SEL);
-		break;
-	case ETHER_CONFIG_INTF_RMII:
+		/* Set Clock-Mux, Start clock, Set TX_O direction */
 		val = clk_sel_val | ETHER_CLK_SEL_RX_CLK_EXT_SEL_DIV |
 			ETHER_CLK_SEL_TX_CLK_EXT_SEL_DIV | ETHER_CLK_SEL_TX_O_E_N_IN |
 			ETHER_CLK_SEL_RMII_CLK_SEL_RX_C;
@@ -120,16 +123,20 @@ static int visconti_eth_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 
 		val |= ETHER_CLK_SEL_RMII_CLK_EN | ETHER_CLK_SEL_RX_TX_CLK_EN;
 		writel(val, dwmac->reg + REG_ETHER_CLOCK_SEL);
-		break;
-	case ETHER_CONFIG_INTF_MII:
-	default:
+	} else {
+		/* Stop internal clock */
+		val = readl(dwmac->reg + REG_ETHER_CLOCK_SEL);
+		val &= ~(ETHER_CLK_SEL_RMII_CLK_EN | ETHER_CLK_SEL_RX_TX_CLK_EN);
+		val |= ETHER_CLK_SEL_TX_O_E_N_IN;
+		writel(val, dwmac->reg + REG_ETHER_CLOCK_SEL);
+
+		/* Set Clock-Mux, Start clock, Set TX_O direction */
 		val = clk_sel_val | ETHER_CLK_SEL_RX_CLK_EXT_SEL_RXC |
 			ETHER_CLK_SEL_TX_CLK_EXT_SEL_TXC | ETHER_CLK_SEL_TX_O_E_N_IN;
 		writel(val, dwmac->reg + REG_ETHER_CLOCK_SEL);
 
 		val |= ETHER_CLK_SEL_RX_TX_CLK_EN;
 		writel(val, dwmac->reg + REG_ETHER_CLOCK_SEL);
-		break;
 	}
 
 	return 0;
-- 
2.30.2


