Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2259EC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 22:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWHD159eEkEd2RVAASCwDxR2pqbhwMR1y9w3LokBHQQ=; b=qTODAe5LQlBjGv1Dq9atvfXRje
	455ju3DHSy7uf0pRUUiZis9R1mNzyC9XsS5jVp8ekzvxT17jOy6gEJfPjPZwAGL+gQIhDRY74MVyC
	V1VkHEnUNhx1VdiYd5CMp4iiSq3LkhJhtlfdTNy9G8menzSytFgnsyVi4vvXqAV34vfL9FFwy/+ex
	DurcwUU1Pgc3AQ/bp8ihDploGpQjBpmvxcX/JAKIV0Bds1h4MNDMhexc6I73rIY13updMG34dFoEP
	08lMvUt0ALjWwEFo1IMO6C8jRZh2OXQFvIVaFMB9csPJzfcUZH2RqSy+FPHkpGhfQPekr2Q8haU/r
	fgg6wcNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSkHY-0000000GkFN-3wGj;
	Fri, 20 Jun 2025 22:32:24 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSk4I-0000000Gh0A-0Zm0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 22:18:43 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-4067106dd65so691472b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 15:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457920; x=1751062720; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GWHD159eEkEd2RVAASCwDxR2pqbhwMR1y9w3LokBHQQ=;
        b=S7fumodLIApppeZg0hm5UlQO3LskeIhAIwXPjgBTRHQno+F+Zw8XTYBCB95bhOcwB9
         yjEVWw29zQMJ9r6uITRO/tBN7xtdccTUlu+Nic8G75vYMaGeZhXzW8r16diuznEVhEVn
         r1TFZ+f2NDKCf55dhqxXh18c3Ifr1DZbXexfSSHKlThcD7PDLyYTEOtg7+A7ULY84vNb
         /3pNZXVGosEE68bauTNZTmwUhfH9Wfj+fsSfEev4LbznkItE1Uboqeo/JVWzcsodaBnJ
         4XNsKjmcUhen4iEEnJA30clCxjkIQbJNqJeUCqDg01Ll8R38ZlOs6TonPFPfbzNINoXn
         A1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457920; x=1751062720;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GWHD159eEkEd2RVAASCwDxR2pqbhwMR1y9w3LokBHQQ=;
        b=ndARnXBjdCG7IMicSAotT7MDdyqFc9nS1Qqs4piBEHM5RUgJpL5Ij0rfm1U1jbKXLH
         Qe43Yjb0AjBVrNGDdBIZIFcqErN09BB6N6GD7kPmFnnVOw1orJE1zg+yrYuOToQhs2io
         iEEy4Ka7+mwPw0o7NF9iZuuTaVxY6kOpPL8jnwvGKmwn9RHC8JFGCpjtXA0HHBM/hWeB
         8OuqDYK73FDUjdF9S8CA5on2WFM013UkRY+0Eqs27hbJno+W9/vdNhDQVxCp6xI0iuYP
         m7rtA1i7ewe9jov4NP64o7nNdnqqyuQWzJtiSGW82TrtOzRWmvCjLXyX2m2DktDreTjh
         vtlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXFAiRdps+aXYN/DTugRIej2vNxQhrfsfw9Pn5Knc6uijkIpVkvSdm4IT1j272QiqnyqRTpFtO52rVfEEUKvOe@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt8aOq/BEqcUMaZLTxK5orRcaemxrROqGnV/4XzL4vNug7Bijy
	kSKVOGJzdwgwgk9uhn6w7r6MZ5lUbmjNrY4AEvP+9Jmcy/s2iHyRH8u3JrJ8XVSBQLi+ACjMJ+U
	wWbPdEVi0/BZkvb9eEiL2xyrqvQ==
X-Google-Smtp-Source: AGHT+IF2OKmMZlYWXREsJ8oFrgMGWLo7kWe5ClPilcLSMHKtRvIA2tl/nLM95GtmJ2ppZK9UqlnZUllLoCroliosBg==
X-Received: from oibko5.prod.google.com ([2002:a05:6808:6905:b0:407:ab9e:f086])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1584:b0:406:6fd3:ff18 with SMTP id 5614622812f47-40ac7141518mr3848175b6e.34.1750457920632;
 Fri, 20 Jun 2025 15:18:40 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:05 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-6-coltonlewis@google.com>
