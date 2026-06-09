Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B205CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 17:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H27LqDJwCY7XJaNCfH23T1+ScdCIVPrY1W7RBnx0VL0=; b=OylijIQFD76Vy9txjVeQ9dNsG1
	w3UpXz8GEiAzGDldfzUsIGC9p3nDGaV4CAf0L8mCVZbuwQ7Tbjq1KML/ALmZnIygWwgRlwO2cpx33
	S7+It3saEcURqPfgM+xDwNNAuX+NX94ylUxCLiete/JidaK1MaF5NcQwtBP3QXVKYV2WqPIEsafSk
	IUEzUhu+WP3fvOifLVBnghYA+79JD2fc3GIzHGAWjksrJWihJpTDI0B1deKv71G6vgAk90mnZSA1v
	F9z4MpLPN4o1CvJ33bJHiI9H/3leoJU1LcHsGeJMe2bTdHW1d3eqbysSD2cLELeU2ZvnWvRUMv53x
	VACD/yhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0QR-000000068OT-0E81;
	Tue, 09 Jun 2026 17:39:43 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0QK-000000068KC-0o7o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 17:39:37 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso50061305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 10:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781026774; x=1781631574; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H27LqDJwCY7XJaNCfH23T1+ScdCIVPrY1W7RBnx0VL0=;
        b=GZLIRrQZDSzNk5GZicwU6RYqFPs+7fyWcwP6TzcXVuYu0uzh549p5nVL+RByXsYbDg
         BnDjFeSvPXupDwSsr8+lF3WimhFmpTkScuH+9M++Wo0bKte8tFE8yc0YVwfmzym1o5LV
         EcIbGF0IIJeY8l753WpgyRwq9pLZEEYqMaAVFIn5Ozq9G+ePctdWG9EvrdEL40muF9jw
         3QWebVrHBgL8C63AcndW9ZsbC7SzfciJ9Qs6dKglHa+MfQP0blL5z6nqupMREN47p5h+
         +Jv6ih3k6IHL77Kli3gRsxTZ1FO7kshMSeikWRbWGA1ICfGswVthvJrTqHFzzdwBuaDo
         9LSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026774; x=1781631574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H27LqDJwCY7XJaNCfH23T1+ScdCIVPrY1W7RBnx0VL0=;
        b=NEfyP6MskfqLx9De8uPGVCBjGDcJUsZdrmUNHNi4DY6Lteo8m/SwFN0/g5G/qQICH/
         K1fYPVcOFofPC4UISiWYOUzYw+oRljGm9jirgo4/5kj0bKZVWDkMqxTWnXCg04RaFfyV
         TVZrI6iksjWls0dl8an/3FQh0ft3tJbxkpDMib4Da/liykZb9T0iiio1F6T+72swL60q
         3kPj4+Djex5OZvMpZuqhQBcIj4oOagVOObhhQiLxVRv5VuyiphT7P63EGZueolz3qffK
         NbMh8F1G+dHNctN6SNwu+QHj1mqXe9GFh4aiBTdseQ8VNQDy+zsvD0KUHbyaJ8UrEO9o
         wufA==
X-Forwarded-Encrypted: i=1; AFNElJ8JrXek/8rWaaWNqBboaRBPk3V211ZYUtckLaeURa37i7GYLUqQ32F41dM1S2JzhegHdVV4xrPnI3aWiyGH7uPP@lists.infradead.org
X-Gm-Message-State: AOJu0YyZEXH9heL3uNmaplOA1pF79SJd+cvkpJZ9lzNOoxvAcWyBTglk
	K5NkvnEI1M/YKiWr34EHbqa/Et2HKzffqDVToMnf+Jlb8m9+09DJXYT0Is/9ZW0GyZ0=
X-Gm-Gg: Acq92OF+lut2sBoKg3tv8ggPkv1436H7FgVHIHaV2S/BZT4irc0yq73AVb/HRk51HHh
	vPTjyet49LOr557u28YWsfL90IDwttIW7lpcJg9ZAQEIBd0DsXAHFsJOT2SW2bKNlbTxhgQ0iVV
	MgGCVqha8IdGO1HYDcpFV82eVkgq9WPMfQN9WclrntKDHJc/W0r2fkUyHb6reePF/ZPUP5B28rc
	sRUicrDW9hX1vuU0jn3yJox14gC0Yk4jSdLvvcsl4WplPsP20c3ZwbzwmgdzH/5yTcMrfUiSzKv
	Xm1nlf8NmjZAlKtH/LrLkVqWOQ8M+d+MeAqVnAKdP1a/eSLGad0HYK+dgNFyf0i4MOzngjvW6Sv
	3ysXAV3Boytwz24ikiBYNIA4vAEPmswD2Ijhv61LCPHPUu68LcI0spcxLv/pg4XYG18/hV34HhL
	TvTl2nIw7Px3Sih+GscWBRNCYFDSkudPVWKUr1tSI/s4xEGScIouAdB0UXBpjymiKHfWIRphJbD
	DLJ7KHqZY96VmwP83nvwULHnKY=
