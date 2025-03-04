Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2FAC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 02:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvF/KChtCmFaeO53fKk3pKkLw2CpLabDg7bviRAPx/8=; b=J5oL4oDJG4ZFhWD+OjyqjpFqHd
	vi2Wbj77yutbpVfKSJPs65QAtWmTj3Qw4WiPU15khVpIF0KWrZ5MWXxCmkHDQRiCC4RelxiZsbutd
	KFSb8WDuKt5QE8HRfCdQghRmc8DmO1Sye5+G04cKR1k3xU7aABAgFrjFURmBPCPe6LVntFcNL6y9p
	/Du/OSwxRgpO+cZduGkh+NbRfR/Jk+ssMNGZvfp5m+DAR+e4kf6dDq9n61FehXH4B5cRsXFPZNJN8
	8/d/RDaov8fmyZM0AuzRDRUgqQcImmaXnSwISshzmDDYE/gBBZ96+JZLzrI6gJQUrf5rKVDe0TFPj
	4aCIp1Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpHoD-00000002sUv-28P3;
	Tue, 04 Mar 2025 02:15:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpHKc-00000002o68-2DCz;
	Tue, 04 Mar 2025 01:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741052665;
	bh=l4kiELVlGlbq53QeXi0EurEOvtdzTD58A2iUc1upzgI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L/BsZ7ITapv0LiEkQrT8859nFykO7sHJVRJjgwRWZBBUaW+nbQrDJ3a5yOHS0W6OM
	 rlxUnw2f9ZVoHRCp+yLMiopaC+GE2r6XQ6uEEgH8YaOgl6hftuJbEqvqwbdF8k+h0T
	 WFM2FoHs3dVqpsgKxLBJZaOrz/HcYH78UQlOIjULBdc0YzzPpxtULY5r9Z3DlWU1IJ
	 qWV8INHL/kXDdwH7YPcXz2d816ocMq4o6apTuMr/oUxOWOodHOP18ERa4AueGRgoru
	 EMdJS9bs9ayfMXpWSdyAuZptyPnNTqXD/r8kWx/P8aJQKRdHDuo1dvbTjv4JM35+Bu
	 NHAzxYjZFpkpA==
