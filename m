Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B78E67485
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 21:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b/v8Mv1PK4LZF9Cis1bzmvNj+I57aITtqK3JVRR6JrA=; b=FFj8pj5wQKIDGRhz1m5waTd6qq
	ibY0baEc8Fh4aUmUwVh9XR17NOYT9A9y1WuaB0pSpIDxjgoqqMpZIcIDVq3Y2KEGVqhAZiyWCVdMa
	a5PPE6QNR2M3c/QCHsZvGhQ5St7z4xxXa+0h/UhHlmJVNxBLpSmnKU3P1Q3/J5570HC9+4kix92mR
	Fti3q3xzyrEUvUMlZucKzkn89D3OwUfdNgUuDAViIbG+LLsDU+02aHiPG0ioTc9Qxb1NsxDbwFq5G
	cJlUWVXOpwUOMJEOTeHwXEAe9Pw/qathtDkDGmb5Hg3RLgY0EqjAvYvzzDbHh3HC4dbIporBmV3w+
	/+fjXGww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6cdF-00000004uy4-0Kim;
	Thu, 31 Oct 2024 21:23:05 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6cbZ-00000004ufN-1kWH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 21:21:22 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e2946a143efso2443698276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 14:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730409679; x=1731014479; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b/v8Mv1PK4LZF9Cis1bzmvNj+I57aITtqK3JVRR6JrA=;
        b=EOsjMzIpbcMe1OzQ+UjVZtZ5vJ1QUH+MmJvUdrmnUofNDlr3zPxdR/+0M8DEarhuBi
         fj9yEqPaialNLRxQoTeVUwO9+axgMaTF4p82fzGz7QmeMb9NZ7t6c2NHziGs8ecgU73A
         Fppy9o5ZiUMA4txRzV56wgLy/eCCJvCBZ0D+ktrE3p1dqOEpWkR7GysVFFBoSr0gJhCh
         OQ36ICug3azUj2Hhf+KfyS/9h4wzC5/6ccNH2T1VKKNfcyIQIPEAzy28RpeNUcm9D2jQ
         3FT6MKSIndQtJLWfsp5ybpYI89/JQY7jrO8Vp5sRC75eRbHYqD/KsqJJgOYOr/HynzoU
         I7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730409679; x=1731014479;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b/v8Mv1PK4LZF9Cis1bzmvNj+I57aITtqK3JVRR6JrA=;
        b=XE1A5kytkWZnNPAl79gost1ALpwqzLm0ARVn9jC60fXGVczhEHfu+ie/ihUcsmzchK
         KcR7UYYkRBVK90SdEv71OIfWQc1U6uo+ydVQ3myY1RM+WjS6/XCsicU9P5nhc4IimBMT
         VuNLO8yXYE9WWjPPCb1u/hdoyzsRH3jOkbaCAq1uK+eRq0Dc8Xf0TgvvK4hzOx3kEibb
         GUmUSf6hg2hdn3WXzXhrRoNpT2qytF0ODnPeFludIW6ELtm7D0WIJnzSK83hEZ3ATV1P
         ywdXVP6QDeUrzj6sWz2B0NPh0Gox7r6FJsbmlPLRnmZqt13r8k4QmOqaH/V3P1eiZI1O
         pvpA==
X-Forwarded-Encrypted: i=1; AJvYcCXzc3EqPHOpNMiNN9WdpsDQz0wqdRlyyjinFXKpmm5H/LongWMQVMIXQzwF2RnNRpDmbgf8hY1FXNZqbWXXfOFb@lists.infradead.org
X-Gm-Message-State: AOJu0YwAxiJ9cDgDjhg2lxjBwYfwI51LJP3b0IWkdBOow0E8O7CZxEX9
	CzztQujr7aCH6o80HFM55tldCIVCmQzYXug5cOpfM6VAiGlCBH/U2Ri829yfKLni8Lx0HU0jlEL
	6VkUh2K7Z/w==
