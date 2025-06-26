Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3620C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 21:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRv3wKa2Rgdejn+APGtlkMboACuL4RazR5HzeTmIwac=; b=JabEeX8Cj6GuFdXS80aA6T0IPV
	t/QFTX+ZLblaCp/Rw6kkoavS6DGTUqh0+4UfbEe933gkRC9dqaRZgm+NjttHvSALE7a3gfAo5nyLP
	0OIyeS1lha8euuujZjEeadQTA+LLcKJbQ6+OHpgY5A7OlBYjUi3KTwny01pMnSCsLdgezJG+JXCk7
	ySscIHvTXun3A3Tw6knqWk369qMkmVUk3CTZlT8qCpRc/lKUcM6OX0RDZPfOiyIhQOsfVwD2JFVhz
	n04kwsjZsclFXvol650sFm+m2of5MlgvgZyy/yJFiRJ0vMfMe1edAFATO70+WSrW92EQCnMFYRrsr
	57U7IbTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUuT9-0000000Cs0E-2JBy;
	Thu, 26 Jun 2025 21:49:19 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsr7-0000000CgfU-0IbZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:05:59 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-86cf74e8b87so207389739f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 13:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968356; x=1751573156; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PRv3wKa2Rgdejn+APGtlkMboACuL4RazR5HzeTmIwac=;
        b=zh+reKInD0+Irzlik+XtnsbTrifOH4BShjCDOulUbOUjqs4B+xgBISDI42KWb0Oh4x
         kMb/ZqSUvVDrtuuxael22y94RbpmFOMun7HXAxLTGkox9HL5Ij/IY3Mf0vzzv9+FSfTt
         b3XZxLISx1Y/2ecfqZMFAT9ISILB+tfNIbzc/USgU84pLa2qYboXQvoI30Kb3CMyKrbR
         Bo1T2Zt2lZtA/HUQr37HJ100rIYmElyDdOLljvG+NV6ZfvK81itLBYYf/wxCF6LW/nxq
         Ygavj1NmJsLi/sDpzzbqNIwYPfsmip5Nx62GHHeSvjIvLaJYuUfscQhCUiZZ2JTWW1wE
         ovLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968356; x=1751573156;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PRv3wKa2Rgdejn+APGtlkMboACuL4RazR5HzeTmIwac=;
        b=VN2E/0IVvcsQXiCTmSFJje7fLSiAp9UhG8ntcAV6/axhEmzdkgCQHpK19DwoqpZWzh
         eIKSQuaxk5lQX1t9PHQH3XMYUsGczkRvTMWvSIhEwCJMvGAUHBIcMemxglFC1PJXJsKu
         qwl+4yLml+8a6Qa9mql4f8dismdMUKhvEUJBTJSwyCFrVrV9sXc5AlVjcDPeRu4zLFBp
         80mhX57B9zBFYuWo2Uax2XZXnOtvwq1LpW+6ZlpU+XoSkX/ixsVoWKk8nvaHt1wJkaHM
         0CrXiiQbm4XxkcrCX8aeymZ2yBFGCHjsLPRq5lHAHl22GwdJZr+gwk3BO10lgIpxuVfi
         kPrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV9AEhmr8S/G/8NxLqvmV6gedXj1UGZB7V71mPOsRWLSg6L77nFP+axbjdrllcSJxiJjT4PvosAZP8zdpKZ1av@lists.infradead.org
X-Gm-Message-State: AOJu0YwNBUqfwPbRZwOILSlxSYo5XNgr0Hl3K9GrRAWX1G2QMukq+eQi
	r00qQItjA4LXRKbpRM/mcBFcy5Itnj1bnrdVtgwFFRgSXV+9DLmBskYvqpsjSxSkkWKlSwL4+Td
	nZfntT2PI8o5zFJVXcNvN6F5daA==
X-Google-Smtp-Source: AGHT+IG65ARbJWB/ki57K8Y3eggnPaWo7RnX/DLSE7yaShoxZ2aPYQNL7voLM09Vn/2MpXgpwJ03tWhv2B8Hv2lH5g==
X-Received: from ilbeh24.prod.google.com ([2002:a05:6e02:4c18:b0:3df:41b8:3ac1])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a92:c241:0:b0:3dd:d321:79ab with SMTP id e9e14a558f8ab-3df4acbedbdmr12502385ab.18.1750968355585;
 Thu, 26 Jun 2025 13:05:55 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:40 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-5-coltonlewis@google.com>
Subject: [PATCH v3 04/22] KVM: arm64: Cleanup PMU includes
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_130557_111438_0CC2D1C5 
X-CRM114-Status: GOOD (  16.52  )
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

Reorganize these tangled headers.

* Respect the move defining the interface between KVM and PMU in its
  own header asm/kvm_pmu.h

* Define an empty struct arm_pmu so it is defined for those interface
  functions when compiling with CONFIG_KVM but not CONFIG_ARM_PMU

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/arm_pmuv3.h      |  2 +-
 arch/arm64/include/asm/kvm_host.h       | 15 +--------------
 arch/arm64/include/asm/kvm_pmu.h        | 15 +++++++++++++++
 arch/arm64/kvm/debug.c                  |  1 +
 arch/arm64/kvm/hyp/include/hyp/switch.h |  1 +
 arch/arm64/kvm/pmu.c                    |  2 ++
 arch/arm64/kvm/sys_regs.c               |  1 +
 include/linux/perf/arm_pmu.h            |  5 +++++
 virt/kvm/kvm_main.c                     |  1 +
 9 files changed, 28 insertions(+), 15 deletions(-)

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
index baf028d19dfc..ad3247b46838 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -11,9 +11,15 @@
 #include <linux/kvm_types.h>
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmuv3.h>
+#include <linux/perf/arm_pmu.h>
 
 #define KVM_ARMV8_PMU_MAX_COUNTERS	32
 
+#define kvm_pmu_counter_deferred(attr)			\
+	({						\
+		!has_vhe() && (attr)->exclude_host;	\
+	})
+
 #if IS_ENABLED(CONFIG_HW_PERF_EVENTS) && IS_ENABLED(CONFIG_KVM)
 struct kvm_pmc {
 	u8 idx;	/* index into the pmu->pmc array */
@@ -68,6 +74,9 @@ int kvm_arm_pmu_v3_has_attr(struct kvm_vcpu *vcpu,
 int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu);
 
 struct kvm_pmu_events *kvm_get_pmu_events(void);
+void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
+void kvm_clr_pmu_events(u64 clr);
+bool kvm_set_pmuserenr(u64 val);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_resync_el0(void);
@@ -161,6 +170,12 @@ static inline u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
 
 #define kvm_vcpu_has_pmu(vcpu)		({ false; })
 static inline void kvm_pmu_update_vcpu_events(struct kvm_vcpu *vcpu) {}
+static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr) {}
+static inline void kvm_clr_pmu_events(u64 clr) {}
+static inline bool kvm_set_pmuserenr(u64 val)
+{
+	return false;
+}
 static inline void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu) {}
 static inline void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu) {}
 static inline void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu) {}
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
index 6dc5e0cd76ca..fb382bcd4f4b 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -187,6 +187,11 @@ void armpmu_free_irq(int irq, int cpu);
 
 #define ARMV8_PMU_PDEV_NAME "armv8-pmu"
 
+#else
+
+struct arm_pmu {
+};
+
 #endif /* CONFIG_ARM_PMU */
 
 #define ARMV8_SPE_PDEV_NAME "arm,spe-v1"
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
2.50.0.727.gbf7dc18ff4-goog


