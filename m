Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F19CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 18:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkzEXKrk7RiVwlShBSl0OJhiBXrJm3zMeL24zlXLNiM=; b=YIl9KnTWV8kqtq6uOJu7RLJpDB
	waYJDYyqiQr9nZOcLQnzM0yIMIWR8u5sjxvnCf9y9u2HzrKyMvukAiZy+vJyjxgC1LzlCEtZg7cYP
	G799yuOhFvoJdVvc17kmxZG8JOtrPx9tYSya1Zfjn0Vw1M7SpHUrQLy0IURqYMLPgdWgq+xyTrXp8
	LJQBfQus/Izyxc0WhNNMGhrR7no+qRuOY0Dz3CwZ9x63utD8Sn8BDzDy+LcnNqwNdZlcNDFKQJUCt
	Pl9Q36BjM13CNyEgnuAYkW4+UVwvqr1Rex9ItbHuIPWqRuCITSlKSrdf27z6YsI7M3t9VRPxu7Mtt
	9MdAKjIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1U77-00000002YfO-2dzJ;
	Wed, 24 Sep 2025 18:21:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1U73-00000002Yaf-2kQe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 18:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PkzEXKrk7RiVwlShBSl0OJhiBXrJm3zMeL24zlXLNiM=; b=Mfsm26WH+2goMZ6MF6TD23QjuC
	M6+OKzAdzbZ9hd7sId7lSAKuUmd2yXcjLgUzfUGcw+YME+5OKD5sNQk8dWQw6/z4NxjvXT+gSwzZh
	ODQd3i/4mY3Ge5Q/rmDWVpt4DLlL+szbntW7U1/MtOJQoVmhAVi0Ca9LDZ39Xy51ESrRqdq6/D7dl
	pOQP9yVaeVZebetULHVWJPAVr+pBAk/SDyCj38OezvImcdLZg+m5C+dIrp6sxtiWSDcs/73yphJsy
	n++Bgn4BR9ETJ5NoYq+QfajdQsqMyPfRe/JLS69mM0+Kq8pQRBcyt6SjVbQLcCWB3U7SxaSw/BZKj
	tFvf0W2w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36578 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v1U6E-0000000012o-0Obf;
	Wed, 24 Sep 2025 19:20:19 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v1U63-00000007HwB-3LuU;
	Wed, 24 Sep 2025 19:20:07 +0100
In-Reply-To: <aNQ1oI0mt3VVcUcF@shell.armlinux.org.uk>
References: <aNQ1oI0mt3VVcUcF@shell.armlinux.org.uk>
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
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
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
Subject: [PATCH RFC net-next 6/9] net: stmmac: remove hw->ps xxx_core_init()
 hardware setup
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v1U63-00000007HwB-3LuU@rmk-PC.armlinux.org.uk>
Date: Wed, 24 Sep 2025 19:20:07 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_112109_859596_F988173F 
X-CRM114-Status: GOOD (  17.27  )
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

After a lot of digging, it seems that the oddly named hw->ps member is
all about configuring the core for reverse SGMII. This member is set to
one of 0, SPEED_10, SPEED_100 or SPEED_1000 depending on
priv->plat->mac_port_sel_speed. On DT systems, this comes from the
"snps,ps-speed" DT property.

When set to a non-zero value, it:

1. Configures the MAC at initialisation time to operate at a specific
   speed. However, this will be overwritten by mac_link_up() when the
   link comes up (e.g. with the fixed-link parameters.)

   Note that dwxgmac2 wants to also support SPEED_2500 and SPEED_10000,
   but both these values are impossible.

2. It _incorrectly_ enables the transmitter (GMAC_CONFIG_TE) which
   makes no sense, rather than enabling the "transmit configuration"
   bit (GMAC_CONFIG_TC). Likely a typo.

3. It configures the SGMII rate adapter layer to retrieve its speed
   setting from the MAC configuration register rather than the PHY.

There are two ways forward here:

a) fixing (2) so that we set GMAC_CONFIG_TC. However, we have platform
   that set the "snps,ps-speed" property and that work today. Fixing
   this will cause the RGMII, SGMII or SMII inband configuration to be
   transmitted, which will be a functional change which could cause a
   regression.

b) ripping out (1) and (2) as they are ineffective. This also has the
   possibility of regressions, but the patch author believes this risk
   is much lower than (a).

