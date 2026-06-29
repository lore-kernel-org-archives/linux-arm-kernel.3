Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6FBC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QvuvGrw74bcC43tNkUtjQENE+L2SxKO7K1MrIT8vI48=; b=ViNUd87UdeXVOaOIt1iWvNSFmJ
	CrayXAWt3gg5gLCUzreLTQ/e5lGzf2AdlpL4mXRVnGqIdp/QZ70+eFCyTPLsLlwvGoMaZej5r/Ih8
	JGydzlpxF6jb4IgAjCnOqkye8TKL5LFTJN99UZiQUzfe3hSN06RhGkNyq0dcHLx9seivvR6IlLbsj
	ZY8m/zMQe8Ml30ZUtKulXrHtRSg0XtbYnhoRYA9l25ZVWKvItCrGbJUE4mGPdzKhZLuNjrCBKxYiG
	nV7fBwKu39G0KMI/CSe8QsENuJoPckFs36gNdZFjWIGtiZUmsHiipDGeYnElwzDg38XMWmZqzW0qC
	JCaZYKcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBK8-0000000Eaoc-1DMx;
	Mon, 29 Jun 2026 12:42:52 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBJy-0000000EakQ-3jSs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:42:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493a613571eso11692125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 05:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736961; x=1783341761; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QvuvGrw74bcC43tNkUtjQENE+L2SxKO7K1MrIT8vI48=;
        b=YWYE6+VcuB8HzsF0c+j79jJEfmdJhSvK7zFtG1PNziYTE+yqA3iy6QOb4FrwbdYMcD
         DXVeFMi9EZXzCQRCkBAz60UZKHxcw8HJLrJtl1K7um11tmC/JRJeENgMpUKEa5v+NsjX
         si3nir/J7O+FAX+EyaYJxm1zAVZkrdl71dHxh9ge2bc+SU9wNNvyxG34mAimWrBhejsb
         ffs2bVPPzUwfZU2C2piL990rz9upeTpLbjTTE79Msfz2k7d5g8oJ42bZ+OqvIUvDi2t7
         AGA6TqSHnFg1yemLTFJ3SKmCCxJekf991EQ6qBaMYJzTJXdr3EpPjVnh4WMoriKk6Mm8
         JC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736961; x=1783341761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QvuvGrw74bcC43tNkUtjQENE+L2SxKO7K1MrIT8vI48=;
        b=TKGY8rfqfbn+BWv37eSyn9J+x9+reSqTtO/oCn7At6YWJZYzkXPMSFKUP2sYyxUG9d
         6aSGBmHhDBCAcJdlLj63/ka0fgXu1FhjVHDfBqBmTrXrjaY5ySmCR76pfsvD0i5I0cKE
         7GYq4/9yXrF2EmOdlYAPoeQimmw8MiJR8rG2sLdlAPsv9SAzRCx1MZBFo0PdaNGZs5hJ
         wnxoYfA1csnG9PzXR2QLUdCLhYhykvaUKYADwCq57U08g3qvRWWlzBYBD/gr6aDJljMu
         gTyiZusc3fC0BosytvVWC7YJ5INU2cYAbGHQV74P+D4wTsoRCYljlqGiTznmJ+wuTz1f
         KjnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Lf4AiNfqXccs6pdi4O2RW0ZKNuwYILDiM5w0MhK4RBjAH9CBkCZVQ+XKpW/GH/q116nPOY9AkSuNBTSkcpWVM@lists.infradead.org
X-Gm-Message-State: AOJu0YyEU8wvf3NsHyYeB+j6I11Icw8jkK5z0lBekxuGcpybdB2quHUz
	u+uGQhs2c0CWYutAOBjlLWLW1KCHURzV8HeS7/zT1IKCJanHi8z6btpNzi3G3HH3OBI=
