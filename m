Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC09D12D68
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 03:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSA8nJ1x4vkygcdlaV91XsDGQiF6iY9cxiq4WbKHgrU=; b=HVCCkc595RhlwdPUktQMzPnzpv
	LCgpBUiAwN4NWltbrDUtlDnZ7rAWKq/Y+VyVLwgYSJl8JmVI9i7qfH9cZmCByM6cf6Qc9MSF9EcQn
	aO61ViOviNxt9/SrH/jjyQQFAcb13wVGR9iQAlUyEhsAU8Gw0bVh08/Zhs+WoJITnCtEAjRBvWvU0
	gKoinxrFC0aqGHGlu510Ed7YP8/JLNNOA4Ie33IAJTDgnkGoCaSF/jhO+51ZVsVrbMCBNY5Kj2RQy
	caxxflaTSbHMrpHvc+xlPfAtxPtv6qb1en+knVSfOad//50NzdWucXGdZbUau0GwEOylqo0GzFt7Z
	I1rdwdYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tALK0-0000000GFBB-0Yn9;
	Mon, 11 Nov 2024 03:42:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tALEl-0000000GEYO-3LFP;
	Mon, 11 Nov 2024 03:37:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DBF08A40DC8;
	Mon, 11 Nov 2024 03:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8BD7C4CED6;
	Mon, 11 Nov 2024 03:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731296229;
	bh=O0/vpbhe7rf42WvVAzr8V4TxhY556ffdiUaI+owMnFY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HeB7BBCbv20JwbG6421LaFzYPya9Vj1XqFoGnOveXxPdy53o5rjZfr5ibWojEgOpt
	 esZbTprJd2nYYp0oI9E15kq062ivRhl27CFBj466hAG/83ZspGlpwagXocQ7uUCebG
	 uj7kcOgre5gXhK/Zi+BLsGvU2WJXwC2ErBzVlB7Ym8WMclBtwY3kNt6u5lSUl8avt0
	 tdDkZZgOF8EFyB3KDRwKwfUb/NcJdDL0mb1Sbq4q/jLnSI7GGqp4uiVZ+w8pADliGr
	 nQNA0AVf4QWTUsbRvSe096rLl9q6m7dKyF9LqCoYyX46yx1lYx1UuNsLCDE9ipZKCU
	 FtK9SR+dBdRvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB31FD12D68;
	Mon, 11 Nov 2024 03:37:09 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Mon, 11 Nov 2024 11:37:02 +0800
Subject: [PATCH v2 2/3] clk: meson: Fix failure of glitch-free mux
 switching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-fix_glitch_free-v2-2-0099fd9ad3e5@amlogic.com>
References: <20241111-fix_glitch_free-v2-0-0099fd9ad3e5@amlogic.com>
In-Reply-To: <20241111-fix_glitch_free-v2-0-0099fd9ad3e5@amlogic.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731296227; l=8711;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=atOOThnlnG3IFHNRk0s4v4QFpYbDw+X8nwyi0iZYZHw=;
 b=SJ1Q58UzUoM28/g8A6L/ubJfjIKtacTu0tk72GbNpWLNgK6hW40Oq2r5sb6/GSwCPAYn9n5IR
 1xi5qyyqFFzDkH/huhC6vUketMMfDWvwWb7c2HVS5jgIb+1DFuMSl97
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_193712_019907_F82AE5D5 
X-CRM114-Status: GOOD (  15.62  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

glitch-free mux has two clock channels (channel 0 and channel 1) with
the same configuration.Channel 0 of glitch-free mux is not only the
clock source for the mux, but also the working clock for glitch free
mux. Therefore, when glitch-free mux switches, it is necessary to ensure
that channel 0 has a clock input, otherwise glitch free mux will not
work and cannot switch to the target channel. So adding flag
CLK_OPS_PARENT_ENABLE ensures that both channels 0 and 1 are enabled
when mux switches.

In fact, we just need to make sure that channel 0 is enabled. The
purpose of CLK_OPS_PARENT_ENABLE may not be to solve our situation, but
adding this flag does solve our current problem.

Fixes: 84af914404db ("clk: meson: a1: add Amlogic A1 Peripherals clock
controller driver")
Fixes: 14ebb3154b8f ("clk: meson: axg: add Video Clocks")
Fixes: f06ac3ed04e8 ("clk: meson: c3: add c3 clock peripherals controller
driver")
Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Fixes: fac9a55b66c9 ("clk: meson-gxbb: Add MALI clocks")
Fixes: 74e1f2521f16 ("clk: meson: meson8b: add the GPU clock tree")
Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC
peripheral clock controller")
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/a1-peripherals.c |  4 ++--
 drivers/clk/meson/axg.c            |  4 ++--
 drivers/clk/meson/c3-peripherals.c |  2 +-
 drivers/clk/meson/g12a.c           |  6 +++---
 drivers/clk/meson/gxbb.c           |  6 +++---
 drivers/clk/meson/meson8b.c        | 21 ++++++++++++++++++---
 drivers/clk/meson/s4-peripherals.c | 12 ++++++------
 7 files changed, 35 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
index 7aa6abb2eb1f..4b9686916b17 100644
--- a/drivers/clk/meson/a1-peripherals.c
+++ b/drivers/clk/meson/a1-peripherals.c
@@ -489,7 +489,7 @@ static struct clk_regmap dspa_sel = {
 			&dspa_b.hw,
 		},
 		.num_parents = 2,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 	},
 };
 
@@ -635,7 +635,7 @@ static struct clk_regmap dspb_sel = {
 			&dspb_b.hw,
 		},
 		.num_parents = 2,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 	},
 };
 
diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 1b08daf579b2..a1217dff40fa 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -1144,7 +1144,7 @@ static struct clk_regmap axg_vpu = {
 			&axg_vpu_1.hw
 		},
 		.num_parents = 2,
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		.flags = CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE,
 	},
 };
 
@@ -1260,7 +1260,7 @@ static struct clk_regmap axg_vapb_sel = {
 			&axg_vapb_1.hw
 		},
 		.num_parents = 2,
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		.flags = CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE,
 	},
 };
 
diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
index 7dcbf4ebee07..4566c2aeeb19 100644
--- a/drivers/clk/meson/c3-peripherals.c
+++ b/drivers/clk/meson/c3-peripherals.c
@@ -1431,7 +1431,7 @@ static struct clk_regmap hcodec = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_data = hcodec_parent_data,
 		.num_parents = ARRAY_SIZE(hcodec_parent_data),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 	},
 };
 
diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d3539fe9f7af..4d3b064d09fc 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -2812,7 +2812,7 @@ static struct clk_regmap g12a_vpu = {
 			&g12a_vpu_1.hw,
 		},
 		.num_parents = 2,
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		.flags = CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE,
 	},
 };
 
@@ -3105,7 +3105,7 @@ static struct clk_regmap g12a_vapb_sel = {
 			&g12a_vapb_1.hw,
 		},
 		.num_parents = 2,
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		.flags = CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE,
 	},
 };
 
@@ -4039,7 +4039,7 @@ static struct clk_regmap g12a_mali = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = g12a_mali_parent_hws,
 		.num_parents = 2,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 	},
 };
 
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 262c318edbd5..dfa9ffc61b41 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1132,7 +1132,7 @@ static struct clk_regmap gxbb_mali = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = gxbb_mali_parent_hws,
 		.num_parents = 2,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 	},
 };
 
@@ -1613,7 +1613,7 @@ static struct clk_regmap gxbb_vpu = {
 			&gxbb_vpu_1.hw
 		},
 		.num_parents = 2,
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		.flags = CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE,
 	},
 };
 
@@ -1748,7 +1748,7 @@ static struct clk_regmap gxbb_vapb_sel = {
 			&gxbb_vapb_1.hw
 		},
 		.num_parents = 2,
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		.flags = CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE,
 	},
 };
 
diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index e4b474c5f86c..0af76b527e5b 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -1997,7 +1997,22 @@ static struct clk_regmap meson8b_mali = {
 			&meson8b_mali_1.hw,
 		},
 		.num_parents = 2,
-		.flags = CLK_SET_RATE_PARENT,
+		/*
+		 * glitch-free mux has two clock channels (channel 0 and
+		 * channel 1) with the same configuration.Channel 0 of
+		 * glitch-free mux is not only the clock source for the mux,
+		 * but also the working clock for glitch free mux. Therefore,
+		 * when glitch-free mux switches, it is necessary to ensure that
+		 * channel 0 has a clock input, otherwise glitch free mux will
+		 * not work and cannot switch to the target channel. So adding
+		 * flag CLK_OPS_PARENT_ENABLE ensures that both channels 0 and 1
+		 * are enabled when mux switches.
+		 *
+		 * In fact, we just need to make sure that channel 0 is enabled.
+		 * The purpose of CLK_OPS_PARENT_ENABLE may not be to solve our
+		 * situation, but adding this flag does solve our current problem.
+		 */
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 	},
 };
 
@@ -2252,7 +2267,7 @@ static struct clk_regmap meson8b_vpu = {
 			&meson8b_vpu_1.hw,
 		},
 		.num_parents = 2,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 	},
 };
 
@@ -2364,7 +2379,7 @@ static struct clk_regmap meson8b_vdec_1 = {
 			&meson8b_vdec_1_2.hw,
 		},
 		.num_parents = 2,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 	},
 };
 
diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index c930cf0614a0..79e0240d58e6 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -1404,7 +1404,7 @@ static struct clk_regmap s4_mali_mux = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = s4_mali_parent_hws,
 		.num_parents = 2,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 	},
 };
 
@@ -1536,7 +1536,7 @@ static struct clk_regmap s4_vdec_mux = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = s4_vdec_mux_parent_hws,
 		.num_parents = ARRAY_SIZE(s4_vdec_mux_parent_hws),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 	},
 };
 
@@ -1656,7 +1656,7 @@ static struct clk_regmap s4_hevcf_mux = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = s4_hevcf_mux_parent_hws,
 		.num_parents = ARRAY_SIZE(s4_hevcf_mux_parent_hws),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 	},
 };
 
@@ -1774,7 +1774,7 @@ static struct clk_regmap s4_vpu = {
 			&s4_vpu_1.hw,
 		},
 		.num_parents = 2,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 	},
 };
 
@@ -1989,7 +1989,7 @@ static struct clk_regmap s4_vpu_clkc_mux = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = s4_vpu_mux_parent_hws,
 		.num_parents = ARRAY_SIZE(s4_vpu_mux_parent_hws),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 	},
 };
 
@@ -2115,7 +2115,7 @@ static struct clk_regmap s4_vapb = {
 			&s4_vapb_1.hw
 		},
 		.num_parents = 2,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 	},
 };
 

-- 
2.42.0



