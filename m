Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E219CC43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMIl1Eh3yVsZrdBP1XorCdcYvGVBjprl7wt0TiPGGoE=; b=Bws9Z6y8DPnTQxL4mOuQXTPhpJ
	DiF7P5jLyTjsjcPWegoRQav01wgV7nNcvUOjPOwwMigCObZ/6RWOpXo8dORWOvXdqe3SNTk+Umldu
	MKK2boGUqhE9J+DU8O9KitlMO5e0sjQL/Skgcg2QrOvbKM8AJolCBmEgTAlPXrkPVPkJ3qdnDzvyx
	4uvN4SQ8Iv3fTTwFKYHeJd7I0Y3OwKIYquhs9c4FftRPZyVbMxpctoRdOLdM8fEx5pL67gnK0buMI
	98nDotOkuoC+FDx83XDQGFY61ODmYhr+C/ErPQ3OaZa013bbdt9Z1CFdlvRLNFBCpzfqkxBT/jsTv
	AdMFSUMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCVh-00000003oJH-1rQR;
	Thu, 02 Jul 2026 08:11:01 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCVe-00000003oFm-3QbI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:10:59 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso6437485e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 01:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979857; x=1783584657; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMIl1Eh3yVsZrdBP1XorCdcYvGVBjprl7wt0TiPGGoE=;
        b=Kykq94nVVGuQ2btGT7f66+XG3WvvVxrbYQNYx3Y4GAX95AudRSAVUO16P/9q4Aq8T+
         Qly08wLe62b0NM7WonC5PehZnSqYpFP17RNxntkBaRJnzLBr3zaAuUGx8+6cjdRdl7GA
         +/XpYNQ1WBNXmsOnw/b9IYVzJ7jxhXMRLKRFkUhS6j6p1JLkelqnieAAsOFcUOm5o5QU
         8t4DcIb111lwtfd10vqZTkSU9B6HRkrsBaRJPsc/0wBwqGiZtIsRb/cqBjzOwcCWGs/V
         5UZuXWPzEHEx9RWn7MV6DVs1J0twYe1zOpGbMROTos0HBhBu5hjFheo8r2JtSElFi1zX
         8Gfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979857; x=1783584657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zMIl1Eh3yVsZrdBP1XorCdcYvGVBjprl7wt0TiPGGoE=;
        b=ZDCcBS5TVtR7d+dsVPLRJwMfYm7Jeyn1uwHs9aUXj7vImK6jhCPD7JkHoq6NnfOFs4
         MraLKfr/TX1g2akgR0eKoV8v8jsxElFWeJ5ncUsw0MRh5jmg2j3Mru3FwKkIucKj9K5O
         iGT3pv8Opv0zuj0ks0rMneeks8+yrn4Gf1jYGOwS0eq4AZQkmymboen8P+deSUYCeN0Q
         MeDbmDPhpLJI6RdeH60ohrb2hwmipvTmMhms4p/hTx2187+7WP6AP6q9SoR4LSwRsHxf
         h3RIGKcDIK4nXePY1vv1cUaQWpj0Pm1kfKeLIIbYlWIh+ggcyKG/sWmmaXvMTY3isZff
         Jqiw==
X-Forwarded-Encrypted: i=1; AFNElJ9/rTtn5GHlRx/AV3QN2eiw1d2Yq/Tcmiii78/Oc3hiUFZKNjoG+tp94Dppw7kmtY4eZBPaEWDFPx2PO4IZolh6@lists.infradead.org
X-Gm-Message-State: AOJu0YzG/Zo2enxzIYRLC2Bkn7TeM58bmZCw9Y7vy1MxB4UF3UzZBvl4
	Md5b6Jape74yYOMye9HJHtndbRtS5mx5+/xxLlxNWDOogIJ+4R4UJTZcHgG1e8C4cpo=
X-Gm-Gg: AfdE7cmCbESG9T4JFFieUvXAWB95E4WNYJlolsTNRWgBPLeVAqEssE0DL/JLx74OESf
	1B6+plDhxKQRGIG+jB8MGySPnhlDjhuQ4lf00Xb9qexCauzYqHTYU75r0VX6L0WLHcy/fG51Rxy
	Qgoloe7YeHu4U7WOpCaMeDh/BfjfYViONVuyTNNi8TjTJLO2q1/Zu420tC1Y30yHzIwFgg0Kle6
	g/N2f1Qwvb2FG17cjpsds6guTqwLl0d6TgruiKtX2mSyOngExBJCBRhpYe4lox2FmM5X/shKKmO
	gHye1YyCoBUjvVQC/OnXHiFEqrtMw8IkZfR9PRcQu9I2sGg/aOMtY7Ia98ptVlmx3PWUKbqL93w
	YMheXDv4NPAbwFM90Uoes9FEZcPkKPWZzJ3O5D2Qyc9JQ/fgAROvXFmi4ETMbBvw6/km8X4i+NU
	Mkkge97/GKuQ0=
X-Received: by 2002:a05:600c:3e15:b0:493:a8ff:d7af with SMTP id 5b1f17b1804b1-493c2b15c9bmr72077075e9.4.1782979857187;
        Thu, 02 Jul 2026 01:10:57 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c6354771sm29596785e9.3.2026.07.02.01.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:05 +0200