Subject: [PATCH v2 05/23] KVM: arm64: Cleanup PMU includes
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_151842_180291_C2B7CE6D 
X-CRM114-Status: GOOD (  17.50  )
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

From: Marc Zyngier <maz@kernel.org>

asm/kvm_host.h includes asm/arm_pmu.h which includes perf/arm_pmuv3.h
which includes asm/arm_pmuv3.h which includes asm/kvm_host.h This
causes compilation problems why trying to use anything defined in any
of the headers in any other headers.

Reorganize these tangled headers. In particular:

* Move the declarations defining the interface between KVM and PMU to
  its own header asm/kvm_pmu.h that can be used without the problem
  described above.

* Delete kvm/arm_pmu.h. These functions are mostly internal to KVM and
  should go in asm/kvm_host.h.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/arm_pmuv3.h      |  2 +-
 arch/arm64/include/asm/kvm_host.h       | 15 +--------------
 arch/arm64/include/asm/kvm_pmu.h        |  9 +++++++++
 arch/arm64/kvm/debug.c                  |  1 +
 arch/arm64/kvm/hyp/include/hyp/switch.h |  1 +
 arch/arm64/kvm/pmu-emul.c               |  4 +++-
 arch/arm64/kvm/pmu.c                    |  2 ++
 arch/arm64/kvm/sys_regs.c               |  1 +
 include/linux/perf/arm_pmu.h            | 14 ++++++++------
 virt/kvm/kvm_main.c                     |  1 +
 10 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 8a777dec8d88..32c003a7b810 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -6,7 +6,7 @@
 #ifndef __ASM_PMUV3_H
 #define __ASM_PMUV3_H
 
-#include <asm/kvm_host.h>
+#include <asm/kvm_pmu.h>
 
 #include <asm/cpufeature.h>
 #include <asm/sysreg.h>
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 27ed26bd4381..2df76689381a 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -14,6 +14,7 @@
 #include <linux/arm-smccc.h>
 #include <linux/bitmap.h>
 #include <linux/types.h>
+#include <linux/irq_work.h>
 #include <linux/jump_label.h>
 #include <linux/kvm_types.h>
 #include <linux/maple_tree.h>
@@ -1487,25 +1488,11 @@ void kvm_arch_vcpu_ctxflush_fp(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu);
 
-static inline bool kvm_pmu_counter_deferred(struct perf_event_attr *attr)
-{
-	return (!has_vhe() && attr->exclude_host);
-}
-
 #ifdef CONFIG_KVM
-void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
-void kvm_clr_pmu_events(u64 clr);
-bool kvm_set_pmuserenr(u64 val);
 void kvm_enable_trbe(void);
 void kvm_disable_trbe(void);
 void kvm_tracing_set_el1_configuration(u64 trfcr_while_in_guest);
 #else
-static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr) {}
-static inline void kvm_clr_pmu_events(u64 clr) {}
-static inline bool kvm_set_pmuserenr(u64 val)
-{
-	return false;
-}
 static inline void kvm_enable_trbe(void) {}
 static inline void kvm_disable_trbe(void) {}
 static inline void kvm_tracing_set_el1_configuration(u64 trfcr_while_in_guest) {}
diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index baf028d19dfc..a44f712668b5 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -14,6 +14,11 @@
 
 #define KVM_ARMV8_PMU_MAX_COUNTERS	32
 
