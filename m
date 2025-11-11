Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5B1CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 08:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0Abh9lLLwfL7lAUCr8RNuqbq4RKwi0tJuH6+FQmA70=; b=Jy5XtP2uzf1kUuvO1ADlZ2ZFet
	15znFpjr0w4CHlcB+uX+5E9rfobwrmbtcYqEJ3lflQAZu76g1rhTbkc3XQ0tOMw1OTZoVZVKnlKBS
	HPJApVBmaOsPAW+iz3ziQ1w9XD/0KHl61ozmN7hMmbgY/9VN2me8rtUp323NeRh771pvmrmkotJlJ
	c87u/TRzEvMsCtCNm8xonVXWgkY3Mxzh/tLOlVEKOeH/jT2Wik9oWhqQMeJqzE5wCESCgTePWIexL
	K6DW5jUq7emPvLY41Zkyuj72f35WaXvil2M0nR9GpRBCwvxbS6M0Ccu7JLQbeok/zwhmWKr1ZywM1
	tFIpgUhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjU9-00000006kld-3zV0;
	Tue, 11 Nov 2025 08:12:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjU6-00000006kjA-1hUJ;
	Tue, 11 Nov 2025 08:12:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l0Abh9lLLwfL7lAUCr8RNuqbq4RKwi0tJuH6+FQmA70=; b=kuAcRjKn+nJhvGxn5fVDaofP1I
	4WlCgghYIMdCaLTJMGrbrMhmvCs4XF6hkSWEPSzQcREddgAaYdIfAzqD1b8nsxmHwoRiaHX4ZYpln
	7ywRdm5aWvxbBRh18pDLZ9ZEnbfn/8CEHuuSqAV2H0UuLOux0nTqp/VINLm14N/Z+k731tHu8UmVO
	9KHXZsQhgNbS7HW9wv3VYyV4kf1n2F/ktiOnvaVcZossP8X/R0Y3GdbazmP7tLNZVKwiZyYJ0bXME
	d9T/FiyiNgq9NSjMuf1VXdV7fmFf1IYvTysUHyAaWFOxYqyNIYZx9KHuVbpA4PKobaPuHvqPzxXWK
	m3xCAiNQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51548 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vIjTw-000000002AH-16xO;
	Tue, 11 Nov 2025 08:12:04 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vIjTu-0000000DqtI-2sUB;
	Tue, 11 Nov 2025 08:12:02 +0000
In-Reply-To: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 04/13] net: stmmac: mediatek: use PHY_INTF_SEL_x
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vIjTu-0000000DqtI-2sUB@rmk-PC.armlinux.org.uk>
Date: Tue, 11 Nov 2025 08:12:02 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_001214_444554_D653C3CA 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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

Use PHY_INTF_SEL_x definitions for the fields that correspond to the
phy_intf_sel inputs to the dwmac core.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c   | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index f1b36f0a401d..dcdf28418fec 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -17,9 +17,6 @@
 
 /* Peri Configuration register for mt2712 */
 #define PERI_ETH_PHY_INTF_SEL	0x418
-#define PHY_INTF_MII		0
-#define PHY_INTF_RGMII		1
-#define PHY_INTF_RMII		4
 #define RMII_CLK_SRC_RXC	BIT(4)
 #define RMII_CLK_SRC_INTERNAL	BIT(5)
 
@@ -118,16 +115,16 @@ static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat)
 	/* select phy interface in top control domain */
 	switch (plat->phy_mode) {
 	case PHY_INTERFACE_MODE_MII:
-		intf_val |= PHY_INTF_MII;
+		intf_val |= PHY_INTF_SEL_GMII_MII;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		intf_val |= (PHY_INTF_RMII | rmii_rxc | rmii_clk_from_mac);
+		intf_val |= PHY_INTF_SEL_RMII | rmii_rxc | rmii_clk_from_mac;
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
-		intf_val |= PHY_INTF_RGMII;
+		intf_val |= PHY_INTF_SEL_RGMII;
 		break;
 	default:
 		dev_err(plat->dev, "phy interface not supported\n");
@@ -297,17 +294,18 @@ static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat)
 	/* select phy interface in top control domain */
 	switch (plat->phy_mode) {
 	case PHY_INTERFACE_MODE_MII:
-		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_MII);
+		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL,
+				       PHY_INTF_SEL_GMII_MII);
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		intf_val |= (rmii_rxc | rmii_clk_from_mac);
-		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_RMII);
+		intf_val |= rmii_rxc | rmii_clk_from_mac;
+		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RMII);
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
-		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_RGMII);
+		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RGMII);
 		break;
 	default:
 		dev_err(plat->dev, "phy interface not supported\n");
-- 
2.47.3


