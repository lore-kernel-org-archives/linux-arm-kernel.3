Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FCDE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 06:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rk5ga+GQCB9o/TyzO8pq7/X1QhYJYsVn4mIFUQWuYAg=; b=CIbjSjvpW+e3qNfZGwsVBycGGE
	0UCT83JF0euJMCrzswh5mNSXjodswgQTIqZDiAerYpv02s3FfCzZhZRk2t1Ga5vhki4x21ZQtd8Sf
	wqHCZR8NRRDr/8wp158MfzrErgU8smOKiKcJLYLXniymrm1Tx9k80HBi5eb6/+VA7WpY//Dj6Plj9
	eTmV/mH7QRr/lHHq/2VnjLtX8/ZIsJme8iLpUbs8O5XRs3qlP2hGTFL1GEAOmRQYFcpF3aOoTQzSJ
	5366GMGV/lkWvsSxg5pnab6ZldidfcnC/Jp5tlgMkTYlqJOPZdugdVz419eTitr4ttD63HzCXDPzV
	NZLilaww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQhZM-0000000FKMg-3UR7;
	Thu, 26 Dec 2024 06:42:04 +0000
Received: from mail-m1973191.qiye.163.com ([220.197.31.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQhRG-0000000FIb2-2zEm;
	Thu, 26 Dec 2024 06:33:44 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6dc51156;
	Thu, 26 Dec 2024 14:33:38 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rfoss@kernel.org,
	vkoul@kernel.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	l.stach@pengutronix.de,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	algea.cao@rock-chips.com,
	kever.yang@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v4 06/17] phy: phy-rockchip-samsung-hdptx: Add the '_MASK' suffix to all registers
Date: Thu, 26 Dec 2024 14:33:02 +0800
Message-Id: <20241226063313.3267515-7-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226063313.3267515-1-damon.ding@rock-chips.com>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhhCGFZPQ0NCSR0eSE5CSR9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9401abb62d03a3kunm6dc51156
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ohg6Hgw5OjIODEwaGTgaK04D
	Fw0KFDZVSlVKTEhOSkJPQ0pCQk9NVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFNSkpPNwY+
DKIM-Signature: a=rsa-sha256;
	b=SBJx2oPx7OPWrkPFcbHx8A6O8kLB2tXOC3KwF268f5EdXZ/dcX8jTIw5Ehhc7efHu3j1zEmEZG71FsGtpFYS4N13d9P6Ne8V79HYAsqE8PlNhofzRkX+nzgD/asM9EBTcdx+k7Su0CQj5CUPvPZkWVSKczefsRze56oFIb5Hk+k=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=rk5ga+GQCB9o/TyzO8pq7/X1QhYJYsVn4mIFUQWuYAg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_223342_953579_1AD10462 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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

Adding the '_MASK' suffix to all registers ensures consistency in the
naming convention for register macros throughout the file.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Split the older patch related to the renaming of registers into three
  different commits
---
 .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 88 +++++++++----------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 2f3c69c7ee31..fae33dfc2733 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -50,60 +50,60 @@
 #define LCPLL_PI_EN_MASK		BIT(5)
 #define LCPLL_100M_CLK_EN_MASK		BIT(0)
 /* CMN_REG(0025) */
-#define LCPLL_PMS_IQDIV_RSTN		BIT(4)
+#define LCPLL_PMS_IQDIV_RSTN_MASK	BIT(4)
 /* CMN_REG(0028) */
-#define LCPLL_SDC_FRAC_EN		BIT(2)
-#define LCPLL_SDC_FRAC_RSTN		BIT(0)
+#define LCPLL_SDC_FRAC_EN_MASK		BIT(2)
+#define LCPLL_SDC_FRAC_RSTN_MASK	BIT(0)
 /* CMN_REG(002d) */
 #define LCPLL_SDC_N_MASK		GENMASK(3, 1)
 /* CMN_REG(002e) */
 #define LCPLL_SDC_NUMBERATOR_MASK	GENMASK(5, 0)
 /* CMN_REG(002f) */
 #define LCPLL_SDC_DENOMINATOR_MASK	GENMASK(7, 2)
-#define LCPLL_SDC_NDIV_RSTN		BIT(0)
+#define LCPLL_SDC_NDIV_RSTN_MASK	BIT(0)
 /* CMN_REG(003d) */
-#define ROPLL_LCVCO_EN			BIT(4)
+#define ROPLL_LCVCO_EN_MASK		BIT(4)
 /* CMN_REG(004e) */
-#define ROPLL_PI_EN			BIT(5)
+#define ROPLL_PI_EN_MASK		BIT(5)
 /* CMN_REG(005c) */
-#define ROPLL_PMS_IQDIV_RSTN		BIT(5)
+#define ROPLL_PMS_IQDIV_RSTN_MASK	BIT(5)
 /* CMN_REG(005e) */
 #define ROPLL_SDM_EN_MASK		BIT(6)
-#define ROPLL_SDM_FRAC_EN_RBR		BIT(3)
-#define ROPLL_SDM_FRAC_EN_HBR		BIT(2)
-#define ROPLL_SDM_FRAC_EN_HBR2		BIT(1)
-#define ROPLL_SDM_FRAC_EN_HBR3		BIT(0)
+#define ROPLL_SDC_FRAC_EN_RBR_MASK	BIT(3)
+#define ROPLL_SDC_FRAC_EN_HBR_MASK	BIT(2)
+#define ROPLL_SDC_FRAC_EN_HBR2_MASK	BIT(1)
+#define ROPLL_SDM_FRAC_EN_HBR3_MASK	BIT(0)
 /* CMN_REG(0064) */
 #define ROPLL_SDM_NUM_SIGN_RBR_MASK	BIT(3)
 /* CMN_REG(0069) */
 #define ROPLL_SDC_N_RBR_MASK		GENMASK(2, 0)
 /* CMN_REG(0074) */
-#define ROPLL_SDC_NDIV_RSTN		BIT(2)
-#define ROPLL_SSC_EN			BIT(0)
+#define ROPLL_SDC_NDIV_RSTN_MASK	BIT(2)
+#define ROPLL_SSC_EN_MASK		BIT(0)
 /* CMN_REG(0081) */
-#define OVRD_PLL_CD_CLK_EN		BIT(8)
-#define ANA_PLL_CD_HSCLK_EAST_EN	BIT(0)
+#define OVRD_PLL_CD_CLK_EN_MASK		BIT(8)
+#define ANA_PLL_CD_HSCLK_EAST_EN_MASK	BIT(0)
 /* CMN_REG(0086) */
 #define PLL_PCG_POSTDIV_SEL_MASK	GENMASK(7, 4)
 #define PLL_PCG_CLK_SEL_MASK		GENMASK(3, 1)
-#define PLL_PCG_CLK_EN			BIT(0)
+#define PLL_PCG_CLK_EN_MASK		BIT(0)
 /* CMN_REG(0087) */
-#define ANA_PLL_FRL_MODE_EN		BIT(3)
-#define ANA_PLL_TX_HS_CLK_EN		BIT(2)
+#define ANA_PLL_FRL_MODE_EN_MASK	BIT(3)
+#define ANA_PLL_TX_HS_CLK_EN_MASK	BIT(2)
 /* CMN_REG(0089) */
-#define LCPLL_ALONE_MODE		BIT(1)
+#define LCPLL_ALONE_MODE_MASK		BIT(1)
 /* CMN_REG(0097) */
-#define DIG_CLK_SEL			BIT(1)
+#define DIG_CLK_SEL_MASK		BIT(1)
 #define LCPLL_REF			BIT(1)
 #define ROPLL_REF			0
 /* CMN_REG(0099) */
-#define CMN_ROPLL_ALONE_MODE		BIT(2)
+#define CMN_ROPLL_ALONE_MODE_MASK	BIT(2)
 #define ROPLL_ALONE_MODE		BIT(2)
 /* CMN_REG(009a) */
-#define HS_SPEED_SEL			BIT(0)
+#define HS_SPEED_SEL_MASK		BIT(0)
 #define DIV_10_CLOCK			BIT(0)
 /* CMN_REG(009b) */
-#define IS_SPEED_SEL			BIT(4)
+#define LS_SPEED_SEL_MASK		BIT(4)
 #define LINK_SYMBOL_CLOCK		BIT(4)
 #define LINK_SYMBOL_CLOCK1_2		0
 
@@ -161,36 +161,36 @@
 #define SB_READY_MASK			BIT(4)
 
 /* LNTOP_REG(0200) */
-#define PROTOCOL_SEL			BIT(2)
+#define PROTOCOL_SEL_MASK		BIT(2)
 #define HDMI_MODE			BIT(2)
 #define HDMI_TMDS_FRL_SEL		BIT(1)
 /* LNTOP_REG(0206) */
-#define DATA_BUS_SEL			BIT(0)
+#define DATA_BUS_WIDTH_SEL_MASK		BIT(0)
 #define DATA_BUS_36_40			BIT(0)
 /* LNTOP_REG(0207) */
-#define LANE_EN				0xf
+#define LANE_EN_MASK			0xf
 #define ALL_LANE_EN			0xf
 
 /* LANE_REG(0312) */
-#define LN0_TX_SER_RATE_SEL_RBR		BIT(5)
-#define LN0_TX_SER_RATE_SEL_HBR		BIT(4)
-#define LN0_TX_SER_RATE_SEL_HBR2	BIT(3)
-#define LN0_TX_SER_RATE_SEL_HBR3	BIT(2)
+#define LN0_TX_SER_RATE_SEL_RBR_MASK	BIT(5)
+#define LN0_TX_SER_RATE_SEL_HBR_MASK	BIT(4)
+#define LN0_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
+#define LN0_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
 /* LANE_REG(0412) */
-#define LN1_TX_SER_RATE_SEL_RBR		BIT(5)
-#define LN1_TX_SER_RATE_SEL_HBR		BIT(4)
-#define LN1_TX_SER_RATE_SEL_HBR2	BIT(3)
-#define LN1_TX_SER_RATE_SEL_HBR3	BIT(2)
+#define LN1_TX_SER_RATE_SEL_RBR_MASK	BIT(5)
+#define LN1_TX_SER_RATE_SEL_HBR_MASK	BIT(4)
+#define LN1_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
+#define LN1_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
 /* LANE_REG(0512) */
-#define LN2_TX_SER_RATE_SEL_RBR		BIT(5)
-#define LN2_TX_SER_RATE_SEL_HBR		BIT(4)
-#define LN2_TX_SER_RATE_SEL_HBR2	BIT(3)
-#define LN2_TX_SER_RATE_SEL_HBR3	BIT(2)
+#define LN2_TX_SER_RATE_SEL_RBR_MASK	BIT(5)
+#define LN2_TX_SER_RATE_SEL_HBR_MASK	BIT(4)
+#define LN2_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
+#define LN2_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
 /* LANE_REG(0612) */
-#define LN3_TX_SER_RATE_SEL_RBR		BIT(5)
-#define LN3_TX_SER_RATE_SEL_HBR		BIT(4)
-#define LN3_TX_SER_RATE_SEL_HBR2	BIT(3)
-#define LN3_TX_SER_RATE_SEL_HBR3	BIT(2)
+#define LN3_TX_SER_RATE_SEL_RBR_MASK	BIT(5)
+#define LN3_TX_SER_RATE_SEL_HBR_MASK	BIT(4)
+#define LN3_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
+#define LN3_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
 
 #define HDMI20_MAX_RATE			600000000
 
@@ -813,8 +813,8 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx,
 	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_POSTDIV_SEL_MASK,
 			   FIELD_PREP(PLL_PCG_POSTDIV_SEL_MASK, cfg->pms_sdiv));
 
-	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_CLK_EN,
-			   PLL_PCG_CLK_EN);
+	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_CLK_EN_MASK,
+			   FIELD_PREP(PLL_PCG_CLK_EN_MASK, 0x1));
 
 	return rk_hdptx_post_enable_pll(hdptx);
 }
-- 
2.34.1


