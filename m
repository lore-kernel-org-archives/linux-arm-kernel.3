Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F54DCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 08:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbRa8tG8yIdmuFVCpZVrPAB4FQoWo4iNPMvlWuGr/Js=; b=tjkbywF+HAeWNX1yBpQbZZguuz
	yS+gpenENMRyOu4PLCIhp1vbhcs4/dNAIEkcxiGjhK7NZ5ohWIZter1nmH5NdkaA1NzlKOL53MuNZ
	b2pIWmEd7RGxFZkAPR4ENV/DeKn2v5VvP5X7ROuqwcm9a749cq9I+MYu0DGGqVMzuJaPHI6/0jwfx
	ga6iERytOcSTy27skeTCjOAoOR21QUGmz4ODdkVaU6fdv3vZvxRM4gRbXD75NtJKsLaTaEWTkS2ST
	GCLq1ZlWTI+45tQkGwyP0qCnM1Qiz73ufzZfEVffZSSE3M6vGx9LQoHDJOwTrLOAuC8D755xJ5Tpt
	lf45un2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjUn-00000006lNP-1HdD;
	Tue, 11 Nov 2025 08:12:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjUk-00000006lHb-1cCP;
	Tue, 11 Nov 2025 08:12:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XbRa8tG8yIdmuFVCpZVrPAB4FQoWo4iNPMvlWuGr/Js=; b=yRFKNCZUnI/RL07xuEStBU6mzT
	kcLClyCmBI2cFcACXSqh8cO7AzV7owMRUvwBEC3Nx6yKfUVNDtjPNqhCcnWj+w3hOpyut0XU7eM8t
	XyMyIwrh7cWGh/qy8umQ7x60ZOjy0nagL1e14N2dMLL1C7+1IY0cWXsSxFFGDjZ0wMBdL+m5tPGUG
	HlW5g9ocS007xeZEJcg9qbuAe9ycrZR+BH5yv2ClDc9/xuGPVHV0BFCYOxauXeGV0hKQdTEQLuXYV
	hmB/SagOE83e2WNrd9hsoChJMFxuma/rgHKFillAeNFkdKWiGYe7zhoRr0qT33uYDF1WUDXQWBw1W
	lL4Vfv6g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57346 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vIjUY-000000002Cs-0T0T;
	Tue, 11 Nov 2025 08:12:42 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vIjUU-0000000Dqtz-2PwT;
	Tue, 11 Nov 2025 08:12:38 +0000
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
Subject: [PATCH net-next v2 11/13] net: stmmac: stm32: use
 stmmac_get_phy_intf_sel()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vIjUU-0000000Dqtz-2PwT@rmk-PC.armlinux.org.uk>
Date: Tue, 11 Nov 2025 08:12:38 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_001254_617848_537983E3 
X-CRM114-Status: GOOD (  14.93  )
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

Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
phy_intf_sel value. As both configure functions would end up with the
same code, call this from stm32mp1_set_mode(), validate the result and
pass the resulting value into the stm32 configure function. Use this
value to set the operating mode for the DWMAC core.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 42 ++++++++++---------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 18d26f096f5f..e1b260ed4790 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -227,16 +227,17 @@ static int stm32mp1_validate_ethck_rate(struct plat_stmmacenet_data *plat_dat)
 	return -EINVAL;
 }
 
