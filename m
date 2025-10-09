Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C1ECCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 09:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhussLXTIAaNHdl08VkFOLu+6BznRfG9t4I2FdNWhpY=; b=VxZmd80DlFdGLxcPpVLgliXUkD
	P/85HPBs7V15DYrnlk30m68FoUpjjHgzs/08bbks5pLOd6paBidPHpYcA3ycUSBW/NUFFk8Oxbsv2
	dnKirWjZzydyiqlIuAlHdGIipM0AUBhS6Q3YFiA2DksUY0TTrD/wuWDED4e8YaUkQNq7KoXDoFE0C
	IYFRJGnccjyPMDrzSYEkhOCjCSAVstgO83ZVykHnnNNiogFY+2M6L/YYZLF+J4T8QIb/HVRYb2tsg
	yXG9OEL4RlKHRxEH4xjKh70YoYJeS56ZhQcbGEB35du2kw51hnJWgJb11ThT0YNSDIY8HCnXD8Oww
	Pev5cGbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mzo-00000005fBI-22eH;
	Thu, 09 Oct 2025 09:31:36 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mzk-00000005f8H-02dh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 09:31:33 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-afcb7322da8so127977466b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 02:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760002290; x=1760607090; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhussLXTIAaNHdl08VkFOLu+6BznRfG9t4I2FdNWhpY=;
        b=A080BGagkVLy4gpbT/xjPy7XkAdZfkIoa8x2b3Qoc72wyaSQIgjckxbprgyJSXnOMF
         dWl0hsm2hR56vFLVVBLpoM2jTvJcELa3+AA/ApYCX2L81SRcxg7LDAhujrfcpU8SspiH
         t73BNkqhIzc72QqcCTxQHCUztln8Ir4Aj4Cc/6HgLH67lKkV9owQD4V0pp0Ou+v5GVgT
         eRZoYQhEJhxM2O9qQOcvNs0XZe5q4CS/ziTJ+gQTObsKi20e48VdmG9D7SHtpTrr9uUp
         tQkG/3Djd0YWduQ8fnP8pjh5d+3NnIXcT/8cmiHHSHGOT/jGvDfwD/Nvb3nvpyufvHAu
         9UsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760002290; x=1760607090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhussLXTIAaNHdl08VkFOLu+6BznRfG9t4I2FdNWhpY=;
        b=eXpl9wPR51jhSxwlvObhnTGk32GKeEoQQA1n3GKt7igplD7d0rIQC6oH764MmDxy4v
         N21qeWeTS8NPsIOAOJAVNMmkCuVjpF64QfWBd1u1lNzo9+02Cg3pB8eBfO2yLRXAKiGj
         ZYtldMvvbylmRsNNF44Z2vdosn/OHHT0oYqPJqx4WECAMiZ8zE0GGlUuz/lhDOo9KLWm
         4uHQ86Y2Rb878CK3gFPAbwvuFaGAeUsaP2Kotjt+bNpUyS10JRgDo+dKRKwnwi17/aDA
         asdcFLlm2OUsNkEpLcHTvjG1ASlkg1K3YYaIOjHQU+uowBfOU4HZT1siW1bNhRzR+nfI
         1ryw==
X-Forwarded-Encrypted: i=1; AJvYcCW0SSo1nsoC9pnONGmTJH++X+5ulILlphrVp+dOUQL+pqGm7xWyY3XcPBMzN7PZN+ndNRv7zz6pDtqHmXghxuqA@lists.infradead.org
X-Gm-Message-State: AOJu0YwGkZe6LdEdrS6W0MnSQUvw3HoHbJaPpfpzzXmPl9DGndFlwWRy
	XAss/OxlpE4kpKa47syU1HrnGUqxcv7QkOXewVeC1gKRLm5IqB4jzHG0IXp3+RrGt40=
