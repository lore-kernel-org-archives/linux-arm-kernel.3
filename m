Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1340CC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 19:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cV16GH5lrtirO/ATri5t7/0aISTJZlDeBZVCdrNtin0=; b=I3YOhYB8gDg8mTw6BG7SB5ZprZ
	m+2waoNKYRhcbviDopnJXsVDpCAqvgYDokiVzVfVbL84p3NEZOOgNP7K8fIvEAPOmxF4rEyVOgTBl
	R/8eOzoK8l+HOqxIoE+9BofBpy3R4uZeizC+jGnICo2MzzOvwUQ5If+6MzqasMaUIYTB4YAQU1MJ/
	Aa6FVlmAWj4SUMQUnN9wy2s9FdKJ4RxZoxOhcycRvpVW+TNHMyLuLJ2CNEQa2TPz8V22fb7TVPQHt
	sWXdgKagdG0vWXzE8BjWU5YlVq7xZPd6fSkAD+oab20rBZKZ+DZPUhLnN0pdrQPCW4hyLEOv/ZmvU
	54ztroFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzJV-0000000EzMw-49ji;
	Thu, 23 Jul 2026 19:42:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzIq-0000000EylL-022d;
	Thu, 23 Jul 2026 19:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784835713;
	bh=5OXrMaF+tNgPJkVuxdJnKbWlkMwckWO6ap72jrIjp4M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M4BSjVNLijm6MdhxkB/ecCvIf2beXJohnwKxvix6woaRlU+djnzQwBh2elszJ1DRg
	 1gqm4C5UjKaxBskmr4h/OcQXpDjbYUtUxslNmQGnt1s68GPL9pLnw9i3/K1MrlzNyy
	 VGDsXPUXrJ4UYhJt80hdJXHKJAcOZ9SqWqTZ7Q2qi5u9+SHMGep2LaKUMNzosRenHE
	 kNZk4kTnxUEzLJuy1VFcRRfg1V4mVKWNCSuT/GdwsbKsOyKazqaaTX2GKH0xVUZ3OR
	 kJ5DuGvZH2OtDVmKR+j3eGqeChU6zoZcYVAnf9ksX6Py5lDPHTdmeM1po5qxWIfqgY
	 YL14GXokpGrJg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 55F5D17E1550;
	Thu, 23 Jul 2026 21:41:53 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 22:41:52 +0300
Subject: [PATCH v5 09/10] phy: rockchip: samsung-hdptx: Simplify GRF access
 with FIELD_PREP_WM16()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260723-hdptx-clk-fixes-v5-9-8e786067865f@collabora.com>
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
X-CRM114-CacheID: sfid-20260723_124156_211412_9767102D 
X-CRM114-Status: GOOD (  10.66  )
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
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 52 +++++++++++------------
 1 file changed, 25 insertions(+), 27 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index da8f252fb719..03977b830414 100644
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
2.55.0


