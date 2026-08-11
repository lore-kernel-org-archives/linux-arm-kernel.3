Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E4CC5CFEE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lh2Ybf2C7eYklQtWCTg8Tef5Nm9gaiVPL43HbqqFmcA=; b=KD93+7oDY8bGMSjCqA8v+OVzoO
	tRRN6Z4gmfWJbDhgZHpuNIihlUXIpYVjaxkpY/VHEun+g2i4NV9+svUjnb+SVLC9LORZ3BiKU/V0y
	LVxIWxOomlkymU/UCN6nSj8tgJsLCpVpwAHxDLti9+BzmnJPkKdzb6V07NG+p5ikW+7+j7BMYGAra
	3wRVBC4YPekWPGuAjXv5gJNJxL5QpCaEPNlh3pw2R0wZ2n270IT1tMq5nCozr41mvErI4f4AZ8Fny
	pF6LbbGVA1PDV+Q7IpNjoYO5hRLkSEFKzzkQ4M7MpUG43rEB7Ihw87AnFh58N8YGGgzdPY41sFUAf
	QGKXm7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtofa-0000000ENFy-3x0B;
	Tue, 11 Aug 2026 15:45:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtofL-0000000EMvw-1MN1;
	Tue, 11 Aug 2026 15:45:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786463119;
	bh=hEnZz5RpWyWJuFbMT6H/f1VppGVc8i0mqOduVdrlwXc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VZp/UbwoggNKH3UegnAF0sD6Sh9KqIbewZZk0r2sq8RwLp4hCz3SCGKGoFaGSIbA4
	 tQ1k9tb3wywEnozcgkL322W3dnE6LAlAr0YpMjJOh951nYPaAKOVQDy+LBfPAp+ei8
	 PtKePdGeh9wJqWS5P4xyC63AlEKnvT95ZnSI4hgdoAedbtdz3ZkYB+Mdm/y9IO0ek8
	 nUWfz0/Vli98cI7SyGM/R4fZAKo59jrm6eKnU9S5+Ss0T1EtXaBdihKv6NF6GIhFJ8
	 la6Q+oMcZ1TOMgklM1LoEN+XL+hm3vn/czwqQpdIeUHl818G6wH8xdPrLGXwu9p3xp
	 LnHXxlHH2Q7aw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 38CE017E0FAB;
	Tue, 11 Aug 2026 17:45:19 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 11 Aug 2026 18:44:49 +0300
Subject: [PATCH v6 08/10] phy: rockchip: samsung-hdptx: Drop
 restrict_rate_change handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260811-hdptx-clk-fixes-v6-8-75bca0ee5753@collabora.com>
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
X-CRM114-CacheID: sfid-20260811_084523_515292_02B0EFC1 
X-CRM114-Status: GOOD (  15.01  )
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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 42 +++++------------------
 1 file changed, 8 insertions(+), 34 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 294484da7085..cf79bd4752c8 100644
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
@@ -2336,41 +2334,17 @@ static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
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


