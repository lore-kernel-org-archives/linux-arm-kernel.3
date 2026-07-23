Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB10C531CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 10:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFqonK3BjYNpZGqcCAw+wY74K13WEhgmD2D1si4hUes=; b=BA2C3uui5nAJ6NCWSP9g1HBCxh
	YIu+GnH7iTLEcmip9/stet+lOOcSu7NF67Kxlxc5ZEHMgKxspCy4EA4H5YoZPB4ZhO8Ro9bVY3DQz
	0HED8cRCSHG1x1LP51wX6tgedDa4DnTjjN6x1M0Ghx3UYjQHZ3GxfLAGiNY2tpJK1OLC1my6VAGtR
	Uho2hLiGQIS5BUNEylUr4eMC18FWzq8ef2Q9WTvsjvQ4Aq90xfsDFuyChlnKR/KEaDCq1QcJ/rzV0
	XUyXsbu9dCXaUGq4kj88QmgOv+cqYvUvtIOtUtcY5B34a6lU5IWRGr8vKGnwKfaXYrYlbLqwbFCJ2
	NNWgCvaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqZN-0000000E0jO-1ill;
	Thu, 23 Jul 2026 10:22:25 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqZK-0000000E0gk-011Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 10:22:23 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-69c5f6f7a40so944626a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 03:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1784802140; x=1785406940; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pFqonK3BjYNpZGqcCAw+wY74K13WEhgmD2D1si4hUes=;
        b=0lovOwQMsIQ+R2QZpeYez6SkIHp0Jl+ZDKvFJVqFLt6nePg2O+BGoj2+VbbVk/sV3L
         0YrRhG/qYb+x7mZRvLkhM/jRRbFyLBJBurvY2vJ7XbeHYclsDhYq/rlt4q+/TXTVvLD9
         7Y373dXoEvUDbJ0nihfhn5ZFw6IZPMMsMHnRFryK26W5vaaru/hRpZpse4ldfr8KXaoN
         WoKL7C7mwV8HlGK9fMkI6SuKV4zTlf/tSBBK1Z+DQllTtuoFP2Jrx5Ldic39REPhQ2XM
         g7hqD4AfI7VRTcXrd314nZXFYK0AtkB4jYcPrKiBtwUvA9KVRgcnaTT30Z5N6gxFe60W
         k1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802140; x=1785406940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pFqonK3BjYNpZGqcCAw+wY74K13WEhgmD2D1si4hUes=;
        b=TE2rT+pQ5dB3ZZ7xBiFFfECA0S28wkZT3VVkSy44/D4R4vEhqOlraeaX9ugvB469xF
         GspG1UbprhMW2eU2+zZuje1pSDIv5XD+yk8obz26+ZWw7nemyuvrGCCPlOSfsqfmX06u
         KpwOVudqMcudCqRrTnu7+eAo1aa1M9K2v1kVJ9NORIy6/AqlEq8pTFCASnO5InRXLiJ6
         YX+FMdEoqFjsiIKZ5hqydopcsZdxodsltL7C4XpPrwfkIQnwQTTOCvURXLSEyNavZWTl
         g8x8EAIGMPARkv2PRVgjiWgZZoCKEZA7wJegyNxYJ753gXWwnA9wt5dOUaBC0YQ9CeJT
         WDGw==
X-Forwarded-Encrypted: i=1; AHgh+Rp9sZqGvm7kOiBZ9zD5O6Wl1wnNuq/kA9zOTsqNvWM1LzW+C3UepUd2KxKNvNq6wpwHYxIAv5g3AQhBFytGbZH+@lists.infradead.org
X-Gm-Message-State: AOJu0YxYAfHl1fdZhTcT5ragHu0dcxqOuxgcfmEfM6Z6s584echBUSvi
	D7iMYf2Xn+gp+ptX0Pc1bkdyLgcepRlEJ/uhhXbukSapJsaOjL0Pdq+sMWGKwLgGOkY=
X-Gm-Gg: AR+sD13lPwGrUxEG2YEWT9jQ+80qF5YRrZoIYXmlIzfNVFfR3R63e7Q2esF0KVu/2pA
	hW658cyyX7b950O3az/wFWuOlo+JhCApg8QtPGhRcPi0mPWMW29fy2GFqqdt3FFi1tOK8p4YsNt
	iuqIREVGJe3Rmg2jUc2r9HDskKITA7UQjTzoUpujng6JzkXVVC2tJnTHQKluBAHuDBFq9PAOdQ/
	QjzjnTnBG/pdvfz8eB9vprQUPqOCLsuAFsRbEiUiNrmNUH8qBGwQ5Ze5p8Hw8nWlhfX3U2lAwhE
	s0XkxfWH1Ht7omhsLFMmLzDisK10ADn+FX/yu8sZD7VXtPEPhbJJ87K82fpiv0jDcSelTeypJ3Y
	hYH6jM2Y0HejUgurCnkTuGATFLCnbOMTwTVX9cpzNYEXZtXtQlzxt2+1klgDz863cXMgw+Ifp00
	4G7/tJaxXCAbwa8/qUtNxlEQ==
