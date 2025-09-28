Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F95FCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 09:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4U+n0+LDpB6o+oYTuhjNX6V+2p2KHQ4b5vR51LIfV4=; b=O/9ppFkiLM8TAgxROJcj9EQg16
	jzjN2P5f5L2NH29CUfMSQif5r+8xlP4hIvxQXG1KoTaQDtZomrVOb3t0sjZpY7jOUWGmcJrlWuWvo
	GzSEVSS5tI/xejEoMezcfB1pCQPI2Xlcds3pfwEn5+ybdhXkJR9T5ch3l2MV1CZqR+pp//L/HzD56
	74KSCxtuTXNG5MH+8TCHF2+4Vm1gziNbn0wSowm/KDiWOoVb2eSI/voQZmW8MJ2IKFdD1t5mPo9Ra
	A0LXavNvk72WP/o02mldkJsarI30tv1fAdYFGOMpHvrkmAwdCJzcaRaVB4kgLoUOm/1/z+0VU/EJe
	Pg3s6YEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2nb4-0000000EcMw-3Hpm;
	Sun, 28 Sep 2025 09:21:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2nb2-0000000EcHw-0y3p
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 09:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=i4U+n0+LDpB6o+oYTuhjNX6V+2p2KHQ4b5vR51LIfV4=; b=FOKnGYzgUH2IAgZXH2iluCx76i
	vLaXGX5xa4MtNBrV04dPkqxBKT7/FDLYyKkMqUiUPjOELZN5FqdFaRhhW6qNWGBml+dDa6aXHsI2D
	U+V3GJ4YsvFw0XtM2x3AOAMNWaDGEcLS3f2wa+p/bSEgKjATDHDte32w6muzWrWtfksBh70HtvcgS
	CvDFlJyAkcS4evUQ6mAdIkLfxAmN+hBcZ+GKNqa6aLQS6jXjp9OEbziNDhKKIPLtGRbaMXYygRMa8
	lGW8NAawQBf41LYmDlg3fSdcwwuYdttLcdUtbiD87MeYBwFkip16augPyc+5w1eqjqi+nS6/N+fQ1
	v7SnzltQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52248 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v2naF-000000005Ge-3PEh;
	Sun, 28 Sep 2025 10:20:44 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v2naA-00000007oDn-2lDN;
	Sun, 28 Sep 2025 10:20:38 +0100
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
Subject: [PATCH RFC net-next v2 07/19] net: stmmac: remove RGMII "pcs" mode
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v2naA-00000007oDn-2lDN@rmk-PC.armlinux.org.uk>
Date: Sun, 28 Sep 2025 10:20:38 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_022132_285612_BC316C37 
X-CRM114-Status: GOOD (  12.93  )
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

Remove the RGMII "pcs" code in stmmac_check_pcs_mode() due to:

1) This should never have been conditional on a PCS being present, as
   when a core is synthesised using only RGMII, the PCS won't be present
   and priv->dma_cap.pcs will be false. Only multi-interface cores which
   have a PCS present would have detected RGMII.

2) STMMAC_PCS_RGMII has no effect since the broken netif_carrier and
   ethtool code was removed.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h      |  1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 14 +++-----------
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 8ff3406cdfbf..6c152be9ff5f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -269,7 +269,6 @@ struct stmmac_safety_stats {
 #define FLOW_AUTO	(FLOW_TX | FLOW_RX)
 
 /* PCS defines */
-#define STMMAC_PCS_RGMII	(1 << 0)
 #define STMMAC_PCS_SGMII	(1 << 1)
 
 #define SF_DMA_MODE 1		/* DMA STORE-AND-FORWARD Operation Mode */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 05eb4b5fbf04..f90742ab68ae 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1087,17 +1087,9 @@ static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 {
 	int interface = priv->plat->phy_interface;
 
-	if (priv->dma_cap.pcs) {
-		if ((interface == PHY_INTERFACE_MODE_RGMII) ||
-		    (interface == PHY_INTERFACE_MODE_RGMII_ID) ||
-		    (interface == PHY_INTERFACE_MODE_RGMII_RXID) ||
-		    (interface == PHY_INTERFACE_MODE_RGMII_TXID)) {
-			netdev_dbg(priv->dev, "PCS RGMII support enabled\n");
-			priv->hw->pcs = STMMAC_PCS_RGMII;
-		} else if (interface == PHY_INTERFACE_MODE_SGMII) {
-			netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
-			priv->hw->pcs = STMMAC_PCS_SGMII;
-		}
+	if (priv->dma_cap.pcs && interface == PHY_INTERFACE_MODE_SGMII) {
+		netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
+		priv->hw->pcs = STMMAC_PCS_SGMII;
 	}
 }
 
-- 
2.47.3


