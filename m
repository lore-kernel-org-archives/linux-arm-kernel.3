Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12976CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 18:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lC2S89uWVd4kKLJY+Z3L6fWfhN36m0m3rdw9eQ0mhyM=; b=uk36y2Nk0FeAmUdfYd3DOvy5Gc
	Z5Lr4N5g9uqXaQwwq1cRROPUY4GSZhvzTcl39JHmqG5zyFzgbCoARdcRapRzth+GupQpxpP+4DGE1
	5IS9RKhmoaIQsd6nuoYesrwrWi8+L3SE/tBkIGlUbkotXHA9JID480uG5W106bwo+7hyRho8vkfJl
	d3R/PMPT9gCRJvuBEjrpMbR1dKWQPOYY5+nT7yaNvApTeLdSI0QaPjFDhxd8743wbIay49O8+PsfV
	KiJmwLhozyJ+PynBlh5K+ccafbZaVWSAO6cGd7HJu4rs/6IoHYJINuXJ0Y/ZJZzMyqTUg9mH0+3sJ
	P2CkhHLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw2kA-00000009JId-2RvK;
	Tue, 09 Sep 2025 18:07:02 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw2k7-00000009JI6-48lw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 18:07:01 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-32bae4bcd63so3266482a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 11:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757441219; x=1758046019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lC2S89uWVd4kKLJY+Z3L6fWfhN36m0m3rdw9eQ0mhyM=;
        b=F3fDDCBDSJv6uQ3ZykXBWIasJ9VQ6wHMlgLAf3HTvQquidvRSxVAbZq59/gdhy9My9
         KsRZJXKOQCfkKj+B8bIS00X9IE3WjQ4TI8Vpy6T8nhvcyPnRePV8XeP0RYa/FSrJzhRS
         5M13YMFMPC/M8bJg9uSOX3JT51X4gqz/ImV+u1Fk98IGpmFnBa16OiAc7gvkOEUn27+H
         ciaBA9eFVoT5m4QwFXi9BWq2N0QQJjrUihWh7v6KCHbX7Awp2e8C6tFUJPsJL/R7I2+j
         S+heo5E0cwZ1F4vcA2Hr2XoxoEuwAzuHivBOJZZ111/wTb4XSJOKP+GlSX+2Z6OZ6ErX
         5tcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757441219; x=1758046019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lC2S89uWVd4kKLJY+Z3L6fWfhN36m0m3rdw9eQ0mhyM=;
        b=LPga4D1RVuaHiFQjQQ7gKZh8r43GZFY4RBAu5uwGxYTdrllfwccpsV17PaKKy91lyM
         aS8dhtkUOiLx0kKir9dGdikscU9gssEnWxhYAWrI0/pElYAG5oAPrtgDufdaZPe57LHC
         3u+bjseWYH3rV7FND+dKvMJAZlR1zYIPfKWnlA/qagxmRdBBU/zU+Gn2ckYafuA43H0f
         NUmgjNjHfoS1E/LfIrcu34xHsHvqLaV4LJRXxxN94YWbkJ1+8rqcPn8sQE5IPn8Efafh
         XgvHWXVaHqKwQP90wGjv79hhqMXXYKnVWChNFh4DzzReu/CB9f2Ad5MU/vbzEC3rRqAb
         HmGg==
X-Forwarded-Encrypted: i=1; AJvYcCXQkp0fzYB6e4DiofJ5rinpiYd+U/aX5v02KHh7ovKXYhxhGU5yWxTqyCm1O3PcDKyOcTOAwAgCcUQsyd0/yHL0@lists.infradead.org
X-Gm-Message-State: AOJu0YyRnUiOti2qKI14ct+qDYObvri1hCaVS5JnDkTWYZmm3koTznTV
	9LmGkNnuF79IlrhUg/iC4+z8x9hVUBkSyOxa6LkF0UbcoH2ytIb2WwVX6DQS/Q==
