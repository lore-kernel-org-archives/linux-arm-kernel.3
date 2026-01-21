Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C2EC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 11:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fF0XjaNHARVRqmcYLQANfY/8iC+KZIfurQnVod+Mvk=; b=ij+oOAFB3z60jSPr+z82EX8Mrg
	vEpg/fW9ztY8HYBlpZKX0rG1jHYhmDA14rQ3lBBnQpDXX3KcFAurgO3FHf/EKuq39MlTce9fspLQk
	IYBjlS751AXC4M5oa1bkct2snuK0IFJ4tw2p758ZzGRkp91q41cL+j/yah0qHJP7WsifiyCyH4vKP
	xd/P9Q3pNKXRcYQALnkDzBemOqETX8RIB2ZQ24j4s/a+HUej5TwSRMs/kM732f8Z/IVO+vp6OycIQ
	iLeGshmPoviA7s52372/ptLZU0ERiQUDybHjiHyMLjVG0NPedcamsU9RwSrB4PKbqXPJRuZODnX01
	fKJwduvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viW0k-00000005Ju2-34T9;
	Wed, 21 Jan 2026 11:04:30 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viW0h-00000005JtC-3sWp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 11:04:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768993457; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nBMfEg+OrdU1PPnnF9xDo9EjQ6DU6IYBBTdp06f4d5U8lJ9/9Nt6bbYiEPYoQ6nUFmZIwYmdV0iEsP5pVU48yKs7/bBOdn4tjthFKcj8JGExMMMSU6gyguKZdckvCzQJ1CeSVs1J91atjhWYtm5WHuEe8egjNQQ+vsf5gadtzms=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768993457; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+fF0XjaNHARVRqmcYLQANfY/8iC+KZIfurQnVod+Mvk=; 
	b=liwi9V2Fl9WqHSyb5Jfp4T776Se99R37em4wLWEVFAeA41Dlh3WX7FHYfYPsQhhg3vvLcdOChE5/h3Ilrjy+sYlVabGxEOBOhLOjzAXs7n8q9iCG0cqH6PQ0+IETN9Z6UprlISw02VuUb/eAmEdrwxTrKxpw3TNdukCVKIWFIa4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768993457;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=+fF0XjaNHARVRqmcYLQANfY/8iC+KZIfurQnVod+Mvk=;
	b=OJATXfY1eSHN85Fjf7GdVCvVG7SS8YD3LTZ+zbvnyiXm4MA910byLk3hT26JcbdH
	XRP3IDbCQZsw5iWqNHbFsxzaofzCsIN8ZAelpbYLkC9rHaDaF8WWOqbGaCcpHbdMQiy
	sQpweecHhPaFavHHe06Z00Be7oyxijtGF4sX6jK8=
Received: by mx.zohomail.com with SMTPS id 1768993455150886.2521745289004;
	Wed, 21 Jan 2026 03:04:15 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 21 Jan 2026 18:59:10 +0800
Subject: [PATCH 4/7] clk: sunxi-ng: Extract common RTC CCU clock logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-a733-rtc-v1-4-d359437f23a7@pigmoral.tech>
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
In-Reply-To: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768993386; l=10958;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=bhCaIAht/co8lZYVs9DHT3cS4FdFKeAxhuztNHtGFjI=;
 b=eDTPf/PRUkhj9sCH/yyKm5xgbPPLRHtmynqmDhTCfxglTpMIb2gSLcO9THWZ7CZR0RDu39aH8
 XpELLgI581sDgwsNydcSH2bLUaQQ7SGf11u8gKWXIhXkXG/XB3Hc+sJ
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_030428_029899_C7151F85 
X-CRM114-Status: GOOD (  19.65  )
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

Extract the IOSC and 32k clock logic from ccu-sun6i-rtc into a shared
module to simplify adding RTC CCU support for new SoCs. This is needed
because newer Allwinner SoCs introduce additional DCXO/HOSC logic that
prevents direct reuse of the existing driver.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/clk/sunxi-ng/Makefile        |   3 +
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 152 +----------------------------------
 drivers/clk/sunxi-ng/ccu_rtc.c       | 136 +++++++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_rtc.h       |  37 +++++++++
 4 files changed, 177 insertions(+), 151 deletions(-)

diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
index a1c4087d7241..c3f810a025a8 100644
--- a/drivers/clk/sunxi-ng/Makefile
+++ b/drivers/clk/sunxi-ng/Makefile
@@ -23,6 +23,9 @@ sunxi-ccu-y			+= ccu_nkmp.o
 sunxi-ccu-y			+= ccu_nm.o
 sunxi-ccu-y			+= ccu_mp.o
 
