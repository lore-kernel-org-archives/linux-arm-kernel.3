Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70745CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 01:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbugF4Wh4EgCXwQseRCf+1nmvj7ECMo8nAulpVom31Y=; b=rWB2p+jIWraeaWl2/fLM9rw2dX
	6WFK2a8n4TJlqizuldgA+EjfPj9AbgYk9D8ZhnbaK5gYDOHWOxNE5LV/Uqn046rwUsKXK1+kM6CWh
	1pXX3uu8c0E7LNOONBM2weY21SxgXuuTG3seT1NrHlzaQBxM2Ui3UJYVcs8tDUpsudNw/gJIQxfhN
	/wLWMkKxn7m8B4XWy7bKHW/v26bXRktGlURmF+v5lZkCl3XZY8P9MlxvcigLGlDwJet8bC9dFlysA
	u2/MNqSMpcFwesjDE7at1wjcFVh3Yc5ymgY5USD3QJ2OVh3ExievSdRDr62N1wJLxqOTskYKJxmAE
	658F3+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Cy0-00000003Dvh-2Wcd;
	Thu, 16 Oct 2025 01:39:44 +0000
Received: from mo-csw1802.securemx.jp ([210.130.202.152] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Cxv-00000003Du4-2pXf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 01:39:42 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=
	1760578761;x=1761788361;bh=KF95KHIF5n/NWiouxrR5rmaymihnIGb3Q0Ytf6BThGw=;b=mMe
	IQAw312Oe3tLd2Nl0dF0+9zwfXtYrTkqD3w4nCAZAXhKyFJrsF0CVFs0dmO29p0hNOLvZNCIzKZFq
	LIrzeL19Nlhl4iKfEm5qPDcXDxR8JE966yfcQWBBes538C6rY4udwMTQYQk4NGxWm1rMCFnUfYCHd
	0UNh2qC6wucKmmmzB2uokxWT4FFrkftzzk4nqhZUV9JGa5HdczhqXX/64JB2Nk3KzWRthJb0maP5l
	oUO68kX7fUjNBiUYVdYSmWq5YJVeABQEzofZ5sb+O7E/4/l+8qA5ixXWwUzUpu7tVOALj6qqLAk67
	8E1GZp57se7TSmC8xu0G65poz6v0Hjw==;
Received: by mo-csw.securemx.jp (mx-mo-csw1802) id 59G1dJcC3273527; Thu, 16 Oct 2025 10:39:19 +0900
X-Iguazu-Qid: 2yAbS6oRblA7hVjuDT
X-Iguazu-QSIG: v=2; s=0; t=1760578759; q=2yAbS6oRblA7hVjuDT; m=a/gZ+VdfESH340MKbFeYWjJkiTiKn1u2fVvkgx1fU+o=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cn9bp24k6z1xnf; Thu, 16 Oct 2025 10:39:18 +0900 (JST)
X-SA-MID: 53068316
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] clk: visconti: Add definition of VIIF on Toshiba Visconti TMPV770x SoC
Date: Thu, 16 Oct 2025 10:33:28 +0900
X-TSB-HOP2: ON
Message-Id: <20251016013328.303611-3-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251016013328.303611-1-yuji2.ishikawa@toshiba.co.jp>
References: <20251016013328.303611-1-yuji2.ishikawa@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_183939_949361_836D22C8 
X-CRM114-Status: GOOD (  12.83  )
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
 drivers/clk/visconti/clkc-tmpv770x.c | 71 ++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/clk/visconti/clkc-tmpv770x.c b/drivers/clk/visconti/clkc-tmpv770x.c
index 6c753b2cb5..26cdfa565e 100644
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
+	{ TMPV770X_CLK_VIIFBS0_PROC, "viif0bsproc",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 1, 1,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIF0_PROC, "viif0proc",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 18, 1,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIF0_L1ISP, "viif0l1isp",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 17, 1,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIF0_L2ISP, "viif0l2isp",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 16, 1,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIFBS1_PROC, "viif1bsproc",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 5, 1,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIF1_PROC, "viif1proc",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 22, 1,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIF1_L1ISP, "viif1l1isp",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 21, 1,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIF1_L2ISP, "viif1l2isp",
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
+	{ TMPV770X_CLK_VIIFBS0_CFG, "csi2rx0cfg",
+		clks_parent_data, ARRAY_SIZE(clks_parent_data),
+		0, 0x58, 0x158, 0, 24,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIFBS0_APB, "csi2rx0apb",
+		clks_parent_data, ARRAY_SIZE(clks_parent_data),
+		0, 0x58, 0x158, 2, 4,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIFBS1_CFG, "csi2rx1cfg",
+		clks_parent_data, ARRAY_SIZE(clks_parent_data),
+		0, 0x58, 0x158, 4, 24,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIFBS1_APB, "csi2rx1apb",
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
2.43.0



