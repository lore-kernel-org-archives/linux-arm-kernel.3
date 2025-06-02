Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80844C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 19:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfOzyGcF07X0D5/1q7yTcK3OXDHh41vI4neiIUdQIqk=; b=LEhAiBr+YhXxKnm4gnsgh35D78
	006BAYNt8/Zq7IdJA3ofbNpuXT4hSBndhqceI7UGugwhIz3FrQaWRjwXcuYDWI+L2K20FcEeytwfc
	5szDTUI1XwysLMGhe60qfV8en6ASWinAHdHVGK/0G6B29TKCJeZWQlHkSQoU0K0l2wZISUiuSD9Pu
	KMVzDJ3MJpt8+Y/2/VhHgCYeAebOEP2ldg4HJKimpYuaIN8GpoAuvTWz9Hezzk1VdLTpw692YrX1C
	NaQttnm0wqZQhNrvFEUw4XZr+sZWjYiGiS0OjgGFLGMWr6iEKxljMIiInGYTA4haTnac7QKjROBDM
	+FONvVTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMB5b-00000008Zrb-42JC;
	Mon, 02 Jun 2025 19:44:55 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAqH-00000008UDl-1mwy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 19:29:06 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3ddb4a92e80so7583645ab.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 12:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748892543; x=1749497343; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UfOzyGcF07X0D5/1q7yTcK3OXDHh41vI4neiIUdQIqk=;
        b=TfE9sRAIwlnFd7iKzpXKDdA6GtDiCc5BpCII7uLdb+yJz9nxBiGtyAeZ5FZSDnGl42
         YncDrpjSpHu96gOWCLvJJKTIcjtbGZi2GkCz7C4f8UVZpRuY1XP4XmbZay/1pYQAdwtI
         b7xnBkHgVIW9ZnPApx6UV6vRqUYYb9vInbOmYvtWB39YaXY0WfbPH3vphhU5dUkTtqh2
         yzJ1teLTItF49+mdRSmw1sy18uaey7IGUN6a2PLxTU47aJKH2JfPIxFxZ2GqdSj0m4i6
         urAQBFGdcicPDjqGXWDpYREXbMrEvfPfaDR2BPHXzQ+gkJ7yeBtH32/mYHLlOIeUiSux
         2ZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892543; x=1749497343;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UfOzyGcF07X0D5/1q7yTcK3OXDHh41vI4neiIUdQIqk=;
        b=Hmhzrl6cP0zg1ZcZ5FSZXt64lEtEqTSt0LEjnx+dhDI8XIovr+4eFfcA9U1CEyVN7t
         Sczq/1hia/YyVWDVjTBmINPpTFOaw8J9zeaHb2NxIe5G9D8hDO6WWAycPqt5iPCtpDP6
         Df/5robhRM/7vFFWzuXFC6iND1RoNFbYSgFn4ktiC2Lkj94JYAm2+U/7AWMwkFEyXy3l
         aU4ywl3fFpiDKuBHXTVxmRSVgnUru8flr9QpyoBo+cgRfFxsgmF0NgkY1GpyB+2CC+hg
         61/gyjXGVtedGCxi5zFhHzjHuxD0awxuc45cAY8YJho45QwoaeMchU5i4BkAKgEu0420
         SvkA==
X-Forwarded-Encrypted: i=1; AJvYcCVB6ccsMXOzdeEKxAFVp6NrETZqz5sUhJ1fCpwbCs6l9vkaikHnHbJaOkrzLWJzQNAKW596fwLp0tP+rfWxWul/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/eLVrMn5SW6RzgeKPt7dVw8/XQLppjoXWa2QnEo5JAnYKlt3x
	Kk0pdyuyG+XMk5RqmEDwNka7q0+S/x7wzrEjwjtfNHXU1Q2pFB3FZaqLNfxGcxoTA+cng9RQygT
	fir0GdudQ7Azfx6pxOileLrjOPg==
X-Google-Smtp-Source: AGHT+IGL1Kilk+67ELLUvG6KC6loDyrfoWQqkbb+XKZg4pQuuZkVEStcuaIGbxa/s2Ca1gvii7S5wn+pWq8+i5pjCQ==
X-Received: from ilbbq5.prod.google.com ([2002:a05:6e02:2385:b0:3dd:7629:ec3a])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1fcd:b0:3dc:8423:5440 with SMTP id e9e14a558f8ab-3dd99b1383fmr148898625ab.0.1748892543626;
 Mon, 02 Jun 2025 12:29:03 -0700 (PDT)
Date: Mon,  2 Jun 2025 19:26:51 +0000
In-Reply-To: <20250602192702.2125115-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250602192702.2125115-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602192702.2125115-7-coltonlewis@google.com>
Subject: [PATCH 06/17] KVM: arm64: Introduce method to partition the PMU
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
X-CRM114-CacheID: sfid-20250602_122905_470954_100E0248 
X-CRM114-Status: GOOD (  32.50  )
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

