Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B58E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 20:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9/wY8b3mdmN2zCij5++ibn+vpceK8XV3LHzciZCwO0=; b=MuIPggTcFYKPNU+f4foXU8QKww
	LFzHwlttFIHbNChdh0n1pBySNmisk1tTRmSKzDziR51cK7yiFyxx4Ttp72chg5Nfpn1g1z9kjm4Qv
	6SQecYD+/SSfRxAxh8G/2kbLozsWEkh32XOUxQekszm3ey6XDDaPRxCFx8YBeFyjENh8sNMrKlPtg
	xoyz9I51JmtdfdqcsX9YrOMbfL81p1GfqupoAtE2Xorak54fB+IHmPOaeMxoTCvf2a4yGOUI6UDcM
	4GPdWz+YzF73Yw3ZNZs/70OULY5Gxa3oktm0Ew4pI0tuP+61k7aRRkuRJPdB3KgS/jH+6MrKmS6d9
	uWy6bD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUATt-0000000FVYC-3iru;
	Sat, 04 Jan 2025 20:10:45 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUAQU-0000000FV4W-3JIa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 20:07:15 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=Lj7C7datwbxMKOzTXhXO/oYf3Cs5jPZ5HYRLe6U9kzsJ/KS9P5hJw9eS5z+YeqWQmg+k2jShRNgqCFE7xRxsBKoYvj8demDbJ+diwYpjPrUt08vNHTnQJbU1ajQce+h7ZMlD9NxPtUH84GC1fuBYq8gfSBnYU6BG1RS2OLcy7sVnB18kSgAvWCHUKFFgxDNwrTj3x96d6NtD0CZJC4naKNeiT+PkoG2JqR5jj5otUx/OeNerBzFAxwsLGCJJqx9T4q2ll00lgoXneu01OUQOytqq80ZGceX5Jcejwt2VFnxfEvveJ4kecDZ+uXiKtbFt4/EWcSJxOaBy7DnSO/9Wqg==; s=purelymail3; d=purelymail.com; v=1; bh=asuc2fOVXebfJXE2z03+8hnOFP8k71tvUgxEg5/jiIQ=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1683504375;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 04 Jan 2025 20:06:30 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sat, 04 Jan 2025 21:05:57 +0100
Subject: [PATCH 2/2] clk: samsung: exynos990: Add CMU_PERIS block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250104-exynos990-cmu-v1-2-9f54d69286d6@mentallysanemainliners.org>
References: <20250104-exynos990-cmu-v1-0-9f54d69286d6@mentallysanemainliners.org>
In-Reply-To: <20250104-exynos990-cmu-v1-0-9f54d69286d6@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736021184; l=10685;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=asuc2fOVXebfJXE2z03+8hnOFP8k71tvUgxEg5/jiIQ=;
 b=+Ab0zfFi2o9oss/z4XovCvkActiYfaMvz6JE2AZ+OhoUauOIIkmjDwo8zALolpLDjyrkymady
 h2PODgc5dssB14H4DU2HHE3AemkPoZGd8EOkLgemS/YDODFZpQZekit
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_120714_906304_A7F7B7E9 
X-CRM114-Status: GOOD (  14.07  )
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

The CMU_PERIS block is used for clocking the MCT, and has one dependency
clock from CMU_TOP. As the MCT is initialized early, this CMU is also
registered early.

While at it, make the parent clock list comment spaced out correctly,
and add it to the HSI0 block.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 drivers/clk/samsung/clk-exynos990.c | 180 +++++++++++++++++++++++++++++++++++-
 1 file changed, 179 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 8e2a2e8eccee36dd7d4bc7099af2672d222f4abe..76f22a4a4631fadf400420b977f3f59f40f840c7 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -19,6 +19,7 @@
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR_TOP (CLK_GOUT_CMU_VRA_BUS + 1)
 #define CLKS_NR_HSI0 (CLK_GOUT_HSI0_XIU_D_HSI0_ACLK + 1)
+#define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
@@ -449,7 +450,7 @@ static const struct samsung_pll_clock top_pll_clks[] __initconst = {
 	    PLL_LOCKTIME_PLL_G3D, PLL_CON3_PLL_G3D, NULL),
 };
 
