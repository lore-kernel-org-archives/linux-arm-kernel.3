Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A81C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 12:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dUde5XvOXmf2RTKh7B+1y5/eHwJoJtelhNB3+mdvsF0=; b=LZL5OccC14pkqdkq95zSPHnwYC
	4ZJsC6ekYGDxap9jiycAG26F3SxBCMKu2BLxXqsOtBzrC+az70WjYH3gPeXJtnL72ukAY9m7NUKKR
	V1fj+Hbikr7flzFTJjT9kBdYdSRFdqiLVo8faPH3KgOvMM1dTzhw7rPF5mv0rBYA8aUqlgGs7Mu6j
	WiUo+k/72Ef0KSiAHi8O1JinlgTBUz/6FppymfsryM3yHtkTZugbr2ktQomEOPCxFCRalzn3jrxyd
	EZgBqtSnGxf/byXRn1x0oOnvh4PFeZVqAwZc4/yR2Uov9J3IiP3zwPq3vaeHXcq/xibeft7+wR52+
	cx6TYUHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMNt-00000002pNm-43No;
	Fri, 08 Aug 2025 12:39:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukM4K-00000002mXR-1XjY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 12:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dUde5XvOXmf2RTKh7B+1y5/eHwJoJtelhNB3+mdvsF0=; b=PakCq/0PE4evWx1HnXkJq2A2Xv
	mFxfci1awEsJ83kmoNA7/M81AME3hOmD2jlxlyLUsW8gXmtVNP7jaGEI2RJgmChS7/vfa+KLSDNno
	xaHpN28FwfKvAmwPxTdZFrPGxYQAlx6WLPuFO+k2CW8D0KpbfEdk+TFoF5xex+P/b1CkGb1X4/ng4
	GGq9hlVAev7TKQQtEx80LJ/9RuQ/F7q63phLQYYpP/v04H2ti615cA0jLRU3Uqs0P4wP97uKSDXJa
	+gRwv1LVk5GAAtSoh+uQKdbyHDpIlcGwY4ZB59aQRPzpCmqR4VvK4AyToMxDgwVuXQeQCSgOqXxdh
	3w4PT5dw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41678 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1ukM2B-0007Zd-02;
	Fri, 08 Aug 2025 13:17:19 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1ukM1S-0086qo-PC; Fri, 08 Aug 2025 13:16:34 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	David Wu <david.wu@rock-chips.com>,
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
Subject: [PATCH net v2] net: stmmac: rk: put the PHY clock on remove
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1ukM1S-0086qo-PC@rmk-PC.armlinux.org.uk>
Date: Fri, 08 Aug 2025 13:16:34 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_051932_400690_758C2BE7 
X-CRM114-Status: GOOD (  11.84  )
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

The PHY clock (bsp_priv->clk_phy) is obtained using of_clk_get(), which
doesn't take part in the devm release. Therefore, when a device is
unbound, this clock needs to be explicitly put. Fix this.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Spotted this resource leak while making other changes to dwmac-rk.
Would be great if the dwmac-rk maintainers can test it.

v2: fix build error

 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 79b92130a03f..f6687c2f30f6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1765,11 +1765,15 @@ static int rk_gmac_probe(struct platform_device *pdev)
 
 static void rk_gmac_remove(struct platform_device *pdev)
 {
-	struct rk_priv_data *bsp_priv = get_stmmac_bsp_priv(&pdev->dev);
+	struct stmmac_priv *priv = netdev_priv(platform_get_drvdata(pdev));
+	struct rk_priv_data *bsp_priv = priv->plat->bsp_priv;
 
 	stmmac_dvr_remove(&pdev->dev);
 
 	rk_gmac_powerdown(bsp_priv);
+
+	if (priv->plat->phy_node && bsp_priv->integrated_phy)
+		clk_put(bsp_priv->clk_phy);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.30.2