-static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
+static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat,
+				   u8 phy_intf_sel)
 {
 	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
 	u32 reg = dwmac->mode_reg;
-	u8 phy_intf_sel;
-	int val = 0;
+	int val;
+
+	val = FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, phy_intf_sel);
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
-		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 		/*
 		 * STM32MP15xx supports both MII and GMII, STM32MP13xx MII only.
 		 * SYSCFG_PMCSETR ETH_SELMII is present only on STM32MP15xx and
@@ -247,12 +248,10 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 			val |= SYSCFG_PMCR_ETH_SEL_MII;
 		break;
 	case PHY_INTERFACE_MODE_GMII:
-		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 		if (dwmac->enable_eth_ck)
 			val |= SYSCFG_PMCR_ETH_CLK_SEL;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		phy_intf_sel = PHY_INTF_SEL_RMII;
 		if (dwmac->enable_eth_ck)
 			val |= SYSCFG_PMCR_ETH_REF_CLK_SEL;
 		break;
@@ -260,7 +259,6 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		phy_intf_sel = PHY_INTF_SEL_RGMII;
 		if (dwmac->enable_eth_ck)
 			val |= SYSCFG_PMCR_ETH_CLK_SEL;
 		break;
@@ -273,8 +271,6 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 
 	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->phy_interface));
 
-	val |= FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, phy_intf_sel);
-
 	/* Shift value at correct ethernet MAC offset in SYSCFG_PMCSETR */
 	val <<= ffs(dwmac->mode_mask) - ffs(SYSCFG_MP1_ETH_MASK);
 
@@ -287,19 +283,20 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 				 dwmac->mode_mask, val);
 }
 
-static int stm32mp2_configure_syscfg(struct plat_stmmacenet_data *plat_dat)
+static int stm32mp2_configure_syscfg(struct plat_stmmacenet_data *plat_dat,
+				     u8 phy_intf_sel)
 {
 	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
-	u8 phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 	u32 reg = dwmac->mode_reg;
-	int val = 0;
+	int val;
+
+	val = FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, phy_intf_sel);
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		/* ETH_REF_CLK_SEL bit in SYSCFG register is not applicable in MII mode */
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		phy_intf_sel = PHY_INTF_SEL_RMII;
 		if (dwmac->enable_eth_ck) {
 			/* Internal clock ETH_CLK of 50MHz from RCC is used */
 			val |= SYSCFG_ETHCR_ETH_REF_CLK_SEL;
@@ -309,8 +306,6 @@ static int stm32mp2_configure_syscfg(struct plat_stmmacenet_data *plat_dat)
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		phy_intf_sel = PHY_INTF_SEL_RGMII;
-		fallthrough;
 	case PHY_INTERFACE_MODE_GMII:
 		if (dwmac->enable_eth_ck) {
 			/* Internal clock ETH_CLK of 125MHz from RCC is used */
@@ -326,8 +321,6 @@ static int stm32mp2_configure_syscfg(struct plat_stmmacenet_data *plat_dat)
 
 	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->phy_interface));
 
-	val |= FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, phy_intf_sel);
-
 	/* Select PTP (IEEE1588) clock selection from RCC (ck_ker_ethxptp) */
 	val |= SYSCFG_ETHCR_ETH_PTP_CLK_SEL;
 
@@ -339,7 +332,7 @@ static int stm32mp2_configure_syscfg(struct plat_stmmacenet_data *plat_dat)
 static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
 {
 	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
-	int ret;
+	int phy_intf_sel, ret;
 
 	ret = stm32mp1_select_ethck_external(plat_dat);
 	if (ret)
@@ -349,10 +342,19 @@ static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
 	if (ret)
 		return ret;
 
+	phy_intf_sel = stmmac_get_phy_intf_sel(plat_dat->phy_interface);
+	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
+	    phy_intf_sel != PHY_INTF_SEL_RGMII &&
+	    phy_intf_sel != PHY_INTF_SEL_RMII) {
+		dev_err(dwmac->dev, "Mode %s not supported\n",
+			phy_modes(plat_dat->phy_interface));
+		return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
+	}
+
 	if (!dwmac->ops->is_mp2)
-		return stm32mp1_configure_pmcr(plat_dat);
+		return stm32mp1_configure_pmcr(plat_dat, phy_intf_sel);
 	else
-		return stm32mp2_configure_syscfg(plat_dat);
+		return stm32mp2_configure_syscfg(plat_dat, phy_intf_sel);
 }
 
 static int stm32mcu_set_mode(struct plat_stmmacenet_data *plat_dat)
-- 
2.47.3


