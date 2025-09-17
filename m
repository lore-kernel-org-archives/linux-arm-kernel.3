Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A901CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLGSCkhJYkYCcobuSQ5Oyaf1uTdDzYldkQNkhdDB1IA=; b=MhfNukeOFLdN5hzgFwm50pLYoG
	nEave2klo81UGffaBHTbx5r4vnkyBPEPQL9re2l76VQc5rjy0wnW+iAQhbg/DSGJ8ad8x6saMI9QI
	mEWUeTnzlTQcF3G4ordBzsKLsEAjKsIHrxpHIpN+o799LvdlA/M0M2ToXcUVIHfWvJQ3uOSpYoY7i
	to47478NijqYBkoFlDxJpeVpdobHhQllAxkindj3pQqrZYWLJUCMccSJVmvt+0LtlKaYkNbfbS+lF
	H9qkDxTiFO46jdqMBb0LDpFQE0+W0o7Rixm2LwnCy3Bf0hm/7PF8IzBs6QTGcsf/3DXUFS/pCq9iJ
	4ZWTGTUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytqJ-0000000Cb1t-0u6y;
	Wed, 17 Sep 2025 15:13:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytqB-0000000CapN-3nsm;
	Wed, 17 Sep 2025 15:13:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PLGSCkhJYkYCcobuSQ5Oyaf1uTdDzYldkQNkhdDB1IA=; b=Ky4aasfZomTPEs8qJrkEO+3qSW
	R+FEbkZwUTF3AVeo4jl+6lmcokTr3ASdPmX3cAoDOnIzqYLLYIVHLDSQ+rG7DxOkiJiKXq9GJyC5X
	8h5tF0n2ewXaLazmDSEpe+y1ae24MT3D60FIsCPBiH41ERffhxDePikqTk3P4PYqU+G1Nj6FgLBlh
	qTb1fnO0wDSjezlqtu++O4VmGYgHDQzkYkxW/CIxn4YBuhvkBaDw+/apGHqaI9uHFYheS+QjW0Bm5
	5GTeaDgY8ynejLytv4jFUYvtq2HE/b7WVgfdoAnvrJb27nHkBC7kvUt9K6EoGDEJE77TQKP3dc19o
	3skCHiuA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60996 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uytpl-000000004m2-0fIP;
	Wed, 17 Sep 2025 16:12:37 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uytpf-00000006H2c-3hiU;
	Wed, 17 Sep 2025 16:12:31 +0100
In-Reply-To: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
References: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <fustini@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH net-next 07/10] net: stmmac: stm32: convert to use
 phy_interface
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uytpf-00000006H2c-3hiU@rmk-PC.armlinux.org.uk>
Date: Wed, 17 Sep 2025 16:12:31 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_081303_993220_8B5A219F 
X-CRM114-Status: GOOD (  12.08  )
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

dwmac-stm32 supports MII, RMII, GMII and RGMII interface modes,
selecting the dwmac core interface mode via bits 23:21 of the
SYSCFG register. The bit combinations are identical to the
dwmac phy_intf_sel_i signals.

None of the DTS files set "mac-mode", so mac_interface will be
identical to phy_interface.

Convert dwmac-stm32 to use phy_interface when determining the
interface mode rather than mac_interface.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 77a04c4579c9..6c179911ef3f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -171,7 +171,7 @@ static int stm32mp1_select_ethck_external(struct plat_stmmacenet_data *plat_dat)
 {
 	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
 
-	switch (plat_dat->mac_interface) {
+	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		dwmac->enable_eth_ck = dwmac->ext_phyclk;
 		return 0;
@@ -193,7 +193,7 @@ static int stm32mp1_select_ethck_external(struct plat_stmmacenet_data *plat_dat)
 	default:
 		dwmac->enable_eth_ck = false;
 		dev_err(dwmac->dev, "Mode %s not supported",
-			phy_modes(plat_dat->mac_interface));
+			phy_modes(plat_dat->phy_interface));
 		return -EINVAL;
 	}
 }
@@ -206,7 +206,7 @@ static int stm32mp1_validate_ethck_rate(struct plat_stmmacenet_data *plat_dat)
 	if (!dwmac->enable_eth_ck)
 		return 0;
 
-	switch (plat_dat->mac_interface) {
+	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
 	case PHY_INTERFACE_MODE_GMII:
 		if (clk_rate == ETH_CK_F_25M)
@@ -228,7 +228,7 @@ static int stm32mp1_validate_ethck_rate(struct plat_stmmacenet_data *plat_dat)
 	}
 
 	dev_err(dwmac->dev, "Mode %s does not match eth-ck frequency %d Hz",
-		phy_modes(plat_dat->mac_interface), clk_rate);
+		phy_modes(plat_dat->phy_interface), clk_rate);
 	return -EINVAL;
 }
 
@@ -238,7 +238,7 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 	u32 reg = dwmac->mode_reg;
 	int val = 0;
 
-	switch (plat_dat->mac_interface) {
+	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		/*
 		 * STM32MP15xx supports both MII and GMII, STM32MP13xx MII only.
@@ -269,12 +269,12 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 		break;
 	default:
 		dev_err(dwmac->dev, "Mode %s not supported",
-			phy_modes(plat_dat->mac_interface));
+			phy_modes(plat_dat->phy_interface));
 		/* Do not manage others interfaces */
 		return -EINVAL;
 	}
 
-	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->mac_interface));
+	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->phy_interface));
 
 	/* Shift value at correct ethernet MAC offset in SYSCFG_PMCSETR */
 	val <<= ffs(dwmac->mode_mask) - ffs(SYSCFG_MP1_ETH_MASK);
@@ -294,7 +294,7 @@ static int stm32mp2_configure_syscfg(struct plat_stmmacenet_data *plat_dat)
 	u32 reg = dwmac->mode_reg;
 	int val = 0;
 
-	switch (plat_dat->mac_interface) {
+	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		/* ETH_REF_CLK_SEL bit in SYSCFG register is not applicable in MII mode */
 		break;
@@ -319,12 +319,12 @@ static int stm32mp2_configure_syscfg(struct plat_stmmacenet_data *plat_dat)
 		break;
 	default:
 		dev_err(dwmac->dev, "Mode %s not supported",
-			phy_modes(plat_dat->mac_interface));
+			phy_modes(plat_dat->phy_interface));
 		/* Do not manage others interfaces */
 		return -EINVAL;
 	}
 
-	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->mac_interface));
+	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->phy_interface));
 
 	/* Select PTP (IEEE1588) clock selection from RCC (ck_ker_ethxptp) */
 	val |= SYSCFG_ETHCR_ETH_PTP_CLK_SEL;
@@ -359,7 +359,7 @@ static int stm32mcu_set_mode(struct plat_stmmacenet_data *plat_dat)
 	u32 reg = dwmac->mode_reg;
 	int val;
 
-	switch (plat_dat->mac_interface) {
+	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		val = SYSCFG_MCU_ETH_SEL_MII;
 		break;
@@ -368,12 +368,12 @@ static int stm32mcu_set_mode(struct plat_stmmacenet_data *plat_dat)
 		break;
 	default:
 		dev_err(dwmac->dev, "Mode %s not supported",
-			phy_modes(plat_dat->mac_interface));
+			phy_modes(plat_dat->phy_interface));
 		/* Do not manage others interfaces */
 		return -EINVAL;
 	}
 
-	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->mac_interface));
+	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->phy_interface));
 
 	return regmap_update_bits(dwmac->regmap, reg,
 				 SYSCFG_MCU_ETH_MASK, val << 23);
-- 
2.47.3


