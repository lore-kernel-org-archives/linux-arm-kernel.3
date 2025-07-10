Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC076C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 00:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LgW6/0kR/wDExzAZyhG5yziYpx28khJWlW6qwZuzp1Y=; b=yV/baQaDNwjmLpWKMlB5hMRkEl
	LuLcb1pe+co6rEmMbTVsr7C5uBD7Jsb5YR/q0mNmDQrPrr+dHxXECBIkmHcKzNgHdTMJrl2sFgj7v
	sewEyR0rK8JU4MUGLujPfc3w2fSan8f1SE9CsizWu7yeyRtlL+mDCCvYFrezooBJLT7M7pcAubI5M
	8PECCrvIoCcSVk9QBJ0lDNbFx8BZmQkntdaGsnGVGJPYA5M7kxGxV/+zwmgD8TK5740TVXcDxWWD1
	UN9EV+E+42Rl5HQizGBgxfRRlwyp7EyjRO/inzm67gU9+g2/kOZtPWVemOpXUtQJF6IHAzIAwSWKy
	5Smw1cFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZfRt-0000000AMXQ-1yNt;
	Thu, 10 Jul 2025 00:47:41 +0000
Received: from mail2.coasia.com ([112.168.119.159] helo=spam.coasia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZf25-0000000AJN7-2MiI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 00:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1752106859; bh=tipNFC8X7ZjJwIsy/28H95TjOdSgc7hIrcyILBXQBmQ=;
	l=6929; h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=CPtnQb9oHq2qahM6LsvUhJpM9HDSamXWML7vGkg9WA5YdbrOxPjlGTkrtjruRHhi8
	 qgixWUQXvnCs7oVoK3p8XAby30RGGPCTlDvpG9xFd4QENaN+yEaECj5rCLsNyFG402
	 75FCL1zmSyikZm4qYUBklXclgs7w+Kwn0ebAlVc8=
Received: from unknown (HELO kangseongu..) (ksk4725@coasia.com@115.23.218.194)
	by 192.168.10.159 with ESMTP; 10 Jul 2025 09:20:59 +0900
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
Subject: [PATCH 09/16] clk: samsung: artpec-8: Add clock support for CMU_FSYS block
Date: Thu, 10 Jul 2025 09:20:39 +0900
Message-Id: <20250710002047.1573841-10-ksk4725@coasia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710002047.1573841-1-ksk4725@coasia.com>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_172101_969565_4A490235 
X-CRM114-Status: GOOD (  11.57  )
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
 - CMU_FSYS

Signed-off-by: Varada Pavani <v.pavani@samsung.com>
Signed-off-by: Hakyeong Kim <hgkim05@coasia.com>
---
 drivers/clk/samsung/clk-artpec8.c | 134 ++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/drivers/clk/samsung/clk-artpec8.c b/drivers/clk/samsung/clk-artpec8.c
index 15c90fe29308..7ccec4ff8f70 100644
--- a/drivers/clk/samsung/clk-artpec8.c
+++ b/drivers/clk/samsung/clk-artpec8.c
@@ -18,6 +18,7 @@
 #define CMU_BUS_NR_CLK			(DOUT_CLK_BUS_PCLK + 1)
 #define CMU_CORE_NR_CLK			(DOUT_CLK_CORE_PCLK + 1)
 #define CMU_CPUCL_NR_CLK		(DOUT_CLK_CPUCL_PCLKDBG + 1)
+#define CMU_FSYS_NR_CLK			(DOUT_SCAN_CLK_FSYS_MMC + 1)
 #define CMU_IMEM_NR_CLK			(MOUT_IMEM_JPEG_USER + 1)
 
 /* register offset definitions for cmu_cmu (0x12400000) */
@@ -620,6 +621,139 @@ static void __init artpec8_clk_cmu_cpucl_init(struct device_node *np)
 CLK_OF_DECLARE(artpec8_clk_cmu_cpucl, "axis,artpec8-cmu-cpucl",
 	       artpec8_clk_cmu_cpucl_init);
 
+/* Register Offset definitions for CMU_FSYS (0x16c10000) */
+#define PLL_LOCKTIME_PLL_FSYS				0x0004
+#define PLL_CON0_MUX_CLK_FSYS_BUS_USER			0x0120
+#define PLL_CON0_MUX_CLK_FSYS_MMC_USER			0x0140
+#define PLL_CON0_MUX_CLK_FSYS_SCAN0_USER		0x0160
+#define PLL_CON0_MUX_CLK_FSYS_SCAN1_USER		0x0180
+#define PLL_CON0_PLL_FSYS				0x01c0
+#define DIV_CLK_FSYS_ADC				0x1804
+#define DIV_CLK_FSYS_BUS300				0x1808
+#define DIV_CLK_FSYS_BUS_QSPI				0x180c
+#define DIV_CLK_FSYS_EQOS_25				0x1810
+#define DIV_CLK_FSYS_EQOS_2P5				0x1814
+#define DIV_CLK_FSYS_EQOS_500				0x1818
+#define DIV_CLK_FSYS_EQOS_INT125			0x181c
+#define DIV_CLK_FSYS_MMC_CARD0				0x1820
+#define DIV_CLK_FSYS_MMC_CARD1				0x1824
+#define DIV_CLK_FSYS_OTP_MEM				0x1828
+#define DIV_CLK_FSYS_PCIE_PHY_REFCLK_SYSPLL		0x182c
+#define DIV_CLK_FSYS_QSPI				0x1830
+#define DIV_CLK_FSYS_SCLK_UART				0x1834
+#define DIV_CLK_FSYS_SFMC_NAND				0x1838
+#define DIV_SCAN_CLK_FSYS_125				0x183c
+#define DIV_SCAN_CLK_FSYS_MMC				0x1840
+#define DIV_SCAN_CLK_FSYS_PCIE_PIPE			0x1844
+
+static const unsigned long cmu_fsys_clk_regs[] __initconst = {
+	PLL_LOCKTIME_PLL_FSYS,
+	PLL_CON0_MUX_CLK_FSYS_BUS_USER,
+	PLL_CON0_MUX_CLK_FSYS_MMC_USER,
+	PLL_CON0_MUX_CLK_FSYS_SCAN0_USER,
+	PLL_CON0_MUX_CLK_FSYS_SCAN1_USER,
+	PLL_CON0_PLL_FSYS,
+	DIV_CLK_FSYS_ADC,
+	DIV_CLK_FSYS_BUS300,
+	DIV_CLK_FSYS_BUS_QSPI,
+	DIV_CLK_FSYS_EQOS_25,
+	DIV_CLK_FSYS_EQOS_2P5,
+	DIV_CLK_FSYS_EQOS_500,
+	DIV_CLK_FSYS_EQOS_INT125,
+	DIV_CLK_FSYS_MMC_CARD0,
+	DIV_CLK_FSYS_MMC_CARD1,
+	DIV_CLK_FSYS_OTP_MEM,
+	DIV_CLK_FSYS_PCIE_PHY_REFCLK_SYSPLL,
+	DIV_CLK_FSYS_QSPI,
+	DIV_CLK_FSYS_SCLK_UART,
+	DIV_CLK_FSYS_SFMC_NAND,
+	DIV_SCAN_CLK_FSYS_125,
+	DIV_SCAN_CLK_FSYS_MMC,
+	DIV_SCAN_CLK_FSYS_PCIE_PIPE,
+};
+
+static const struct samsung_pll_clock cmu_fsys_pll_clks[] __initconst = {
+	PLL(pll_1017x, PLL_FSYS, "fout_pll_fsys", "fin_pll",
+	    PLL_LOCKTIME_PLL_FSYS, PLL_CON0_PLL_FSYS, NULL),
+};
+
+PNAME(mout_fsys_scan0_user_p) = { "fin_pll", "dout_clkcmu_fsys_scan0" };
+PNAME(mout_fsys_scan1_user_p) = { "fin_pll", "dout_clkcmu_fsys_scan1" };
+PNAME(mout_fsys_bus_user_p) = { "fin_pll", "dout_clkcmu_fsys_bus" };
+PNAME(mout_fsys_mmc_user_p) = { "fin_pll", "dout_clkcmu_fsys_ip" };
+PNAME(mout_fsys_pll_fsys_p) = { "fin_pll", "fout_pll_fsys" };
+
+static const struct samsung_mux_clock cmu_fsys_mux_clks[] __initconst = {
+	MUX(0, "mout_clk_pll_fsys", mout_fsys_pll_fsys_p, PLL_CON0_PLL_FSYS, 4, 1),
+	MUX(MOUT_FSYS_SCAN0_USER, "mout_fsys_scan0_user",
+	    mout_fsys_scan0_user_p, PLL_CON0_MUX_CLK_FSYS_SCAN0_USER, 4, 1),
+	MUX(MOUT_FSYS_SCAN1_USER, "mout_fsys_scan1_user",
+	    mout_fsys_scan1_user_p, PLL_CON0_MUX_CLK_FSYS_SCAN1_USER, 4, 1),
+	MUX(MOUT_FSYS_BUS_USER, "mout_fsys_bus_user",
+	    mout_fsys_bus_user_p, PLL_CON0_MUX_CLK_FSYS_BUS_USER, 4, 1),
+	MUX(MOUT_FSYS_MMC_USER, "mout_fsys_mmc_user",
+	    mout_fsys_mmc_user_p, PLL_CON0_MUX_CLK_FSYS_MMC_USER, 4, 1),
+};
+
+static const struct samsung_div_clock cmu_fsys_div_clks[] __initconst = {
+	DIV(DOUT_FSYS_PCIE_PIPE, "dout_fsys_pcie_pipe", "mout_clk_pll_fsys",
+	    DIV_SCAN_CLK_FSYS_PCIE_PIPE, 0, 4),
+	DIV(DOUT_FSYS_ADC, "dout_fsys_adc", "mout_clk_pll_fsys",
+	    DIV_CLK_FSYS_ADC, 0, 7),
+	DIV(DOUT_FSYS_PCIE_PHY_REFCLK_SYSPLL,
+	    "dout_fsys_pcie_phy_refclk_syspll", "mout_clk_pll_fsys",
+	    DIV_CLK_FSYS_PCIE_PHY_REFCLK_SYSPLL, 0, 8),
+	DIV(DOUT_FSYS_QSPI, "dout_fsys_qspi", "mout_fsys_mmc_user",
+	    DIV_CLK_FSYS_QSPI, 0, 4),
+	DIV(DOUT_FSYS_EQOS_INT125, "dout_fsys_eqos_int125", "mout_clk_pll_fsys",
+	    DIV_CLK_FSYS_EQOS_INT125, 0, 4),
+	DIV(DOUT_FSYS_OTP_MEM, "dout_fsys_otp_mem", "fin_pll",
+	    DIV_CLK_FSYS_OTP_MEM, 0, 9),
+	DIV(DOUT_FSYS_SCLK_UART, "dout_fsys_sclk_uart", "mout_clk_pll_fsys",
+	    DIV_CLK_FSYS_SCLK_UART, 0, 10),
+	DIV(DOUT_FSYS_SFMC_NAND, "dout_fsys_sfmc_nand", "mout_fsys_mmc_user",
+	    DIV_CLK_FSYS_SFMC_NAND, 0, 4),
+	DIV(DOUT_SCAN_CLK_FSYS_125,
+	    "dout_scan_clk_fsys_125", "mout_clk_pll_fsys",
+	    DIV_SCAN_CLK_FSYS_125, 0, 4),
+	DIV(DOUT_SCAN_CLK_FSYS_MMC, "dout_scan_clk_fsys_mmc", "fout_pll_fsys",
+	    DIV_SCAN_CLK_FSYS_MMC, 0, 4),
+	DIV(DOUT_FSYS_EQOS_25, "dout_fsys_eqos_25", "dout_fsys_eqos_int125",
+	    DIV_CLK_FSYS_EQOS_25, 0, 4),
+	DIV_F(DOUT_FSYS_EQOS_2p5, "dout_fsys_eqos_2p5", "dout_fsys_eqos_25",
+	      DIV_CLK_FSYS_EQOS_2P5, 0, 4, CLK_SET_RATE_PARENT, 0),
+	DIV(0, "dout_fsys_eqos_500", "mout_clk_pll_fsys",
+	    DIV_CLK_FSYS_EQOS_500, 0, 4),
+	DIV(DOUT_FSYS_BUS300, "dout_fsys_bus300", "mout_fsys_bus_user",
+	    DIV_CLK_FSYS_BUS300, 0, 4),
+	DIV(DOUT_FSYS_BUS_QSPI, "dout_fsys_bus_qspi", "mout_fsys_mmc_user",
+	    DIV_CLK_FSYS_BUS_QSPI, 0, 4),
+	DIV(DOUT_FSYS_MMC_CARD0, "dout_fsys_mmc_card0", "mout_fsys_mmc_user",
+	    DIV_CLK_FSYS_MMC_CARD0, 0, 10),
+	DIV(DOUT_FSYS_MMC_CARD1, "dout_fsys_mmc_card1", "mout_fsys_mmc_user",
+	    DIV_CLK_FSYS_MMC_CARD1, 0, 10),
+};
+
+static const struct samsung_cmu_info cmu_fsys_info __initconst = {
+	.pll_clks		= cmu_fsys_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(cmu_fsys_pll_clks),
+	.mux_clks		= cmu_fsys_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(cmu_fsys_mux_clks),
+	.div_clks		= cmu_fsys_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(cmu_fsys_div_clks),
+	.nr_clk_ids		= CMU_FSYS_NR_CLK,
+	.clk_regs		= cmu_fsys_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(cmu_fsys_clk_regs),
+};
+
+static void __init artpec8_clk_cmu_fsys_init(struct device_node *np)
+{
+	samsung_cmu_register_one(np, &cmu_fsys_info);
+}
+
+CLK_OF_DECLARE(artpec8_clk_cmu_fsys, "axis,artpec8-cmu-fsys",
+	       artpec8_clk_cmu_fsys_init);
+
 /* Register Offset definitions for CMU_IMEM (0x10010000) */
 #define PLL_CON0_MUX_CLK_IMEM_ACLK_USER			0x0100
 #define PLL_CON0_MUX_CLK_IMEM_JPEG_USER			0x0120
-- 
2.34.1


