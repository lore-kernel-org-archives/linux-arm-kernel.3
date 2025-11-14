Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E878CDB480
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 03:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sy8ufhf77jyVm5UegRGiIo/nMsISXeDDGy6ne/zkAk8=; b=yJnu/Ot/6iHYUHg2QzjsdRgyV4
	WzhWG6m3q//emLsx6RVEOqjsUQsW8WKmXYUQBUn4ytg7KT4gKwcwASV+SBfl0r8uFPQXzY4Po48WV
	cNnTZXr2T0P6B0E8ytsA6CNHGU0meOuXuw5FFYOY8oNXS7+7/6aYL2MHcxRuoMFo0efrSraZC1F5M
	1GDeFMEigBTa3i9jzOPQhSFRh24nhqMp+QVTfA6MiPAKs9HjYolOVOr+o2ZW89caisSQmwx3r7EYR
	n8YVPnrpS14Up6HmbEJdJEpkLgCAqTx54jxnSeeM0D1Hn9IiPj7NzmdTmkFTzuye+QeTmJNn0Tx/g
	ZhwYlAwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkYd-0000000BU06-1LoN;
	Fri, 14 Nov 2025 03:33:07 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkYa-0000000BTzM-3WRW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 03:33:05 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2964d616df7so19928675ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 19:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1763091184; x=1763695984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sy8ufhf77jyVm5UegRGiIo/nMsISXeDDGy6ne/zkAk8=;
        b=XbOtrSfkkK0m0NPqkJ4Ia/i6x5o7oDqdEyxFI5pbY40sPmHIV4Eo0qFO39XEZcNebE
         6N5nBQILouCPYb5i98UREUSQPInculZkUvNWpwOw6UT3iDFlmcgb/ZXpuhz2Afkx07aA
         gGHLXuN8aqf9FLCXv99Zp+G62ElwiPh05fApn+UhaEVT0uhszqaoM7HhbNqvaFKwCkPk
         GpT9wsvBqTHTCobPavoWjGTpN4+9i69goAIRDDOPm8GZBs2FtmDISqVA88opmq38fpE1
         EZMyIRALf+wY/EhmOw4N7vVKQ0UrXMUR9BCQXgSBqDuEflTFGk0NKPfhobxK3QF/ZIcI
         VnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763091184; x=1763695984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sy8ufhf77jyVm5UegRGiIo/nMsISXeDDGy6ne/zkAk8=;
        b=cEPATt9ouEVA2NoPv3bP4o6wGCWt14LnugB/LsCT+n/RcBcwFUmljg3NX8CevDM9W/
         87KEuNB/VkrOuKtQUWSt2/eIw4sk2EB3/H3ZoV4QQyplZKzEpDDTqKCAGzlbx0+pfPaJ
         zlWE7PwK+fUgTerzkXzhGqknfw59ATim+5E6tLSgGxTkGUUoR34AjtSydzCGjyarns4u
         spMx5/KZKhlsLrPrZKLs9Olt0uHgfZ1HMCatVRhKIOgekeqnzem84Bj0FhrjBXrXkbO7
         xKQ7hx/Bdgx2iEShDdobg80Z+MT5USedNG7+DjaGfRsJBu4skTC0art5cdWE09l47sfL
         OO6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW84oB81jRThin0zT5g1J3eD7GG1e8cciWLSdnXKQPIQqt/ZnCw/ByUIcPkmwvgULSpZVjSx0ypvVO/K7HFDMq5@lists.infradead.org
X-Gm-Message-State: AOJu0YwQTHjHX3PElh6dlG/NwFTU4mmJ1r9dPoHfcxq/vj55YAyEp4H5
	+co8TwL8c0j4oAdPCgFpfLMfVsqE/naalgZ+1y7U7fx5zuvSMRKM9gkV2o4tX81sO1E=
X-Gm-Gg: ASbGncu/2pmYCz8XqDj9FJgzgv//+4OSp6HNqOnd9ynZu0F8FjhHHFitOB4R34lA+JZ
	cEj2gzQyQXArqgWSllHZ0rhF+oh8kEWrIYWfaZaIcwW/ngCEc+ofgd+XCtWUBaIz6B3akevCeuX
	Xg2z95ACQbEwIGUJBG57WDd+FosimZ0xrKw1IhqJLkD+R3pFQIwXpjSdCYWSQHfRDG6cIrqiU9n
	HymiZikxuPRyriE+5DYmc++U8P3Z8HO9wY+i0p7Zs5dIqw03ggHC5DAeeu5YbsWnHbq/6g4G9r8
	nYTqQqupzNqEq3dAy56Zvt/dFKtfuUpw5e7HUOgqLMotE+mohAR5TsG+xt62PDA0xNM7GdxVlRs
	FhZgIszl6WfkhbL2wItIrkJ0uOs5VDJhX7KRL+Ue1A2039QKylRFdh53B4R51IYTfWhI6TegvkN
	CiRT7X/PMvbqb3oVjMV1AIi5MmBUkHjQ==
