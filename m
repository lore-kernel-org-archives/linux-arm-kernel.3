Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732EBC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 14:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hhejqqk/YejfwiP6Ga/bYKh4OsY78ne2Bp/UpWOM4CI=; b=Ef9yoTvyLeDIB7IrOgr73+EizG
	eQludZm0wVFQQ4aWjS2Zb6KKXojxA0wfX8hFPrDwLx8p0KV8T4souVETWKSCVKXM3dlEzyMlwJ7WU
	DWT82satHZPtn13hcInhESNl1O84Qo9M8+/1wiHwdPnT7cg6i5SNzdXYW5bSzaMt+j+wBwYxWhYGZ
	Bv2zBldIpbEvam5GPtp3p8WTs5ibIhdLmJvFVH2hGe/A67XOrEd3F5Y37loRj8/XLt9i52GMzReB3
	hdNwDLLcJ8AX2EOWf2NTNC6aA7nbhgtuXB6TxaEOUdDc9JWe3rfII35M/yAiYvB0ttEh9Wfvf17R7
	SQ1yPyag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYFp-0000000C4mB-1LOv;
	Wed, 22 Jul 2026 14:49:01 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYFX-0000000C4Z6-0av3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 14:48:44 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so35390465e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 07:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784731721; x=1785336521; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hhejqqk/YejfwiP6Ga/bYKh4OsY78ne2Bp/UpWOM4CI=;
        b=hOypchjyVByQiLUnjr/cGYqJ/55QUJbDmY+ldvnDBPfKETyr5AiHemGad7K6u/6k4e
         HAGhdMPfvxJaYA9vp6Anpx1znFN0zwkkvpL0bzt0uJB6cV34LO2Ba5F2h9Ifzu3fo925
         wPYaik5oPsvrGX0m+rKylX/FJlen+UN7Uz40Ls74PRwo1zNUykLcAi2cwWJqkf6qGpUI
         EJHUUg/xN4nngkg61LWNSGdOeN05N1PD3M01il3Buny3fD+S3e/7VMSICZK2U3icgRcC
         8WKSTvPi0kykPHReFAOz/6sI+9Hint2jucUS9FJJTT27ViPJMd5q9u/XqRgDb+3zvZUM
         jWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784731721; x=1785336521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hhejqqk/YejfwiP6Ga/bYKh4OsY78ne2Bp/UpWOM4CI=;
        b=p1s7E/tmogiEcPnfNOWhNLPTB9hDg+6jY3pTLUhDGfGntHlQP0WCFm7Li10QPmGM+w
         2ELNLQ+kOj/c4T46Z0gS8+vh24Cs1/520hiqGErjFsiMmH/M+rHcRAR7P+cSvpSK7pNr
         DIdyJYvmLOr7AW0dZDnqTaGy94YdBQzQxounQxvaX0jBvzlJYENHlZql39BCtYA9qzmJ
         /SuNMkJfBMX9qfP2/wEshNcBnvs/1A6JcvNwZughZtDENFTAUjwnbL2093ZHwf2FYeWt
         P6aFI27ZHfj4XtRiirj0rhJ3K/GGAkdvUdcE/yJ9cEA7mqDREFLM8GQjhru57cNrjmiE
         Prjw==
X-Forwarded-Encrypted: i=1; AHgh+Rpj0JEnK4EN5StYZWqUZ3lc3hnbPwe78HobD/OpNgKRgd35fcBwhfnniWeyz1rYJcUcR4VaIJDmuaqzloVzSukv@lists.infradead.org
X-Gm-Message-State: AOJu0YwqfmrZUwmhcQynwyTACAI61m73tsB/WD4y9fle6zp8ro/XdtvD
	NiLDRr6qQ+qIcVHeN6X5pPW+qr+D2acOqsA1gWPryy7PMwApW1zX+8/x3oXwp+6Q6os=
X-Gm-Gg: AR+sD121+nmYv5DbI8q5MTEcJ4SbTLr58PFS0XHFM1qsyPL69mv/oZOrd4JShRhqsJx
	9WzyU3l9gK0XboGCWcVTsyWsB5Hz9iG9KXYukz9qGV8JLpqw8jvygBoiTKmo1TG3W+j7optVeCG
	fXR4f8oOgDlgF4y/TZkAKTQfu/IC9zzF2mz1xtD1AKdWPfIv2qfW1Xz8i/JvWzyJD5VzYhKmxan
	XIf30YfSloGjWbpjUHn+l/3ticHrQ+TgaUyMOL0BinfY1XO+q9BdHen1yvwy2FKOQF1PiKPAUuU
	dK/DY4zmHZ7PGyxCQAjhbSTkrjZzTyrU8sVSglDX7BvQPZnygZmXaM+HDUrBheRKFaW6zrXbUBO
	vESYkltHLlerN7ntQNFZfr4uR3Otu+8xo6uApYhKm3m05X4vy+/mRtxgczxJum+5gMZ0X2l/+kB
	GTaHkCQstr2Ys=
X-Received: by 2002:a05:600c:6812:b0:495:5eca:f9b3 with SMTP id 5b1f17b1804b1-4955ecafb22mr143440495e9.26.1784731721250;
        Wed, 22 Jul 2026 07:48:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a589:14b5:ba97:3626])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4956a967289sm74385765e9.11.2026.07.22.07.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:48:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 22 Jul 2026 16:48:22 +0200
