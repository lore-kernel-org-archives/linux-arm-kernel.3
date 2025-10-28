Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C88DCCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 22:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXlFQqVkeSJSGq4nf4h9sY1cU7UxsK+01O4a1p4Iox8=; b=KoPnbBT8LQPlJkKkJ2/VlTHYA1
	Fsyzox0iboNnEFpf4sXLIs2EMXNbE31Cgw7NqnFsAGtSYO08z7fnOSC3KpUsWpSwurL41ABcDDS5K
	q2YYPNcJCKrB7uIN4COtbzPVekSou1rJlWIPFlXj8HiOYOBuXvMARo+6cEBf5ab/yk6qHewI8V/2R
	SwbpdsJVceUcG72FlyhVKG892lYarNcVhbEXEutzEFI4f4eZejoIDfLYQg2trSdD8z7cxn3pLYOKd
	jX7V7j2Ekxnq6D4wIrleTi9e86GAhtAjnLuxYtxUDRBWxULgIaYygLDs3YWMouf9gajFL4BiHNMHB
	Nxf4DL2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDsec-0000000Gm3E-49s6;
	Tue, 28 Oct 2025 22:59:02 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDseZ-0000000Gm1e-1UVa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 22:59:00 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33da21394adso6258930a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 15:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761692338; x=1762297138; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CXlFQqVkeSJSGq4nf4h9sY1cU7UxsK+01O4a1p4Iox8=;
        b=4MfRc0HjGCDZysjqGPWFhPFaye+imA9BoMv+08lNKrFlldeOC0aAqrC6K4hC8Nx7fG
         FH6DLqNjkXX/+FB/PuTdluGjhxBfPtFHlFnoowW6qN3tYYnv8ru2FPw9cRy3rbeY7LjP
         CHMVpmaqDahFj9eEPxtuzgMvfyPVEGaCXQ+7+7CJL+P2JrAi822dnnUbC3NamMwXlC5T
         11+J/h8yKxnjHW/EugHwnaoP1jcuRzq5fJS69ehBcmCpjKnDFBpPRQD/di9lBUF3qoFe
         flDUyKInvzAX9yPhui+KCSGJDNkMysooErLLVqMJ0TMbvDFSF/Oxl9Hrah8qRXZG95P5
         jSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761692338; x=1762297138;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CXlFQqVkeSJSGq4nf4h9sY1cU7UxsK+01O4a1p4Iox8=;
        b=PfUE6T7SWgVSlOeEl0pRvWZMxi40O67HHs7mb6GEBrkwLwGUaKTODwNcII9q1wGeYt
         YYlHktEqr/js8SQ0GyhEJ1tY2PXG5JwUBWD9gBpldvYozyUhu1O0YFfBrg/A9Eb7CD0b
         55z0pZHP9wvWSGzZVTRhcPTaX0Uv5LOXIQL7ou30G/IFYmGiSf/kxaD7WfJcXe+Ixlaw
         nQt37IUj5zbVGrCzHm3PAAmSQ6fSoV+zqGm8ONUD1sxJ4o0rQZtpeKnUyhXY2VCYs7mt
         BBXuyDliIfel7YyW7k+eocy+BWsOGGQAw2VXAWobD1AifJdpgdGfQHIM1IX8PaQOOj9V
         mqlw==
X-Forwarded-Encrypted: i=1; AJvYcCUPgWIo7AD1h5DzoHzPUYx2a+27CZwrly0OQ69pVDqMXiZRhtKG0bhXRwQxeTI+K1SN4uIz/5Hp41JTs9VMeYcb@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/JbGK7YdgQ4qMKcx/zCHXkGMoPsol8v+kJkMAm42WK884Ibo0
	w/jU33VbDnDpgGW8Y56nPh3dTRTQBSsfJbfLCgQ2myVqFsQO249tT9vmXYjnbvxmzECkveByYBQ
	E+x2kM7YTrgG2sQ==
X-Google-Smtp-Source: AGHT+IHe+dJhfOO9m6uEQXw3DM1SrUYb2gIMsEhaThpkWaKsrk/O7HUYRRmxDYScsO608Odc0oikNMx/xTBT8Q==
X-Received: from pjbsw13.prod.google.com ([2002:a17:90b:2c8d:b0:33f:e888:4aad])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:586e:b0:340:299f:e244 with SMTP id 98e67ed59e1d1-3403a26906cmr820669a91.12.1761692337855;
 Tue, 28 Oct 2025 15:58:57 -0700 (PDT)
Date: Tue, 28 Oct 2025 15:30:42 -0700
In-Reply-To: <20251028225827.2269128-1-jmattson@google.com>
Mime-Version: 1.0
References: <20251028225827.2269128-1-jmattson@google.com>
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
Message-ID: <20251028225827.2269128-5-jmattson@google.com>
Subject: [PATCH v2 4/4] KVM: selftests: Add a VMX test for LA57 nested state
From: Jim Mattson <jmattson@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Bibo Mao <maobibo@loongson.cn>, Jim Mattson <jmattson@google.com>, 
	"Pratik R. Sampat" <prsampat@amd.com>, James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_155859_422348_190C6A68 
X-CRM114-Status: GOOD (  19.85  )
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

Add a selftest that verifies KVM's ability to save and restore
nested state when the L1 guest is using 5-level paging and the L2
guest is using 4-level paging. Specifically, canonicality tests of
the VMCS12 host-state fields should accept 57-bit virtual addresses.

