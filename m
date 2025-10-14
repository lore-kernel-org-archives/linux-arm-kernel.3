Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D210ACCD185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 03:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0CkwtYJ00kWUx1+j2pAoMdQDJBRSeEDCDOjkRoM+EY=; b=SIQa7ElUBNm3g8R+BYnus1KsMm
	xd0Pg0S5cK0dc8f2DhO/f/tfvfzRQ4brB8fvgcjePRj5nlX1h42Bdd//LqxNdsF0pY8cyhFLqxpsg
	EMXjvMB8b5mLefGIkONux/ZhO7hMQCJboA95qmiVh4Wa2JuHsAjxOjDb0lwqwWG/vk81VV20+lNEg
	bQF63VRDaqasB2LNIae7BTHnaxmf+2wlQ5NQ3FyPByy1AMU54q64hyERW0k3fiGAqgr4hhZOzAvcb
	ttvqWD1b/C0RvzVIPIyM4yUrFw0jaQRDwxm17q2z+lzopfxhebgmc/WhvBC0xTKpa1cbEopN3OSsD
	5VDhU3Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VVJ-0000000F2Nd-1Qn1;
	Tue, 14 Oct 2025 03:15:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VVG-0000000F2LJ-1sSN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Oct 2025 03:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=U0CkwtYJ00kWUx1+j2pAoMdQDJBRSeEDCDOjkRoM+EY=; b=WbHbAVElM++LIx5WynhdeQi6+B
	uxmhqAavX8wkkt5uggzh+zrjIRclVLjyAZxcJp5Gqlic7Yc01rxN9/rpumbnxsrmLsVYWYkHcc11a
	YX5BGcitMLujlx23nZ6fLMk4D+OF+F11u5DCib4v0uBmpQ2mUch7w+tyY/em/907sT07N4r7O5sNN
	v0nYXGdnmNm/2gwO3HXVXi9jLWEXRsABoFYQ7zsYnn5Ku5Qpf/6+rN38/dJizfPhY8szKvjdEyMIa
	Qz3zDsREsQciMqKiPqgmNWNmkSGFSHkOiek6UvPxY1ous8jb0/rD5MnqcIqUzuPcEdn6N5J+YHkCA
	Zd9e9qyA==;
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VVC-00000004spu-3cEy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 03:15:09 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso4258466a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 20:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760411700; x=1761016500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0CkwtYJ00kWUx1+j2pAoMdQDJBRSeEDCDOjkRoM+EY=;
        b=c+t0XUMb1dGcNQzQ1LBhWQx2kLpRPZZtcVqINxOireTSAypyE64uFl3xB/+aZIe/2N
         gO0byRLYWKycvQNbR2ijtuLgJ8U7f/exRRuB/SwZMkHnYHFAi574GOxAr4ifS+4+xLWU
         gTxR41VN0BUPU+L3FOMk9zZ3ryZKB3IfhL6UEaSKQSz5F24hnvcjn2CaRzIIlSRAZGHS
         Mi7ytXmeaTWxNRC2Fq3PMO1pRgRAnTYGGk+sUSvFAsXXdxRAdglJgFxYpc9kNMjxtFml
         dxQOD2AVkyNOcS3zCHXy0VkD1FhshTXo7a5PYtOETfVDFD4Q8ZAp7wxbymiMPY0cuCV4
         x1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760411700; x=1761016500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0CkwtYJ00kWUx1+j2pAoMdQDJBRSeEDCDOjkRoM+EY=;
        b=RvsvnTQqo+vBFwwDs3nUehFgdbugoTUgjzcltkRZ/GcR7+BT1qINz8d29rBgQy3eUu
         XJm2P0z+iptSaLK88jwD8kn9ZLu55EkSIQYrEh5hAVpMYf1LXrrIieQSX4+IIGaQBA69
         Kxlll3lLtqzvC5VWMGEXs8WzOAsIGufX/A2L9DNsebiIuzSw8vM0zrbo3ZPj/ttjnT/g
         DzGBMSnYBesTfJuZFHDtT9fxNSw0+vZmBhmTknEC5H6ZWz9OjWMovch2AdSkEmdC5/lY
         O7BcAm1fktkmBYUeUa2KnYFd0FK3Hhc0vShm17hJeIBawbSTvTmenDEvUNzclLDzN7qy
         AeRg==
