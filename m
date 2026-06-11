Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F741CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 12:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERxMsv4qLB/luxh+WAxz3Sky7IrGys50qMO9F9nVf8o=; b=C3QiNcKoWeH3s7LKWwTd52IsX1
	hjmcC3w6eWTjppARpkusMsICdN+CmNufmADNe28W95cuUI6REKlNXE0euEXIzGx8HcKG2UmIRS2su
	9Jogi4VeVhH3cbN1NamaPu5ey/+NjFZpJK7hV6ty+K3Pmv2nkULYK2lBVVH5h0CzNInbi/8J4B3Xw
	gzdkr+IcSN4ifMLWvXUd0kj+1CHI0T5GzZVCTZgAMaMyw9tV7k8DZlAWSadXQa4tDJU8tCF4Vfuxq
	oMhLsBSz6kSSqXOvZqcPpFrtciRz8jBbFQJ/dXWcR1o+LFa9Q3d8eP0qw5k/S0oEnu5SWHg++QbfX
	hqpGWunA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXeZ7-00000009OdU-0wpe;
	Thu, 11 Jun 2026 12:31:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXeZ1-00000009OYM-2rfB;
	Thu, 11 Jun 2026 12:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781181072;
	bh=7a0qWWLgFenn2/gAu/E1fQhvV2QwlHSFoc1ISdVrQVE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kGBBYfxgh2k1cD0213ArlJQRJvzTNRzTI2CgaPtmwmrPftzziccYS5593LPteAOS5
	 S4vcyIWQJIuJPOduP0SQlG07LiVGB+8dAEv0DOPPzmsem8LuvMt/zA5iKJJJUM+tTE
	 dD5AaE9oyWNYHvsKSlBht9uEt+QQfj2VHu5cwHb5GzAFxDWbSQPhK0Svt7NlbHq0Pv
	 ADupAccMEuK3qNi3KF7tbeo2EjSNtlUXPqwo5k4yZ3p7eNTIeap9zWKMxsV0k5+H6R
	 MNIlFHjZndJn07PlwCDk/agH4SsflR3iBKPkbSEB4Onm8pD8ssNltL9Xjl9ufRyT+t
	 Ty4x1Q+DURCEw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5FD3417E091C;
	Thu, 11 Jun 2026 14:31:12 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 11 Jun 2026 15:31:04 +0300
Subject: [PATCH v3 2/6] phy: rockchip: samsung-hdptx: Handle uncommitted
 PHY config changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260611-hdptx-clk-fixes-v3-2-67b1b0c00e16@collabora.com>
References: <20260611-hdptx-clk-fixes-v3-0-67b1b0c00e16@collabora.com>
In-Reply-To: <20260611-hdptx-clk-fixes-v3-0-67b1b0c00e16@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Niederpr=C3=BCm?= <dubito@online.de>, 
 Simon Wright <simon@symple.nz>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_053115_871157_67DB0964 
X-CRM114-Status: GOOD (  22.19  )
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

Any changes to the PHY link rate and/or color depth done via the HDMI
PHY configuration API are not immediately programmed into the hardware,
but are delayed until the PHY usage count gets incremented from 0 to 1,
that is when it is powered on or when the PLL clock exposed through
the CCF API is prepared, whichever comes first.

Since the clock might remain in prepared state after subsequent PHY
config changes, the programming can also be triggered via
clk_ops.set_rate().  However, from the clock consumer perspective (i.e.
VOP2 display controller), the (pixel) clock rate doesn't vary with bpc,
as that is handled internally by the PHY and reflected in the TDMS
character rate only.

As a consequence, changing the bpc while preserving the modeline may
lead to out-of-sync issues between CCF and HDMI PHY config state,
because the .set_rate() callback is not invoked when clock rate remains
constant.  This may also happen when the PHY PLL has been pre-programmed
by an external entity, e.g. the bootloader, which is actually a
regression introduced by the recent FRL patches.

Introduce a pll_config_dirty flag to keep track of uncommitted PHY
config changes and use it in clk_ops.determine_rate() to invalidate the
current clock rate (as known by CCF) and, consequently, ensure those
changes are programmed into hardware via clk_ops.set_rate().

Moreover, proceed with a similar fix in phy_ops.power_on() callback, to
handle the scenario where the CCF API is not used due to operating in
FRL mode, while the clock is still in a prepared state and thus
preventing rk_hdptx_phy_consumer_get() to apply the updated PHY
configuration.