Received: from localhost (unknown [188.27.58.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 1550717E1047;
	Tue,  4 Mar 2025 02:44:25 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 04 Mar 2025 03:44:08 +0200
Subject: [PATCH v4 09/12] phy: rockchip: samsung-hdptx: Restrict altering
 TMDS char rate via CCF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-phy-sam-hdptx-bpc-v4-9-8657847c13f7@collabora.com>
References: <20250304-phy-sam-hdptx-bpc-v4-0-8657847c13f7@collabora.com>
In-Reply-To: <20250304-phy-sam-hdptx-bpc-v4-0-8657847c13f7@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_174426_720028_0E9C11AC 
X-CRM114-Status: GOOD (  20.45  )
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

Although, in theory, the clock provider functionality could be enabled
as a standalone driver feature, in practice it is unlikely that it would
be ever needed separately from the common PHY related features, i.e.
making use of the PHY PLL as an alternative and more accurate clock
source for display modes handling.  Which means the PLL will be always
programmed according to the TMDS char rate set via the HDMI PHY
configuration API.

Currently it's possible to freely adjust the rate via the clock API as
well, that is through clk_set_rate().  Making the clock read-only is not
feasible since we need to ensure any rate update done via the PHY
configuration API has been actually programmed into the hardware before
CCF accesses it.  This would be normally done during phy_ops.power_on()
or clk_ops.prepare() callbacks, but it might happen that the former gets
fired too late and the latter only once, hence we need to keep handle it
via clk_ops.set_rate() as a fallback approach.

Prevent changing the TMDS character rate via CCF by letting
rk_hdptx_phy_clk_round_rate() always return the value set via
phy_configure().  To avoid breaking existing users, i.e. RK DW HDMI QP
bridge driver, until the switch to the HDMI PHY config based approach is
completed, introduce a temporary exception to the rule, toggled via the
new ->restrict_rate_change flag, which indicates whether phy_configure()
has been called or not.

Additionally, revert any unlikely rate change that might have occurred
between the calls to ->round_rate() and ->set_rate().

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 53 +++++++++++++++++------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 47db1395051f5d900197871694bab90ca4d6e38e..b4d2f04842b5c5b425c5b73a8b27fabecbbbd6bb 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -402,6 +402,7 @@ struct rk_hdptx_phy {
 	/* clk provider */
 	struct clk_hw hw;
 	unsigned long rate;
+	bool restrict_rate_change;
 
 	atomic_t usage_count;
 
@@ -1759,10 +1760,12 @@ static int rk_hdptx_phy_configure(struct phy *phy, union phy_configure_opts *opt
 
 	if (mode != PHY_MODE_DP) {
 		ret = rk_hdptx_phy_verify_hdmi_config(hdptx, &opts->hdmi);
-		if (ret)
+		if (ret) {
 			dev_err(hdptx->dev, "invalid hdmi params for phy configure\n");
-		else
+		} else {
 			hdptx->hdmi_cfg = opts->hdmi;
+			hdptx->restrict_rate_change = true;
+		}
 		return ret;
 	}
 
@@ -1849,21 +1852,31 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
 static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 					unsigned long *parent_rate)
 {
-	u32 bit_rate = rate / 100;
-	int i;
+	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
-	if (rate > HDMI20_MAX_RATE)
-		return rate;
+	/*
+	 * FIXME: Temporarily allow altering TMDS char rate via CCF.
+	 * To be dropped as soon as the RK DW HDMI QP bridge driver
+	 * switches to make use of phy_configure().
+	 */
+	if (!hdptx->restrict_rate_change && rate != hdptx->hdmi_cfg.tmds_char_rate) {
+		struct phy_configure_opts_hdmi hdmi = {
+			.tmds_char_rate = rate,
+		};
+		int ret = rk_hdptx_phy_verify_hdmi_config(hdptx, &hdmi);
 
-	for (i = 0; i < ARRAY_SIZE(ropll_tmds_cfg); i++)
-		if (bit_rate == ropll_tmds_cfg[i].bit_rate)
-			break;
+		if (ret)
+			return ret;
 
-	if (i == ARRAY_SIZE(ropll_tmds_cfg) &&
-	    !rk_hdptx_phy_clk_pll_calc(bit_rate, NULL))
-		return -EINVAL;
+		hdptx->hdmi_cfg = hdmi;
+	}
 
-	return rate;
+	/*
+	 * The TMDS char rate shall be adjusted via phy_configure() only,
+	 * hence ensure rk_hdptx_phy_clk_set_rate() won't be invoked with
+	 * a different rate argument.
+	 */
+	return hdptx->hdmi_cfg.tmds_char_rate;
 }
 
 static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1871,6 +1884,20 @@ static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
+	/* Revert any unlikely TMDS char rate change since round_rate() */
+	if (hdptx->hdmi_cfg.tmds_char_rate != rate) {
+		dev_warn(hdptx->dev, "Reverting unexpected rate change from %lu to %llu\n",
+			 rate, hdptx->hdmi_cfg.tmds_char_rate);
+		hdptx->hdmi_cfg.tmds_char_rate = rate;
+	}
+
+	/*
+	 * The TMDS char rate would be normally programmed in HW during
+	 * phy_ops.power_on() or clk_ops.prepare() callbacks, but it might
+	 * happen that the former gets fired too late, i.e. after this call,
+	 * while the latter being executed only once, i.e. when clock remains
+	 * in the prepared state during rate changes.
+	 */
 	return rk_hdptx_ropll_tmds_cmn_config(hdptx, rate / 100);
 }
 

-- 
2.48.1


