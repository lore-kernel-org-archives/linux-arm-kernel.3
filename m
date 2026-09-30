Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65943CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 00:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AWayRV+M2nmWV9WiEW+wquJLc2CmKvyn0XFf7Vowoo=; b=3ONJQYUBh+WZOmLSIbbZAQZ1Ow
	NYGQtA/1V0do2ytzHF7wSZ58xvC16zfLa866iPGYsXqFzlnMOftpR8l3+65kbBiml/3Q1hBoA0STV
	5Xd+FCYEgGiOijG2dMZKfu/CKwcBnPo7hZiZWmKZTAp3usd2P1q2BUaZ0CsUtLLbFKHtgo2g5ljbd
	MxeDUQAYyOyberQnDhGMtDuKZZcQHzA1BMpLmDCIHwtZ9fCg4mGA4iSBGhEaBfLMgO+NHvoW20JWs
	srFBO4HQvtyPUQdHeD97XccCitxKtx8ViZLfWzzKPyAXCWGZsdBQbMPCMo4rst/kuPSfHJrF5yBBN
	LB7U4/bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhwp-00000004nh0-1U0r;
	Wed, 30 Sep 2026 00:13:23 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhwg-00000004ndS-23jz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 00:13:15 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so28133245e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 17:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790727193; x=1791331993; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6AWayRV+M2nmWV9WiEW+wquJLc2CmKvyn0XFf7Vowoo=;
        b=YdAmgPdtnicn3GOPA+077v2dnsgKca7C+PPdQqgC7108IFWowIfOd3UQQzXAQXQygx
         oicH7MJl2KCVzSxxUVom19k03uvsNs0/ta8FsQHmmoxDbZcTnRDSp6SPHXIhBtKHpc11
         q5B4G4YPfQ8vC0DbwSFcAzjEQcrwfEGkQ09S/A5AjQT3d6qqhbB2GWPdKY5/jI9mwCuG
         CtWbNKFQWwcUf+b3bdmgEP+WDVrMx/mYDQfEegwE++coQdW2R1PNfYd/lCZo1SfM2GlR
         JWgmqv0YjC95G1ckdyGcQvApkTtP1EM3iWbmbbj32pB7GQG/WbtwWpl1SVwbh6cjuBaU
         uihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727193; x=1791331993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6AWayRV+M2nmWV9WiEW+wquJLc2CmKvyn0XFf7Vowoo=;
        b=XUlMdZKtu1kzjetfXk/9actkaFkMH/SgdyBCeCBDQ1UwhlXP9ivOHHFTkHtEK0vpzi
         J9zY9tTPvKvBlK0/EcJwotlcXlEpK4QyjyVy8LFUP7ODkjgNZwwnZC1I2ncvCvlyBK/b
         /mOwiijS+HpCsvJWfCJ5/L658cWa/ULEwhiHK4IG/ktd26YEm07I0zeN5cxI7Dnv6R9O
         rltoxgU9NNQJrY9aWTGFN1A5Gin2zhLZJ4ou+DmhwENGCPy4gepetYQH5jt93eZw6RJr
         PcAGtghAP5KFi7cX1n4umZw1EjJZEuPFR003W7Z5NR3eU3A1IFSjCkn7gMrJ5ev0Lvvg
         O8Pw==
X-Forwarded-Encrypted: i=1; AKwUvBydbpl4FcMud8aTFJqXcjy52mT+SVuKmZ3D4+53dQTL42lcFAaWw4R+kj6Ezu4Y/izt0nmod+991QnYg93brHgD@lists.infradead.org
X-Gm-Message-State: AFuF++kzcq0Sbwuim14MEfIWiA1cxgd/l9pC9jzsLMSc4TJfMyp1igaB
	EDzF5tA7dIGfmuSTeIrNzMdE83scXGG708DyAnUySyln3LrsdpHVb4d8mp2wgYIHt4I=
X-Gm-Gg: AYBFou3KKJWzjCm6rGjE/4lwJUTJeX9I535yAecB7SnzBOUVmZbGQvMRt91d8Cgun7O
	PnfoPyhaTjk+JIZC4dFETr9/kb0om9AvfDhyCE2XQr8OBLzFE5GJV4EuO2lqoXgXwg5IxHH6zPH
	49H/t1jUj4CzdQAcHG0xOfwTCuh7lGjSsfOleHYf793cmKnqFzXtV4jGPcDLLAqGl9aLkXKHbbA
	1vYEVB8wE+HagNcFYt9oqPv74Bi8nwPLtu3nrS0fylVh65WUiczfIMgxcgEptO+KpaT231osJ40
	xD+jRAfC/8UheuxnKnjNqiXWLmltcR6guqDFBGtmrmEBX/LQOuAhL65veYSkVFW1K0A8EvV10a6
	gWQNIV2haPs9gd1E/Dvr9j4/44Z09cS2Vbc0XTH9iq2OUzXBGWIOGjEdamf44Uk4Fiw91qMDzlE
	s+xCsKf7DFZKv1x4M9isjnt+75IrFjrws7RNR+bMG6qlUDgtsMF87LjWEkrQDTPbp0lxaQ7UCSp
	HaBjvVLFQ/QEOISvzH9X9jCQ4pkl+eJnOJVnXyzhcRYcf0S83HnGS8eN//q0g==