Fixes: de5dba833118 ("phy: rockchip: samsung-hdptx: Add HDMI 2.1 FRL support")
Fixes: 9d0ec51d7c22 ("phy: rockchip: samsung-hdptx: Add high color depth management")
Tested-by: Thomas Niederprüm <dubito@online.de>
Tested-by: Simon Wright <simon@symple.nz>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 84 +++++++++++++----------
 1 file changed, 48 insertions(+), 36 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 710603afff86..5295d5f6f287 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -413,6 +413,7 @@ struct rk_hdptx_phy {
 
 	/* clk provider */
 	struct clk_hw hw;
+	bool pll_config_dirty;
 	bool restrict_rate_change;
 
 	atomic_t usage_count;
@@ -1260,13 +1261,19 @@ static int rk_hdptx_tmds_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
 
 static int rk_hdptx_pll_cmn_config(struct rk_hdptx_phy *hdptx)
 {
+	int ret;
+
 	if (hdptx->hdmi_cfg.rate <= HDMI20_MAX_RATE)
-		return rk_hdptx_tmds_ropll_cmn_config(hdptx);
+		ret = rk_hdptx_tmds_ropll_cmn_config(hdptx);
+	else if (hdptx->hdmi_cfg.rate == FRL_8G4L_RATE)
+		ret = rk_hdptx_frl_lcpll_ropll_cmn_config(hdptx);
+	else
+		ret = rk_hdptx_frl_lcpll_cmn_config(hdptx);
 
-	if (hdptx->hdmi_cfg.rate == FRL_8G4L_RATE)
-		return rk_hdptx_frl_lcpll_ropll_cmn_config(hdptx);
+	if (!ret)
+		hdptx->pll_config_dirty = false;
 
-	return rk_hdptx_frl_lcpll_cmn_config(hdptx);
+	return ret;
 }
 
 static int rk_hdptx_frl_lcpll_mode_config(struct rk_hdptx_phy *hdptx)
@@ -1347,25 +1354,22 @@ static int rk_hdptx_phy_consumer_get(struct rk_hdptx_phy *hdptx)
 		return 0;
 
 	ret = regmap_read(hdptx->grf, GRF_HDPTX_STATUS, &status);
-	if (ret)
-		goto dec_usage;
-
-	if (status & HDPTX_O_PLL_LOCK_DONE)
-		dev_warn(hdptx->dev, "PLL locked by unknown consumer!\n");
+	if (ret) {
+		atomic_dec(&hdptx->usage_count);
+		return ret;
+	}
 
 	if (mode == PHY_MODE_DP) {
 		rk_hdptx_dp_reset(hdptx);
 	} else {
-		ret = rk_hdptx_pll_cmn_config(hdptx);
-		if (ret)
-			goto dec_usage;
+		/*
+		 * Ignore PLL config errors at this point as pll_config_dirty
+		 * was not reset and, therefore, operation will be retried.
+		 */
+		rk_hdptx_pll_cmn_config(hdptx);
 	}
 
 	return 0;
-
-dec_usage:
-	atomic_dec(&hdptx->usage_count);
-	return ret;
 }
 
 static int rk_hdptx_phy_consumer_put(struct rk_hdptx_phy *hdptx, bool force)
@@ -1700,13 +1704,18 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 		if (ret)
 			rk_hdptx_phy_consumer_put(hdptx, true);
 	} else {
-		regmap_write(hdptx->grf, GRF_HDPTX_CON0,
-			     HDPTX_MODE_SEL << 16 | FIELD_PREP(HDPTX_MODE_SEL, 0x0));
+		if (hdptx->pll_config_dirty)
+			ret = rk_hdptx_pll_cmn_config(hdptx);
 
-		if (hdptx->hdmi_cfg.mode == PHY_HDMI_MODE_FRL)
-			ret = rk_hdptx_frl_lcpll_mode_config(hdptx);
-		else
-			ret = rk_hdptx_tmds_ropll_mode_config(hdptx);
+		if (!ret) {
+			regmap_write(hdptx->grf, GRF_HDPTX_CON0,
+				     HDPTX_MODE_SEL << 16 | FIELD_PREP(HDPTX_MODE_SEL, 0x0));
+
+			if (hdptx->hdmi_cfg.mode == PHY_HDMI_MODE_FRL)
+				ret = rk_hdptx_frl_lcpll_mode_config(hdptx);
+			else
+				ret = rk_hdptx_tmds_ropll_mode_config(hdptx);
+		}
 
 		if (ret)
 			rk_hdptx_phy_consumer_put(hdptx, true);
@@ -2081,7 +2090,10 @@ static int rk_hdptx_phy_configure(struct phy *phy, union phy_configure_opts *opt
 			dev_err(hdptx->dev, "invalid hdmi params for phy configure\n");
 		} else {
 			hdptx->restrict_rate_change = true;
-			dev_dbg(hdptx->dev, "%s rate=%llu bpc=%u\n", __func__,
+			hdptx->pll_config_dirty = true;
+
+			dev_dbg(hdptx->dev, "%s %s rate=%llu bpc=%u\n", __func__,
+				hdptx->hdmi_cfg.mode ? "FRL" : "TMDS",
 				hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
 		}
 
@@ -2303,8 +2315,19 @@ static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
-	if (hdptx->hdmi_cfg.mode == PHY_HDMI_MODE_FRL)
-		return hdptx->hdmi_cfg.rate;
+	/*
+	 * Invalidate current clock rate to ensure rk_hdptx_phy_clk_set_rate()
+	 * will be invoked to commit PLL configuration.
+	 */
+	if (hdptx->pll_config_dirty) {
+		req->rate = 0;
+		return 0;
+	}
+
+	if (hdptx->hdmi_cfg.mode == PHY_HDMI_MODE_FRL) {
+		req->rate = hdptx->hdmi_cfg.rate;
+		return 0;
+	}
 
 	/*
 	 * FIXME: Temporarily allow altering TMDS char rate via CCF.
@@ -2336,17 +2359,6 @@ static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 				     unsigned long parent_rate)
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
-	unsigned long long link_rate = rate;
-
-	if (hdptx->hdmi_cfg.mode != PHY_HDMI_MODE_FRL)
-		link_rate = DIV_ROUND_CLOSEST_ULL(rate * hdptx->hdmi_cfg.bpc, 8);
-
-	/* Revert any unlikely link rate change since determine_rate() */
-	if (hdptx->hdmi_cfg.rate != link_rate) {
-		dev_warn(hdptx->dev, "Reverting unexpected rate change from %llu to %llu\n",
-			 link_rate, hdptx->hdmi_cfg.rate);
-		hdptx->hdmi_cfg.rate = link_rate;
-	}
 
 	/*
 	 * The link rate would be normally programmed in HW during

-- 
2.54.0


