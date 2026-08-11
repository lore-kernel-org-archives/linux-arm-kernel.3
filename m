Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736C3C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaCFgMJB7Z7MMEKzmgf8+Me4sEAW/L+oN0sMPzNLqm8=; b=Cy1uurq5JKtzu1autbHWw4L1DW
	3Rrlp99Xh1I3R1NMBUlqimk4LLMpjsfx59aIUVuQpngmk2r2abN8btE0ZJC7dlBPhKts35hqpJBmz
	kumgOVXXi445LWA1ljngQ8sre4Kj0p/155LvJdr0k0Ai1h4vOEP0zsrnFgPCrkEvZ/Xb3vL8PM4tp
	7Rc6Kii/bgA9vaKE7M3mIxUX3IDSxuROlwN8oYDaCar0xFr5i4V5XBU6z25Cb/iM5cbxw8yHYmYp+
	eVC3HQ6WhyrhWDrD3aMcOX7AVcGpUyZ0tGu5Dbc2snuIAjRL/nq28yzxXuPEMvivANXxhiFPlqLy8
	swLivcVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtofV-0000000EN9f-0q1L;
	Tue, 11 Aug 2026 15:45:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtofG-0000000EMu5-0sQb;
	Tue, 11 Aug 2026 15:45:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786463114;
	bh=WJE7FGtqmV37oaQbYJKqAKQxFTuPM4BQrEc9nfttCLo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Rl36wizNQ/hXCsQbeQaOPDJvjWxc5BbRmSj4d/u5ATQyE321rqxsrAu7RL7QQR7yq
	 CrN7DXseUwb9oYaDbw+SDdnv+czerfxZXqukc8SM5EYwYpkncAfHLGVVom+8ps3JmN
	 /vgO11NBSGRRFoqrVYu2EtmtMrufX3VDrphK5k0+NPAyZ3SMgeSOw6Jd0Awg5/YazR
	 2X6uOlRePCJy4NoBFpnH/SYc5YxSf7SY3osGPOUIihoVZIS70KYFEHCQshc/qxPhl0
	 gYAX1GEhtfkDD7CwtYDMmRrkjoTELAkMPgeTLoVnpFBEGwbeRCS2XUgs9unI00UzqZ
	 9UG5ErjrTNnKA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 07E9E17E052F;
	Tue, 11 Aug 2026 17:45:14 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 11 Aug 2026 18:44:42 +0300
Subject: [PATCH v6 01/10] phy: rockchip: samsung-hdptx: Fix rate
 recalculation for high bpc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260811-hdptx-clk-fixes-v6-1-75bca0ee5753@collabora.com>
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
 Andy Yan <andyshrk@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_084519_335598_8094BF93 
X-CRM114-Status: GOOD (  12.27  )
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

The PHY PLL can be programmed by an external component, e.g. the
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
Tested-by: Thomas Niederprüm <dubito@online.de>
Tested-by: Simon Wright <simon@symple.nz>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS
Reviewed-by: Andy Yan <andyshrk@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 2d973bc37f07..710603afff86 100644
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
+	return DIV_ROUND_CLOSEST_ULL(fout * 2 * 8, ropll_hw.pms_sdiv * 10 * bpc);
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
2.55.0


