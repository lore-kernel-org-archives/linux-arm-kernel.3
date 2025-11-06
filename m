Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CACACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 08:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MUkjUGs5htCVWXpvlmUC7jdUvESYY4WRqn6CV5pz6o=; b=lWpQUZwRvfqHyvHHv03tod0VKN
	THhxzv4Nz7qkCNpNe/Z5CJwKHo7qMqgn4Trt8xv95bf26p2s15MUvoXoXba5yjl8dU3qfOqhatfHM
	dQunBCXRt87XwOIFIcDNXJYG58MKRcYg1PT+YBgh4TUl755vrc+MnKAjodUIaHtninHw7oaqQB4q/
	8UoIUaM4uvOYM+Ko0s/cclTkr+b2vSK7Hiko0or1FA/kICvvDG9MQJW00QfuUiEO8V1jG6KEVCQY4
	8B7Ozwl+MIWZYDJ3MQ8OsnGaTc/phDKtOYnMRtc1bLjm78UrjzW3OlpoWV8Q/SBbitEYpZRjl1+PH
	ueNCogxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvoh-0000000F6Lb-1YEd;
	Thu, 06 Nov 2025 08:58:03 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvoe-0000000F6IT-0FuX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 08:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6MUkjUGs5htCVWXpvlmUC7jdUvESYY4WRqn6CV5pz6o=; b=Dt05tnpxwaLbiScxwLYsBakCjJ
	KNsUq2+37NaAqRkAEosj+kibwPF1LpdS6Oe6o8e/cR5apjLwQBYI4zC+LLBbzJSc6/pDeQueAOXul
	yhX+7wxLbECOQSocqOyrJ/a08CMplHgxyXzObNI21PrW3uWg7v0G/w7Qhsgc/TCpt2YmmWy3IIUF0
	lIBd0jccojJYx9hngTP/3WbQ0AYgMpEUKJIs3v+MvInO/WUVciGz0O1CX0hv7lL1pK/qe/W3bg6Iy
	w6FeLfFAw5vqsep1sWMcLzp1ESr7IKIlzh+F8dXSXRJ86NELYwMtfHlo96orB/B9MnLqbbVjrLWQY
	aTCJYivg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56276 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vGvoW-000000004Yq-2azd;
	Thu, 06 Nov 2025 08:57:52 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vGvoU-0000000DWot-29Rw;
	Thu, 06 Nov 2025 08:57:50 +0000
In-Reply-To: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
References: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 07/11] net: stmmac: ingenic: move "MAC PHY control
 register" debug
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vGvoU-0000000DWot-29Rw@rmk-PC.armlinux.org.uk>
Date: Thu, 06 Nov 2025 08:57:50 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_005801_009662_C0AC913F 
X-CRM114-Status: UNSURE (   9.91  )
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

Move the printing of the MAC PHY control register interface mode
setting into ingenic_set_phy_intf_sel(), and use phy_modes() to
print the string rather than using the enum name.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c    | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index 79735a476e86..539513890db1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -77,22 +77,12 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
-		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_MII\n");
-		break;
-
 	case PHY_INTERFACE_MODE_GMII:
-		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_GMII\n");
-		break;
-
 	case PHY_INTERFACE_MODE_RMII:
-		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
-		break;
-
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
-		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RGMII\n");
 		break;
 
 	default:
@@ -115,7 +105,6 @@ static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
-		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
 	default:
@@ -136,7 +125,6 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
-		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
 	default:
@@ -160,7 +148,6 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
 		val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII);
-		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
 	default:
@@ -185,7 +172,6 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
 	case PHY_INTERFACE_MODE_RMII:
 		val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
 			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
-		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
 		break;
 
 	case PHY_INTERFACE_MODE_RGMII:
@@ -205,7 +191,6 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
 			val |= FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_DELAY) |
 				   FIELD_PREP(MACPHYC_RX_DELAY_MASK, (mac->rx_delay + 9750) / 19500 - 1);
 
-		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RGMII\n");
 		break;
 
 	default:
@@ -237,6 +222,9 @@ static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
 			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
 		}
 
+		dev_dbg(mac->dev, "MAC PHY control register: interface %s\n",
+			phy_modes(interface));
+
 		ret = mac->soc_info->set_mode(mac->plat_dat, phy_intf_sel);
 		if (ret)
 			return ret;
-- 
2.47.3