-/* Parent clock list for CMU_TOP muxes*/
+/* Parent clock list for CMU_TOP muxes */
 PNAME(mout_pll_shared0_p)		= { "oscclk", "fout_shared0_pll" };
 PNAME(mout_pll_shared1_p)		= { "oscclk", "fout_shared1_pll" };
 PNAME(mout_pll_shared2_p)		= { "oscclk", "fout_shared2_pll" };
@@ -1192,6 +1193,7 @@ static const unsigned long hsi0_clk_regs[] __initconst = {
 	CLK_CON_GAT_GOUT_BLK_HSI0_UID_XIU_D_HSI0_IPCLKPORT_ACLK,
 };
 
+/* Parent clock list for CMU_HSI0 muxes */
 PNAME(mout_hsi0_bus_user_p)		= { "oscclk", "dout_cmu_hsi0_bus" };
 PNAME(mout_hsi0_usb31drd_user_p)	= { "oscclk", "dout_cmu_hsi0_usb31drd" };
 PNAME(mout_hsi0_usbdp_debug_user_p)	= { "oscclk",
@@ -1305,6 +1307,182 @@ static const struct samsung_cmu_info hsi0_cmu_info __initconst = {
 	.clk_name		= "bus",
 };
 
+/* ---- CMU_PERIS ----------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_PERIS (0x10020000) */
+#define PLL_CON0_MUX_CLKCMU_PERIS_BUS_USER					0x0600
+#define PLL_CON1_MUX_CLKCMU_PERIS_BUS_USER					0x0604
+#define CLK_CON_MUX_MUX_CLK_PERIS_GIC						0x1000
+#define CLK_CON_GAT_GOUT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK		0x203c
+#define CLK_CON_GAT_GOUT_BLK_PERIS_UID_WDT_CLUSTER2_IPCLKPORT_PCLK		0x204c
+#define CLK_CON_GAT_GOUT_BLK_PERIS_UID_WDT_CLUSTER0_IPCLKPORT_PCLK		0x2048
+#define CLK_CON_GAT_CLK_BLK_PERIS_UID_PERIS_CMU_PERIS_IPCLKPORT_PCLK		0x200c
+#define CLK_CON_GAT_GOUT_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_BUSP_IPCLKPORT_CLK	0x2034
+#define CLK_CON_GAT_CLK_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_OSCCLK_IPCLKPORT_CLK	0x2010
+#define CLK_CON_GAT_GOUT_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_GIC_IPCLKPORT_CLK	0x2038
+#define CLK_CON_GAT_GOUT_BLK_PERIS_UID_AD_AXI_P_PERIS_IPCLKPORT_ACLKM		0x2014
+#define CLK_CON_GAT_GOUT_BLK_PERIS_UID_OTP_CON_BIRA_IPCLKPORT_PCLK		0x2028
+#define CLK_CON_GAT_GOUT_BLK_PERIS_UID_GIC_IPCLKPORT_CLK			0x201c
+#define CLK_CON_GAT_GOUT_BLK_PERIS_UID_LHM_AXI_P_PERIS_IPCLKPORT_I_CLK		0x2020
+#define CLK_CON_GAT_GOUT_BLK_PERIS_UID_MCT_IPCLKPORT_PCLK			0x2024
+#define CLK_CON_GAT_GOUT_BLK_PERIS_UID_OTP_CON_TOP_IPCLKPORT_PCLK		0x2030
+#define CLK_CON_GAT_GOUT_BLK_PERIS_UID_D_TZPC_PERIS_IPCLKPORT_PCLK		0x2018
+#define CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_SUB_IPCLKPORT_PCLK			0x2040
+#define CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_TOP_IPCLKPORT_PCLK			0x2044
+#define CLK_CON_GAT_CLK_BLK_PERIS_UID_OTP_CON_BIRA_IPCLKPORT_I_OSCCLK		0x2000
+#define CLK_CON_GAT_CLK_BLK_PERIS_UID_OTP_CON_TOP_IPCLKPORT_I_OSCCLK		0x2008
+#define QCH_CON_D_TZPC_PERIS_QCH						0x3004
+#define QCH_CON_GIC_QCH								0x3008
+#define QCH_CON_LHM_AXI_P_PERIS_QCH						0x300c
+#define QCH_CON_MCT_QCH								0x3010
+#define QCH_CON_OTP_CON_BIRA_QCH						0x3014
+#define QCH_CON_OTP_CON_TOP_QCH							0x301c
+#define QCH_CON_PERIS_CMU_PERIS_QCH						0x3020
+#define QCH_CON_SYSREG_PERIS_QCH						0x3024
+#define QCH_CON_TMU_SUB_QCH							0x3028
+#define QCH_CON_TMU_TOP_QCH							0x302c
+#define QCH_CON_WDT_CLUSTER0_QCH						0x3030
+#define QCH_CON_WDT_CLUSTER2_QCH						0x3034
+
+static const unsigned long peris_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_PERIS_BUS_USER,
+	PLL_CON1_MUX_CLKCMU_PERIS_BUS_USER,
+	CLK_CON_MUX_MUX_CLK_PERIS_GIC,
+	CLK_CON_GAT_GOUT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIS_UID_WDT_CLUSTER2_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIS_UID_WDT_CLUSTER0_IPCLKPORT_PCLK,
+	CLK_CON_GAT_CLK_BLK_PERIS_UID_PERIS_CMU_PERIS_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_BUSP_IPCLKPORT_CLK,
+	CLK_CON_GAT_CLK_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_OSCCLK_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_GIC_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIS_UID_AD_AXI_P_PERIS_IPCLKPORT_ACLKM,
+	CLK_CON_GAT_GOUT_BLK_PERIS_UID_OTP_CON_BIRA_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIS_UID_GIC_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIS_UID_LHM_AXI_P_PERIS_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_PERIS_UID_MCT_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIS_UID_OTP_CON_TOP_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIS_UID_D_TZPC_PERIS_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_SUB_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_TOP_IPCLKPORT_PCLK,
+	CLK_CON_GAT_CLK_BLK_PERIS_UID_OTP_CON_BIRA_IPCLKPORT_I_OSCCLK,
+	CLK_CON_GAT_CLK_BLK_PERIS_UID_OTP_CON_TOP_IPCLKPORT_I_OSCCLK,
+	QCH_CON_D_TZPC_PERIS_QCH,
+	QCH_CON_GIC_QCH,
+	QCH_CON_LHM_AXI_P_PERIS_QCH,
+	QCH_CON_MCT_QCH,
+	QCH_CON_OTP_CON_BIRA_QCH,
+	QCH_CON_OTP_CON_TOP_QCH,
+	QCH_CON_PERIS_CMU_PERIS_QCH,
+	QCH_CON_SYSREG_PERIS_QCH,
+	QCH_CON_TMU_SUB_QCH,
+	QCH_CON_TMU_TOP_QCH,
+	QCH_CON_WDT_CLUSTER0_QCH,
+	QCH_CON_WDT_CLUSTER2_QCH,
+};
+
+/* Parent clock list for CMU_PERIS muxes */
+PNAME(mout_peris_bus_user_p)		= { "oscclk", "mout_cmu_peris_bus" };
+PNAME(mout_peris_clk_peris_gic_p)	= { "oscclk", "mout_peris_bus_user" };
+
+static const struct samsung_mux_clock peris_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PERIS_BUS_USER, "mout_peris_bus_user",
+	    mout_peris_bus_user_p, PLL_CON0_MUX_CLKCMU_PERIS_BUS_USER,
+	    4, 1),
+	MUX(CLK_MOUT_PERIS_CLK_PERIS_GIC, "mout_peris_clk_peris_gic",
+	    mout_peris_clk_peris_gic_p, CLK_CON_MUX_MUX_CLK_PERIS_GIC,
+	    4, 1),
+};
+
+static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_PERIS_SYSREG_PERIS_PCLK,
+	     "gout_peris_sysreg_peris_pclk", "mout_peris_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIS_WDT_CLUSTER2_PCLK,
+	     "gout_peris_wdt_cluster2_pclk", "mout_peris_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_WDT_CLUSTER2_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIS_WDT_CLUSTER0_PCLK,
+	     "gout_peris_wdt_cluster0_pclk", "mout_peris_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_WDT_CLUSTER0_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_CLK_PERIS_PERIS_CMU_PERIS_PCLK,
+	     "clk_peris_peris_cmu_peris_pclk", "mout_peris_bus_user",
+	     CLK_CON_GAT_CLK_BLK_PERIS_UID_PERIS_CMU_PERIS_IPCLKPORT_PCLK,
+	     21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_PERIS_CLK_PERIS_BUSP_CLK,
+	     "gout_peris_clk_peris_busp_clk", "mout_peris_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_BUSP_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIS_CLK_PERIS_OSCCLK_CLK,
+	     "gout_peris_clk_peris_oscclk_clk", "mout_peris_bus_user",
+	     CLK_CON_GAT_CLK_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_OSCCLK_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIS_CLK_PERIS_GIC_CLK,
+	     "gout_peris_clk_peris_gic_clk", "mout_peris_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_GIC_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIS_AD_AXI_P_PERIS_ACLKM,
+	     "gout_peris_ad_axi_p_peris_aclkm", "mout_peris_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_AD_AXI_P_PERIS_IPCLKPORT_ACLKM,
+	     21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_PERIS_OTP_CON_BIRA_PCLK,
+	     "gout_peris_otp_con_bira_pclk", "mout_peris_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_OTP_CON_BIRA_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIS_GIC_CLK,
+	     "gout_peris_gic_clk", "mout_peris_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_GIC_IPCLKPORT_CLK,
+	     21, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_PERIS_LHM_AXI_P_PERIS_CLK,
+	     "gout_peris_lhm_axi_p_peris_clk", "oscclk",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_LHM_AXI_P_PERIS_IPCLKPORT_I_CLK,
+	     21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_PERIS_MCT_PCLK,
+	     "gout_peris_mct_pclk", "mout_peris_clk_peris_gic",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_MCT_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIS_OTP_CON_TOP_PCLK,
+	     "gout_peris_otp_con_top_pclk", "mout_peris_clk_peris_gic",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_OTP_CON_TOP_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIS_D_TZPC_PERIS_PCLK,
+	     "gout_peris_d_tzpc_peris_pclk", "mout_peris_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_D_TZPC_PERIS_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIS_TMU_TOP_PCLK,
+	     "gout_peris_tmu_top_pclk", "mout_peris_clk_peris_gic",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_TOP_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK,
+	     "gout_peris_otp_con_bira_oscclk", "oscclk",
+	     CLK_CON_GAT_CLK_BLK_PERIS_UID_OTP_CON_BIRA_IPCLKPORT_I_OSCCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK,
+	     "gout_peris_otp_con_top_oscclk", "oscclk",
+	     CLK_CON_GAT_CLK_BLK_PERIS_UID_OTP_CON_TOP_IPCLKPORT_I_OSCCLK,
+	     21, 0, 0),
+};
+
+static const struct samsung_cmu_info peris_cmu_info __initconst = {
+	.mux_clks = peris_mux_clks,
+	.nr_mux_clks = ARRAY_SIZE(peris_mux_clks),
+	.gate_clks = peris_gate_clks,
+	.nr_gate_clks = ARRAY_SIZE(peris_gate_clks),
+	.nr_clk_ids = CLKS_NR_PERIS,
+	.clk_regs = peris_clk_regs,
+	.nr_clk_regs = ARRAY_SIZE(peris_clk_regs),
+};
+
+static void __init exynos990_cmu_peris_init(struct device_node *np)
+{
+	exynos_arm64_register_cmu(NULL, np, &peris_cmu_info);
+}
+
+/* Register CMU_PERIS early, as it's a dependency for the MCT. */
+CLK_OF_DECLARE(exynos990_cmu_peris, "samsung,exynos990-cmu-peris",
+	       exynos990_cmu_peris_init);
+
 /* ----- platform_driver ----- */
 
 static int __init exynos990_cmu_probe(struct platform_device *pdev)

-- 
2.45.2


