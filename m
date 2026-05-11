Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C2DCD484C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 18:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QwKg5HreB23GFs4WLGKOtHSkEb4h2U09KQJZE7A5dAU=; b=G7DsWgxzS9qkPgZ6flYWTgIG0y
	4RIxpKAFYJDgLyhEMROgWjtMoY2U/Ew5Xjmj6sEpxr5fmhPFTQmzn0DVGbycF/Z5BH5frLNmAF1Gm
	HiRjSYBlbnSw6E3kMcSgMuqlc433H6c0fPu+Emf4mOLg1w90LWHG/B8AXKAtflZEwJdt+bKbyKMHn
	6aoswcBbK9BmJSAoUMqDKxC1JXRTfJ1N+/0EsMJVhUvJTCbtVw+Rl5xcJ34FYo11xUdfayHFHDu42
	11q3XNxh7A0B0YjrWjaOT93jbMIS/8ORUlFMXwJ18tYCb+Y5CvRFKRxa6WR/I/vK+v84eqKRi85p+
	uJ+ZB/Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVG8-0000000EU9m-1rLn;
	Mon, 11 May 2026 18:21:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVFx-0000000ETt5-2Yfn;
	Mon, 11 May 2026 18:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778523684;
	bh=2+sgKNxD5wCbdSC8oKfH4aW5mHtiqmGEwhtUygFiL8E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OuhqeZqz1D5CIPaNnGruY0ddOozZz9iF2PXm0UVbq//+Tc8yvNT1UHomtLUhWqgAg
	 YO5NlVeIcMfxuplNhKO+8qjPQqXcWNTkmruAjlC4koxdf8nDSGUtHfSyinsSJv1ek8
	 xnZ0ckL2lbbRg7L9PLoUMJaGchh5k9ABa7DKjH6ofqnTTrRR+NsbIFKQgBOOpAHD/u
	 k+UrWO8PHl+dpzjIreZILIAtcwLE2ao7c4DLI/BwNVy/0tcnvjCYRJPFnXASGsjoYo
	 5oKlTPr6645v69kxa5sCJZ6cvaH7okztMAFM99uuwo3/8nuveZy2iRr4fX1REF0uQc
	 kr027zN+MGOLw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A5FC017E155E;
	Mon, 11 May 2026 20:21:24 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 11 May 2026 21:21:19 +0300
Subject: [PATCH v2 5/6] phy: rockchip: samsung-hdptx: Simplify GRF access
 with FIELD_PREP_WM16()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260511-hdptx-clk-fixes-v2-5-664e41379cab@collabora.com>
References: <20260511-hdptx-clk-fixes-v2-0-664e41379cab@collabora.com>
In-Reply-To: <20260511-hdptx-clk-fixes-v2-0-664e41379cab@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Niederpr=C3=BCm?= <dubito@online.de>, 
 Simon Wright <simon@symple.nz>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_112130_001540_896CB63F 
X-CRM114-Status: GOOD (  10.74  )
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

The 16 most significant bits of the general-purpose register (GRF) are
used as a write-enable mask for the remaining 16 bits.

Make use of the recently introduced FIELD_PREP_WM16() macro to avoid
open-coding the bit shift operations and improve code readability.

Tested-by: Thomas Niederprüm <dubito@online.de>
Tested-by: Simon Wright <simon@symple.nz>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 52 +++++++++++------------
 1 file changed, 25 insertions(+), 27 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 5c3a9b4b1737..611425e44b26 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (c) 2021-2022 Rockchip Electronics Co., Ltd.
- * Copyright (c) 2024 Collabora Ltd.
+ * Copyright (c) 2024-2026 Collabora Ltd.
  *
  * Author: Algea Cao <algea.cao@rock-chips.com>
  * Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
+#include <linux/hw_bitfield.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -949,7 +950,9 @@ static void rk_hdptx_pre_power_up(struct rk_hdptx_phy *hdptx)
 	reset_control_assert(hdptx->rsts[RST_CMN].rstc);
 	reset_control_assert(hdptx->rsts[RST_INIT].rstc);
 
-	val = (HDPTX_I_PLL_EN | HDPTX_I_BIAS_EN | HDPTX_I_BGR_EN) << 16;
+	val = (FIELD_PREP_WM16(HDPTX_I_PLL_EN, 0) |
+	       FIELD_PREP_WM16(HDPTX_I_BIAS_EN, 0) |
+	       FIELD_PREP_WM16(HDPTX_I_BGR_EN, 0));
 	regmap_write(hdptx->grf, GRF_HDPTX_CON0, val);
 }
 
