Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9FEC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 12:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTSN77q91YQyQD5x580rnqrnLLV2ArU9KML5ac2dbHE=; b=GPtnH+KhDKqNS+FFLAZnj2mFLQ
	ubtMBfTLercEX0FDWuYAhp6lN/KBLJxpXn2UsD7Bpiw93lJ4I589AD4n5V7cvTAJcnxRfMPxuKvDK
	y04WuWLIkNCdYuX4mD4su4+oIGDdETIE84pVebLShvqSeCkEBZ7GRF0cVdYW8nLJVhlsUUnV8wu9C
	KchuKr7Lq5ar0L62WtPjdg7/arBpb8/Ey7qlYX7VCTCcyrXjuvV4qGkYTPm2YkAK/ZIlRp85+BcG0
	ElF6ZFtSjCqFvhD9eFobG1GKeLG3Ghhy6SRGkdaMOwbGjOiKu1tHVUQ3LWz5XbWZXJpo4v0iRjHWN
	OrS707jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqtRb-0000000Gc4i-0HKC;
	Sat, 08 Mar 2025 12:38:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqtBX-0000000GZfY-3n8r;
	Sat, 08 Mar 2025 12:21:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741436502;
	bh=Z377FJil5SK9/YOHcLHU9+WtIml1vZ8VdHtz5jOkrvk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QHwM+9fdD651Khig5lMeNUOz5CP7SFKZ5aBYCF1Pp6A3Sa+Pr05KA99+mc6lqqxi8
	 zOXb/G/iaERo+gfN2y19vmnStDrFXZDS2INrrgTL0FKSFCVjAtEPgutq0+WLMtXkAN
	 bshWcKOBgBaPepFPKtvBzxzvVDO0cw8YYX6lZyuLopiJz/XI7vG0Gy7xpuGdBabh/S
	 S66npTxbR+1fBj8mLQNtIGpfuoSYQK+IMj6czJ80cwacnvun3Z9KjuU73go8f3XzD+
	 aAjrNYLhIXmKZnzjpHZR5v7o/PlzUSHobsc3rk1iY74pZXvWSJJLUYMZhMNC0Hvx4z
	 DAyS6yLhstmjA==
Received: from localhost (unknown [84.232.140.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 3795017E0657;
	Sat,  8 Mar 2025 13:21:42 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 08 Mar 2025 14:21:19 +0200
Subject: [PATCH v5 10/12] phy: rockchip: samsung-hdptx: Restrict altering
 TMDS char rate via CCF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-phy-sam-hdptx-bpc-v5-10-35087287f9d1@collabora.com>
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com>
In-Reply-To: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com>
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
X-CRM114-CacheID: sfid-20250308_042144_118231_A619C6E8 
X-CRM114-Status: GOOD (  19.99  )
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
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 52 +++++++++++++++++------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 0e1391b4c8bdb9cd0facfc80999929700579d667..a62c634f5254e742088515c3b21c05f95acbaded 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -402,6 +402,7 @@ struct rk_hdptx_phy {
 	/* clk provider */
 	struct clk_hw hw;
 	unsigned long rate;
+	bool restrict_rate_change;
 
 	atomic_t usage_count;
 
@@ -1756,10 +1757,12 @@ static int rk_hdptx_phy_configure(struct phy *phy, union phy_configure_opts *opt
 
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
 
@@ -1846,20 +1849,31 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
 static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 					unsigned long *parent_rate)
 {
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
-		if (rate == ropll_tmds_cfg[i].rate)
-			break;
+		if (ret)
+			return ret;
 
-	if (i == ARRAY_SIZE(ropll_tmds_cfg) &&
-	    !rk_hdptx_phy_clk_pll_calc(rate, NULL))
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
@@ -1867,6 +1881,20 @@ static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
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
 	return rk_hdptx_ropll_tmds_cmn_config(hdptx, rate);
 }
 

-- 
2.48.1