X-Gm-Gg: AfdE7ckcJxseHyvg1yGE5Gh+NYJi1E0ShbRo060QgfGdFObzV0rtYGlnwURAbpBq8Kp
	wU3ama2BI1spjz8KmI8FJZVUmyl9n8OPSaT892ZQvc+H66iHrvU4VDerY1nrJNkfeHU1v+Exemh
	DjctalIzIrx7CDHpyyr95x3qMMk0YyUmXtcjCHfA0ci8KzrRfpLsNRz5mVG/ucImpce9c24HRJo
	Fh3d2Z1i10rsI5CwnoFC6Q7VERrrflWVyow5UyPRL/9exBoaNpamS1V1smr7+5lFZ2Q5viTrJiW
	eHTVf5nD+uiXsGD5MUh6SWjCSJVvg+SPyg3Nqk80JXomyUDDR8kArThuVzuGsmDppwqST/NE7fz
	JuiQY7B9Sb+ud1jvvH43/k51B9Vs//0A2QB8IDmxcLJ17d64bPkBcMMiBrlw/l1mjF5p9MqYYF5
	ekgBHEhRa0JBo=
X-Received: by 2002:a05:600c:e555:10b0:492:4a70:faaa with SMTP id 5b1f17b1804b1-4926685af4cmr178735795e9.11.1782736961340;
        Mon, 29 Jun 2026 05:42:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4926c00a34esm181463855e9.0.2026.06.29.05.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 29 Jun 2026 14:42:10 +0200
Subject: [PATCH v2 6/6] clk: sunxi-ng: sun6i-rtc: add a733 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-a733-rtc-v2-6-7b72112784f8@baylibre.com>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
In-Reply-To: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6063; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=5CSoUIy/v6LOzSzkVQ2mOnhu7hJrrhe9yfYnkVNt/3U=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmgxq2HH6bfU6XRMG/P3wAg/3/Lz/I6SoI1Mq
 iWTTigZ2J6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoMQAKCRDm/A8cN/La
 hSYkD/450bshj2S5XxoAoJje9mK8Hi8e1BZOuGTkYPjAq8k3Um0UbnvoobjUeqO5KH+YrA9LBd3
 x3g9eAg3ArRNrqV0WIvcGJapW4BU7ufAkJj8PAOXZBMMZ19K0p9CakT80ib2+TVC6YblC56I2tX
 pxKBdUNo5F6yFyZoBcyW2lr+b7QPej8EXlFFxq5K9xnAj5kn5QhWkDpIS5f7/ryHonSjS3SGTD8
 PJw6ctyYz27PASy+HNF4tWOSs4s7HPNsGWg1GVHh5wSE8rv/RvZzOupwvTQ06S2IRulgWuNbKIS
 RIIVoxwRijTBSWpdxKMfSCkx1ZTOMs8dQwUwU1xrRbnrPFlizvWyupqXowx/P9yAyqP5UEBhjKZ
 i7c/01awneVW10zbHpE6BK1zR00AFp8dwwx5Mt3VZmPrM1/Yvo3lbWGJyu7KLY7HEhS7RbSV84d
 yUlQOblvMLk9cCNLMMBjBcO+Pp4JK0yj9/h84+y1H7md6hwzJ7qmdktIcWav43hAqTxDDxV/c6y
 3xcXlLjU4i9DFB5Sbn8iF44HCo2Y+gDMyKw60Vi8/aSZl26yZwRiQUHfxo3rqdMcuTQlIt2Hfd3
 uVqaD8OdMWMzRXUSolpIMWcbe7k26NPJMM54wnMTU0+hB6am9457nSvn38I+unrA/BTVw4j4W4L
 kbQ+TPKhpGhohyQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_054242_974226_63DAAC44 
X-CRM114-Status: GOOD (  18.59  )
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

Add support for the sun60i a733 CCU RTC.

