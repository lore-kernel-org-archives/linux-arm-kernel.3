Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1113C02182
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 17:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zy0IE3lDkOJmEZbfzxIyV3pw1iHxHTRFthowgi2frig=; b=xGzRD1KcxhLHaGecAcUfhUxZfd
	RUPrvkHY0edsNtxpZsii3DVyypAwg+6PcnOE73kb52Uc/uu4p1FbzK2qyjq9ErigE0KAgeZ/WxvhL
	eOsqEtdpllB7gFFc36ubNfhMc8KP00YTUQcmeXjYZB+bcmFtNjZdJ2d0aip0XCHC4D2xmDhm7AvM2
	FFqIj2m31Tn63WEmgi3lM+J6HSW5UdLywWSsJfjWXEb1XiKh3K7KcoZwYS+NQRT06uiuwmMXrHvQB
	Ht2eef0FM3xWu7xuJmnEXsU3mAN5wXV2B2bMhYLM99pLbvlr+preFXKFM1brp3sQdAvQVlojFSHVs
	KHcVKv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZvTN-000000067Gx-40jN;
	Mon, 20 Jan 2025 17:22:01 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZvOL-000000066CM-2tSz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 17:16:51 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so46920525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 09:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737393408; x=1737998208; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zy0IE3lDkOJmEZbfzxIyV3pw1iHxHTRFthowgi2frig=;
        b=xp4GOicbG/C+GKmZnJxFewuibnFo0Q8uUYnde1Z+QWrzhX3wp8IsVUkGxl39is0IUA
         LrwC6sKUMpP9y1wJrB/k4tOoiLzjDr+aMukNpoJj4BB6aaPDOMng+sycgYEucx5z+807
         tqm14IZFPnof5OeNz0HuJKYCubbhvimD9rSVdC0+xnmFD/jvd/MjF0fjH06lYzMrPRnT
         2QJdyqdZ4NIY465iUbgnjqv2n3PTy07HyUJD2QczwVYxmQXGTHx73J6F6i+jN9NXbIPA
         U6zIu1OJdGH14N7eZKHOL2aVYhW/54ECuAVnPrZukuI5T5sLa/eYaPvMOsNX4bJFoGB2
         Lf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737393408; x=1737998208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zy0IE3lDkOJmEZbfzxIyV3pw1iHxHTRFthowgi2frig=;
        b=uYZQZw+/4OxmcjxAR0+JtLZEMNB+hsA99zmMJV5MFGOv2hbc8rQ9q+PymVUOofXmt4
         MS2aqOQkbpsrpBNBe3fCu0pZK2LjmI00UGEsUMzOLXcbWb7fEEotujvNLCps81pRYQgi
         la4NVpfEXcQOAY9NHLrhc/egPDQXNvzY9Pm77hsI911g98QwOx44RmxfXM9IUIDsR4Wt
         eWbikHRDoiI4aTsX0PcyrpVnJYRvdXdHmZltyinomuS+qkebRygHZa5YOXmkky2Fwi3/
         ib4yITYyWR3nwmeUdpcqN7DyihH34JrAAu4lEe911DxAXv9kN7sBehDpts+gisdze8Z9
         h/9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMyXZkahrOurSQdRyqMNn9/XtX5aHVaNWRjc2LVSPNUR5H0307Afz/uBGIIsqeTjAncCyDp7PSSlfQa14RVZXG@lists.infradead.org
X-Gm-Message-State: AOJu0YzPNZbDedNEDp4ukHgUIgROKQAtJ7QxwUctPuND3sHYvF9lrlVd
	szVejB0AXxhM6NdI6aLNri8J8tnhcdLnsjvZyTbsaLVtp/RDlGLJR1tU2eS21ko=
X-Gm-Gg: ASbGncsdjWCLOxHG9s+fX2AGtjJAINEXfAKi2opnaRMVlUAq9vYawc+uONnGoCl5HWG
	1kdmQDjRmY4SpKENO+lU4gN53rSqexy5k/N2ItibX0r6cogH0jnq0BurY0gCyQ2jCZthxK6oLXB
	Zd6c6wVLQqGGD50vQ2R+ggTUvS8U+rP/SpKCe/eE6qvPkmPcIFZdJrYfXutJHS7LBfkm/J9j9Ce
	xzGprVJMxoqJAKzkFnu+1pQj7h1uIa/iW7MLe422ko3FcGuAVGvWtNgNXYLoWjQWiWRmZ7J+Wll
	1XVJfDC/
X-Google-Smtp-Source: AGHT+IFY5DPWP40kn2YE2hfzn5IShoB+jBqP5C8IE7mj9UvjFLQNXC7FFM6GCKi20FV/1FQ4AsYs8w==
X-Received: by 2002:a05:600c:1f8c:b0:436:fb02:e90 with SMTP id 5b1f17b1804b1-438913cdaa8mr152617415e9.10.1737393408342;
        Mon, 20 Jan 2025 09:16:48 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:66cc:1b13:f78a:5738])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-437c75298adsm208629865e9.30.2025.01.20.09.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:16:47 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 20 Jan 2025 18:15:33 +0100
