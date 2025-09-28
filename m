Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F3DCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 09:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8aiXDtmruNLuZaCIi/8fYIwSLjqO4iwy3QzCz5kzjo4=; b=0vor2XCjH9pBsJ2vyHhicjiTKu
	Mc0nZanNOPpZkOWIJwEWjLxsgAsVXeAPRYxWvkh6UuX1S8kuCC/d0n6wEGJdBKjqAV6H5lEZR96Ko
	QYpG+0r3Oll2KnW8vv2tMPXaJW4eqlEyyNwgViok1/B3aBzaMYKP/Og1MZCEdluXBR7GEKaRMkcdT
	ZdlUgZWop0aZzlE+ShlzE9FwB1CZun8Y+Fscni0stfeqLjGzInXMWojgCuv4wg0kbbj4z9E2NY8e2
	eb7ckXOJLbttsjO8FbuEJ78dedqG3adewsCHi1Tu229r29JbhxRwb0UVhGCXdcp4C649b+gjUlSn4
	5B91LaYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2nls-0000000Egke-1KzZ;
	Sun, 28 Sep 2025 09:32:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2nln-0000000EggV-3GcU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 09:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8aiXDtmruNLuZaCIi/8fYIwSLjqO4iwy3QzCz5kzjo4=; b=bTv/Y3x5sDFLdwy2i38rR8j23L
	gTftrZVpkxMuCLpRFxz29VycBHnTyZFK7xgeth/LRwXRmTMDGqn2Fx8VnaCLkOCr6aIBm8Qk47NuR
	ey7CPGUeld48jsqgMKvRh1JhIbIkheLde6NQB/e+LpkySpXNj+bhcTYlEXYuQOevCNdW0MkAUctQa
	iPT5Vjmq3GH2UEw8EPAy6DKKS3tVOJhKz3Mi7Q2TPiKz6SAl9is+gytIsptNqcwH9Tc6yMB8qdeYX
	3Rl6Z8XancNxAM0+WEzdd81aKrF7hjC/ledIs+tpDeLvtr+nK9mkoXTeMRsLGp16g5c9T5iLWPRVK
	6mTJrQeQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39910 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v2nb3-000000005Jp-1GqD;
	Sun, 28 Sep 2025 10:21:33 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v2nb1-00000007oLG-1Cka;
	Sun, 28 Sep 2025 10:21:31 +0100
In-Reply-To: <aNj8U4xPJ0JepmZs@shell.armlinux.org.uk>
References: <aNj8U4xPJ0JepmZs@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	"Alexis Lothor__" <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mateusz Polchlopek <mateusz.polchlopek@intel.com>,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH RFC net-next v2 17/19] net: stmmac: configure AN control
 according to phylink
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v2nb1-00000007oLG-1Cka@rmk-PC.armlinux.org.uk>
Date: Sun, 28 Sep 2025 10:21:31 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_023239_819204_934EEFFC 
X-CRM114-Status: GOOD (  13.03  )
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


