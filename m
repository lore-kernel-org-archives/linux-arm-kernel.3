Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC21C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 23:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=voYlHvpwTH7yLEElXkjg86v5ueZmkGB5qg3f9f68cfQ=; b=Pr/VRVmpUStYLS3CtLvzzFLmDx
	2vaYWgbrmYU/GFFlww5xohu6FZ8R2RUOLrOfQkG79avuGoxRwy+SIZXZ4JbdtA2H0gQ5BfCHPuDDv
	uIn1SlQIcci75+zfUY4OSEtNK9Nlsgub6qEQ2tp3Wh+woSmDwR3wCXidP1OfHAx+LYmEQ/o5vQU+j
	hrp6TxUJK1ebggmZ/qLFHmdsr+lf1HTq2V4EPRzBcIgIruuMfDTgTGIqkU7SW23I8yZHRJMw3FcUa
	U8+XeQjeQKnlwm8r7hcIO/vA+KldKPRzmo0rZlFMfgjFdq/SPEYI4vT08/yaYpxvJaXXFZQCPux8v
	u4bvv+uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubT35-00000003aP4-2Z3T;
	Mon, 14 Jul 2025 23:57:31 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubS9K-00000003Scc-38ka
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 22:59:55 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-2e90e7f170eso5093654fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 15:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752533993; x=1753138793; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=voYlHvpwTH7yLEElXkjg86v5ueZmkGB5qg3f9f68cfQ=;
        b=SOVdqzK8AIX+gTA9170HXhZMce90ckuUl4WGdI8zKofVj5JsUcY2BAruQSIubdwKfX
         o1FcKr3w8894XKyCFHu03ZTFNB/AblQcJBxLOOmiOVxb1/hLB0/PhKV/F3/TxB4GvOzg
         +0+jdgpYZDFQIaenW9L6BFC2CcDuh2/5eipL21wV/5awJzu2mjwIUDRtn47dKLpa1Wak
         QYLnl8aDmx+k/AKIoifDd2OaZr8YEQxiT5pNoZN7CQewX8UD79i5sN5dBgAcZmRQEcKZ
         47M0/RLdG2U9iqFq1HFqUDA9BAePSXlImDKX1G28nkl2Z3eMHVNDRGmwhgPQFnr0i7Dm
         lqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533993; x=1753138793;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=voYlHvpwTH7yLEElXkjg86v5ueZmkGB5qg3f9f68cfQ=;
        b=fK790IhcjV8SDmWs0qbLx1uQ6XZ4LpSopWs8iuD9sftCElSs5Bz3d+II8YrXlPm6xN
         IPJVOlhM3zteSYE3dsTnnvLUiQG4aczyGjUNtMez9rIDikLGcsP1FQSzpAKTXMHzvr02
         u9q/ePIUxjNDTjyqmeWc7Df4LqZ/8lPRHulf6Iid7z9M1s3aquNPWP8qjcFlWILwH2CX
         ZPJqbn2QJJAl3+Ax3bPfLMsCHmSF4JCTMolKv9WNSO4yT1vN99CQx0VlU+tSCGC6FiBb
         Hq8Q6cL1ebjiZBzDwaR6TPC06AeiuhRdMP0J8xi898WsrKuwKeo0Fzq7ZTiGVfLripYB
         fiEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp1UfrPHewZ0zW28rtVnPQIoSgRiaTgQqOPTpRSyOBmxuW5FMxRhtuuQSA8xrHKyAuiP0UASAcs5vMwjUG4CnQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwNrRySAKDlIno/fqHTM/hoepgC5S7EFHhYFXLbhb5OJRR2j8S6
	LqtKDyARSQPIhpQWgHgd8n/vuxUX4zTUGnLaOGjxhL9QbRO5TmrRU/ex7dfWPSsSRl+BzmEpBIg
	ow3G/BFSQTx5sjqktnel7GYDI4g==
