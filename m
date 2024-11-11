Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22EFD12D68
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 03:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAFuybKGotKuHjNnyzANpVL1opM6qnj9m890EVC0xLg=; b=sT54bKJ8hJYcdAdkTP1dJRzeZ9
	LsS9QrzhwZTd9IXCoWdR8mHVlWx8mMMP32/gNqxUtkwn9VfeNe5lzzT8+AtMuONSelSNt0KToeMY8
	b1/KRUVWxCOlv1m3iw56r+87xKlIjMzHHLUBX1kKcTcrNHmMI9TPb5ZzMtjaZq8srkDnTs6LycjgG
	LXAVfHC+23at9DXasXXKVf0xrqFSqvjVoxvXR3tu4BCPnT8Gy5wF+dIhRfIZVAsCQZYwX9bvYU8o1
	G0bXv0eakmwiiBM69pZPVYGpRG1Qp3erqWyvuJlEpww9MUBv4wKrNNKJ0I9O3WMGyfQBULkwSLTuj
	Bm8c/hag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tALIG-0000000GF0V-3AsT;
	Mon, 11 Nov 2024 03:40:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tALEl-0000000GEYP-38ja;
	Mon, 11 Nov 2024 03:37:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12F82A40DC9;
	Mon, 11 Nov 2024 03:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC7A4C4CED9;
	Mon, 11 Nov 2024 03:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731296230;
	bh=nYbSMyAY5KMAdoS2ugyZMdKHOHfvsmdyGjahtE6WqS0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=All2Leeub2vLtkgMokXyxiO17uyb510PsqDL8/nWLB0BSlJBmZWs4Cufvkn3lNESB
	 lNye+Bg0HIxqK0dlbf9D0WXF5gf2b0Mczr0wmj9oirRfZ4UCqPzzSHlf9kdgeSWTif
	 1x5z9vRHxPVmDGUdnMsuo/HZIxoujL1ur7WBJS8B4wRpLqyBT4A5ZfqteKdvWYtDxC
	 6sua9wLn5TfI6Ud4R4tdIjzHyIVk2f6fHf3oI72NW6/dFnzG8XHVxi9Wqovz8bBtjx
	 Lx50OLnUg2PxFce1Vz7Z7/zj+jd5pE7YlQBJhpUYYkX2YxIOclHB/z3Hot4bd9w7j9
	 uAPuvdp272ljw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0A1D12D6A;
	Mon, 11 Nov 2024 03:37:09 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Mon, 11 Nov 2024 11:37:03 +0800
Subject: [PATCH v2 3/3] clk: meson: Fix glitch occurs when setting up
 glitch-free mux
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-fix_glitch_free-v2-3-0099fd9ad3e5@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731296227; l=9556;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=14bGE9sYOEx+b5MpaosDAU5c7E9221JER7/akkkpyQI=;
 b=87LGzbmMRXSyu8oy0ZGzgmHOdsqYg9UC7pAj0lFPfWns456G42M1cSzMH6cVTq9gMqpYri+rx
 /dcbvMA+08ACSttJ7amw9V9S8vQysAH2+fQWaMFVAEyERZpvfPVoHnp
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_193711_970488_8016F3C0 
X-CRM114-Status: GOOD (  13.20  )
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
the same configuration. When the frequency needs to be changed, the two
channels ping-pong to ensure clock continuity and suppress glitch.

The glitch-free mux configuration with CLK_SET_RATE_GATE enables the mux
to perform ping-pong switching to suppress glitches.

Fixes: 84af914404db ("clk: meson: a1: add Amlogic A1 Peripherals clock
controller driver")
Fixes: 14ebb3154b8f ("clk: meson: axg: add Video Clocks")
Fixes: f06ac3ed04e8 ("clk: meson: c3: add c3 clock peripherals controller
driver")
Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Fixes: fac9a55b66c9 ("clk: meson-gxbb: Add MALI clocks")
Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC
peripheral clock controller")
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/a1-peripherals.c |  8 ++++----
 drivers/clk/meson/axg.c            | 12 ++++++++----
 drivers/clk/meson/c3-peripherals.c |  4 ++--
 drivers/clk/meson/g12a.c           | 12 ++++++++----
 drivers/clk/meson/gxbb.c           | 12 ++++++++----
 drivers/clk/meson/s4-peripherals.c | 20 ++++++++++----------
 6 files changed, 40 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
index 4b9686916b17..7f515e002adb 100644
--- a/drivers/clk/meson/a1-peripherals.c
+++ b/drivers/clk/meson/a1-peripherals.c
@@ -423,7 +423,7 @@ static struct clk_regmap dspa_a = {
 			&dspa_a_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
 	},
 };
 
@@ -471,7 +471,7 @@ static struct clk_regmap dspa_b = {
 			&dspa_b_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
 	},
 };
 
@@ -569,7 +569,7 @@ static struct clk_regmap dspb_a = {
 			&dspb_a_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
 	},
 };
 
@@ -617,7 +617,7 @@ static struct clk_regmap dspb_b = {
 			&dspb_b_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
 	},
 };
 
diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index a1217dff40fa..e2d3266f4b45 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -1077,7 +1077,8 @@ static struct clk_regmap axg_vpu_0 = {
 		 * We want to avoid CCF to disable the VPU clock if
 		 * display has been set by Bootloader
 		 */
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
+			 CLK_SET_RATE_GATE,
 	},
 };
 
@@ -1126,7 +1127,8 @@ static struct clk_regmap axg_vpu_1 = {
 		 * We want to avoid CCF to disable the VPU clock if
 		 * display has been set by Bootloader
 		 */
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
+			 CLK_SET_RATE_GATE,
 	},
 };
 
@@ -1194,7 +1196,8 @@ static struct clk_regmap axg_vapb_0 = {
 			&axg_vapb_0_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
+			 CLK_SET_RATE_GATE,
 	},
 };
 
@@ -1242,7 +1245,8 @@ static struct clk_regmap axg_vapb_1 = {
 			&axg_vapb_1_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
+			 CLK_SET_RATE_GATE,
 	},
 };
 
diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
index 4566c2aeeb19..27343a73a521 100644
--- a/drivers/clk/meson/c3-peripherals.c
+++ b/drivers/clk/meson/c3-peripherals.c
@@ -1364,7 +1364,7 @@ static struct clk_regmap hcodec_0 = {
 			&hcodec_0_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
 	},
 };
 
@@ -1411,7 +1411,7 @@ static struct clk_regmap hcodec_1 = {
 			&hcodec_1_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
 	},
 };
 
diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 4d3b064d09fc..21a25001e904 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -2746,7 +2746,8 @@ static struct clk_regmap g12a_vpu_0 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vpu_0_div.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
+			 CLK_SET_RATE_GATE,
 	},
 };
 
@@ -2790,7 +2791,8 @@ static struct clk_regmap g12a_vpu_1 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vpu_1_div.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
+			 CLK_SET_RATE_GATE,
 	},
 };
 
@@ -3035,7 +3037,8 @@ static struct clk_regmap g12a_vapb_0 = {
 			&g12a_vapb_0_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
+			 CLK_SET_RATE_GATE,
 	},
 };
 
@@ -3083,7 +3086,8 @@ static struct clk_regmap g12a_vapb_1 = {
 			&g12a_vapb_1_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
+			 CLK_SET_RATE_GATE,
 	},
 };
 
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index dfa9ffc61b41..812b3e20c366 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1543,7 +1543,8 @@ static struct clk_regmap gxbb_vpu_0 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &gxbb_vpu_0_div.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
+			 CLK_SET_RATE_GATE,
 	},
 };
 
@@ -1591,7 +1592,8 @@ static struct clk_regmap gxbb_vpu_1 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &gxbb_vpu_1_div.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
+			 CLK_SET_RATE_GATE,
 	},
 };
 
@@ -1674,7 +1676,8 @@ static struct clk_regmap gxbb_vapb_0 = {
 			&gxbb_vapb_0_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
+			 CLK_SET_RATE_GATE,
 	},
 };
 
@@ -1726,7 +1729,8 @@ static struct clk_regmap gxbb_vapb_1 = {
 			&gxbb_vapb_1_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED |
+			 CLK_SET_RATE_GATE,
 	},
 };
 
diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index 79e0240d58e6..cf10be40141d 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -1466,7 +1466,7 @@ static struct clk_regmap s4_vdec_p0 = {
 			&s4_vdec_p0_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
 	},
 };
 
@@ -1516,7 +1516,7 @@ static struct clk_regmap s4_vdec_p1 = {
 			&s4_vdec_p1_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
 	},
 };
 
@@ -1586,7 +1586,7 @@ static struct clk_regmap s4_hevcf_p0 = {
 			&s4_hevcf_p0_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
 	},
 };
 
@@ -1636,7 +1636,7 @@ static struct clk_regmap s4_hevcf_p1 = {
 			&s4_hevcf_p1_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
 	},
 };
 
@@ -1712,7 +1712,7 @@ static struct clk_regmap s4_vpu_0 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &s4_vpu_0_div.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
 	},
 };
 
@@ -1756,7 +1756,7 @@ static struct clk_regmap s4_vpu_1 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &s4_vpu_1_div.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
 	},
 };
 
@@ -1921,7 +1921,7 @@ static struct clk_regmap s4_vpu_clkc_p0 = {
 			&s4_vpu_clkc_p0_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
 	},
 };
 
@@ -1969,7 +1969,7 @@ static struct clk_regmap s4_vpu_clkc_p1 = {
 			&s4_vpu_clkc_p1_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
 	},
 };
 
@@ -2049,7 +2049,7 @@ static struct clk_regmap s4_vapb_0 = {
 			&s4_vapb_0_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
 	},
 };
 
@@ -2097,7 +2097,7 @@ static struct clk_regmap s4_vapb_1 = {
 			&s4_vapb_1_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
 	},
 };
 

-- 
2.42.0



