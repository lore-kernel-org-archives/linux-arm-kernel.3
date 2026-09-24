Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F30C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 18:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYFEpxoGGmna9mpp9QPIVq2tst2FuBotWNGHR3RNMBQ=; b=b5xA/Ydphve6P2g1XUXn8oPu1K
	i2UZz6R5h3JQfuGFwd5xNVPE3PCR7JgToqYZGUjqsS0FCLootcWWGsA8dCVVK/X8pI/sNpb2r274z
	/C0A9j7xlSZg+UWSGuxUyr0ZyQyMr/5zISHfISe0yIh3kuE8pzPOZaQ0y9OevN4jGkTEdpHViKWms
	Cyu2ZviCaC+NkWJyyt3PT9s8H1XIXrm0iPzPxGj4xjlO0AQ0CbZQ4kWSkABT6X8HBJN8iklcBdf6w
	X3jtcMajZ/YxOvp0M7vG/zuFk2myH4gTeZEI04K67qFAmLht4qStfIzL35EMKsAOnDF2D1hiNf4mv
	COHnPy6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGU-0000000Bjug-15M0;
	Thu, 24 Sep 2026 17:29:46 +0000
Received: from mail-oi1-x245.google.com ([2607:f8b0:4864:20::245])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGI-0000000Bjot-2rzN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:29:36 +0000
Received: by mail-oi1-x245.google.com with SMTP id 5614622812f47-4a45b3f0bdfso195294b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790270973; x=1790875773; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYFEpxoGGmna9mpp9QPIVq2tst2FuBotWNGHR3RNMBQ=;
        b=pGQoesHJW1ZCDzohpFSWKRwa2usqnipgrbI9+I+KhsqGb9fsmxFzHhTtiPysuH8cIt
         VeK3fCUQe5QXXmYRnx+OnNQw2qZRbHbfxkU+Sfpp22MyOewTeWZqc7M/8PyRus8ebVq/
         ee1aJaD3SKMaDnE0Y1+SEVeUYa+KJtaH8sxpncQ60j2ODs62f8mGQVp/AN5t54ZzUgEo
         rmfjLM2LC9sBbymhuzkZprHAsaickMmcuyjNuYgXFQ1UxiSA2EQYBDqkZWtSvZyeQot4
         IZe0M2APJlUmomp608YmzmiYpgjGSAb4CawzNs+593mB46gSkgrROwHd1zptVWtZjFfc
         A2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270973; x=1790875773;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RYFEpxoGGmna9mpp9QPIVq2tst2FuBotWNGHR3RNMBQ=;
        b=1weMtJFgxGtwxl7Hi1udJWtnYzPqujae8jYGQQbcVIKzZLFE5wzN2cUHPKfHXqf3/X
         H3NSy6YkMyJN00zK/pYuveV+WP68GOS4zVXeBNJTwm9BZOtLD4WGXMd9ixTDVlXbEoi4
         d/fGzsQCPx/vhh0in0cLNVRYtkRTZBqizCT9tV5quidhW6akzyCVOeFEleAsaej889jX
         6vfCLPWhkznsqaOxTqOuni2nabvvU45fBF9L5eMBn8Fcy/Z0vGeDYGIAewM/FXAeZwSk
         kL4QQ8yz9PQpRZEA3mh0B8+KeDhgRIv//zQlL9nMuXu32AwxU9EMSabnpTuuw7/KrnPC
         j9JA==
X-Forwarded-Encrypted: i=1; AKwUvBxi7oJayI7vfN5NdIrYouKk69kTMuhSVskeK8u/7qtOJq2uQLAnXN02LRMSgEfm9UQfJu2izUeBNCs3cluVSstG@lists.infradead.org
X-Gm-Message-State: AFuF++kz+PJJTzykDDjUm+umGhZoKGv2zBjaGkZI6518+djR/dJ2hIVh
	fg7eKQAyNhDhDX9f+lNB4WpzWES9KdQWeCtNvmrhjheAuZKextXvKEzIAEXE15hbI70Y3POwITJ
	yZ2nbXIq4K9BxVk24T4U+jRSeiw==