+# RTC clocks
+sunxi-ccu-y			+= ccu_rtc.o
+
 # SoC support
 obj-$(CONFIG_SUNIV_F1C100S_CCU)	+= suniv-f1c100s-ccu.o
 obj-$(CONFIG_SUN20I_D1_CCU)	+= sun20i-d1-ccu.o
diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 6f888169412c..562ba752bcec 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -14,37 +14,12 @@
 
 #include "ccu_common.h"
 
-#include "ccu_div.h"
 #include "ccu_gate.h"
 #include "ccu_mux.h"
+#include "ccu_rtc.h"
 
 #include "ccu-sun6i-rtc.h"
 
-#define IOSC_ACCURACY			300000000 /* 30% */
-#define IOSC_RATE			16000000
-
-#define LOSC_RATE			32768
-#define LOSC_RATE_SHIFT			15
-
-#define LOSC_CTRL_REG			0x0
-#define LOSC_CTRL_KEY			0x16aa0000
-
-#define IOSC_32K_CLK_DIV_REG		0x8
-#define IOSC_32K_CLK_DIV		GENMASK(4, 0)
-#define IOSC_32K_PRE_DIV		32
-
-#define IOSC_CLK_CALI_REG		0xc
-#define IOSC_CLK_CALI_DIV_ONES		22
-#define IOSC_CLK_CALI_EN		BIT(1)
-#define IOSC_CLK_CALI_SRC_SEL		BIT(0)
-
-#define LOSC_OUT_GATING_REG		0x60
-
-#define DCXO_CTRL_REG			0x160
-#define DCXO_CTRL_CLK16M_RC_EN		BIT(0)
-
-#define SUN6I_RTC_AUX_ID(_name)		"rtc_sun6i." #_name
-
 struct sun6i_rtc_match_data {
 	bool				have_ext_osc32k		: 1;
 	bool				have_iosc_calibration	: 1;
@@ -53,137 +28,12 @@ struct sun6i_rtc_match_data {
 	u8				osc32k_fanout_nparents;
 };
 
-static int ccu_iosc_enable(struct clk_hw *hw)
-{
-	struct ccu_common *cm = hw_to_ccu_common(hw);
-
-	return ccu_gate_helper_enable(cm, DCXO_CTRL_CLK16M_RC_EN);
-}
-
-static void ccu_iosc_disable(struct clk_hw *hw)
-{
-	struct ccu_common *cm = hw_to_ccu_common(hw);
-
-	return ccu_gate_helper_disable(cm, DCXO_CTRL_CLK16M_RC_EN);
-}
-
-static int ccu_iosc_is_enabled(struct clk_hw *hw)
-{
-	struct ccu_common *cm = hw_to_ccu_common(hw);
-
-	return ccu_gate_helper_is_enabled(cm, DCXO_CTRL_CLK16M_RC_EN);
-}
-
-static unsigned long ccu_iosc_recalc_rate(struct clk_hw *hw,
-					  unsigned long parent_rate)
-{
-	struct ccu_common *cm = hw_to_ccu_common(hw);
-
-	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
-		u32 reg = readl(cm->base + IOSC_CLK_CALI_REG);
-
-		/*
-		 * Recover the IOSC frequency by shifting the ones place of
-		 * (fixed-point divider * 32768) into bit zero.
-		 */
-		if (reg & IOSC_CLK_CALI_EN)
-			return reg >> (IOSC_CLK_CALI_DIV_ONES - LOSC_RATE_SHIFT);
-	}
-
-	return IOSC_RATE;
-}
-
-static unsigned long ccu_iosc_recalc_accuracy(struct clk_hw *hw,
-					      unsigned long parent_accuracy)
-{
-	return IOSC_ACCURACY;
-}
-
-static const struct clk_ops ccu_iosc_ops = {
-	.enable			= ccu_iosc_enable,
-	.disable		= ccu_iosc_disable,
-	.is_enabled		= ccu_iosc_is_enabled,
-	.recalc_rate		= ccu_iosc_recalc_rate,
-	.recalc_accuracy	= ccu_iosc_recalc_accuracy,
-};
-
 static struct ccu_common iosc_clk = {
 	.reg		= DCXO_CTRL_REG,
 	.hw.init	= CLK_HW_INIT_NO_PARENT("iosc", &ccu_iosc_ops,
 						CLK_GET_RATE_NOCACHE),
 };
 