For PMUv3, the register field MDCR_EL2.HPMN partitiones the PMU
counters into two ranges where counters 0..HPMN-1 are accessible by
EL1 and, if allowed, EL0 while counters HPMN..N are only accessible by
EL2.

Track HPMN and in a variable in struct arm_pmu because both KVM and
the PMUv3 driver will need to know that to handle guests
correctly. Introduce the function kvm_pmu_partition() to set this
variable and modify the PMU driver's cntr_mask of available counters
to exclude the counters being reserved for the guest. Finally, make
sure HPMN is set with this value when setting up the MDCR_EL2
register.

Create a module parameter reserved_host_counters to set a default
value. A more flexible uAPI will be added in a later commit.

Due to the difficulty this feature would create for the driver running
at EL1 on the host, partitioning is only allowed in VHE mode. Working
on nVHE mode would require a hypercall for every counter access in the
driver because the counters reserved for the host by HPMN are only
accessible to EL2.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_pmu.h |  19 +++++
 arch/arm64/kvm/Makefile          |   2 +-
 arch/arm64/kvm/debug.c           |   9 ++-
 arch/arm64/kvm/pmu-part.c        | 117 +++++++++++++++++++++++++++++++
 arch/arm64/kvm/pmu.c             |  13 ++++
 include/linux/perf/arm_pmu.h     |   1 +
 6 files changed, 157 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/kvm/pmu-part.c

diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 613cddbdbdd8..83b81e7829bf 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -22,6 +22,10 @@ bool kvm_set_pmuserenr(u64 val);
 void kvm_vcpu_pmu_resync_el0(void);
 void kvm_host_pmu_init(struct arm_pmu *pmu);
 
+bool kvm_pmu_partition_supported(void);
+u8 kvm_pmu_hpmn(u8 host_counters);
+int kvm_pmu_partition(struct arm_pmu *pmu, u8 host_counters);
+
 #else
 
 static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr) {}
@@ -33,6 +37,21 @@ static inline bool kvm_set_pmuserenr(u64 val)
 static inline void kvm_vcpu_pmu_resync_el0(void) {}
 static inline void kvm_host_pmu_init(struct arm_pmu *pmu) {}
 
+static inline bool kvm_pmu_partiton_supported(void)
+{
+	return false;
+}
+
+static inline u8 kvm_pmu_hpmn(u8 nr_counters)
+{
+	return -1;
+}
+
+static inline int kvm_pmu_partition(struct arm_pmu *pmu)
+{
+	return -EPERM;
+}
+
 #endif
 
 #endif
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 7c329e01c557..8161dfb123d7 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -25,7 +25,7 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 	 vgic/vgic-mmio-v3.o vgic/vgic-kvm-device.o \
 	 vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-v3-nested.o
 
-kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
+kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu-part.o pmu.o
 kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
 kvm-$(CONFIG_PTDUMP_STAGE2_DEBUGFS) += ptdump.o
 
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 7fb1d9e7180f..41746a498a45 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -9,6 +9,7 @@
 
 #include <linux/kvm_host.h>
 #include <linux/hw_breakpoint.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/perf/arm_pmuv3.h>
 
 #include <asm/debug-monitors.h>
