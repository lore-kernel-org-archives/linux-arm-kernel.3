Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4106CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 09:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZxI4ElVQRDHDwUjNlzEzvtgHXaIDyFC91nvXTxngLA=; b=2FjF0e2cvxMU9iZaUK+3zXAwrT
	wCb6EaYt9Fsu6ibUVCqBryAv3OM5ly9/WltQmqB5Kb9Fcblq+kW2Gw8i79oRxZe1NL8mCclqZogJt
	dCV6ZH4kzr4PJPGKbAkmUOXH2X1oRfmQ5vNR5MVXneszSxN9VYIZsLGivzBgqxFGgtcfyBatZjyFp
	28p97gRhZ5Ptbt4LXEDpyte2rc3h4DEV23HPXjLpVReEdkG8sZtQ6ZTeRJGmN23B+ccomTz9mzIWX
	YgVJrMgs8acN42VgA5gPnEZHJo2h8aUz8kAP8JqfFHzlhb7n+fAgmGATUg1O70nLlMpnBW1Cu9NlB
	izOwEsGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2noD-0000000EhxT-1Q7a;
	Sun, 28 Sep 2025 09:35:09 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2noB-0000000Ehwc-2Jfb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 09:35:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lZxI4ElVQRDHDwUjNlzEzvtgHXaIDyFC91nvXTxngLA=; b=gdUNi+A7vfiFM3CdZ6SL8iWd+E
	M/vDY6RAvRvGEtk/TtKx3F/LKwBNU1qwqngZB4hRcZ/FL1N81QoSTBBJ5f5PLbYaD80tcFdBpd+Dv
	5HIeRlIbg2h+3V3JxtzRunxwBrbtBBoIDBCsWbBrlk2Rex2gh/NGYjI3ILssewggenfUqvQOWFKfn
	KsnYAGLOPTQGAg44aacgShs73pCE3x5XZP0jxhZdbYY4kPAFT58DrrwS1+HQjshCVol3n4xtVEhQ6
	fysj9obdVcATONK5WMrNRflNoHwRfwEyg4WcdZ8QUR8JYjBUlHHrY4yg3JQUl44AKo4bckn5F0rU1
	F2uf7P3w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54368 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v2nay-000000005JU-3JTA;
	Sun, 28 Sep 2025 10:21:29 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v2naw-00000007oKg-0c8B;
	Sun, 28 Sep 2025 10:21:26 +0100
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
Subject: [PATCH RFC net-next v2 16/19] net: stmmac: add support for
 controlling PCS interrupts
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v2naw-00000007oKg-0c8B@rmk-PC.armlinux.org.uk>
Date: Sun, 28 Sep 2025 10:21:26 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_023507_758182_652FB76B 
X-CRM114-Status: GOOD (  16.67  )
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

Add support to the PCS instance for controlling the PCS interrupts
depending on whether the PCS is used.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac1000.h   |  7 +++---
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  | 11 ++++------
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  2 --
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 10 +++------
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 22 ++++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  |  4 +++-
 6 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
index 8f3002d9de78..697bba641e05 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
@@ -38,11 +38,10 @@
 #define	GMAC_INT_DISABLE_PCSAN		BIT(2)
 #define	GMAC_INT_DISABLE_PMT		BIT(3)
 #define	GMAC_INT_DISABLE_TIMESTAMP	BIT(9)
-#define	GMAC_INT_DISABLE_PCS	(GMAC_INT_DISABLE_PCSLINK | \
-				 GMAC_INT_DISABLE_PCSAN)
 #define	GMAC_INT_DEFAULT_MASK	(GMAC_INT_DISABLE_RGMII | \
-				 GMAC_INT_DISABLE_TIMESTAMP | \
-				 GMAC_INT_DISABLE_PCS)
+				 GMAC_INT_DISABLE_PCSLINK | \
+				 GMAC_INT_DISABLE_PCSAN | \
+				 GMAC_INT_DISABLE_TIMESTAMP)
 
 /* PMT Control and Status */
 #define GMAC_PMT		0x0000002c
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 2ca94bfd3f71..a2ae136d2c0e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -27,7 +27,9 @@ static int dwmac1000_pcs_init(struct stmmac_priv *priv)
 	if (!priv->dma_cap.pcs)
 		return 0;
 
