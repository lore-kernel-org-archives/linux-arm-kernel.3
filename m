Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CD4D72366
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 10:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ycZpKPqCdkchXzTFV2OBU4or3R/JWa0ZIOE06LOM78=; b=q57gliW0Tk6wlLMcwNGLaKjxrf
	rBthXssg36p/eyGk+Siv08VWo4YCH7oBlCHH0Qoo/yvDj81aJgaKYtgZOiIoOtJ2JKEvwzVn7rSL7
	tVTFUa61pTn1jG1twKcrQ4MRYakjDcKNAx8yhaY+twyhj4hlsWUiTrFNdVBmyqb1003e+e31SHQnT
	Plj27ynGb0rY4nfey5mNZsBmxuHLlidEmDyRAvnS7HWXGCfBMwFoF1TtCbsTf1XNtaTCEGHsrCSfW
	kienkYyLohlKdlIg/PMcCVmwVSQqBfGNU7RI6fBIog59mSOU/E/qNhWpa109xJKWho4shd1pSy/iy
	BI1GL/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjE13-00000008fZT-3EkQ;
	Fri, 23 Jan 2026 10:03:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjE11-00000008fYs-2Ate;
	Fri, 23 Jan 2026 10:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4ycZpKPqCdkchXzTFV2OBU4or3R/JWa0ZIOE06LOM78=; b=XPrgXBGsOHAHViUrOSkZh3DKY/
	03IQrDsAbyvyhsWnohaa+J5n1km6DPsPufha6LDoe15m2usbeeMtRHLkNBIjz/tZK7W+54aFa+0sG
	Z/p1g3s5POlJtzW1eWdGx2Xi+2X5LYvbK/MumDcA3oetGyLLLsnVOmOZU3CcOMj+zo8TfSJT8PEpf
	sMHTcM8t8PbAsUCNm1v3wCf1ilhsx4HQhtMRO+PJxBF/MCLQqoS9K0G1/+cCpvCIVMwaKtsfr9iQn
	X8UxFLM25TUlI3Px7WPwwBWoH6+KW3NJTN7C7rzcUgFw+XxY8IVZcwGRwfSk7L7XgTjxKkJe85aSe
	wpuXileA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48066 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vjDsA-000000001dM-33ln;
	Fri, 23 Jan 2026 09:54:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vjDs1-00000005fRC-0tI1;
	Fri, 23 Jan 2026 09:54:25 +0000
In-Reply-To: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next v2 13/14] net: stmmac: configure SGMII AN control
 according to phylink
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vjDs1-00000005fRC-0tI1@rmk-PC.armlinux.org.uk>
Date: Fri, 23 Jan 2026 09:54:25 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_020343_558784_EA822686 
X-CRM114-Status: GOOD (  12.50  )
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

Provide phylink with the integrated PCS autonegotiation capabilities,
and configure the PCS's AN settings according to phylink's requested
requirements.

This may cause regressions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  |  4 ++--
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  4 ++--
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 20 ++++++++++++-------
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 18a0b678295d..31f6ac5432f2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -24,8 +24,8 @@
 
 static const struct stmmac_pcs_info dwmac1000_pcs_info = {
 	.pcs_offset = GMAC_PCS_BASE,
-	.rsgmii_offset = GMAC_RGSMIIIS,
-	.rsgmii_status_mask = GMAC_RSGMIIIS_MASK,
+	.rgsmii_offset = GMAC_RGSMIIIS,
+	.rgsmii_status_mask = GMAC_RSGMIIIS_MASK,
 	.int_mask = GMAC_INT_DISABLE_PCSLINK | GMAC_INT_DISABLE_PCSAN,
 };
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index e7836bb27a9b..ced2cd98cc54 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -24,8 +24,8 @@
 
 static const struct stmmac_pcs_info dwmac4_pcs_info = {
 	.pcs_offset = GMAC_PCS_BASE,
-	.rsgmii_offset = GMAC_PHYIF_CONTROL_STATUS,
-	.rsgmii_status_mask = GMAC_PHYIF_CTRLSTATUS_RSGMII_MASK,
+	.rgsmii_offset = GMAC_PHYIF_CONTROL_STATUS,
+	.rgsmii_status_mask = GMAC_PHYIF_CTRLSTATUS_RSGMII_MASK,
 	.int_mask = GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE,
 };
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 3b450e7f794c..978f66ea51f3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -65,7 +65,8 @@ static int dwmac_integrated_pcs_validate(struct phylink_pcs *pcs,
 static unsigned int dwmac_integrated_pcs_inband_caps(struct phylink_pcs *pcs,
 						     phy_interface_t interface)
 {
-	if (phy_interface_mode_is_8023z(interface))
+	if (phy_interface_mode_is_8023z(interface) ||
+	    interface == PHY_INTERFACE_MODE_SGMII)
 		return LINK_INBAND_ENABLE | LINK_INBAND_DISABLE;
 
 	return 0;
@@ -164,8 +165,9 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 				       bool permit_pause_to_mac)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
-	bool changed = false, ane = true;
-	u32 adv;
+	void __iomem *an_control = spcs->base + GMAC_AN_CTRL(0);
+	bool changed = false;
+	u32 adv, ctrl;
 	int ret;
 
 	if (spcs->interface != interface) {
@@ -182,12 +184,16 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 		if (readl(spcs->base + GMAC_ANE_ADV) != adv)
 			changed = true;
 		writel(adv, spcs->base + GMAC_ANE_ADV);
-
-		ane = neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
 	}
 
-	dwmac_ctrl_ane(spcs->base, 0, ane,
-		       spcs->priv->hw->reverse_sgmii_enable);
+	ctrl = readl(an_control) & ~(GMAC_AN_CTRL_ANE | GMAC_AN_CTRL_SGMRAL);
+	if (spcs->priv->hw->reverse_sgmii_enable)
+		ctrl |= GMAC_AN_CTRL_SGMRAL | GMAC_AN_CTRL_ANE;
+	else if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
+		ctrl |= GMAC_AN_CTRL_ANE;
+	else
+		ctrl |= GMAC_AN_CTRL_SGMRAL;
+	writel(ctrl, an_control);
 
 	return changed;
 }
-- 
2.47.3


