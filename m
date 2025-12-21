Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F194FE67495
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 10:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0kY0TFPuM1qyyLvgFCgy+KFCUyu2pSQWV08ycb1SmA=; b=jx9k8W7t1yP4zBVv5ezFP9yDi2
	b09642x9lFocrvVbqTay5jYuqtnSKVE8bknXtmDNaLl/RrLYugd6e40DYnzTxG8+b7k/Btqk6Lho0
	besHYPufqkB9z9jiRDmTi7x86c5q760mHl3dv4dZZTAhI3dyAvsLft/cJgA82Kh3ZoZnxJYce9hsa
	9UeGA5UzJabxkzW2eOvwcvEIkv++CZctJxJrHxS1fXmBWmZajhsMGcGXZE+ikjgVp0ouR7AIyj0GP
	Fk5neMNaCIxOdWC2S5MbITis/INmFblwLNBY/Ono7sOaCx442hsxe+nYO8E/5j1bEjPZzA9knaCQ7
	MQk+G+kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXGyA-0000000CLBB-1Irz;
	Sun, 21 Dec 2025 10:47:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXGxz-0000000CKxD-2aPw;
	Sun, 21 Dec 2025 10:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766314028;
	bh=pkrTHhkieAKBxBYD20sxtrfyc/Bzjx9yUWbb8SYks40=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YpZQu4+C3iE8xIhcjAz8rUSLJjp0vA3IHSXYYgUOm3xV0RHSBsPWXPzVxrtsPFThi
	 ZRkLdrRc8N7YkgiaXJFXawET6ZvOAh+vJLAsDLl89hSnuteX/0O792ryfF/NOoHy7y
	 JcUq2t234psTdvyETXZQFLAyO4pnGz7W9oYHvQiGMgXylY3bBEG4K8dodW/j5K/FBG
	 57bj2uD6KQN2zrIYS2mdChnBXjPQj8UujHXb3vejox1Tbg36CkZdDHMycRoxv7h4Ms
	 Ru2F5sBKns2q+07F/AXhxxdVDCw5p13j2wpeCINPgzhf86cIMKAaFKe8Ly4dpoIb1k
	 b6/omHP3nEAGg==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F57B17E12E8;
	Sun, 21 Dec 2025 11:47:08 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sun, 21 Dec 2025 12:46:55 +0200
Subject: [PATCH v5 08/11] phy: rockchip: samsung-hdptx: Drop hw_rate driver
 data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-phy-hdptx-frl-v5-8-dac390a780be@collabora.com>
References: <20251221-phy-hdptx-frl-v5-0-dac390a780be@collabora.com>
In-Reply-To: <20251221-phy-hdptx-frl-v5-0-dac390a780be@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_024711_960277_A55A380D 
X-CRM114-Status: GOOD (  12.80  )
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

The ->hw_rate member of struct rk_hdptx_phy was mainly used to keep
track of the clock rate programmed in hardware and support implementing
the ->recalc_rate() callback in hdptx_phy_clk_ops.

Computing the clock rate from the actual PHY PLL configuration seems to
work reliably, hence remove the now redundant struct member.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index c2d2f2468ba2..5a534c53a52d 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -387,7 +387,6 @@ struct rk_hdptx_phy {
 
 	/* clk provider */
 	struct clk_hw hw;
-	unsigned long hw_rate;
 	bool restrict_rate_change;
 
 	atomic_t usage_count;
@@ -931,7 +930,7 @@ static int rk_hdptx_tmds_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
 {
 	const struct ropll_config *cfg = NULL;
 	struct ropll_config rc = {0};
-	int ret, i;
+	int i;
 
 	if (!hdptx->hdmi_cfg.tmds_char_rate)
 		return 0;
@@ -993,12 +992,7 @@ static int rk_hdptx_tmds_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
 	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_CLK_EN_MASK,
 			   FIELD_PREP(PLL_PCG_CLK_EN_MASK, 0x1));
 
-	ret = rk_hdptx_post_enable_pll(hdptx);
-	if (!ret)
-		hdptx->hw_rate = DIV_ROUND_CLOSEST_ULL(hdptx->hdmi_cfg.tmds_char_rate * 8,
-						       hdptx->hdmi_cfg.bpc);
-
-	return ret;
+	return rk_hdptx_post_enable_pll(hdptx);
 }
 
 static int rk_hdptx_tmds_ropll_mode_config(struct rk_hdptx_phy *hdptx)
@@ -1903,9 +1897,6 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
 	u64 rate;
 	int ret;
 
-	if (hdptx->hw_rate)
-		return hdptx->hw_rate;
-
 	ret = regmap_read(hdptx->grf, GRF_HDPTX_CON0, &status);
 	if (ret || !(status & HDPTX_I_PLL_EN))
 		return 0;

-- 
2.51.2


