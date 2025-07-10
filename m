Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C713EC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 00:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSAlpQtg5ip6Mcrd/FgXO/271tDwfaBc24+X/Wtlmes=; b=oHw+MNDBb6kY2GWliBbsnSsy8a
	3XDl+65pIPcUK8We1A3BQTFcDj5GiacSNX5iSsne/ynWnj3Ojhc8EahcpPScs5pbfYhcajYwS7Sr4
	Fc/CJGALW5UjHzImN767ecNj8NgMLDwafyt+qnuNnODbDEI54hgBTtmGgznZjjelrOEwuOrezxsWA
	qqRNnRkSHevI6+1wceeldmlsQ2wrjaCr/PH9U1DaNOMXt+ayaDHFXJqJIi7ytFGYwWgENznSE9cQJ
	jS1AmJiMy+4Jr0tYX/KtdAL7f1Yknk8ctg/bllnnCjl3VIqVHVCZjusNgzv65R1+8wc1LR9kGUiex
	of0GWb8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZfPa-0000000AMHB-3PAN;
	Thu, 10 Jul 2025 00:45:18 +0000
Received: from mail2.coasia.com ([112.168.119.159] helo=spam.coasia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZf24-0000000AJMU-2Wp1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 00:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1752106858; bh=I3gMaKVjatpxTEc20thzK2HEjVPobuIRzNSHDsOU4XM=;
	l=5198; h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=dlQoxCJYvaU9NzuZeyM3wwau9fVyB2T9Ly5FRqprW5njzY/1lnXe6XM+rCrTQIHrf
	 3ts7QG+gBCQXuVa+fP8c2BeS7YvONZGT0wpY9xkGsTikX8FGdVvqgm0ufZQnZUnCZT
	 fIEwoYcWVDWGHfyUZFvRkSGs2QrsAvTVZHq9ysLA=
Received: from unknown (HELO kangseongu..) (ksk4725@coasia.com@115.23.218.194)
	by 192.168.10.159 with ESMTP; 10 Jul 2025 09:20:58 +0900
X-Original-SENDERIP: 115.23.218.194
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: ksk4725@coasia.com
X-Original-RCPTTO: jesper.nilsson@axis.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	linus.walleij@linaro.org,
	tomasz.figa@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	ravi.patel@samsung.com,
	ksk4725@coasia.com,
	smn1196@coasia.com,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
	hgkim05@coasia.com,
	mingyoungbo@coasia.com,
	pankaj.dubey@samsung.com,
	shradha.t@samsung.com,
	inbaraj.e@samsung.com,
	swathi.ks@samsung.com,
	hrishikesh.d@samsung.com,
	dj76.yang@samsung.com,
	hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev,
	v.pavani@samsung.com
From: ksk4725@coasia.com
To: Jesper Nilsson <jesper.nilsson@axis.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ravi Patel <ravi.patel@samsung.com>,
	SeonGu Kang <ksk4725@coasia.com>,
	SungMin Park <smn1196@coasia.com>
Cc: kenkim <kenkim@coasia.com>,
	Jongshin Park <pjsin865@coasia.com>,
	GunWoo Kim <gwk1013@coasia.com>,
	HaGyeong Kim <hgkim05@coasia.com>,
	GyoungBo Min <mingyoungbo@coasia.com>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Shradha Todi <shradha.t@samsung.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Hrishikesh <hrishikesh.d@samsung.com>,
	Dongjin Yang <dj76.yang@samsung.com>,
	Sang Min Kim <hypmean.kim@samsung.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev,
	Varada Pavani <v.pavani@samsung.com>
Subject: [PATCH 08/16] clk: samsung: artpec-8: Add clock support for CMU_CPUCL block
Date: Thu, 10 Jul 2025 09:20:38 +0900
Message-Id: <20250710002047.1573841-9-ksk4725@coasia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710002047.1573841-1-ksk4725@coasia.com>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_172100_890995_AE4F3134 
X-CRM114-Status: GOOD (  11.79  )
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

From: Hakyeong Kim <hgkim05@coasia.com>

Add clock support for below CMU block in ARTPEC-8 SoC.
 - CMU_CPUCL

Signed-off-by: Varada Pavani <v.pavani@samsung.com>
Signed-off-by: Hakyeong Kim <hgkim05@coasia.com>
---
 drivers/clk/samsung/clk-artpec8.c | 99 +++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/drivers/clk/samsung/clk-artpec8.c b/drivers/clk/samsung/clk-artpec8.c
index f41b7941c630..15c90fe29308 100644
--- a/drivers/clk/samsung/clk-artpec8.c
+++ b/drivers/clk/samsung/clk-artpec8.c
@@ -17,6 +17,7 @@
 #define CMU_CMU_NR_CLK			(DOUT_CLKCMU_VPP_CORE + 1)
 #define CMU_BUS_NR_CLK			(DOUT_CLK_BUS_PCLK + 1)
 #define CMU_CORE_NR_CLK			(DOUT_CLK_CORE_PCLK + 1)
+#define CMU_CPUCL_NR_CLK		(DOUT_CLK_CPUCL_PCLKDBG + 1)
 #define CMU_IMEM_NR_CLK			(MOUT_IMEM_JPEG_USER + 1)
 
 /* register offset definitions for cmu_cmu (0x12400000) */
@@ -521,6 +522,104 @@ static void __init artpec8_clk_cmu_core_init(struct device_node *np)
 CLK_OF_DECLARE(artpec8_clk_cmu_core, "axis,artpec8-cmu-core",
 	       artpec8_clk_cmu_core_init);
 
+/* Register Offset definitions for CMU_CPUCL (0x11410000) */
+#define PLL_LOCKTIME_PLL_CPUCL				0x0000
+#define PLL_CON0_MUX_CLKCMU_CPUCL_SWITCH_USER		0x0120
+#define PLL_CON0_PLL_CPUCL				0x0140
+#define MUX_CLK_CPUCL_PLL				0x1000
+#define DIV_CLK_CLUSTER_ACLK				0x1800
+#define DIV_CLK_CLUSTER_CNTCLK				0x1804
+#define DIV_CLK_CLUSTER_PCLKDBG				0x1808
+#define DIV_CLK_CPUCL_CMUREF				0x180c
+#define DIV_CLK_CPUCL_PCLK				0x1814
+#define DIV_CLK_CLUSTER_ATCLK				0x1818
+#define DIV_CLK_CPUCL_DBG				0x181c
+#define DIV_CLK_CPUCL_PCLKDBG				0x1820
+
+static const unsigned long cmu_cpucl_clk_regs[] __initconst = {
+	PLL_LOCKTIME_PLL_CPUCL,
+	PLL_CON0_MUX_CLKCMU_CPUCL_SWITCH_USER,
+	PLL_CON0_PLL_CPUCL,
+	MUX_CLK_CPUCL_PLL,
+	DIV_CLK_CLUSTER_ACLK,
+	DIV_CLK_CLUSTER_CNTCLK,
+	DIV_CLK_CLUSTER_PCLKDBG,
+	DIV_CLK_CPUCL_CMUREF,
+	DIV_CLK_CPUCL_PCLK,
+	DIV_CLK_CLUSTER_ATCLK,
+	DIV_CLK_CPUCL_DBG,
+	DIV_CLK_CPUCL_PCLKDBG,
+};
+
+static const struct samsung_pll_clock cmu_cpucl_pll_clks[] __initconst = {
+	PLL(pll_1017x, PLL_CPUCL, "fout_pll_cpucl", "fin_pll",
+	    PLL_LOCKTIME_PLL_CPUCL, PLL_CON0_PLL_CPUCL, NULL),
+};
+
+PNAME(mout_clkcmu_cpucl_switch_user_p) = {
+	"fin_pll", "dout_clkcmu_cpucl_switch" };
+PNAME(mout_pll_cpucl_p) = {
+	"fin_pll", "fout_pll_cpucl" };
+PNAME(mout_clk_cpucl_pll_p) = {
+	"mout_pll_cpucl", "mout_clkcmu_cpucl_switch_user" };
+
+static const struct samsung_mux_clock cmu_cpucl_mux_clks[] __initconst = {
+	MUX_F(0, "mout_pll_cpucl", mout_pll_cpucl_p,
+	      PLL_CON0_PLL_CPUCL, 4, 1,
+	      CLK_SET_RATE_PARENT | CLK_RECALC_NEW_RATES, 0),
+	MUX(MOUT_CLKCMU_CPUCL_SWITCH_USER, "mout_clkcmu_cpucl_switch_user",
+	    mout_clkcmu_cpucl_switch_user_p,
+	    PLL_CON0_MUX_CLKCMU_CPUCL_SWITCH_USER, 4, 1),
+	MUX_F(MOUT_CLK_CPUCL_PLL, "mout_clk_cpucl_pll", mout_clk_cpucl_pll_p,
+	      MUX_CLK_CPUCL_PLL, 0, 1, CLK_SET_RATE_PARENT, 0),
+};
+
+static const struct samsung_fixed_factor_clock cpucl_ffactor_clks[] __initconst = {
+	FFACTOR(DOUT_CLK_CPUCL_CPU, "dout_clk_cpucl_cpu",
+		"mout_clk_cpucl_pll", 1, 1, CLK_SET_RATE_PARENT),
+};
+
+static const struct samsung_div_clock cmu_cpucl_div_clks[] __initconst = {
+	DIV(DOUT_CLK_CLUSTER_ACLK, "dout_clk_cluster_aclk",
+	    "dout_clk_cpucl_cpu", DIV_CLK_CLUSTER_ACLK, 0, 4),
+	DIV(DOUT_CLK_CLUSTER_PCLKDBG, "dout_clk_cluster_pclkdbg",
+	    "dout_clk_cpucl_cpu", DIV_CLK_CLUSTER_PCLKDBG, 0, 4),
+	DIV(DOUT_CLK_CLUSTER_CNTCLK, "dout_clk_cluster_cntclk",
+	    "dout_clk_cpucl_cpu", DIV_CLK_CLUSTER_CNTCLK, 0, 4),
+	DIV(DOUT_CLK_CLUSTER_ATCLK, "dout_clk_cluster_atclk",
+	    "dout_clk_cpucl_cpu", DIV_CLK_CLUSTER_ATCLK, 0, 4),
+	DIV(DOUT_CLK_CPUCL_PCLK, "dout_clk_cpucl_pclk",
+	    "dout_clk_cpucl_cpu", DIV_CLK_CPUCL_PCLK, 0, 4),
+	DIV(DOUT_CLK_CPUCL_CMUREF, "dout_clk_cpucl_cmuref",
+	    "dout_clk_cpucl_cpu", DIV_CLK_CPUCL_CMUREF, 0, 3),
+	DIV(DOUT_CLK_CPUCL_DBG, "dout_clk_cpucl_dbg",
+	    "dout_clk_cpucl_cpu", DIV_CLK_CPUCL_DBG, 0, 4),
+	DIV(DOUT_CLK_CPUCL_PCLKDBG, "dout_clk_cpucl_pclkdbg",
+	    "dout_clk_cpucl_dbg", DIV_CLK_CPUCL_PCLKDBG, 0, 4),
+};
+
+static const struct samsung_cmu_info cmu_cpucl_info __initconst = {
+	.pll_clks		= cmu_cpucl_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(cmu_cpucl_pll_clks),
+	.fixed_factor_clks	= cpucl_ffactor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(cpucl_ffactor_clks),
+	.mux_clks		= cmu_cpucl_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(cmu_cpucl_mux_clks),
+	.div_clks		= cmu_cpucl_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(cmu_cpucl_div_clks),
+	.nr_clk_ids		= CMU_CPUCL_NR_CLK,
+	.clk_regs		= cmu_cpucl_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(cmu_cpucl_clk_regs),
+};
+
+static void __init artpec8_clk_cmu_cpucl_init(struct device_node *np)
+{
+	samsung_cmu_register_one(np, &cmu_cpucl_info);
+}
+
+CLK_OF_DECLARE(artpec8_clk_cmu_cpucl, "axis,artpec8-cmu-cpucl",
+	       artpec8_clk_cmu_cpucl_init);
+
 /* Register Offset definitions for CMU_IMEM (0x10010000) */
 #define PLL_CON0_MUX_CLK_IMEM_ACLK_USER			0x0100
 #define PLL_CON0_MUX_CLK_IMEM_JPEG_USER			0x0120
-- 
2.34.1


