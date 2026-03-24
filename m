Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E225BF532CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 02:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQlsWMOFIBfxihFOE/nhHq2WXQxHtripIrdvExEEpuI=; b=EMNoNuvOlRzp0I+6/N2TTE7Ztd
	TAAau/ttqn4Rv+XRFUs1NHyicIlMAULbtyes0OLY5VJheC9uzLuVBlKwSlDOWHluEEhtcHSFTMkdz
	wCagn5L8wmOSAK/hb80DQBpbXmMtXZYNSsteg5K9TAzgGqfq6XAxCrk6dGHsqetIGAqA01cgUalEs
	+qSXrKcwj7oaa3BB3ElNs0djTpqdSGRDTmjBTCItdWjdlJGjkOsSy84AHDI7NbNj8JXxYSdgRu9Zx
	JAtuproG4Y81TyGrpydpDDSbAIDZmf5ZpaOHU0+lBkAsOKl4Wxa+N6eaqZdj5IenDRFCnezW/e07M
	T0Jz0B6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rws-00000000QfT-1c5O;
	Tue, 24 Mar 2026 02:56:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rwk-00000000QZi-0knt;
	Tue, 24 Mar 2026 02:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uQlsWMOFIBfxihFOE/nhHq2WXQxHtripIrdvExEEpuI=; b=gkt8f8tIRlfE5DOZdz4iV3bnVQ
	bRggsEuO3NENs9gzaj7D/GVg9JOu21+Cr+efMhjMXXfAXGVBWZIyUcSb4dKabzmD4rJtudK+Ywwq2
	+DGliLEU8PyxAODdt38Gxod7nYfCgsMCPqVYZTIWWsMOvV7eqtgdaoL+kLlXSiSFiKqpkuscge/ak
	bWaSpaC61HQ9H5T7iuEoZGKhVqOoi/KArTK6GAjlwSZClx6xn7jQMfo7jfQl4A9KcpBptkFH/fXj5
	xfwu331mOkpp0xAmoVa53w2E1oyZaGAjyo4iKBxr38TnyZxx0GaVsdg3y6xIVSOccjGDms03+LQFZ
	teuzR8SQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rwL-000000035PF-3Nsi;
	Tue, 24 Mar 2026 02:56:41 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62O2rYlcD278468, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1774320814; bh=uQlsWMOFIBfxihFOE/nhHq2WXQxHtripIrdvExEEpuI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=WLBxxigxvrb0ucPmgfpASH5rFDt2EEcIWX4RHJXl9k+qaOgSWAGmIa9ANAdGthrrW
	 Noi0yUWfruJ3Mb8EYtvSJEMgA8ryGnFn8sSqxazSx+q+0l3QqJj8mf836vv6f0Bayq
	 tsNSFzjs2JGRUHcRTm8zJ81fv2OzaPruoW2YELygF1/YCz3c5A3UmRrVs+Q7GiiWvu
	 El2yKDIIVQWSIe794NoZECGzzPcLfn5MfIMEOMZX4KYryvF5DteNoMOjBx/bN/tDPQ
	 lFhLqbPjRLeDnAmL8hdShU01xI0Ud/u26NSwS8fqWdn4UUynxV6sTjNHB65gnG7aY5
	 BfuUYiYXVooHA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62O2rYlcD278468
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2026 10:53:34 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Mar 2026 10:53:35 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Mar 2026 10:53:34 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 24 Mar 2026 10:53:34 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v5 08/10] clk: realtek: Add support for MMC-tuned PLL clocks
Date: Tue, 24 Mar 2026 10:53:29 +0800
Message-ID: <20260324025332.3416977-9-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260324025332.3416977-1-eleanor.lin@realtek.com>
References: <20260324025332.3416977-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_025626_481451_1C4AA7AF 
X-CRM114-Status: GOOD (  18.28  )
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

From: Cheng-Yu Lee <cylee12@realtek.com>

Add clk_pll_mmc_ops for enable/disable, prepare, rate control, and status
operations on MMC PLL clocks.

