Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90336CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogvjFdajJu5uEleDwj80v3hZV9fH5TDAuXMS6jOc2pE=; b=t8HF1S1/i4UkwEjKmVnmeQ321e
	D7x+/mYeH9jYQkcZ0rdnRk8qYrifMdJB5e3m1owY8OOrUi8IfbWeuw5NYsb2UjYSB0wEVORY107+s
	3YtYFYCQ57RCJVg/XbfYKQZJSeMqhTUtG5J40/XaipwAmXAoC0tX3Db/ealUdxlTZ4jcXnsuPnLa3
	2OMnkp0IQrkUsjVTBNFZneOmjKT45sdZR8LXcxyU5m60OMTeFpAp495B0D7O8v+zWztcc2ip9aw8n
	sfvISJF/b+qrk8rEiQpIGW0mezMBJcTxzDFf/iMjwxAIVxIbB8k/4MFxsqKf6o6mL5B2uW8JEUa36
	LDPbfpLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE0P-0000000FB35-02QC;
	Wed, 27 Aug 2025 11:07:53 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urD6y-0000000Ezws-2FxG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:10:37 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-77057266dacso3668318b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 03:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756289436; x=1756894236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogvjFdajJu5uEleDwj80v3hZV9fH5TDAuXMS6jOc2pE=;
        b=VQjco4HnbH29+2+rVUU47BsA4TVRlj5P+kKtjcQaw9UQbM9rDVBgsjqVh39vnGw5w5
         hGiNfk/qycp9b/J7sNgU2ip1PP/+kNbv5YiVxTVx+Y1KbkEKk9WZ8Jpm0inP56QSS5HZ
         tG1ouUfFkdkWUCA2Ki+xeaB09h6FxQIVHIwl+kXhi12+T/9TSOVuqVpZUhIAWKm4LsU2
         FFF0CnBzrtl61LkqPaZ76Y9a/2ahzQT3U3MSUrnpMsiS0YisSfkNoB93u+UeN/MHynKj
         MO0I145VNWAp6gE6KqjRSVtD78d0ZAZ5hPbK+EE1AT5K2cL5a6YtQKiLsW7FUrsCiT6z
         TimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756289436; x=1756894236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogvjFdajJu5uEleDwj80v3hZV9fH5TDAuXMS6jOc2pE=;
        b=bb3jn6pmOm9TAP+Dn1HEK+7DznSV02FBbM8pC0fQ9XzZVhzLH1RfE/PYcKtsIEhXRs
         TXDJeBUVVUv1YhTDSnKlHLz7jOH/XplpWDGR2PNh/PlLEz5RBTIgtFMuZV98qubvBAN4
         9LZdAxkmMrlLFvfAvlSzNtugGT0m9HlCtG+U4tv8XImg+JQtqNMumaSqdyyLvoEfBmcm
         3ceS/Wb/g1HfcJI8NBPS/CpDUyAFi+u0P28IAdjy647n4glG83cw/w2l5MIX6m3o8xrL
         uxSylKA2gxYlbOtvD3pjOkBdZfyGMIcQMEwdSsjwinqqa0wyIUZoVeUDHBQa6CjreS7W
         2fLA==
X-Forwarded-Encrypted: i=1; AJvYcCVseovltDoewFZF4f0TZCG3dFGSE/z+EMvjI5i2et5T0Ggjv0jtyz97Jp74XkktVvu0yCMZsRXlzKv2wDbc9VVT@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi+onDn13W8bYdWhSALWXj8bFI7k4QsqazkdGfvtUoHgNXQTHX
	GFqRl7GpaqfVwUvh7maRkUFo1vQhgvn8XNmAVqFcgEvOnTD/FCb5E6YDIeciuYflBDI=
X-Gm-Gg: ASbGncv0k6GyIGUBcLcDNtiDbGwB+KhnNZ/5tq+G9Qcqe7avlzJ3xmEEkp+ferPCmxY
	KcqTIlZj0FFRw2TmA44iDInkRtvFbPrVr3xJAilwLcoSs+LvdiqJh8bzcmFTNc/MKmSt/H5gmYE
	5C8dXF+EWkgF4B8rYwGtPsjpj76oRObm79VMoe7RcgsqVClemnRI7ohq0lCb3j2Akoebq+QBeq1
	o/8YuhVyCRm668g0BBdzQfgP+1Pubcyf6/cpFWX90ZjSMAR7yQ1EfM68FzggVxVH+ssD3368IYj
	PQgcYLD17s0IoL5kkW8F5Sobo3UUmEPAh/XlTyaCBat+WJsRZvWZMOBAJ5upKGz+aBeaZYk+1Dz
	USEGiaCpnTpUHyu6jD0/fuC3GgXbF/ZUwTSG1HKXdtOjRYE6xlNtPJWOoVWAKWTJNnLPIln/TSg
	==