X-Received: by 2002:a05:600c:1d0a:b0:49d:29ab:540b with SMTP id 5b1f17b1804b1-4a01502312dmr10165745e9.15.1790727192856;
        Tue, 29 Sep 2026 17:13:12 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a89ffasm6320635e9.1.2026.09.29.17.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 17:13:12 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 30 Sep 2026 01:12:58 +0100
Subject: [PATCH v7 3/6] soc: samsung: exynos-pmu: generalise gs101-specific
 cpu{idle,hotplug} for Exynos SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-exynos850-cpuhotplug-v7-3-203245826333@linaro.org>
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
X-CRM114-CacheID: sfid-20260929_171314_718053_F35D373F 
X-CRM114-Status: GOOD (  28.43  )
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
 drivers/soc/samsung/exynos-pmu.c            | 125 ++++++----------------------
 drivers/soc/samsung/exynos-pmu.h            |  33 ++++++++
 drivers/soc/samsung/gs101-pmu.c             |  51 ++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |  10 +--
 4 files changed, 114 insertions(+), 105 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index c764f35fbfc2..9efaaf4696cf 100644
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
@@ -221,44 +203,8 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
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
-	unsigned int cpuhint = smp_processor_id();
-	u32 reg, mask;
-
-	/* clear cpu inform hint */
-	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
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
 
@@ -270,20 +216,20 @@ static int gs101_cpu_pmu_online(void)
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
@@ -294,35 +240,8 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
 	return 0;
 }
 
-/* Common function shared by both CPU hot plug and CPUIdle */
-static int __gs101_cpu_pmu_offline(unsigned int cpu)
-	__must_hold(&pmu_context->cpupm_lock)
-{
-	unsigned int cpuhint = smp_processor_id();
-	u32 reg, mask;
-
-	/* set cpu inform hint */
-	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
-		     CPU_INFORM_C2);
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
 
@@ -340,14 +259,14 @@ static int gs101_cpu_pmu_offline(void)
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
 
@@ -357,29 +276,29 @@ static int gs101_cpuhp_pmu_offline(unsigned int cpu)
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
@@ -417,6 +336,12 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 	void __iomem *virt_addr;
 	int ret, cpu;
 
+	if (!pmu_context->pmu_data->cpu_pmu_offline || !pmu_context->pmu_data->cpu_pmu_online) {
+		dev_warn(dev,
+			"PMU write/update sequence is not present for cpuhotplug and cpuidle\n");
+		return 0;
+	}
+
 	if (!intr_gen_node) {
 		/*
 		 * To maintain support for older DTs that didn't specify syscon
@@ -457,28 +382,28 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 
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
 		goto clean_cpuhp_state_prepare;
 
 	pmu_context->cpuhp_online_state = ret;
 
 	/* register CPU PM notifiers for cpuidle */
-	ret = cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
+	ret = cpu_pm_register_notifier(&exynos_cpu_pm_notifier);
 	if (ret)
 		goto clean_cpuhp_states;
 
@@ -487,7 +412,7 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 		/* Success */
 		return ret;
 
-	cpu_pm_unregister_notifier(&gs101_cpu_pm_notifier);
+	cpu_pm_unregister_notifier(&exynos_cpu_pm_notifier);
 
 clean_cpuhp_states:
 	cpuhp_remove_state(pmu_context->cpuhp_online_state);
@@ -502,7 +427,7 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 
 static void destroy_cpuhp_and_cpuidle(void)
 {
-	cpu_pm_unregister_notifier(&gs101_cpu_pm_notifier);
+	cpu_pm_unregister_notifier(&exynos_cpu_pm_notifier);
 	unregister_reboot_notifier(&exynos_cpupm_reboot_nb);
 
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
index 17dadc1b9c6e..ee7897eed20a 100644
--- a/drivers/soc/samsung/gs101-pmu.c
+++ b/drivers/soc/samsung/gs101-pmu.c
@@ -322,11 +322,62 @@ static const struct regmap_access_table gs101_pmu_wr_table = {
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
+	unsigned int cpuhint = smp_processor_id();
+	u32 reg, mask;
+
+	/* clear cpu inform hint */
+	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint), CPU_INFORM_CLEAR);
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
+	unsigned int cpuhint = smp_processor_id();
+	u32 reg, mask;
+
+	/* set cpu inform hint */
+	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint), CPU_INFORM_C2);
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