X-Received: by 2002:a05:600c:6094:b0:490:4b89:5362 with SMTP id 5b1f17b1804b1-490c2609cecmr355839125e9.24.1781026774188;
        Tue, 09 Jun 2026 10:39:34 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fcf5bsm593605215e9.9.2026.06.09.10.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:39:33 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 09 Jun 2026 18:39:25 +0100
Subject: [PATCH v5 3/6] soc: samsung: exynos-pmu: generalise gs101-specific
 cpu{idle,hotplug} for Exynos SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-exynos850-cpuhotplug-v5-3-8422cf80d43b@linaro.org>
References: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
In-Reply-To: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_103936_446411_B2F69B1E 
X-CRM114-Status: GOOD (  27.56  )
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

The cpuhotplug and cpuidle support for GS101-based SoCs which
utilizes GS101 PMU interrupts generation block can be generalised
to be (re)used for other Exynos-based SoCs. Also, the GS101 PMU
interrupts generation block is not exclusive to Google GS101 SoCs
and should be made more Exynos-generic.

Specifically, apply the following changes:
- rename gs101-specific calls, structs, names to be exynos-prefixed;
- move exynos_pmu_context and CPU_INFORM_* defines into exynos-pmu.h;
- introduce cpu_pmu_{offline,online} callbacks in driver-specific
  exynos_pmu_data which can be used to hold PMU and PMU intr gen
  update routines for different platforms and update cpuidle and cpuhotplug
  support to use them;
- add checks for the presense of cpu_pmu_{offline,online} callbacks;
- move and rename gs101-specific cpu{offline,online} PMU updates
  routines into gs101-pmu.c file, also removing underscore prefix;
- update gs101_pmu_data to use newly introduced callbacks;
- rename PMU interrupts generation GS101_INTR_* regs to EXYNOS_INTR_*.

This allows other platforms to add cpuhotplug and cpuidle support in
a similar manner, using their own platform-specific PMU and
PMU intr gen update routines.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c            | 122 ++++++----------------------
 drivers/soc/samsung/exynos-pmu.h            |  33 ++++++++
 drivers/soc/samsung/gs101-pmu.c             |  49 +++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |  10 +--
 4 files changed, 112 insertions(+), 102 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 846313a28e9a..f170abe08ef1 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -24,24 +24,6 @@
 
 #include "exynos-pmu.h"
 
-struct exynos_pmu_context {
-	struct device *dev;
-	const struct exynos_pmu_data *pmu_data;
-	struct regmap *pmureg;
-	struct regmap *pmuintrgen;
-	/*
-	 * Serialization lock for CPU hot plug and cpuidle ACPM hint
-	 * programming. Also protects in_cpuhp, sys_insuspend & sys_inreboot
-	 * flags.
-	 */
-	raw_spinlock_t cpupm_lock;
-	unsigned long *in_cpuhp;
-	bool sys_insuspend;
-	bool sys_inreboot;
-	int cpuhp_prepare_state;
-	int cpuhp_online_state;
-};
-
 void __iomem *pmu_base_addr;
 static struct exynos_pmu_context *pmu_context;
 /* forward declaration */
@@ -221,43 +203,8 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
 
-/*
- * CPU_INFORM register "hint" values are required to be programmed in addition to
- * the standard PSCI calls to have functional CPU hotplug and CPU idle states.
- * This is required to workaround limitations in the el3mon/ACPM firmware.
- */
-#define CPU_INFORM_CLEAR	0
-#define CPU_INFORM_C2		1
-
-/*
- * __gs101_cpu_pmu_ prefix functions are common code shared by CPU PM notifiers
- * (CPUIdle) and CPU hotplug callbacks. Functions should be called with IRQs
- * disabled and cpupm_lock held.
- */
-static int __gs101_cpu_pmu_online(unsigned int cpu)
-	__must_hold(&pmu_context->cpupm_lock)
-{
-	u32 reg, mask;
-
-	/* clear cpu inform hint */
-	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu),
-		     CPU_INFORM_CLEAR);
-
-	mask = BIT(cpu);
-
-	regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_ENABLE,
-			   mask, (0 << cpu));
-
-	regmap_read(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_UPEND, &reg);
-
-	regmap_write(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_CLEAR,
-		     reg & mask);
-
-	return 0;
-}
-
 /* Called from CPU PM notifier (CPUIdle code path) with IRQs disabled */