Signed-off-by: Jim Mattson <jmattson@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../kvm/x86/vmx_la57_nested_state_test.c      | 134 ++++++++++++++++++
 2 files changed, 135 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86/vmx_la57_nested_state_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 148d427ff24b..b9279ce4eaab 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -117,6 +117,7 @@ TEST_GEN_PROGS_x86 += x86/vmx_exception_with_invalid_guest_state
 TEST_GEN_PROGS_x86 += x86/vmx_msrs_test
 TEST_GEN_PROGS_x86 += x86/vmx_invalid_nested_guest_state
 TEST_GEN_PROGS_x86 += x86/vmx_set_nested_state_test
+TEST_GEN_PROGS_x86 += x86/vmx_la57_nested_state_test
 TEST_GEN_PROGS_x86 += x86/vmx_tsc_adjust_test
 TEST_GEN_PROGS_x86 += x86/vmx_nested_tsc_scaling_test
 TEST_GEN_PROGS_x86 += x86/apic_bus_clock_test
diff --git a/tools/testing/selftests/kvm/x86/vmx_la57_nested_state_test.c b/tools/testing/selftests/kvm/x86/vmx_la57_nested_state_test.c
new file mode 100644
index 000000000000..00c6327d5621
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86/vmx_la57_nested_state_test.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * vmx_la57_nested_state_test
+ *
+ * Copyright (C) 2025, Google LLC.
+ *
+ * Test KVM's ability to save and restore nested state when the L1 guest
+ * is using 5-level paging and the L2 guest is using 4-level paging.
+ *
+ * This test would have failed prior to commit 9245fd6b8531 ("KVM: x86:
+ * model canonical checks more precisely").
+ */
+#include "test_util.h"
+#include "kvm_util.h"
+#include "processor.h"
+#include "vmx.h"
+
+#define LA57_GS_BASE 0xff2bc0311fb00000ull
+
+static void l2_guest_code(void)
+{
+	/*
+	 * Sync with L0 to trigger save/restore.  After
+	 * resuming, execute VMCALL to exit back to L1.
+	 */
+	GUEST_SYNC(1);
+	vmcall();
+}
+
+static void l1_guest_code(struct vmx_pages *vmx_pages)
+{
+#define L2_GUEST_STACK_SIZE 64
+	unsigned long l2_guest_stack[L2_GUEST_STACK_SIZE];
+	u64 guest_cr4;
+	vm_paddr_t pml5_pa, pml4_pa;
+	u64 *pml5;
+	u64 exit_reason;
+
+	/* Set GS_BASE to a value that is only canonical with LA57. */
+	wrmsr(MSR_GS_BASE, LA57_GS_BASE);
+	GUEST_ASSERT(rdmsr(MSR_GS_BASE) == LA57_GS_BASE);
+
+	GUEST_ASSERT(vmx_pages->vmcs_gpa);
+	GUEST_ASSERT(prepare_for_vmx_operation(vmx_pages));
+	GUEST_ASSERT(load_vmcs(vmx_pages));
+
+	prepare_vmcs(vmx_pages, l2_guest_code,
+		     &l2_guest_stack[L2_GUEST_STACK_SIZE]);
+
+	/*
+	 * Set up L2 with a 4-level page table by pointing its CR3 to
+	 * L1's first PML4 table and clearing CR4.LA57. This creates
+	 * the CR4.LA57 mismatch that exercises the bug.
+	 */
+	pml5_pa = get_cr3() & PHYSICAL_PAGE_MASK;
+	pml5 = (u64 *)pml5_pa;
+	pml4_pa = pml5[0] & PHYSICAL_PAGE_MASK;
+	vmwrite(GUEST_CR3, pml4_pa);
+
+	guest_cr4 = vmreadz(GUEST_CR4);
+	guest_cr4 &= ~X86_CR4_LA57;
+	vmwrite(GUEST_CR4, guest_cr4);
+
+	GUEST_ASSERT(!vmlaunch());
+
+	exit_reason = vmreadz(VM_EXIT_REASON);
+	GUEST_ASSERT(exit_reason == EXIT_REASON_VMCALL);
+}
+
+void guest_code(struct vmx_pages *vmx_pages)
+{
+	l1_guest_code(vmx_pages);
+	GUEST_DONE();
+}
+
+int main(int argc, char *argv[])
+{
+	vm_vaddr_t vmx_pages_gva = 0;
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+	struct kvm_x86_state *state;
+	struct ucall uc;
+	int stage;
+
+	TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_VMX));
+	TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_LA57));
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_NESTED_STATE));
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+
+	/*
+	 * L1 needs to read its own PML5 table to set up L2. Identity map
+	 * the PML5 table to facilitate this.
+	 */
+	virt_map(vm, vm->pgd, vm->pgd, 1);
+
+	vcpu_alloc_vmx(vm, &vmx_pages_gva);
+	vcpu_args_set(vcpu, 1, vmx_pages_gva);
+
+	for (stage = 1;; stage++) {
+		vcpu_run(vcpu);
+		TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
+
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+			/* NOT REACHED */
+		case UCALL_SYNC:
+			break;
+		case UCALL_DONE:
+			goto done;
+		default:
+			TEST_FAIL("Unknown ucall %lu", uc.cmd);
+		}
+
+		TEST_ASSERT(uc.args[1] == stage,
+			    "Expected stage %d, got stage %lu", stage, (ulong)uc.args[1]);
+		if (stage == 1) {
+			pr_info("L2 is active; performing save/restore.\n");
+			state = vcpu_save_state(vcpu);
+
+			kvm_vm_release(vm);
+
+			/* Restore state in a new VM. */
+			vcpu = vm_recreate_with_one_vcpu(vm);
+			vcpu_load_state(vcpu, state);
+			kvm_x86_state_cleanup(state);
+		}
+	}
+
+done:
+	kvm_vm_free(vm);
+	return 0;
+}
-- 
2.51.1.851.g4ebd6896fd-goog


