Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33D5C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9owqjjgV0H2CtePOueZPc6abek2AjkJLNAZcj3bC1qU=; b=acCGouIuCpekiFbUIz/w5rmuZW
	lLmt1Ec+LbEDCiQF9nU1YbMosjvUIvq2PIqHdBMbcvdl41HkPmLjxW/6QgJJem0X3vRqTnKuC5d16
	FCe62URmfhn0/trgoxV+XYWHxY8hJ4/89sUzt6xsZ+uLa4zaNBUp4I5RZXlWJC3t5RScBDJq9cqEF
	0echT3fUhbrTTAiOc62YoPgUOD2ntXn4ytFnq6sWWhE1hgxAvMHcBmo716Q7KE6G6Tw+merGnWr0d
	5OUSnxboBL5XPFVMNuUQxl9/dh6tejad1jC2C0m5zdklfSVBJERSokorWHvP/sEfTOKt799nr5xo/
	H32OWmJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfhJ-0000000C29S-3stH;
	Mon, 06 Jul 2026 09:33:05 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfh1-0000000C1wy-0u99
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:32:49 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1676662f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330365; x=1783935165; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9owqjjgV0H2CtePOueZPc6abek2AjkJLNAZcj3bC1qU=;
        b=QkOwp/Kdf27XWaTSSXtV7j4yXgOL1sRcpVYeqtqbEzVCL/Ru3euCgbYVhU/vx+HmWV
         PgVDm1v4VEmMKvthKPM8s87R3Fl/VJQKLF5/Wxzzi0vdvKmbSyMyeHLYn3pz6BU5kR3v
         m5hnav0wTMiprCDqZS4k0FDaBCPtqlOxeQaFzCof7+qHr1ZA2F2aa3yqFcAXbqmje5CB
         TjcWC3gKKZF7F245snG/hiP7q+nbwLxGlp5eLr4efLRyb/fxX1FirA39VuTLlZicV30S
         Xp25og1joIBpdXL/9En5nzt9r7PRY8F6KhQ9hUs9Bz+GV4g0qtrnkCS/PKo2qiHpQ/FM
         6n/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330365; x=1783935165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9owqjjgV0H2CtePOueZPc6abek2AjkJLNAZcj3bC1qU=;
        b=VlLHze5yjpZ/jwnNo1rveqeGXpmjFccqEznOcwxxaB0qUpq68Tu7/INcSHKdSiI+7i
         DVV17J67ZbP4onfVQIoSnoHESHoOksRjU9wgQUrlmL03nd4PC9Ps1iG9eyWHBRI5g68o
         gCoHzfXBTqvEuAcj9z4A1xfb80vh82DN20WF712dEMVuHBUnRRyy8FKmVFQy9Fxn+sZo
         pIHx2rrqfNkSy+a7ws+TWwvjtde5vvhKXBFuN2IvBnFZT+XgUpppXEWa22cGfhPYh13y
         mLsMvHeuQHt95JHoUFL5oNb9morJ9E0KVcu0kDq8x0K1esHpGFr96Pp/N6miUWWvrBcC
         UM8A==
X-Forwarded-Encrypted: i=1; AHgh+RrSh853aJeCaUSELFjs4IggYrbUACfg6D6uWqNatfEvOuBFy1vpPiBh3O0dCsjkgt9r8s+RXA4Te2EPKQu1R62M@lists.infradead.org
X-Gm-Message-State: AOJu0YxuvKfHT3Ae/SWWcuY6tVDp0UJhnzkuGxlFc9s8vHcLltm87C8h
	h1yvOAiNj9HW4fZ1CvWbL4LNAYeyLSyhXykMlx8YDx/25Vy2kFz8LAhYAtDjgG7ltlM=
X-Gm-Gg: AfdE7cmfPVglIvvRackypjejDxO2yD/ywdm3eae6ZDyEu8xFwV9cqBv4Pbnb3w3k0i3
	OUZcnTGsLSxb8wURzw4QDmbocuTDxf/i+8MI/rYnrCOvKnN4XPP+iABfrF2QB9XysYM3UvtPqPe
	uj7VRw/Psh9CW8KggJvd7/lb3wtJ6JRGlkphLnAV83aIHo3EjQFN4OBSsR95Yho4yXHY4l1J1BY
	xOv3Y/Qv0etQUf0ndFdjrMgXzOpL9vM2WdUpFvnXMfLxFY58rzXsCPyyj6zTRBO6cDWX2PnOCeM
	tRftVkbPre6CS02aKukJjAclPQxcqClkLMvBzxX8Nf/ybG4v3oGNMBr87VJfqF73TcNV1KojH2s
	mWekJEm5FVWeilqxJuod9ABVVSp0yAOaam7vYE7FgtpfeEFfcv8bJ4CCEUucIrkWriGdG6p6xCO
	6ZzWZP6MI/9GU=
