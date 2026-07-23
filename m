Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE73C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 19:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMrrgx4U80B2kEGYMamePgQd/hmzk7ch9R//+JsttTc=; b=A7ajhODdQHkyi0efu7ZBVWFoHm
	SuZJIHVR2PZOPmhZFsVJa7OZeVuUs9v4/LVzoMhC6M2qP26WZ1OTNnNb+HPW5HM0kPIfHpfnfRFm/
	77DnvEZcwZSqBqnuINNlD3NAgQNMh6zHvRPsaQBw1uos9G8A6Sbh1Gyq0cOBlNrZylXKoDlbKhA6g
	9S8BhAVRhxO4qeTbecNHIzGNhj7ESW8fv/z1gbJ52tgicjOLXDKNRV31VdBhLQTOMIjmCawLq9f0b
	Qu/lg6OwKHgdEUdTFpDIoYvMoV3i9D1ZgLnLLObMBh9va6LJ2y4Zw6yYWeIWHMkwlhNc/L7wBeuZN
	SUBZDQ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzJe-0000000EzVZ-2IQc;
	Thu, 23 Jul 2026 19:42:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzIq-0000000Eyle-0sYL;
	Thu, 23 Jul 2026 19:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784835714;
	bh=PRfBlmThak5T5U5tff8nKvBvXtDEt75yF8aVu8TNhxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fbJm7lYNVdJ3myoilWECaTpq3MiW80JA/mf1jA18jNlW2ZSS9YxCC5XwA5rzz8qkN
	 t77gp+bamATnKtYDMjO/hssvZKuvUMuf1xi4EPjSCIsVCuBvdg/Kfkn4VVx08Jhcoi
	 4ao6Fgy7Gv9c6v6OC3Zd/u10unRoCaLAeGNZsKttNNC+iW8118aWzmheRkqfcG3vso
	 +kOT5cTwNS0HbIc/QgxJZn9twxiVNW185Il+cCRFfGAGsJs9mLBXYdV5wrkINCweJb
	 6ZvDsBF/FeY/flhrCLA0QMd2wUl5kkT1PnLOLCS9Heek24oNDeJALylm7TCMQ4fKr/
	 +Vc76+/WsHtFg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2271F17E371F;
	Thu, 23 Jul 2026 21:41:54 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 22:41:53 +0300
Subject: [PATCH v5 10/10] phy: rockchip: samsung-hdptx: Consistently use
 bitfield macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260723-hdptx-clk-fixes-v5-10-8e786067865f@collabora.com>
References: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
In-Reply-To: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Niederpr=C3=BCm?= <dubito@online.de>, 
 Simon Wright <simon@symple.nz>, Diederik de Haas <diederik@cknow-tech.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_124156_436983_1D2C6C78 
X-CRM114-Status: UNSURE (   8.94  )
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

Make the code more robust and improve readability by using the available
bitfield macros (e.g. FIELD_PREP, FIELD_GET) whenever possible, instead
of open coding the related bit operations.

Tested-by: Thomas Niederprüm <dubito@online.de>
Tested-by: Simon Wright <simon@symple.nz>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 30 +++++++++++++++--------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 03977b830414..aa0e36260381 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -53,6 +53,12 @@
 /* CMN_REG(001e) */
 #define LCPLL_PI_EN_MASK		BIT(5)
 #define LCPLL_100M_CLK_EN_MASK		BIT(0)
+/* CMN_REG(0022) */
+#define ANA_LCPLL_PMS_PDIV_MASK		GENMASK(7, 4)
+#define ANA_LCPLL_PMS_REFDIV_MASK	GENMASK(3, 0)
+/* CMN_REG(0023) */
+#define LCPLL_PMS_SDIV_RBR_MASK		GENMASK(7, 4)
+#define LCPLL_PMS_SDIV_HBR_MASK		GENMASK(3, 0)
 /* CMN_REG(0025) */
 #define LCPLL_PMS_IQDIV_RSTN_MASK	BIT(4)
 /* CMN_REG(0028) */
@@ -1157,9 +1163,11 @@ static int rk_hdptx_frl_lcpll_cmn_config(struct rk_hdptx_phy *hdptx)
 	regmap_write(hdptx->regmap, CMN_REG(0020), cfg->pms_mdiv);
 	regmap_write(hdptx->regmap, CMN_REG(0021), cfg->pms_mdiv_afc);
 	regmap_write(hdptx->regmap, CMN_REG(0022),
-		     (cfg->pms_pdiv << 4) | cfg->pms_refdiv);
+		     FIELD_PREP(ANA_LCPLL_PMS_PDIV_MASK, cfg->pms_pdiv) |
+		     FIELD_PREP(ANA_LCPLL_PMS_REFDIV_MASK, cfg->pms_refdiv));
 	regmap_write(hdptx->regmap, CMN_REG(0023),
-		     (cfg->pms_sdiv << 4) | cfg->pms_sdiv);
+		     FIELD_PREP(LCPLL_PMS_SDIV_RBR_MASK, cfg->pms_sdiv) |
+		     FIELD_PREP(LCPLL_PMS_SDIV_HBR_MASK, cfg->pms_sdiv));
 	regmap_write(hdptx->regmap, CMN_REG(002a), cfg->sdm_deno);
 	regmap_write(hdptx->regmap, CMN_REG(002b), cfg->sdm_num_sign);
 	regmap_write(hdptx->regmap, CMN_REG(002c), cfg->sdm_num);
