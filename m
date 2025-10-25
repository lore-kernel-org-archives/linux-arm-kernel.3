Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A23CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 20:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8aiXDtmruNLuZaCIi/8fYIwSLjqO4iwy3QzCz5kzjo4=; b=dNEyXo95qfL3gptNh5deuYaxrz
	OSJ5vHR6k9cPr7CHpNJLAzlxxPA38J7l32B03rEZ4ZbSf1sMlMrsembx4LXpetVSiTcer38rSjPzq
	Wgp5MgZ3IQcUrY6E10UAE/vUjALiBtnUE/uecLbY2WtI2PC43AxvsLS3Yvt1vQYuk4/kOn/GlBSIi
	a2uCWqk3nKZlD4ibj/1A0zwNBowHjZbt89qImtfcUOEap4yh4m0n5mV0H3WwHIHViU29Hp9ZE6hJD
	XUPgWuAEUqnwBFTbv5sxOe7TKy1pRF088L1u6kbUVZDoLUUVOmYhJC8pZ8ULafgjEBB0BQWjzPy3Y
	LdTSxOVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClC7-0000000Bjr6-1XJU;
	Sat, 25 Oct 2025 20:48:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClC5-0000000BjqX-3qUw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 20:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8aiXDtmruNLuZaCIi/8fYIwSLjqO4iwy3QzCz5kzjo4=; b=FuIztaO8IvB0XjyqR0WkDLjZvY
	cwV/8NiXeru5vT643Np0ithshYaHcDD7h2ec5IZSeZn6I4ucB8cRlwbVROLunZ6bceepmr0kv0T/v
	OQnHjlQzprKl9dvX9LZ6cfAy/lHtHnEYghLrVLmhNXLcTgxUBnkaq/vc8IeBnktvcUGFLZNxgGjos
	zbRPhNxNOcQ9l6SRGt9gzMfCnNRnK1tLCeZA5qU49fEsRsFHW8cPDzem5uJa5OOKN2o8+wyqny67u
	5Qj/zBHy2hWMqF5VEPxF5yxAXT8eOnsyjCOhoFHeV+DNmmULMNHYuOMaBFUa9SKDm7zFLqcQRxhHV
	RkTva6/g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36080 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vClBv-000000000Pj-42FT;
	Sat, 25 Oct 2025 21:48:48 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vClBv-0000000BcbP-0Qd1;
	Sat, 25 Oct 2025 21:48:47 +0100
In-Reply-To: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Alexis Lothor__" <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Furong Xu <0x1207@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH net-next 1/3] net: stmmac: configure AN control according to
 phylink
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vClBv-0000000BcbP-0Qd1@rmk-PC.armlinux.org.uk>
Date: Sat, 25 Oct 2025 21:48:47 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_134857_952570_53E03A08 
X-CRM114-Status: GOOD (  12.21  )
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

Provide phylink with the autonegotiation capabilities for this PCS, and
configure the PCS's AN settings according to phylink's requested
requirements.

This may cause regressions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index e2f531c11986..77d38936d898 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -2,6 +2,15 @@
 #include "stmmac.h"
 #include "stmmac_pcs.h"
 
+static unsigned int dwmac_integrated_pcs_inband_caps(struct phylink_pcs *pcs,
+						     phy_interface_t interface)
+{
+	if (interface != PHY_INTERFACE_MODE_SGMII)
+		return 0;
+
+	return LINK_INBAND_ENABLE | LINK_INBAND_DISABLE;
+}
+
 static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
@@ -32,13 +41,23 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 				       bool permit_pause_to_mac)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
-
-	dwmac_ctrl_ane(spcs->base, 0, 1, spcs->priv->hw->reverse_sgmii_enable);
+	void __iomem *an_control = spcs->base + GMAC_AN_CTRL(0);
+	u32 ctrl;
+
+	ctrl = readl(an_control) & ~(GMAC_AN_CTRL_ANE | GMAC_AN_CTRL_SGMRAL);
+	if (spcs->priv->hw->reverse_sgmii_enable)
+		ctrl |= GMAC_AN_CTRL_SGMRAL | GMAC_AN_CTRL_ANE;
+	else if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
+		ctrl |= GMAC_AN_CTRL_ANE;
+	else
+		ctrl |= GMAC_AN_CTRL_SGMRAL;
+	writel(ctrl, an_control);
 
 	return 0;
 }
 
 static const struct phylink_pcs_ops dwmac_integrated_pcs_ops = {
+	.pcs_inband_caps = dwmac_integrated_pcs_inband_caps,
 	.pcs_enable = dwmac_integrated_pcs_enable,
 	.pcs_disable = dwmac_integrated_pcs_disable,
 	.pcs_get_state = dwmac_integrated_pcs_get_state,
-- 
2.47.3


