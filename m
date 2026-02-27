Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE1CFEFB51
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 20:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRKM7ymRqdgOLQWcGXTK2S1ZGePKgGUtiANnxA/XBPY=; b=TqFYyWJ9dAXKEk6sQOkYf5LF+d
	LWh47CyKjt+dh/i2nqiVl2pirvtl9xDiaW/40bqtrbk7YPHlwr42oM3Giglth+Xyb+Yv6dA1g5Ixa
	nCR4pu7IqfdXLeab/gDe+2FuAjFT8acb0LvxysfPXmbs6qlYi0yrxGBckqoHKCe1OCjRZTS7ff1Ma
	gOO2qw0j4mMcm5uj6B//BQnHhYSuEhhHqaedIWglBHtdlA+Wz/cLFcVFuPCH4pM4bgPKPWLeZtgz5
	Jwgt6R1tSbHvoJH6fdew86xNKaxIX8vAW4gm7MPeOoyfvfn6Kma+9/yiNhD5sYWBKiujpB7RwcMcq
	8+kxn2jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw4lw-000000098mo-2GVZ;
	Fri, 27 Feb 2026 20:49:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw4lg-000000098bG-2cGc;
	Fri, 27 Feb 2026 20:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772225336;
	bh=/sK6i9vVoJoj489C/nqwbfyHVN9JnqcxydzdEsQFnNM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bIOaJhXeoTV33St7mSU68XlnDmEHBpbH1ToVFoNE9jFThwIWZa7UZ/CfoA6IxFGXY
	 474SVBIuZTqJ6EemCNODH+VoxOHO1X0IgLOFyw1uG720MO6ruqEmm02rVThASZVPPs
	 i2F6yZ69YHDZCSBP+Bcq/PoLOdx21UT0IpRLaU/R8yVHDaVLrjsxZOa36CKfrYQgGL
	 enJYd9C3VjeLhucHoh/Ont5TtLh/LblK2mqzarAIvfhdZGtQMRW+/26YJiKowKSNgz
	 LVMV8gR3QzfGa+CynDk6flnBDUkLT2X8s8w0xueVyblgmlrjk4cnkHitsZwaFV4UcH
	 QAzQQ/tVOC+ww==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B7B0B17E107E;
	Fri, 27 Feb 2026 21:48:56 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 27 Feb 2026 22:48:50 +0200
Subject: [PATCH 6/6] phy: rockchip: samsung-hdptx: Consistently use
 bitfield macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-hdptx-clk-fixes-v1-6-f998f2762d0f@collabora.com>
References: <20260227-hdptx-clk-fixes-v1-0-f998f2762d0f@collabora.com>
In-Reply-To: <20260227-hdptx-clk-fixes-v1-0-f998f2762d0f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_124900_817021_ED0EA74F 
X-CRM114-Status: GOOD (  11.29  )
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

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index baa6916331be..3bde7fbb34b1 100644
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
@@ -2192,7 +2202,7 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
 		ret = regmap_read(hdptx->regmap, CMN_REG(002D), &val);
 		if (ret)
 			return 0;
-		lcpll_hw.sdc_n = (val & LCPLL_SDC_N_MASK) >> 1;
+		lcpll_hw.sdc_n = FIELD_GET(LCPLL_SDC_N_MASK, val);
 
 		for (i = 0; i < ARRAY_SIZE(rk_hdptx_frl_lcpll_cfg); i++) {
 			const struct lcpll_config *cfg = &rk_hdptx_frl_lcpll_cfg[i];
@@ -2253,7 +2263,7 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
 	ret = regmap_read(hdptx->regmap, CMN_REG(0086), &val);
 	if (ret)
 		return 0;
-	ropll_hw.pms_sdiv = ((val & PLL_PCG_POSTDIV_SEL_MASK) >> 4) + 1;
+	ropll_hw.pms_sdiv = FIELD_GET(PLL_PCG_POSTDIV_SEL_MASK, val) + 1;
 	bpc = (FIELD_GET(PLL_PCG_CLK_SEL_MASK, val) << 1) + 8;
 
 	fout = PLL_REF_CLK * ropll_hw.pms_mdiv;

-- 
2.52.0