@@ -960,8 +963,8 @@ static int rk_hdptx_post_enable_lane(struct rk_hdptx_phy *hdptx)
 
 	reset_control_deassert(hdptx->rsts[RST_LANE].rstc);
 
-	val = (HDPTX_I_BIAS_EN | HDPTX_I_BGR_EN) << 16 |
-	       HDPTX_I_BIAS_EN | HDPTX_I_BGR_EN;
+	val = (FIELD_PREP_WM16(HDPTX_I_BIAS_EN, 1) |
+	       FIELD_PREP_WM16(HDPTX_I_BGR_EN, 1));
 	regmap_write(hdptx->grf, GRF_HDPTX_CON0, val);
 
 	/* 3 lanes FRL mode */
@@ -990,16 +993,15 @@ static int rk_hdptx_post_enable_pll(struct rk_hdptx_phy *hdptx)
 	u32 val;
 	int ret;
 
-	val = (HDPTX_I_BIAS_EN | HDPTX_I_BGR_EN) << 16 |
-	       HDPTX_I_BIAS_EN | HDPTX_I_BGR_EN;
+	val = (FIELD_PREP_WM16(HDPTX_I_BIAS_EN, 1) |
+	       FIELD_PREP_WM16(HDPTX_I_BGR_EN, 1));
 	regmap_write(hdptx->grf, GRF_HDPTX_CON0, val);
 
 	usleep_range(10, 15);
 	reset_control_deassert(hdptx->rsts[RST_INIT].rstc);
 
 	usleep_range(10, 15);
-	val = HDPTX_I_PLL_EN << 16 | HDPTX_I_PLL_EN;
-	regmap_write(hdptx->grf, GRF_HDPTX_CON0, val);
+	regmap_write(hdptx->grf, GRF_HDPTX_CON0, FIELD_PREP_WM16(HDPTX_I_PLL_EN, 1));
 
 	usleep_range(10, 15);
 	reset_control_deassert(hdptx->rsts[RST_CMN].rstc);
@@ -1037,7 +1039,9 @@ static void rk_hdptx_phy_disable(struct rk_hdptx_phy *hdptx)
 	reset_control_assert(hdptx->rsts[RST_CMN].rstc);
 	reset_control_assert(hdptx->rsts[RST_INIT].rstc);
 
-	val = (HDPTX_I_PLL_EN | HDPTX_I_BIAS_EN | HDPTX_I_BGR_EN) << 16;
+	val = (FIELD_PREP_WM16(HDPTX_I_PLL_EN, 0) |
+	       FIELD_PREP_WM16(HDPTX_I_BIAS_EN, 0) |
+	       FIELD_PREP_WM16(HDPTX_I_BGR_EN, 0));
 	regmap_write(hdptx->grf, GRF_HDPTX_CON0, val);
 }
 
@@ -1135,7 +1139,7 @@ static int rk_hdptx_frl_lcpll_cmn_config(struct rk_hdptx_phy *hdptx)
 
 	rk_hdptx_pre_power_up(hdptx);
 
-	regmap_write(hdptx->grf, GRF_HDPTX_CON0, LC_REF_CLK_SEL << 16);
+	regmap_write(hdptx->grf, GRF_HDPTX_CON0, FIELD_PREP_WM16(LC_REF_CLK_SEL, 0));
 
 	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_common_cmn_init_seq);
 	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_frl_lcpll_cmn_init_seq);
@@ -1178,8 +1182,7 @@ static int rk_hdptx_frl_lcpll_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
 	rk_hdptx_pre_power_up(hdptx);
 
 	/* ROPLL input reference clock from LCPLL (cascade mode) */
-	regmap_write(hdptx->grf, GRF_HDPTX_CON0,
-		     (LC_REF_CLK_SEL << 16) | LC_REF_CLK_SEL);
+	regmap_write(hdptx->grf, GRF_HDPTX_CON0, FIELD_PREP_WM16(LC_REF_CLK_SEL, 1));
 
 	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_common_cmn_init_seq);
 	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_frl_lcpll_ropll_cmn_init_seq);
@@ -1218,7 +1221,7 @@ static int rk_hdptx_tmds_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
 
 	rk_hdptx_pre_power_up(hdptx);
 
-	regmap_write(hdptx->grf, GRF_HDPTX_CON0, LC_REF_CLK_SEL << 16);
+	regmap_write(hdptx->grf, GRF_HDPTX_CON0, FIELD_PREP_WM16(LC_REF_CLK_SEL, 0));
 
 	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_common_cmn_init_seq);
 	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_tmds_cmn_init_seq);
