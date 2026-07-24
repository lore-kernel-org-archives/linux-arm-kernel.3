Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34141C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTCgdt6IpHLKYtA76srcT7UD0TdTAQVzu4zf33H1PjU=; b=2h6LZJS0JVtuMVLZGkGzDsRmP8
	HnLRY/nwaeahqdF5JolrwqCTKUWzhAvV8dIAGHXkf+Hra7xYigGPTJRA3SDG48uQCRzGMF+JMUg6D
	7q/NF+SAdn7fpZMQ3bSxRU56QdxWFTZKA2ksuxjUvewkF/eHsv6Jt6lQ3nJpmWnABSapQOrQORTr0
	13Mvibfklss8a1gJDoGjsnPEJyvJAdOJs1L7vwNZ9zRNc92Vgk+xLEDpUagjj22cegW1z9/o1I7mz
	NZ0O8XlfKH9KczXnCXhfa7Y6VwdjemuSjnJKl95xr0ImMou0w1DmztmGp4NfFTk1e56tv48B6NOuU
	ebAv9oQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBpQ-0000000FuDy-1pXh;
	Fri, 24 Jul 2026 09:04:24 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBpJ-0000000Fu89-0m2Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:04:18 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so238442f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 02:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784883855; x=1785488655; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NTCgdt6IpHLKYtA76srcT7UD0TdTAQVzu4zf33H1PjU=;
        b=DfK2TIEzJWFiYpslFRQhbta9Js0A1sJnjpyArlxNIFjGvLcdwYritri504MheXfrQt
         PItWGYiQWOnzf4L/HpDc6BxqufWRTQZxkU2/ojIhEU5F4WINM7pT0T7b0I6Q7XPVBisK
         k90zK2iXcOQTY0lmiU1xsX8xyCmUvBc9OBExTRAeBxwDeH93bE+9RTDHXuJeo554Z+OQ
         WKIg2DPVq01pIJQCGtlHgyYl7Bhj6a0z1mhSVjG9udEvX/i5xVjqVSDf3q7lSDLFz8j4
         MR5RVUXD+h5csuHcwcS6sX07SrVHCx+rm4vEuqB3UTs28pZRjdqoc9gr3xDVA/4/UeeG
         s8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883855; x=1785488655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NTCgdt6IpHLKYtA76srcT7UD0TdTAQVzu4zf33H1PjU=;
        b=DQVswvOqrAnJ3kOB473HZJqk1JsL+7Im0B6Wm4hfIaPJMm/ljyTyWIbeEXoXYDYDZF
         ubHXK6oLR7tct8O4y+d0/D5vRigMOn1tpV771qtxnUaLJkmfeXK+2LVYts1ElrJnmemC
         zXjcOMePWVAyA+tKGSmCUh+Hl9wye6N7rM0Kl+tIS7cM1icCzPuQaYkEp4ZMZgWqoNkz
         HeuXxB04gXSAA0MM5x4M+DRrJSfRnNLe9Xju8XK9tKF4CeeL4Yptg6vW5oNEVZUJa7Hl
         6qUxXQGHTueFvC+c/PkGNLJNe8jmXPj3w6V4Syrcmxex/Oiy81sA5VzpXOlBb12AZWPv
         /Rwg==
X-Gm-Message-State: AOJu0Yy2FZV0Ps+cE1Q47djpBv57125L1rYSJJwWivjcdZeTXlQ5+GGJ
	DENM5RyplFp3fYrb41z2E45KdHQ52c6kMwR1siMCbPrK5C9cmmqsqiO8mUsEmlSCuaQ=
X-Gm-Gg: AR+sD10A0YcLFn1AtHfg90wkq+6CNpRDY1uUMl9jNpjAux8rjw6x4vyB//jybQxxKuO
	PKS471k1wLL6gwQv9cecXKEctdY0DxczkybqWEbLI84m2tt1nOviGf4yLLAt6n6/evt4EvpuLl6
	LbP7Dopp2CLwVtMcsdM0AnWr2qCCTxeaQn2tWXBoLUUh1uQaIUWqLjE3RvWo/tBa7h1Sl9v1i6u
	rX+sd9pFct7r3HwtqYQWtE96bngZuBc8ZtotEKv4JwJTjuXE/mhVn8WQjx8C+hFqlp+o87iHi2g
	oi8jv8B5gUPmnJyiUl4f16hcRx/lJ8kv3oBPQEQAxrl90D/l+B1ZOiismnaOaOOcBHlEVFnndhP
	fFy0G+sNRGEVCWk6kn26oUAfuUZmN0/76qQtAAzaavpXvemP3buuOpLW3GArDdA6K8YaMp+UISI
	UOVzCHM31hDE8=
X-Received: by 2002:a05:6000:2389:b0:47f:93b6:8d05 with SMTP id ffacd0b85a97d-47f93b68d60mr5219684f8f.0.1784883854883;
        Fri, 24 Jul 2026 02:04:14 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e584:93af:f3aa:2c19])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c67339sm23918983f8f.31.2026.07.24.02.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:04:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 24 Jul 2026 11:03:53 +0200