X-Forwarded-Encrypted: i=1; AJvYcCWEKrokRt4qzAMRwXCiIEgHuWLrGVi9a/gVNpvmW7QIQh9/MIPf9Qd3S8el7V3vKzAVXkBNwkUV18VaZozKl28J@lists.infradead.org
X-Gm-Message-State: AOJu0YwVy7Erx/2gBTQOgJb/KPfhlfVK37HDIqi1ql+vfjgvR8BvsqFj
	m4cRGRTVa/bQ7+B13pKrjZ9VIPUsUlSgJESTC8/dhGCBPMQYaqIBhuoD5VZgjDXUH5Q=
X-Gm-Gg: ASbGncuqBNHzNO03Z8CUhFcbH2bWR5q9NWKPJ6PFUJOnDnA+a2gbCij76FVKHaWsC2i
	2cSq3Yvs9HQM9T6/7m+g6dQNGk7/WUNrwA45i0cqRCjVn8B5CT98tX8l0Wh2YriN1FFZQPBCY/b
	ECoPzREQcW3DiXN2PLE7eWBxbAJY1MCNBzFyJ/CkeL/NWhXVMjNOduROKy4sKm9G33yVrk22DLX
	4MARZji11AR+pyaZW9RTgycUb0ejG+R84G+EXi8PVY2SWCeuslgUbug8S9QB/nrfK6TznEn7stn
	qQ+xfbGZaHWMpmQVYCCTMYdDp+XlW8jWybB0a7nz6gZsFDcE+Aaby353UrsCCN3gVkmEUAanYr1
	qLVpuPaWr+Gv2UGsI8cpoDpDfyKdLxO8GxPMdX4no922zYHWmsw4LlaX71qZaCq91aZ2OuzefeI
	0GfYeEt2xp6kOYvueB
X-Google-Smtp-Source: AGHT+IHuXcrJrrIrjll72fsxv4RHpCBmdn7Yx1Z4GmzqoA4/59E8YLw53tmhFZ/k1k4idVPxjl767A==
X-Received: by 2002:a17:903:94e:b0:290:55d5:41dd with SMTP id d9443c01a7336-29055d5427dmr141146545ad.5.1760411700144;
        Mon, 13 Oct 2025 20:15:00 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f3de4asm148315845ad.92.2025.10.13.20.14.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Oct 2025 20:14:59 -0700 (PDT)
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
Subject: [PATCH v4 1/2] watchdog: move arm64 watchdog_hld into common code
Date: Tue, 14 Oct 2025 11:14:24 +0800
Message-Id: <20251014031425.93284-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251014031425.93284-1-cuiyunhui@bytedance.com>
References: <20251014031425.93284-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_041507_501636_F4769D63 
X-CRM114-Status: GOOD (  25.27  )
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
index b5438ff4772ce..33072adc88332 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -231,6 +231,7 @@ config ARM64
 	select HAVE_GCC_PLUGINS
 	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && \
 		HW_PERF_EVENTS && HAVE_PERF_EVENTS_NMI
+	select WATCHDOG_PERF_ADJUST_PERIOD if HARDLOCKUP_DETECTOR_PERF && CPU_FREQ
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
index 5c310e803dd78..ca4e1d07b61cb 100644
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
@@ -696,10 +697,17 @@ static int armpmu_get_cpu_irq(struct arm_pmu *pmu, int cpu)
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
index 93c9a26492fcf..6b53fb453fd63 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -184,8 +184,6 @@ void kvm_host_pmu_init(struct arm_pmu *pmu);
 #define kvm_host_pmu_init(x)	do { } while(0)
 #endif
 
-bool arm_pmu_irq_is_nmi(void);
-
 /* Internal functions only for core arm_pmu code */
 struct arm_pmu *armpmu_alloc(void);
 void armpmu_free(struct arm_pmu *pmu);
diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index d3ca70e3c256a..a61e35fc9673e 100644
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
+__weak u64 hw_nmi_get_sample_period(int watchdog_thresh)
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
index 099abf128ce67..ceba3e28cb0d0 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1200,6 +1200,14 @@ config HARDLOCKUP_DETECTOR_PERF
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


