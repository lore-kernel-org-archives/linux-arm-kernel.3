Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969E2C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 09:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4ZtzxF1LUt6estS3YpoxSEuF6YSn+c/UbHDd3Q+rx0=; b=NcE0vvYcK5uO1CrVu5mnROEZub
	N4R7l2Wr3x3oOHGF3+5RupjsYvuLXVslQJs77Caem6QL4K6XTGshiEsyQ5rmrGab85XP50DEPv8bf
	NjZi8VdozZ17fbIfna/uXyVoMRRMD2AURcNvShyGhvpcN8R1wdfF5WB6bdhrVU7iG+fdW0Yb+q08o
	iarhzp02x1fX18tZ2ElnyNXlVOqAiBaaEsRus3aJz0AM1nSU0g8/ikCQxNnCheKCM0GcYDLmEGapR
	qLBREm6oPXloL9q1zEU/YpzdclGZCPcsKtdhx5hnP16IDshrK8ywYZsI+Haex+Tj0qCr9Iu9CVQai
	eI1ap9ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KYz-00000005YzA-1vkN;
	Mon, 28 Apr 2025 09:14:09 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9K9K-00000005Vfm-04gm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 08:47:41 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250428084730epoutp03c65c253abb529a73bc47930c5149fe05~6by5qQ_cE1302913029epoutp03O
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 08:47:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250428084730epoutp03c65c253abb529a73bc47930c5149fe05~6by5qQ_cE1302913029epoutp03O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745830050;
	bh=X4ZtzxF1LUt6estS3YpoxSEuF6YSn+c/UbHDd3Q+rx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kV0vKkWPoG5lGnF7OSW7SCOO3brFHwHTNug2MbpX1RZVBWu6ZBC+QpUpz7puxaVdN
	 LNUq/wd/6mnRNu+ez/5y8o9fXtYUiNsGwLTwxfeUar59+32PumHTcDJrcMXKDUhyxb
	 ToKE1HqUg3mCAVNWRk2sugY4BS9zXeQ3cXVjeGmo=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250428084729epcas2p4c5b599968b43e3b8a0d231f05d5e1005~6by42Nw5e0901809018epcas2p4X;
	Mon, 28 Apr 2025 08:47:29 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZmHBn3X7mz3hhTC; Mon, 28 Apr
	2025 08:47:29 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250428084728epcas2p17a0253f04de15c23ab6362113a0d47bb~6by34lqJx1066510665epcas2p1H;
	Mon, 28 Apr 2025 08:47:28 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250428084728epsmtrp276e991ba513829c0215ac2d745fa1bf3~6by306a3W1061810618epsmtrp2H;
	Mon, 28 Apr 2025 08:47:28 +0000 (GMT)
X-AuditID: b6c32a28-460ee70000001e8a-9b-680f40a04850
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	81.C0.07818.0A04F086; Mon, 28 Apr 2025 17:47:28 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250428084728epsmtip1eefcb95164db7026dc68eb7d3c9d6a2d~6by3hKKRh1957719577epsmtip1u;
	Mon, 28 Apr 2025 08:47:28 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] clk: samsung: exynosautov920: add cpucl1/2 clock
 support
Date: Mon, 28 Apr 2025 17:47:20 +0900
Message-ID: <20250428084721.3832664-3-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428084721.3832664-1-shin.son@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWy7bCSnO4CB/4Mg6UbFC0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxWLy8bWsFk3L1jM58Hu8v9HK7rFpVSebx+Yl9R59W1YxenzeJBfAGsVlk5Kak1mWWqRv
	l8CVsevDZaaCF8EVy/d3sjUwTvPsYuTkkBAwkVg+7xUbiC0ksJtRYsU0Z4i4hMThGRMYIWxh
	ifstR1i7GLmAat4zSsy5eZSli5GDg01AVWLTb3mQuIjAWyaJ5f8PMIE0MAucZpTYeUYGxBYW
	8JXYeuUUWJwFqP7Yij1gy3gFrCUu7O5iBZkjISAv0d8hARLmFLCROH+xkw0kLARU0tfDDVEt
	KHFy5hMWiOnyEs1bZzNPYBSYhSQ1C0lqASPTKkbJ1ILi3PTcZMMCw7zUcr3ixNzi0rx0veT8
	3E2M4OjQ0tjB+O5bk/4hRiYOxkOMEhzMSiK8VQb8GUK8KYmVValF+fFFpTmpxYcYpTlYlMR5
	VxpGpAsJpCeWpGanphakFsFkmTg4pRqYCt5+E7P75t0qFTD1uvVf10Xet040OV38OZe7RH3p
	lK5e5srMyRPsvx7saS3nOC4cvk3vtdRhzlvr9atCP7w4L1MgnPk0oGh2S9jPL+u33XlQu23j
	gWftJis/LRJf2sIkEHJJ9dfNHT/L95x+ZLvn/5VrP927UhnWtCWrGB553sW34JdFfZNzUuBO
	nsNeti/2Rl8UPHBm5jOb6FI/nwv/z+Ue3Xtz9cUTjxwLHDzrb9Vu+f6qVVZa6HJus72troNk
	ruvK1YnLpi0IuKLN4eRQxd6ff/SfcdsfoU/V0vv8Lgg/Yrw5veduverSiNxVL1ZF7aq3WBV+
	+Igid6jov6gD8/ae/3RMoF27UOWvUY5kgRJLcUaioRZzUXEiAEUXm9j9AgAA
