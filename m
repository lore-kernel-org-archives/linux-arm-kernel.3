Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBEED72368
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZ04tiGBO9MHoDqIsDf1AriL4Nvjkfe1QM7eUJ7Iuw4=; b=d0XQ9ErWBSzLXoqGnQTvrYJNYk
	9I4BstwFY0JX7BcZ2cnsLgVsCCk6KUIKzUMA+1XL5uXlTqzD/EKUtVD0/7hNsLaYoBI7GeQMZRpTX
	xSw6h/wBVH7OPvepDi7YAS8qbAVFKPoDAUoCNhw8AW2ZzjqvPZBGzpyaR3z9F3b9c1al/DGGl7FWK
	j/SFbOvjM1+LaftG22TiXVOalCfHVfw27FqKrdmdHl6IHIMSn/E12XvRKaavrYWxz/Xm4QpqD/Jal
	vZSy6P9HTAXs6kaSF+Fv/BgWIAnjcLPit8gVVwdCgLiA5Z1mkd1o3fgWGcwPPg14p1WuJL1dH6+DZ
	ab6z0f4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDsQ-00000008ddN-2Q3r;
	Fri, 23 Jan 2026 09:54:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDsG-00000008dS0-2DEj;
	Fri, 23 Jan 2026 09:54:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=aZ04tiGBO9MHoDqIsDf1AriL4Nvjkfe1QM7eUJ7Iuw4=; b=cbBx4RZFNNA9GpfA9ZAopBY5S8
	n3hnre6M2QO2+V3NLHNB2JFlplCTFkf5oYRQWUs4s/xZ4BEpptA8wyHKfQ6znzphCGR9XnFjM1o7Q
	0zsh6Y9JTMo8FLeTceJL/X3H6aqqeExLmTUSsXbDkDHS109AcqIWEn+WXrV99kciCOOaMu4uJ4EXY
	N/pA32pydQocAuvPA+wlM2Cv7wSmUd+tx6h8ly/0INWkJ76ri0GeTNQ0ljPZE6from8AGu7uypgh2
	UN/2LOrV4O6TBvv4rv9wf3DSBwsZQPyF/jp41AESZqZrmGn4C7X2sZ9t+jQSICt7oljuqM0Zbtwui
	snHMdXvg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDsD-000000025YL-3MlX;
	Fri, 23 Jan 2026 09:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aZ04tiGBO9MHoDqIsDf1AriL4Nvjkfe1QM7eUJ7Iuw4=; b=pIqNEsBY9IYsCnL6CIPNIZ9IGK
	bebEa+7WcWSbhMuzWwvgNdRb+uFjUWH4bJBJPx9SDlwwdFd8ABRuP9GuOvUM+6WabM1NX5ksgMcXt
	iSNMSNl9+gBJksQTFo0KX/dW8w+M3Z//BJ+fhCSw5usdXxg3q2NmJ4VTEY9ak5jSyuR6MmlyHYDrd
	q6qSiFuMyJMjAc/DGCRERHK65HCTP4pGEq2LPjnX56WDi6aPjZIZ0Dl4LnJk1cdOX5hjJbjxg7HaV
	l0FMTYewqjTaLrSufx8bd1aZlDvOigr8wSezVJByb+dy/4PC0xfjNkH9ibE8t/WO/tLSbx18CrliN
	I9mEp5nA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48728 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vjDrl-000000001cS-0x2W;
	Fri, 23 Jan 2026 09:54:09 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vjDrg-00000005fQp-2epO;
	Fri, 23 Jan 2026 09:54:04 +0000
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
Subject: [PATCH net-next v2 09/14] net: stmmac: add BASE-X support to
 integrated PCS
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vjDrg-00000005fQp-2epO@rmk-PC.armlinux.org.uk>
Date: Fri, 23 Jan 2026 09:54:04 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_095437_922111_1BBED643 
X-CRM114-Status: GOOD (  22.24  )
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

Add support for 1000BASE-X mode to the integrated PCS support if the
PCS supports TBI, and 2500BASE-X if we have a SerDes that supports
this mode.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 95 ++++++++++++++++++-
 1 file changed, 92 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 1644e045cfb3..aae4d6ad9f9b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -17,6 +17,50 @@
 #define GMAC_ANE_LPA	0x0c	/* ANE link partener ability */
 #define GMAC_TBI	0x14	/* TBI extend status */
 
