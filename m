Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5003FCEE8F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 11:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpVZHAyEJ8psaVdJL6ep6frfkNeyqoUFSmGxnRhF8MY=; b=QnKU2/Lotb3txqzhtcX9boKVRk
	Mnf/2m24rlybjhRTpC7WeQEPDBReC8+yA7c+SBVbhbDWl5XL7kjGB2pXau4fczk3HsoPdfrS9Zy1h
	93heG+xUq0xKnS/I5vVDQGq4K9s4n9nIhiogYHhxxmSYREuncFbLqMkQm2R39yKiCI/SKNe2IiO0A
	4/fJ93zGRL3qBA4p3TtFyq5z5/cpRP0gaQbRKgVLYLfKTY7XHQedFu77MfYhjNF1viNYwp/zgn5B0
	o/4Se7q/qPuUpaB69vO//biYxJ3lKseqKpmldW8AT/UGipbPkYSv2ShqfYXUX/N4hgpbTE7cIBxwp
	cVDbVjhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDKF-00000003wOb-2PQZ;
	Wed, 25 Feb 2026 11:45:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDKC-00000003wK1-2F4h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 11:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QpVZHAyEJ8psaVdJL6ep6frfkNeyqoUFSmGxnRhF8MY=; b=aH6+LQYkbJoDTSx+d/kuzMpeVi
	h8ZfigL/DNeK8Xo4vP00UST0ZviXDe8AXot4TCvfdACepw3Hs1ic8m7PYYjETDBZQTbv2HzCuNpCQ
	r2vEey5ZE8BVv1OBdcWSLYwU3oI+B1BFBKvzBkUTGU2KWtVJgCWKWYdPfyjTqOEf2nv4RyOqjUP0S
	+ebB14hm046GMTQ76XOcBWDCiY5Badvdk76BWu6KjOoahG3PRNMfrEBqXx/10+v2Wqqu9HL5ffFtR
	+XwRedI8ESEWuWkUsCBOrDGxOAlm7oUd+F3u5lUPFdYHZuTqdKUweyfFhbXQUQeHNe3HYDlqBc4hQ
	u261Dsrg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44856 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvDK5-000000006ae-0J6W;
	Wed, 25 Feb 2026 11:44:57 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvDK3-0000000Arhk-1Ubd;
	Wed, 25 Feb 2026 11:44:55 +0000
In-Reply-To: <aZ7ggfQanc8jeCb9@shell.armlinux.org.uk>
References: <aZ7ggfQanc8jeCb9@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH RFC net-next 6/7] net: stmmac: configure SGMII AN control
 according to phylink
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvDK3-0000000Arhk-1Ubd@rmk-PC.armlinux.org.uk>
Date: Wed, 25 Feb 2026 11:44:55 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_034504_576463_65607A47 
X-CRM114-Status: GOOD (  12.68  )
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
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 24 +++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index ba0cf51e67f7..0f9616fad4ef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -32,6 +32,9 @@ static unsigned int dwmac_integrated_pcs_inband_caps(struct phylink_pcs *pcs,
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
 	unsigned int ib_caps;
 
+	if (interface == PHY_INTERFACE_MODE_SGMII)
+		return LINK_INBAND_ENABLE | LINK_INBAND_DISABLE;
+
 	if (phy_interface_mode_is_8023z(interface)) {
 		ib_caps = LINK_INBAND_DISABLE;
 
@@ -139,22 +142,29 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 				       bool permit_pause_to_mac)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
-	bool changed = false, ane = true;
+	void __iomem *an_control = spcs->base + GMAC_AN_CTRL(0);
+	bool ane, changed = false;
+	u32 ctrl;
+
+	ane = neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
 
 	/* Only configure the advertisement and allow AN in BASE-X mode if
 	 * the core supports TBI/RTBI. AN will be filtered out by via phylink
 	 * and the .pcs_inband_caps() method above.
 	 */
 	if (phy_interface_mode_is_8023z(interface) &&
-	    spcs->support_tbi_rtbi) {
-		ane = neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
-
+	    spcs->support_tbi_rtbi)
 		changed = dwmac_integrated_pcs_config_aneg(spcs, interface,
 							   advertising);
-	}
 
-	dwmac_ctrl_ane(spcs->base, 0, ane,
-		       spcs->priv->hw->reverse_sgmii_enable);
+	ctrl = readl(an_control) & ~(GMAC_AN_CTRL_ANE | GMAC_AN_CTRL_SGMRAL);
+	if (spcs->priv->hw->reverse_sgmii_enable)
+		ctrl |= GMAC_AN_CTRL_SGMRAL | GMAC_AN_CTRL_ANE;
+	else if (ane)
+		ctrl |= GMAC_AN_CTRL_ANE;
+	else
+		ctrl |= GMAC_AN_CTRL_SGMRAL;
+	writel(ctrl, an_control);
 
 	return changed;
 }
-- 
2.47.3


