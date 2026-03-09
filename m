Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E302CEFCD99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 11:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3109av5iM3O+VA2C/sAJJXqcf6yd9RkTWGdUatYtVu4=; b=s871tNZui2YJ1wcSVjW5YM6KvG
	zYMZiRsHMTrlJr19Zt3AOA79NYbzr3cwuyWGSB+2SKrrRzuMN5umRoYdwr7T5X9C6tercKvC7GIHn
	YDJDqaM2efoqz2wnmT4WvGyLPp+/rQxDZp9ZqvcoXliYqiVPKvCDZHkiFaBQUu4ib544MjvKPijbc
	OHe9V9w+KnFSP7KwbSTVltr9oPqor+BoWQonZe7sNzY+gPfsPNzqERBJxpXyMm37mS0Rh7t+PHX1q
	v7NPfIrS2qLnp45wGA8uKZGrXCxSR4BjOjW7Gr0SvifMidRXSYrQG/ffNF9Q/0fQhovDVTR15X/2W
	4J19y59Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYfd-00000007B2i-2bnK;
	Mon, 09 Mar 2026 11:21:09 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYfa-00000007Ays-1U0i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 11:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3109av5iM3O+VA2C/sAJJXqcf6yd9RkTWGdUatYtVu4=; b=Fp7pDA/qClwIR8LB2NSmsNJQyA
	KmjbMwkeLbYWZkP8UReXNSA8t06PM1I9gwWIlfAt4emBYsgwSfLpip8Q+UB23/GoHbNIp3CgiE21b
	QrhAnvHB9yU8tECJ/4UFLrREZZwvOrK8FFIKS8p9nMuCe1nGBAXvi34MfV8/FyltuiDi/0SKKgV2Q
	zaHEE3V6hCi1Z6Hq/L1327RIh4e8VSKflUbqvuHu7LkPGKKRDmYPDuQhR/sMb1Xzk8lDAgWbmVPJa
	x97IJr359cqjym5Qkq1660j1SUJuUIIArqXFdzTPgSjqq7EmTQ2A6SrhGftD+A9FF6XZAWbuDywhA
	iHrY6JuQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35288 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vzYfT-000000003hM-1ToA;
	Mon, 09 Mar 2026 11:20:59 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vzYfR-0000000CZz6-3lVI;
	Mon, 09 Mar 2026 11:20:57 +0000
In-Reply-To: <aa6sofjFxyi2nkpr@shell.armlinux.org.uk>
References: <aa6sofjFxyi2nkpr@shell.armlinux.org.uk>
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
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next v3 7/8] net: stmmac: configure SGMII AN control
 according to phylink
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vzYfR-0000000CZz6-3lVI@rmk-PC.armlinux.org.uk>
Date: Mon, 09 Mar 2026 11:20:57 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_042106_396598_8FAE4C0F 
X-CRM114-Status: GOOD (  12.71  )
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
index 5dbb8fd41099..c56765b5aea4 100644
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
 
@@ -135,22 +138,29 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
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