+static enum ethtool_link_mode_bit_indices dwmac_hd_mode_bits[] = {
+	ETHTOOL_LINK_MODE_10baseT_Half_BIT,
+	ETHTOOL_LINK_MODE_100baseT_Half_BIT,
+	ETHTOOL_LINK_MODE_1000baseT_Half_BIT,
+	ETHTOOL_LINK_MODE_100baseFX_Half_BIT,
+	ETHTOOL_LINK_MODE_10baseT1S_Half_BIT,
+	ETHTOOL_LINK_MODE_10baseT1S_P2MP_Half_BIT,
+};
+
+static int dwmac_integrated_pcs_validate(struct phylink_pcs *pcs,
+					 unsigned long *supported,
+					 const struct phylink_link_state *state)
+{
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	size_t i;
+	u32 val;
+
+	if (phy_interface_mode_is_8023z(state->interface)) {
+		/* ESTATUS_1000_XFULL is always set, so full duplex is
+		 * supported. ESTATUS_1000_XHALF depends on core configuration.
+		 */
+		val = readl(spcs->base + GMAC_TBI);
+		if (~val & ESTATUS_1000_XHALF)
+			for (i = 0; i < ARRAY_SIZE(dwmac_hd_mode_bits); i++)
+				linkmode_clear_bit(dwmac_hd_mode_bits[i],
+						   supported);
+
+		return 0;
+	} else if (state->interface == PHY_INTERFACE_MODE_SGMII) {
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static unsigned int dwmac_integrated_pcs_inband_caps(struct phylink_pcs *pcs,
+						     phy_interface_t interface)
+{
+	if (phy_interface_mode_is_8023z(interface))
+		return LINK_INBAND_ENABLE | LINK_INBAND_DISABLE;
+
+	return 0;
+}
+
 static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
@@ -54,7 +98,23 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
 					   unsigned int neg_mode,
 					   struct phylink_link_state *state)
 {
-	state->link = false;
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	u32 status, lpa;
+
+	status = readl(spcs->base + GMAC_AN_STATUS);
+
+	if (phy_interface_mode_is_8023z(state->interface)) {
+		/* For 802.3z modes, the PCS block supports the advertisement
+		 * and link partner advertisement registers using standard
+		 * 802.3 format. The status register also has the link status
+		 * and AN complete bits in the same bit location.
+		 */
+		lpa = readl(spcs->base + GMAC_ANE_LPA);
+
+		phylink_mii_c22_pcs_decode_state(state, neg_mode, status, lpa);
+	} else {
+		state->link = false;
+	}
 }
 
 static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
@@ -64,6 +124,8 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 				       bool permit_pause_to_mac)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	bool changed = false, ane = true;
+	u32 adv;
 	int ret;
 
 	if (spcs->interface != interface) {
@@ -74,12 +136,25 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 		spcs->interface = interface;
 	}
 
-	dwmac_ctrl_ane(spcs->base, 0, 1, spcs->priv->hw->reverse_sgmii_enable);
+	if (phy_interface_mode_is_8023z(interface)) {
+		adv = phylink_mii_c22_pcs_encode_advertisement(interface,
+							       advertising);
+		if (readl(spcs->base + GMAC_ANE_ADV) != adv)
+			changed = true;
+		writel(adv, spcs->base + GMAC_ANE_ADV);
 
-	return 0;
+		ane = neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
+	}
+
+	dwmac_ctrl_ane(spcs->base, 0, ane,
+		       spcs->priv->hw->reverse_sgmii_enable);
+
+	return changed;
 }
 
 static const struct phylink_pcs_ops dwmac_integrated_pcs_ops = {
+	.pcs_validate = dwmac_integrated_pcs_validate,
+	.pcs_inband_caps = dwmac_integrated_pcs_inband_caps,
 	.pcs_enable = dwmac_integrated_pcs_enable,
 	.pcs_disable = dwmac_integrated_pcs_disable,
 	.pcs_get_state = dwmac_integrated_pcs_get_state,
@@ -114,6 +189,9 @@ int stmmac_integrated_pcs_get_phy_intf_sel(struct stmmac_priv *priv,
 	if (interface == PHY_INTERFACE_MODE_SGMII)
 		return PHY_INTF_SEL_SGMII;
 
+	if (phy_interface_mode_is_8023z(interface))
+		return PHY_INTF_SEL_TBI;
+
 	return -EINVAL;
 }
 
@@ -142,6 +220,17 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
 
 	__set_bit(PHY_INTERFACE_MODE_SGMII, spcs->pcs.supported_interfaces);
 
+	if (readl(spcs->base + GMAC_AN_STATUS) & BMSR_ESTATEN) {
+		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
+			  spcs->pcs.supported_interfaces);
+
+		/* Only allow 2500Base-X if the SerDes has support. */
+		ret = dwmac_serdes_validate(priv, PHY_INTERFACE_MODE_2500BASEX);
+		if (ret == 0)
+			__set_bit(PHY_INTERFACE_MODE_2500BASEX,
+				  spcs->pcs.supported_interfaces);
+	}
+
 	priv->integrated_pcs = spcs;
 
 	return 0;
-- 
2.47.3