X-Google-Smtp-Source: AGHT+IFOfPtKpMDG2yMvokzfd9vRZ2DjB/v6P8TmSQwoWItjAf484F7Xg8alAf6O51J10eF8sgO9lx+FRmnk0g==
X-Received: from yjqssd.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:abd])
 (user=jiaqiyan job=sendgmr) by 2002:a25:8289:0:b0:e2b:cca2:69e1 with SMTP id
 3f1490d57ef6-e30e8d6b7edmr9473276.3.1730409679245; Thu, 31 Oct 2024 14:21:19
 -0700 (PDT)
Date: Thu, 31 Oct 2024 21:21:04 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241031212104.1429609-1-jiaqiyan@google.com>
Subject: [RFC PATCH v1] KVM: arm64: Introduce KVM_CAP_ARM_SIGBUS_ON_SEA
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, duenwen@google.com, rananta@google.com, 
	Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_142121_492404_D4327B23 
X-CRM114-Status: GOOD (  29.88  )
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

Currently KVM handles SEA in guest by injecting async SError into
guest directly, bypassing VMM, usually results in guest kernel panic.

One major situation of guest SEA is when vCPU consumes uncorrectable
memory error on the physical memory. Although SError and guest kernel
panic effectively stops the propagation of corrupted memory, it is not
easy for VMM and guest to recover from memory error in a more graceful
manner.

Alternatively KVM can send a SIGBUS BUS_OBJERR to VMM/vCPU, just like
how core kernel signals SIGBUS BUS_OBJERR to the poison consuming
thread.
In addition to the benifit that KVM's handling for SEA becomes aligned
with core kernel behavior
- The blast radius in VM can be limited to only the consuming thread
  in guest, instead of entire guest kernel, unless the consumption is
  from guest kernel.
- VMM now has the chance to do its duties to stop the VM from repeatedly
  consuming corrupted data. For example, VMM can unmap the guest page
  from stage-2 table to intercept forseen memory poison consumption,
  and for every consumption injects SEA to EL1 with synthetic memory
  error CPER.

Introduce a new KVM ARM capability KVM_CAP_ARM_SIGBUS_ON_SEA. VMM
can opt in this new capability if it prefers SIGBUS than SError
injection during VM init. Now SEA handling in KVM works as follows:
1. Delegate to APEI/GHES to see if SEA can be claimed by them.
2. If APEI failed to claim the SEA and KVM_CAP_ARM_SIGBUS_ON_SEA is
   enabled for the VM, and the SEA is NOT about translation table,
   send SIGBUS BUS_OBJERR signal with host virtual address.
3. Otherwise directly inject async SError to guest.

