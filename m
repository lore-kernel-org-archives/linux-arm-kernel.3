Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084F8C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwZMOCKfFBVS4iHJPXuDmlM3/1DaYJO0eDoSHbqPtEo=; b=GmU1ssoP96lrPrQ3xV0G2CJJRE
	tQh7DbzxJiXRPVRm1clPNYGPxWnox+o96UUMUQuxI+YBqOV1SvX2c8rGcNF12/CTRK1WgrvmhAhbj
	ylmMvs5p5whi7iJhFVJ+RzbqdrLBADAlDfPA+hNJ/H2+MTp2QfMatlGgEvFTSZRk/DOIkifiOZ1Ol
	VidtBUIO6dVP9CEKe/L1cK2YdGKJWLOQLfQcSQ+58cc1MF3dDD0Szynx+838pBt9cVVW2dvyF+w+X
	cC1d60VQHcbFaxPvIpOJ+M8HGRrgIaspTJ1jNLHJjLoMmTJt1vM+5do0TGd/JduzIgIJoBFQNyqCm
	FFFVxFJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnrK-0000000EKDE-1ONE;
	Thu, 12 Jun 2025 19:45:10 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPk3R-0000000Dp8T-1Huk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:41:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fwZMOCKfFBVS4iHJPXuDmlM3/1DaYJO0eDoSHbqPtEo=; b=bDhoMlmXYyIkOs26G3MwkhL1SC
	cFTGPHUv+linbYI4GJOTg26WIkzaHxHNzrNaf3lVXIv1J8xkwcQZQQp/dENLnqnYj1epPq/DjSoM1
	NbCTaEKrW6A8R/qare0T8ddvIqepAlSm3VecKPjUcIChlXkyNonzsWU5isyctiEu03990wzyOw1aL
	V+cVjVZ/z2aaLq1bkMzh0b4t6eTwMOMJQv913H3TQ3mC8LRk+3CCAOjGs3ndFd51+RRGmfQ0qdbbm
	qY1TH9dP2LB+ch8frqPfHBP6T/2hT/0umPYAeyHR1IVGAT3DHTw3tpEW+MuwfPpwx/xEmtCYwpZHm
	vm8UD7iA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60382 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uPk3N-00083N-2Q;
	Thu, 12 Jun 2025 16:41:21 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uPk2j-004CF6-Mf; Thu, 12 Jun 2025 16:40:41 +0100
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
Subject: [PATCH net-next 1/9] net: stmmac: rk: add get_interfaces()
 implementation
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uPk2j-004CF6-Mf@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Jun 2025 16:40:41 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_084125_342207_A4BE9937 
X-CRM114-Status: GOOD (  13.09  )
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

RK platforms support RGMII and/or RMII depending on the SoC. Detect
whether support for a SoC exists by whether the interface specific
set_to functions have been populated, and set the appropriate bits in
phylink's bitmap of interfaces.

This assumes all dwmac interfaces on a SoC have identical support,
but it should be noted that this is not true for RK3528 which only
supports RGMII on GMAC1. However, the existing code structure
permits RGMII to be configured on GMAC0 without complaint, so
preserve this behaviour even though it is incorrect to avoid
functional change.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 700858ff6f7c..8006424ab027 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1864,6 +1864,18 @@ static void rk_gmac_powerdown(struct rk_priv_data *gmac)
 	gmac_clk_enable(gmac, false);
 }
 
+static void rk_get_interfaces(struct stmmac_priv *priv, void *bsp_priv,
+			      unsigned long *interfaces)
+{
+	struct rk_priv_data *rk = bsp_priv;
+
+	if (rk->ops->set_to_rgmii)
+		phy_interface_set_rgmii(interfaces);
+
+	if (rk->ops->set_to_rmii)
+		__set_bit(PHY_INTERFACE_MODE_RMII, interfaces);
+}
+
 static int rk_set_clk_tx_rate(void *bsp_priv_, struct clk *clk_tx_i,
 			      phy_interface_t interface, int speed)
 {
@@ -1919,6 +1931,7 @@ static int rk_gmac_probe(struct platform_device *pdev)
 		plat_dat->tx_fifo_size = 2048;
 	}
 
+	plat_dat->get_interfaces = rk_get_interfaces;
 	plat_dat->set_clk_tx_rate = rk_set_clk_tx_rate;
 
 	plat_dat->bsp_priv = rk_gmac_setup(pdev, plat_dat, data);
-- 
2.30.2


