Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97309C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 12:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvQ62Z/F7aiNDOgRiIV13f36oVsy1CoYj5ApJvc5CoA=; b=ZwXu1snVQFHmh5s9xdACwQJ87z
	osa+HUFt2Ba7OyVCMF7jtHyD/qrIElx1nOY32M0ejjPJHwjPOh2F/UgL23KFmOpXR0YZjIPBWcMT5
	a5/BEfbAaJCEuFja0ZLLu8o1TyL0B8kRXyIyi1W/p+jUvo0TwEj1naVwdnwu0TwTGVilpmGukiZOA
	Yp9gVp3kentM07oKOqoGa6pTtoiBKlI4Vdzd8vkvqqRANhTDNt9YFJPrALp7NfcD7Z3B0wfcjkHJD
	ks9b5UVfyB5HK0qVRWsYrbScWuvkuyqK7lmmSoIWBYzt7ElYkyunGFeUGvxqsyGOtoRBYZtAtcLJN
	9emI9bRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujGmy-0000000Ci8s-2vpb;
	Tue, 05 Aug 2025 12:29:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujGHp-0000000Cdk3-109O;
	Tue, 05 Aug 2025 11:56:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754395015;
	bh=VVmcfxwz/BIjTaYrLE6b0OQS4rHqgOp2ro0shp9GpoA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EEBgMiMEnk8SQQZYs2TryGS1bx22u+SdTv9GxwTxdjJA00AUecm07rND6PKz+veyO
	 V7BqGCfBAuJfjSPxct5It7wYPcgLlebUxGciA08nBWX3TXuN75+OR6JqXa9kAF5Ybo
	 pewZb0LBehJRjiH2a6xSraMtAQEZ4+vWqP31HzH0MjyZ3hCVZYRNp58yO608snmcaU
	 koe+uaApRIanZWCc0Q6fzM1WJp/iAkw7S1adytoiwwS/yl9aKnUfXzHYYUv1Nty/Xg
	 +auifagiw6ODgVOo91wHCUSfu/wSZyrydEbQwVclx9wfgcOjGNUuxcF8q98xwx0azS
	 Gbzer4JM67WHg==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id BD24D17E0DB9;
	Tue,  5 Aug 2025 13:56:55 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 05 Aug 2025 14:56:53 +0300
Subject: [PATCH v2 11/14] phy: rockchip: samsung-hdptx: Drop hw_rate driver
 data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250805-phy-hdptx-frl-v2-11-d118bd4b6e0b@collabora.com>
References: <20250805-phy-hdptx-frl-v2-0-d118bd4b6e0b@collabora.com>
In-Reply-To: <20250805-phy-hdptx-frl-v2-0-d118bd4b6e0b@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_045657_428662_97BF25F0 
X-CRM114-Status: GOOD (  13.95  )
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
index 6e2443f78968948b84e4261e33761fe0d189553b..4195387108d8786c2b7cabb6d2f3c07315fefd88 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -401,7 +401,6 @@ struct rk_hdptx_phy {
 
 	/* clk provider */
 	struct clk_hw hw;
-	unsigned long hw_rate;
 	bool restrict_rate_change;
 
 	atomic_t usage_count;
@@ -964,7 +963,7 @@ static int rk_hdptx_tmds_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
 {
 	const struct ropll_config *cfg = NULL;
 	struct ropll_config rc = {0};
-	int ret, i;
+	int i;
 
 	if (!hdptx->hdmi_cfg.tmds_char_rate)
 		return 0;
@@ -1026,12 +1025,7 @@ static int rk_hdptx_tmds_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
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
@@ -1936,9 +1930,6 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
 	u64 rate;
 	int ret;
 
-	if (hdptx->hw_rate)
-		return hdptx->hw_rate;
-
 	ret = regmap_read(hdptx->grf, GRF_HDPTX_CON0, &status);
 	if (ret || !(status & HDPTX_I_PLL_EN))
 		return 0;

-- 
2.50.0