@@ -31,15 +32,17 @@
  */
 static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 {
+	u8 hpmn = vcpu->kvm->arch.arm_pmu->hpmn;
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
index 000000000000..7252a58f085c
--- /dev/null
+++ b/arch/arm64/kvm/pmu-part.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Google LLC
+ * Author: Colton Lewis <coltonlewis@google.com>
+ */
+
+#include <linux/kvm_host.h>
+#include <linux/perf/arm_pmu.h>
+#include <linux/perf/arm_pmuv3.h>
+
+#include <asm/kvm_pmu.h>
+#include <asm/arm_pmuv3.h>
+
+/**
+ * kvm_pmu_reservation_is_valid() - Determine if reservation is allowed
+ * @host_counters: Number of host counters to reserve
+ *
+ * Determine if the number of host counters in the argument is
+ * allowed. It is allowed if it will produce a valid value for
+ * register field MDCR_EL2.HPMN.
+ *
+ * Return: True if reservation allowed, false otherwise
+ */
+static bool kvm_pmu_reservation_is_valid(u8 host_counters)
+{
+	u8 nr_counters = *host_data_ptr(nr_event_counters);
+
+	return host_counters < nr_counters ||
+		(host_counters == nr_counters
+		 && cpus_have_final_cap(ARM64_HAS_HPMN0));
+}
+
+/**
+ * kvm_pmu_hpmn() - Compute HPMN value
+ * @host_counters: Number of host counters to reserve
+ *
+ * This function computes the value of HPMN, the partition pivot
+ * value, such that counters 0..HPMN are reserved for the guest and
+ * counters HPMN..N are reserved for the host.
+ *
+ * If the requested @host_counters would create an invalid partition,
+ * return the value of HPMN that creates no partition.
+ *
+ * Return: Value of HPMN
+ */
+u8 kvm_pmu_hpmn(u8 host_counters)
+{
+	u8 nr_counters = *host_data_ptr(nr_event_counters);
+
+	if (likely(kvm_pmu_reservation_is_valid(host_counters)))
+		return nr_counters - host_counters;
+	else
+		return nr_counters;
+}
+
+/**
+ * kvm_pmu_partition_supported() - Determine if partitioning is possible
+ *
+ * Partitioning is only supported in VHE mode where we have PMUv3 and
+ * Fine Grain Traps (FGT).
+ *
+ * Return: True if partitioning is possible, false otherwise
+ */
+bool kvm_pmu_partition_supported(void)
+{
+	return has_vhe()
+		&& pmuv3_implemented(kvm_arm_pmu_get_pmuver_limit())
+		&& cpus_have_final_cap(ARM64_HAS_FGT);
+}
+
+/**
+ * kvm_pmu_partition() - Partition the PMU
+ * @pmu: Pointer to pmu being partitioned
+ * @host_counters: Number of host counters to reserve
+ *
+ * Partition the given PMU by taking a number of host counters to
+ * reserve and, if it is a valid reservation, recording the
+ * corresponding HPMN value in the hpmn field of the PMU and clearing
+ * the guest-reserved counters from the counter mask.
+ *
+ * Passing 0 for @host_counters has the effect of disabling partitioning.
+ *
+ * Return: 0 on success, -ERROR otherwise
+ */
+int kvm_pmu_partition(struct arm_pmu *pmu, u8 host_counters)
+{
+	u8 nr_counters;
+	u8 hpmn;
+
+	if (!kvm_pmu_reservation_is_valid(host_counters))
+		return -EINVAL;
+
+	nr_counters = *host_data_ptr(nr_event_counters);
+	hpmn = kvm_pmu_hpmn(host_counters);
+
+	if (hpmn < nr_counters) {
+		pmu->hpmn = hpmn;
+		/* Inform host driver of available counters */
+		bitmap_clear(pmu->cntr_mask, 0, hpmn);
+		bitmap_set(pmu->cntr_mask, hpmn, nr_counters);
+		clear_bit(ARMV8_PMU_CYCLE_IDX, pmu->cntr_mask);
+		if (pmuv3_has_icntr())
+			clear_bit(ARMV8_PMU_INSTR_IDX, pmu->cntr_mask);
+
+		kvm_debug("Partitioned PMU with HPMN %u", hpmn);
+	} else {
+		pmu->hpmn = nr_counters;
+		bitmap_set(pmu->cntr_mask, 0, nr_counters);
+		set_bit(ARMV8_PMU_CYCLE_IDX, pmu->cntr_mask);
+		if (pmuv3_has_icntr())
+			set_bit(ARMV8_PMU_INSTR_IDX, pmu->cntr_mask);
+
+		kvm_debug("Unpartitioned PMU");
+	}
+
+	return 0;
+}
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 4f0152e67ff3..2dcfac3ea9c6 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -15,6 +15,12 @@ static LIST_HEAD(arm_pmus);
 static DEFINE_MUTEX(arm_pmus_lock);
 static DEFINE_PER_CPU(struct kvm_pmu_events, kvm_pmu_events);
 
+static u8 reserved_host_counters __read_mostly;
+
+module_param(reserved_host_counters, byte, 0);
+MODULE_PARM_DESC(reserved_host_counters,
+		 "Partition the PMU into host and guest counters");
+
 #define kvm_arm_pmu_irq_initialized(v)	((v)->arch.pmu.irq_num >= VGIC_NR_SGIS)
 
 bool kvm_supports_guest_pmuv3(void)
@@ -239,6 +245,13 @@ void kvm_host_pmu_init(struct arm_pmu *pmu)
 	if (!pmuv3_implemented(kvm_arm_pmu_get_pmuver_limit()))
 		return;
 
+	if (reserved_host_counters) {
+		if (kvm_pmu_partition_supported())
+			WARN_ON(kvm_pmu_partition(pmu, reserved_host_counters));
+		else
+			kvm_err("PMU Partition is not supported");
+	}
+
 	guard(mutex)(&arm_pmus_lock);
 
 	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 1de206b09616..3843d66b7328 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -130,6 +130,7 @@ struct arm_pmu {
 
 	/* Only to be used by ACPI probing code */
 	unsigned long acpi_cpuid;
+	u8		hpmn; /* MDCR_EL2.HPMN: counter partition pivot */
 };
 
 #define to_arm_pmu(p) (container_of(p, struct arm_pmu, pmu))
-- 
2.49.0.1204.g71687c7c1d-goog


