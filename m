Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C05CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 00:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zunoGt3p1/PW1enbE+6uwAqIoWez0F52cgDPOOrhXyQ=; b=KZfNmx6a5AuiyM7/TYubxN/xRf
	0Pfggm2tCyn0YxZEiMhzfPMbYjXHld9B7mlBQ4s930kysUNvAGq5J1GXf4G1trrlD+OaqByyLKi8f
	Z8Y0P4ejogbnyILVwx9m4NDkcpUMtjWBbhPCmiBfI7HEAiZ7ULLhiimox/bZ9TZ26DJkvJ9gf5K0m
	7U32kvBKsvANG2S1RPWacAcb15PWS//y5G8sll7v4TTDVcgszIZJGK1bIpiRJTK9aTx4YUbXLmumT
	QHB8VTCTw0YtGMd2L9CTd0bH0H1ZycNSlHGlLUbOThWqYt3dyQacUJdujjGfeWm3ISDPaL1foaitO
	jHG3Jm0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhwp-00000004nhI-25m9;
	Wed, 30 Sep 2026 00:13:23 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhwh-00000004ne6-2QxZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 00:13:16 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e8185e037so27018715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 17:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790727194; x=1791331994; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zunoGt3p1/PW1enbE+6uwAqIoWez0F52cgDPOOrhXyQ=;
        b=qky47GxGPYhE6CmfJ8ofh1FSU3TuVnE3BnveramPyj3849K8KEsimz36IMa0mGgWJh
         wATVtgAi6QRvHBJPu5KbbRFuF1fad0CnV0GU8GTQ5PhigKYz2TnSSssCL9gFEVpSGUE1
         596os849jgqVeGjKRqvvC4r1v1wg/wFt3hgio8GVgJgSAiu1xeqHa7g43kE52UY3DC3v
         diNv823Bx8aBQPCJQu7ZhkWQ7axmnp1KwJZbqLPnjlhzQTpNsRQAETccu+Q1NdVJ6901
         lMN9KS6jFwLWzFmR1RtJ/yf+WCg3lb3o/sE/Dz6v8cE/fUgsXHskiU5DLRPyXPTrBhqF
         Ba3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727194; x=1791331994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zunoGt3p1/PW1enbE+6uwAqIoWez0F52cgDPOOrhXyQ=;
        b=D6XJtxbtR3B+T5DRZ1XConiBLzlyhy6pYHJ/WGblLw2uvw6/Ol34iyikjjMJ+oPnbb
         /au+HqoLjbqCTttihXPRxtvOIHmTeB9iQ8IZTq6bcl15fsaD4UiQZUz+YbhASgcK6JSy
         wIQKMud4ZaJFKgOqD5RZNtWQ+nprxFe7esSYeoBD1wufcHDkS7EhmCj73LrTcViWBCP9
         ax5Jcv2dyemDgfO0JhBj3WruPe4UeSMDARZslwPWKDWu5f9q9uE/LhT2pji4gloLGYb8
         p1K4f1VGajCwP1DeIwil/aJN+LqV4fM3dBJ7lICrj+1an4lXVhuLdNC/QG23gMk+zgHZ
         31Eg==
X-Forwarded-Encrypted: i=1; AKwUvBzPZX3q3oY0rabsORw9dsBlsdtur5QYy9kGGBR9ZqiQFIHAjVCBhmSZJfso3sAJpF7LkgNKvLaqdDOfZggQCYAS@lists.infradead.org
X-Gm-Message-State: AFuF++mvr7jEWmEW6K18aIAh40ZztXsZ1EmwCQTM8ArmH0NW8vLG7cR+
	zPcsPbih3hQiNg+WD7iBczvMQciRaM2KGsEFDPv2OeV4jz8Ldg2bhITiEKgD5BFrv94=
X-Gm-Gg: AYBFou1myiSXCRxpW2h7s0s8i6ri8uY52MHybL2G9aBQjfzbil0fEZI3fUP98o+DaN8
	XF+UdSdaxwULKJlvzvLBTlzY7OH8xkM+wxg7ag1Kj5GkUGTBGgSw1yMPa9++4e07dMj4RNtGnGw
	3u0a69iXC83MrS6wo4F0LFXM7blnoGyMoLvNZ6uRxwMWJJTa4wbYGRLRJZTAgDgW2LLpu/uhcSF
	jv8qCGFxL/LRS01sF4BAwvJixCpGmUG4l8SKGIhIWHqhljCkwtAYalhWHPu9mAWSjvWuq2eU9xJ
	1i1eEEPfGSAi9ZiOlC1m1z9E8Zq1ySxgVobRq/0+K5k7zPBu05asyqzUucVMCtmYz1n6T0boqt7
	nMELvHqjkpBKr001ePTK0FXpilUmhcUSw0aIRFxE6tsMQdu/HxmNj/eX2qSyWqeP6sF5ohU3vHx
	UZGwBEwuEEh8TGcEOeokj0FvObQRHQdkVAQs3D/z6SNf1GoAyqBt4/7th7OYcX5kp8bBLHAPgOZ
	SynPlWtmOty6Jv4cdkNigtyEfaPukxrc7mIzFkzYwg0UpLUoLdmcIwk0hp6PQ==