+#define kvm_pmu_counter_deferred(attr)			\
+	({						\
+		!has_vhe() && (attr)->exclude_host;	\
+	})
+
 #if IS_ENABLED(CONFIG_HW_PERF_EVENTS) && IS_ENABLED(CONFIG_KVM)
 struct kvm_pmc {
 	u8 idx;	/* index into the pmu->pmc array */
@@ -68,9 +73,13 @@ int kvm_arm_pmu_v3_has_attr(struct kvm_vcpu *vcpu,
 int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu);
 
 struct kvm_pmu_events *kvm_get_pmu_events(void);
+void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
+void kvm_clr_pmu_events(u64 clr);
+bool kvm_set_pmuserenr(u64 val);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_resync_el0(void);
+void kvm_host_pmu_init(struct arm_pmu *pmu);
 
 #define kvm_vcpu_has_pmu(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 1a7dab333f55..a554c3e368dc 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -9,6 +9,7 @@
 
 #include <linux/kvm_host.h>
 #include <linux/hw_breakpoint.h>
+#include <linux/perf/arm_pmuv3.h>
 
 #include <asm/debug-monitors.h>
 #include <asm/kvm_asm.h>
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 7599844908c0..825b81749972 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -14,6 +14,7 @@
 #include <linux/kvm_host.h>
 #include <linux/types.h>
 #include <linux/jump_label.h>
+#include <linux/perf/arm_pmuv3.h>
 #include <uapi/linux/psci.h>
 
 #include <asm/barrier.h>
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index dcdd80ffd49d..b9882085394e 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -8,8 +8,8 @@
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
 #include <linux/list.h>
-#include <linux/perf_event.h>
 #include <linux/perf/arm_pmu.h>
+#include <linux/perf/arm_pmuv3.h>
 #include <linux/uaccess.h>
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_pmu.h>
@@ -24,6 +24,8 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc);
 static void kvm_pmu_release_perf_event(struct kvm_pmc *pmc);
 static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc);
 
+#define kvm_arm_pmu_irq_initialized(v)	((v)->arch.pmu.irq_num >= VGIC_NR_SGIS)
+
 bool kvm_supports_guest_pmuv3(void)
 {
 	guard(mutex)(&arm_pmus_lock);
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 6b48a3d16d0d..8bfc6b0a85f6 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -8,6 +8,8 @@
 #include <linux/perf/arm_pmu.h>
 #include <linux/perf/arm_pmuv3.h>
 
+#include <asm/kvm_pmu.h>
+
 static DEFINE_PER_CPU(struct kvm_pmu_events, kvm_pmu_events);
 
 /*
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 99fdbe174202..eaff6d63ef77 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -18,6 +18,7 @@
 #include <linux/printk.h>
 #include <linux/uaccess.h>
 #include <linux/irqchip/arm-gic-v3.h>
+#include <linux/perf/arm_pmuv3.h>
 
 #include <asm/arm_pmuv3.h>
 #include <asm/cacheflush.h>
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 6dc5e0cd76ca..1de206b09616 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -13,6 +13,9 @@
 #include <linux/platform_device.h>
 #include <linux/sysfs.h>
 #include <asm/cputype.h>
+#ifdef CONFIG_ARM64
+#include <asm/kvm_pmu.h>
+#endif
 
 #ifdef CONFIG_ARM_PMU
 
@@ -25,6 +28,11 @@
 #else
 #define ARMPMU_MAX_HWEVENTS		33
 #endif
+
+#ifdef CONFIG_ARM
+#define kvm_host_pmu_init(_x) { (void)_x; }
+#endif
+
 /*
  * ARM PMU hw_event flags
  */
@@ -170,12 +178,6 @@ int arm_pmu_acpi_probe(armpmu_init_fn init_fn);
 static inline int arm_pmu_acpi_probe(armpmu_init_fn init_fn) { return 0; }
 #endif
 
-#ifdef CONFIG_KVM
-void kvm_host_pmu_init(struct arm_pmu *pmu);
-#else
-#define kvm_host_pmu_init(x)	do { } while(0)
-#endif
-
 bool arm_pmu_irq_is_nmi(void);
 
 /* Internal functions only for core arm_pmu code */
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index e2f6344256ce..25259fcf3115 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -48,6 +48,7 @@
 #include <linux/lockdep.h>
 #include <linux/kthread.h>
 #include <linux/suspend.h>
+#include <linux/perf_event.h>
 
 #include <asm/processor.h>
 #include <asm/ioctl.h>
-- 
2.50.0.714.g196bf9f422-goog


