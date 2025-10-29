Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD8ECCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 06:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmRCy5lFrhDYzLBn9PahtHt2FiadEKGkFtvKIX1UXu8=; b=yYW3FoKS9zxW+T2eloAuchkL3z
	BRrvV0Pkkcwymahux+eI+TOXycIOqUGrxahQzb9ReP2wmWtXsBCVfkVPwoogMhhnMW4PdzLjN6tFL
	8Hg0ps8LZvsK3+rkZmnqp0VSo6GhBCO1DwlpgDbQL3Z1ZsHifid6IT9DP2t0huPM1XFwvpiqzmsQ5
	RApeqEhNLi4781h+euskXTuqMln7+nFITVTeVRjbGY6TmE5PzZ0DSWTjElWwXxSZJIhCadbJnthZ8
	jQkr5UxaBsCximzuoYRjp+ZcB1bV6iU6F5pk5Fj9TS6K1rBIQBCbOqr+oy/FpnYs4Lo3c6xyL0cjy
	jgT7qi+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDzWw-0000000HRx0-1UZF;
	Wed, 29 Oct 2025 06:19:34 +0000
Received: from mo-csw1800.securemx.jp ([210.130.202.134] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDzWt-0000000HRvK-2Y7w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 06:19:33 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=
	1761718755;x=1762928355;bh=XQbm9gT0FmsvNn/DCDwiVeIZ+/JgLi9QBanOXYYx3M4=;b=NkA
	aHME4WgdZ7HUujpiLX+NIB4iI1nTVQSXiXv/6MO5bBDcP4r+mZH19HjpSCi6LjbF+7zyLVFINqLIp
	DIXVVdxsucADivJDWH4yEavDpaAQ/Uzcqmc8aqnHf1q8V4xIesR1I9rrukTPJC76psKbPw5OLKppT
	kyGI/ZzpZqDqNl/gxZJOQjEYjlbDe9xTZDT2jH3xrSCleFSGo9G5FjIoN6AhPoe4jAuyWYHILVRoC
	plYvTl1okMVlqSdqEVb82TpmICTfYpdMhLvLuHGuIq0pgschGYdJq6P2WelqDg7TvBXtGjls8pY5s
	Eq5pcM4a1kUvbwmnRGfyZ1AuGP8YpDg==;
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 59T6JEMD1316549; Wed, 29 Oct 2025 15:19:14 +0900
X-Iguazu-Qid: 2yAbDoX6mRH41gehdo
X-Iguazu-QSIG: v=2; s=0; t=1761718753; q=2yAbDoX6mRH41gehdo; m=pclAYtZ7pBrHZt8LYmpYud/jNnTsExEG04RaG1tDPQk=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cxHBm4wzRz1xnc; Wed, 29 Oct 2025 15:19:12 +0900 (JST)
X-SA-MID: 53851528
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Subject: [PATCH v2 2/2] clk: visconti: Add definition of VIIF on Toshiba Visconti TMPV770x SoC
Date: Wed, 29 Oct 2025 15:13:44 +0900
X-TSB-HOP2: ON
Message-Id: <20251029061344.451222-3-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251029061344.451222-1-yuji2.ishikawa@toshiba.co.jp>
References: <20251029061344.451222-1-yuji2.ishikawa@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_231931_985874_E5081B4C 
X-CRM114-Status: GOOD (  13.66  )
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

Add the control sequence of register bits to handle the clocks and the
resets of Video Input Interface.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
Changelog v2:
- Update clk_gate_tables to reflect changes in bindings identifiers.
---
 drivers/clk/visconti/clkc-tmpv770x.c | 71 ++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/clk/visconti/clkc-tmpv770x.c b/drivers/clk/visconti/clkc-tmpv770x.c
index 6c753b2cb..b3f4de671 100644
--- a/drivers/clk/visconti/clkc-tmpv770x.c
+++ b/drivers/clk/visconti/clkc-tmpv770x.c
@@ -28,6 +28,10 @@ static const struct clk_parent_data pietherplls_parent_data[] = {
 	{ .fw_name = "pietherpll", .name = "pietherpll", },
 };
 
+static const struct clk_parent_data pidnnplls_parent_data[] = {
+	{ .fw_name = "pidnnpll", .name = "pidnnpll", },
+};
+
 static const struct visconti_fixed_clk fixed_clk_tables[] = {
 	/* PLL1 */
 	/* PICMPT0/1, PITSC, PIUWDT, PISWDT, PISBUS, PIPMU, PIGPMU, PITMU */
@@ -64,6 +68,41 @@ static const struct visconti_clk_gate_table pietherpll_clk_gate_tables[] = {
 		TMPV770X_RESET_PIETHER_125M, },
 };
 
+static const struct visconti_clk_gate_table pidnnpll_clk_gate_tables[] = {
+	{ TMPV770X_CLK_VIIFBS0, "viifbs0",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 1, 1,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIFBS0_PROC, "viifbs0_proc",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 18, 1,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIFBS0_L1ISP, "viifbs0_l1isp",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 17, 1,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIFBS0_L2ISP, "viifbs0_l2isp",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 16, 1,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIFBS1, "viifbs1",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 5, 1,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIFBS1_PROC, "viifbs1_proc",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 22, 1,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIFBS1_L1ISP, "viifbs1_l1isp",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 21, 1,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIFBS1_L2ISP, "viifbs1_l2isp",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 20, 1,
+		NO_RESET, },
+};
+
 static const struct visconti_clk_gate_table clk_gate_tables[] = {
 	{ TMPV770X_CLK_HOX, "hox",
 		clks_parent_data, ARRAY_SIZE(clks_parent_data),
@@ -185,6 +224,22 @@ static const struct visconti_clk_gate_table clk_gate_tables[] = {
 		clks_parent_data, ARRAY_SIZE(clks_parent_data),
 		0, 0x14, 0x114, 0, 4,
 		TMPV770X_RESET_SBUSCLK, },
+	{ TMPV770X_CLK_VIIF0_CFGCLK, "csi2rx0cfg",
+		clks_parent_data, ARRAY_SIZE(clks_parent_data),
+		0, 0x58, 0x158, 0, 24,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIF0_APBCLK, "csi2rx0apb",
+		clks_parent_data, ARRAY_SIZE(clks_parent_data),
+		0, 0x58, 0x158, 2, 4,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIF1_CFGCLK, "csi2rx1cfg",
+		clks_parent_data, ARRAY_SIZE(clks_parent_data),
+		0, 0x58, 0x158, 4, 24,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIF1_APBCLK, "csi2rx1apb",
+		clks_parent_data, ARRAY_SIZE(clks_parent_data),
+		0, 0x58, 0x158, 6, 4,
+		NO_RESET, },
 };
 
 static const struct visconti_reset_data clk_reset_data[] = {
@@ -220,6 +275,14 @@ static const struct visconti_reset_data clk_reset_data[] = {
 	[TMPV770X_RESET_PIPCMIF]	= { 0x464, 0x564, 0, },
 	[TMPV770X_RESET_PICKMON]	= { 0x410, 0x510, 8, },
 	[TMPV770X_RESET_SBUSCLK]	= { 0x414, 0x514, 0, },
+	[TMPV770X_RESET_VIIFBS0]	= { 0x458, 0x558, 0, },
+	[TMPV770X_RESET_VIIFBS0_APB]	= { 0x458, 0x558, 1, },
+	[TMPV770X_RESET_VIIFBS0_L2ISP]	= { 0x458, 0x558, 16, },
+	[TMPV770X_RESET_VIIFBS0_L1ISP]	= { 0x458, 0x558, 17, },
+	[TMPV770X_RESET_VIIFBS1]	= { 0x458, 0x558, 4, },
+	[TMPV770X_RESET_VIIFBS1_APB]	= { 0x458, 0x558, 5, },
+	[TMPV770X_RESET_VIIFBS1_L2ISP]	= { 0x458, 0x558, 20, },
+	[TMPV770X_RESET_VIIFBS1_L1ISP]	= { 0x458, 0x558, 21, },
 };
 
 static int visconti_clk_probe(struct platform_device *pdev)
@@ -272,6 +335,14 @@ static int visconti_clk_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = visconti_clk_register_gates(ctx, pidnnpll_clk_gate_tables,
+				    ARRAY_SIZE(pidnnpll_clk_gate_tables),
+				    clk_reset_data, &tmpv770x_clk_lock);
+	if (ret) {
+		dev_err(dev, "Failed to register pidnnpll clock gate: %d\n", ret);
+		return ret;
+	}
+
 	return of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &ctx->clk_data);
 }
 
-- 
2.34.1



