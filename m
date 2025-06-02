Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0163CC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 20:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcghHp9NHNnZagjNBq90Et1fDsToCSyQRDmWBaP4jq8=; b=AifOOJ372eSdGK8SznnOIwlsKI
	IXe4WkMzH88APBX1dQ4VmBkPZfSdlEXFUv8UeV7U4J5VM4BxrMrmUPpmCCBaFYjhzfZVPdQAy7xCU
	9T8kjEkL3iuIPuRNDSG+GZDwVI8rkuV7IJr2ZenLYY8X7yhqDBZy6WVlzKmJXK4GvCTW+8MPyER+x
	rGGyVV3bLm0Q1KW8UxwDeFTTAuFE3dUxYQjsyP9J6c6svgqhjEDd73DzqTx/J6aiz/yF1y+DD5RPp
	w8+JlC28b8U1BY2gqAUugDbQdg3Fky69Ty3vevvcJEWfM7+A3ta22HKKc+n/c/6bI2Io55UpKU6Ka
	kGgustbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMBRZ-00000008g76-1Pps;
	Mon, 02 Jun 2025 20:07:37 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAqR-00000008UNP-1m5Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 19:29:16 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3dda50c4072so24597965ab.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 12:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748892554; x=1749497354; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PcghHp9NHNnZagjNBq90Et1fDsToCSyQRDmWBaP4jq8=;
        b=fUVozlQFrubWVTtllJMs0Uub3d3w8wxi/02ui6pxut82/uh4T2buvtbaiEGjqvA3FD
         5o2Chv9hd9JrCagrGUZPHnY/mms75bGGne6b9rIpZ12EVPzKWG9I/C/+s8f0kXLnv/2G
         kTQBjenbKJARGFOFDJQ9Y0JDdtdPvA+KGfc1gNATF8A5mX7Oe2Drpp4b4mQD7UMf19rU
         Nou6cWv6x51om/NIaicfVmblE/UkErwmvyfn6D05L8qDWoGd0P37qkh3OJ2cxgx+5I8G
         JwpYjJF/EulUd+lSKqoDUB3/bBLumvg8GGSDjqawCcNPBdf68fwGFWL5ilbvHMpW6A/8
         S9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892554; x=1749497354;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PcghHp9NHNnZagjNBq90Et1fDsToCSyQRDmWBaP4jq8=;
        b=O0Gdvx8Cl4A1ZmIDBVCwiAIMAAIwGlbtFGBngMw6BqnEQYmgXhjGYZ03nmAW3nkamQ
         vs0yM+MZ/cDToO7T0ECfsNaVi2Eg4JjAmmW9Xa6L7Jth0a3S5AzSe/3QWYzalynNWPRf
         W0tyXSchOrv1oa4HZbVFXzuwrO5Xtr4LSERN/rVAIl2Wuj7IVD2EIz1gwAzgl8qBXyme
         6Y3OMyB53x3553ZcNUWovyKacVKMX71I4hRbGVYlfE5S9sfQwr+NxTourk/Ol9mulHGK
         a9V+MUeiEyA+TrM7TFjmkhxRoMP2T75zPYG9IhweyGseJOL6x3ky7jZFhZBJfXjS0aIe
         N5hw==
X-Forwarded-Encrypted: i=1; AJvYcCXSz8TKBGActnu2THp9/7MUzTyooUsQszAVc4UVzT6Z1/7gg7y+3Vc5EamwbiFeDvmomstG9PUTT+VgTUiC0nvA@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+wPYoLzVf/OM9q/7Iz3aJ+rSASXUxkvZeq95REyzMnC93dhva
	LtH2XuNkYtuU+a5t72gfb8w2BhhhaIxpnzywRKzWaONuGivGoThLRXp7LlNbvHY4nB77n2h/36e
	8zJA6q4rmx3YZaFDcKZaArkvvVQ==