-static int gs101_cpu_pmu_online(void)
+static int exynos_cpu_pmu_online(void)
 {
 	int cpu;
 
@@ -269,20 +216,20 @@ static int gs101_cpu_pmu_online(void)
 	}
 
 	cpu = smp_processor_id();
-	__gs101_cpu_pmu_online(cpu);
+	pmu_context->pmu_data->cpu_pmu_online(pmu_context, cpu);
 	raw_spin_unlock(&pmu_context->cpupm_lock);
 
 	return NOTIFY_OK;
 }
 
 /* Called from CPU hot plug callback with IRQs enabled */
-static int gs101_cpuhp_pmu_online(unsigned int cpu)
+static int exynos_cpuhp_pmu_online(unsigned int cpu)
 {
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&pmu_context->cpupm_lock, flags);
 
-	__gs101_cpu_pmu_online(cpu);
+	pmu_context->pmu_data->cpu_pmu_online(pmu_context, cpu);
 	/*
 	 * Mark this CPU as having finished the hotplug.
 	 * This means this CPU can now enter C2 idle state.
@@ -293,33 +240,8 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
 	return 0;
 }
 
-/* Common function shared by both CPU hot plug and CPUIdle */
-static int __gs101_cpu_pmu_offline(unsigned int cpu)
-	__must_hold(&pmu_context->cpupm_lock)
-{
-	u32 reg, mask;
-
-	/* set cpu inform hint */
-	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu), CPU_INFORM_C2);
-
-	mask = BIT(cpu);
-	regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_ENABLE,
-			   mask, BIT(cpu));
-
-	regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
-	regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
-		     reg & mask);
-
-	mask = (BIT(cpu + 8));
-	regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
-	regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
-		     reg & mask);
-
-	return 0;
-}
-
 /* Called from CPU PM notifier (CPUIdle code path) with IRQs disabled */
-static int gs101_cpu_pmu_offline(void)
+static int exynos_cpu_pmu_offline(void)
 {
 	int cpu;
 
@@ -337,14 +259,14 @@ static int gs101_cpu_pmu_offline(void)
 		return NOTIFY_OK;
 	}
 
-	__gs101_cpu_pmu_offline(cpu);
+	pmu_context->pmu_data->cpu_pmu_offline(pmu_context, cpu);
 	raw_spin_unlock(&pmu_context->cpupm_lock);
 
 	return NOTIFY_OK;
 }
 
 /* Called from CPU hot plug callback with IRQs enabled */
-static int gs101_cpuhp_pmu_offline(unsigned int cpu)
+static int exynos_cpuhp_pmu_offline(unsigned int cpu)
 {
 	unsigned long flags;
 
@@ -354,29 +276,29 @@ static int gs101_cpuhp_pmu_offline(unsigned int cpu)
 	 * ACPM the CPU entering hotplug should not enter C2 idle state.
 	 */
 	set_bit(cpu, pmu_context->in_cpuhp);
-	__gs101_cpu_pmu_offline(cpu);
+	pmu_context->pmu_data->cpu_pmu_offline(pmu_context, cpu);
 
 	raw_spin_unlock_irqrestore(&pmu_context->cpupm_lock, flags);
 
 	return 0;
 }
 