Subject: [PATCH v6 4/4] clk: sunxi-ng: sun6i-rtc: add a733 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-a733-rtc-v6-4-631cca28cc9a@baylibre.com>
References: <20260722-a733-rtc-v6-0-631cca28cc9a@baylibre.com>
In-Reply-To: <20260722-a733-rtc-v6-0-631cca28cc9a@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6141; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ZxtEY0Po9koFr9SK/FxQWL9lGl95syc2R11eiKw1uuc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYNg9Waoqq3MZucyId8+AceAKymJeYhrmU7zeh
 UM3CcGJcruJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamDYPQAKCRDm/A8cN/La
 hdXlD/4vKyXXdx7/8DZD/I9kaq/bXldqR1mvVfp2cVuODKb5kp6rUP+iGMydJY02oSkCtZ0TCzR
 IexfQP9NvFfsSX4jAHij7HCz6EvwMpjEp4aZU8qgfEv3EDrHgwS3ZxQZLKNd1TQvg4Dl6LCtC+R
 ISb2VLG9rOlHeIsWKbztvAm6s9AX2vPSmGjqk0hAqOi9918vSYEwS7XaXRp+i6KuHoHUwwyUscD
 dKdapZ4DKGJd44UCXdeye3ofL2zS+pzWoFn70xXpRuqmpDqpF/5wlB/qMFp8kLNSTMQ51RNa68n
 IAqSF84X0bxNafRprdjF6scSibQmhYDpOCTEL5NU+fGy7ZTzLXOM1zDQh07ML8eHUpeJHZju824
 uLIcmnjvvg3jd53mKyRqJ9QyqWPGj1KSutZyrAeazTYBl/ypfz2FfoyTt2x7FQiwXyYYqW2SS2n
 sCTqusUmjRby13s6/Y0pKVu0EnLis3KyYuQxFsUMmY76PHxSbJIWnV4YMtGEAvX2pLeWrTSEZU9
 QmwPYoRP9r8u+jGZyOLzQSWP9Fc59nsc9U4dgIlIy4alSQ4zFNACCmZVZka6DuIy+/3+17dwPD6
 jBCxzFi/7xyaH1ZvT+iz5HS7hZLgcgvw7if5KmS4qwopsQmUZ+sfu9Biaj595FVP8AjMKKyk/nV
 kF4eMhJhI0Z1DUw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_074843_229654_5B32CB81 
X-CRM114-Status: GOOD (  18.63  )
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

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 77 ++++++++++++++++++++++++++++++++++--
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h |  2 +-
 2 files changed, 75 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 25dd87e78eb7..98ae10307f43 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -44,9 +44,15 @@
 #define DCXO_CTRL_REG			0x160
 #define DCXO_CTRL_CLK16M_RC_EN		BIT(0)
 
+#define DCXO_GATING_REG			0x16c
+
+#define CLK_NUMBER_NO_GATES		(CLK_OSC24M_32K_DIV + 1)
+
 struct sun6i_rtc_match_data {
 	bool				have_ext_osc32k		: 1;
 	bool				have_iosc_calibration	: 1;
+	bool				have_dcxo_status	: 1;
+	bool				have_phy_ref_gates	: 1;
 	bool				rtc_32k_single_parent	: 1;
 	const struct clk_parent_data	*osc32k_fanout_parents;
 	u8				osc32k_fanout_nparents;
@@ -213,7 +219,12 @@ static struct ccu_mux osc32k_clk = {
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
@@ -227,8 +238,30 @@ static struct clk_fixed_factor osc24M_32k_div_clk = {
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
+	.div	= _SUNXI_CCU_DIV_TABLE_FLAGS(14, 2,
+					     osc24M_32k_div_a733_table,
+					     CLK_DIVIDER_READ_ONLY),
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
@@ -267,6 +300,15 @@ static struct ccu_mux osc32k_fanout_clk = {
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
@@ -275,6 +317,11 @@ static struct ccu_common *sun6i_rtc_ccu_clks[] = {
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
@@ -288,6 +335,10 @@ static struct clk_hw_onecell_data sun6i_rtc_ccu_hw_clks = {
 		[CLK_OSC24M_32K]	= &osc24M_32k_clk.common.hw,
 		[CLK_RTC_32K]		= &rtc_32k_clk.common.hw,
 		[CLK_OSC24M_32K_DIV]	= &osc24M_32k_div_clk.hw,
+		[CLK_HOSC_UFS]		= &hosc_ufs_clk.common.hw,
+		[CLK_HOSC_HDMI]		= &hosc_hdmi_clk.common.hw,
+		[CLK_HOSC_SERDES0]	= &hosc_serdes0_clk.common.hw,
+		[CLK_HOSC_SERDES1]	= &hosc_serdes1_clk.common.hw,
 	},
 };
 
@@ -330,6 +381,15 @@ static const struct sun6i_rtc_match_data sun55i_a523_rtc_ccu_data = {
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
@@ -343,6 +403,10 @@ static const struct of_device_id sun6i_rtc_ccu_match[] = {
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
@@ -375,6 +439,13 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 	osc32k_fanout_init_data.parent_data = data->osc32k_fanout_parents;
 	osc32k_fanout_init_data.num_parents = data->osc32k_fanout_nparents;
 
+	if (data->have_dcxo_status)
+		sun6i_rtc_ccu_hw_clks.hws[CLK_OSC24M_32K_DIV] =
+			&osc24M_32k_div_a733_clk.common.hw;
+
+	if (!data->have_phy_ref_gates)
+		sun6i_rtc_ccu_hw_clks.num = CLK_NUMBER_NO_GATES;
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


