Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE7ECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 08:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxKxjy/C3oPWob4dBvPPL6F8jhZxW9+kJIyvEtBbh7A=; b=UGzY+NrAqemJCdUmgN/87xfV7D
	JmDvewp82YyDSI0jnXXhjlK1wuQX0A5X+cInADP/HeJoxRMauyz5T9TkDPUJhCjuFLECZiSsfhMUr
	zp4vVlBb7InOFa0JR7TYN3p5A4JYXkEK9ofKSK9eh/kGA9sHxPfEVNFH8g5eYRx3u5049db3fa+5p
	RNhmtaysZZ4FDqvMQolCnGDITv9wF7ge+oN4llmXWiPyZ+wZrJtmcjt5gSta3hl/5VhbVDMy0B34G
	ahhsSBY3L16dyRF2gRUpYCABBkcBXROh2vJOiM+cFVf9O3rD18YRvpfrQOzGqcVPyv9j5gIg0D6Xq
	5v06T9oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjUg-00000006lFH-0TAH;
	Tue, 11 Nov 2025 08:12:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjUc-00000006l9T-3DPu;
	Tue, 11 Nov 2025 08:12:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nxKxjy/C3oPWob4dBvPPL6F8jhZxW9+kJIyvEtBbh7A=; b=uwirgqZqzwBy2h45SFUgjVCFFE
	/o4d7gM59vGxBxnnercP8FtTNFxFw1pRhJwJFCbXIWP++wNoHay8WY8xETG/7symB6Y8OKda2CzXX
	8PvvG3nXbZxrw/8yDTgw8kRsiY8YeRauh21CBZ9dr08lJE5yI7HK6YQdkSU2zk19cyFf6BScjyicZ
	YhpkuIBno7SvxOUGl4cQ7XgQll0Lrm1ZmBQ3eILPWImhMcn6IBcw0OybKb07OaXwlW8Wy/PkiZGnY
	oz5pWsW7AGNqkr+zwPUOZIJdZHCtG0/g8LLvAJHcv+9DHCzd72MV3J+9MBXRdWo1v18psJMZs7R39
	WUhkmpqw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50420 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vIjUS-000000002CQ-0j7t;
	Tue, 11 Nov 2025 08:12:36 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vIjUP-0000000Dqtt-1bYn;
	Tue, 11 Nov 2025 08:12:33 +0000
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
Subject: [PATCH net-next v2 10/13] net: stmmac: stm32: use PHY_INTF_SEL_x
 directly
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vIjUP-0000000Dqtt-1bYn@rmk-PC.armlinux.org.uk>
Date: Tue, 11 Nov 2025 08:12:33 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_001246_859419_F64E792B 
X-CRM114-Status: GOOD (  13.23  )
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

Rather than defining separate constants for each, use the
PHY_INTF_SEL_x definitions in the switch()es configuring the
control register, and use one FIELD_PREP() to convert phy_intf_sel
to the register value.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 32 ++++++++-----------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 1545772419d5..18d26f096f5f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -48,30 +48,17 @@
  */
 #define SYSCFG_PMCR_ETH_SEL_MII		BIT(20)
 #define SYSCFG_PMCR_PHY_INTF_SEL_MASK	GENMASK(23, 21)
-#define SYSCFG_PMCR_ETH_SEL_RGMII	\
-	FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, PHY_INTF_SEL_RGMII)
-#define SYSCFG_PMCR_ETH_SEL_RMII	\
-	FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, PHY_INTF_SEL_RMII)
-#define SYSCFG_PMCR_ETH_SEL_GMII	\
-	FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, PHY_INTF_SEL_GMII_MII)
 #define SYSCFG_MCU_ETH_SEL_MII		0
 #define SYSCFG_MCU_ETH_SEL_RMII		1
 
 /* STM32MP2 register definitions */
 #define SYSCFG_MP2_ETH_MASK		GENMASK(31, 0)
 
+#define SYSCFG_ETHCR_ETH_SEL_MASK	GENMASK(6, 4)
 #define SYSCFG_ETHCR_ETH_PTP_CLK_SEL	BIT(2)
 #define SYSCFG_ETHCR_ETH_CLK_SEL	BIT(1)
 #define SYSCFG_ETHCR_ETH_REF_CLK_SEL	BIT(0)
 