-static int gs101_cpu_pm_notify_callback(struct notifier_block *self,
+static int exynos_cpu_pm_notify_callback(struct notifier_block *self,
 					unsigned long action, void *v)
 {
 	switch (action) {
 	case CPU_PM_ENTER:
-		return gs101_cpu_pmu_offline();
+		return exynos_cpu_pmu_offline();
 
 	case CPU_PM_EXIT:
-		return gs101_cpu_pmu_online();
+		return exynos_cpu_pmu_online();
 	}
 
 	return NOTIFY_OK;
 }
 
-static struct notifier_block gs101_cpu_pm_notifier = {
-	.notifier_call = gs101_cpu_pm_notify_callback,
+static struct notifier_block exynos_cpu_pm_notifier = {
+	.notifier_call = exynos_cpu_pm_notify_callback,
 	/*
 	 * We want to be called first, as the ACPM hint and handshake is what
 	 * puts the CPU into C2.
@@ -408,7 +330,7 @@ static struct notifier_block exynos_cpupm_reboot_nb = {
 
 static void destroy_cpuhp_and_cpuidle(void)
 {
-	cpu_pm_unregister_notifier(&gs101_cpu_pm_notifier);
+	cpu_pm_unregister_notifier(&exynos_cpu_pm_notifier);
 	unregister_reboot_notifier(&exynos_cpupm_reboot_nb);
 
 	if (pmu_context->cpuhp_prepare_state != CPUHP_INVALID)
@@ -424,6 +346,12 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 	void __iomem *virt_addr;
 	int ret, cpu;
 
+	if (!pmu_context->pmu_data->cpu_pmu_offline || !pmu_context->pmu_data->cpu_pmu_online) {
+		dev_err(dev,
+			"PMU write/update sequence is not present for cpuhotplug and cpuidle\n");
+		return -ENODEV;
+	}
+
 	intr_gen_node = of_parse_phandle(dev->of_node,
 					 "google,pmu-intr-gen-syscon", 0);
 	if (!intr_gen_node) {
@@ -475,28 +403,28 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 
 	/* set PMU to power on */
 	for_each_online_cpu(cpu)
-		gs101_cpuhp_pmu_online(cpu);
+		exynos_cpuhp_pmu_online(cpu);
 
 	/* register CPU hotplug callbacks */
 	pmu_context->cpuhp_prepare_state = CPUHP_INVALID;
 	pmu_context->cpuhp_online_state = CPUHP_INVALID;
 
 	ret = cpuhp_setup_state(CPUHP_BP_PREPARE_DYN, "soc/exynos-pmu:prepare",
-				gs101_cpuhp_pmu_online, NULL);
+				exynos_cpuhp_pmu_online, NULL);
 	if (ret < 0)
 		return ret;
 
 	pmu_context->cpuhp_prepare_state = ret;
 
 	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:online",
-				NULL, gs101_cpuhp_pmu_offline);
+				NULL, exynos_cpuhp_pmu_offline);
 	if (ret < 0)
 		goto clean_cpuhp_states;
 
 	pmu_context->cpuhp_online_state = ret;
 
 	/* register CPU PM notifiers for cpuidle */
-	ret = cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
+	ret = cpu_pm_register_notifier(&exynos_cpu_pm_notifier);
 	if (ret)
 		goto clean_cpuhp_states;
 
@@ -505,7 +433,7 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 		/* Success */
 		return ret;
 
-	cpu_pm_unregister_notifier(&gs101_cpu_pm_notifier);
+	cpu_pm_unregister_notifier(&exynos_cpu_pm_notifier);
 
 clean_cpuhp_states:
 	if (pmu_context->cpuhp_prepare_state != CPUHP_INVALID)
diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
index fbe381e2a2e1..733e188fa2b1 100644
--- a/drivers/soc/samsung/exynos-pmu.h
+++ b/drivers/soc/samsung/exynos-pmu.h
@@ -13,6 +13,14 @@
 
 #define PMU_TABLE_END	(-1U)
 
