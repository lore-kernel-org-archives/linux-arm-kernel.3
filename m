Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAED0E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 01:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MYLyTOTsZbCzQhUhTS6u7grQ+BFI1GLmSyaDSfFgEx8=; b=xdi7YVRIIbTvVBzKUtWO7+9mEA
	BHAkKEfgYnwSVHOYm2FE6xugF/HLDdcoYVzuq8WfjVIy1FKvpr/iEj33sIIhQPAjhNVh1bF+1pw/b
	6q1Q56wQVwet84WeJeYw6Rew3Xalxxs83fTVwXCoHAm/8ItSTuMr9irdf+RmFAGYp5ht73kDZiAo+
	rykP7cu8DA+Zs8SglAbbu4Zdf4TNPzrGyWDku1icyDq5k+YMpjn+VP+dQtxeRuoNPRP+lndRXoKPo
	1vjSRTGaYtqSq8AZBpfJl0yu05J9NN8OHRvDrj9/8GLRJqHdmz4lQpO04bzOyXNoN5PrMqBjgw0ZD
	h5O64IKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJMme-00000000ACD-2FHx;
	Fri, 06 Dec 2024 01:05:28 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJMk8-000000009e4-2LKg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 01:02:54 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7fd11a8d578so1415078a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 17:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733446971; x=1734051771; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MYLyTOTsZbCzQhUhTS6u7grQ+BFI1GLmSyaDSfFgEx8=;
        b=sxzBEw394TIRXcIp3iVPAtGzelo5N+m+7hOWuYvrMS6MoGnxh09thgfYd5Mph6NHQa
         +Nlaw5a7BJwQ5XST1DISFsdWhIDGk3h1juYP8LJO0T49OHpWsOId8uTxKf+tr+jjS0H1
         m6mZA2cwKjP1qHIFB/UpUXgNv2J+6kuer8E99oFHD0Lz7VAbKXhLlZOwng5f3uGJp21b
         Qz4UAETu4mJf8c8GE7JkeETUoBv4dDrcNDTm9d2d44uTrnActXkozWNpqz4LTcO2yOvw
         1xHGb3UlFDrtplE4QcWfPdAdWFnhJCn1xUtvqt5Vxx90dOKTXiXF3NOuEY8fG1Xltib/
         apfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733446971; x=1734051771;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MYLyTOTsZbCzQhUhTS6u7grQ+BFI1GLmSyaDSfFgEx8=;
        b=gZ6eCIEyHLIMjpDkjBRQALJiSDKsss/VtzHuaYhZkuEF8ESzE6if5z4kac7Xinb08O
         VSGfss/UQj0XznqbrwjsZR9Osl2OnFnV8YFzQj5uFo7vYo5cUYMJsUpat1Nc3xSshZgl
         3JmQykk+UBoyuZdY7JKPjFJU0qsPShoBWl6w4lSKFsyuqcBeYlBuZw+i1vcApSYh/sjA
         loNRyOvPHcpW+sXdFKi6+YbbOkbpL9raSHBGzjmBUT1WwnhJA7smfURNVuGBuGcKTF/M
         tQa/J3kdveOq97tVfiIocE9/ol/rtJSpiqHHMYymUIFUVsFGGDsOWRXqQzzzrXeVLhXZ
         Ie0w==
X-Forwarded-Encrypted: i=1; AJvYcCXpi0YLCs9YH58pzkOwYlVRiNBenD2rOiFsqnobYmgAD+ArVgkD1iBXQbXP6aFD/sKu4XLv9/nl1Cwg5ugxK8pk@lists.infradead.org
X-Gm-Message-State: AOJu0YyLMEra74iSUzNguGr/X/kH8zrMipYjyjOtqDmuacQMrb3zqsCV
	6bEh1mN6E/mwBEB/s0HuJIljUIutQg6fHmx/XB/kqBjwT0UenG2WlhCswdpWzKY0+KURu4/1HU2
	trUw6AqggFg==
X-Google-Smtp-Source: AGHT+IG1nh8Otsg54SNCNFaLSELBcCc1sq66BJjw322b9cib3uOqLUZ0aIENc9csvG2opxvvri4AP80FQXXMCA==
X-Received: from pgbdp11.prod.google.com ([2002:a05:6a02:f0b:b0:7f4:5445:1822])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:3d85:b0:1cc:d9dc:5637 with SMTP id adf61e73a8af0-1e186c5e14amr2253562637.23.1733446971023;
 Thu, 05 Dec 2024 17:02:51 -0800 (PST)
Date: Fri,  6 Dec 2024 01:02:44 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241206010246.40282-1-jiaqiyan@google.com>
Subject: [RFC PATCH v2 1/3] KVM: arm64: SIGBUS VMM for SEA guest abort
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, duenwen@google.com, rananta@google.com, 
	jthoughton@google.com, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_170252_616427_56E57841 
X-CRM114-Status: GOOD (  29.93  )
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

When APEI is unable claim or handles synchronous external abort (SEA)
today KVM handles SEA for guest by injecting an async SError into the
guest directly, bypassing VMM, usually results in guest kernel panic.

One major situation of guest SEA is when vCPU consumes uncorrectable
memory error on the physical memory. Although SError and guest kernel
panic effectively stops the propagation of corrupted memory, it is not
easy for VMM and guest to recover from memory error in a more graceful
manner.

This patch teach KVM to send a SIGBUS BUS_OBJERR to VMM/vCPU, just like
how core kernel signals SIGBUS BUS_OBJERR to a gernal poison consuming
userspace thread when APEI is unable to claim the SEA. In addition to
the benifit that KVM's handling for SEA becomes aligned with core
kernel's behavior
- VMM can inject SEA to guest. Compared to SError, the blast radius in
  VM is possible to be limited to only the consuming thread in guest,
  instead of the entire guest kernel (unless the poison consumption is
  from guest kernel).