X-Received: by 2002:a05:600c:c48f:b0:4a0:2b0:1cb2 with SMTP id 5b1f17b1804b1-4a015147f97mr9643765e9.20.1790727193949;
        Tue, 29 Sep 2026 17:13:13 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a89ffasm6320635e9.1.2026.09.29.17.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 17:13:13 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 30 Sep 2026 01:12:59 +0100
Subject: [PATCH v7 4/6] soc: samsung: exynos-pmu: add Exynos850 CPU hotplug
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-exynos850-cpuhotplug-v7-4-203245826333@linaro.org>
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_171315_667851_C9F1A974 
X-CRM114-Status: GOOD (  24.23  )
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

Add cpuhotplug support for Exynos850 platforms. This SoC requires
its own specific set of writes/updates to PMU and PMU interrupts
generation block in order to put a CPU or a group of CPUs into
a different sleep states or prepare these entities for a CPU_OFF
or wake-up out of idle state or after CPU online.
Without these writes/updates the CPU(s) wake-up or online fails.

This also requires syscon regmap with raw spinlocks, so add
its initialisation to main exynos pmu probe() routine.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/Makefile                |  2 +-
 drivers/soc/samsung/exynos-pmu.c            | 24 ++++++++
 drivers/soc/samsung/exynos-pmu.h            |  1 +
 drivers/soc/samsung/exynos850-pmu.c         | 95 +++++++++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |  5 ++
 5 files changed, 126 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/Makefile b/drivers/soc/samsung/Makefile
index 636a762608c9..7f544e3c1fcc 100644
--- a/drivers/soc/samsung/Makefile
+++ b/drivers/soc/samsung/Makefile
@@ -7,7 +7,7 @@ exynos_chipid-y			+= exynos-chipid.o exynos-asv.o
 obj-$(CONFIG_EXYNOS_USI)	+= exynos-usi.o
 
 obj-$(CONFIG_EXYNOS_PMU)	+= exynos_pmu.o
-exynos_pmu-y			+= exynos-pmu.o gs101-pmu.o
+exynos_pmu-y			+= exynos-pmu.o gs101-pmu.o exynos850-pmu.o
 
 obj-$(CONFIG_EXYNOS_PMU_ARM_DRIVERS)	+= exynos3250-pmu.o exynos4-pmu.o \
 					exynos5250-pmu.o exynos5420-pmu.o
diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 9efaaf4696cf..387ed149fa71 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -92,6 +92,14 @@ static const struct regmap_config regmap_smccfg = {
 	.use_raw_spinlock = true,
 };
 
+static const struct regmap_config regmap_pmu = {
+	.name = "pmu_regs",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.use_raw_spinlock = true,
+};
+
 static const struct regmap_config regmap_pmu_intr = {
 	.name = "pmu_intr_gen",
 	.reg_bits = 32,
@@ -133,6 +141,7 @@ static const struct of_device_id exynos_pmu_of_device_ids[] = {
 		.compatible = "samsung,exynos7-pmu",
 	}, {
 		.compatible = "samsung,exynos850-pmu",
+		.data = &exynos850_pmu_data,
 	},
 	{ /*sentinel*/ },
 };
@@ -480,6 +489,21 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 		ret = of_syscon_register_regmap(dev->of_node, regmap);
 		if (ret)
 			return ret;
