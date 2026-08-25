Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263B1C61DBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 16:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcKcgTzP/MaC1TKqD0rXntx2zTo0kP8ybCcblQSok4Q=; b=O494dih4BRT9k0XnlIikUmiyhl
	I/pJGsbk5uZkVsUKO7aLPABkNgVsvujCze8xeR0qRBFNTUn02QmUTHyfwderDWeIqJU/gUwtTi7Ln
	yM2I02Q05XpoqcUxqAg8X536IRcURoRjFF68/t2azY42jATkqiVHr0mFb3v7uTZ1FKonz9wJ28/og
	jYkAII1ZhBuuh1eYDE6MdGFG8xDRhfUBZfFnCxVBgjvz1F9IxntaKqgdlQQDBQY0bVNlKh3+42liM
	fRNQIHmMonXFYwBdvKnpRJZK5MbnOtaatPpkesPQCw4DWRhXkCohInpy/2YSNkt8OpjCLFbL/eRwx
	zpHoTfIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wytbF-000000014pb-0uLE;
	Tue, 25 Aug 2026 16:02:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wytb8-000000014lA-0wW6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 16:02:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A8890601E9;
	Tue, 25 Aug 2026 16:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32971F000E9;
	Tue, 25 Aug 2026 16:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787673721;
	bh=tcKcgTzP/MaC1TKqD0rXntx2zTo0kP8ybCcblQSok4Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZQ2fKSMB51ICm8a+uQ7XhMAdLeWtrzaJjIxUqvCXFYKol3tlFUd4AeOGCcJf8JVWB
	 AcbHuBEKV6I+Cf+jJD2cmjF5CVXyFzNayEUqS34AZwMmakPJshLz8TZ8XAmvfRX9y1
	 2ZdOmbtRt8cUJUUXMAUsIjeggGUOmSHg2rKxekC+1NV7XfvPm8ZiV5XIkIhHdPEfvH
	 fzfzT/iKbB6F+55FhYFN75bOwWayybPWtneyUEHzX/3tZDCkbNyU578qTAyLn9JEMw
	 k5bLFZDq14Lpvx0vUz2QjEYdIlUGSDHEnIJDtQADg3HebMt3dA7WxkCzXjhqxB7Z/H
	 bjljMnkItf9Rw==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 25 Aug 2026 17:00:42 +0100
Subject: [PATCH 8/8] KVM: selftests: Add nested pre-fault test for arm64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-kvm-arm-prefault-v1-8-befe8947702e@kernel.org>
References: <20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org>
In-Reply-To: <20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
 Jack Thomson <jackabt.amazon@gmail.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Vincent Donnefort <vdonnefort@google.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Sean Christopherson <seanjc@google.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, 
 Leo Soares Passos <Leo.Bras@arm.com>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8041; i=ljs@kernel.org;
 h=from:subject:message-id; bh=uxEB4tWFsMMdxFr1BeaQVWSs7h76x9U+I63sFxRh9hg=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLJ69zgrtNl/tlib23ByjswG0aAD067fmScoZsIqZ/0rb
 d8s/z3WHaUsDGJcDLJiiizPv4jvDxIJm9d5wd8NZg4rE8gQBi5OAZjI8TkM/2y9Ik/v1grsPSJU
 0617vtbsU+/yFTFx9pF9970/nk1QD2NkWLfgRvf2Mv1qbbFZCSZuQkpKHtbPllgoLN+W6SK086A
 DBwA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

From: Jack Thomson <jackabt@amazon.com>

Add an arm64 nested-virt selftest for KVM_PRE_FAULT_MEMORY. The guest
enters vEL1 and exits to userspace with a nested/shadow stage-2 MMU as
the vCPU's last-run context.

Before prefaulting, userspace enables HCR_EL2.VM and points VTTBR_EL2 at
an empty nested stage-2 root. A prefault implementation that incorrectly
treats the userspace GPA as an L2 IPA will fail the ioctl; the correct
path targets the canonical stage-2 and succeeds.

Restore the original nested state before resuming the guest, then touch
the prefaulted range to check that vEL1 still runs correctly.

Signed-off-by: Jack Thomson <jackabt@amazon.com>
[ljs: partial progress, >4 KiB pgsize, commit msg, comment fixups]
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 tools/testing/selftests/kvm/Makefile.kvm           |   1 +
 .../selftests/kvm/arm64/nv_pre_fault_memory_test.c | 206 +++++++++++++++++++++
 2 files changed, 207 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 66a9a4e62888..1e0edd0f99f7 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -173,6 +173,7 @@ TEST_GEN_PROGS_arm64 += arm64/debug-exceptions
 TEST_GEN_PROGS_arm64 += arm64/hello_el2
 TEST_GEN_PROGS_arm64 += arm64/host_sve
 TEST_GEN_PROGS_arm64 += arm64/hypercalls