-	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE);
+	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE,
+					  GMAC_INT_DISABLE_PCSLINK |
+					  GMAC_INT_DISABLE_PCSAN);
 }
 
 static void dwmac1000_core_init(struct mac_device_info *hw,
@@ -48,12 +50,7 @@ static void dwmac1000_core_init(struct mac_device_info *hw,
 	writel(value | GMAC_CORE_INIT, ioaddr + GMAC_CONTROL);
 
 	/* Mask GMAC interrupts */
-	value = GMAC_INT_DEFAULT_MASK;
-
-	if (hw->pcs)
-		value &= ~GMAC_INT_DISABLE_PCS;
-
-	writel(value, ioaddr + GMAC_INT_MASK);
+	writel(GMAC_INT_DEFAULT_MASK, ioaddr + GMAC_INT_MASK);
 
 #ifdef STMMAC_VLAN_TAG_USED
 	/* Tag detection without filtering */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index 6dd84b6544cc..3cb733781e1e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -106,8 +106,6 @@
 #define GMAC_INT_LPI_EN			BIT(5)
 #define GMAC_INT_TSIE			BIT(12)
 
-#define	GMAC_PCS_IRQ_DEFAULT	(GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE)
-
 #define	GMAC_INT_DEFAULT_ENABLE	(GMAC_INT_PMT_EN | GMAC_INT_LPI_EN | \
 				 GMAC_INT_TSIE)
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 6269407d70cd..a4282fd7c3c7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -27,7 +27,8 @@ static int dwmac4_pcs_init(struct stmmac_priv *priv)
 	if (!priv->dma_cap.pcs)
 		return 0;
 
-	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE);
+	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE,
+					  GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE);
 }
 
 static void dwmac4_core_init(struct mac_device_info *hw,
@@ -46,12 +47,7 @@ static void dwmac4_core_init(struct mac_device_info *hw,
 	writel((clk_rate / 1000000) - 1, ioaddr + GMAC4_MAC_ONEUS_TIC_COUNTER);
 
 	/* Enable GMAC interrupts */
-	value = GMAC_INT_DEFAULT_ENABLE;
-
-	if (hw->pcs)
-		value |= GMAC_PCS_IRQ_DEFAULT;
-
-	writel(value, ioaddr + GMAC_INT_EN);
+	writel(GMAC_INT_DEFAULT_ENABLE, ioaddr + GMAC_INT_EN);
 
 	if (GMAC_INT_DEFAULT_ENABLE & GMAC_INT_TSIE)
 		init_waitqueue_head(&priv->tstamp_busy_wait);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 50ea51d7a1cc..e2f531c11986 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -2,6 +2,22 @@
 #include "stmmac.h"
 #include "stmmac_pcs.h"
 
+static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
+{
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+
+	stmmac_mac_irq_modify(spcs->priv, 0, spcs->int_mask);
+
+	return 0;
+}
+
+static void dwmac_integrated_pcs_disable(struct phylink_pcs *pcs)
+{
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+
+	stmmac_mac_irq_modify(spcs->priv, spcs->int_mask, 0);
+}
+
 static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
 					   unsigned int neg_mode,
 					   struct phylink_link_state *state)
@@ -23,11 +39,14 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 }
 
 static const struct phylink_pcs_ops dwmac_integrated_pcs_ops = {
+	.pcs_enable = dwmac_integrated_pcs_enable,
+	.pcs_disable = dwmac_integrated_pcs_disable,
 	.pcs_get_state = dwmac_integrated_pcs_get_state,
 	.pcs_config = dwmac_integrated_pcs_config,
 };
 
-int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset)
+int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
+			       u32 int_mask)
 {
 	struct stmmac_pcs *spcs;
 
@@ -37,6 +56,7 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset)
 
 	spcs->priv = priv;
 	spcs->base = priv->ioaddr + offset;
+	spcs->int_mask = int_mask;
 	spcs->pcs.ops = &dwmac_integrated_pcs_ops;
 
 	__set_bit(PHY_INTERFACE_MODE_SGMII, spcs->pcs.supported_interfaces);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 64397ac8ecab..cda93894168e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -52,6 +52,7 @@ struct stmmac_priv;
 struct stmmac_pcs {
 	struct stmmac_priv *priv;
 	void __iomem *base;
+	u32 int_mask;
 	struct phylink_pcs pcs;
 };
 
@@ -61,7 +62,8 @@ phylink_pcs_to_stmmac_pcs(struct phylink_pcs *pcs)
 	return container_of(pcs, struct stmmac_pcs, pcs);
 }
 
-int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset);
+int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
+			       u32 int_mask);
 
 /**
  * dwmac_pcs_isr - TBI, RTBI, or SGMII PHY ISR
-- 
2.47.3