@@ -1229,8 +1237,10 @@ static int rk_hdptx_tmds_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
 	regmap_write(hdptx->regmap, CMN_REG(0051), cfg->pms_mdiv);
 	regmap_write(hdptx->regmap, CMN_REG(0055), cfg->pms_mdiv_afc);
 	regmap_write(hdptx->regmap, CMN_REG(0059),
-		     (cfg->pms_pdiv << 4) | cfg->pms_refdiv);
-	regmap_write(hdptx->regmap, CMN_REG(005a), cfg->pms_sdiv << 4);
+		     FIELD_PREP(ANA_ROPLL_PMS_PDIV_MASK, cfg->pms_pdiv) |
+		     FIELD_PREP(ANA_ROPLL_PMS_REFDIV_MASK, cfg->pms_refdiv));
+	regmap_write(hdptx->regmap, CMN_REG(005a),
+		     FIELD_PREP(ROPLL_PMS_SDIV_RBR_MASK, cfg->pms_sdiv));
 
 	regmap_update_bits(hdptx->regmap, CMN_REG(005e), ROPLL_SDM_EN_MASK,
 			   FIELD_PREP(ROPLL_SDM_EN_MASK, cfg->sdm_en));
@@ -2177,7 +2187,7 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
 		ret = regmap_read(hdptx->regmap, CMN_REG(0023), &val);
 		if (ret)
 			return 0;
-		lcpll_hw.pms_sdiv = val & 0xf;
+		lcpll_hw.pms_sdiv = FIELD_GET(LCPLL_PMS_SDIV_HBR_MASK, val);
 
 		ret = regmap_read(hdptx->regmap, CMN_REG(002B), &val);
 		if (ret)
@@ -2197,7 +2207,7 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
 		ret = regmap_read(hdptx->regmap, CMN_REG(002D), &val);
 		if (ret)
 			return 0;
-		lcpll_hw.sdc_n = (val & LCPLL_SDC_N_MASK) >> 1;
+		lcpll_hw.sdc_n = FIELD_GET(LCPLL_SDC_N_MASK, val);
 
 		ret = regmap_read(hdptx->grf, GRF_HDPTX_CON0, &val);
 		if (ret)
@@ -2238,12 +2248,12 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
 	ret = regmap_read(hdptx->regmap, CMN_REG(005E), &val);
 	if (ret)
 		return 0;
-	ropll_hw.sdm_en = val & ROPLL_SDM_EN_MASK;
+	ropll_hw.sdm_en = FIELD_GET(ROPLL_SDM_EN_MASK, val);
 
 	ret = regmap_read(hdptx->regmap, CMN_REG(0064), &val);
 	if (ret)
 		return 0;
-	ropll_hw.sdm_num_sign = val & ROPLL_SDM_NUM_SIGN_RBR_MASK;
+	ropll_hw.sdm_num_sign = FIELD_GET(ROPLL_SDM_NUM_SIGN_RBR_MASK, val);
 
 	ret = regmap_read(hdptx->regmap, CMN_REG(0065), &val);
 	if (ret)
@@ -2258,7 +2268,7 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
 	ret = regmap_read(hdptx->regmap, CMN_REG(0069), &val);
 	if (ret)
 		return 0;
-	ropll_hw.sdc_n = (val & ROPLL_SDC_N_RBR_MASK) + 3;
+	ropll_hw.sdc_n = FIELD_GET(ROPLL_SDC_N_RBR_MASK, val) + 3;
 
 	ret = regmap_read(hdptx->regmap, CMN_REG(006c), &val);
 	if (ret)
@@ -2273,7 +2283,7 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
 	ret = regmap_read(hdptx->regmap, CMN_REG(0086), &val);
 	if (ret)
 		return 0;
-	ropll_hw.pms_sdiv = ((val & PLL_PCG_POSTDIV_SEL_MASK) >> 4) + 1;
+	ropll_hw.pms_sdiv = FIELD_GET(PLL_PCG_POSTDIV_SEL_MASK, val) + 1;
 	bpc = (FIELD_GET(PLL_PCG_CLK_SEL_MASK, val) << 1) + 8;
 
 	fout = PLL_REF_CLK * ropll_hw.pms_mdiv;

-- 
2.55.0