X-Received: by 2002:a05:6402:a51b:10b0:698:b6c8:70db with SMTP id 4fb4d7f45d1cf-69f6bc1afafmr613329a12.8.1784802140246;
        Thu, 23 Jul 2026 03:22:20 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.32.126.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f35020dcfsm1944928a12.20.2026.07.23.03.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:22:19 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 23 Jul 2026 14:21:59 +0400
Subject: [PATCH v2 2/2] clk: rockchip: Fractional PLL coefficient on
 RK3588/RK3576 is two's complement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-rk3588-fracpll-v2-2-3adfb9dda235@flipper.net>
References: <20260723-rk3588-fracpll-v2-0-3adfb9dda235@flipper.net>
In-Reply-To: <20260723-rk3588-fracpll-v2-0-3adfb9dda235@flipper.net>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, YouMin Chen <cym@rock-chips.com>, 
 Wyon Bi <bivvy.bi@rock-chips.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6189; i=alchark@flipper.net;
 h=from:subject:message-id; bh=SA2Nr/sgMInMeZ9zzbOPl13XCwabwddmdhZt2984r/4=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQlvvaS+rNBss8nqypqdZf5nzcZrzfM2Df9earNnaVOb
 y0upN3W7pjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCq5fYwMnyttxAWdlv1xaR/y6qj7dkdXkcnT/IR4Wd57O4rdPd17EJGhodW739
 OU3prdSAv+qfIs1CmXTLSIeHHM1xKHpsHluWrsgMA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_032222_098216_A9D1F2EF 
X-CRM114-Status: GOOD (  20.96  )
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

When the PLL rates table was first committed for RK3588 (and later reused
for RK3576), the fractional PLL coefficient was defined as an unsigned
value, while the TRM clearly states that it is a two's complement 16-bit
value.

Treating the fractional PLL coefficient as unsigned in rate recalculation
results in a kernel-visible rate which deviates from what the hardware
actually generates by Fin / (p * 2^s), or 2 MHz for the two affected table
entries.

Rockchip's downstream kernel later revised the fractional PLL code [1] to
account for the two's complement nature of the coefficient, but that
change wasn't upstreamed.

Change the PLL table definition to use two's complement for the
fractional coefficient and update its users accordingly.

Note that a negative fractional coefficient is meant to be subtracted from
the next larger integer multiplier, so the m values in the table are
also adjusted accordingly for the two negative-k entries.

Rockchip's downstream commit introducing the two's complement logic for k
also does unrelated tweaks to the PLL parameters which are not explained
by the switch to the two's complement, so they are not replicated here.
If any of the parameters prove to need further tweaks (e.g. for precision
or jitter) that would better be done in targeted follow-up commits.

Fractional PLL rates don't seem to be used by any current mainline
consumers, so this is purely a correctness fix. It will also be important
to properly support DisplayPort output going forward, as the video output
controller derives its pixel clock from system PLLs with no dedicated PHY
PLL option for DP unlike HDMI, and some display modes are only achievable
using fractional PLL rates.

Link: https://github.com/flipperdevices/rockchip-linux/commit/7a72bc05dcc3a51e85ae531749e6270bf9b9212d [1]
Fixes: f1c506d152ff ("clk: rockchip: add clock controller for the RK3588")
Fixes: cc40f5baa91b ("clk: rockchip: Add clock controller for the RK3576")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/clk/rockchip/clk-pll.c    | 7 ++++---
 drivers/clk/rockchip/clk-rk3576.c | 4 ++--
 drivers/clk/rockchip/clk-rk3588.c | 4 ++--
 drivers/clk/rockchip/clk.h        | 8 ++++----
 4 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index bf8acf7cee0d..706ca4b344d3 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/clk-provider.h>
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 #include <linux/regmap.h>
 #include <linux/clk.h>
 #include "clk.h"