X-CMS-MailID: 20250428084728epcas2p17a0253f04de15c23ab6362113a0d47bb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428084728epcas2p17a0253f04de15c23ab6362113a0d47bb
References: <20250428084721.3832664-1-shin.son@samsung.com>
	<CGME20250428084728epcas2p17a0253f04de15c23ab6362113a0d47bb@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_014739_054909_1D0CC1EE 
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

Register compatible and cmu_info data to support clock CPUCL1/2
(CPU Cluster 1 and CPU Cluster 2),
these provide clock for CPUCL1/2_SWTICH/CLUSTER.

These clocks are required early during boot for the CPUs,
so they are declared using CLK_OF_DECLARE instead of being registered
through a platform driver.

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov920.c | 208 ++++++++++++++++++++++-
 1 file changed, 207 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index 8021e0912e50..f8168eed4a66 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -18,7 +18,9 @@
 
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR_TOP			(DOUT_CLKCMU_TAA_NOC + 1)
-#define CLKS_NR_CPUCL0			(CLK_DOUT_CLUSTER0_PERIPHCLK + 1)
+#define CLKS_NR_CPUCL0			(CLK_DOUT_CPUCL0_NOCP + 1)
+#define CLKS_NR_CPUCL1			(CLK_DOUT_CPUCL1_NOCP + 1)
+#define CLKS_NR_CPUCL2			(CLK_DOUT_CPUCL2_NOCP + 1)
 #define CLKS_NR_PERIC0			(CLK_DOUT_PERIC0_I3C + 1)
 #define CLKS_NR_PERIC1			(CLK_DOUT_PERIC1_I3C + 1)
 #define CLKS_NR_MISC			(CLK_DOUT_MISC_OSC_DIV2 + 1)
@@ -1135,6 +1137,210 @@ static void __init exynosautov920_cmu_cpucl0_init(struct device_node *np)
 CLK_OF_DECLARE(exynosautov920_cmu_cpucl0, "samsung,exynosautov920-cmu-cpucl0",
 	       exynosautov920_cmu_cpucl0_init);
 
