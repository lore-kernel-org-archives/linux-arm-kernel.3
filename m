Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4D6C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dq7JupJfqupn6bj3Nl6z9Mq+cMEnqj9ECjf86JM2UFM=; b=EDMiJQR/DhhOCZCbOrgyWyrwYJ
	msFdtdN/oVefCVMEYjbdIpylXT5o+vuAbjtVvJ5xi5/buk7sQN30DGQmUKu+3nk/v/3dXYu4Xq5iQ
	35iApLwQwHBKQ9hbXlU/STuUBWKk+7f1vNOZUwcviA8Lu/G7PDaW3KpdE2M5qx6Ytgk/4NAExNF2w
	US4ORTaRfrYLS8yxykGWb/Grw+qv5NKO44yy9FVliLpE/aahasht7+bXXvU0LsQbh5SIuv6UEm7Qf
	+4zosyXHpa5d4dSS4Z8ySaQowCaxFSasScZA9sgW2R0QbpAAGdcJWlXjLt+OWNjvYbSFW3iVGKlC2
	4U2ntw2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tieaZ-0000000CLaJ-0Cor;
	Thu, 13 Feb 2025 19:09:31 +0000
Received: from mail-io1-xd49.google.com ([2607:f8b0:4864:20::d49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidaT-0000000C8gc-2Bg4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 18:05:22 +0000
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-8556ffa0a2eso1840439f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 10:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739469920; x=1740074720; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dq7JupJfqupn6bj3Nl6z9Mq+cMEnqj9ECjf86JM2UFM=;
        b=qOwDzjRel0hFMFo+mI3bZ5xy1P3kxF46Bf91XRfj0IhAcMZGoMX9bWO9Iw2IsdUPNH
         WW60zXeAimGRfWga9udT9e2AGExediyYZN8OyN7zU3ViHrIk2wfL3+ICeG6v8Kqr0yvR
         q/6MM8fhSUFPV/kVZMisumlBg6mVYCRLzkluEwHjcSCJNf0vpuQtzvSnqFUKvdBXhgKx
         IwMdMPzWyDk/n2oEY4EjijCIhRcXCC9ae6VsXbfvtJHynNNxqeexAEZ+8NlNFtyRuhLS
         H647hjbP8pECYxr4Bxh40qXG7uV4q5G4C9C8otJvUHKlTaA0voC+ymthohlFJf7NI+1e
         3jGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739469920; x=1740074720;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dq7JupJfqupn6bj3Nl6z9Mq+cMEnqj9ECjf86JM2UFM=;
        b=gRvS9B6DbGxEeej8G04RC1eSbOLixNrE29mtumH0kgy9DgoyuBF5A4EtrzrT7OmpAN
         duVLqmdMiRAdA1jLHZ3e6B6Ge4j+vo+5eclPEagOD0OylaRVkg2uk/ZrzZSvPhD3juJV
         UDzLFqKYrBeTeyzJ4PaTTj7vxxNJN3e9CfZIV4leLKcaVhScDoD0AQkl9hFHyxd1DBYr
         c1IvTPOPHJcDHjcmlPDmTt33Q1VDEZzO4K25pL/A62ky1o4b2UAnWZfqLw7Kc8kbIqBz
         N5w+trh3Svuuhw9ePQ0w1sMdNWAfRxLB8jTEx1Hnw1AX45Tuv4Z+JIaDwO5KYNrUxOeE
         EeVw==
X-Forwarded-Encrypted: i=1; AJvYcCWeLSKQeMQlv0cei+Mqu5xetKNRsB0xrXGS4A5QRA5IplDjVemhzNVVn2stsdyoynydNA1YjqOlyqWK4LJso+32@lists.infradead.org
X-Gm-Message-State: AOJu0YzxV1s/4WUGqMYQehWRIv6gDPpD/50GPXOhbeMMGGeWAbHaoou4
	tp1SX5a3F7VR2uhf8WpGuEhqGiWVhwDiVJ8ntg+JZIGoUsxGzQ5c30Tisyd3jiFTkxjuPhMSlfX
	OF+X6CCZ4tc2IfkGCjj/8ww==
X-Google-Smtp-Source: AGHT+IG9yUY19PrB7CUAP1YCyZmOUqmjAlpEtfXNoKRyP2K6BA/Dl/Zm7nJWWsMJ2WVwqa/OpSnedg/QppfMvmglxw==
X-Received: from ilbdz17.prod.google.com ([2002:a05:6e02:4411:b0:3d0:ebcd:cf64])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:3989:b0:3d0:618c:1b29 with SMTP id e9e14a558f8ab-3d18c2167e2mr43303965ab.5.1739469920127;
 Thu, 13 Feb 2025 10:05:20 -0800 (PST)
Date: Thu, 13 Feb 2025 18:03:14 +0000
In-Reply-To: <20250213180317.3205285-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250213180317.3205285-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250213180317.3205285-6-coltonlewis@google.com>
Subject: [RFC PATCH v3 5/8] KVM: arm64: Introduce module param to partition
 the PMU
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_100521_571613_9CE7FF0E 
X-CRM114-Status: GOOD (  24.24  )
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

For PMUv3, the register MDCR_EL2.HPMN partitiones the PMU counters
into two ranges where counters 0..HPMN-1 are accessible by EL1 and, if
allowed, EL0 while counters HPMN..N are only accessible by EL2.

Introduce a module parameter in KVM to set this register. The name
reserved_host_counters reflects the intent to reserve some counters
for the host so the guest may eventually be allowed direct access to a
subset of PMU functionality for increased performance.

Track HPMN and whether the pmu is partitioned in struct arm_pmu
because both KVM and the PMUv3 driver will need to know that to handle
guests correctly.

Due to the difficulty this feature would create for the driver running
at EL1 on the host, partitioning is only allowed in VHE mode. Working
on nVHE mode would require a hypercall for every register access
because the counters reserved for the host by HPMN are now only
accessible to EL2.

The parameter is only configurable at boot time. Making the parameter
configurable on a running system is dangerous due to the difficulty of
knowing for sure no counters are in use anywhere so it is safe to
reporgram HPMN.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_pmu.h |  4 +++
 arch/arm64/kvm/Makefile          |  2 +-
 arch/arm64/kvm/debug.c           |  9 ++++--
 arch/arm64/kvm/pmu-part.c        | 47 ++++++++++++++++++++++++++++++++
 arch/arm64/kvm/pmu.c             |  2 ++
 include/linux/perf/arm_pmu.h     |  2 ++
 6 files changed, 62 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/kvm/pmu-part.c

diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 613cddbdbdd8..174b7f376d95 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -22,6 +22,10 @@ bool kvm_set_pmuserenr(u64 val);
 void kvm_vcpu_pmu_resync_el0(void);
 void kvm_host_pmu_init(struct arm_pmu *pmu);
 
+u8 kvm_pmu_get_reserved_counters(void);
+u8 kvm_pmu_hpmn(u8 nr_counters);
+void kvm_pmu_partition(struct arm_pmu *pmu);
+
 #else
 
 static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr) {}
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 3cf7adb2b503..065a6b804c84 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -25,7 +25,7 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 	 vgic/vgic-mmio-v3.o vgic/vgic-kvm-device.o \
 	 vgic/vgic-its.o vgic/vgic-debug.o
 
-kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
+kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu-part.o pmu.o
 kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
 kvm-$(CONFIG_PTDUMP_STAGE2_DEBUGFS) += ptdump.o
 
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 7fb1d9e7180f..b5ac5a213877 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -31,15 +31,18 @@
  */
 static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 {
+	u8 counters = *host_data_ptr(nr_event_counters);
+	u8 hpmn = kvm_pmu_hpmn(counters);
+
 	preempt_disable();
 
 	/*
 	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
 	 * to disable guest access to the profiling and trace buffers
 	 */
-	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
-					 *host_data_ptr(nr_event_counters));
-	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
+	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN, hpmn);
+	vcpu->arch.mdcr_el2 |= (MDCR_EL2_HPMD |
+				MDCR_EL2_TPM |
 				MDCR_EL2_TPMS |
 				MDCR_EL2_TTRF |
 				MDCR_EL2_TPMCR |
diff --git a/arch/arm64/kvm/pmu-part.c b/arch/arm64/kvm/pmu-part.c
new file mode 100644
index 000000000000..e74fecc67e37
--- /dev/null
+++ b/arch/arm64/kvm/pmu-part.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Google LLC
+ * Author: Colton Lewis <coltonlewis@google.com>
+ */
+
+#include <linux/kvm_host.h>
+#include <linux/perf/arm_pmu.h>
+
+#include <asm/kvm_pmu.h>
+
+static u8 reserved_host_counters __read_mostly;
+
+module_param(reserved_host_counters, byte, 0);
+MODULE_PARM_DESC(reserved_host_counters,
+		 "Partition the PMU into host and guest counters");
+
+u8 kvm_pmu_get_reserved_counters(void)
+{
+	return reserved_host_counters;
+}
+
+u8 kvm_pmu_hpmn(u8 nr_counters)
+{
+	if (reserved_host_counters >= nr_counters) {
+		if (this_cpu_has_cap(ARM64_HAS_HPMN0))
+			return 0;
+
+		return 1;
+	}
+
+	return nr_counters - reserved_host_counters;
+}
+
+void kvm_pmu_partition(struct arm_pmu *pmu)
+{
+	u8 nr_counters = *host_data_ptr(nr_event_counters);
+	u8 hpmn = kvm_pmu_hpmn(nr_counters);
+
+	if (hpmn < nr_counters) {
+		pmu->hpmn = hpmn;
+		pmu->partitioned = true;
+	} else {
+		pmu->hpmn = nr_counters;
+		pmu->partitioned = false;
+	}
+}
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 85b5cb432c4f..7169c1a24dd6 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -243,6 +243,8 @@ void kvm_host_pmu_init(struct arm_pmu *pmu)
 	entry->arm_pmu = pmu;
 	list_add_tail(&entry->entry, &arm_pmus);
 
+	kvm_pmu_partition(pmu);
+
 	if (list_is_singular(&arm_pmus))
 		static_branch_enable(&kvm_arm_pmu_available);
 
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 35c3a85bee43..ee4fc2e26bff 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -125,6 +125,8 @@ struct arm_pmu {
 
 	/* Only to be used by ACPI probing code */
 	unsigned long acpi_cpuid;
+	u8		hpmn; /* MDCR_EL2.HPMN: counter partition pivot */
+	bool		partitioned;
 };
 
 #define to_arm_pmu(p) (container_of(p, struct arm_pmu, pmu))
-- 
2.48.1.601.g30ceb7b040-goog