X-Gm-Gg: ASbGncu20L2g6eNplx9d1ic1pcn5podZbnQVqvFIAJZoERYyXgoh8prpf1BAdLIKCxx
	8xF2nOXpLjIGQ4Uizdcx1asmvbk8XskF6OPjI2E1CRLJPMNOuOL9e+o65RSbAFJ96KRB+vxnZ42
	+il7cRwCiv9G63WjFuQ4iOQi7PilQo5I5kVbrTvRgr8CbvbtnpgbW1gDsTX8V9K9bK13/zITmb8
	y0DnDRPDuQ1bUuwpF/Do+hvsHXVdjnvq00qmyFbK/PNfmowT+2WTIN761j5DVeRvGFnChK8IZzK
	gimgIt88gu1+iTjLtzCjvbYV2rcER8WSTSYCamisFHmS39/yssOqYvsHkEGSC4aLGLNQ8XF2T+2
	hnF+ibs/g6W7mJZJI7qho/pW1e6Ejlhk=
X-Google-Smtp-Source: AGHT+IEQ8Fdk0HbZvmKlziMWHOi6q7YSOReqEYtXvWbMeLz8O2VLpBEy5+WUL5qEMmSebQfRgcmeeQ==
X-Received: by 2002:a17:90b:3dcc:b0:329:e9da:35d0 with SMTP id 98e67ed59e1d1-32d43ef5112mr14793775a91.5.1757441218843;
        Tue, 09 Sep 2025 11:06:58 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da8e7186sm35182693a91.16.2025.09.09.11.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:06:58 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG SOC CLOCK DRIVERS),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1] clk: samsung: exynos5420: Add support for power control registers
Date: Tue,  9 Sep 2025 23:36:49 +0530
Message-ID: <20250909180652.7130-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_110700_049606_63A54E6F 
X-CRM114-Status: GOOD (  18.03  )
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

As per the Exynos5422 user manual, settings for the PWR_CTRL, PWR_CTRL2,
PWR_CTRL_KFC, and PWR_CNTL_KFC registers manage ARM clock down and up
configurations for idle and standby states.

The Exynos5422's dynamic clock frequency down feature enables automatic
clock down when all CPU cores are in Wait For Event (WFE) or
Wait For Interrupt (WFI) states, utilizing this feature in standby
configurations.

These modifications enhance the power management capabilities of the
Exynos542x by providing finer control over the ARM clock behavior in
various states.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 111 +++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index a9df4e6db82fa..ce4c554eb59f1 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -8,6 +8,7 @@
  */
 
 #include <dt-bindings/clock/exynos5420.h>
+#include <linux/bitfield.h>
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
@@ -29,6 +30,8 @@
 #define CLKOUT_CMU_CPU		0xa00
 #define SRC_MASK_CPERI		0x4300
 #define GATE_IP_G2D		0x8800
+#define PWR_CTRL		0x1020
+#define PWR_CTRL2		0x1024
 #define CPLL_LOCK		0x10020
 #define DPLL_LOCK		0x10030
 #define EPLL_LOCK		0x10040
@@ -139,10 +142,50 @@
 #define KPLL_CON0		0x28100
 #define SRC_KFC			0x28200
 #define DIV_KFC0		0x28500
+#define PWR_CTRL_KFC		0x29020
+#define PWR_CTRL2_KFC		0x29024
 
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR			(CLK_DOUT_PCLK_DREX1 + 1)
 
