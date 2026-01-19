Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEA1CCF2F7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIxtW9pHgFoSB9hWlBfDu5uAWfxTZyga1Fv2xaSrx3E=; b=qSLo0H1JzJIHqiWzU30U2obfZ+
	sV8og7f93fLTmm81SJi4+9awda7GG/79etxYjP7xiFW15i8rpAyKLhb7WLsom3DxtISU/+91RAYmH
	5OG+ILHeLAHfPT+PlwWXXxGNkNKprAU8mbqFwispuzF/3nZR6aIVI0oIFG5PF9q5BQPUJWmKpa8bJ
	wGzsgh+sslax/rZDGf0ASH4646z9gThB5LAzkkOdAt+6Xq8+gX/p21CoyUFSqRJWabkvdxYgQQytx
	X77r8wQ6RSGV435TJaUdVI5aWeKBT9tljQcx3BQNPEMXtS+7b5XlYhEyufcsWCb0k4ZX7lBtARGyE
	/QZvaZuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhobW-000000022TT-2vzQ;
	Mon, 19 Jan 2026 12:43:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhobU-000000022SF-1ksX;
	Mon, 19 Jan 2026 12:43:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RIxtW9pHgFoSB9hWlBfDu5uAWfxTZyga1Fv2xaSrx3E=; b=t+ITliaCoeUPZ8eY6voAno2L8Q
	yn8GfIxRXDaaFiIu29f6e3tGIOQP1Mp4ffyH2xmWiOQ97qK+EwVBGhDWASQ3dy1Gdh29QCUiErkF4
	7oKNEy/fcWmMBHJgeUQ77j4+vbGP2oVdLPXZapJM98ulvGw1+trDmCtV4lz0HYaLsO0WNd8nhUbIK
	343hnB9PBSMwcU4scoWxNgz6VnK3OKwyyRUILAWMlQNVIdsCS5TcL/q4+HG4Ha4C5tsAExv5t16vp
	XWkkG1xKC3uu1J85tI+yHih4uJev7KLL7EM7267qUYhrdAx4zj0qc1gxbSKXj9PfayFpG0j3Oy22L
	kQfobhVA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36888 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vhoSy-0000000054y-3iIQ;
	Mon, 19 Jan 2026 12:34:45 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vhoSw-00000005H2T-2oVw;
	Mon, 19 Jan 2026 12:34:42 +0000
In-Reply-To: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk>
References: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 13/14] net: stmmac: configure SGMII AN control
 according to phylink
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vhoSw-00000005H2T-2oVw@rmk-PC.armlinux.org.uk>
Date: Mon, 19 Jan 2026 12:34:42 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_044332_459625_18AFB301 
X-CRM114-Status: GOOD (  10.99  )
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
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 9dd7e78cfbc4..0426f608ebdf 100644
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
@@ -162,8 +163,9 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
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
@@ -180,12 +182,16 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
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


