Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F139CCD98D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 23:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ai/dsjsbMDn9xf1xDqcbf0dI3NodUjCaB2ZxfBx+6DE=; b=vEGNc0Of3nRDVZ2c95SNJfCsNz
	1l2YwUzMRBxZvzGSN4Qh8dDqiI3o1wuNSBNyMFc2YGAo74Hq+sO+5q+rcujSLrHkukzASL5l8bzE0
	cTXd7eOGJRqjBWWH7Rwho0D7aJo6P0znm96YOdG/N0xSe0rvUeXPEmcS1zFGKmXTKPpGUC9WweDXd
	vyDxqE3XmKjKp7EpLxFuP8NiDZvQw4r3HgOavq98qv/gOwCosY5qmPeMR6GrRpGuCLcA4LNC4SvIA
	8VdSXY8JzFYytwpm2gxIdT+hke2L0fECMlPNiWSxdw4nxlLL4/UE4SpvY03iyfQwf/VfutKybwTgo
	d58ZMPYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXp60-0000000ABUG-3VFF;
	Thu, 11 Jun 2026 23:46:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXp5o-0000000ABKH-2guo;
	Thu, 11 Jun 2026 23:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781221545;
	bh=mMmN5c98AYlSbEtpnRmRYuYBWUBFkWC7EXBgNfEYdGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IKb/8iW0KR4HQAdWnwDM0XtSBzPAQyTMVXYiZ4jSEci4zymshCVCkjv7w9prf9neO
	 gC+rl80PFEkpMqkZ5XqYgM72nfWbOJbZ7e0Qp/hhmMlTiAWuGbDskeTanG3RAm2lXh
	 iyJVqkNse3LiLpPXmTDKOI8bZp6zlDbdMT/hzaMYAPQ8Q/vFnzlhN9ujgjyPdE/E9x
	 2Z4eXHDGaP4souQZ29b8IlMJ95mD8lL/r19Z4O8BY55PU385HybmW9UG4AXdj8fmmu
	 rEiUk4MyKxHHwIl/BTP/bmg88dqHEsKbzu/Y+89K6XrxaeviJ585SwZO52wOlF/wx6
	 guUAvn0PIHrEQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 917F117E0A49;
	Fri, 12 Jun 2026 01:45:45 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 12 Jun 2026 02:45:22 +0300
Subject: [PATCH v4 3/8] phy: rockchip: samsung-hdptx: Fix rate
 recalculation for 3.2GHz FRL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-hdptx-clk-fixes-v4-3-ce5e1d456cda@collabora.com>
References: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
In-Reply-To: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_164548_832762_FC2D77DE 
X-CRM114-Status: GOOD (  12.34  )
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
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 33 ++++++++++++++++-------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 8c044381b83a..b210c1a88b25 100644
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
2.54.0


