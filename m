Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5380CCA6018
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPySnsWHLurv7iJhgQhqAkvO8BpmKq9lBzL6S0RCGA4=; b=TYtv5n1KewICxt1kJq7F6YC+/t
	7ELyzHVgPUpgA4ofs+eMi9M8tBzimPF7D4aUeT1rk29sOsBrYVB418JNalfNNA/lhZcop1Mwi+9ol
	eYDU1pAFKaaI7Nk+SpaNbJVkAKwDiM4FKGEZN2QQ4LczH+zvHeZ8R5bubVWp7zZmhs06lL1bFqaIS
	itWwkrz3r3iM1M+xO6AiSb5NLfRN+3RRSVpJzuZFSOGJtu8wGpCjTFxOTNPwpXmSi8/rVtfZB9t2b
	M0CfBUIywGa7hcBTvB4LyQmo4481E7hfAP37oC2UCxRmETBxeuA6GmJ6gu0Tn8M5OIV/iaW0ml+pQ
	b7IO/nbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF91C-00000006CZb-2ZPv;
	Fri, 09 Oct 2026 11:44:06 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF914-00000006CSe-0pn1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:43:59 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261009114355epoutp0265862b516afe71af8307a19bd0631061~c2c81wW0y1731417314epoutp02E
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 11:43:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261009114355epoutp0265862b516afe71af8307a19bd0631061~c2c81wW0y1731417314epoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546235;
	bh=QPySnsWHLurv7iJhgQhqAkvO8BpmKq9lBzL6S0RCGA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dt1bi8yVimSqzUPcNL5Hws/6Qh9Ed7Yrx83Ncy1m7NuxogmOHs9cs35iaeAilXZKR
	 0ETBJHdQUDJgclo4+wX+Y0PGX72MMIY8N0mhbP/POs4ewAtjO9sRl2FlGdXzDipHAa
	 RRr/oqcEaXI8um+xWh/lZUSdm4kWYNJBrakFgB7Q=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261009114355epcas5p2e6e4f03712d15d0b9cfd9895c40c9569~c2c8V9JxP3018230182epcas5p24;
	Fri,  9 Oct 2026 11:43:55 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.89]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j1Q4B1tc8z6B9m4; Fri,  9 Oct
	2026 11:43:54 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114353epcas5p2ab971c641319dc38209c55619e8c8ed9~c2c6_3fxc3018230182epcas5p20;
	Fri,  9 Oct 2026 11:43:53 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114351epsmtip29b7bc626e8890a70f6c563ac6797ac64~c2c4qgtwu1160511605epsmtip2v;
	Fri,  9 Oct 2026 11:43:51 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 08/14] clk: samsung: exynos8855: add block peris clock
 support
Date: Fri,  9 Oct 2026 17:31:31 +0530
Message-Id: <20261009120137.2801911-9-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009120137.2801911-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114353epcas5p2ab971c641319dc38209c55619e8c8ed9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114353epcas5p2ab971c641319dc38209c55619e8c8ed9
References: <20261009120137.2801911-1-raghav.s@samsung.com>
	<CGME20261009114353epcas5p2ab971c641319dc38209c55619e8c8ed9@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_044358_603382_B102C7CF 
X-CRM114-Status: GOOD (  15.27  )
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

Register compatible and cmu_info data to support clocks.
CMU_PERIS, this provides clocks for PERIS

Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-exynos8855.c | 98 ++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
index 5394706d214c..2bf889a478bc 100644
--- a/drivers/clk/samsung/clk-exynos8855.c
+++ b/drivers/clk/samsung/clk-exynos8855.c
@@ -18,7 +18,9 @@
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR_TOP                     (CLKCMU_DOUT_G3D_HTU + 1)
 #define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
+#define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS + 1)
 
+#define EXYNOS8855_PERIS_GATE_DBG_OFFSET      0x2004
 #define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
 #define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
 
@@ -1094,6 +1096,99 @@ static const struct samsung_cmu_info peric_cmu_info __initconst = {
 	.memclk_offset          = EXYNOS8855_MEMCLK_OFFSET,
 };
 
