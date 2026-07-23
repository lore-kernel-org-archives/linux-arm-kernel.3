Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA1DC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 11:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hhejqqk/YejfwiP6Ga/bYKh4OsY78ne2Bp/UpWOM4CI=; b=BLIsSYjtTVWD2kAwPwtl0GJLzg
	7iIt014Z1HE5WKddilVrOqVMGR0fx+kY08p//ee9JePmifw0bTKsOU/J8uWyMpNlRMkK2fNoWEQYm
	jr4KALaBBqsACl/VTNd2JFbXsiC9IPCAnMz1eBgCWl27BrrV5l1QRWuZupggb0bGJtW4K0Jjj+cBx
	CmGMYDKuF1lzsIgqyTPz8IUg6yhpuszJjROLCxNN/DsAZYbrjiZyGAQIaAn5Eyl6w0m9xXCNnDTEA
	I2fBDjCzG1qy7aF3uoDzO85eLGANBrrjgdKET/QzOcqNE5R4jCiOstf0JYXP5mfWuhc608+fPxEzi
	tRSxt2Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpuf-0000000Duyn-1kIt;
	Thu, 23 Jul 2026 09:40:21 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpuY-0000000Duuu-2qlG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 09:40:15 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49548aebcd8so3315925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784799613; x=1785404413; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hhejqqk/YejfwiP6Ga/bYKh4OsY78ne2Bp/UpWOM4CI=;
        b=eGj1cjx1TPYJyEwxnBXvSukCqCPmE5BFQt9T1giXZoxiTVjmoBr8EvcfmOd6XQ6cRt
         1HMXbQduWr52MWLSjPhVLqGj+9URiGe2TszEPkGAkNULqItlFzkIqQhle78eFgx73K0P
         kz5xXKgT/a/2UT5j4MErRlc2AwIw+UVhXGeZ3pwqfByr6QvZNASsoeZH23IP8jnEIB2/
         V8KhQ6+EehovSi2zCkraV8NgS+CxTjLBin2VmTCJNV6rwaeaoba8qVrRrksZb+kSuxKS
         2GqUAInYzY8qvXhgORaCJj/76uWtVX9COl8XgC5ZkANSxN5HeTaH+pcjkpKWoL18QXvf
         4cPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799613; x=1785404413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hhejqqk/YejfwiP6Ga/bYKh4OsY78ne2Bp/UpWOM4CI=;
        b=ZdF1jPH/A/4wt/HX62KVAy7UokUda0OG/7V8ctcovacpFoa/NX8ZNqOiaJxyr0n3nl
         0MZ7zAzCg4DUb556IBQTHy3hquJSLF2lLZLnH9D0w9qGUgfpgOYKgcrvKFBhde13N4lm
         Xtzn/Sqb8FkP13Ut3M3mkeBZ/qslyAqHgY0FqOgWI0ZL8qyrWQCnzxfSIY+sDAgPYcIh
         bVi/+RgwOc8XwwEXFabF1QA3zON8bsfTKFmQhQPxFtN3kWdTswujzTRZiXiwgG08iZM+
         PcYN6w/EAve4DxYgsFfr78B15W1Kp2UgvzODF7SL3Jr6n7fn5gc+FGcQBXgdnRv7DLtD
         ejZw==
X-Forwarded-Encrypted: i=1; AHgh+RopE4ILBZO+T0pUQyHX0AAKf3PRvkwuM3479ccIlRhjUYBz+jP52cRVInCRCLKky+ujS+2mtO53AoxhYk18lq5K@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtbw4b9lTyxhmixEMKVXV6u8sxSibSy7DLIo7BWHmVFB6r4DTL
	dMq04bQ+FR/B5Msy4b7IEtFRb+fjK/goQCc4Riy4ChmRnlnT1zDghaA5mHdR2HyLVWc=
X-Gm-Gg: AR+sD11ArjpHzYH40UVn8BDyjqgFQOfVuKu5jbRCoPkGG18bYIUlOXaSLA1SVBCFL0J
	l07dDJg6Kf3ATJq92+GhVDP8JlNlatBIw2GuNdFnw21ptVMmjtuRV/YNncLd9aWcqIiCkMDaoWX
	t/MbCGBcjf5vv52aF6tmfAEXyESGIyl1gi3bXaYrUPgcR7ENvnA/VFr8Bnj1AFwYY8oOyz/i4Vy
	0j67erc7mVpzyFDg6bjPJcv1Wt+smMacK0aO9i4XCkFctUBa1mxzaY0o3u/U9NFnMjKsSgawREK
	DPEe1BetjdnrirypKRWSUvSQ97FSCDESMqGbqfRFAVbBziHMfBOZSYCgBvYGzrjSY6cUiTZ8PAg
	I2aQJtkegMbe9gLwdQYx6W3e+xtPsDqL7wvbqd/xg5ga3Qx/QhPbwoO0TYuwf4iSnhBh4oU5Z3d
	IC
X-Received: by 2002:a05:600c:1d21:b0:495:4856:2659 with SMTP id 5b1f17b1804b1-49573cca1b0mr23638405e9.9.1784799612784;
        Thu, 23 Jul 2026 02:40:12 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3274:dbb5:2710:802b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4956a4f24bcsm158047615e9.1.2026.07.23.02.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:40:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 23 Jul 2026 11:39:54 +0200
Subject: [PATCH v7 4/4] clk: sunxi-ng: sun6i-rtc: add a733 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-a733-rtc-v7-4-8fd68aab94ae@baylibre.com>
References: <20260723-a733-rtc-v7-0-8fd68aab94ae@baylibre.com>
In-Reply-To: <20260723-a733-rtc-v7-0-8fd68aab94ae@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYeFwGSqTbtJvNIzd3HhhthCSgN4NGzqOMzbJW
 M0apMB3fCqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamHhcAAKCRDm/A8cN/La
 heDsD/9HQP7iuGP55hZHz1ZpmKRUvcOZL8sxSbG9MoY3tekyiDTBSVmcTb+vP1YcQdXgUQZsQVY
 fM6OrCU77nlndH8ofR47fnV5/C543J+IdjjW6bsP76vbXwpTV74y5XwUQ0ahZunbh5/iC+HEjDE
 8Vlzl8WrGplwwHqCddqPkexkem7abHcS3UFX3gGk7KograpfM5FqiQAiLq70WtwmlN2rpEUuapQ
 9HFV3vfZ9EebUD2kBQhJHjEDHktPjRebn/VGQ6/FfcgGphj4Rw5ZuVhcN/HThFMeN2ZYy0mu+oi
 p2oBldMsOxnUgp5CZLR5FvLXnWUOcuJvIPUzPXEzGuDpdiwxsF9SGzI62Zvk0TpfYEhABEdrp9S
 TMCYLVbMx0C9Oag9btZttNmQFTQHAS5F0GS8uDqujicn1OHh6vHdxQdaX8jeVgcqbI7kPAVI9tT
 rCpQ2zbBzAWgzzsfNNPfHJ1dlc+oSuYOY7PqInxPDG2wimTuVRAPBz37AUxqCYe46GFMrg7z7/K
 m3Urf44Je/jLHIAYLM06zMMO3dLztHfvbgn7rcmx3HkU3Zx189x8REkplZNzHzv8tXQmON3f3T1
 VCkLjeoCWaCtzmO7Pxv1OInghaBnUq0u/ZUtQ1WvW2/EY9Me0dIHkY4QnVizMH8e9r9gKfBNqNI
 O09Nwa1TS7JZMLA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_024014_756631_849BA6D0 
X-CRM114-Status: GOOD (  18.19  )
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