Subject: [PATCH v2 2/7] clk: qcom: clean-up simple provider misuse of the
 consumer API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-clk-provider-simple-clean-v2-2-56f306156d25@baylibre.com>
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3253; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=tWtyJH+acydIB1bHXKtC61kdBeQ9YCay3I6fogeNCBU=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYyp/w45qmtTosQnIAx1OStRzPQvEsipL2E/Lw
 yCoEF/QmN2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamMqfwAKCRDm/A8cN/La
 hUwkEACyf9+F3KKPL0lbfHI4K+dGS21x1ICKK2JloqLuptXfFmL93tKHFaBxvE3RoGIW4MnvD/a
 xjl/mhXdOBKFrrPN52n1H6Sy8BHbgV8b4iFfbZPTA/bH+VOHj1gaRcWw9BobjbZr505l3QYjFLB
 dhOF5mk5Zb0zs0Y37gJ6s50bYPpgaghJh1nbJowznMuN7RBPXOg7keZM4c4E+QSTxVw124y/PY7
 /a9LUuCd2p6+4nJWEIn+w22fNzwtmZIyfVlPZIe8ryf943A4eeIScf3NtHqaeptGBrD+i5yR8GI
 wNSgGwUVp6/DTMAntJwPVRJMwz6Cp8tX2iLHclB0sKeQWc0cVWc43QWD8dALm1fDvAyXZ0zdvY9
 i9beXiBoks+gDe8LHd3j+kuUvrrbL4xtl7dNRb8GRYkCw2RqZsd5vuOn6InV5PRftsPqKTcfNKY
 2fu/wtL0pLSimUUyLdjJmLaIaVOjQ6ne2OlWtUYRaB/TwkSrgsN9uUcwXfBOfBpS1DhYpOWH/C3
 awHFTp2tmLQXR4lJrO2t9kzkb1VPfu1G3wRkZ3eICcTJ+dPhuLjwiATQYp6yj3RM4+ZALuaIBA0
 7IVsJwEto2YbLOKaI4xcK15Ne9C70RG35dvwyZdDvtNZApIEJNFfJQf9cPLXIKhtfqJED/5RkSo
 zWdND+QOyfzSa+g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_020417_260120_86ABD991 
X-CRM114-Status: GOOD (  15.77  )
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

Clock provider should not be using the consumer interface.
In other words, a provider should not be dealing with struct clk.

This change targets occurrences for which the provider uses the
consumer interface and corresponding clk_hw interface exist.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/qcom/clk-hfpll.c | 4 ++--
 drivers/clk/qcom/clk-krait.c | 2 +-
 drivers/clk/qcom/clk-rcg.c   | 4 ++--
 drivers/clk/qcom/clk-rcg2.c  | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/clk-hfpll.c b/drivers/clk/qcom/clk-hfpll.c
index 705352aff067..9e9118d24df7 100644
--- a/drivers/clk/qcom/clk-hfpll.c
+++ b/drivers/clk/qcom/clk-hfpll.c
@@ -166,7 +166,7 @@ static int clk_hfpll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	spin_lock_irqsave(&h->lock, flags);
 
-	enabled = __clk_is_enabled(hw->clk);
+	enabled = clk_hw_is_enabled(hw);
 	if (enabled)
 		__clk_hfpll_disable(h);
 
@@ -220,7 +220,7 @@ static int clk_hfpll_init(struct clk_hw *hw)
 		regmap_read(regmap, hd->status_reg, &status);
 		if (!(status & BIT(hd->lock_bit))) {
 			WARN(1, "HFPLL %s is ON, but not locked!\n",
-			     __clk_get_name(hw->clk));
+			     clk_hw_get_name(hw));
 			clk_hfpll_disable(hw);
 			__clk_hfpll_init_once(hw);
 		}
diff --git a/drivers/clk/qcom/clk-krait.c b/drivers/clk/qcom/clk-krait.c
index f5ce403e1e27..5e4408b7445d 100644
--- a/drivers/clk/qcom/clk-krait.c
+++ b/drivers/clk/qcom/clk-krait.c
@@ -68,7 +68,7 @@ static int krait_mux_set_parent(struct clk_hw *hw, u8 index)
 	sel = clk_mux_index_to_val(mux->parent_map, 0, index);
 	mux->en_mask = sel;
 	/* Don't touch mux if CPU is off as it won't work */
-	if (__clk_is_enabled(hw->clk))
+	if (clk_hw_is_enabled(hw))
 		__krait_mux_set_sel(mux, sel);
 
 	mux->reparent = true;
diff --git a/drivers/clk/qcom/clk-rcg.c b/drivers/clk/qcom/clk-rcg.c
index 31f0650b48ba..1664101e8f78 100644
--- a/drivers/clk/qcom/clk-rcg.c
+++ b/drivers/clk/qcom/clk-rcg.c
@@ -208,7 +208,7 @@ static int configure_bank(struct clk_dyn_rcg *rcg, const struct freq_tbl *f)
 	bool banked_p = !!rcg->p[1].pre_div_width;
 	struct clk_hw *hw = &rcg->clkr.hw;
 
-	enabled = __clk_is_enabled(hw->clk);
+	enabled = clk_hw_is_enabled(hw);
 
 	ret = regmap_read(rcg->clkr.regmap, rcg->bank_reg, &reg);
 	if (ret)
@@ -771,7 +771,7 @@ static int clk_rcg_lcc_set_rate(struct clk_hw *hw, unsigned long rate,
 	regmap_update_bits(rcg->clkr.regmap, rcg->ns_reg, gfm, 0);
 	ret = __clk_rcg_set_rate(rcg, f);
 	/* Switch back to M/N if it's clocking */
-	if (__clk_is_enabled(hw->clk))
+	if (clk_hw_is_enabled(hw))
 		regmap_update_bits(rcg->clkr.regmap, rcg->ns_reg, gfm, gfm);
 
 	return ret;
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 6064a0e17d51..d7914e59129f 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -489,7 +489,7 @@ static int clk_rcg2_determine_gp_rate(struct clk_hw *hw,
 	u64 parent_rate;
 
 	parent = clk_hw_get_parent(hw);
-	parent_rate = clk_get_rate(parent->clk);
+	parent_rate = clk_hw_get_rate(parent);
 	if (!parent_rate)
 		return -EINVAL;
 

-- 
2.47.3