X-Received: by 2002:a5d:5849:0:b0:47b:69a5:7263 with SMTP id ffacd0b85a97d-47b69a573dfmr9254906f8f.5.1783330365342;
        Mon, 06 Jul 2026 02:32:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9e4d83bdsm23661288f8f.13.2026.07.06.02.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:17 +0200
Subject: [PATCH v4 9/9] clk: sunxi-ng: sun6i-rtc: add a733 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-9-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5987; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=rBendd4uuEhgkyP4RE0zkVRJMkAWDgIQr5V1OAvN0oA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3Ynn47pumsEX0UV9EbWmou0XZTJh6Gx0sej3
 bEXMXj48giJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2JwAKCRDm/A8cN/La
 hbJuD/9QQ/F/99Cf3KupflAYPk1jey3tzzrofcnCl/hF4pb6PB7BUqKs+BdeGrf6o0Wto8aVcb/
 fu1HDNDwe1awevbgyx4JvK7EhbsDPRWZMlXzwx6P5lbjVPJnbtqmpb2X8oOLMRGlfjmCpVajlxq
 5U6NQbkqUT3xqfzEY1wlcm/tfnageqOvkKCZsfD/6rMTI4DGwAqXG4cMmkAQ7MBWYkKRnuy9m3W
 vrPG2Tnmp9tK8ILEJsDiJH8o+0d3Zyq8HCXzgLt6jrx+ltIJeRDm1cnsvIhwag7cYqPJOPwtNgl
 eGW+52PAmGvjrX3o08dBNu1+LMoOlhWdB5Nm854YlCUbbhkxoz6WFix+A43o7SLHeOqqlGuCm4/
 F2P9/7lqvcNhUG+zlpZg2fa/JaiPKGtpnPNJ6HWeAxQd8FrJS1ObdHiBFZlxjSpo40qwdHcb9nY
 E8ORZ3Y1OiDuF5yiqQz89rjI+1e65aSDwzg5Oxurprl/zmvG09xmeBPGqiBiPu++gCZVVF6d+30
 c/u5zJOF1hqysswfOqArQJFuDXMTMsLdRJFKcpENWPUuGgpBD3cn8SmDW64X0zABHhzOhq5RCs+
 cKIk5bfCF7E7TYH97YBHvSkR63nLqU4RTu44eTx9u/DYb+2dK6oWKYCGNYP6H+NME0A3YIgSnV1
 3dbt6hiOlyMyy7g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023248_246329_F3167240 
X-CRM114-Status: GOOD (  18.50  )
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
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 73 ++++++++++++++++++++++++++++++++++--
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h |  2 +-
 2 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 25dd87e78eb7..6b71bbd80255 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -44,9 +44,13 @@
 #define DCXO_CTRL_REG			0x160
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
@@ -213,7 +217,12 @@ static struct ccu_mux osc32k_clk = {
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
@@ -227,8 +236,28 @@ static struct clk_fixed_factor osc24M_32k_div_clk = {
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
@@ -267,6 +296,15 @@ static struct ccu_mux osc32k_fanout_clk = {
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
@@ -275,6 +313,11 @@ static struct ccu_common *sun6i_rtc_ccu_clks[] = {
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
@@ -288,6 +331,10 @@ static struct clk_hw_onecell_data sun6i_rtc_ccu_hw_clks = {
 		[CLK_OSC24M_32K]	= &osc24M_32k_clk.common.hw,
 		[CLK_RTC_32K]		= &rtc_32k_clk.common.hw,
 		[CLK_OSC24M_32K_DIV]	= &osc24M_32k_div_clk.hw,
+		[CLK_HOSC_UFS]		= &hosc_ufs_clk.common.hw,
+		[CLK_HOSC_HDMI]		= &hosc_hdmi_clk.common.hw,
+		[CLK_HOSC_SERDES0]	= &hosc_serdes0_clk.common.hw,
+		[CLK_HOSC_SERDES1]	= &hosc_serdes1_clk.common.hw,
 	},
 };
 
@@ -330,6 +377,15 @@ static const struct sun6i_rtc_match_data sun55i_a523_rtc_ccu_data = {
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
@@ -343,6 +399,10 @@ static const struct of_device_id sun6i_rtc_ccu_match[] = {
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
@@ -375,6 +435,13 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
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