X-Google-Smtp-Source: AGHT+IFyjKpY6gj8sq7r2e0sKi7k90orxPelCVX5FgALt8z1+keOnkODjiBrRGtNHEoRbMyudRneuKQS88ohzUTsOQ==
X-Received: from oabqg13.prod.google.com ([2002:a05:6870:de0d:b0:2ef:de4a:3752])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:b60d:b0:2d5:25b6:ec14 with SMTP id 586e51a60fabf-2ff2b52e9f0mr8776215fac.15.1752533993205;
 Mon, 14 Jul 2025 15:59:53 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:59:16 +0000
In-Reply-To: <20250714225917.1396543-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250714225917.1396543-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714225917.1396543-23-coltonlewis@google.com>
Subject: [PATCH v4 22/23] KVM: arm64: Add ioctl to partition the PMU when supported
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
X-CRM114-CacheID: sfid-20250714_155954_798441_474A42D9 
X-CRM114-Status: GOOD (  23.12  )
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

Add KVM_ARM_PMU_PARTITION to enable the partitioned PMU for a given
vCPU. Add a corresponding KVM_CAP_ARM_PMU_PARTITION to check for this
ability. This capability is allowed on an initialized vCPU where PMUv3
and VHE are supported.

However, because the underlying ability relies on the driver being
passed some command line arguments to configure the hardware partition
at boot, enabling the partitioned PMU will not be allowed without the
underlying driver configuration even though the capability exists.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 Documentation/virt/kvm/api.rst   | 21 +++++++++++++++++++++
 arch/arm64/include/asm/kvm_pmu.h | 10 +++++++---
 arch/arm64/kvm/arm.c             | 20 ++++++++++++++++++++
 arch/arm64/kvm/pmu-direct.c      | 17 +++++++++++++++++
 include/uapi/linux/kvm.h         |  4 ++++
 5 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 4ef3d8482000..7e76f7c87598 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6478,6 +6478,27 @@ the capability to be present.
 
 `flags` must currently be zero.
 
+4.144 KVM_ARM_PARTITION_PMU
+---------------------------
+
+:Capability: KVM_CAP_ARM_PARTITION_PMU
+:Architectures: arm64
+:Type: vcpu ioctl
+:Parameters: arg[0] is a boolean to enable the partitioned PMU
+
+This API controls the PMU implementation used for VMs. The capability
+is only available if the host PMUv3 driver was configured for
+partitioning via the module parameters `arm-pmuv3.partition_pmu=y` and
+`arm-pmuv3.reserved_guest_counters=[0-$NR_COUNTERS]`. When enabled,
+VMs are configured to have direct hardware access to the most
+frequently used registers for the counters configured by the
+aforementioned module parameters, bypassing the KVM traps in the
+standard emulated PMU implementation and reducing overhead of any
+guest software that uses PMU capabilities such as `perf`.
+
+If the host driver was configured for partitioning but the partitioned
+PMU is disabled through this interface, the VM will use the legacy PMU
+that shares the host partition.
 
 .. _kvm_run:
 
diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 908e43416b50..c9d5fe325864 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -110,6 +110,8 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu);
 void kvm_pmu_load(struct kvm_vcpu *vcpu);
 void kvm_pmu_put(struct kvm_vcpu *vcpu);
 
+void kvm_vcpu_pmu_partition_enable(struct kvm_vcpu *vcpu, bool enable);
+
 #if !defined(__KVM_NVHE_HYPERVISOR__)
 bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
 bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu);
@@ -296,17 +298,17 @@ static inline bool kvm_pmu_counter_is_hyp(struct kvm_vcpu *vcpu, unsigned int id
 
 static inline void kvm_pmu_nested_transition(struct kvm_vcpu *vcpu) {}
 
-static inline bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
+static inline bool kvm_pmu_is_partitioned(void *)
 {
 	return false;
 }
 
-static inline u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu)
+static inline u64 kvm_pmu_host_counter_mask(void *)
 {
 	return ~0;
 }
 
-static inline u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
+static inline u64 kvm_pmu_guest_counter_mask(void *)
 {
 	return ~0;
 }