Subject: [PATCH v3 6/8] clk: sunxi-ng: div: add read-only operation support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-6-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
In-Reply-To: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4152; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=2L2d0QfPA9w8m9zLHFuDIP+92mtPVG6eY7jP2BAgsNc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz7i1ZELfjYtb5C5oSl5YLVh5u5d5JSDVFlW
 oxSy/mKcsyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc+wAKCRDm/A8cN/La
 hXkTD/9UqEGQ7lP5+o137L4ZK0dj6r9uITACcbnFagNW8dgCdbRUU1Gkc0pqcmmiv7+UB8ntF87
 o3jhmGckjY10GSP4z5O8LRX/RFDQxleFMjfojpwO36ioEKJgnSlA+lu6OQhi+g46wQnN6DtJxEr
 7JlXSuU8D4pI9ZQn31jIAnknDdGuyFwCU4AyWVBFecyW+hb4MBoA2tFxwxGlNEVY/TUTXx2QY4x
 tYvNkf1qU8DkddNz3GUjYzAil3ORQTbsYfo2jaVBXakn+CO9BWdNsGeBhkUn4ztynpV6xy/rtuU
 lT79/EIarFGTxDfnY+bVcEwjofdNIiVhoX+pH7wegGNzkxeYD5ZQaBA/BkWGCtjunu01dEGyu1D
 qfKldcvBjqwRW6evTZxpsz4AelUn8ryl95Z5blQogwYlL0us3lXlUBIA7yXmxL5H6T/aWPctE8y
 6vgieBFPI3dWAgVTtuQiLGVMCGH9oUWKi+yHa9vSDnK6YOz1MT7iOcNqkzYDdwVv4TT+9uvUGB3
 DCbtmqU4H6691jYrfWWqQ1Pqet1p5g4i+mv30yFGfOlGL370t9V+6n+XWEq7wiSIbX53129CGo/
 xFa0KgrvLpUNUzhv2A9ND2uuvgGDvNbpeN+kjVgK1rB2PNnhZ8gwqPB7CuvqchwTz7tb4Z1BAh6
 7IchPeO7hREhSqA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_011058_889546_628D4C15 
X-CRM114-Status: GOOD (  16.08  )
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

Add support for sunxi-ng read-only dividers. This will be
useful to the a733 oscillator detection logic.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_div.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_div.h |  1 +
 drivers/clk/sunxi-ng/ccu_mux.c |  3 ++-
 drivers/clk/sunxi-ng/ccu_mux.h |  4 ++++
 4 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 62d680ccb524..d1c8c7baa12d 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -84,6 +84,36 @@ static int ccu_div_determine_rate(struct clk_hw *hw,
 					     req, ccu_div_determine_rate_helper, cd);
 }
 
+static int ccu_rodiv_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
+{
+	struct ccu_div *cd = hw_to_ccu_div(hw);
+	unsigned long val;
+	u32 reg;
+	int ret;
+
+	reg = readl(cd->common.base + cd->common.reg);
+	val = reg >> cd->div.shift;
+	val &= (1 << cd->div.width) - 1;
+
+	req->rate = ccu_mux_helper_unapply_prediv(&cd->common, &cd->mux, -1,
+						  req->rate);
+
+	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		req->rate *= cd->fixed_post_div;
+
+	ret = divider_ro_determine_rate(hw, req, cd->div.table,
+					cd->div.width, cd->div.flags, val);
+
+	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		req->rate /= cd->fixed_post_div;
+
+	req->rate = ccu_mux_helper_apply_prediv(&cd->common, &cd->mux, -1,
+						req->rate);
+
+	return ret;
+}
+
 static int ccu_div_set_rate(struct clk_hw *hw, unsigned long rate,
 			   unsigned long parent_rate)
 {
@@ -143,3 +173,15 @@ const struct clk_ops ccu_div_ops = {
 	.set_rate	= ccu_div_set_rate,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
+
+const struct clk_ops ccu_rodiv_ops = {
+	.disable	= ccu_div_disable,
+	.enable		= ccu_div_enable,
+	.is_enabled	= ccu_div_is_enabled,
+
+	.get_parent	= ccu_div_get_parent,
+
+	.determine_rate	= ccu_rodiv_determine_rate,
+	.recalc_rate	= ccu_div_recalc_rate,
+};
+EXPORT_SYMBOL_NS_GPL(ccu_rodiv_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_div.h
index be00b3277e97..a30a92780a05 100644
--- a/drivers/clk/sunxi-ng/ccu_div.h
+++ b/drivers/clk/sunxi-ng/ccu_div.h
@@ -300,5 +300,6 @@ static inline struct ccu_div *hw_to_ccu_div(struct clk_hw *hw)
 }
 
 extern const struct clk_ops ccu_div_ops;
+extern const struct clk_ops ccu_rodiv_ops;
 
 #endif /* _CCU_DIV_H_ */
diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 766f27cff748..e2d6833a6d33 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -68,13 +68,14 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 }
 EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_apply_prediv, "SUNXI_CCU");
 
-static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
+unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
 					    struct ccu_mux_internal *cm,
 					    int parent_index,
 					    unsigned long parent_rate)
 {
 	return parent_rate * ccu_mux_get_prediv(common, cm, parent_index);
 }
+EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_unapply_prediv, "SUNXI_CCU");
 
 int ccu_mux_helper_determine_rate(struct ccu_common *common,
 				  struct ccu_mux_internal *cm,
diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
index c94a4bde5d01..272a2c36a8f2 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.h
+++ b/drivers/clk/sunxi-ng/ccu_mux.h
@@ -134,6 +134,10 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 					  struct ccu_mux_internal *cm,
 					  int parent_index,
 					  unsigned long parent_rate);
+unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
+					    struct ccu_mux_internal *cm,
+					    int parent_index,
+					    unsigned long parent_rate);
 int ccu_mux_helper_determine_rate(struct ccu_common *common,
 				  struct ccu_mux_internal *cm,
 				  struct clk_rate_request *req,

-- 
2.47.3