-#define SYSCFG_ETHCR_ETH_SEL_MASK	GENMASK(6, 4)
-#define SYSCFG_ETHCR_ETH_SEL_MII	FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, \
-						   PHY_INTF_SEL_GMII_MII)
-#define SYSCFG_ETHCR_ETH_SEL_RGMII	FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, \
-						   PHY_INTF_SEL_RGMII)
-#define SYSCFG_ETHCR_ETH_SEL_RMII	FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, \
-						   PHY_INTF_SEL_RMII)
-
 /* STM32MPx register definitions
  *
  * Below table summarizes the clock requirement and clock sources for
@@ -244,10 +231,12 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 {
 	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
 	u32 reg = dwmac->mode_reg;
+	u8 phy_intf_sel;
 	int val = 0;
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
+		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 		/*
 		 * STM32MP15xx supports both MII and GMII, STM32MP13xx MII only.
 		 * SYSCFG_PMCSETR ETH_SELMII is present only on STM32MP15xx and
@@ -258,12 +247,12 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 			val |= SYSCFG_PMCR_ETH_SEL_MII;
 		break;
 	case PHY_INTERFACE_MODE_GMII:
-		val = SYSCFG_PMCR_ETH_SEL_GMII;
+		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 		if (dwmac->enable_eth_ck)
 			val |= SYSCFG_PMCR_ETH_CLK_SEL;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		val = SYSCFG_PMCR_ETH_SEL_RMII;
+		phy_intf_sel = PHY_INTF_SEL_RMII;
 		if (dwmac->enable_eth_ck)
 			val |= SYSCFG_PMCR_ETH_REF_CLK_SEL;
 		break;
@@ -271,7 +260,7 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		val = SYSCFG_PMCR_ETH_SEL_RGMII;
+		phy_intf_sel = PHY_INTF_SEL_RGMII;
 		if (dwmac->enable_eth_ck)
 			val |= SYSCFG_PMCR_ETH_CLK_SEL;
 		break;
@@ -284,6 +273,8 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 
 	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->phy_interface));
 
+	val |= FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, phy_intf_sel);
+
 	/* Shift value at correct ethernet MAC offset in SYSCFG_PMCSETR */
 	val <<= ffs(dwmac->mode_mask) - ffs(SYSCFG_MP1_ETH_MASK);
 
@@ -299,6 +290,7 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 static int stm32mp2_configure_syscfg(struct plat_stmmacenet_data *plat_dat)
 {
 	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
+	u8 phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 	u32 reg = dwmac->mode_reg;
 	int val = 0;
 
@@ -307,7 +299,7 @@ static int stm32mp2_configure_syscfg(struct plat_stmmacenet_data *plat_dat)
 		/* ETH_REF_CLK_SEL bit in SYSCFG register is not applicable in MII mode */
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		val = SYSCFG_ETHCR_ETH_SEL_RMII;
+		phy_intf_sel = PHY_INTF_SEL_RMII;
 		if (dwmac->enable_eth_ck) {
 			/* Internal clock ETH_CLK of 50MHz from RCC is used */
 			val |= SYSCFG_ETHCR_ETH_REF_CLK_SEL;
@@ -317,7 +309,7 @@ static int stm32mp2_configure_syscfg(struct plat_stmmacenet_data *plat_dat)
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		val = SYSCFG_ETHCR_ETH_SEL_RGMII;
+		phy_intf_sel = PHY_INTF_SEL_RGMII;
 		fallthrough;
 	case PHY_INTERFACE_MODE_GMII:
 		if (dwmac->enable_eth_ck) {
@@ -334,6 +326,8 @@ static int stm32mp2_configure_syscfg(struct plat_stmmacenet_data *plat_dat)
 
 	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->phy_interface));
 
+	val |= FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, phy_intf_sel);
+
 	/* Select PTP (IEEE1588) clock selection from RCC (ck_ker_ethxptp) */
 	val |= SYSCFG_ETHCR_ETH_PTP_CLK_SEL;
 
-- 
2.47.3