@@ -315,6 +317,8 @@ static inline void kvm_pmu_host_counters_enable(void) {}
 static inline void kvm_pmu_host_counters_disable(void) {}
 static inline void kvm_pmu_handle_guest_irq(u64 govf) {}
 
+static inline void kvm_vcpu_pmu_partition_enable(struct kvm_vcpu *vcpu, bool enable) {}
+
 #endif
 
 #endif
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 7c007ee44ecb..94274bee4e65 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -21,6 +21,7 @@
 #include <linux/irqbypass.h>
 #include <linux/sched/stat.h>
 #include <linux/psci.h>
+#include <linux/perf/arm_pmu.h>
 #include <trace/events/kvm.h>
 
 #define CREATE_TRACE_POINTS
@@ -38,6 +39,7 @@
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_nested.h>
+#include <asm/kvm_pmu.h>
 #include <asm/kvm_pkvm.h>
 #include <asm/kvm_pmu.h>
 #include <asm/kvm_ptrauth.h>
@@ -383,6 +385,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_PMU_V3:
 		r = kvm_supports_guest_pmuv3();
 		break;
+	case KVM_CAP_ARM_PARTITION_PMU:
+		r = kvm_pmu_partition_supported();
+		break;
 	case KVM_CAP_ARM_INJECT_SERROR_ESR:
 		r = cpus_have_final_cap(ARM64_HAS_RAS_EXTN);
 		break;
@@ -1810,6 +1815,21 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
 
 		return kvm_arm_vcpu_finalize(vcpu, what);
 	}
+	case KVM_ARM_PARTITION_PMU: {
+		bool enable;
+
+		if (unlikely(!kvm_vcpu_initialized(vcpu)))
+			return -ENOEXEC;
+
+		if (!kvm_pmu_is_partitioned(vcpu->kvm->arch.arm_pmu))
+			return -EPERM;
+
+		if (copy_from_user(&enable, argp, sizeof(enable)))
+			return -EFAULT;
+
+		kvm_vcpu_pmu_partition_enable(vcpu, enable);
+		return 0;
+	}
 	default:
 		r = -EINVAL;
 	}
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 80a3eb89fca1..04e7b6a1d749 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -56,6 +56,23 @@ bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
 		!kvm_pmu_regs_host_owned(vcpu);
 }
 
+/**
+ * kvm_vcpu_pmu_partition_enable() - Enable/disable partition flag
+ * @vcpu: Pointer to vcpu
+ * @enable: Whether to enable or disable
+ *
+ * If we want to enable the partition, the guest is free to grab
+ * hardware by accessing PMU registers. Otherwise, the host maintains
+ * control.
+ */
+void kvm_vcpu_pmu_partition_enable(struct kvm_vcpu *vcpu, bool enable)
+{
+	if (enable)
+		vcpu->arch.pmu.owner = VCPU_REGISTER_FREE;
+	else
+		vcpu->arch.pmu.owner = VCPU_REGISTER_HOST_OWNED;
+}
+
 /**
  * kvm_vcpu_pmu_use_fgt() - Determine if we can use FGT
  * @vcpu: Pointer to struct kvm_vcpu
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index c74cf8f73337..2f8a8d4cfe3c 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -935,6 +935,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_ARM_EL2_E2H0 241
 #define KVM_CAP_RISCV_MP_STATE_RESET 242
 #define KVM_CAP_GMEM_SHARED_MEM 243
+#define KVM_CAP_ARM_PARTITION_PMU 244
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
@@ -1413,6 +1414,9 @@ struct kvm_enc_region {
 #define KVM_GET_SREGS2             _IOR(KVMIO,  0xcc, struct kvm_sregs2)
 #define KVM_SET_SREGS2             _IOW(KVMIO,  0xcd, struct kvm_sregs2)
 
+/* Available with KVM_CAP_ARM_PARTITION_PMU */
+#define KVM_ARM_PARTITION_PMU	_IOWR(KVMIO, 0xce, bool)
+
 #define KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE    (1 << 0)
 #define KVM_DIRTY_LOG_INITIALLY_SET            (1 << 1)
 
-- 
2.50.0.727.gbf7dc18ff4-goog


