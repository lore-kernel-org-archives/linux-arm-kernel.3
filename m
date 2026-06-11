Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994ACCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 23:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OyqE90H/NkLMQwvYkIzStNIazVNeuq6brmW6Kdp0qA8=; b=UyuXy8csUy9YtYagJ5Y3us3fI3
	o2tw4dT3lq1A0j1IDVgLMvdxxrHd0Fh2VBfkKGBFNaja27vl06U5qWNRNGTvU8G/c0j6r64kS42n/
	C7h8MO0KwS3NR8gX0BOfda2tj10FDK0GWSc5fuALOGpqAdLply42TsE0Dt6xW0NnEouLrd65/GllM
	m4ew0bIYNAl3359t1sxqIzJEHxxNM1RJYvwkjjnnjlsm0HQS10PiBguzHALl9al7lmBoGGxOYw7AJ
	09X0OKshN3e/UhEGNc9qlxEZd1LFnZhLgymy/UciyGFCgFV6RBSkdrfQ2ESqj5BWA5w46+UHPvgsE
	iQuQbluA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXp63-0000000ABa7-2CeI;
	Thu, 11 Jun 2026 23:46:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXp5r-0000000ABMO-3SFz;
	Thu, 11 Jun 2026 23:45:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781221549;
	bh=Xooo68kIzlIgtz0cNlXkI0FPt9/wx2SM5+aEf+SKZ34=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XE+MCopbCYgidp+ClevpN3vnBLnyj/4mvOiT0drTwXCK8bAfL6UwuvDELH4EkpVK+
	 eA/Zl0KRWQ5rwvKHvsQpgXXWsWpiwcEa8v3pYKCcUKZQf8UNAEGDQ1Ddklr09vmCCB
	 5cVCAp9sH+KD5TBV6Q9X8u+Ppu04RH8/H6/b3KayCA7T1Mp2jgAWUDwI8K87sGLdTF
	 MHzsc3pWBfrawnoZuluLH/XbHCsqmpQR6Vk31imLibiA5LZg7OF07/qeGnzJJcXBm5
	 KtrcDyOj6nSCd/1LjkGUtIjZkwHak+YfsBvYJZxNEyjEowI0HsvnzjD5Jo8YjtAMYf
	 eD+COIkDxcB8w==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7ED4617E0CF3;
	Fri, 12 Jun 2026 01:45:49 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 12 Jun 2026 02:45:27 +0300
Subject: [PATCH v4 8/8] phy: rockchip: samsung-hdptx: Consistently use
 bitfield macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260612-hdptx-clk-fixes-v4-8-ce5e1d456cda@collabora.com>
References: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
In-Reply-To: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Niederpr=C3=BCm?= <dubito@online.de>, 
 Simon Wright <simon@symple.nz>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_164552_024656_92A5634F 
X-CRM114-Status: UNSURE (   8.84  )
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
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 30 +++++++++++++++--------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 88b48f5f946d..d8646f24e05e 100644
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
2.54.0