- VMM usually tracks the poisoned guest pages. Together with [1], if
  guest consumes again the already poisoned guest pages, VMM can protect
  itself and the host by stopping the consumption at software level, by
  intercepting guest's access to poisoned pages, and again injecting
  SEA to guest.

KVM now handles SEA as follows:
1. Delegate to APEI/GHES driver to see if SEA can be claimed by them.
2. If APEI failed to claim the SEA, send current thread (i.e. VMM in EL0)
   a si_code=BUS_OBJERR SIGBUS signal. If the DIMM error's physical
   address is available from FAR_EL2, si_addr will be the DIMM error's
   host virtual address in VMM/vCPU's memory space.
3. Otherwise bypass VMM and inject async SError to guest.

Tested on a machine running Siryn AmpereOne processor. A dummy application
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

[1] https://lpc.events/event/18/contributions/1757/attachments/1442/3073/LPC_%20KVM%20Userfault.pdf

Changelog

RFC v2 -> RFC v1
- reword commit msg
- drop unused parameters from kvm_delegate_guest_sea
- remove KVM_CAP_ARM_SIGBUS_ON_SEA and its opt in code
- set FnV bit in vcpu's ESR_ELx if host ESR_EL2's FnV is set
- add documentation for this new SIGBUS feature

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 arch/arm64/include/asm/kvm_ras.h | 24 ++++++----
 arch/arm64/kvm/Makefile          |  2 +-
 arch/arm64/kvm/kvm_ras.c         | 81 ++++++++++++++++++++++++++++++++
 arch/arm64/kvm/mmu.c             |  8 +---
 4 files changed, 98 insertions(+), 17 deletions(-)
 create mode 100644 arch/arm64/kvm/kvm_ras.c

diff --git a/arch/arm64/include/asm/kvm_ras.h b/arch/arm64/include/asm/kvm_ras.h
index 87e10d9a635b5..5b4bec6f4f32b 100644
--- a/arch/arm64/include/asm/kvm_ras.h
+++ b/arch/arm64/include/asm/kvm_ras.h
@@ -1,5 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/* Copyright (C) 2018 - Arm Ltd */
 
 #ifndef __ARM64_KVM_RAS_H__
 #define __ARM64_KVM_RAS_H__
@@ -11,15 +10,22 @@
 #include <asm/acpi.h>
 
 /*
- * Was this synchronous external abort a RAS notification?
- * Returns '0' for errors handled by some RAS subsystem, or -ENOENT.
+ * For synchrnous external abort taken to KVM at EL2, not on translation
+ * table walk or hardware update of translation table, is FAR_EL2 valid?
  */
-static inline int kvm_handle_guest_sea(phys_addr_t addr, u64 esr)
-{
-	/* apei_claim_sea(NULL) expects to mask interrupts itself */
-	lockdep_assert_irqs_enabled();
+bool kvm_vcpu_sea_far_valid(const struct kvm_vcpu *vcpu);
 
-	return apei_claim_sea(NULL);
-}
+/*
+ * Handle synchronous external abort (SEA) in the following order:
+ * 1. Delegate to APEI/GHES to see if they can claim SEA. If so, all done.
+ * 2. If the SEA is NOT about S2 translation table, send SIGBUS to current
+ *    with BUS_OBJERR and si_addr set to faulting/poisoned host virtual
+ *    address. When accurate HVA is unavailable, si_addr will be 0.
+ * 3. Otherwise, directly inject an async SError to guest.
+ *
+ * Note this applies to both instruction and data abort (ESR_ELx_EC_IABT_*
+ * and ESR_ELx_EC_DABT_*).
+ */
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
diff --git a/arch/arm64/kvm/kvm_ras.c b/arch/arm64/kvm/kvm_ras.c
new file mode 100644
index 0000000000000..88d5c57f14bc7
--- /dev/null
+++ b/arch/arm64/kvm/kvm_ras.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bitops.h>
+#include <linux/kvm_host.h>
+
+#include <asm/kvm_emulate.h>
+#include <asm/kvm_ras.h>
+#include <asm/system_misc.h>
+
+bool kvm_vcpu_sea_far_valid(const struct kvm_vcpu *vcpu)
+{
+	/*
+	 * FnV is valid only for Data/Instruction aborts and if DFSC/IFSC
+	 * is ESR_ELx_FSC_EXTABT(0b010000).
+	 */
+	if (kvm_vcpu_trap_get_fault(vcpu) == ESR_ELx_FSC_EXTABT)
+		return !(vcpu->arch.fault.esr_el2 & ESR_ELx_FnV);
+
+	/* Other exception classes or aborts don't care about FnV field. */
+	return true;
+}
+
+/*
+ * Was this synchronous external abort a RAS notification?
+ * Returns '0' for errors handled by some RAS subsystem, or -ENOENT.
+ */
+static int kvm_delegate_guest_sea(void)
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
+	if (kvm_delegate_guest_sea() == 0)
+		return;
+
+	/*
+	 * In addition to userspace opt-in, SIGBUS only makes sense if the
+	 * abort is NOT about stage 2 translation table walk and NOT about
+	 * hardware update of stage 2 translation table.
+	 */
+	sigbus_on_sea = (fsc == ESR_ELx_FSC_EXTABT ||
+			 fsc == ESR_ELx_FSC_SECC ||
+			 fsc == ESR_ELx_FSC_SEA_TTW(1) ||
+			 fsc == ESR_ELx_FSC_SECC_TTW(1));
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
 
-- 
2.47.0.338.g60cca15819-goog