Also add clk_pll_mmc_phase_ops to support phase get/set operations.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Jyan Chou <jyanchou@realtek.com>
Signed-off-by: Jyan Chou <jyanchou@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v5:
- None.
---
 MAINTAINERS                       |   8 +
 drivers/clk/realtek/Kconfig       |   3 +
 drivers/clk/realtek/Makefile      |   2 +
 drivers/clk/realtek/clk-pll-mmc.c | 399 ++++++++++++++++++++++++++++++
 drivers/clk/realtek/clk-pll.h     |  21 ++
 5 files changed, 433 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-pll-mmc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 31f4a5a66394..074d7f33c32b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22233,6 +22233,14 @@ F:      drivers/clk/realtek/*
 F:	drivers/reset/realtek/*
 F:	include/dt-bindings/clock/realtek*
 
+REALTEK SOC PLL CLOCK FOR MMC SUPPORT
+M:	Cheng-Yu Lee <cylee12@realtek.com>
+M:	Jyan Chou <jyanchou@realtek.com>
+M:	Yu-Chun Lin <eleanor.lin@realtek.com>
+L:	linux-clk@vger.kernel.org
+S:	Supported
+F:	drivers/clk/realtek/clk-pll-mmc.c
+
 REALTEK SPI-NAND
 M:	Chris Packham <chris.packham@alliedtelesis.co.nz>
 S:	Maintained
diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
index 63eb3fb3e79a..5d790ce526ab 100644
--- a/drivers/clk/realtek/Kconfig
+++ b/drivers/clk/realtek/Kconfig
@@ -25,4 +25,7 @@ config RTK_CLK_COMMON
 	  multiple Realtek clock implementations, and include integration
 	  with reset controllers where required.
 
+config RTK_CLK_PLL_MMC
+	bool
+
 endif
diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index f90dc57fcfdb..fd7d777902c8 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -7,3 +7,5 @@ clk-rtk-y += clk-pll.o
 clk-rtk-y += clk-regmap-gate.o
 clk-rtk-y += clk-regmap-mux.o
 clk-rtk-y += freq_table.o
+
+clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-pll-mmc.o
diff --git a/drivers/clk/realtek/clk-pll-mmc.c b/drivers/clk/realtek/clk-pll-mmc.c
new file mode 100644
index 000000000000..017663738c1f
--- /dev/null
+++ b/drivers/clk/realtek/clk-pll-mmc.c
@@ -0,0 +1,399 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2021 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include "clk-pll.h"
+
+#define PLL_EMMC1_OFFSET           0x0
+#define PLL_EMMC2_OFFSET           0x4
+#define PLL_EMMC3_OFFSET           0x8
+#define PLL_EMMC4_OFFSET           0xc
+#define PLL_SSC_DIG_EMMC1_OFFSET   0x0
+#define PLL_SSC_DIG_EMMC3_OFFSET   0xc
+#define PLL_SSC_DIG_EMMC4_OFFSET   0x10
+
+#define PLL_MMC_SSC_DIV_N_VAL      0x1b
+
+#define PLL_PHRT0_MASK             BIT(1)
+#define PLL_PHSEL_MASK             GENMASK(4, 0)
+#define PLL_SSCPLL_RS_MASK         GENMASK(12, 10)
+#define PLL_SSCPLL_ICP_MASK        GENMASK(9, 5)
+#define PLL_SSC_DIV_EXT_F_MASK     GENMASK(25, 13)
+#define PLL_PI_IBSELH_MASK         GENMASK(28, 27)
+#define PLL_SSC_DIV_N_MASK         GENMASK(23, 16)
+#define PLL_NCODE_SSC_EMMC_MASK    GENMASK(20, 13)
+#define PLL_FCODE_SSC_EMMC_MASK    GENMASK(12, 0)
+#define PLL_GRAN_EST_EM_MC_MASK    GENMASK(20, 0)
+#define PLL_EN_SSC_EMMC_MASK       BIT(0)
+#define PLL_FLAG_INITAL_EMMC_MASK  BIT(1)
+
+#define PLL_PHRT0_SHIFT            1
+#define PLL_SSCPLL_RS_SHIFT        10
+#define PLL_SSCPLL_ICP_SHIFT       5
+#define PLL_SSC_DIV_EXT_F_SHIFT    13
+#define PLL_PI_IBSELH_SHIFT        27
+#define PLL_SSC_DIV_N_SHIFT        16
+#define PLL_NCODE_SSC_EMMC_SHIFT   13
+#define PLL_FLAG_INITAL_EMMC_SHIFT 8
+
+#define CYCLE_DEGREES              360
+#define PHASE_STEPS                32
+#define PHASE_SCALE_FACTOR         1125
+
+static inline int get_phrt0(struct clk_pll_mmc *clkm, u32 *val)
+{
+	u32 reg;
+	int ret;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET, &reg);
+	if (ret)
+		return ret;
+
+	*val = (reg >> PLL_PHRT0_SHIFT) & PLL_PHRT0_MASK;
+	return 0;
+}
+
+static inline int set_phrt0(struct clk_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET,
+				  PLL_PHRT0_MASK, val << PLL_PHRT0_SHIFT);
+}
+
+static inline int get_phsel(struct clk_pll_mmc *clkm, int id, u32 *val)
+{
+	int ret;
+	u32 raw_val;
+	u32 sft = id ? 8 : 3;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET, &raw_val);
+	if (ret)
+		return ret;
+
+	*val = (raw_val >> sft) & PLL_PHSEL_MASK;
+	return 0;
+}
+
+static inline int set_phsel(struct clk_pll_mmc *clkm, int id, u32 val)
+{
+	u32 sft = id ? 8 : 3;
+
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET,
+				  PLL_PHSEL_MASK << sft, val << sft);
+}
+
+static inline int set_sscpll_rs(struct clk_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET,
+				  PLL_SSCPLL_RS_MASK, val << PLL_SSCPLL_RS_SHIFT);
+}
+
+static inline int set_sscpll_icp(struct clk_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET,
+				  PLL_SSCPLL_ICP_MASK, val << PLL_SSCPLL_ICP_SHIFT);
+}
+
+static inline int get_ssc_div_ext_f(struct clk_pll_mmc *clkm, u32 *val)
+{
+	u32 raw_val;
+	int ret;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET, &raw_val);
+	if (ret)
+		return ret;
+
+	*val = (raw_val & PLL_SSC_DIV_EXT_F_MASK) >> PLL_SSC_DIV_EXT_F_SHIFT;
+	return 0;
+}
+
+static inline int set_ssc_div_ext_f(struct clk_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET,
+				  PLL_SSC_DIV_EXT_F_MASK,
+				  val << PLL_SSC_DIV_EXT_F_SHIFT);
+}
+
+static inline int set_pi_ibselh(struct clk_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET,
+				  PLL_PI_IBSELH_MASK, val << PLL_PI_IBSELH_SHIFT);
+}
+
+static inline int set_ssc_div_n(struct clk_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC3_OFFSET,
+				  PLL_SSC_DIV_N_MASK, val << PLL_SSC_DIV_N_SHIFT);
+}
+
+static inline int get_ssc_div_n(struct clk_pll_mmc *clkm, u32 *val)
+{
+	int ret;
+	u32 raw_val;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC3_OFFSET, &raw_val);
+	if (ret)
+		return ret;
+
+	*val = (raw_val & PLL_SSC_DIV_N_MASK) >> PLL_SSC_DIV_N_SHIFT;
+	return 0;
+}
+
+static inline int set_pow_ctl(struct clk_pll_mmc *clkm, u32 val)
+{
+	return regmap_write(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC4_OFFSET, val);
+}
+
+static inline int get_pow_ctl(struct clk_pll_mmc *clkm, u32 *val)
+{
+	int ret;
+	u32 raw_val;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC4_OFFSET, &raw_val);
+
+	*val = raw_val;
+
+	return ret;
+}
+
+static int clk_pll_mmc_phase_set_phase(struct clk_hw *hw, int degrees)
+{
+	struct clk_hw *hwp = clk_hw_get_parent(hw);
+	struct clk_pll_mmc *clkm;
+	int phase_id;
+	u32 val;
+	int ret;
+
+	if (!hwp)
+		return -ENOENT;
+
+	clkm = to_clk_pll_mmc(hwp);
+	phase_id = (hw - &clkm->phase0_hw) ? 1 : 0;
+	val = DIV_ROUND_CLOSEST(degrees * 100, PHASE_SCALE_FACTOR);
+	ret = set_phsel(clkm, phase_id, val);
+	if (ret)
+		return ret;
+
+	usleep_range(10, 20);
+	return 0;
+}
+
+static int clk_pll_mmc_phase_get_phase(struct clk_hw *hw)
+{
+	struct clk_hw *hwp;
+	struct clk_pll_mmc *clkm;
+	int phase_id;
+	int ret;
+	u32 val;
+
+	hwp = clk_hw_get_parent(hw);
+	if (!hwp)
+		return -ENOENT;
+
+	clkm = to_clk_pll_mmc(hwp);
+	phase_id = (hw - &clkm->phase0_hw) ? 1 : 0;
+	ret = get_phsel(clkm, phase_id, &val);
+	if (ret)
+		return ret;
+
+	val = DIV_ROUND_CLOSEST(val * CYCLE_DEGREES, PHASE_STEPS);
+
+	return val;
+}
+
+const struct clk_ops rtk_clk_pll_mmc_phase_ops = {
+	.set_phase = clk_pll_mmc_phase_set_phase,
+	.get_phase = clk_pll_mmc_phase_get_phase,
+};
+EXPORT_SYMBOL_GPL(rtk_clk_pll_mmc_phase_ops);
+
+static int clk_pll_mmc_prepare(struct clk_hw *hw)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+
+	return set_pow_ctl(clkm, 7);
+}
+
+static void clk_pll_mmc_unprepare(struct clk_hw *hw)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+
+	set_pow_ctl(clkm, 0);
+}
+
+static int clk_pll_mmc_is_prepared(struct clk_hw *hw)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	u32 val;
+	int ret;
+
+	ret = get_pow_ctl(clkm, &val);
+	if (ret)
+		return 1;
+
+	return val != 0x0;
+}
+
+static int clk_pll_mmc_enable(struct clk_hw *hw)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	int ret;
+
+	ret = set_phrt0(clkm, 1);
+	if (ret)
+		return ret;
+
+	udelay(10);
+	return 0;
+}
+
+static void clk_pll_mmc_disable(struct clk_hw *hw)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+
+	set_phrt0(clkm, 0);
+	udelay(10);
+}
+
+static int clk_pll_mmc_is_enabled(struct clk_hw *hw)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	u32 val;
+	int ret;
+
+	ret = get_phrt0(clkm, &val);
+	if (ret)
+		return 1;
+
+	return val == 0x1;
+}
+
+static unsigned long clk_pll_mmc_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	u32 val, ext_f;
+	int ret;
+
+	ret = get_ssc_div_n(clkm, &val);
+	if (ret)
+		return ret;
+
+	ret = get_ssc_div_ext_f(clkm, &ext_f);
+	if (ret)
+		return ret;
+
+	return parent_rate / 4 * (val + 2) + (parent_rate / 4 * ext_f) / 8192;
+}
+
+static int clk_pll_mmc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	u32 val = DIV_ROUND_CLOSEST(req->rate * 4, req->best_parent_rate);
+
+	req->rate = req->best_parent_rate * val / 4;
+	return 0;
+}
+
+static int clk_pll_mmc_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	u32 val = PLL_MMC_SSC_DIV_N_VAL;
+	int ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
+				 PLL_FLAG_INITAL_EMMC_MASK, 0x0 << PLL_FLAG_INITAL_EMMC_SHIFT);
+	if (ret)
+		return ret;
+
+	ret = set_ssc_div_n(clkm, val);
+	if (ret)
+		return ret;
+
+	ret = set_ssc_div_ext_f(clkm, 1517);
+	if (ret)
+		return ret;
+
+	switch (val) {
+	case 31 ... 46:
+		ret |= set_pi_ibselh(clkm, 3);
+		ret |= set_sscpll_rs(clkm, 3);
+		ret |= set_sscpll_icp(clkm, 2);
+		break;
+
+	case 20 ... 30:
+		ret |= set_pi_ibselh(clkm, 2);
+		ret |= set_sscpll_rs(clkm, 3);
+		ret |= set_sscpll_icp(clkm, 1);
+		break;
+
+	case 10 ... 19:
+		ret |= set_pi_ibselh(clkm, 1);
+		ret |= set_sscpll_rs(clkm, 2);
+		ret |= set_sscpll_icp(clkm, 1);
+		break;
+
+	case 5 ... 9:
+		ret |= set_pi_ibselh(clkm, 0);
+		ret |= set_sscpll_rs(clkm, 2);
+		ret |= set_sscpll_icp(clkm, 0);
+		break;
+	}
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC3_OFFSET,
+				 PLL_NCODE_SSC_EMMC_MASK,
+				 27 << PLL_NCODE_SSC_EMMC_SHIFT);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC3_OFFSET,
+				 PLL_FCODE_SSC_EMMC_MASK, 321);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC4_OFFSET,
+				 PLL_GRAN_EST_EM_MC_MASK, 5985);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
+				 PLL_EN_SSC_EMMC_MASK, 0x1);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
+				 PLL_EN_SSC_EMMC_MASK, 0x0);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
+				 PLL_FLAG_INITAL_EMMC_MASK,
+				 0x1 << PLL_FLAG_INITAL_EMMC_SHIFT);
+	if (ret)
+		return ret;
+
+	usleep_range(10, 20);
+	return 0;
+}
+
+const struct clk_ops rtk_clk_pll_mmc_ops = {
+	.prepare          = clk_pll_mmc_prepare,
+	.unprepare        = clk_pll_mmc_unprepare,
+	.is_prepared      = clk_pll_mmc_is_prepared,
+	.enable           = clk_pll_mmc_enable,
+	.disable          = clk_pll_mmc_disable,
+	.is_enabled       = clk_pll_mmc_is_enabled,
+	.recalc_rate      = clk_pll_mmc_recalc_rate,
+	.determine_rate   = clk_pll_mmc_determine_rate,
+	.set_rate         = clk_pll_mmc_set_rate,
+};
+EXPORT_SYMBOL_GPL(rtk_clk_pll_mmc_ops);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/realtek/clk-pll.h b/drivers/clk/realtek/clk-pll.h
index 2d27a44a270c..9cf219871218 100644
--- a/drivers/clk/realtek/clk-pll.h
+++ b/drivers/clk/realtek/clk-pll.h
@@ -44,4 +44,25 @@ static inline struct clk_pll *to_clk_pll(struct clk_hw *hw)
 extern const struct clk_ops rtk_clk_pll_ops;
 extern const struct clk_ops rtk_clk_pll_ro_ops;
 
+struct clk_pll_mmc {
+	struct clk_regmap clkr;
+	int pll_ofs;
+	int ssc_dig_ofs;
+	struct clk_hw phase0_hw;
+	struct clk_hw phase1_hw;
+	u32 set_rate_val_53_97_set_ipc: 1;
+};
+
+#define __clk_pll_mmc_hw(_ptr)  __clk_regmap_hw(&(_ptr)->clkr)
+
+static inline struct clk_pll_mmc *to_clk_pll_mmc(struct clk_hw *hw)
+{
+	struct clk_regmap *clkr = to_clk_regmap(hw);
+
+	return container_of(clkr, struct clk_pll_mmc, clkr);
+}
+
+extern const struct clk_ops rtk_clk_pll_mmc_ops;
+extern const struct clk_ops rtk_clk_pll_mmc_phase_ops;
+
 #endif /* __CLK_REALTEK_CLK_PLL_H */
-- 
2.34.1