@@ -906,6 +907,7 @@ static void rockchip_rk3588_pll_get_params(struct rockchip_clk_pll *pll,
  * For Fvco < 3 GHz: period jitter +-2% frac PLL, +-1.50% int PLL
  * Fvco = ((m + k / 65536) * Fin) / p
  * Fout = ((m + k / 65536) * Fin) / (p * 2^s)
+ * -32768 <= k <= 32767 (only available in frac PLLs, not int PLLs)
  */
 static unsigned long rockchip_rk3588_pll_recalc_rate(struct clk_hw *hw, unsigned long prate)
 {
@@ -920,11 +922,10 @@ static unsigned long rockchip_rk3588_pll_recalc_rate(struct clk_hw *hw, unsigned
 
 	if (cur.k) {
 		/* fractional mode */
-		u64 frac_rate64 = prate * cur.k;
+		s64 frac_rate64 = (s64)prate * cur.k;
 
 		postdiv = cur.p * 65536;
-		do_div(frac_rate64, postdiv);
-		rate64 += frac_rate64;
+		rate64 += div_s64(frac_rate64, postdiv);
 	}
 	rate64 = rate64 >> cur.s;
 
diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
index 2557358e0b9d..63f229e73a45 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -79,13 +79,13 @@ static struct rockchip_pll_rate_table rk3576_pll_rates[] = {
 	RK3588_PLL_RATE(1008000000, 2, 336, 2, 0),
 	RK3588_PLL_RATE(1000000000, 3, 500, 2, 0),
 	RK3588_PLL_RATE(983040000, 4, 655, 2, 23592),
-	RK3588_PLL_RATE(955520000, 3, 477, 2, 49806),
+	RK3588_PLL_RATE(955520000, 3, 478, 2, -15730),
 	RK3588_PLL_RATE(903168000, 6, 903, 2, 11009),
 	RK3588_PLL_RATE(900000000, 2, 300, 2, 0),
 	RK3588_PLL_RATE(816000000, 2, 272, 2, 0),
 	RK3588_PLL_RATE(786432000, 2, 262, 2, 9437),
 	RK3588_PLL_RATE(786000000, 1, 131, 2, 0),
-	RK3588_PLL_RATE(785560000, 3, 392, 2, 51117),
+	RK3588_PLL_RATE(785560000, 3, 393, 2, -14419),
 	RK3588_PLL_RATE(722534400, 8, 963, 2, 24850),
 	RK3588_PLL_RATE(600000000, 2, 200, 2, 0),
 	RK3588_PLL_RATE(594000000, 2, 198, 2, 0),
diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 75d42fea2a11..24baa0ef9bf3 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -79,14 +79,14 @@ static struct rockchip_pll_rate_table rk3588_pll_rates[] = {
 	RK3588_PLL_RATE(1008000000, 2, 336, 2, 0),
 	RK3588_PLL_RATE(1000000000, 3, 500, 2, 0),
 	RK3588_PLL_RATE(983040000, 4, 655, 2, 23592),
-	RK3588_PLL_RATE(955520000, 3, 477, 2, 49806),
+	RK3588_PLL_RATE(955520000, 3, 478, 2, -15730),
 	RK3588_PLL_RATE(903168000, 6, 903, 2, 11009),
 	RK3588_PLL_RATE(900000000, 2, 300, 2, 0),
 	RK3588_PLL_RATE(850000000, 3, 425, 2, 0),
 	RK3588_PLL_RATE(816000000, 2, 272, 2, 0),
 	RK3588_PLL_RATE(786432000, 2, 262, 2, 9437),
 	RK3588_PLL_RATE(786000000, 1, 131, 2, 0),
-	RK3588_PLL_RATE(785560000, 3, 392, 2, 51117),
+	RK3588_PLL_RATE(785560000, 3, 393, 2, -14419),
 	RK3588_PLL_RATE(722534400, 8, 963, 2, 24850),
 	RK3588_PLL_RATE(600000000, 2, 200, 2, 0),
 	RK3588_PLL_RATE(594000000, 2, 198, 2, 0),
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index 9e3503e2ffc2..72b36bba3152 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -635,10 +635,10 @@ struct rockchip_pll_rate_table {
 		};
 		struct {
 			/* for RK3588 */
-			unsigned int m;
-			unsigned int p;
-			unsigned int s;
-			unsigned int k;
+			unsigned int m;	/* main divider, 10 bit unsigned */
+			unsigned int p;	/* pre-divider, 6 bit unsigned */
+			unsigned int s;	/* scaler, 3 bit unsigned */
+			s16 k;		/* fractional part, 16 bit two's complement */
 		};
 	};
 };

-- 
2.54.0