X-Google-Smtp-Source: AGHT+IG/4zHUWKqxMS401ES7xnodSOwrmv3r2ygCcv3FlGsAoT4tVlnp649tXVNvhI8rAh9GPPmYqg==
X-Received: by 2002:a17:903:2b10:b0:297:d777:a2d4 with SMTP id d9443c01a7336-2986a752800mr15662975ad.46.1763091183808;
        Thu, 13 Nov 2025 19:33:03 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0bf0sm40334405ad.71.2025.11.13.19.32.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 13 Nov 2025 19:33:03 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	catalin.marinas@arm.com,
	cuiyunhui@bytedance.com,
	dianders@chromium.org,
	johannes@sipsolutions.net,
	lihuafei1@huawei.com,
	mark.rutland@arm.com,
	masahiroy@kernel.org,
	maz@kernel.org,
	mingo@kernel.org,
	nicolas.schier@linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	suzuki.poulose@arm.com,
	thorsten.blum@linux.dev,
	wangjinchao600@gmail.com,
	will@kernel.org,
	yangyicong@hisilicon.com,
	zhanjie9@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v6 1/2] watchdog: move arm64 watchdog_hld into common code
Date: Fri, 14 Nov 2025 11:32:42 +0800
Message-Id: <20251114033243.76509-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251114033243.76509-1-cuiyunhui@bytedance.com>
References: <20251114033243.76509-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_193304_890116_7FC0C4FD 
X-CRM114-Status: GOOD (  24.74  )
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

Move the contents of arch/arm64/watchdog_hld.c to kernel/watchdog_perf.c
to create a generic implementation that can be reused by other arch,
such as RISC-V.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 arch/arm64/Kconfig               |  1 +
 arch/arm64/kernel/Makefile       |  1 -
 arch/arm64/kernel/watchdog_hld.c | 94 --------------------------------
 drivers/perf/arm_pmu.c           | 10 +++-
 include/linux/perf/arm_pmu.h     |  2 -
 kernel/watchdog_perf.c           | 83 ++++++++++++++++++++++++++++
 lib/Kconfig.debug                |  8 +++
 7 files changed, 101 insertions(+), 98 deletions(-)
 delete mode 100644 arch/arm64/kernel/watchdog_hld.c

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 6663ffd23f252..6614ff45b1e06 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -231,6 +231,7 @@ config ARM64
 	select HAVE_GCC_PLUGINS
 	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && \
 		HW_PERF_EVENTS && HAVE_PERF_EVENTS_NMI
+	select WATCHDOG_PERF_ADJUST_PERIOD if HARDLOCKUP_DETECTOR_PERF
 	select HAVE_HW_BREAKPOINT if PERF_EVENTS
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_TIME_ACCOUNTING
diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index 76f32e424065e..12d77f373fea4 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -44,7 +44,6 @@ obj-$(CONFIG_KUSER_HELPERS)		+= kuser32.o
 obj-$(CONFIG_FUNCTION_TRACER)		+= ftrace.o entry-ftrace.o
 obj-$(CONFIG_MODULES)			+= module.o module-plts.o
 obj-$(CONFIG_PERF_EVENTS)		+= perf_regs.o perf_callchain.o
-obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF)	+= watchdog_hld.o
 obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
 obj-$(CONFIG_CPU_PM)			+= sleep.o suspend.o
 obj-$(CONFIG_KGDB)			+= kgdb.o