+	/*
+	 * For SoCs that support cpuhotplug/cpuidle via PMU updates callbacks.
+	 * Such callbacks are executed under raw_spinlock so we need a custom
+	 * regmap too.
+	 */
+	} else if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_cpuhp) {
+		regmap = devm_regmap_init_mmio(dev, pmu_base_addr, &regmap_pmu);
+		if (IS_ERR(regmap))
+			return dev_err_probe(dev, PTR_ERR(regmap),
+					     "hotplug regmap init failed\n");
+
+		ret = of_syscon_register_regmap(dev->of_node, regmap);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to register hotplug regmap with syscon\n");
 	} else {
 		/* let syscon create mmio regmap */
 		regmap = syscon_node_to_regmap(dev->of_node);
diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
index 733e188fa2b1..4ecbf53cd4f7 100644
--- a/drivers/soc/samsung/exynos-pmu.h
+++ b/drivers/soc/samsung/exynos-pmu.h
@@ -104,6 +104,7 @@ extern const struct exynos_pmu_data exynos5250_pmu_data;
 extern const struct exynos_pmu_data exynos5420_pmu_data;
 #endif
 extern const struct exynos_pmu_data gs101_pmu_data;
+extern const struct exynos_pmu_data exynos850_pmu_data;
 
 extern void pmu_raw_writel(u32 val, u32 offset);
 extern u32 pmu_raw_readl(u32 offset);
diff --git a/drivers/soc/samsung/exynos850-pmu.c b/drivers/soc/samsung/exynos850-pmu.c
new file mode 100644
index 000000000000..0503c54d6363
--- /dev/null
+++ b/drivers/soc/samsung/exynos850-pmu.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2026 Linaro Ltd.
+ *
+ * Exynos850 PMU support
+ */
+
+#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+
+#include <linux/bits.h>
+#include <linux/printk.h>
+#include <linux/regmap.h>
+#include <linux/soc/samsung/exynos-pmu.h>
+#include <linux/soc/samsung/exynos-regs-pmu.h>
+#include <linux/topology.h>
+#include <asm/cputype.h>
+
+#include "exynos-pmu.h"
+
+static int exynos850_cpu_pmu_offline(struct exynos_pmu_context *pmu_context, unsigned int cpu)
+	__must_hold(&pmu_context->cpupm_lock)
+{
+	int cluster_id, core_id;
+	u32 reg, mask;
+
+	cluster_id = topology_cluster_id(cpu);
+	if (cluster_id < 0) {
+		pr_err_ratelimited("invalid cluster ID for cpu: %u\n", cpu);
+		return -EINVAL;
+	}
+
+	core_id = topology_core_id(cpu);
+	if (core_id < 0) {
+		pr_err_ratelimited("invalid core ID for cpu: %u\n", cpu);
+		return -EINVAL;
+	}
+
+	/* set cpu inform hint */
+	regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpu), CPU_INFORM_C2);
+
+	mask = BIT(cpu);
+	regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
+			   mask, BIT(cpu));
+
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR, reg & mask);
+
+	mask = (BIT(cpu + 8));
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR, reg & mask);
+
+	regmap_update_bits(pmu_context->pmureg,
+			   EXYNOS850_CLUSTER_CPU_INT_EN(cluster_id, core_id), 1 << 3, 1 << 3);
+	return 0;
+}
+
+static int exynos850_cpu_pmu_online(struct exynos_pmu_context *pmu_context, unsigned int cpu)
+	__must_hold(&pmu_context->cpupm_lock)
+{
+	int cluster_id, core_id;
+	u32 reg, mask;
+
+	cluster_id = topology_cluster_id(cpu);
+	if (cluster_id < 0) {
+		pr_err_ratelimited("invalid cluster ID for cpu: %u\n", cpu);
+		return -EINVAL;
+	}
+
+	core_id = topology_core_id(cpu);
+	if (core_id < 0) {
+		pr_err_ratelimited("invalid core ID for cpu: %u\n", cpu);
+		return -EINVAL;
+	}
+
+	/* clear cpu inform hint */
+	regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpu), CPU_INFORM_CLEAR);
+
+	mask = BIT(cpu);
+	regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
+			   mask, (0 << cpu));
+
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_UPEND, &reg);
+
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_CLEAR, reg & mask);
+
+	regmap_update_bits(pmu_context->pmureg,
+			   EXYNOS850_CLUSTER_CPU_INT_EN(cluster_id, core_id), 1 << 3, 0 << 3);
+	return 0;
+}
+
+const struct exynos_pmu_data exynos850_pmu_data = {
+	.pmu_cpuhp = true,
+	.cpu_pmu_offline = exynos850_cpu_pmu_offline,
+	.cpu_pmu_online = exynos850_cpu_pmu_online,
+};
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index 9c4d3da41dbf..c7a82635fc36 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -1015,6 +1015,11 @@
 #define EXYNOS_GRP2_INTR_BID_UPEND				(0x0208)
 #define EXYNOS_GRP2_INTR_BID_CLEAR				(0x020c)
 
+/* Exynos850 PMU Alive */
+#define EXYNOS850_CPU_INFORM(cpu)		(0x0860 + ((cpu) & 7) * 4)
+#define EXYNOS850_CLUSTER_CPU_OFFSET(cl, cpu)	(0x1000 + (((cl) * 0x400) + ((cpu) * 0x80)))
+#define EXYNOS850_CLUSTER_CPU_INT_EN(cl, cpu)	(EXYNOS850_CLUSTER_CPU_OFFSET(cl, cpu) + 0x44)
+
 /* exynosautov920 */
 #define EXYNOSAUTOV920_PHY_CTRL_USB20				(0x0710)
 #define EXYNOSAUTOV920_PHY_CTRL_USB31				(0x0714)

-- 
2.51.0


