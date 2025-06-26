Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA68C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 22:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHvOqMg130dyJ4sC7dKVjeSNT/BBBCVrJwL/iamcsPo=; b=4irjDtnBle5QDwedTc84jY2W7o
	ZX5sb8hEOznFS/rd5vhgEueXwVhpttCld+4SYMF+bD26zQnon90gWLebeZ3fXZOEL6rkBGEsC0vdV
	Mdpk2g1T52mZbMV7gX2bPF6vF8R/1MtZJuozEl1ulZDipxgCEEPFU+k28SKgNoL2CasnAxQbiRf8H
	505xUHBDZF3SNtzfLBiFXgsCYcIwfzbhEXvJqE8v+DsJ4NEAZijcXOcwEzTTDsRwgpuoqKTGr8xvG
	YY3ksf9S2dRqiOBhcxk7iRTElOhbuZE0beF5ghdGBK2XrsOFaoQoHD0ClsCLeVeiSzgyqwmgb/f75
	C2+8sn8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUv5B-0000000CwCd-0cCK;
	Thu, 26 Jun 2025 22:28:37 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsrO-0000000CgrP-3FdT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:06:16 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3de0dc57859so16841755ab.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 13:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968373; x=1751573173; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sHvOqMg130dyJ4sC7dKVjeSNT/BBBCVrJwL/iamcsPo=;
        b=iIUP3GFUUK8ik/CV5ZSfJKy2JzEsfDgeMoIHaPSD67jgf7dLX6kG4+INDciJLscNVn
         cfsmPSP9e9KLzRaKgj4py0jqUnSno14d1P1tVHElkQ9YjzcCxHCUUPclsnbxrxGMkDF/
         NruZKhHq5Tje3hLinZ6MPx6wcTW3o/eetkWurGkTvEWm7bC8T/eABgAHDqYEF24skcqW
         UnPyDXnPYDKYM8c8fFB6qnLMgBiX2KPlis/nBTDbNDNETIR+P9a+pTjBsaDfLmhR5iPJ
         BbLlq57m9XH/G5VCt4B+DfIB+NmJMKfz+Prnm9TRIpcWkfZEovohr65hjdpZ0p5oL1lY
         eIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968373; x=1751573173;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sHvOqMg130dyJ4sC7dKVjeSNT/BBBCVrJwL/iamcsPo=;
        b=DtTOp0MTmPrNN2EwwYkR1ASlA8HlMqEiNhBb4yrDsnGookkTI5KBCpiG+FNlhWToZy
         IdLfME8jDxSAk2xnQ6rVI+7Jv4vbbK0osb6MOdzDMbH2/rMQRyMjaKQ75VsQknaeCSJL
         5Srqwz+ssSI4OhoVYnclDEvRZl2SNUpu+lYNEs/WdQwMcwYOwxZv5UyJbFi5pdtRFJGJ
         Ta2QIr2GAnS98j0LWeLD243ngdwutBpF0o7haWEE5/CX7Odc24ERtudkZNtJxg3VHKR1
         z365ull3exYZ2MgrjAwhkfB5G5s4mk9FtxmUpRLCRvxa+RUJAkCLo9SYNNqgIA+fL4YU
         mc9A==
X-Forwarded-Encrypted: i=1; AJvYcCVBbGJPUyZejVbSx3Lq2yu+JZkRsdnDKlV0RC6WLjpFteqpNvgeI58RduqwNCrQh1oXGp5jtkxsyb+OMurxX7y2@lists.infradead.org
X-Gm-Message-State: AOJu0YxXx4SI/zlaWi2ZQFZgbCAowcLQiXFGx+GJb+10YaUUci9OLdJL
	n1DkglvcD/oti7yCsbku7b3WbFhAfWFXGz8N/GI8TrYwENdHFESSwzE9eoUpftHhkLZmWJOX/+1
	QkMVi0N4PTmm3ma+e5FX4w9CuwA==
X-Google-Smtp-Source: AGHT+IFCTmpcPKfhbRYfbWmSV70zC3G54uswHvEuJzrqC5pwlW7LzTFUxkgmMX60c/miGwoG/j77iicLZrxALiS37Q==
X-Received: from ilbec6.prod.google.com ([2002:a05:6e02:4706:b0:3df:16fc:af6f])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1c23:b0:3dd:dd39:324c with SMTP id e9e14a558f8ab-3df4ab6d058mr11317385ab.9.1750968373400;
 Thu, 26 Jun 2025 13:06:13 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:57 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-22-coltonlewis@google.com>
Subject: [PATCH v3 21/22] KVM: arm64: Add ioctl to partition the PMU when supported
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
X-CRM114-CacheID: sfid-20250626_130614_818380_8E2F8C91 
X-CRM114-Status: GOOD (  22.15  )
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
 Documentation/virt/kvm/api.rst    | 21 +++++++++++++++++++++
 arch/arm64/include/asm/kvm_host.h |  3 +++
 arch/arm64/kvm/arm.c              | 20 ++++++++++++++++++++
 arch/arm64/kvm/pmu-part.c         |  3 ++-
 include/uapi/linux/kvm.h          |  4 ++++
 5 files changed, 50 insertions(+), 1 deletion(-)

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
 
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 2df76689381a..3f835b28c855 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -369,6 +369,9 @@ struct kvm_arch {
 	/* Maximum number of counters for the guest */
 	u8 nr_pmu_counters;
 
+	/* Whether this guest uses the partitioned PMU */
+	bool partitioned_pmu_enable;
+
 	/* Iterator for idreg debugfs */
 	u8	idreg_debugfs_iter;
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 7c007ee44ecb..cb4380f39d98 100644
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
+		vcpu->kvm->arch.partitioned_pmu_enable = enable;
+		return 0;
+	}
 	default:
 		r = -EINVAL;
 	}
diff --git a/arch/arm64/kvm/pmu-part.c b/arch/arm64/kvm/pmu-part.c
index 165d1eae2634..7b5c5fcc6623 100644
--- a/arch/arm64/kvm/pmu-part.c
+++ b/arch/arm64/kvm/pmu-part.c
@@ -53,7 +53,8 @@ bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
  */
 bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
 {
-	return kvm_pmu_is_partitioned(vcpu->kvm->arch.arm_pmu);
+	return kvm_pmu_is_partitioned(vcpu->kvm->arch.arm_pmu)
+		&& vcpu->kvm->arch.partitioned_pmu_enable;
 }
 
 /**
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