+/* ---- CMU_CPUCL1 --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_CPUCL1 (0x1ED00000) */
+#define PLL_LOCKTIME_PLL_CPUCL1				0x0000
+#define PLL_CON0_PLL_CPUCL1				0x0100
+#define PLL_CON1_PLL_CPUCL1				0x0104
+#define PLL_CON3_PLL_CPUCL1				0x010c
+#define PLL_CON0_MUX_CLKCMU_CPUCL1_CLUSTER_USER		0x0600
+#define PLL_CON0_MUX_CLKCMU_CPUCL1_SWITCH_USER		0x0610
+
+#define CLK_CON_MUX_MUX_CLK_CPUCL1_CLUSTER		0x1000
+#define CLK_CON_MUX_MUX_CLK_CPUCL1_CORE			0x1004
+
+#define CLK_CON_DIV_DIV_CLK_CLUSTER1_ACLK		0x1800
+#define CLK_CON_DIV_DIV_CLK_CLUSTER1_ATCLK		0x1804
+#define CLK_CON_DIV_DIV_CLK_CLUSTER1_MPCLK		0x1808
+#define CLK_CON_DIV_DIV_CLK_CLUSTER1_PCLK		0x180c
+#define CLK_CON_DIV_DIV_CLK_CLUSTER1_PERIPHCLK		0x1810
+#define CLK_CON_DIV_DIV_CLK_CPUCL1_NOCP			0x181c
+
+static const unsigned long cpucl1_clk_regs[] __initconst = {
+	PLL_LOCKTIME_PLL_CPUCL1,
+	PLL_CON0_PLL_CPUCL1,
+	PLL_CON1_PLL_CPUCL1,
+	PLL_CON3_PLL_CPUCL1,
+	PLL_CON0_MUX_CLKCMU_CPUCL1_CLUSTER_USER,
+	PLL_CON0_MUX_CLKCMU_CPUCL1_SWITCH_USER,
+	CLK_CON_MUX_MUX_CLK_CPUCL1_CLUSTER,
+	CLK_CON_MUX_MUX_CLK_CPUCL1_CORE,
+	CLK_CON_DIV_DIV_CLK_CLUSTER1_ACLK,
+	CLK_CON_DIV_DIV_CLK_CLUSTER1_ATCLK,
+	CLK_CON_DIV_DIV_CLK_CLUSTER1_MPCLK,
+	CLK_CON_DIV_DIV_CLK_CLUSTER1_PCLK,
+	CLK_CON_DIV_DIV_CLK_CLUSTER1_PERIPHCLK,
+	CLK_CON_DIV_DIV_CLK_CPUCL1_NOCP,
+};
+
+/* List of parent clocks for Muxes in CMU_CPUCL1 */
+PNAME(mout_pll_cpucl1_p)		 = { "oscclk", "fout_cpucl1_pll" };
+PNAME(mout_cpucl1_cluster_user_p)	 = { "oscclk", "dout_clkcmu_cpucl1_cluster" };
+PNAME(mout_cpucl1_switch_user_p)	 = { "oscclk", "dout_clkcmu_cpucl1_switch" };
+PNAME(mout_cpucl1_cluster_p)		 = { "oscclk", "mout_cpucl1_cluster_user",
+						"mout_cpucl1_switch_user"};
+PNAME(mout_cpucl1_core_p)		 = { "oscclk", "mout_pll_cpucl1",
+						"mout_cpucl1_switch_user"};
+
+static const struct samsung_pll_clock cpucl1_pll_clks[] __initconst = {
+	/* CMU_CPUCL1_PURECLKCOMP */
+	PLL(pll_531x, CLK_FOUT_CPUCL1_PLL, "fout_cpucl1_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_CPUCL1, PLL_CON3_PLL_CPUCL1, cpu_pll_rates),
+};
+
+static const struct samsung_mux_clock cpucl1_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PLL_CPUCL1, "mout_pll_cpucl1", mout_pll_cpucl1_p,
+	    PLL_CON0_PLL_CPUCL1, 4, 1),
+	MUX(CLK_MOUT_CPUCL1_CLUSTER_USER, "mout_cpucl1_cluster_user", mout_cpucl1_cluster_user_p,
+	    PLL_CON0_MUX_CLKCMU_CPUCL1_CLUSTER_USER, 4, 1),
+	MUX(CLK_MOUT_CPUCL1_SWITCH_USER, "mout_cpucl1_switch_user", mout_cpucl1_switch_user_p,
+	    PLL_CON0_MUX_CLKCMU_CPUCL1_SWITCH_USER, 4, 1),
+	MUX(CLK_MOUT_CPUCL1_CLUSTER, "mout_cpucl1_cluster", mout_cpucl1_cluster_p,
+	    CLK_CON_MUX_MUX_CLK_CPUCL1_CLUSTER, 0, 2),
+	MUX(CLK_MOUT_CPUCL1_CORE, "mout_cpucl1_core", mout_cpucl1_core_p,
+	    CLK_CON_MUX_MUX_CLK_CPUCL1_CORE, 0, 2),
+};
+
+static const struct samsung_div_clock cpucl1_div_clks[] __initconst = {
+	DIV(CLK_DOUT_CLUSTER1_ACLK, "dout_cluster1_aclk",
+	    "mout_cpucl1_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER1_ACLK, 0, 4),
+	DIV(CLK_DOUT_CLUSTER1_ATCLK, "dout_cluster1_atclk",
+	    "mout_cpucl1_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER1_ATCLK, 0, 4),
+	DIV(CLK_DOUT_CLUSTER1_MPCLK, "dout_cluster1_mpclk",
+	    "mout_cpucl1_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER1_MPCLK, 0, 4),
+	DIV(CLK_DOUT_CLUSTER1_PCLK, "dout_cluster1_pclk",
+	    "mout_cpucl1_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER1_PCLK, 0, 4),
+	DIV(CLK_DOUT_CLUSTER1_PERIPHCLK, "dout_cluster1_periphclk",
+	    "mout_cpucl1_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER1_PERIPHCLK, 0, 4),
+	DIV(CLK_DOUT_CPUCL1_NOCP, "dout_cpucl1_nocp",
+	    "mout_cpucl1_cluster", CLK_CON_DIV_DIV_CLK_CPUCL1_NOCP, 0, 4),
+};
+
+static const struct samsung_cmu_info cpucl1_cmu_info __initconst = {
+	.pll_clks		= cpucl1_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(cpucl1_pll_clks),
+	.mux_clks		= cpucl1_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(cpucl1_mux_clks),
+	.div_clks		= cpucl1_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(cpucl1_div_clks),
+	.nr_clk_ids		= CLKS_NR_CPUCL1,
+	.clk_regs		= cpucl1_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(cpucl1_clk_regs),
+	.clk_name		= "cpucl1",
+};
+
+static void __init exynosautov920_cmu_cpucl1_init(struct device_node *np)
+{
+	exynos_arm64_register_cmu(NULL, np, &cpucl1_cmu_info);
+}
+
+/* Register CMU_CPUCL1 early, as CPU clocks should be available ASAP */
+CLK_OF_DECLARE(exynosautov920_cmu_cpucl1, "samsung,exynosautov920-cmu-cpucl1",
+	       exynosautov920_cmu_cpucl1_init);
+
+/* ---- CMU_CPUCL2 --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_CPUCL2 (0x1EE00000) */
+#define PLL_LOCKTIME_PLL_CPUCL2				0x0000
+#define PLL_CON0_PLL_CPUCL2				0x0100
+#define PLL_CON1_PLL_CPUCL2				0x0104
+#define PLL_CON3_PLL_CPUCL2				0x010c
+#define PLL_CON0_MUX_CLKCMU_CPUCL2_CLUSTER_USER		0x0600
+#define PLL_CON0_MUX_CLKCMU_CPUCL2_SWITCH_USER		0x0610
+
+#define CLK_CON_MUX_MUX_CLK_CPUCL2_CLUSTER		0x1000
+#define CLK_CON_MUX_MUX_CLK_CPUCL2_CORE			0x1004
+
+#define CLK_CON_DIV_DIV_CLK_CLUSTER2_ACLK		0x1800
+#define CLK_CON_DIV_DIV_CLK_CLUSTER2_ATCLK		0x1804
+#define CLK_CON_DIV_DIV_CLK_CLUSTER2_MPCLK		0x1808
+#define CLK_CON_DIV_DIV_CLK_CLUSTER2_PCLK		0x180c
+#define CLK_CON_DIV_DIV_CLK_CLUSTER2_PERIPHCLK		0x1810
+#define CLK_CON_DIV_DIV_CLK_CPUCL2_NOCP			0x181c
+
+static const unsigned long cpucl2_clk_regs[] __initconst = {
+	PLL_LOCKTIME_PLL_CPUCL2,
+	PLL_CON0_PLL_CPUCL2,
+	PLL_CON1_PLL_CPUCL2,
+	PLL_CON3_PLL_CPUCL2,
+	PLL_CON0_MUX_CLKCMU_CPUCL2_CLUSTER_USER,
+	PLL_CON0_MUX_CLKCMU_CPUCL2_SWITCH_USER,
+	CLK_CON_MUX_MUX_CLK_CPUCL2_CLUSTER,
+	CLK_CON_MUX_MUX_CLK_CPUCL2_CORE,
+	CLK_CON_DIV_DIV_CLK_CLUSTER2_ACLK,
+	CLK_CON_DIV_DIV_CLK_CLUSTER2_ATCLK,
+	CLK_CON_DIV_DIV_CLK_CLUSTER2_MPCLK,
+	CLK_CON_DIV_DIV_CLK_CLUSTER2_PCLK,
+	CLK_CON_DIV_DIV_CLK_CLUSTER2_PERIPHCLK,
+	CLK_CON_DIV_DIV_CLK_CPUCL2_NOCP,
+};
+
+/* List of parent clocks for Muxes in CMU_CPUCL2 */
+PNAME(mout_pll_cpucl2_p)		 = { "oscclk", "fout_cpucl2_pll" };
+PNAME(mout_cpucl2_cluster_user_p)	 = { "oscclk", "dout_clkcmu_cpucl2_cluster" };
+PNAME(mout_cpucl2_switch_user_p)	 = { "oscclk", "dout_clkcmu_cpucl2_switch" };
+PNAME(mout_cpucl2_cluster_p)		 = { "oscclk", "mout_cpucl2_cluster_user",
+						"mout_cpucl2_switch_user"};
+PNAME(mout_cpucl2_core_p)		 = { "oscclk", "mout_pll_cpucl2",
+						"mout_cpucl2_switch_user"};
+
+static const struct samsung_pll_clock cpucl2_pll_clks[] __initconst = {
+	/* CMU_CPUCL2_PURECLKCOMP */
+	PLL(pll_531x, CLK_FOUT_CPUCL2_PLL, "fout_cpucl2_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_CPUCL2, PLL_CON3_PLL_CPUCL2, cpu_pll_rates),
+};
+
+static const struct samsung_mux_clock cpucl2_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PLL_CPUCL2, "mout_pll_cpucl2", mout_pll_cpucl2_p,
+	    PLL_CON0_PLL_CPUCL2, 4, 1),
+	MUX(CLK_MOUT_CPUCL2_CLUSTER_USER, "mout_cpucl2_cluster_user", mout_cpucl2_cluster_user_p,
+	    PLL_CON0_MUX_CLKCMU_CPUCL2_CLUSTER_USER, 4, 1),
+	MUX(CLK_MOUT_CPUCL2_SWITCH_USER, "mout_cpucl2_switch_user", mout_cpucl2_switch_user_p,
+	    PLL_CON0_MUX_CLKCMU_CPUCL2_SWITCH_USER, 4, 1),
+	MUX(CLK_MOUT_CPUCL2_CLUSTER, "mout_cpucl2_cluster", mout_cpucl2_cluster_p,
+	    CLK_CON_MUX_MUX_CLK_CPUCL2_CLUSTER, 0, 2),
+	MUX(CLK_MOUT_CPUCL2_CORE, "mout_cpucl2_core", mout_cpucl2_core_p,
+	    CLK_CON_MUX_MUX_CLK_CPUCL2_CORE, 0, 2),
+};
+
+static const struct samsung_div_clock cpucl2_div_clks[] __initconst = {
+	DIV(CLK_DOUT_CLUSTER2_ACLK, "dout_cluster2_aclk",
+	    "mout_cpucl2_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER2_ACLK, 0, 4),
+	DIV(CLK_DOUT_CLUSTER2_ATCLK, "dout_cluster2_atclk",
+	    "mout_cpucl2_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER2_ATCLK, 0, 4),
+	DIV(CLK_DOUT_CLUSTER2_MPCLK, "dout_cluster2_mpclk",
+	    "mout_cpucl2_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER2_MPCLK, 0, 4),
+	DIV(CLK_DOUT_CLUSTER2_PCLK, "dout_cluster2_pclk",
+	    "mout_cpucl2_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER2_PCLK, 0, 4),
+	DIV(CLK_DOUT_CLUSTER2_PERIPHCLK, "dout_cluster2_periphclk",
+	    "mout_cpucl2_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER2_PERIPHCLK, 0, 4),
+	DIV(CLK_DOUT_CPUCL2_NOCP, "dout_cpucl2_nocp",
+	    "mout_cpucl2_cluster", CLK_CON_DIV_DIV_CLK_CPUCL2_NOCP, 0, 4),
+};
+
+static const struct samsung_cmu_info cpucl2_cmu_info __initconst = {
+	.pll_clks		= cpucl2_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(cpucl2_pll_clks),
+	.mux_clks		= cpucl2_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(cpucl2_mux_clks),
+	.div_clks		= cpucl2_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(cpucl2_div_clks),
+	.nr_clk_ids		= CLKS_NR_CPUCL2,
+	.clk_regs		= cpucl2_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(cpucl2_clk_regs),
+	.clk_name		= "cpucl2",
+};
+
+static void __init exynosautov920_cmu_cpucl2_init(struct device_node *np)
+{
+	exynos_arm64_register_cmu(NULL, np, &cpucl2_cmu_info);
+}
+
+/* Register CMU_CPUCL2 early, as CPU clocks should be available ASAP */
+CLK_OF_DECLARE(exynosautov920_cmu_cpucl2, "samsung,exynosautov920-cmu-cpucl2",
+	       exynosautov920_cmu_cpucl2_init);
+
 /* ---- CMU_PERIC0 --------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_PERIC0 (0x10800000) */
-- 
2.49.0