Subject: [PATCH v3 4/4] clk: amlogic: s4: remove unused data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-4-126244146947@baylibre.com>
References: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
In-Reply-To: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3973; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=J7Y6Fp4+iqMqIfQq3Hnn537f1r3kZcJaD4ddKCmmXtk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnjoT64OhzMylXK7S80fv+A6bFKs/lGqharlcVS
 tH/hOFeOB6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ46E+gAKCRDm/A8cN/La
 hW37EACoX2ZfZnDa/X38DZwOqeh8ZuhGamXjGCNbVY/Z/WfrR249u2iiH9j/R/Psui7oR1mA9Ld
 X42+U3Hn6T+JnjBI+EDHXbrWvJ4Rfhlty4X//QmgkRRJcrLXtMC0q39qIScOV2Y3aL7U8HRVKrk
 p1YJFwoZv3CLgTzbjOPhdBu3a7v3K/4bXx8mMOaqjHo23AkxHeWbQ18OwC+XNCGv5p2u/ZbsmHn
 rKiOgy2fkpxpp6D6nptKau7C0ip4FycM2q/vEle0ECO5MMNiHUcmS4kH1Q9WlkGoG8wo+Oo0pLJ
 fjhKa/qo51vCTBIgoVALhsxCCul22x95Uk+vRcUX833T4XXhr7FID+3Jwi89OnGbawYPfStl0wO
 so6HWxgoco3l/gmUCGEvRx9DBOcQ0Ykb4CZPsSYoGUcKLsmrsrrqFxbaGP8s8WEUotr1/W5dott
 HVdMsSX5QVdjw8Z0Ap1ubUm3sRwq85Fx8clqUHQ+eZgs/LVXk2GgX29SI7yAHVjViy+pqcIL6B8
 fEs2fnOU19zKnW+kq+yA8hjuTYTodoURRq6SIBoYeYD+9fd8M5toULw85BQGNy+flXIPgG9u6XZ
 XO+emPEYYzXC2BZceW7kchSb2kV8W8gZ2X0SoFtAD7VMMSov6Hr1Hjrmqz6aE+oFgHan8FTg6Hz
 4UAkYQMvR7xlk9A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_091649_795876_62873326 
X-CRM114-Status: GOOD (  12.25  )
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

Following the removal of the clk_regmap clock table from the s4-peripherals
clock controller driver, it appears some clocks are unused, which means
these are not exported or even registered.

In all likelihood, these clocks have not been tested. Remove the unused
clocks for now. These can added back later when they have been properly
tested.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/s4-peripherals.c | 112 -------------------------------------
 1 file changed, 112 deletions(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index 6a736e32e0ed8e2e8a37fbea94f9c5a90ea95fa6..853053b5f0689399a0224d263c30a985df6e1652 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -3129,118 +3129,6 @@ static struct clk_regmap s4_gen_clk = {
 	},
 };
 
-static const struct clk_parent_data s4_adc_extclk_in_parent_data[]  = {
-	{ .fw_name = "xtal", },
-	{ .fw_name = "fclk_div4", },
-	{ .fw_name = "fclk_div3", },
-	{ .fw_name = "fclk_div5", },
-	{ .fw_name = "fclk_div7", },
-	{ .fw_name = "mpll2", },
-	{ .fw_name = "gp0_pll", },
-	{ .fw_name = "hifi_pll", },
-};
-
-static struct clk_regmap s4_adc_extclk_in_mux = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "adc_extclk_in_mux",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_adc_extclk_in_parent_data,
-		.num_parents = ARRAY_SIZE(s4_adc_extclk_in_parent_data),
-		.flags = 0,
-	},
-};
-
-static struct clk_regmap s4_adc_extclk_in_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.shift = 16,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "adc_extclk_in_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_adc_extclk_in_mux.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_adc_extclk_in_gate = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "adc_extclk_in",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_adc_extclk_in_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_demod_core_clk_mux = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.mask = 0x3,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "demod_core_clk_mux",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = (const struct clk_parent_data []) {
-			{ .fw_name = "xtal", },
-			{ .fw_name = "fclk_div7", },
-			{ .fw_name = "fclk_div4", },
-			{ .hw = &s4_adc_extclk_in_gate.hw }
-		},
-		.num_parents = 4,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_demod_core_clk_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "demod_core_clk_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_demod_core_clk_mux.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_demod_core_clk_gate = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "demod_core_clk",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_demod_core_clk_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
 #define MESON_GATE(_name, _reg, _bit) \
 	MESON_PCLK(_name, _reg, _bit, &s4_sys_clk.hw)
 

-- 
2.45.2


