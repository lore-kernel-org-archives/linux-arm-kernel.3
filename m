Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA46E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 19:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e5oe7RKY;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=rvlVPj+d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8Fq8BXKXwPruBFf0Jb4J83jpkmZLP8E53RtNcgLBFLY=; b=e5oe7RKYqDXJzq
	N6HaJiGajyeEqlOqdFotdCcXkPU3X5YwLbv0PyJClvkFWRtNuwq67JbMmSC4hnrmIwBYYGMnP7WqI
	sZJ/hdrzdh7Rd8Dr86giy8x6T52tUxHpdT+2IIS4es74iKaZ104r4c95xnW+g4f7l8/yFTV9lw+V9
	ZTrGaoXP3zgTAnsHTQZve0gSNBdXnGZqvl45CijJE5Y7Lu9sVSC0c19HbKViKa0/N+0Jw0Gavz58C
	LdwPPywZx8I+GSAOQLCSHE/9XzMIp9aOwpAA6imDjeCnY2eO2ipFE9TOVEFsOKv6HOfj58ax3DGsW
	jUfb6P3ZEUhnpXEmIWgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3nt-00000001LaM-2NWy;
	Sun, 25 Oct 2026 19:22:49 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3ne-00000001LHs-3zie;
	Sun, 25 Oct 2026 19:22:37 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJMK12517096
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:22:26 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJMK12517096
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956148;
	bh=8Fq8BXKXwPruBFf0Jb4J83jpkmZLP8E53RtNcgLBFLY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rvlVPj+d/P9kyaECefV0yMjMhsSBstPQ62jJV92wR35RWn7qaKHKQDqdPohWGoQTs
	 ZnyBsV/W2pIFfUngUG8qqB2I6zvfUz1FIf4PBZ1JtEeKt3ENroxCY04/zADcJuV0QF
	 sqqpv9/vsOWEno6+RX+lDwjArbbuRQrO0ZKKBJLI=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, rafael@kernel.org,
        viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 2/4] clk: meson: s4-pll: add the CPU clock
Date: Sun, 25 Oct 2026 20:22:17 +0100
Message-ID: <20261025192219.209137-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122235_350710_7184ED9D 
X-CRM114-Status: GOOD (  33.31  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

On S4 the CPU clock control register is not reachable from the normal
world: every access goes through the BL31 firmware, which exposes two
SMC services, one for sys_pll (0x82000098) and one for the CPU clock
tree (0x82000099). They take pre-shifted mask/value pairs and behave
like a secure regmap_update_bits(). The sys_pll status register is
still readable from the ANACTRL block.

The tree behind it is the G12A one: two "dynamic" premux/postmux/divider
chains fed from xtal, fclk_div2 and fclk_div3, and a final mux picking
the dynamic tree or sys_pll. As the firmware calls do not map onto
independent muxes and dividers, and the park/reprogram/restore order is
what keeps the cores alive while sys_pll changes, model the whole tree
as a single clock:

 - rates up to 1 GHz come from the dynamic tree,
 - higher rates come from sys_pll, with the CPU parked on the 1 GHz
   dynamic clock while the PLL is reprogrammed,
 - the switch back to sys_pll waits for the new post divider and lock,
   and stays parked with an error if the PLL does not lock.

The firmware boots the cores from sys_pll at about 1.5 GHz, while a PWM
CPU supply can still be at the bottom of its range until cpufreq takes
over, so the clock parks on 1 GHz at registration.

The settings mirror the tables of the vendor firmware and kernel.

Tested on an S905W2 board with cpufreq cycling through all operating
points from 100 MHz to at least 1.7 GHz.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/clk/meson/s4-pll.c | 320 +++++++++++++++++++++++++++++++++++++
 1 file changed, 320 insertions(+)

diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
index 56ce6f566e53..951c7060b544 100644
--- a/drivers/clk/meson/s4-pll.c
+++ b/drivers/clk/meson/s4-pll.c
@@ -6,7 +6,10 @@
  * Author: Yu Tu <yu.tu@amlogic.com>
  */
 
+#include <linux/arm-smccc.h>
+#include <linux/bitfield.h>
 #include <linux/clk-provider.h>
+#include <linux/delay.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 
@@ -16,6 +19,7 @@
 #include "meson-clkc-utils.h"
 #include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
 
+#define ANACTRL_SYSPLL_CTRL0                       0x000
 #define ANACTRL_FIXPLL_CTRL0                       0x040
 #define ANACTRL_FIXPLL_CTRL1                       0x044
 #define ANACTRL_FIXPLL_CTRL3                       0x04c
@@ -758,6 +762,321 @@ static struct clk_regmap s4_mpll3 = {
 	},
 };
 