+/* ---- CMU_PERIS --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_PERIS (0x10030000) */
+#define CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER           0x600
+#define CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC                    0x1000
+#define CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER              0x610
+#define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP                   0x1800
+#define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP                    0x1804
+#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK     0x201c
+#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK  0x2040
+#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK          0x2048
+#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK          0x204c
+#define CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL                  0x800
+
+static const unsigned long peris_clk_regs[] __initconst = {
+	CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER,
+	CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC,
+	CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER,
+	CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
+	CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
+	CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
+	CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
+	CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
+	CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
+	CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL,
+};
+
+/* List of parent clocks for Muxes in CMU_PERIS */
+PNAME(mout_clkcmu_peris_noc_user_p) = { "oscclk", "dout_clkcmu_peris_noc" };
+PNAME(mout_clk_peris_gic_p) = { "oscclk", "mout_clkcmu_peris_gic_user" };
+PNAME(mout_clkcmu_peris_gic_user_p) = { "oscclk", "dout_clkcmu_peris_gic" };
+
+static const struct samsung_mux_clock peris_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PERIS_NOC_USER, "mout_clkcmu_peris_noc_user",
+	    mout_clkcmu_peris_noc_user_p, CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER, 4, 1),
+	MUX(CLK_MOUT_PERIS_GIC, "mout_clk_peris_gic",
+	    mout_clk_peris_gic_p, CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC, 0, 1),
+	MUX(CLK_MOUT_PERIS_GIC_USER, "mout_clkcmu_peris_gic_user",
+	    mout_clkcmu_peris_gic_user_p, CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER, 4, 1),
+};
+
+static const struct samsung_div_clock peris_div_clks[] __initconst = {
+	DIV(CLK_DOUT_PERIS_NOCP, "dout_clkcmu_peris_nocp",
+	    "mout_clkcmu_peris_noc_user", CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
+	    0, 4),
+	DIV(CLK_DOUT_PERIS_OTP, "dout_clkcmu_peris_otp",
+	    "oscclk", CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
+	    0, 4),
+};
+
+static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
+	/* System will hang if this critical clock is gated */
+	GATE(CLK_GOUT_CMU_PERIS, "gout_cmu_peris",
+	     "dout_clkcmu_peris_nocp",
+	     CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_SYSREG_PERIS, "gout_sysreg_peris",
+	     "dout_clkcmu_peris_nocp",
+	     CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_WDT0_PERIS, "gout_wdt0_peris",
+	     "dout_clkcmu_peris_nocp",
+	     CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_WDT1_PERIS, "gout_wdt1_peris",
+	     "dout_clkcmu_peris_nocp",
+	     CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
+	     21, 0, 0),
+};
+
+static const unsigned long dcrg_sysreg[] __initconst = {
+	EXYNOS8855_DRCG_EN_OFFSET,
+};
+
+static const struct samsung_cmu_info peris_cmu_info __initconst = {
+	.mux_clks               = peris_mux_clks,
+	.nr_mux_clks            = ARRAY_SIZE(peris_mux_clks),
+	.div_clks               = peris_div_clks,
+	.nr_div_clks            = ARRAY_SIZE(peris_div_clks),
+	.gate_clks              = peris_gate_clks,
+	.nr_gate_clks           = ARRAY_SIZE(peris_gate_clks),
+	.nr_clk_ids             = CLKS_NR_PERIS,
+	.clk_regs               = peris_clk_regs,
+	.nr_clk_regs            = ARRAY_SIZE(peris_clk_regs),
+	.sysreg_clk_regs	= dcrg_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_sysreg),
+	.clk_name               = "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = EXYNOS8855_PERIS_GATE_DBG_OFFSET,
+	.option_offset          = CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL,
+	.drcg_offset            = EXYNOS8855_DRCG_EN_OFFSET,
+};
+
 static int __init exynos8855_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -1109,6 +1204,9 @@ static const struct of_device_id exynos8855_cmu_of_match[] = {
 	{
 		.compatible = "samsung,exynos8855-cmu-peric",
 		.data = &peric_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8855-cmu-peris",
+		.data = &peris_cmu_info,
 	}, {
 		.compatible = "samsung,exynos8855-cmu-top",
 		.data = &top_cmu_info,
-- 
2.34.1