+/* Below definitions are used for PWR_CTRL settings */
+#define PWR_CTRL_ARM2_RATIO_MASK       GENMASK(30, 28)
+#define PWR_CTRL_ARM_RATIO_MASK        GENMASK(18, 16)
+#define PWR_CTRL_DIVARM2_DOWN_ENB      BIT(9)
+#define PWR_CTRL_DIVARM_DOWN_ENB       BIT(8)
+#define PWR_CTRL_USE_STANDBYWFE_ARM_CORE3  BIT(7)
+#define PWR_CTRL_USE_STANDBYWFE_ARM_CORE2  BIT(6)
+#define PWR_CTRL_USE_STANDBYWFE_ARM_CORE1  BIT(5)
+#define PWR_CTRL_USE_STANDBYWFE_ARM_CORE0  BIT(4)
+#define PWR_CTRL_USE_STANDBYWFI_ARM_CORE3  BIT(3)
+#define PWR_CTRL_USE_STANDBYWFI_ARM_CORE2  BIT(2)
+#define PWR_CTRL_USE_STANDBYWFI_ARM_CORE1  BIT(1)
+#define PWR_CTRL_USE_STANDBYWFI_ARM_CORE0  BIT(0)
+
+#define PWR_CTRL2_DIVARM2_UP_ENB       BIT(25)
+#define PWR_CTRL2_DIVARM_UP_ENB        BIT(24)
+#define PWR_CTRL2_DUR_STANDBY2_MASK    GENMASK(23, 16)
+#define PWR_CTRL2_DUR_STANDBY1_MASK    GENMASK(15, 8)
+#define PWR_CTRL2_UP_ARM2_RATIO_MASK   GENMASK(6, 4)
+#define PWR_CTRL2_UP_ARM_RATIO_MASK    GENMASK(2, 0)
+
+/* Below definitions are used for PWR_CTRL_KFC settings */
+#define PWR_CTRL_KFC_RATIO_MASK       GENMASK(21, 16)
+#define PWR_CTRL_KFC_DIVKFC_DOWN_ENB       BIT(8)
+#define PWR_CTRL_KFC_USE_STANDBYWFE_ARM_CORE3  BIT(7)
+#define PWR_CTRL_KFC_USE_STANDBYWFE_ARM_CORE2  BIT(6)
+#define PWR_CTRL_KFC_USE_STANDBYWFE_ARM_CORE1  BIT(5)
+#define PWR_CTRL_KFC_USE_STANDBYWFE_ARM_CORE0  BIT(4)
+#define PWR_CTRL_KFC_USE_STANDBYWFI_ARM_CORE3  BIT(3)
+#define PWR_CTRL_KFC_USE_STANDBYWFI_ARM_CORE2  BIT(2)
+#define PWR_CTRL_KFC_USE_STANDBYWFI_ARM_CORE1  BIT(1)
+#define PWR_CTRL_KFC_USE_STANDBYWFI_ARM_CORE0  BIT(0)
+
+#define PWR_CTRL2_KFC_DIVKFC_UP_ENB        BIT(24)
+#define PWR_CTRL2_KFC_DUR_STANDBY2_MASK    GENMASK(23, 16)
+#define PWR_CTRL2_KFC_DUR_STANDBY1_MASK    GENMASK(15, 8)
+#define PWR_CTRL2_KFC_UP_ARM_RATIO_MASK    GENMASK(5, 0)
+
 /* Exynos5x SoC type */
 enum exynos5x_soc {
 	EXYNOS5420,
@@ -1574,6 +1617,72 @@ static const struct of_device_id ext_clk_match[] __initconst = {
 	{ },
 };
 
+static void __init exynos5420_core_down_clock(void)
+{
+	unsigned int tmp;
+
+	/*
+	 * Enable arm clock down (in idle) and set arm divider
+	 * ratios in WFI/WFE state.
+	 */
+	tmp = (FIELD_PREP(PWR_CTRL_ARM2_RATIO_MASK, 7) |
+		FIELD_PREP(PWR_CTRL_ARM_RATIO_MASK, 7) |
+		PWR_CTRL_DIVARM_DOWN_ENB |
+		PWR_CTRL_DIVARM2_DOWN_ENB |
+		PWR_CTRL_USE_STANDBYWFE_ARM_CORE3 |
+		PWR_CTRL_USE_STANDBYWFE_ARM_CORE2 |
+		PWR_CTRL_USE_STANDBYWFE_ARM_CORE1 |
+		PWR_CTRL_USE_STANDBYWFE_ARM_CORE0 |
+		PWR_CTRL_USE_STANDBYWFI_ARM_CORE3 |
+		PWR_CTRL_USE_STANDBYWFI_ARM_CORE2 |
+		PWR_CTRL_USE_STANDBYWFI_ARM_CORE1 |
+		PWR_CTRL_USE_STANDBYWFI_ARM_CORE0);
+
+	writel_relaxed(tmp, reg_base + PWR_CTRL);
+
+	/*
+	 * Enable arm clock up (on exiting idle). Set arm divider
+	 * ratios when not in idle along with the standby duration
+	 * ratios.
+	 */
+	tmp = (PWR_CTRL2_DIVARM2_UP_ENB | PWR_CTRL2_DIVARM_UP_ENB |
+		FIELD_PREP(PWR_CTRL2_DUR_STANDBY2_MASK, 3) |
+		FIELD_PREP(PWR_CTRL2_DUR_STANDBY1_MASK, 3) |
+		FIELD_PREP(PWR_CTRL2_UP_ARM2_RATIO_MASK, 3) |
+		FIELD_PREP(PWR_CTRL2_UP_ARM_RATIO_MASK, 2));
+
+	writel_relaxed(tmp, reg_base + PWR_CTRL2);
+
+	/*
+	 * Enable arm clock down (in idle) and set kfc divider
+	 * ratios in WFI/WFE state.
+	 */
+	tmp = (FIELD_PREP(PWR_CTRL_KFC_RATIO_MASK, 7) |
+		PWR_CTRL_KFC_DIVKFC_DOWN_ENB |
+		PWR_CTRL_KFC_USE_STANDBYWFE_ARM_CORE3 |
+		PWR_CTRL_KFC_USE_STANDBYWFE_ARM_CORE2 |
+		PWR_CTRL_KFC_USE_STANDBYWFE_ARM_CORE1 |
+		PWR_CTRL_KFC_USE_STANDBYWFE_ARM_CORE0 |
+		PWR_CTRL_KFC_USE_STANDBYWFI_ARM_CORE3 |
+		PWR_CTRL_KFC_USE_STANDBYWFI_ARM_CORE2 |
+		PWR_CTRL_KFC_USE_STANDBYWFI_ARM_CORE1 |
+		PWR_CTRL_KFC_USE_STANDBYWFI_ARM_CORE0);
+
+	writel_relaxed(tmp, reg_base + PWR_CTRL_KFC);
+
+	/*
+	 * Enable arm clock up (on exiting idle). Set kfc divider
+	 * ratios when not in idle along with the standby duration
+	 * ratios.
+	 */
+	tmp = (PWR_CTRL2_KFC_DIVKFC_UP_ENB |
+		FIELD_PREP(PWR_CTRL2_KFC_DUR_STANDBY2_MASK, 3) |
+		FIELD_PREP(PWR_CTRL2_KFC_DUR_STANDBY1_MASK, 3) |
+		FIELD_PREP(PWR_CTRL2_KFC_UP_ARM_RATIO_MASK, 2));
+
+	writel_relaxed(tmp, reg_base + PWR_CTRL2_KFC);
+}
+
 /* register exynos5420 clocks */
 static void __init exynos5x_clk_init(struct device_node *np,
 		enum exynos5x_soc soc)
@@ -1649,6 +1758,8 @@ static void __init exynos5x_clk_init(struct device_node *np,
 				ARRAY_SIZE(exynos5800_cpu_clks));
 	}
 
+	exynos5420_core_down_clock();
+
 	samsung_clk_extended_sleep_init(reg_base,
 		exynos5x_clk_regs, ARRAY_SIZE(exynos5x_clk_regs),
 		exynos5420_set_clksrc, ARRAY_SIZE(exynos5420_set_clksrc));

base-commit: cf6fc5eefc5bbbbff92a085039ff74cdbd065c29
-- 
2.50.1