+/*
+ * CPU clock.
+ *
+ * On S4 the CPU clock control register is only accessible from the secure
+ * world: it is not mapped in the CLKCTRL block visible to Linux, and every
+ * write has to go through BL31. The firmware exposes two SMC services, one
+ * for sys_pll and one for the CPU clock tree, which take pre-shifted
+ * mask/value pairs and behave like a secure regmap_update_bits().
+ *
+ * The hardware tree itself is the well known G12A one (a "dynamic" mux
+ * chain fed by xtal/fclk_div2/fclk_div3 plus a final mux selecting either
+ * that chain or sys_pll). Because the individual muxes cannot be read or
+ * written independently without firmware help, and because the ordering of
+ * the park/reprogram/restore sequence is what keeps the core alive, the
+ * whole tree is modelled here as a single clock with its own ops instead of
+ * a set of clk_regmap muxes and dividers.
+ */
+#define SECURE_PLL_CLK				0x82000098
+#define SECURE_CPU_CLK				0x82000099
+
+/* SECURE_PLL_CLK sub-commands */
+#define SECURE_PLL_SET_MN			0
+#define SECURE_PLL_PRE_CHANGE			1
+#define SECURE_PLL_SET_OD			2
+
+/* SECURE_CPU_CLK sub-commands */
+#define SECURE_CPU_SET_MUX			6
+#define SECURE_CPU_GET_CTRL			7
+#define SECURE_CPU_SET_DYN			8
+
+#define SYS_PLL_LOCK				BIT(31)
+#define SYS_PLL_M				GENMASK(7, 0)
+#define SYS_PLL_N				GENMASK(14, 10)
+#define SYS_PLL_OD				GENMASK(18, 16)
+
+/* Fields of the secure CPU clock control register */
+#define CPU_CLK_DYN0_PREMUX			GENMASK(1, 0)
+#define CPU_CLK_DYN0_POSTMUX			BIT(2)
+#define CPU_CLK_DYN0_DIV			GENMASK(9, 4)
+#define CPU_CLK_DYN_MUX				BIT(10)
+#define CPU_CLK_FINAL_MUX			BIT(11)
+#define CPU_CLK_DYN1_PREMUX			GENMASK(17, 16)
+#define CPU_CLK_DYN1_POSTMUX			BIT(18)
+#define CPU_CLK_DYN1_DIV			GENMASK(25, 20)
+
+static unsigned long s4_secure_clk_smc(u32 fid, u32 cmd, u32 a2, u32 a3, u32 a4)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(fid, cmd, a2, a3, a4, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
+/* Settings of the dynamic tree, as used by the vendor firmware */
+struct s4_cpu_dyn_setting {
+	unsigned long	rate;
+	u32		premux;
+	u32		postmux;
+	u32		div;
+};
+
+static const struct s4_cpu_dyn_setting s4_cpu_dyn_table[] = {
+	{   24000000, 0, 0, 0 },
+	{  100000000, 1, 1, 9 },
+	{  250000000, 1, 1, 3 },
+	{  333333333, 2, 1, 1 },
+	{  500000000, 1, 1, 1 },
+	{  666666666, 2, 0, 0 },
+	{ 1000000000, 1, 0, 0 },
+};
+
+/* The clock the CPU is parked on while sys_pll is being reprogrammed */
+#define S4_CPU_PARK_IDX		6
+
+/*
+ * sys_pll settings: rate = xtal * m / 2^od with n = 1. Only multipliers
+ * keeping the DCO between 3 and 6 GHz are usable, which is why the lower
+ * rates use a bigger OD instead of a smaller multiplier.
+ */
+struct s4_sys_pll_setting {
+	unsigned long	rate;
+	u32		m;
+	u32		od;
+};
+
+static const struct s4_sys_pll_setting s4_sys_pll_table[] = {
+	{ 1200000000, 200, 2 },
+	{ 1404000000, 234, 2 },
+	{ 1500000000, 125, 1 },
+	{ 1608000000, 134, 1 },
+	{ 1704000000, 142, 1 },
+	{ 1800000000, 150, 1 },
+};
+
+static unsigned long s4_cpu_clk_dyn_parent_rate(u32 premux)
+{
+	switch (premux) {
+	case 1:
+		return clk_hw_get_rate(&s4_fclk_div2.hw);
+	case 2:
+		return clk_hw_get_rate(&s4_fclk_div3.hw);
+	default:
+		return 0;
+	}
+}
+
+static unsigned long s4_cpu_clk_recalc_rate(struct clk_hw *hw,
+					    unsigned long prate)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	unsigned long parent;
+	u32 ctrl, val, m, n, od;
+	u32 premux, postmux, div;
+
+	ctrl = s4_secure_clk_smc(SECURE_CPU_CLK, SECURE_CPU_GET_CTRL, 0, 0, 0);
+
+	if (ctrl & CPU_CLK_FINAL_MUX) {
+		regmap_read(clk->map, ANACTRL_SYSPLL_CTRL0, &val);
+
+		m = FIELD_GET(SYS_PLL_M, val);
+		n = FIELD_GET(SYS_PLL_N, val);
+		od = FIELD_GET(SYS_PLL_OD, val);
+		if (!n)
+			return 0;
+
+		return (unsigned long)div_u64((u64)prate * m, n) >> od;
+	}
+
+	if (ctrl & CPU_CLK_DYN_MUX) {
+		premux = FIELD_GET(CPU_CLK_DYN1_PREMUX, ctrl);
+		postmux = FIELD_GET(CPU_CLK_DYN1_POSTMUX, ctrl);
+		div = FIELD_GET(CPU_CLK_DYN1_DIV, ctrl);
+	} else {
+		premux = FIELD_GET(CPU_CLK_DYN0_PREMUX, ctrl);
+		postmux = FIELD_GET(CPU_CLK_DYN0_POSTMUX, ctrl);
+		div = FIELD_GET(CPU_CLK_DYN0_DIV, ctrl);
+	}
+
+	parent = premux ? s4_cpu_clk_dyn_parent_rate(premux) : prate;
+
+	return postmux ? parent / (div + 1) : parent;
+}
+
+/*
+ * Pick the supported setting closest to @rate. Nearest rather than floor
+ * matching is deliberate: cpufreq carries frequencies in kHz, so a rate such
+ * as 666666666 Hz comes back as 666666000 Hz and would otherwise drop
+ * to the next lower operating point.
+ */
+static unsigned long s4_cpu_clk_pick(unsigned long rate,
+				     const struct s4_cpu_dyn_setting **dyn,
+				     const struct s4_sys_pll_setting **pll)
+{
+	unsigned long best = 0, delta = ULONG_MAX;
+	int i;
+
+	*dyn = NULL;
+	*pll = NULL;
+
+	for (i = 0; i < ARRAY_SIZE(s4_cpu_dyn_table); i++) {
+		unsigned long d = abs_diff(s4_cpu_dyn_table[i].rate, rate);
+
+		if (d < delta) {
+			delta = d;
+			best = s4_cpu_dyn_table[i].rate;
+			*dyn = &s4_cpu_dyn_table[i];
+			*pll = NULL;
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(s4_sys_pll_table); i++) {
+		unsigned long d = abs_diff(s4_sys_pll_table[i].rate, rate);
+
+		if (d < delta) {
+			delta = d;
+			best = s4_sys_pll_table[i].rate;
+			*dyn = NULL;
+			*pll = &s4_sys_pll_table[i];
+		}
+	}
+
+	return best;
+}
+
+static int s4_cpu_clk_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
+{
+	const struct s4_cpu_dyn_setting *dyn;
+	const struct s4_sys_pll_setting *pll;
+
+	req->rate = s4_cpu_clk_pick(req->rate, &dyn, &pll);
+
+	return 0;
+}
+
+static void s4_cpu_clk_set_dyn(const struct s4_cpu_dyn_setting *dyn)
+{
+	s4_secure_clk_smc(SECURE_CPU_CLK, SECURE_CPU_SET_DYN,
+			  dyn->premux, dyn->postmux, dyn->div);
+	s4_secure_clk_smc(SECURE_CPU_CLK, SECURE_CPU_SET_MUX,
+			  CPU_CLK_FINAL_MUX, 0, 0);
+}
+
+static int s4_cpu_clk_init(struct clk_hw *hw)
+{
+	int ret;
+
+	ret = clk_regmap_init(hw);
+	if (ret)
+		return ret;
+
+	/*
+	 * The firmware hands the cores over running from sys_pll at ~1.5 GHz,
+	 * but the CPU supply only comes under Linux control later and a PWM
+	 * regulator adopts whatever duty cycle the bootloader left behind,
+	 * which can be the minimum of the rail. Running 1.5 GHz at that
+	 * voltage is out of spec and hangs some boards every few boots, so
+	 * park on the 1 GHz dynamic clock until cpufreq starts managing
+	 * frequency and voltage together.
+	 */
+	s4_cpu_clk_set_dyn(&s4_cpu_dyn_table[S4_CPU_PARK_IDX]);
+
+	return 0;
+}
+
+static int s4_cpu_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long prate)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	const struct s4_cpu_dyn_setting *dyn;
+	const struct s4_sys_pll_setting *pll;
+	unsigned int val;
+	int ret;
+
+	s4_cpu_clk_pick(rate, &dyn, &pll);
+
+	if (dyn) {
+		s4_cpu_clk_set_dyn(dyn);
+		return 0;
+	}
+
+	if (!pll)
+		return -EINVAL;
+
+	/* Park the CPU on the dynamic tree before touching sys_pll */
+	s4_cpu_clk_set_dyn(&s4_cpu_dyn_table[S4_CPU_PARK_IDX]);
+
+	s4_secure_clk_smc(SECURE_PLL_CLK, SECURE_PLL_PRE_CHANGE, 0, 0, 0);
+	s4_secure_clk_smc(SECURE_PLL_CLK, SECURE_PLL_SET_MN, pll->m, 1, 0);
+	s4_secure_clk_smc(SECURE_PLL_CLK, SECURE_PLL_SET_OD, SYS_PLL_OD,
+			  FIELD_PREP(SYS_PLL_OD, pll->od), 0);
+
+	/*
+	 * Wait for the PLL to relock before running the cores off it again.
+	 * Switching the final mux onto a PLL that has not locked yet kills
+	 * the CPU, so on timeout stay parked on the dynamic tree instead:
+	 * the cores keep running and the caller gets an error.
+	 *
+	 * The lock bit alone is not enough here. SET_MN releases reset and
+	 * BL31 waits for lock internally, so by the time SET_OD runs the bit
+	 * is already set and stays set while the divider changes underneath a
+	 * live PLL - between the two writes the output is the undivided DCO.
+	 * Confirm the divider has actually taken and let the output settle,
+	 * otherwise the mux can land while the cores are still being clocked
+	 * from the DCO.
+	 */
+	ret = regmap_read_poll_timeout(clk->map, ANACTRL_SYSPLL_CTRL0, val,
+				       FIELD_GET(SYS_PLL_OD, val) == pll->od,
+				       10, 10000);
+	if (ret) {
+		pr_err("cpu_clk: sys_pll OD did not take, staying on %lu Hz\n",
+		       s4_cpu_dyn_table[S4_CPU_PARK_IDX].rate);
+		return ret;
+	}
+
+	fsleep(100);
+
+	ret = regmap_read_poll_timeout(clk->map, ANACTRL_SYSPLL_CTRL0, val,
+				       val & SYS_PLL_LOCK, 10, 10000);
+	if (ret) {
+		pr_err("cpu_clk: sys_pll did not lock, staying on %lu Hz\n",
+		       s4_cpu_dyn_table[S4_CPU_PARK_IDX].rate);
+		return ret;
+	}
+
+	s4_secure_clk_smc(SECURE_CPU_CLK, SECURE_CPU_SET_MUX,
+			  CPU_CLK_FINAL_MUX, CPU_CLK_FINAL_MUX, 0);
+
+	return 0;
+}
+
+static const struct clk_ops s4_cpu_clk_ops = {
+	.init		= s4_cpu_clk_init,
+	.recalc_rate	= s4_cpu_clk_recalc_rate,
+	.determine_rate	= s4_cpu_clk_determine_rate,
+	.set_rate	= s4_cpu_clk_set_rate,
+};
+
+static struct clk_regmap s4_cpu_clk = {
+	.hw.init = &(struct clk_init_data){
+		.name = "cpu_clk",
+		.ops = &s4_cpu_clk_ops,
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "xtal", }
+		},
+		.num_parents = 1,
+		/*
+		 * The cores run on this clock, it must never be gated and its
+		 * rate is changed behind our back by the firmware on resume.
+		 */
+		.flags = CLK_IS_CRITICAL | CLK_GET_RATE_NOCACHE,
+	},
+};
+
 /* Array of all clocks provided by this provider */
 static struct clk_hw *s4_pll_hw_clks[] = {
 	[CLKID_FIXED_PLL_DCO]		= &s4_fixed_pll_dco.hw,
@@ -792,6 +1111,7 @@ static struct clk_hw *s4_pll_hw_clks[] = {
 	[CLKID_MPLL2]			= &s4_mpll2.hw,
 	[CLKID_MPLL3_DIV]		= &s4_mpll3_div.hw,
 	[CLKID_MPLL3]			= &s4_mpll3.hw,
+	[CLKID_CPU_CLK]			= &s4_cpu_clk.hw,
 };
 
 static const struct reg_sequence s4_pll_init_regs[] = {
-- 
2.56.0