+TEST_GEN_PROGS_arm64 += arm64/nv_pre_fault_memory_test
 TEST_GEN_PROGS_arm64 += arm64/external_aborts
 TEST_GEN_PROGS_arm64 += arm64/mmio_sign_ext
 TEST_GEN_PROGS_arm64 += arm64/page_fault_test
diff --git a/tools/testing/selftests/kvm/arm64/nv_pre_fault_memory_test.c b/tools/testing/selftests/kvm/arm64/nv_pre_fault_memory_test.c
new file mode 100644
index 000000000000..b3833aea2a34
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/nv_pre_fault_memory_test.c
@@ -0,0 +1,206 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * nv_pre_fault_memory_test - Test KVM_PRE_FAULT_MEMORY on a vCPU whose
+ * last-run context is nested.
+ *
+ * The guest starts at vEL2, mirrors its EL2 translation regime into the
+ * real EL1 registers, drops HCR_EL2.TGE and ERETs to vEL1, then exits to
+ * userspace from vEL1 so that the vCPU's last-run context selects a
+ * shadow stage-2 MMU. Userspace then enables an empty nested stage-2
+ * before prefaulting. Prefaulting must target the canonical stage-2,
+ * regardless of the vCPU's nested state.
+ */
+#include "kvm_util.h"
+#include "processor.h"
+#include "test_util.h"
+#include "ucall.h"
+
+#include <asm/sysreg.h>
+#include <linux/sizes.h>
+
+#define TEST_MEM_SLOT		10
+#define NESTED_S2_ROOT_SLOT	11
+#define TEST_MEM_SIZE		SZ_2M
+#define TEST_MEM_GPA		SZ_1G
+#define NESTED_S2_ROOT_GPA	(TEST_MEM_GPA + TEST_MEM_SIZE)
+
+struct nested_s2_state {
+	u64 hcr_el2;
+	u64 vttbr_el2;
+};
+
+static void guest_el1_code(void)
+{
+	u64 offset;
+
+	GUEST_ASSERT_EQ(get_current_el(), 1);
+
+	/* Exit to userspace with the vEL1 (nested) context live. */
+	GUEST_SYNC(1);
+
+	/*
+	 * Touch the prefaulted range. vstage-2 is disabled, so the shadow
+	 * stage-2 is a 1:1 view of the canonical IPA space.
+	 */
+	for (offset = 0; offset < TEST_MEM_SIZE; offset += SZ_4K)
+		READ_ONCE(*(u64 *)(TEST_MEM_GPA + offset));
+
+	GUEST_DONE();
+}
+
+static void guest_code(void)
+{
+	u64 sp;
+
+	GUEST_ASSERT_EQ(get_current_el(), 2);
+
+	/*
+	 * Mirror the EL2 translation regime into the real EL1 registers so
+	 * that vEL1 runs on the test's stage-1 page tables. With E2H=1, the
+	 * _EL1 accessors read the EL2 registers, and the _EL12 accessors
+	 * write the real EL1 registers.
+	 */
+	write_sysreg_s(read_sysreg(sctlr_el1), SYS_SCTLR_EL12);
+	write_sysreg_s(read_sysreg(tcr_el1), SYS_TCR_EL12);
+	write_sysreg_s(read_sysreg(ttbr0_el1), SYS_TTBR0_EL12);
+	write_sysreg_s(read_sysreg(mair_el1), SYS_MAIR_EL12);
+	write_sysreg_s(read_sysreg(cpacr_el1), SYS_CPACR_EL12);
+
+	/* Run vEL1 on the same stack. */
+	asm volatile("mov %0, sp" : "=r"(sp));
+	write_sysreg(sp, sp_el1);
+
+	/*
+	 * Drop TGE so that vEL1 is a nested context rather than host EL0.
+	 * KVM backs it with a shadow stage-2 MMU even though vstage-2 is
+	 * disabled (HCR_EL2.VM=0).
+	 */
+	write_sysreg(read_sysreg(hcr_el2) & ~HCR_EL2_TGE, hcr_el2);
+	isb();
+
+	write_sysreg(PSR_MODE_EL1h | PSR_F_BIT | PSR_I_BIT | PSR_A_BIT |
+		     PSR_D_BIT, spsr_el2);
+	write_sysreg((u64)guest_el1_code, elr_el2);
+	asm volatile("eret");
+
+	GUEST_ASSERT(false);
+}
+
+static void pre_fault(struct kvm_vcpu *vcpu, u64 gpa, u64 size)
+{
+	struct kvm_pre_fault_memory range = {
+		.gpa = gpa,
+		.size = size,
+	};
+	int ret;
+
+	do {
+		ret = __vcpu_ioctl(vcpu, KVM_PRE_FAULT_MEMORY, &range);
+	} while ((!ret && range.size) ||
+		 (ret < 0 && (errno == EINTR || errno == EAGAIN)));
+
+	TEST_ASSERT(!ret, "KVM_PRE_FAULT_MEMORY failed, ret: %d errno: %d",
+		    ret, errno);
+	TEST_ASSERT_EQ(range.size, 0);
+}
+
+static struct nested_s2_state enable_empty_nested_s2(struct kvm_vcpu *vcpu)
+{
+	struct nested_s2_state state = {
+		.hcr_el2 = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2)),
+		.vttbr_el2 = vcpu_get_reg(vcpu,
+					   KVM_ARM64_SYS_REG(SYS_VTTBR_EL2)),
+	};
+
+	TEST_ASSERT(!(state.hcr_el2 & HCR_EL2_TGE),
+		    "vCPU should be in nested/vEL1 context");
+
+	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_VTTBR_EL2),
+		     NESTED_S2_ROOT_GPA);
+	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2),
+		     state.hcr_el2 | HCR_EL2_VM);
+
+	return state;
+}
+
+static void restore_nested_s2(struct kvm_vcpu *vcpu,
+			      struct nested_s2_state *state)
+{
+	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2), state->hcr_el2);
+	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_VTTBR_EL2),
+		     state->vttbr_el2);
+}
+
+int main(void)
+{
+	struct nested_s2_state s2;
+	struct kvm_vcpu_init init;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct ucall uc;
+	u64 npages;
+
+	TEST_REQUIRE(kvm_check_cap(KVM_CAP_ARM_EL2));
+	TEST_REQUIRE(kvm_check_cap(KVM_CAP_PRE_FAULT_MEMORY));
+
+	vm = vm_create(1);
+
+	kvm_get_default_vcpu_target(vm, &init);
+	init.features[0] |= BIT(KVM_ARM_VCPU_HAS_EL2);
+	vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code);
+	kvm_arch_vm_finalize_vcpus(vm);
+
+	npages = TEST_MEM_SIZE / vm->page_size;
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, TEST_MEM_GPA,
+				    TEST_MEM_SLOT, npages, 0);
+	virt_map(vm, TEST_MEM_GPA, TEST_MEM_GPA, npages);
+
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+				    NESTED_S2_ROOT_GPA, NESTED_S2_ROOT_SLOT,
+				    vm_adjust_num_guest_pages(vm->mode, 1), 0);
+
+	/* Run the guest until it has ERET'd from vEL2 to vEL1. */
+	vcpu_run(vcpu);
+	switch (get_ucall(vcpu, &uc)) {
+	case UCALL_SYNC:
+		TEST_ASSERT_EQ(uc.args[1], 1);
+		break;
+	case UCALL_ABORT:
+		REPORT_GUEST_ASSERT(uc);
+		break;
+	default:
+		TEST_FAIL("Unhandled ucall: %ld", uc.cmd);
+	}
+
+	/*
+	 * The vCPU's last-run context is vEL1, backed by a shadow stage-2
+	 * MMU. Enable nested stage-2 with an empty root so that the ioctl
+	 * fails if it tries to interpret the userspace GPA as an L2 IPA.
+	 *
+	 * Prefault in two halves so that the second ioctl exercises a
+	 * repeated shadow-MMU attach and canonical stage-2 swap.
+	 *
+	 * (Note that an implementation that wrongly populates shadow
+	 * stage-2 page tables would not be caught as userland can't
+	 * inspect these.)
+	 */
+	s2 = enable_empty_nested_s2(vcpu);
+	pre_fault(vcpu, TEST_MEM_GPA, TEST_MEM_SIZE / 2);
+	pre_fault(vcpu, TEST_MEM_GPA + TEST_MEM_SIZE / 2, TEST_MEM_SIZE / 2);
+	restore_nested_s2(vcpu, &s2);
+
+	/* Resume at vEL1 and touch the prefaulted range. */
+	vcpu_run(vcpu);
+	switch (get_ucall(vcpu, &uc)) {
+	case UCALL_DONE:
+		break;
+	case UCALL_ABORT:
+		REPORT_GUEST_ASSERT(uc);
+		break;
+	default:
+		TEST_FAIL("Unhandled ucall: %ld", uc.cmd);
+	}
+
+	kvm_vm_free(vm);
+	return 0;
+}

-- 
2.55.0