X-Received: from iloo5-n1.prod.google.com ([2002:a05:6e02:6105:10b0:509:e003:76d7])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:22a4:b0:4b3:3e1:4a25 with SMTP id 5614622812f47-4d728925895mr3587842b6e.11.1790270972821;
 Thu, 24 Sep 2026 10:29:32 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:08 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-3-coltonlewis@google.com>
Subject: [PATCH v9 02/22] KVM: arm64: Reorganize PMU includes
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Zide Chen <zide.chen@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_102934_849506_10ACB02F 
X-CRM114-Status: GOOD (  15.55  )
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

Including *all* of asm/kvm_host.h in asm/arm_pmuv3.h is a bad idea
because that is much more than arm_pmuv3.h logically needs and creates
a circular dependency that makes it easy to introduce compiler errors
when editing this code.

asm/kvm_host.h includes kvm/arm_pmu.h includes perf/arm_pmuv3.h
includes asm/arm_pmuv3.h includes asm/kvm_host.h

Reorganize the PMU includes to be more sane. In particular:

- Remove the circular dependency by removing the kvm_host.h include
  from asm/arm_pmuv3.h since 99% of it isn't needed.

- Move the remaining tiny bit of KVM/PMU interface from kvm_host.h
  into arm_pmu.h

- Conditionally on ARM64, include the more targeted arm_pmu.h directly
  in the arm_pmuv3.c driver.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/arm_pmuv3.h |  2 --
 arch/arm64/include/asm/kvm_host.h  | 14 --------------
 drivers/perf/arm_pmuv3.c           |  5 +++++
 include/kvm/arm_pmu.h              | 19 +++++++++++++++++++
 4 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 8a777dec8d88a..cf2b2212e00a2 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -6,8 +6,6 @@
 #ifndef __ASM_PMUV3_H
 #define __ASM_PMUV3_H
 
-#include <asm/kvm_host.h>
-
 #include <asm/cpufeature.h>
 #include <asm/sysreg.h>
 
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 27fe0cd5b2d7a..217c36af1ca51 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1467,25 +1467,11 @@ void kvm_arch_vcpu_ctxflush_fp(struct kvm_vcpu *vcpu);
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
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 03359e078301f..fbd631ec71a65 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -10,6 +10,11 @@
 
 #include <asm/cputype.h>
 #include <asm/irq_regs.h>
+
+#if defined(CONFIG_ARM64)
+#include <kvm/arm_pmu.h>
+#endif
+
 #include <asm/perf_event.h>
 #include <asm/virt.h>
 
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 6b4a118d17ca9..93f41ac77c25f 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -9,12 +9,22 @@
 
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmuv3.h>
+#include <linux/perf/arm_pmu.h>
 
 #define KVM_ARMV8_PMU_MAX_COUNTERS	32
 
 /* PPI #23 - architecturally specified for GICv5 */
 #define KVM_ARMV8_PMU_GICV5_IRQ		0x20000017
 
+#define kvm_pmu_counter_deferred(attr)			\
+	({						\
+		!has_vhe() && (attr)->exclude_host;	\
+	})
+
+struct kvm;
+struct kvm_device_attr;
+struct kvm_vcpu;
+
 #if IS_ENABLED(CONFIG_HW_PERF_EVENTS) && IS_ENABLED(CONFIG_KVM)
 struct kvm_pmc {
 	u8 idx;	/* index into the pmu->pmc array */
@@ -68,6 +78,9 @@ int kvm_arm_pmu_v3_has_attr(struct kvm_vcpu *vcpu,
 int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu);
 
 struct kvm_pmu_events *kvm_get_pmu_events(void);
+void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
+void kvm_clr_pmu_events(u64 clr);
+bool kvm_set_pmuserenr(u64 val);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_resync_el0(void);
@@ -165,6 +178,12 @@ static inline u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
 #define kvm_vcpu_has_pmu(vcpu)		({ false; })
 #define kvm_vcpu_has_pmuv3_strict(vcpu)	({ false; })
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
-- 
2.56.0.rc1.310.g51773c2048-goog


