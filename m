Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3A8C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 19:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCyY66/12SHZhwkEq9SQNNj8EAw1gfL2WypW8hci22Q=; b=LaQoOR8Rui8KIdgKARy76fRBfX
	01QijbV4adc1DbED2aVEYk0jt/7BPVsnHjjBWIo7WIs0DNIpAyn0wZyuC7y9pwCmrYcGcHWni8a8s
	D9UPyIM4wkEXT91aIK+hyZJE00AzDufGTcn+agejKkCs5h8zFtJSmawPuGxQWJ/YNjLu4W2GJ1X+K
	2wHOPoQeViw+hN8xv/nqREAsHDS8w5WzZIC7gKh46yCzwflZKmdQd6bOyCDwu20aPU4QrvVgG6K7V
	T9K5wHNyk2gbbE/FTGnwz72kO/o6TOAwuk4DorvMOsg6xFyzWslBtFzgMu1UGV1f2naciDI1+Ne2O
	baQBdPnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzJ9-0000000Ez0y-3Vfu;
	Thu, 23 Jul 2026 19:42:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzIm-0000000EyjP-2DdT;
	Thu, 23 Jul 2026 19:41:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784835709;
	bh=5sGfimKm9sYIHnBzOCtycoKCwoNHkaa8YO7d2RCED3U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NKmedy4PE1wOgOX+OoAsyHTHhRCmr3jdrQf0+qzUqm4Ssu6jBfRHzsyZF3avsd+2D
	 xI6bLapWTaFlxqoNz1zozgJ+wBY5pYgO3GKhfyD+VrHzvrxbaDD3c4/mqXwbohPEYx
	 f5g3Wzaw4jnyBtHZKlE9zGng3TnmZwfsbUQ8rCmzRo1PVLM5+ZwWPa7yrBLkkkkYCe
	 rPVC+qoOox/B2p2WcOlhnOe6/hH/Z7Bs7+pJ7g/uyQRnUtdqUt5UTBxjOXog8/63Hl
	 x/x3pzig1OxQlS4jNR6LcS04/HLQzfNFFpaW4Bqr9myxWF26lNSeHmEj9iTVAPqW9B
	 +Z68TnPa6Uq3A==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A55A17E0DC1;
	Thu, 23 Jul 2026 21:41:49 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 22:41:47 +0300
Subject: [PATCH v5 04/10] phy: rockchip: samsung-hdptx: Fix rate
 recalculation for 3.2GHz FRL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-hdptx-clk-fixes-v5-4-8e786067865f@collabora.com>
References: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
In-Reply-To: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Andy Yan <andy.yan@rock-chips.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_124152_779595_4A73D4AB 
X-CRM114-Status: GOOD (  12.37  )
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

rk_hdptx_phy_clk_calc_rate_from_pll_cfg() is currently unable to handle
cascade mode for the 3.2GHz FRL operating mode, as it relies solely on
LCPLL_LCVCO_MODE_EN_MASK to determinate the rate from the
rk_hdptx_frl_lcpll_cfg array.  Since there is no entry for this
particular rate, the function returns 0.

This is the only rate which requires LC_REF_CLK_SEL to be set in
GRF_HDPTX_CON0, hence extend the FRL matching accordingly.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260611-hdptx-clk-fixes-v3-0-67b1b0c00e16@collabora.com?part=1
Fixes: de5dba833118 ("phy: rockchip: samsung-hdptx: Add HDMI 2.1 FRL support")
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Andy Yan <andy.yan@rock-chips.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 33 ++++++++++++++++-------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index fcf04e9814cc..3a1a43ec2552 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -2206,16 +2206,31 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
 			return 0;
 		lcpll_hw.sdc_n = (val & LCPLL_SDC_N_MASK) >> 1;
 
-		for (i = 0; i < ARRAY_SIZE(rk_hdptx_frl_lcpll_cfg); i++) {
-			const struct lcpll_config *cfg = &rk_hdptx_frl_lcpll_cfg[i];
+		ret = regmap_read(hdptx->grf, GRF_HDPTX_CON0, &val);
+		if (ret)
+			return 0;
 
-			if (cfg->pms_mdiv == lcpll_hw.pms_mdiv &&
-			    cfg->pms_sdiv == lcpll_hw.pms_sdiv &&
-			    cfg->sdm_num_sign == lcpll_hw.sdm_num_sign &&
-			    cfg->sdm_num == lcpll_hw.sdm_num &&
-			    cfg->sdm_deno == lcpll_hw.sdm_deno &&
-			    cfg->sdc_n == lcpll_hw.sdc_n)
-				return cfg->rate;
+		if (val & LC_REF_CLK_SEL) {
+			if (lcpll_hw.pms_mdiv == 0x6b &&
+			    lcpll_hw.sdm_num_sign == 0x01 &&
+			    lcpll_hw.sdm_num == 0x02 &&
+			    lcpll_hw.sdm_deno == 0x09 &&
+			    lcpll_hw.sdc_n == FIELD_GET(LCPLL_SDC_N_MASK, 0x02))
+				return FRL_8G4L_RATE;
+		} else {
+			const struct lcpll_config *cfg;
+
+			for (i = 0; i < ARRAY_SIZE(rk_hdptx_frl_lcpll_cfg); i++) {
+				cfg = &rk_hdptx_frl_lcpll_cfg[i];
+
+				if (cfg->pms_mdiv == lcpll_hw.pms_mdiv &&
+				    cfg->pms_sdiv == lcpll_hw.pms_sdiv &&
+				    cfg->sdm_num_sign == lcpll_hw.sdm_num_sign &&
+				    cfg->sdm_num == lcpll_hw.sdm_num &&
+				    cfg->sdm_deno == lcpll_hw.sdm_deno &&
+				    cfg->sdc_n == lcpll_hw.sdc_n)
+					return cfg->rate;
+			}
 		}
 
 		dev_dbg(hdptx->dev, "%s no FRL match found\n", __func__);

-- 
2.55.0


