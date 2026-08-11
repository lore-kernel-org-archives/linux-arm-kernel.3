Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD5CC5DF61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjgsBciClILu9k2lTLijij9+0L2HRTDsGfDQc8Hzhe4=; b=4Zz9TvxeCevntKUCT7UiOHTtp9
	7suSvSytzbuinsYpBiFq35oIgLMkB5zYu5CiMni39F9djxFc9qit3+nNyqajbEJFKXHqa+5cjpkGv
	D1LmiTAoRQnTf0WW7xButbrnvbREjeQ4cimqv0Rg0Z4vV/IQl9+QHjj6W7c1r2VMhrTLOFW27Yc5i
	iKGW8m6c1B+TFRYxdYhF6p2Tf7nDyRDtk4+MESvzHRzKFa5BXhYb5UyGvBbrIl4JBcVSU3jjqAN8F
	Q65qLjwgTtq3fixF13sl4SDIurvZ5TTsfVyv0K0s1+7FwmJCmG40U4fkJlgu8FZecq3ZjWQQzd5hY
	wosZr67g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtofb-0000000ENHE-1TV5;
	Tue, 11 Aug 2026 15:45:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtofM-0000000EMwo-0mXE;
	Tue, 11 Aug 2026 15:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786463120;
	bh=BtJ1qYvMecA+g1YD2XL0ETRM9ypTDLcGSZMAOcYYXN8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y85c/RZHhxtxMbTjOxu8KCVKc/i8JpVV98PDi+p81tJPVHTt/lEJ2aNO+AamrZHli
	 Yooi+fFMJpi5OQeuveURnuh94sSu3hkdZyhLxt4gZLlyOGfQ8LLVQqlSu7JF0YwKIw
	 1JG409vT425SqDmdIZEfJj0dhooU0lLPYEyKZoPYy212LYM/Il+GRoQyQ4x5dH512l
	 DInLv+Np22y/SfdvZ7DhrCCaDUSP+oAKI8PjIXmu0eZhkOoDFXUqMvflJKu1ScfEax
	 kuviB4mdv9n/kXJ7X+/lGtLAKLrel4+oYXXXJWs9Mf3aztNN4A3Q3TWcbt51LcmDxD
	 Qb8cv1XULCTPA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AF35917E0FC6;
	Tue, 11 Aug 2026 17:45:20 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 11 Aug 2026 18:44:51 +0300
Subject: [PATCH v6 10/10] phy: rockchip: samsung-hdptx: Consistently use
 bitfield macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260811-hdptx-clk-fixes-v6-10-75bca0ee5753@collabora.com>
References: <20260811-hdptx-clk-fixes-v6-0-75bca0ee5753@collabora.com>
In-Reply-To: <20260811-hdptx-clk-fixes-v6-0-75bca0ee5753@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Niederpr=C3=BCm?= <dubito@online.de>, 
 Simon Wright <simon@symple.nz>, Diederik de Haas <diederik@cknow-tech.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_084524_390855_187E5A5A 
X-CRM114-Status: UNSURE (   9.38  )
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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 30 +++++++++++++++--------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index d48a20fef93f..24ed0d7eb6f8 100644
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


