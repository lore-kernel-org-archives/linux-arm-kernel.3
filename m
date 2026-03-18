Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D12210775E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 16:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qDTtxcURNmNqjbVsQLJvqFcFEvYp3gsir26/ToX5FE=; b=LhIRsOCoW7P7eEzhuPH6zzbFPL
	Ue3AkRJHqLOJAJ4iFczD84/eY2clJl7zKOZ9pO1k+9ZVr7L3GD4gBSwGZvFPgEHhzJcsvjbK/t/Uw
	67abWUgrg/1C3knBc9ycp+WsRfjxY1p6Q4JXlD9eLlROtuh1YFLEmr2rTqFIjcgAi5sSTWx2/Ic9I
	ikd+PqBmYdeFjwm+ec+b8YQKY3f8plxiGiaIqmMRsaU3q8Faz7+u421wqLXi0v4/a/y51noTIdkE3
	45FT+mL2dL01Im1lidDTBvweYQd4LYtHSSMeYeR3Abuu0jzJEDjaJnpIRe8d4coHsVbQqLiHowHY8
	gzrKovrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tPs-00000008t70-0of4;
	Wed, 18 Mar 2026 16:06:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tPp-00000008t51-36rg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 16:06:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2qDTtxcURNmNqjbVsQLJvqFcFEvYp3gsir26/ToX5FE=; b=CtgYPuy7uxlHXu9zty4E4qBe2V
	o+eQHYE5DOcMUTf82gN6quqYiN5Qjuvh4+LtoOn2lN3B8HuVzGwGnlSAsus3QO30lCEEi2d+631Wt
	plzvHacqATZ44GCN3AAX9CeR8rhhydd8sd1D0WiYctSSwwZkHQE9X9DhxvSVwYXxj3CXJECr549yG
	qpwcKSC7ABElliyUcD3SvnvDbUb4wshsc4ILIAodmMR4lbfxxoreMtrNnMoEHSK1mdLfnKgurBvfO
	yjynyQ/tLJ7ZXp+QEf1W1rycftz15Xt1iL9Ygi3g7vVLyuFdwX49LxPr2e0RTwDuvXsLaDbjJUXNU
	36KwFInw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40728 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w2tPf-000000003fA-3vra;
	Wed, 18 Mar 2026 16:06:28 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w2tPe-0000000DYAp-1qpV;
	Wed, 18 Mar 2026 16:06:26 +0000
In-Reply-To: <abrNYVfZ1Iwff2EI@shell.armlinux.org.uk>
References: <abrNYVfZ1Iwff2EI@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next v2 maybe? 4/5] net: stmmac: add BASE-X support to
 integrated PCS
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w2tPe-0000000DYAp-1qpV@rmk-PC.armlinux.org.uk>
Date: Wed, 18 Mar 2026 16:06:26 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_090638_013511_4657F35B 
X-CRM114-Status: GOOD (  26.21  )
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

The integrated PCS supports 802.3z (BASE-X) modes when the Synopsys
IP is coupled with an appropriate SerDes to provide the electrical
interface. The PCS presents a TBI interface to the SerDes for this.
Thus, the BASE-X related registers are only present when TBI mode is
supported.

dwmac-qcom-ethqos added support for using 2.5G with the integrated PCS
by calling dwmac_ctrl_ane() directly.

Add support for the following to the integrated PCS:
- 1000BASE-X protocol unconditionally.
- 2500BASE-X if the coupled SerDes supports 2.5G speed.
- The above without autonegotiation.
- If the PCS supports TBI, then optional BASE-X autonegotiation for each
  of the above.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
--
- Add pcs_an_restart() support
---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 103 +++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  |   1 +
 include/linux/stmmac.h                        |   1 +
 3 files changed, 101 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index df72f7c5a6a7..df37af5ab837 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -26,6 +26,27 @@
 #define GMAC_RGSMII_SPEED_2_5		0
 #define GMAC_RGSMII_LNKSTS		BIT(3)
 
+static unsigned int dwmac_integrated_pcs_inband_caps(struct phylink_pcs *pcs,
+						     phy_interface_t interface)
+{
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	unsigned int ib_caps;
+
+	if (phy_interface_mode_is_8023z(interface)) {
+		ib_caps = LINK_INBAND_DISABLE;
+
+		/* If the PCS supports TBI/RTBI, then BASE-X negotiation is
+		 * supported.
+		 */
+		if (spcs->support_tbi_rtbi)
+			ib_caps |= LINK_INBAND_ENABLE;
+
+		return ib_caps;
+	}
+
+	return 0;
+}
+
 static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
@@ -47,12 +68,20 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
 					   struct phylink_link_state *state)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
-	u32 status, rgsmii;
+	u32 status, lpa, rgsmii;
 
 	status = readl(spcs->base + GMAC_AN_STATUS);
 
 	if (phy_interface_mode_is_8023z(state->interface)) {
-		state->link = false;
+		/* For BASE-X modes, the PCS block supports the advertisement
+		 * and link partner advertisement registers using standard
+		 * 802.3 format. The status register also has the link status
+		 * and AN complete bits in the same bit location. This will
+		 * only be used when AN is enabled.
+		 */
+		lpa = readl(spcs->base + GMAC_ANE_LPA);
+
+		phylink_mii_c22_pcs_decode_state(state, neg_mode, status, lpa);
 	} else {
 		rgsmii = field_get(spcs->rgsmii_status_mask,
 				   readl(spcs->rgsmii));
@@ -84,6 +113,21 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
 	}
 }
 
