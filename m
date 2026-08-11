Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB27C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGfGRnZBx3Dq3TV8Yq50vNp+1Ajb7ivC2kQGspmUqy4=; b=oRc1UGWTWSLIgtk0QD4FnKRtjB
	sbgFC2blAkz+eWM7pQjdpaqtBkxgm71DhFeeqF0vX3+ARts6e6WbrSEbmeBNx//z2fNzsNo2/aUtb
	fbislTcjX4aMm5fYjJkmVbNjG2jAvg3GQfuxF5ydrHotX1mhMXhG0tm/31wHPJtogq+LZYVeq+2TX
	7BgoQiB3WSLuy7Rf/FrSAG3zoeUg7iXNmjPbV36LDnA0BeMLcdX6OW/OetKCUMnQTbhOEDoyQfFGK
	AR9+cewdUWrrIv6ti3BuE4yaA1WA8c+4GsOMAuhm1rFUWPl2XxlRKwS8dX8MUSeBPUPOxvjrqxdGc
	+hQ4Q4PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtofP-0000000EN2l-1Pos;
	Tue, 11 Aug 2026 15:45:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtofG-0000000EMuG-3zdo;
	Tue, 11 Aug 2026 15:45:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786463116;
	bh=6RPVH5cc0dHnz6YfyK0zCC0xdbe1066tYNshPps6WvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H7Z9+xcZ3gAs6thFj2X2gHcK2w8lBMZ6E0BfOrOT/5Lh8m+VMLi4VO1rI6o+EcaBt
	 fNn4ejmN2zYaZxL+Bzj9/8vItUtZhkEHuj9ZS+vLzC19gjowVtl7Ag8Ox9Gjv45jMn
	 FwJ6ujynDXIUJVlEQZ6zYA8t9/aM84hZeZGbtE5gV3nximBXh0r3QZ2dVhun5PJvHO
	 g+FpJW+zODiopI/NauAzgsa/nsOVgUGoRZX1wGHH/HsssnMBA/o6WQ12Ij7Z25F4fn
	 hl7bVA9W6Nk32/ykkrwbZqb33Rr0BekPvD67wlUgpD7IOO0GvMFPGYI4aeqsta23T6
	 QJXBQAVcArkvg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3D31617E0EF0;
	Tue, 11 Aug 2026 17:45:16 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 11 Aug 2026 18:44:45 +0300
Subject: [PATCH v6 04/10] phy: rockchip: samsung-hdptx: Fix rate
 recalculation for 3.2GHz FRL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-hdptx-clk-fixes-v6-4-75bca0ee5753@collabora.com>
References: <20260811-hdptx-clk-fixes-v6-0-75bca0ee5753@collabora.com>
In-Reply-To: <20260811-hdptx-clk-fixes-v6-0-75bca0ee5753@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_084519_310490_6C4CC8F8 
X-CRM114-Status: GOOD (  12.72  )
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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 33 ++++++++++++++++-------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 3a65c26f3efa..d7d8414fdddd 100644
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