diff --git a/arch/arm64/kernel/watchdog_hld.c b/arch/arm64/kernel/watchdog_hld.c
deleted file mode 100644
index 3093037dcb7be..0000000000000
--- a/arch/arm64/kernel/watchdog_hld.c
+++ /dev/null
@@ -1,94 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/nmi.h>
-#include <linux/cpufreq.h>
-#include <linux/perf/arm_pmu.h>
-
-/*
- * Safe maximum CPU frequency in case a particular platform doesn't implement
- * cpufreq driver. Although, architecture doesn't put any restrictions on
- * maximum frequency but 5 GHz seems to be safe maximum given the available
- * Arm CPUs in the market which are clocked much less than 5 GHz. On the other
- * hand, we can't make it much higher as it would lead to a large hard-lockup
- * detection timeout on parts which are running slower (eg. 1GHz on
- * Developerbox) and doesn't possess a cpufreq driver.
- */
-#define SAFE_MAX_CPU_FREQ	5000000000UL // 5 GHz
-u64 hw_nmi_get_sample_period(int watchdog_thresh)
-{
-	unsigned int cpu = smp_processor_id();
-	unsigned long max_cpu_freq;
-
-	max_cpu_freq = cpufreq_get_hw_max_freq(cpu) * 1000UL;
-	if (!max_cpu_freq)
-		max_cpu_freq = SAFE_MAX_CPU_FREQ;
-
-	return (u64)max_cpu_freq * watchdog_thresh;
-}
-
-bool __init arch_perf_nmi_is_available(void)
-{
-	/*
-	 * hardlockup_detector_perf_init() will success even if Pseudo-NMI turns off,
-	 * however, the pmu interrupts will act like a normal interrupt instead of
-	 * NMI and the hardlockup detector would be broken.
-	 */
-	return arm_pmu_irq_is_nmi();
-}
-
-static int watchdog_perf_update_period(void *data)
-{
-	int cpu = smp_processor_id();
-	u64 max_cpu_freq, new_period;
-
-	max_cpu_freq = cpufreq_get_hw_max_freq(cpu) * 1000UL;
-	if (!max_cpu_freq)
-		return 0;
-
-	new_period = watchdog_thresh * max_cpu_freq;
-	hardlockup_detector_perf_adjust_period(new_period);
-
-	return 0;
-}
-
-static int watchdog_freq_notifier_callback(struct notifier_block *nb,
-					   unsigned long val, void *data)
-{
-	struct cpufreq_policy *policy = data;
-	int cpu;
-
-	if (val != CPUFREQ_CREATE_POLICY)
-		return NOTIFY_DONE;
-
-	/*
-	 * Let each online CPU related to the policy update the period by their
-	 * own. This will serialize with the framework on start/stop the lockup
-	 * detector (softlockup_{start,stop}_all) and avoid potential race
-	 * condition. Otherwise we may have below theoretical race condition:
-	 * (core 0/1 share the same policy)
-	 * [core 0]                      [core 1]
-	 *                               hardlockup_detector_event_create()
-	 *                                 hw_nmi_get_sample_period()
-	 * (cpufreq registered, notifier callback invoked)
-	 * watchdog_freq_notifier_callback()
-	 *   watchdog_perf_update_period()
-	 *   (since core 1's event's not yet created,
-	 *    the period is not set)
-	 *                                 perf_event_create_kernel_counter()
-	 *                                 (event's period is SAFE_MAX_CPU_FREQ)
-	 */
-	for_each_cpu(cpu, policy->cpus)
-		smp_call_on_cpu(cpu, watchdog_perf_update_period, NULL, false);
-
-	return NOTIFY_DONE;
-}
-
-static struct notifier_block watchdog_freq_notifier = {
-	.notifier_call = watchdog_freq_notifier_callback,
-};
-
-static int __init init_watchdog_freq_notifier(void)
-{
-	return cpufreq_register_notifier(&watchdog_freq_notifier,
-					 CPUFREQ_POLICY_NOTIFIER);
-}
-core_initcall(init_watchdog_freq_notifier);
diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 973a027d90639..294a5c3438ad1 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -17,6 +17,7 @@
 #include <linux/cpu_pm.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
+#include <linux/nmi.h>
 #include <linux/perf/arm_pmu.h>
 #include <linux/slab.h>
 #include <linux/sched/clock.h>
@@ -703,10 +704,17 @@ static int armpmu_get_cpu_irq(struct arm_pmu *pmu, int cpu)
 	return per_cpu(hw_events->irq, cpu);
 }
 
-bool arm_pmu_irq_is_nmi(void)
+#ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
+bool arch_perf_nmi_is_available(void)
 {
+	/*
+	 * watchdog_hardlockup_probe() will success even if Pseudo-NMI turns off,
+	 * however, the pmu interrupts will act like a normal interrupt instead of
+	 * NMI and the hardlockup detector would be broken.
+	 */
 	return has_nmi;
 }
+#endif
 
 /*
  * PMU hardware loses all context when a CPU goes offline.
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 52b37f7bdbf9e..8f06751f1e176 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -183,8 +183,6 @@ void kvm_host_pmu_init(struct arm_pmu *pmu);
 #define kvm_host_pmu_init(x)	do { } while(0)
 #endif
 
-bool arm_pmu_irq_is_nmi(void);
-
 /* Internal functions only for core arm_pmu code */
 struct arm_pmu *armpmu_alloc(void);
 void armpmu_free(struct arm_pmu *pmu);
diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index d3ca70e3c256a..8aa5e9a0ba20a 100644
--- a/kernel/watchdog_perf.c
+++ b/kernel/watchdog_perf.c
@@ -15,6 +15,7 @@
 #include <linux/panic.h>
 #include <linux/nmi.h>
 #include <linux/atomic.h>
+#include <linux/cpufreq.h>
 #include <linux/module.h>
 #include <linux/sched/debug.h>
 
@@ -306,3 +307,85 @@ void __init hardlockup_config_perf_event(const char *str)
 	wd_hw_attr.type = PERF_TYPE_RAW;
 	wd_hw_attr.config = config;
 }
+
+#ifdef CONFIG_WATCHDOG_PERF_ADJUST_PERIOD
+/*
+ * Safe maximum CPU frequency in case a particular platform doesn't implement
+ * cpufreq driver. Although, architecture doesn't put any restrictions on
+ * maximum frequency but 5 GHz seems to be safe maximum given the available
+ * CPUs in the market which are clocked much less than 5 GHz. On the other
+ * hand, we can't make it much higher as it would lead to a large hard-lockup
+ * detection timeout on parts which are running slower (eg. 1GHz on
+ * Developerbox) and doesn't possess a cpufreq driver.
+ */
+#define SAFE_MAX_CPU_FREQ	5000000000UL // 5 GHz
+u64 hw_nmi_get_sample_period(int watchdog_thresh)
+{
+	unsigned int cpu = smp_processor_id();
+	unsigned long max_cpu_freq;
+
+	max_cpu_freq = cpufreq_get_hw_max_freq(cpu) * 1000UL;
+	if (!max_cpu_freq)
+		max_cpu_freq = SAFE_MAX_CPU_FREQ;
+
+	return (u64)max_cpu_freq * watchdog_thresh;
+}
+
+static int watchdog_perf_update_period(void *data)
+{
+	int cpu = smp_processor_id();
+	u64 max_cpu_freq, new_period;
+
+	max_cpu_freq = cpufreq_get_hw_max_freq(cpu) * 1000UL;
+	if (!max_cpu_freq)
+		return 0;
+
+	new_period = watchdog_thresh * max_cpu_freq;
+	hardlockup_detector_perf_adjust_period(new_period);
+
+	return 0;
+}
+
+static int watchdog_freq_notifier_callback(struct notifier_block *nb,
+					   unsigned long val, void *data)
+{
+	struct cpufreq_policy *policy = data;
+	int cpu;
+
+	if (val != CPUFREQ_CREATE_POLICY)
+		return NOTIFY_DONE;
+
+	/*
+	 * Let each online CPU related to the policy update the period by their
+	 * own. This will serialize with the framework on start/stop the lockup
+	 * detector (softlockup_{start,stop}_all) and avoid potential race
+	 * condition. Otherwise we may have below theoretical race condition:
+	 * (core 0/1 share the same policy)
+	 * [core 0]                      [core 1]
+	 *                               hardlockup_detector_event_create()
+	 *                                 hw_nmi_get_sample_period()
+	 * (cpufreq registered, notifier callback invoked)
+	 * watchdog_freq_notifier_callback()
+	 *   watchdog_perf_update_period()
+	 *   (since core 1's event's not yet created,
+	 *    the period is not set)
+	 *                                 perf_event_create_kernel_counter()
+	 *                                 (event's period is SAFE_MAX_CPU_FREQ)
+	 */
+	for_each_cpu(cpu, policy->cpus)
+		smp_call_on_cpu(cpu, watchdog_perf_update_period, NULL, false);
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block watchdog_freq_notifier = {
+	.notifier_call = watchdog_freq_notifier_callback,
+};
+
+static int __init init_watchdog_freq_notifier(void)
+{
+	return cpufreq_register_notifier(&watchdog_freq_notifier,
+					 CPUFREQ_POLICY_NOTIFIER);
+}
+core_initcall(init_watchdog_freq_notifier);
+#endif
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2cbfa3dead0be..85fdfa9b52346 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1193,6 +1193,14 @@ config HARDLOCKUP_DETECTOR_PERF
 	depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
 	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
 
+config WATCHDOG_PERF_ADJUST_PERIOD
+	bool
+	help
+	  Adjust the watchdog hardlockup detector's period based on CPU max
+	  frequency. Uses cpufreq if available; falls back to a safe 5 GHz
+	  default otherwise. Registers a cpufreq notifier to update the period
+	  automatically.
+
 config HARDLOCKUP_DETECTOR_BUDDY
 	bool
 	depends on HARDLOCKUP_DETECTOR
-- 
2.39.5