Therefore, this commit takes the approach in (b).

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  | 23 +++--------------
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 24 +++---------------
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 25 ++-----------------
 3 files changed, 8 insertions(+), 64 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 5c653be3d453..d35db8958be1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -26,35 +26,18 @@ static void dwmac1000_core_init(struct mac_device_info *hw,
 				struct net_device *dev)
 {
 	void __iomem *ioaddr = hw->pcsr;
-	u32 value = readl(ioaddr + GMAC_CONTROL);
 	int mtu = dev->mtu;
+	u32 value;
 
 	/* Configure GMAC core */
-	value |= GMAC_CORE_INIT;
+	value = readl(ioaddr + GMAC_CONTROL);
 
 	if (mtu > 1500)
 		value |= GMAC_CONTROL_2K;
 	if (mtu > 2000)
 		value |= GMAC_CONTROL_JE;
 
-	if (hw->ps) {
-		value |= GMAC_CONTROL_TE;
-
-		value &= ~hw->link.speed_mask;
-		switch (hw->ps) {
-		case SPEED_1000:
-			value |= hw->link.speed1000;
-			break;
-		case SPEED_100:
-			value |= hw->link.speed100;
-			break;
-		case SPEED_10:
-			value |= hw->link.speed10;
-			break;
-		}
-	}
-
-	writel(value, ioaddr + GMAC_CONTROL);
+	writel(value | GMAC_CORE_INIT, ioaddr + GMAC_CONTROL);
 
 	/* Mask GMAC interrupts */
 	value = GMAC_INT_DEFAULT_MASK;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 21e4461db937..d855ab6b9145 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -27,29 +27,11 @@ static void dwmac4_core_init(struct mac_device_info *hw,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	void __iomem *ioaddr = hw->pcsr;
-	u32 value = readl(ioaddr + GMAC_CONFIG);
 	unsigned long clk_rate;
+	u32 value;
 
-	value |= GMAC_CORE_INIT;
-
-	if (hw->ps) {
-		value |= GMAC_CONFIG_TE;
-
-		value &= hw->link.speed_mask;
-		switch (hw->ps) {
-		case SPEED_1000:
-			value |= hw->link.speed1000;
-			break;
-		case SPEED_100:
-			value |= hw->link.speed100;
-			break;
-		case SPEED_10:
-			value |= hw->link.speed10;
-			break;
-		}
-	}
-
-	writel(value, ioaddr + GMAC_CONFIG);
+	value = readl(ioaddr + GMAC_CONFIG);
+	writel(value | GMAC_CORE_INIT, ioaddr + GMAC_CONFIG);
 
 	/* Configure LPI 1us counter to number of CSR clock ticks in 1us - 1 */
 	clk_rate = clk_get_rate(priv->plat->stmmac_clk);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 00e929bf280b..0430af27da40 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -23,29 +23,8 @@ static void dwxgmac2_core_init(struct mac_device_info *hw,
 	tx = readl(ioaddr + XGMAC_TX_CONFIG);
 	rx = readl(ioaddr + XGMAC_RX_CONFIG);
 
-	tx |= XGMAC_CORE_INIT_TX;
-	rx |= XGMAC_CORE_INIT_RX;
-
-	if (hw->ps) {
-		tx |= XGMAC_CONFIG_TE;
-		tx &= ~hw->link.speed_mask;
-
-		switch (hw->ps) {
-		case SPEED_10000:
-			tx |= hw->link.xgmii.speed10000;
-			break;
-		case SPEED_2500:
-			tx |= hw->link.speed2500;
-			break;
-		case SPEED_1000:
-		default:
-			tx |= hw->link.speed1000;
-			break;
-		}
-	}
-
-	writel(tx, ioaddr + XGMAC_TX_CONFIG);
-	writel(rx, ioaddr + XGMAC_RX_CONFIG);
+	writel(tx | XGMAC_CORE_INIT_TX, ioaddr + XGMAC_TX_CONFIG);
+	writel(rx | XGMAC_CORE_INIT_RX, ioaddr + XGMAC_RX_CONFIG);
 	writel(XGMAC_INT_DEFAULT_EN, ioaddr + XGMAC_INT_EN);
 }
 
-- 
2.47.3