X-Google-Smtp-Source: AGHT+IGKq+xCbT38FLHdMDvm1hcp5EAcutLkJLn66CFHjFRgZpXlNTya/iJ1ORo8WxdEG7UC3P6/tQ==
X-Received: by 2002:a05:6a00:929d:b0:771:fbb0:b1cf with SMTP id d2e1a72fcca58-771fbb0b2b0mr7265480b3a.17.1756289429909;
        Wed, 27 Aug 2025 03:10:29 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm12813462b3a.79.2025.08.27.03.10.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 27 Aug 2025 03:10:29 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	anup@brainfault.org,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	catalin.marinas@arm.com,
	masahiroy@kernel.org,
	suzuki.poulose@arm.com,
	cuiyunhui@bytedance.com,
	maz@kernel.org,
	zhanjie9@hisilicon.com,
	yangyicong@hisilicon.com,
	dianders@chromium.org,
	mingo@kernel.org,
	lihuafei1@huawei.com,
	akpm@linux-foundation.org,
	jpoimboe@kernel.org,
	rppt@kernel.org,
	kees@kernel.org,
	thomas.weissschuh@linutronix.de
Subject: [PATCH 1/2] watchdog: refactor watchdog_hld functionality
Date: Wed, 27 Aug 2025 18:09:58 +0800
Message-Id: <20250827100959.83023-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250827100959.83023-1-cuiyunhui@bytedance.com>
References: <20250827100959.83023-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_031036_577934_F9089CE1 
X-CRM114-Status: GOOD (  11.97  )
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

Move watchdog_hld.c to kernel/, and rename arm_pmu_irq_is_nmi()
to arch_pmu_irq_is_nmi() for cross-arch reusability.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/arm64/kernel/Makefile                   | 1 -
 drivers/perf/arm_pmu.c                       | 2 +-
 include/linux/nmi.h                          | 1 +
 include/linux/perf/arm_pmu.h                 | 2 --
 kernel/Makefile                              | 2 +-
 {arch/arm64/kernel => kernel}/watchdog_hld.c | 8 ++++++--
 6 files changed, 9 insertions(+), 7 deletions(-)
 rename {arch/arm64/kernel => kernel}/watchdog_hld.c (97%)

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
diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 5c310e803dd78..4fd7f88d44543 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -696,7 +696,7 @@ static int armpmu_get_cpu_irq(struct arm_pmu *pmu, int cpu)
 	return per_cpu(hw_events->irq, cpu);
 }
 
-bool arm_pmu_irq_is_nmi(void)
+bool arch_pmu_irq_is_nmi(void)
 {
 	return has_nmi;
 }
diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index cf3c6ab408aac..c34bdc4f43f6d 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -207,6 +207,7 @@ static inline bool trigger_single_cpu_backtrace(int cpu)
 #ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
 u64 hw_nmi_get_sample_period(int watchdog_thresh);
 bool arch_perf_nmi_is_available(void);
+bool arch_pmu_irq_is_nmi(void);
 #endif
 
 #if defined(CONFIG_HARDLOCKUP_CHECK_TIMESTAMP) && \
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
diff --git a/kernel/Makefile b/kernel/Makefile
index c60623448235f..4ec7702b00aa1 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -101,7 +101,7 @@ obj-$(CONFIG_KGDB) += debug/
 obj-$(CONFIG_DETECT_HUNG_TASK) += hung_task.o
 obj-$(CONFIG_LOCKUP_DETECTOR) += watchdog.o
 obj-$(CONFIG_HARDLOCKUP_DETECTOR_BUDDY) += watchdog_buddy.o
-obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF) += watchdog_perf.o
+obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF) += watchdog_perf.o watchdog_hld.o
 obj-$(CONFIG_SECCOMP) += seccomp.o
 obj-$(CONFIG_RELAY) += relay.o
 obj-$(CONFIG_SYSCTL) += utsname_sysctl.o
diff --git a/arch/arm64/kernel/watchdog_hld.c b/kernel/watchdog_hld.c
similarity index 97%
rename from arch/arm64/kernel/watchdog_hld.c
rename to kernel/watchdog_hld.c
index 3093037dcb7be..f3864e604a6b5 100644
--- a/arch/arm64/kernel/watchdog_hld.c
+++ b/kernel/watchdog_hld.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/nmi.h>
 #include <linux/cpufreq.h>
-#include <linux/perf/arm_pmu.h>
 
 /*
  * Safe maximum CPU frequency in case a particular platform doesn't implement
@@ -25,6 +24,11 @@ u64 hw_nmi_get_sample_period(int watchdog_thresh)
 	return (u64)max_cpu_freq * watchdog_thresh;
 }
 
+__weak bool arch_pmu_irq_is_nmi(void)
+{
+	return false;
+}
+
 bool __init arch_perf_nmi_is_available(void)
 {
 	/*
@@ -32,7 +36,7 @@ bool __init arch_perf_nmi_is_available(void)
 	 * however, the pmu interrupts will act like a normal interrupt instead of
 	 * NMI and the hardlockup detector would be broken.
 	 */
-	return arm_pmu_irq_is_nmi();
+	return arch_pmu_irq_is_nmi();
 }
 
 static int watchdog_perf_update_period(void *data)
-- 
2.39.5


