Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC87B10398AD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 20:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7ynTq+w1/GaaU5SIenYl8hoXAbV9ubXFsJkmvefWzs=; b=GG44/M1Fg4iuNmdl8suy7gbZOJ
	fT68vmVFUFphqQtE+0Q5UWx7/N7XrYBK7t+039nO4N2AN0R875z+59YMpQhJ3teto5j69NCjZHz6d
	oIbpi1PZACwHnA5Q2hHrjP3PSWPfszIHBt+aiQO0OiDmbFh9nxm7YDcoTDRP02UcwR9A7FvbslbPz
	Wm/bzBxVCfLWKwU7qfwlf7lbB0Sm6+GCdkZ6ILV1/ubFhZfPhCz0/NBUJjbMCoiFvyXl6/Riun4k1
	3fa4Vn3j5SUHbK79J5hzEhKSFf6iVH8DTocRlMMy3Y5D7R92i9s1Vo+UXBrjarE4gLfBOnwIftvxV
	domn7+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw4le-000000098ao-2Slc;
	Fri, 27 Feb 2026 20:48:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw4lc-000000098ZT-2PtY;
	Fri, 27 Feb 2026 20:48:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772225332;
	bh=433OBg1+YhSGQUkUR4/HWbY+HhNN+rC6S+NSviwRYKA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fnkPYyXmoPbrn1PvNVWYLCew2XoscpGzvLQB2U+kVJISmi+ygn6ZSbNlnWW+grB9h
	 BNA05bXkglNq8muXn/K37Cq/VpyLPmDrj/xIvWExp/3kGlA3YKGLlKyQ/LNyz5OXYm
	 q7Qj84JE7JmeV/sokp70rB6KrgQD3Rge85/H5kMk3GtOVBIsqtKNSuzlClKJLIEJBJ
	 OuyD2ofdPsBFKQsfngaIa76f3Y8DgiOeZqhM5EMcY/9O7pjOgTF2n8lNZDuhmhdKAi
	 1+jvZtMDhDvyCCpei0j7HnTF8seZbidaR7LYK18XX9NL6B4wiPR4EzyVsFpniIaA2q
	 9r1AsDAbQd8Xg==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 954A617E0E91;
	Fri, 27 Feb 2026 21:48:52 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 27 Feb 2026 22:48:45 +0200
Subject: [PATCH 1/6] phy: rockchip: samsung-hdptx: Fix rate recalculation
 for high bpc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-hdptx-clk-fixes-v1-1-f998f2762d0f@collabora.com>
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
X-CRM114-CacheID: sfid-20260227_124856_768313_AABD3578 
X-CRM114-Status: GOOD (  12.08  )
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

The PHY PLL can been programmed by an external component, e.g. the
bootloader, just before the recalc_rate() callback is invoked during
devm_clk_hw_register() in the probe path.

Therefore rk_hdptx_phy_clk_recalc_rate() finds the PLL enabled and
attempts to compute the clock rate, while making use of the bpc value
from the HDMI PHY configuration, which always defaults to 8 because
phy_configure() was not run at that point.  As a consequence, the
(re)calculated rate is incorrect when the actual bpc was higher than 8.

Do not rely on any of the hdmi_cfg members when computing the clock rate
and, instead, read the required input data (i.e. bpc), directly from the
hardware registers.

Fixes: 3481fc04d969 ("phy: rockchip: samsung-hdptx: Compute clk rate from PLL config")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 2d973bc37f07..7fb1c22318bb 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -2168,7 +2168,7 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
 	struct lcpll_config lcpll_hw;
 	struct ropll_config ropll_hw;
 	u64 fout, sdm;
-	u32 mode, val;
+	u32 mode, bpc, val;
 	int ret, i;
 
 	ret = regmap_read(hdptx->regmap, CMN_REG(0008), &mode);
@@ -2266,6 +2266,7 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
 	if (ret)
 		return 0;
 	ropll_hw.pms_sdiv = ((val & PLL_PCG_POSTDIV_SEL_MASK) >> 4) + 1;
+	bpc = (FIELD_GET(PLL_PCG_CLK_SEL_MASK, val) << 1) + 8;
 
 	fout = PLL_REF_CLK * ropll_hw.pms_mdiv;
 	if (ropll_hw.sdm_en) {
@@ -2280,7 +2281,7 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
 			fout = fout + sdm;
 	}
 
-	return div_u64(fout * 2, ropll_hw.pms_sdiv * 10);
+	return div_u64(fout * 2 * 8, ropll_hw.pms_sdiv * 10 * bpc);
 }
 
 static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
@@ -2288,19 +2289,13 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 	u32 status;
-	u64 rate;
 	int ret;
 
 	ret = regmap_read(hdptx->grf, GRF_HDPTX_CON0, &status);
 	if (ret || !(status & HDPTX_I_PLL_EN))
 		return 0;
 
-	rate = rk_hdptx_phy_clk_calc_rate_from_pll_cfg(hdptx);
-
-	if (hdptx->hdmi_cfg.mode == PHY_HDMI_MODE_FRL)
-		return rate;
-
-	return DIV_ROUND_CLOSEST_ULL(rate * 8, hdptx->hdmi_cfg.bpc);
+	return rk_hdptx_phy_clk_calc_rate_from_pll_cfg(hdptx);
 }
 
 static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,

-- 
2.52.0