Compared to the a523, this SoC has a different input oscillator divider
which auto-detects the oscillator rate and select a divider to provide
a fixed 32768Hz clock. It also provides several phy reference clocks
with dedicated clock gates.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 74 ++++++++++++++++++++++++++++++++++--
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h |  2 +-
 2 files changed, 72 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 25dd87e78eb7..2ec09e346472 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -42,11 +42,16 @@
 #define LOSC_OUT_GATING_REG		0x60
 
 #define DCXO_CTRL_REG			0x160
+#define DCXO_CTRL_DCXO_EN		BIT(1)
 #define DCXO_CTRL_CLK16M_RC_EN		BIT(0)
 
+#define DCXO_GATING_REG			0x16c
+
 struct sun6i_rtc_match_data {
 	bool				have_ext_osc32k		: 1;
 	bool				have_iosc_calibration	: 1;
+	bool				have_dcxo_status	: 1;
+	bool				have_phy_ref_gates	: 1;
 	bool				rtc_32k_single_parent	: 1;
 	const struct clk_parent_data	*osc32k_fanout_parents;
 	u8				osc32k_fanout_nparents;
@@ -213,7 +218,12 @@ static struct ccu_mux osc32k_clk = {
 	},
 };
 
-/* This falls back to the global name for fwnodes without a named reference. */
+/*
+ * This falls back to the global name for fwnodes without a named reference.
+ * NOTE: osc24M name might be misleading the oscillator could also be a 26MHz
+ * or a 19.2MHz one starting with the a733. The original name is kept anyway
+ * in case anything is relying on it.
+ */
 static const struct clk_parent_data osc24M[] = {
 	{ .fw_name = "hosc", .name = "osc24M" }
 };
@@ -227,8 +237,28 @@ static struct clk_fixed_factor osc24M_32k_div_clk = {
 					    0),
 };
 
-static SUNXI_CCU_GATE_HW(osc24M_32k_clk, "osc24M-32k", &osc24M_32k_div_clk.hw,
-			 LOSC_OUT_GATING_REG, BIT(16), 0);
+static struct clk_div_table osc24M_32k_div_a733_table[] = {
+	{ .val = 0, .div = 732 },
+	{ .val = 1, .div = 586 },
+	{ .val = 2, .div = 793 },
+	{ .val = 3, .div = 732 },
+	{ /* Sentinel */ },
+};
+
+static struct ccu_div osc24M_32k_div_a733_clk = {
+	.enable = BIT(1),
+	.div	= _SUNXI_CCU_DIV_TABLE(14, 2, osc24M_32k_div_a733_table),
+	.common	= {
+		.reg		= DCXO_CTRL_REG,
+		.hw.init	= CLK_HW_INIT_PARENTS_DATA("osc24M-32k-div",
+							   osc24M,
+							   &ccu_rodiv_ops,
+							   0),
+	},
+};
+
+static SUNXI_CCU_GATE(osc24M_32k_clk, "osc24M-32k", "osc24M-32k-div",
+		      LOSC_OUT_GATING_REG, BIT(16), 0);
 
 static const struct clk_hw *rtc_32k_parents[] = {
 	&osc32k_clk.common.hw,
@@ -267,6 +297,15 @@ static struct ccu_mux osc32k_fanout_clk = {
 	},
 };
 