+/*
+ * CPU_INFORM register "hint" values are required to be programmed in addition to
+ * the standard PSCI calls to have functional CPU hotplug and CPU idle states.
+ * This is required to workaround limitations in the el3mon/ACPM firmware.
+ */
+#define CPU_INFORM_CLEAR	0
+#define CPU_INFORM_C2		1
+
 struct regmap_access_table;
 
 struct exynos_pmu_conf {
@@ -20,6 +28,24 @@ struct exynos_pmu_conf {
 	u8 val[NUM_SYS_POWERDOWN];
 };
 
+struct exynos_pmu_context {
+	struct device *dev;
+	const struct exynos_pmu_data *pmu_data;
+	struct regmap *pmureg;
+	struct regmap *pmuintrgen;
+	/*
+	 * Serialization lock for CPU hot plug and cpuidle ACPM hint
+	 * programming. Also protects in_cpuhp, sys_insuspend & sys_inreboot
+	 * flags.
+	 */
+	raw_spinlock_t cpupm_lock;
+	unsigned long *in_cpuhp;
+	bool sys_insuspend;
+	bool sys_inreboot;
+	int cpuhp_prepare_state;
+	int cpuhp_online_state;
+};
+
 /**
  * struct exynos_pmu_data - of_device_id (match) data
  *
@@ -44,6 +70,10 @@ struct exynos_pmu_conf {
  *            used (i.e. when @pmu_secure is @true).
  * @wr_table: A table of writable register ranges in case a custom regmap is
  *            used (i.e. when @pmu_secure is @true).
+ * @cpu_pmu_offline: Optional callback to be called before entering CPU offline
+ *                   or idle state. Only valid when pmu_cpuhp set to true.
+ * @cpu_pmu_online: Optional callback to be called after CPU onlined or after
+ *                  exiting idle state. Only valid when pmu_cpuhp set to true.
  */
 struct exynos_pmu_data {
 	const struct exynos_pmu_conf *pmu_config;
@@ -57,6 +87,9 @@ struct exynos_pmu_data {
 
 	const struct regmap_access_table *rd_table;
 	const struct regmap_access_table *wr_table;
+
+	int (*cpu_pmu_offline)(struct exynos_pmu_context *pmu_context, unsigned int cpu);
+	int (*cpu_pmu_online)(struct exynos_pmu_context *pmu_context, unsigned int cpu);
 };
 
 extern void __iomem *pmu_base_addr;
diff --git a/drivers/soc/samsung/gs101-pmu.c b/drivers/soc/samsung/gs101-pmu.c
index 17dadc1b9c6e..ec75ff062ce0 100644
--- a/drivers/soc/samsung/gs101-pmu.c
+++ b/drivers/soc/samsung/gs101-pmu.c
@@ -322,11 +322,60 @@ static const struct regmap_access_table gs101_pmu_wr_table = {
 	.n_no_ranges = ARRAY_SIZE(gs101_pmu_ro_registers),
 };
 
+/*
+ * gs101_cpu_pmu_ prefix functions are common code shared by CPU PM notifiers
+ * (CPUIdle) and CPU hotplug callbacks. Functions should be called with IRQs
+ * disabled and cpupm_lock held.
+ */
+static int gs101_cpu_pmu_online(struct exynos_pmu_context *pmu_context, unsigned int cpu)
+	__must_hold(&pmu_context->cpupm_lock)
+{
+	u32 reg, mask;
+
+	/* clear cpu inform hint */
+	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu), CPU_INFORM_CLEAR);
+
+	mask = BIT(cpu);
+	regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
+			   mask, (0 << cpu));
+
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_UPEND, &reg);
+
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_CLEAR, reg & mask);
+
+	return 0;
+}
+
+/* Common function shared by both CPU hot plug and CPUIdle */
+static int gs101_cpu_pmu_offline(struct exynos_pmu_context *pmu_context, unsigned int cpu)
+	__must_hold(&pmu_context->cpupm_lock)
+{
+	u32 reg, mask;
+
+	/* set cpu inform hint */
+	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu), CPU_INFORM_C2);
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
+	return 0;
+}
+
 const struct exynos_pmu_data gs101_pmu_data = {
 	.pmu_secure = true,
 	.pmu_cpuhp = true,
 	.rd_table = &gs101_pmu_rd_table,
 	.wr_table = &gs101_pmu_wr_table,
+	.cpu_pmu_offline = gs101_cpu_pmu_offline,
+	.cpu_pmu_online = gs101_cpu_pmu_online,
 };
 
 /*
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index db8a7ca81080..9c4d3da41dbf 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -1009,11 +1009,11 @@
 #define GS101_PHY_CTRL_UFS                      0x3ec8
 
 /* PMU INTR GEN */
-#define GS101_GRP1_INTR_BID_UPEND				(0x0108)
-#define GS101_GRP1_INTR_BID_CLEAR				(0x010c)
-#define GS101_GRP2_INTR_BID_ENABLE				(0x0200)
-#define GS101_GRP2_INTR_BID_UPEND				(0x0208)
-#define GS101_GRP2_INTR_BID_CLEAR				(0x020c)
+#define EXYNOS_GRP1_INTR_BID_UPEND				(0x0108)
+#define EXYNOS_GRP1_INTR_BID_CLEAR				(0x010c)
+#define EXYNOS_GRP2_INTR_BID_ENABLE				(0x0200)
+#define EXYNOS_GRP2_INTR_BID_UPEND				(0x0208)
+#define EXYNOS_GRP2_INTR_BID_CLEAR				(0x020c)
 
 /* exynosautov920 */
 #define EXYNOSAUTOV920_PHY_CTRL_USB20				(0x0710)

-- 
2.51.0