X-Google-Smtp-Source: AGHT+IEnhHZikzLqY9Iyw+UlUAPLFo203H/gjCIqwNlpl0+DZeuWgmgKIGVnEnC2cAT2atcfhzVzUE50F2kqc2B8Og==
X-Received: from ilah6.prod.google.com ([2002:a05:6e02:1d86:b0:3dd:a262:4f8c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:b21:b0:3dc:7bc9:503e with SMTP id e9e14a558f8ab-3dd9c989ce3mr159545185ab.2.1748892554217;
 Mon, 02 Jun 2025 12:29:14 -0700 (PDT)
Date: Mon,  2 Jun 2025 19:27:01 +0000
In-Reply-To: <20250602192702.2125115-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250602192702.2125115-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602192702.2125115-17-coltonlewis@google.com>
Subject: [PATCH 16/17] KVM: arm64: Add ioctl to partition the PMU when supported
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
X-CRM114-CacheID: sfid-20250602_122915_484408_786AD43F 
X-CRM114-Status: GOOD (  16.76  )
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

Add KVM_ARM_PMU_PARTITION to partition the PMU for a given vCPU with a
specified number of reserved host counters. Add a corresponding
KVM_CAP_ARM_PMU_PARTITION to check for this ability.

This capability is allowed on an initialized vCPU where PMUv3, VHE,
and FGT are supported.

If the ioctl is never called, partitioning will fall back on kernel
command line kvm.reserved_host_counters as before.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 Documentation/virt/kvm/api.rst | 16 ++++++++++++++++
 arch/arm64/kvm/arm.c           | 21 +++++++++++++++++++++
 include/uapi/linux/kvm.h       |  4 ++++
 3 files changed, 41 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index fe3d6b5d2acc..88b851cb6f66 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6464,6 +6464,22 @@ the capability to be present.
 
 `flags` must currently be zero.
 
+4.144 KVM_ARM_PARTITION_PMU
+---------------------------
+
+:Capability: KVM_CAP_ARM_PMU_PARTITION
+:Architectures: arm64
+:Type: vcpu ioctl
+:Parameters: arg[0] is the number of counters to reserve for the host
+
+This API controls the ability to partition the PMU counters into two
+sets, one set reserved for the host and one set reserved for the
+guest. When partitoned, KVM will allow the guest direct hardware
+access to the most commonly used PMU capabilities for those counters,
+bypassing the KVM traps in the standard emulated PMU implementation
+and reducing the overhead of any guest software that uses PMU
+capabilities such as `perf`. The host PMU driver will not access any
+of the counters or bits reserved for the guest.
 
 .. _kvm_run:
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 4a1cc7b72295..1c44160d3b2d 100644
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
 #include <asm/kvm_ptrauth.h>
 #include <asm/sections.h>
@@ -382,6 +384,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_PMU_V3:
 		r = kvm_supports_guest_pmuv3();
 		break;
+	case KVM_CAP_ARM_PARTITION_PMU:
+		r = kvm_pmu_partition_supported();
+		break;
 	case KVM_CAP_ARM_INJECT_SERROR_ESR:
 		r = cpus_have_final_cap(ARM64_HAS_RAS_EXTN);
 		break;
@@ -1809,6 +1814,22 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
 
 		return kvm_arm_vcpu_finalize(vcpu, what);
 	}
+	case KVM_ARM_PARTITION_PMU: {
+		struct arm_pmu *pmu;
+		u8 host_counters;
+
+		if (unlikely(!kvm_vcpu_initialized(vcpu)))
+			return -ENOEXEC;
+
+		if (!kvm_pmu_partition_supported())
+			return -EPERM;
+
+		if (copy_from_user(&host_counters, argp, sizeof(host_counters)))
+			return -EFAULT;
+
+		pmu = vcpu->kvm->arch.arm_pmu;
+		return kvm_pmu_partition(pmu, host_counters);
+	}
 	default:
 		r = -EINVAL;
 	}
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index c9d4a908976e..f7387c0696d5 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -932,6 +932,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_ARM_WRITABLE_IMP_ID_REGS 239
 #define KVM_CAP_ARM_EL2 240
 #define KVM_CAP_ARM_EL2_E2H0 241
+#define KVM_CAP_ARM_PARTITION_PMU 242
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
@@ -1410,6 +1411,9 @@ struct kvm_enc_region {
 #define KVM_GET_SREGS2             _IOR(KVMIO,  0xcc, struct kvm_sregs2)
 #define KVM_SET_SREGS2             _IOW(KVMIO,  0xcd, struct kvm_sregs2)
 
+/* Available with KVM_CAP_ARM_PARTITION_PMU */
+#define KVM_ARM_PARTITION_PMU	_IOWR(KVMIO, 0xce, u8)
+
 #define KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE    (1 << 0)
 #define KVM_DIRTY_LOG_INITIALLY_SET            (1 << 1)
 
-- 
2.49.0.1204.g71687c7c1d-goog