+static int dwmac_integrated_pcs_config_aneg(struct stmmac_pcs *spcs,
+					    phy_interface_t interface,
+					    const unsigned long *advertising)
+{
+	bool changed = false;
+	u32 adv;
+
+	adv = phylink_mii_c22_pcs_encode_advertisement(interface, advertising);
+	if (readl(spcs->base + GMAC_ANE_ADV) != adv)
+		changed = true;
+	writel(adv, spcs->base + GMAC_ANE_ADV);
+
+	return changed;
+}
+
 static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 				       unsigned int neg_mode,
 				       phy_interface_t interface,
@@ -91,17 +135,46 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 				       bool permit_pause_to_mac)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	bool changed = false, ane = true;
+
+	/* Only configure the advertisement and allow AN in BASE-X mode if
+	 * the core supports TBI/RTBI. AN will be filtered out by via phylink
+	 * and the .pcs_inband_caps() method above.
+	 */
+	if (phy_interface_mode_is_8023z(interface) &&
+	    spcs->support_tbi_rtbi) {
+		ane = neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
+
+		changed = dwmac_integrated_pcs_config_aneg(spcs, interface,
+							   advertising);
+	}
 
-	dwmac_ctrl_ane(spcs->base, 0, 1, spcs->priv->hw->reverse_sgmii_enable);
+	dwmac_ctrl_ane(spcs->base, 0, ane,
+		       spcs->priv->hw->reverse_sgmii_enable);
 
-	return 0;
+	return changed;
+}
+
+static void dwmac_integrated_pcs_an_restart(struct phylink_pcs *pcs)
+{
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	void __iomem *an_control = spcs->base + GMAC_AN_CTRL(0);
+	u32 ctrl;
+
+	/* We can only do AN restart if using TBI/RTBI mode */
+	if (spcs->support_tbi_rtbi) {
+		ctrl = readl(an_control) | GMAC_AN_CTRL_RAN;
+		writel(ctrl, an_control);
+	}
 }
 
 static const struct phylink_pcs_ops dwmac_integrated_pcs_ops = {
+	.pcs_inband_caps = dwmac_integrated_pcs_inband_caps,
 	.pcs_enable = dwmac_integrated_pcs_enable,
 	.pcs_disable = dwmac_integrated_pcs_disable,
 	.pcs_get_state = dwmac_integrated_pcs_get_state,
 	.pcs_config = dwmac_integrated_pcs_config,
+	.pcs_an_restart = dwmac_integrated_pcs_an_restart,
 };
 
 void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
@@ -129,9 +202,18 @@ void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
 int stmmac_integrated_pcs_get_phy_intf_sel(struct phylink_pcs *pcs,
 					   phy_interface_t interface)
 {
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+
 	if (interface == PHY_INTERFACE_MODE_SGMII)
 		return PHY_INTF_SEL_SGMII;
 
+	if (phy_interface_mode_is_8023z(interface)) {
+		if (spcs->support_tbi_rtbi)
+			return PHY_INTF_SEL_TBI;
+		else
+			return PHY_INTF_SEL_SGMII;
+	}
+
 	return -EINVAL;
 }
 
@@ -151,7 +233,20 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv,
 	spcs->int_mask = pcs_info->int_mask;
 	spcs->pcs.ops = &dwmac_integrated_pcs_ops;
 
+	/* If the PCS supports extended status, then it supports BASE-X AN
+	 * with a TBI interface to the SerDes. Otherwise, we can support
+	 * BASE-X without AN using SGMII, which is required for qcom-ethqos.
+	 */
+	if (readl(spcs->base + GMAC_AN_STATUS) & BMSR_ESTATEN)
+		spcs->support_tbi_rtbi = true;
+
 	__set_bit(PHY_INTERFACE_MODE_SGMII, spcs->pcs.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX, spcs->pcs.supported_interfaces);
+
+	/* Only allow 2500BASE-X if the SerDes has support. */
+	if (priv->plat->flags & STMMAC_FLAG_SERDES_SUPPORTS_2500M)
+		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
+			  spcs->pcs.supported_interfaces);
 
 	priv->integrated_pcs = spcs;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 09e609f111b1..b2b12d34b3dd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -41,6 +41,7 @@ struct stmmac_pcs {
 	u32 rgsmii_status_mask;
 	u32 int_mask;
 	struct phylink_pcs pcs;
+	bool support_tbi_rtbi;
 };
 
 static inline struct stmmac_pcs *
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 565bb394b194..5b2bece81448 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -212,6 +212,7 @@ enum dwmac_core_type {
 #define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(12)
 #define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
 #define STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD	BIT(14)
+#define STMMAC_FLAG_SERDES_SUPPORTS_2500M	BIT(15)
 
 struct mac_device_info;
 
-- 
2.47.3


