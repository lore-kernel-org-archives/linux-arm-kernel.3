Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5C3CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 14:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Jl76mOvRJKc/2xXTvxwq45QUJ4bT7prUSyDdd8lphI=; b=agh5gEV2+jz/8y1xwQt8x2aKZZ
	foWm0w9+AEg4OQ3OGEb77nKQQ/RpttFGqGXVqo9l1BIg5KCtxN6HTk0OB1PyFzdfuSRFNVF5s5xTX
	YIaKEXFH+AJHKE+qVk2OzFc1o3NmxKJ+7lKgk/YQG6paSXMkpaxuX7xhOx9ThhP3oUFl4ycSilBcy
	egYdx+tBNVbWuNvA3M86DdLrL6dsEa+UtrEpTeJK+kDG4oEJuSoD4apaUOhv+Nfx7Dgyk5RlJafmY
	dtiwSTWCH5OmQJYUhQYdVLMcfqafnUUkkxELImQdtdPHEpcrDcmIixBl24kMWZwsbdbbyy7AmwP4K
	XHdvcLtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9P7X-000000051dQ-1TBq;
	Thu, 16 Oct 2025 14:38:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9P7V-000000051Zt-0Mgh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 14:38:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9Jl76mOvRJKc/2xXTvxwq45QUJ4bT7prUSyDdd8lphI=; b=WWebn4u/p2i/PkUCo9DYCqluAl
	pSI17FKyYsgmDKjQBm24EosjwU8fg5/4qyfQbYWouzxv0/PTfrx9NABnQWeqR7qhGIdFRYN+q/TpD
	rplIo0JTAJcOTmjalVAIoH4dYU+1IVjRDwMbDuGleKBqKKx3Xg7XDwPTS+Z8/hUKY9wkYyDXn305H
	K5F197v2SnGFJJvjWK5kgDwhH2rn9Bf9XppIkvV986eBlfbaKuL2ttlYDtLu7xBSKNWpfDq/QsAT6
	oKvVylbbQfSQiULUoQoOSpcaheHqpSwGy+vBqan0iE4B65avGuQbDwPg71wkW8Pc6xBO9CVNXasZS
	7+1b3I/Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40660 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v9P6L-000000006Qw-0MkA;
	Thu, 16 Oct 2025 15:37:10 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v9P6I-0000000Aola-3Sih;
	Thu, 16 Oct 2025 15:37:06 +0100
In-Reply-To: <aPECqg0vZGnBFCbh@shell.armlinux.org.uk>
References: <aPECqg0vZGnBFCbh@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>,
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
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
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
Subject: [PATCH net-next v2 05/14] net: stmmac: remove unused PCS loopback
 support
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v9P6I-0000000Aola-3Sih@rmk-PC.armlinux.org.uk>
Date: Thu, 16 Oct 2025 15:37:06 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_073821_280867_1E489AF2 
X-CRM114-Status: GOOD (  14.63  )
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

Nothing calls stmmac_pcs_ctrl_ane() with the "loopback" argument set to
anything except zero, so this serves no useful purpose. Remove the
argument to reduce the code complexity.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c    | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c       | 5 ++---
 drivers/net/ethernet/stmicro/stmmac/hwif.h              | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c       | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h        | 6 +-----
 6 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f62825220cf7..32244217d952 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -622,7 +622,7 @@ static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 
 static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
 {
-	stmmac_pcs_ctrl_ane(priv, enable, 0, 0);
+	stmmac_pcs_ctrl_ane(priv, enable, 0);
 }
 
 /* On interface toggle MAC registers gets reset.
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 654331b411f4..5c653be3d453 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -358,9 +358,9 @@ static void dwmac1000_set_eee_timer(struct mac_device_info *hw, int ls, int tw)
 }
 
 static void dwmac1000_ctrl_ane(struct stmmac_priv *priv, bool ane,
-			       bool srgmi_ral, bool loopback)
+			       bool srgmi_ral)
 {
-	dwmac_ctrl_ane(priv->ioaddr, GMAC_PCS_BASE, ane, srgmi_ral, loopback);
+	dwmac_ctrl_ane(priv->ioaddr, GMAC_PCS_BASE, ane, srgmi_ral);
 }
 
 static void dwmac1000_debug(struct stmmac_priv *priv, void __iomem *ioaddr,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index bff4c371c1d2..21e4461db937 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -583,10 +583,9 @@ static void dwmac4_flow_ctrl(struct mac_device_info *hw, unsigned int duplex,
 	}
 }
 
-static void dwmac4_ctrl_ane(struct stmmac_priv *priv, bool ane, bool srgmi_ral,
-			    bool loopback)
+static void dwmac4_ctrl_ane(struct stmmac_priv *priv, bool ane, bool srgmi_ral)
 {
-	dwmac_ctrl_ane(priv->ioaddr, GMAC_PCS_BASE, ane, srgmi_ral, loopback);
+	dwmac_ctrl_ane(priv->ioaddr, GMAC_PCS_BASE, ane, srgmi_ral);
 }
 
 static int dwmac4_irq_mtl_status(struct stmmac_priv *priv,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 14dbe0685997..7796f5f3c96f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -374,8 +374,8 @@ struct stmmac_ops {
 		      struct stmmac_extra_stats *x, u32 rx_queues,
 		      u32 tx_queues);
 	/* PCS calls */
-	void (*pcs_ctrl_ane)(struct stmmac_priv *priv, bool ane, bool srgmi_ral,
-			     bool loopback);
+	void (*pcs_ctrl_ane)(struct stmmac_priv *priv, bool ane,
+			     bool srgmi_ral);
 	/* Safety Features */
 	int (*safety_feat_config)(void __iomem *ioaddr, unsigned int asp,
 				  struct stmmac_safety_feature_cfg *safety_cfg);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 87a9d36f47a9..6252e30ff82d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3493,7 +3493,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 	}
 
 	if (priv->hw->pcs)
-		stmmac_pcs_ctrl_ane(priv, 1, priv->hw->ps, 0);
+		stmmac_pcs_ctrl_ane(priv, 1, priv->hw->ps);
 
 	/* set TX and RX rings length */
 	stmmac_set_rings_length(priv);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 4a684c97dfae..5778f5b2f313 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -82,13 +82,12 @@ static inline void dwmac_pcs_isr(void __iomem *ioaddr, u32 reg,
  * @reg: Base address of the AN Control Register.
  * @ane: to enable the auto-negotiation
  * @srgmi_ral: to manage MAC-2-MAC SGMII connections.
- * @loopback: to cause the PHY to loopback tx data into rx path.
  * Description: this is the main function to configure the AN control register
  * and init the ANE, select loopback (usually for debugging purpose) and
  * configure SGMII RAL.
  */
 static inline void dwmac_ctrl_ane(void __iomem *ioaddr, u32 reg, bool ane,
-				  bool srgmi_ral, bool loopback)
+				  bool srgmi_ral)
 {
 	u32 value = readl(ioaddr + GMAC_AN_CTRL(reg));
 
@@ -104,9 +103,6 @@ static inline void dwmac_ctrl_ane(void __iomem *ioaddr, u32 reg, bool ane,
 	if (srgmi_ral)
 		value |= GMAC_AN_CTRL_SGMRAL;
 
-	if (loopback)
-		value |= GMAC_AN_CTRL_ELE;
-
 	writel(value, ioaddr + GMAC_AN_CTRL(reg));
 }
 #endif /* __STMMAC_PCS_H__ */
-- 
2.47.3