X-Gm-Gg: ASbGnctbrFBwE98mGLtS2LQYfIYFOPOmRIF2UAPofBUpvlO1rCVS1CHAsCgTHlQeApV
	mtPPCvwMKTCGKk5ZnMf7zS530tVTQyHaeYLvY0B0sHIEvlI6myNh8F1dxCQ8zsb40Rdhh3LDYfp
	DYrF7PsjSVd8lJku0HKP/ZNiaf0+1iNjhkOwMDUIjwmypfbLXFsH9NLODaDRV5E3AjBdwOquslT
	tdOX1LCA5HnCZHCOhfTIK7NZ56m1dPkHr1ExBmYmXHNTJ5zwyWwTD4KlLbq0WGanNf03lEyHk6i
	E/u7RsmvFaMOHv1rjo4iGVov8UXMg2YULM7cLOTyiLigM7OvsqGe6wW5pwhvXd6iHYhCjChZ2b4
	Sn0EruRNhjPhWPHmS+I9lp1lFz9TAd0kaB2/FHSWDaPSMRMrmIpfwkBZuXL4XeRrmbtba1a0U+l
	0lpaVo6m3HTcYKTBEXHJIy7fzdZ/aHTG1LvBMFwCAp
X-Google-Smtp-Source: AGHT+IFbSjFx0LgIGYF3AQ4EuYGAUDxL0vR9eK74H8BpGxWhNh/p8idh9Q02LxhdowVy2TFNboIGaQ==
X-Received: by 2002:a17:906:3394:b0:b46:cc3b:65f8 with SMTP id a640c23a62f3a-b50ac5d08afmr585251966b.45.1760002289908;
        Thu, 09 Oct 2025 02:31:29 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173a41sm1855670766b.87.2025.10.09.02.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:31:29 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 10:31:26 +0100
Subject: [PATCH v2 2/3] soc: samsung: exynos-pmu: move some gs101 related
 code into new file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pmu-regmap-tables-v2-2-2d64f5261952@linaro.org>
References: <20251009-gs101-pmu-regmap-tables-v2-0-2d64f5261952@linaro.org>
In-Reply-To: <20251009-gs101-pmu-regmap-tables-v2-0-2d64f5261952@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_023132_112496_B361F952 
X-CRM114-Status: GOOD (  32.30  )
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

To avoid cluttering common code, move most of the gs101 code into a new
file, gs101-pmu.c

More code is going to be added for gs101 - having it all in one file
helps keeping the common code (file) more readable. While at it, rename
variables 'ctx' to 'context' for consistency.

No functional change.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* update gs101-pmu.c header to C-style (Sam)
* ctx -> context
---
 MAINTAINERS                      |   1 +
 drivers/soc/samsung/Makefile     |   3 +-
 drivers/soc/samsung/exynos-pmu.c | 133 ------------------------------------
 drivers/soc/samsung/exynos-pmu.h |   7 ++
 drivers/soc/samsung/gs101-pmu.c  | 142 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 152 insertions(+), 134 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3439485437117aaffbe61b709468348231ca3cc4..b8908a95abc561ecf04be560f0e358c58acad693 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10599,6 +10599,7 @@ F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
+F:	drivers/soc/samsung/gs101-pmu.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c
 F:	include/dt-bindings/clock/google,gs101.h
 K:	[gG]oogle.?[tT]ensor
diff --git a/drivers/soc/samsung/Makefile b/drivers/soc/samsung/Makefile
index 248a33d7754af1a1e5fbbbb79413eb300bbbc8e5..636a762608c9ba2c22a72d6f9597ceb015f7f36c 100644
--- a/drivers/soc/samsung/Makefile
+++ b/drivers/soc/samsung/Makefile
@@ -6,7 +6,8 @@ exynos_chipid-y			+= exynos-chipid.o exynos-asv.o
 
 obj-$(CONFIG_EXYNOS_USI)	+= exynos-usi.o
 
-obj-$(CONFIG_EXYNOS_PMU)	+= exynos-pmu.o
+obj-$(CONFIG_EXYNOS_PMU)	+= exynos_pmu.o
+exynos_pmu-y			+= exynos-pmu.o gs101-pmu.o
 
 obj-$(CONFIG_EXYNOS_PMU_ARM_DRIVERS)	+= exynos3250-pmu.o exynos4-pmu.o \
 					exynos5250-pmu.o exynos5420-pmu.o
diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 9f416de03610b1727d8cc77616e5c87e2525cc69..528fd4bd96f515a15b0bf8d67c505f7a84c0fc2e 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -6,7 +6,6 @@
 // Exynos - CPU PMU(Power Management Unit) support
 
 #include <linux/array_size.h>
-#include <linux/arm-smccc.h>
 #include <linux/bitmap.h>
 #include <linux/cpuhotplug.h>
 #include <linux/cpu_pm.h>
@@ -25,14 +24,6 @@
 
 #include "exynos-pmu.h"
 
-#define PMUALIVE_MASK			GENMASK(13, 0)
-#define TENSOR_SET_BITS			(BIT(15) | BIT(14))
-#define TENSOR_CLR_BITS			BIT(15)
-#define TENSOR_SMC_PMU_SEC_REG		0x82000504
-#define TENSOR_PMUREG_READ		0
-#define TENSOR_PMUREG_WRITE		1
-#define TENSOR_PMUREG_RMW		2
-
 struct exynos_pmu_context {
 	struct device *dev;
 	const struct exynos_pmu_data *pmu_data;
@@ -54,125 +45,6 @@ static struct exynos_pmu_context *pmu_context;
 /* forward declaration */
 static struct platform_driver exynos_pmu_driver;
 
-/*
- * Tensor SoCs are configured so that PMU_ALIVE registers can only be written
- * from EL3, but are still read accessible. As Linux needs to write some of
- * these registers, the following functions are provided and exposed via
- * regmap.
- *
- * Note: This SMC interface is known to be implemented on gs101 and derivative
- * SoCs.
- */
-
-/* Write to a protected PMU register. */
-static int tensor_sec_reg_write(void *context, unsigned int reg,
-				unsigned int val)
-{
-	struct arm_smccc_res res;
-	unsigned long pmu_base = (unsigned long)context;
-
-	arm_smccc_smc(TENSOR_SMC_PMU_SEC_REG, pmu_base + reg,
-		      TENSOR_PMUREG_WRITE, val, 0, 0, 0, 0, &res);
-
-	/* returns -EINVAL if access isn't allowed or 0 */
-	if (res.a0)
-		pr_warn("%s(): SMC failed: %d\n", __func__, (int)res.a0);
-
-	return (int)res.a0;
-}
-
-/* Read/Modify/Write a protected PMU register. */
-static int tensor_sec_reg_rmw(void *context, unsigned int reg,
-			      unsigned int mask, unsigned int val)
-{
-	struct arm_smccc_res res;
-	unsigned long pmu_base = (unsigned long)context;
-
-	arm_smccc_smc(TENSOR_SMC_PMU_SEC_REG, pmu_base + reg,
-		      TENSOR_PMUREG_RMW, mask, val, 0, 0, 0, &res);
-
-	/* returns -EINVAL if access isn't allowed or 0 */
-	if (res.a0)
-		pr_warn("%s(): SMC failed: %d\n", __func__, (int)res.a0);
-
-	return (int)res.a0;
-}
-
-/*
- * Read a protected PMU register. All PMU registers can be read by Linux.
- * Note: The SMC read register is not used, as only registers that can be
- * written are readable via SMC.
- */
-static int tensor_sec_reg_read(void *context, unsigned int reg,
-			       unsigned int *val)
-{
-	*val = pmu_raw_readl(reg);
-	return 0;
-}
-
-/*
- * For SoCs that have set/clear bit hardware this function can be used when
- * the PMU register will be accessed by multiple masters.
- *
- * For example, to set bits 13:8 in PMU reg offset 0x3e80
- * tensor_set_bits_atomic(ctx, 0x3e80, 0x3f00, 0x3f00);
- *
- * Set bit 8, and clear bits 13:9 PMU reg offset 0x3e80
- * tensor_set_bits_atomic(0x3e80, 0x100, 0x3f00);
- */
-static int tensor_set_bits_atomic(void *ctx, unsigned int offset, u32 val,
-				  u32 mask)
-{
-	int ret;
-	unsigned int i;
-
-	for (i = 0; i < 32; i++) {
-		if (!(mask & BIT(i)))
-			continue;
-
-		offset &= ~TENSOR_SET_BITS;
-
-		if (val & BIT(i))
-			offset |= TENSOR_SET_BITS;
-		else
-			offset |= TENSOR_CLR_BITS;
-
-		ret = tensor_sec_reg_write(ctx, offset, i);
-		if (ret)
-			return ret;
-	}
-	return 0;
-}
-
-static bool tensor_is_atomic(unsigned int reg)
-{
-	/*
-	 * Use atomic operations for PMU_ALIVE registers (offset 0~0x3FFF)
-	 * as the target registers can be accessed by multiple masters. SFRs
-	 * that don't support atomic are added to the switch statement below.
-	 */
-	if (reg > PMUALIVE_MASK)
-		return false;
-
-	switch (reg) {
-	case GS101_SYSIP_DAT0:
-	case GS101_SYSTEM_CONFIGURATION:
-		return false;
-	default:
-		return true;
-	}
-}
-
-static int tensor_sec_update_bits(void *ctx, unsigned int reg,
-				  unsigned int mask, unsigned int val)
-{
-
-	if (!tensor_is_atomic(reg))
-		return tensor_sec_reg_rmw(ctx, reg, mask, val);
-
-	return tensor_set_bits_atomic(ctx, reg, val, mask);
-}
-
 void pmu_raw_writel(u32 val, u32 offset)
 {
 	writel_relaxed(val, pmu_base_addr + offset);
@@ -244,11 +116,6 @@ static const struct regmap_config regmap_pmu_intr = {
 	.use_raw_spinlock = true,
 };
 
-static const struct exynos_pmu_data gs101_pmu_data = {
-	.pmu_secure = true,
-	.pmu_cpuhp = true,
-};
-
 /*
  * PMU platform driver and devicetree bindings.
  */
diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
index 1658a55fe61c6fe70cc4cb0fcdcea2756096a268..fbe381e2a2e1062c318b10b3df171e328901fa7a 100644
--- a/drivers/soc/samsung/exynos-pmu.h
+++ b/drivers/soc/samsung/exynos-pmu.h
@@ -70,7 +70,14 @@ extern const struct exynos_pmu_data exynos4412_pmu_data;
 extern const struct exynos_pmu_data exynos5250_pmu_data;
 extern const struct exynos_pmu_data exynos5420_pmu_data;
 #endif
+extern const struct exynos_pmu_data gs101_pmu_data;
 
 extern void pmu_raw_writel(u32 val, u32 offset);
 extern u32 pmu_raw_readl(u32 offset);
+
+int tensor_sec_reg_write(void *context, unsigned int reg, unsigned int val);
+int tensor_sec_reg_read(void *context, unsigned int reg, unsigned int *val);
+int tensor_sec_update_bits(void *context, unsigned int reg, unsigned int mask,
+			   unsigned int val);
+
 #endif /* __EXYNOS_PMU_H */
diff --git a/drivers/soc/samsung/gs101-pmu.c b/drivers/soc/samsung/gs101-pmu.c
new file mode 100644
index 0000000000000000000000000000000000000000..ec345d09f21fca8692c3ba2a61feae5615bbef51
--- /dev/null
+++ b/drivers/soc/samsung/gs101-pmu.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Linaro Ltd.
+ *
+ * GS101 PMU (Power Management Unit) support
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/array_size.h>
+#include <linux/soc/samsung/exynos-pmu.h>
+#include <linux/soc/samsung/exynos-regs-pmu.h>
+
+#include "exynos-pmu.h"
+
+#define PMUALIVE_MASK			GENMASK(13, 0)
+#define TENSOR_SET_BITS			(BIT(15) | BIT(14))
+#define TENSOR_CLR_BITS			BIT(15)
+#define TENSOR_SMC_PMU_SEC_REG		0x82000504
+#define TENSOR_PMUREG_READ		0
+#define TENSOR_PMUREG_WRITE		1
+#define TENSOR_PMUREG_RMW		2
+
+const struct exynos_pmu_data gs101_pmu_data = {
+	.pmu_secure = true,
+	.pmu_cpuhp = true,
+};
+
+/*
+ * Tensor SoCs are configured so that PMU_ALIVE registers can only be written
+ * from EL3, but are still read accessible. As Linux needs to write some of
+ * these registers, the following functions are provided and exposed via
+ * regmap.
+ *
+ * Note: This SMC interface is known to be implemented on gs101 and derivative
+ * SoCs.
+ */
+
+/* Write to a protected PMU register. */
+int tensor_sec_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct arm_smccc_res res;
+	unsigned long pmu_base = (unsigned long)context;
+
+	arm_smccc_smc(TENSOR_SMC_PMU_SEC_REG, pmu_base + reg,
+		      TENSOR_PMUREG_WRITE, val, 0, 0, 0, 0, &res);
+
+	/* returns -EINVAL if access isn't allowed or 0 */
+	if (res.a0)
+		pr_warn("%s(): SMC failed: %d\n", __func__, (int)res.a0);
+
+	return (int)res.a0;
+}
+
+/* Read/Modify/Write a protected PMU register. */
+static int tensor_sec_reg_rmw(void *context, unsigned int reg,
+			      unsigned int mask, unsigned int val)
+{
+	struct arm_smccc_res res;
+	unsigned long pmu_base = (unsigned long)context;
+
+	arm_smccc_smc(TENSOR_SMC_PMU_SEC_REG, pmu_base + reg,
+		      TENSOR_PMUREG_RMW, mask, val, 0, 0, 0, &res);
+
+	/* returns -EINVAL if access isn't allowed or 0 */
+	if (res.a0)
+		pr_warn("%s(): SMC failed: %d\n", __func__, (int)res.a0);
+
+	return (int)res.a0;
+}
+
+/*
+ * Read a protected PMU register. All PMU registers can be read by Linux.
+ * Note: The SMC read register is not used, as only registers that can be
+ * written are readable via SMC.
+ */
+int tensor_sec_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	*val = pmu_raw_readl(reg);
+	return 0;
+}
+
+/*
+ * For SoCs that have set/clear bit hardware this function can be used when
+ * the PMU register will be accessed by multiple masters.
+ *
+ * For example, to set bits 13:8 in PMU reg offset 0x3e80
+ * tensor_set_bits_atomic(ctx, 0x3e80, 0x3f00, 0x3f00);
+ *
+ * Set bit 8, and clear bits 13:9 PMU reg offset 0x3e80
+ * tensor_set_bits_atomic(0x3e80, 0x100, 0x3f00);
+ */
+static int tensor_set_bits_atomic(void *context, unsigned int offset, u32 val,
+				  u32 mask)
+{
+	int ret;
+	unsigned int i;
+
+	for (i = 0; i < 32; i++) {
+		if (!(mask & BIT(i)))
+			continue;
+
+		offset &= ~TENSOR_SET_BITS;
+
+		if (val & BIT(i))
+			offset |= TENSOR_SET_BITS;
+		else
+			offset |= TENSOR_CLR_BITS;
+
+		ret = tensor_sec_reg_write(context, offset, i);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static bool tensor_is_atomic(unsigned int reg)
+{
+	/*
+	 * Use atomic operations for PMU_ALIVE registers (offset 0~0x3FFF)
+	 * as the target registers can be accessed by multiple masters. SFRs
+	 * that don't support atomic are added to the switch statement below.
+	 */
+	if (reg > PMUALIVE_MASK)
+		return false;
+
+	switch (reg) {
+	case GS101_SYSIP_DAT0:
+	case GS101_SYSTEM_CONFIGURATION:
+		return false;
+	default:
+		return true;
+	}
+}
+
+int tensor_sec_update_bits(void *context, unsigned int reg, unsigned int mask,
+			   unsigned int val)
+{
+	if (!tensor_is_atomic(reg))
+		return tensor_sec_reg_rmw(context, reg, mask, val);
+
+	return tensor_set_bits_atomic(context, reg, val, mask);
+}

-- 
2.51.0.710.ga91ca5db03-goog


