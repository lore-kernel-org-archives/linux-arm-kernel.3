Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C97CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 11:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBl80ntOVSw5ZoCrR85twsw0/NxyN3XF7nXCwTrs0C8=; b=uVcjdw1xLdx4NdJ96esmKTsWK5
	uWJ1IQrXJY9RdXGdUXx6DXRfmXIpUxTpHAJ571z5VvHId/kez8ivPifjVOc6FnDHQQjYMHOno8Zyu
	qmkF9nHOHJTjKUzIfx9iMiwZGHTFzPeiV6b+hLOt03OddcBWOcTRUzOWTnHniWAQeR/Yf1rmql2hP
	G0heY3LlCCd6ygdWs5lUgE2tLJ2yZ8FpLYFsH4P3nfKtE66pAbq11B4ldXgS7T4uR++td9MxyQOxz
	75dJBYdp53Hr0R2EcNYE0NSyoRV/x9nL0wdyZozjx5R5kNk2wnnHl1ITWaQbOX71JVsI2rDSXiOIv
	J4PzL+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGy5o-0000000FNdk-1uOq;
	Thu, 06 Nov 2025 11:23:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGy5m-0000000FNbh-0ES9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 11:23:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TBl80ntOVSw5ZoCrR85twsw0/NxyN3XF7nXCwTrs0C8=; b=moOzjbagfA5GbRgRUfYVAkVFTn
	kfs0aq3a6+hNmskzb/1EqkDEukHwSpFaw7a7y2TpiPYisrNL0zuHDGygtkl++okhBytopvcoeWe3o
	bmznlyV4SwcARL32ejVD5E3oQ/5Th6s7gZzyiJ5qh04gooGdUkUiT2Bfit+JYdns+mxoYDzkAqBu+
	ZaL//EUrOLoKSfYDV7yDR8sUGgp7bSsZtYL877XBDvNreej2JLb63a4EoCUHKSRxSUC12F6jWD7s+
	ElRP+ZXhZImUYl/4o2By1TCXDLp7Qf2zrROavm/3MHWVU7gTujpMm9X0Yuo4LpBdZbdSYwt3xbSAq
	lgs3XmyQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48248 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vGy5f-000000004w8-25Qr;
	Thu, 06 Nov 2025 11:23:43 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vGy5e-0000000DhQb-2B7I;
	Thu, 06 Nov 2025 11:23:42 +0000
In-Reply-To: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
References: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
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
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH net-next 7/9] net: stmmac: sti: use PHY_INTF_SEL_x directly
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vGy5e-0000000DhQb-2B7I@rmk-PC.armlinux.org.uk>
Date: Thu, 06 Nov 2025 11:23:42 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_032350_096421_68C8D761 
X-CRM114-Status: GOOD (  10.62  )
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

Use the PHY_INTF_SEL_x values directly rather than the driver private
ETH_PHY_SEL_x values. Move the FIELD_PREP() into sti_dwmac_set_mode().
Use dwmac->interface directly.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sti.c   | 27 +++++++++----------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index 1e8769a81d77..c97535824be0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -81,11 +81,6 @@
  */
 #define MII_PHY_SEL_MASK	GENMASK(4, 2)
 #define MII_PHY_SEL_VAL(val)	FIELD_PREP_CONST(MII_PHY_SEL_MASK, val)
-#define ETH_PHY_SEL_RMII	MII_PHY_SEL_VAL(PHY_INTF_SEL_RMII)
-#define ETH_PHY_SEL_SGMII	MII_PHY_SEL_VAL(PHY_INTF_SEL_SGMII)
-#define ETH_PHY_SEL_RGMII	MII_PHY_SEL_VAL(PHY_INTF_SEL_RGMII)
-#define ETH_PHY_SEL_GMII	MII_PHY_SEL_VAL(PHY_INTF_SEL_GMII_MII)
-#define ETH_PHY_SEL_MII		MII_PHY_SEL_VAL(PHY_INTF_SEL_GMII_MII)
 
 struct sti_dwmac {
 	phy_interface_t interface;	/* MII interface */
@@ -104,13 +99,13 @@ struct sti_dwmac_of_data {
 	void (*fix_retime_src)(void *priv, int speed, unsigned int mode);
 };
 
-static u32 phy_intf_sels[] = {
-	[PHY_INTERFACE_MODE_MII] = ETH_PHY_SEL_MII,
-	[PHY_INTERFACE_MODE_GMII] = ETH_PHY_SEL_GMII,
-	[PHY_INTERFACE_MODE_RGMII] = ETH_PHY_SEL_RGMII,
-	[PHY_INTERFACE_MODE_RGMII_ID] = ETH_PHY_SEL_RGMII,
-	[PHY_INTERFACE_MODE_SGMII] = ETH_PHY_SEL_SGMII,
-	[PHY_INTERFACE_MODE_RMII] = ETH_PHY_SEL_RMII,
+static u8 phy_intf_sels[] = {
+	[PHY_INTERFACE_MODE_MII] = PHY_INTF_SEL_GMII_MII,
+	[PHY_INTERFACE_MODE_GMII] = PHY_INTF_SEL_GMII_MII,
+	[PHY_INTERFACE_MODE_RGMII] = PHY_INTF_SEL_RGMII,
+	[PHY_INTERFACE_MODE_RGMII_ID] = PHY_INTF_SEL_RGMII,
+	[PHY_INTERFACE_MODE_SGMII] = PHY_INTF_SEL_SGMII,
+	[PHY_INTERFACE_MODE_RMII] = PHY_INTF_SEL_RMII,
 };
 
 enum {
@@ -164,16 +159,18 @@ static void stih4xx_fix_retime_src(void *priv, int spd, unsigned int mode)
 static int sti_dwmac_set_mode(struct sti_dwmac *dwmac)
 {
 	struct regmap *regmap = dwmac->regmap;
-	int iface = dwmac->interface;
 	u32 reg = dwmac->ctrl_reg;
+	u8 phy_intf_sel;
 	u32 val;
 
 	if (dwmac->gmac_en)
 		regmap_update_bits(regmap, reg, EN_MASK, EN);
 
-	regmap_update_bits(regmap, reg, MII_PHY_SEL_MASK, phy_intf_sels[iface]);
+	phy_intf_sel = phy_intf_sels[dwmac->interface];
+	regmap_update_bits(regmap, reg, MII_PHY_SEL_MASK,
+			   FIELD_PREP(MII_PHY_SEL_MASK, phy_intf_sel));
 
-	val = (iface == PHY_INTERFACE_MODE_REVMII) ? 0 : ENMII;
+	val = (dwmac->interface == PHY_INTERFACE_MODE_REVMII) ? 0 : ENMII;
 	regmap_update_bits(regmap, reg, ENMII_MASK, val);
 
 	dwmac->fix_retime_src(dwmac, dwmac->speed, 0);
-- 
2.47.3