+static SUNXI_CCU_GATE_FW(hosc_serdes1_clk, "hosc-serdes1", "hosc",
+		      DCXO_GATING_REG, BIT(5), 0);
+static SUNXI_CCU_GATE_FW(hosc_serdes0_clk, "hosc-serdes0", "hosc",
+		      DCXO_GATING_REG, BIT(4), 0);
+static SUNXI_CCU_GATE_FW(hosc_hdmi_clk, "hosc-hdmi", "hosc",
+		      DCXO_GATING_REG, BIT(1), 0);
+static SUNXI_CCU_GATE_FW(hosc_ufs_clk, "hosc-ufs", "hosc",
+		      DCXO_GATING_REG, BIT(0), 0);
+
 static struct ccu_common *sun6i_rtc_ccu_clks[] = {
 	&iosc_clk,
 	&iosc_32k_clk,
@@ -275,6 +314,11 @@ static struct ccu_common *sun6i_rtc_ccu_clks[] = {
 	&osc24M_32k_clk.common,
 	&rtc_32k_clk.common,
 	&osc32k_fanout_clk.common,
+	&osc24M_32k_div_a733_clk.common,
+	&hosc_serdes1_clk.common,
+	&hosc_serdes0_clk.common,
+	&hosc_hdmi_clk.common,
+	&hosc_ufs_clk.common,
 };
 
 static struct clk_hw_onecell_data sun6i_rtc_ccu_hw_clks = {
@@ -288,6 +332,10 @@ static struct clk_hw_onecell_data sun6i_rtc_ccu_hw_clks = {
 		[CLK_OSC24M_32K]	= &osc24M_32k_clk.common.hw,
 		[CLK_RTC_32K]		= &rtc_32k_clk.common.hw,
 		[CLK_OSC24M_32K_DIV]	= &osc24M_32k_div_clk.hw,
+		[CLK_HOSC_UFS]		= &hosc_ufs_clk.common.hw,
+		[CLK_HOSC_HDMI]		= &hosc_hdmi_clk.common.hw,
+		[CLK_HOSC_SERDES0]	= &hosc_serdes0_clk.common.hw,
+		[CLK_HOSC_SERDES1]	= &hosc_serdes1_clk.common.hw,
 	},
 };
 
@@ -330,6 +378,15 @@ static const struct sun6i_rtc_match_data sun55i_a523_rtc_ccu_data = {
 	.osc32k_fanout_nparents	= ARRAY_SIZE(sun50i_r329_osc32k_fanout_parents),
 };
 
+static const struct sun6i_rtc_match_data sun60i_a733_rtc_ccu_data = {
+	.have_ext_osc32k	= true,
+	.have_iosc_calibration	= true,
+	.have_dcxo_status	= true,
+	.have_phy_ref_gates	= true,
+	.osc32k_fanout_parents	= sun50i_r329_osc32k_fanout_parents,
+	.osc32k_fanout_nparents	= ARRAY_SIZE(sun50i_r329_osc32k_fanout_parents),
+};
+
 static const struct of_device_id sun6i_rtc_ccu_match[] = {
 	{
 		.compatible	= "allwinner,sun50i-h616-rtc",
@@ -343,6 +400,10 @@ static const struct of_device_id sun6i_rtc_ccu_match[] = {
 		.compatible	= "allwinner,sun55i-a523-rtc",
 		.data		= &sun55i_a523_rtc_ccu_data,
 	},
+	{
+		.compatible	= "allwinner,sun60i-a733-rtc",
+		.data		= &sun60i_a733_rtc_ccu_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, sun6i_rtc_ccu_match);
@@ -375,6 +436,13 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 	osc32k_fanout_init_data.parent_data = data->osc32k_fanout_parents;
 	osc32k_fanout_init_data.num_parents = data->osc32k_fanout_nparents;
 
+	if (data->have_dcxo_status)
+		sun6i_rtc_ccu_hw_clks.hws[CLK_OSC24M_32K_DIV] =
+			&osc24M_32k_div_a733_clk.common.hw;
+
+	if (!data->have_phy_ref_gates)
+		sun6i_rtc_ccu_hw_clks.num = CLK_OSC24M_32K_DIV + 1;
+
 	return devm_sunxi_ccu_probe(dev, reg, &sun6i_rtc_ccu_desc);
 }
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
index ab7b92b47f59..4f4f4cb00f1d 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
@@ -11,6 +11,6 @@
 #define CLK_RTC_32K		6
 #define CLK_OSC24M_32K_DIV	7
 
-#define CLK_NUMBER		(CLK_OSC24M_32K_DIV + 1)
+#define CLK_NUMBER		(CLK_HOSC_SERDES1 + 1)
 
 #endif /* _CCU_SUN6I_RTC_H */

-- 
2.47.3


