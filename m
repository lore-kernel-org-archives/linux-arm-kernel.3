Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A84CC531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 19:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfNbCStlITU4A3pEz/3Q36xmBDx0flfz5Ru8CVG8VTo=; b=FTofnFE8MhfzmdMqWoN3E3JANJ
	pwjwxTch+gfKv+B8P9eYw63sMBFslvbn855mXhxBM05WyUMNe20ZgFo9bHMrJHV5jh3x1Oz/cnCSH
	s4mHXC4rpd6l4dyS6etmedt+GzS13rH81px33lK7KndvpX20dJJdss04rDkdwjvJnuDhmTv8WoMln
	0T7Nm0/+BNP9kN81rCc/kqhoubgoabwUqwPr+JqBr4TVv/JdTjxXjcssFUVd21lHZD7V3PSA7+igC
	VCdc/8NWHENGKDtL3qGWqgEKG6kef047qTKas/JHB6ZQMvumoTg4OklQu96erO8JvhE/kEJfxmryX
	AfVHeIkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzJu-0000000Ezmo-2wFl;
	Thu, 23 Jul 2026 19:43:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzIp-0000000Eykk-2N9I;
	Thu, 23 Jul 2026 19:41:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784835712;
	bh=/Z9S3V5F+HkTvALb4lKHAoUP/Ofe0V9jBqF+2D9oDj4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FLM5+Of/gosMr14EDkqZY9kBlFNRjQVAqDE5gAwhLJ/rVSWwQKKhBeiFwXcpYZptF
	 X1ktj93HTBetqioZmN8OWZ72pb3mzWP1MCMXEye+1eUdq4eM6CCPLSoRtW6Jl/vevI
	 QWgKVhEyRT1fnSM40WVkw37IVcpGRBHo53nvSEHpaEdJq1mrZb55ugWf8oR4t6N24G
	 LcqgCaqlYYuMIA8JLVGYM2c7C0hUEPmvvaw2TrKqofY8Ur6EQTFvehtMi86ZVHb/Ol
	 yN/k5rvRZAYg/8DlOO7jQA7jj0nGOHZx9MPj9fskOuSt2Q7ufzkjawCqmL3iDAPR4t
	 ILgP6PuA6/yHg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8DDD217E151D;
	Thu, 23 Jul 2026 21:41:52 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 22:41:51 +0300
Subject: [PATCH v5 08/10] phy: rockchip: samsung-hdptx: Drop
 restrict_rate_change handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260723-hdptx-clk-fixes-v5-8-8e786067865f@collabora.com>
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
X-CRM114-CacheID: sfid-20260723_124155_768243_64D333AD 
X-CRM114-Status: GOOD (  14.57  )
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

Since commit 6efbd0f46dd8 ("phy: rockchip: samsung-hdptx: Restrict
altering TMDS char rate via CCF"), adjusting the rate via the Common
Clock Framework API has been disallowed.

To avoid breaking existing users until switching to the PHY config API,
it introduced a temporary exception to the rule, controlled via the
'restrict_rate_change' flag.

As the API transition completed, remove the now deprecated exception
logic.

Tested-by: Thomas Niederprüm <dubito@online.de>
Tested-by: Simon Wright <simon@symple.nz>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 42 +++++------------------
 1 file changed, 8 insertions(+), 34 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index eda8e5055588..da8f252fb719 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -414,7 +414,6 @@ struct rk_hdptx_phy {
 	/* clk provider */
 	struct clk_hw hw;
 	bool pll_config_dirty;
-	bool restrict_rate_change;
 
 	atomic_t usage_count;
 
@@ -2074,7 +2073,6 @@ static int rk_hdptx_phy_configure(struct phy *phy, union phy_configure_opts *opt
 		if (ret) {
 			dev_err(hdptx->dev, "invalid hdmi params for phy configure\n");
 		} else {
-			hdptx->restrict_rate_change = true;
 			hdptx->pll_config_dirty = true;
 
 			dev_dbg(hdptx->dev, "%s %s rate=%llu bpc=%u\n", __func__,
@@ -2327,41 +2325,17 @@ static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
 	/*
-	 * Invalidate current clock rate to ensure rk_hdptx_phy_clk_set_rate()
-	 * will be invoked to commit PLL configuration.
+	 * For uncommitted PLL configuration, invalidate the current clock rate
+	 * to ensure rk_hdptx_phy_clk_set_rate() will be always invoked.
+	 * Otherwise, restrict the rate according to the PHY link setup.
 	 */
-	if (hdptx->pll_config_dirty) {
+	if (hdptx->pll_config_dirty)
 		req->rate = 0;
-		return 0;
-	}
-
-	if (hdptx->hdmi_cfg.mode == PHY_HDMI_MODE_FRL) {
+	else if (hdptx->hdmi_cfg.mode == PHY_HDMI_MODE_FRL)
 		req->rate = hdptx->hdmi_cfg.rate;
-		return 0;
-	}
-
-	/*
-	 * FIXME: Temporarily allow altering TMDS char rate via CCF.
-	 * To be dropped as soon as the RK DW HDMI QP bridge driver
-	 * switches to make use of phy_configure().
-	 */
-	if (!hdptx->restrict_rate_change && req->rate != hdptx->hdmi_cfg.rate) {
-		struct phy_configure_opts_hdmi hdmi = {
-			.tmds_char_rate = req->rate,
-		};
-
-		int ret = rk_hdptx_phy_verify_hdmi_config(hdptx, &hdmi, &hdptx->hdmi_cfg);
-
-		if (ret)
-			return ret;
-	}
-
-	/*
-	 * The TMDS char rate shall be adjusted via phy_configure() only,
-	 * hence ensure rk_hdptx_phy_clk_set_rate() won't be invoked with
-	 * a different rate argument.
-	 */
-	req->rate = DIV_ROUND_CLOSEST_ULL(hdptx->hdmi_cfg.rate * 8, hdptx->hdmi_cfg.bpc);
+	else
+		req->rate = DIV_ROUND_CLOSEST_ULL(hdptx->hdmi_cfg.rate * 8,
+						  hdptx->hdmi_cfg.bpc);
 
 	return 0;
 }

-- 
2.55.0