Tested on a machine running Siryn AmpereOne processor. A in-house VMM
that opts in KVM_CAP_ARM_SIGBUS_ON_SEA started a VM. A dummy application
in VM allocated some memory buffer. The test used EINJ to inject an
uncorrectable recoverable memory error at a page in the allocated memory
buffer. The dummy application then consumed the memory error. Some hack
was done to make core kernel's memory_failure triggered by poison
generation to fail, so KVM had to deal with the SEA guest abort due to
poison consumption. vCPU thread in VMM received SIGBUS BUS_OBJERR with
valid host virtual address of the poisoned page. VMM then injected a SEA
into guest using KVM_SET_VCPU_EVENTS with ext_dabt_pending=1. At last
the dummy application in guest was killed by SIGBUS BUS_OBJERR, while the
guest survived and continued to run.

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  2 +
 arch/arm64/include/asm/kvm_ras.h  | 20 ++++----
 arch/arm64/kvm/Makefile           |  2 +-
 arch/arm64/kvm/arm.c              |  5 ++
 arch/arm64/kvm/kvm_ras.c          | 77 +++++++++++++++++++++++++++++++
 arch/arm64/kvm/mmu.c              |  8 +---
 include/uapi/linux/kvm.h          |  1 +
 7 files changed, 98 insertions(+), 17 deletions(-)
 create mode 100644 arch/arm64/kvm/kvm_ras.c

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index bf64fed9820ea..eb37a2489411a 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -334,6 +334,8 @@ struct kvm_arch {
 	/* Fine-Grained UNDEF initialised */
 #define KVM_ARCH_FLAG_FGU_INITIALIZED			8
 	unsigned long flags;
+	/* Instead of injecting SError into guest, SIGBUS VMM */
+#define KVM_ARCH_FLAG_SIGBUS_ON_SEA			9
 
 	/* VM-wide vCPU feature set */
 	DECLARE_BITMAP(vcpu_features, KVM_VCPU_MAX_FEATURES);
diff --git a/arch/arm64/include/asm/kvm_ras.h b/arch/arm64/include/asm/kvm_ras.h
index 87e10d9a635b5..4bb7a424e3f6c 100644
--- a/arch/arm64/include/asm/kvm_ras.h
+++ b/arch/arm64/include/asm/kvm_ras.h
@@ -11,15 +11,17 @@
 #include <asm/acpi.h>
 
 /*
- * Was this synchronous external abort a RAS notification?
- * Returns '0' for errors handled by some RAS subsystem, or -ENOENT.
+ * Handle synchronous external abort (SEA) in the following order:
+ * 1. Delegate to APEI/GHES to see if SEA can be claimed by them. If so, we
+ *    are all done.
+ * 2. If userspace opts in KVM_CAP_ARM_SIGBUS_ON_SEA, and if the SEA is NOT
+ *    about translation table, send SIGBUS
+ *    - si_code is BUS_OBJERR.
+ *    - si_addr will be 0 when accurate HVA is unavailable.
+ * 3. Otherwise, directly inject an async SError to guest.
+ *
+ * Note this applies to both ESR_ELx_EC_IABT_* and ESR_ELx_EC_DABT_*.
  */
-static inline int kvm_handle_guest_sea(phys_addr_t addr, u64 esr)
-{
-	/* apei_claim_sea(NULL) expects to mask interrupts itself */
-	lockdep_assert_irqs_enabled();
-
-	return apei_claim_sea(NULL);
-}
+void kvm_handle_guest_sea(struct kvm_vcpu *vcpu);
 
 #endif /* __ARM64_KVM_RAS_H__ */
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 3cf7adb2b5038..c4a3a6d4870e6 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -23,7 +23,7 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 	 vgic/vgic-v3.o vgic/vgic-v4.o \
 	 vgic/vgic-mmio.o vgic/vgic-mmio-v2.o \
 	 vgic/vgic-mmio-v3.o vgic/vgic-kvm-device.o \
-	 vgic/vgic-its.o vgic/vgic-debug.o
+	 vgic/vgic-its.o vgic/vgic-debug.o kvm_ras.o
 
 kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
 kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 48cafb65d6acf..bb97ad678dbec 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -151,6 +151,10 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 		}
 		mutex_unlock(&kvm->slots_lock);
 		break;
+	case KVM_CAP_ARM_SIGBUS_ON_SEA:
+		r = 0;
+		set_bit(KVM_ARCH_FLAG_SIGBUS_ON_SEA, &kvm->arch.flags);
+		break;
 	default:
 		break;
 	}
@@ -339,6 +343,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_SYSTEM_SUSPEND:
 	case KVM_CAP_IRQFD_RESAMPLE:
 	case KVM_CAP_COUNTER_OFFSET:
+	case KVM_CAP_ARM_SIGBUS_ON_SEA:
 		r = 1;
 		break;
 	case KVM_CAP_SET_GUEST_DEBUG2:
diff --git a/arch/arm64/kvm/kvm_ras.c b/arch/arm64/kvm/kvm_ras.c
new file mode 100644
index 0000000000000..3225462bcbcda
--- /dev/null
+++ b/arch/arm64/kvm/kvm_ras.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bitops.h>
+#include <linux/kvm_host.h>
+
+#include <asm/kvm_emulate.h>
+#include <asm/kvm_ras.h>
+#include <asm/system_misc.h>
+
+/*
+ * For synchrnous external instruction or data abort, not on translation
+ * table walk or hardware update of translation table, is FAR_EL2 valid?
+ */
+static inline bool kvm_vcpu_sea_far_valid(const struct kvm_vcpu *vcpu)
+{
+	return !(vcpu->arch.fault.esr_el2 & ESR_ELx_FnV);
+}
+
+/*
+ * Was this synchronous external abort a RAS notification?
+ * Returns '0' for errors handled by some RAS subsystem, or -ENOENT.
+ */
+static int kvm_delegate_guest_sea(phys_addr_t addr, u64 esr)
+{
+	/* apei_claim_sea(NULL) expects to mask interrupts itself */
+	lockdep_assert_irqs_enabled();
+	return apei_claim_sea(NULL);
+}
+
+void kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
+{
+	bool sigbus_on_sea;
+	int idx;
+	u64 vcpu_esr = kvm_vcpu_get_esr(vcpu);
+	u8 fsc = kvm_vcpu_trap_get_fault(vcpu);
+	phys_addr_t fault_ipa = kvm_vcpu_get_fault_ipa(vcpu);
+	gfn_t gfn = fault_ipa >> PAGE_SHIFT;
+	/* When FnV is set, send 0 as si_addr like what do_sea() does. */
+	unsigned long hva = 0UL;
+
+	/*
+	 * For RAS the host kernel may handle this abort.
+	 * There is no need to SIGBUS VMM, or pass the error into the guest.
+	 */
+	if (kvm_delegate_guest_sea(fault_ipa, vcpu_esr) == 0)
+		return;
+
+	sigbus_on_sea = test_bit(KVM_ARCH_FLAG_SIGBUS_ON_SEA,
+				 &(vcpu->kvm->arch.flags));
+
+	/*
+	 * In addition to userspace opt-in, SIGBUS only makes sense if the
+	 * abort is NOT about translation table walk and NOT about hardware
+	 * update of translation table.
+	 */
+	sigbus_on_sea &= (fsc == ESR_ELx_FSC_EXTABT || fsc == ESR_ELx_FSC_SECC);
+
+	/* Pass the error directly into the guest. */
+	if (!sigbus_on_sea) {
+		kvm_inject_vabt(vcpu);
+		return;
+	}
+
+	if (kvm_vcpu_sea_far_valid(vcpu)) {
+		idx = srcu_read_lock(&vcpu->kvm->srcu);
+		hva = gfn_to_hva(vcpu->kvm, gfn);
+		srcu_read_unlock(&vcpu->kvm->srcu, idx);
+	}
+
+	/*
+	 * Send a SIGBUS BUS_OBJERR to vCPU thread (the userspace thread that
+	 * runs KVM_RUN) or VMM, which aligns with what host kernel do_sea()
+	 * does if apei_claim_sea() fails.
+	 */
+	arm64_notify_die("synchronous external abort",
+			 current_pt_regs(), SIGBUS, BUS_OBJERR, hva, vcpu_esr);
+}
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index a71fe6f6bd90f..f5335953827ec 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1766,13 +1766,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 
 	/* Synchronous External Abort? */
 	if (kvm_vcpu_abt_issea(vcpu)) {
-		/*
-		 * For RAS the host kernel may handle this abort.
-		 * There is no need to pass the error into the guest.
-		 */
-		if (kvm_handle_guest_sea(fault_ipa, kvm_vcpu_get_esr(vcpu)))
-			kvm_inject_vabt(vcpu);
-
+		kvm_handle_guest_sea(vcpu);
 		return 1;
 	}
 
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 637efc0551453..fe3ca787e72fa 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -933,6 +933,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_PRE_FAULT_MEMORY 236
 #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
 #define KVM_CAP_X86_GUEST_MODE 238
+#define KVM_CAP_ARM_SIGBUS_ON_SEA 239
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.47.0.163.g1226f6d8fa-goog