-static int ccu_iosc_32k_prepare(struct clk_hw *hw)
-{
-	struct ccu_common *cm = hw_to_ccu_common(hw);
-	u32 val;
-
-	if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
-		return 0;
-
-	val = readl(cm->base + IOSC_CLK_CALI_REG);
-	writel(val | IOSC_CLK_CALI_EN | IOSC_CLK_CALI_SRC_SEL,
-	       cm->base + IOSC_CLK_CALI_REG);
-
-	return 0;
-}
-
-static void ccu_iosc_32k_unprepare(struct clk_hw *hw)
-{
-	struct ccu_common *cm = hw_to_ccu_common(hw);
-	u32 val;
-
-	if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
-		return;
-
-	val = readl(cm->base + IOSC_CLK_CALI_REG);
-	writel(val & ~(IOSC_CLK_CALI_EN | IOSC_CLK_CALI_SRC_SEL),
-	       cm->base + IOSC_CLK_CALI_REG);
-}
-
-static unsigned long ccu_iosc_32k_recalc_rate(struct clk_hw *hw,
-					      unsigned long parent_rate)
-{
-	struct ccu_common *cm = hw_to_ccu_common(hw);
-	u32 val;
-
-	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
-		val = readl(cm->base + IOSC_CLK_CALI_REG);
-
-		/* Assume the calibrated 32k clock is accurate. */
-		if (val & IOSC_CLK_CALI_SRC_SEL)
-			return LOSC_RATE;
-	}
-
-	val = readl(cm->base + IOSC_32K_CLK_DIV_REG) & IOSC_32K_CLK_DIV;
-
-	return parent_rate / IOSC_32K_PRE_DIV / (val + 1);
-}
-
-static unsigned long ccu_iosc_32k_recalc_accuracy(struct clk_hw *hw,
-						  unsigned long parent_accuracy)
-{
-	struct ccu_common *cm = hw_to_ccu_common(hw);
-	u32 val;
-
-	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
-		val = readl(cm->base + IOSC_CLK_CALI_REG);
-
-		/* Assume the calibrated 32k clock is accurate. */
-		if (val & IOSC_CLK_CALI_SRC_SEL)
-			return 0;
-	}
-
-	return parent_accuracy;
-}
-
-static const struct clk_ops ccu_iosc_32k_ops = {
-	.prepare		= ccu_iosc_32k_prepare,
-	.unprepare		= ccu_iosc_32k_unprepare,
-	.recalc_rate		= ccu_iosc_32k_recalc_rate,
-	.recalc_accuracy	= ccu_iosc_32k_recalc_accuracy,
-};
-
 static struct ccu_common iosc_32k_clk = {
 	.hw.init	= CLK_HW_INIT_HW("iosc-32k", &iosc_clk.hw,
 					 &ccu_iosc_32k_ops,
diff --git a/drivers/clk/sunxi-ng/ccu_rtc.c b/drivers/clk/sunxi-ng/ccu_rtc.c
new file mode 100644
index 000000000000..cfc10218517c
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu_rtc.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 Samuel Holland <samuel@sholland.org>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+
+#include "ccu_common.h"
+
+#include "ccu_gate.h"
+#include "ccu_rtc.h"
+
+static int ccu_iosc_enable(struct clk_hw *hw)
+{
+	struct ccu_common *cm = hw_to_ccu_common(hw);
+
+	return ccu_gate_helper_enable(cm, DCXO_CTRL_CLK16M_RC_EN);
+}
+
+static void ccu_iosc_disable(struct clk_hw *hw)
+{
+	struct ccu_common *cm = hw_to_ccu_common(hw);
+
+	return ccu_gate_helper_disable(cm, DCXO_CTRL_CLK16M_RC_EN);
+}
+
+static int ccu_iosc_is_enabled(struct clk_hw *hw)
+{
+	struct ccu_common *cm = hw_to_ccu_common(hw);
+
+	return ccu_gate_helper_is_enabled(cm, DCXO_CTRL_CLK16M_RC_EN);
+}
+
+static unsigned long ccu_iosc_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	struct ccu_common *cm = hw_to_ccu_common(hw);
+
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
+		u32 reg = readl(cm->base + IOSC_CLK_CALI_REG);
+		/*
+		 * Recover the IOSC frequency by shifting the ones place of
+		 * (fixed-point divider * 32768) into bit zero.
+		 */
+		if (reg & IOSC_CLK_CALI_EN)
+			return reg >> (IOSC_CLK_CALI_DIV_ONES - LOSC_RATE_SHIFT);
+	}
+
+	return IOSC_RATE;
+}
+
+static unsigned long ccu_iosc_recalc_accuracy(struct clk_hw *hw,
+					      unsigned long parent_accuracy)
+{
+	return IOSC_ACCURACY;
+}
+
+const struct clk_ops ccu_iosc_ops = {
+	.enable			= ccu_iosc_enable,
+	.disable		= ccu_iosc_disable,
+	.is_enabled		= ccu_iosc_is_enabled,
+	.recalc_rate		= ccu_iosc_recalc_rate,
+	.recalc_accuracy	= ccu_iosc_recalc_accuracy,
+};
+
+static int ccu_iosc_32k_prepare(struct clk_hw *hw)
+{
+	struct ccu_common *cm = hw_to_ccu_common(hw);
+	u32 val;
+
+	if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
+		return 0;
+
+	val = readl(cm->base + IOSC_CLK_CALI_REG);
+	writel(val | IOSC_CLK_CALI_EN | IOSC_CLK_CALI_SRC_SEL,
+	       cm->base + IOSC_CLK_CALI_REG);
+
+	return 0;
+}
+
+static void ccu_iosc_32k_unprepare(struct clk_hw *hw)
+{
+	struct ccu_common *cm = hw_to_ccu_common(hw);
+	u32 val;
+
+	if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
+		return;
+
+	val = readl(cm->base + IOSC_CLK_CALI_REG);
+	writel(val & ~(IOSC_CLK_CALI_EN | IOSC_CLK_CALI_SRC_SEL),
+	       cm->base + IOSC_CLK_CALI_REG);
+}
+
+static unsigned long ccu_iosc_32k_recalc_rate(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	struct ccu_common *cm = hw_to_ccu_common(hw);
+	u32 val;
+
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
+		val = readl(cm->base + IOSC_CLK_CALI_REG);
+
+		/* Assume the calibrated 32k clock is accurate. */
+		if (val & IOSC_CLK_CALI_SRC_SEL)
+			return LOSC_RATE;
+	}
+
+	val = readl(cm->base + IOSC_32K_CLK_DIV_REG) & IOSC_32K_CLK_DIV;
+
+	return parent_rate / IOSC_32K_PRE_DIV / (val + 1);
+}
+
+static unsigned long ccu_iosc_32k_recalc_accuracy(struct clk_hw *hw,
+						  unsigned long parent_accuracy)
+{
+	struct ccu_common *cm = hw_to_ccu_common(hw);
+	u32 val;
+
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
+		val = readl(cm->base + IOSC_CLK_CALI_REG);
+
+		/* Assume the calibrated 32k clock is accurate. */
+		if (val & IOSC_CLK_CALI_SRC_SEL)
+			return 0;
+	}
+
+	return parent_accuracy;
+}
+
+const struct clk_ops ccu_iosc_32k_ops = {
+	.prepare		= ccu_iosc_32k_prepare,
+	.unprepare		= ccu_iosc_32k_unprepare,
+	.recalc_rate		= ccu_iosc_32k_recalc_rate,
+	.recalc_accuracy	= ccu_iosc_32k_recalc_accuracy,
+};
diff --git a/drivers/clk/sunxi-ng/ccu_rtc.h b/drivers/clk/sunxi-ng/ccu_rtc.h
new file mode 100644
index 000000000000..1c44c2206a25
--- /dev/null
+++ b/drivers/clk/sunxi-ng/ccu_rtc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 Samuel Holland <samuel@sholland.org>
+ */
+
+#ifndef _CCU_RTC_H_
+#define _CCU_RTC_H_
+
+#define IOSC_ACCURACY			300000000 /* 30% */
+#define IOSC_RATE			16000000
+
+#define LOSC_RATE			32768
+#define LOSC_RATE_SHIFT			15
+
+#define LOSC_CTRL_REG			0x0
+#define LOSC_CTRL_KEY			0x16aa0000
+
+#define IOSC_32K_CLK_DIV_REG		0x8
+#define IOSC_32K_CLK_DIV		GENMASK(4, 0)
+#define IOSC_32K_PRE_DIV		32
+
+#define IOSC_CLK_CALI_REG		0xc
+#define IOSC_CLK_CALI_DIV_ONES		22
+#define IOSC_CLK_CALI_EN		BIT(1)
+#define IOSC_CLK_CALI_SRC_SEL		BIT(0)
+
+#define LOSC_OUT_GATING_REG		0x60
+
+#define DCXO_CTRL_REG			0x160
+#define DCXO_CTRL_CLK16M_RC_EN		BIT(0)
+
+#define SUN6I_RTC_AUX_ID(_name)		"rtc_sun6i." #_name
+
+extern const struct clk_ops ccu_iosc_ops;
+extern const struct clk_ops ccu_iosc_32k_ops;
+
+#endif /* _CCU_RTC_H_ */

-- 
2.52.0