@@ -1336,11 +1339,9 @@ static void rk_hdptx_dp_reset(struct rk_hdptx_phy *hdptx)
 			   FIELD_PREP(LN_TX_DRV_EI_EN_MASK, 0));
 
 	regmap_write(hdptx->grf, GRF_HDPTX_CON0,
-		     HDPTX_I_PLL_EN << 16 | FIELD_PREP(HDPTX_I_PLL_EN, 0x0));
-	regmap_write(hdptx->grf, GRF_HDPTX_CON0,
-		     HDPTX_I_BIAS_EN << 16 | FIELD_PREP(HDPTX_I_BIAS_EN, 0x0));
-	regmap_write(hdptx->grf, GRF_HDPTX_CON0,
-		     HDPTX_I_BGR_EN << 16 | FIELD_PREP(HDPTX_I_BGR_EN, 0x0));
+		     FIELD_PREP_WM16(HDPTX_I_PLL_EN, 0) |
+		     FIELD_PREP_WM16(HDPTX_I_BIAS_EN, 0) |
+		     FIELD_PREP_WM16(HDPTX_I_BGR_EN, 0));
 }
 
 static int rk_hdptx_phy_consumer_get(struct rk_hdptx_phy *hdptx)
@@ -1616,9 +1617,8 @@ static int rk_hdptx_dp_aux_init(struct rk_hdptx_phy *hdptx)
 			   FIELD_PREP(OVRD_SB_VREG_EN_MASK, 0x1));
 
 	regmap_write(hdptx->grf, GRF_HDPTX_CON0,
-		     HDPTX_I_BGR_EN << 16 | FIELD_PREP(HDPTX_I_BGR_EN, 0x1));
-	regmap_write(hdptx->grf, GRF_HDPTX_CON0,
-		     HDPTX_I_BIAS_EN << 16 | FIELD_PREP(HDPTX_I_BIAS_EN, 0x1));
+		     FIELD_PREP_WM16(HDPTX_I_BGR_EN, 1) |
+		     FIELD_PREP_WM16(HDPTX_I_BIAS_EN, 1));
 	usleep_range(20, 25);
 
 	reset_control_deassert(hdptx->rsts[RST_INIT].rstc);
@@ -1665,7 +1665,7 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 
 	if (mode == PHY_MODE_DP) {
 		regmap_write(hdptx->grf, GRF_HDPTX_CON0,
-			     HDPTX_MODE_SEL << 16 | FIELD_PREP(HDPTX_MODE_SEL, 0x1));
+			     FIELD_PREP_WM16(HDPTX_MODE_SEL, 1));
 
 		for (lane = 0; lane < 4; lane++) {
 			regmap_update_bits(hdptx->regmap, LANE_REG(031e) + 0x400 * lane,
@@ -1693,7 +1693,7 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 
 		if (!ret) {
 			regmap_write(hdptx->grf, GRF_HDPTX_CON0,
-				     HDPTX_MODE_SEL << 16 | FIELD_PREP(HDPTX_MODE_SEL, 0x0));
+				     FIELD_PREP_WM16(HDPTX_MODE_SEL, 0));
 
 			if (hdptx->hdmi_cfg.mode == PHY_HDMI_MODE_FRL)
 				ret = rk_hdptx_frl_lcpll_mode_config(hdptx);
@@ -1828,8 +1828,7 @@ static int rk_hdptx_phy_set_rate(struct rk_hdptx_phy *hdptx,
 	u32 bw, status;
 	int ret;
 
-	regmap_write(hdptx->grf, GRF_HDPTX_CON0,
-		     HDPTX_I_PLL_EN << 16 | FIELD_PREP(HDPTX_I_PLL_EN, 0x0));
+	regmap_write(hdptx->grf, GRF_HDPTX_CON0, FIELD_PREP_WM16(HDPTX_I_PLL_EN, 0));
 
 	switch (dp->link_rate) {
 	case 1620:
@@ -1885,8 +1884,7 @@ static int rk_hdptx_phy_set_rate(struct rk_hdptx_phy *hdptx,
 	regmap_update_bits(hdptx->regmap, CMN_REG(0095), DP_TX_LINK_BW_MASK,
 			   FIELD_PREP(DP_TX_LINK_BW_MASK, bw));
 
-	regmap_write(hdptx->grf, GRF_HDPTX_CON0,
-		     HDPTX_I_PLL_EN << 16 | FIELD_PREP(HDPTX_I_PLL_EN, 0x1));
+	regmap_write(hdptx->grf, GRF_HDPTX_CON0, FIELD_PREP_WM16(HDPTX_I_PLL_EN, 1));
 
 	ret = regmap_read_poll_timeout(hdptx->grf, GRF_HDPTX_STATUS,
 				       status, FIELD_GET(HDPTX_O_PLL_LOCK_DONE, status),

-- 
2.53.0


