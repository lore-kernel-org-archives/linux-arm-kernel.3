Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0DB606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KKZPCBrs;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TVC88dU9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Pa0H4pvSpXhIosp0Z9BivoHKZFSY5uhLVcz2T8kz+wQ=; b=KKZPCBrsYyr3VS
	3FapFLOXpK1iEdZ/xu5+xy6B8MdncKV4TAExNv+Wru+ApKeEyUr75lJy869pfLNYW3V/vHyL/oPFi
	dM+jSanKONNQrrtTXsBsk+HPtlF1n/JU33xAtBfZjMAREOEXcBiDbtUP0WxE+D60XXiCEZsxSnqM2
	1cb4YHz72h72AxLYBHZUZPuSf9wtY7tdIZTrP1UVbQnb94w9xUwWKK5s2gD86FsCmDUc5Hydagw4K
	uLNKLb9hg8dxBptF4lUCVrWnLA156eBjbdrT3kTBgy9FihzRSwSdHi/pejSBkW+VoRsrkD7I0VJGm
	ml0Myy37Wp1R6UOIreZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWgV-00000004lOK-0lac;
	Wed, 04 Nov 2026 08:49:31 +0000
Received: from out-89.mta1.migadu.com ([95.215.58.89] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWgQ-00000004lJW-2Drg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:49:28 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=yOa5lZBmMi7TsjJau8csn2ANXha3cExvnG6M+aW+Y8o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793782164; v=1; x=1794386964;
 b=TVC88dU90YugXGpm0TYriV68V1tF+YnLInNp3Vai011vdxsoKYGMmKa+bMFem4+UsnoWMpVY
 GnGJ6INEdRRVDzAmro39yXXi6nDcnwikdlS5gwawH5oopGtWwAAjxQ+jPXQ86GahJVZHknRwgXX
 uXs/mnJyM43b9wxI18mQlhfo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9f9e68b2a904d89b;
	Wed, 04 Nov 2026 08:49:24 +0000
X-Mizu-Trace-ID: 9f9e68b2a904d89b
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/16] KVM: arm64: selftests: Add protected-VM library helpers
Date: Wed,  4 Nov 2026 08:48:32 +0000
Message-ID: <20261104084842.132944-7-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104084842.132944-1-fuad.tabba@linux.dev>
References: <20261104084842.132944-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_004926_723190_C335BA62 
X-CRM114-Status: GOOD (  24.86  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A protected-VM test has to create the VM with the protected type and the
PSCI 0.2 vCPU feature, boot each vCPU through the trampoline from an
identity-mapped page, and have the guest share the ucall pool before its
first ucall. Secondaries start powered off for the guest to boot with
CPU_ON. A vCPU becomes a valid CPU_ON target only at its first KVM_RUN.

Add lib/arm64/pkvm.c to do this for the tests.
pkvm_vcpu_setup_boot_secondary() runs a secondary once with
immediate_exit set, so that it becomes a CPU_ON target. The library also
has a run loop, an SMCCC call for the guest, and a reader of the
process's locked-memory count. The host adds a protected VM's pinned
pages to that count. No capability advertises pKVM, so pkvm_supported()
tries to create a protected VM.

Co-developed-by: Will Deacon <will@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/include/arm64/pkvm.h        |  24 ++
 tools/testing/selftests/kvm/lib/arm64/pkvm.c  | 245 ++++++++++++++++++
 3 files changed, 270 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/lib/arm64/pkvm.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index c254e82f9a786..e173a9adad3f2 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -34,6 +34,7 @@ LIBKVM_arm64 += lib/arm64/gic.c
 LIBKVM_arm64 += lib/arm64/gic_v3.c
 LIBKVM_arm64 += lib/arm64/gic_v3_its.c
 LIBKVM_arm64 += lib/arm64/handlers.S
+LIBKVM_arm64 += lib/arm64/pkvm.c
 LIBKVM_arm64 += lib/arm64/processor.c
 LIBKVM_arm64 += lib/arm64/pvm-entry.S
 LIBKVM_arm64 += lib/arm64/spinlock.c
diff --git a/tools/testing/selftests/kvm/include/arm64/pkvm.h b/tools/testing/selftests/kvm/include/arm64/pkvm.h
index 6ef769b8ff977..413c7ac4a9f16 100644
--- a/tools/testing/selftests/kvm/include/arm64/pkvm.h
+++ b/tools/testing/selftests/kvm/include/arm64/pkvm.h
@@ -9,6 +9,9 @@
 #define SELFTEST_KVM_ARM64_PKVM_H
 
 #ifndef __ASSEMBLER__
+#include "kvm_util.h"
+#include "ucall_common.h"
+
 /*
  * Register state the boot trampoline (pvm-entry.S) restores. Only PC and X0
  * survive to a protected guest's first run, so X0 points at this block.
@@ -27,6 +30,27 @@ struct pvm_boot_args {
 	u64	tpidr_el1;
 	u64	sp_el1;
 };
+
+/* Memslot of the trampoline's page. Test memslots start above it. */
+#define PKVM_IDMAP_MEMSLOT	1
+
+bool pkvm_supported(void);
+struct kvm_vm *pkvm_vm_create(unsigned int nr_vcpus, u32 features, struct kvm_vcpu *vcpus[]);
+struct kvm_vm *pkvm_vm_create_with_one_vcpu(struct kvm_vcpu **vcpu, void *guest_code);
+
+/* Call after all register setup: later register writes don't reach the guest. */
+void pkvm_vcpu_setup_boot(struct kvm_vcpu *vcpu, void *guest_code);
+
+/* Call before the primary's first run. */
+gpa_t pkvm_vcpu_setup_boot_secondary(struct kvm_vcpu *vcpu, void *guest_code);
+gpa_t pkvm_idmap_gpa(struct kvm_vm *vm);
+
+void pkvm_run_loop(struct kvm_vcpu *vcpu, void (*on_sync)(struct kvm_vcpu *vcpu, struct ucall *uc));
+size_t pkvm_host_locked_vm(void);
+
+unsigned long pkvm_hvc(u32 func, u64 arg0, u64 arg1, u64 arg2);
+
+void pkvm_guest_init(void);
 #endif
 
 #define PVM_BOOT_ARGS_OFF_JUMP_TGT	0
diff --git a/tools/testing/selftests/kvm/lib/arm64/pkvm.c b/tools/testing/selftests/kvm/lib/arm64/pkvm.c
new file mode 100644
index 0000000000000..f2d4cf48966e8
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/arm64/pkvm.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Protected-VM support for the arm64 KVM selftest library.
+ *
+ * Copyright (C) 2025 Google LLC
+ * Author: Fuad Tabba <fuad.tabba@linux.dev>
+ * Author: Will Deacon <will@kernel.org>
+ */
+
+#include <errno.h>
+
+#include <linux/arm-smccc.h>
+#include <linux/kernel.h>
+
+#include "kvm_util.h"
+#include "pkvm.h"
+#include "processor.h"
+#include "ucall_common.h"
+
+/* Set in the guest's copy only, by pkvm_vm_create(). */
+static gpa_t pkvm_ucall_pool_gpa;
+static size_t pkvm_ucall_pool_size;
+
+extern char pvm_entry_start[], pvm_entry_end[];
+
+#define ASSERT_BOOT_ARGS_OFF(field, off)				\
+	static_assert(offsetof(struct pvm_boot_args, field) == PVM_BOOT_ARGS_OFF_##off, #off)
+
+ASSERT_BOOT_ARGS_OFF(jump_tgt, JUMP_TGT);
+ASSERT_BOOT_ARGS_OFF(regs[0], X0);
+ASSERT_BOOT_ARGS_OFF(regs[1], X1);
+ASSERT_BOOT_ARGS_OFF(regs[2], X2);
+ASSERT_BOOT_ARGS_OFF(regs[3], X3);
+ASSERT_BOOT_ARGS_OFF(regs[4], X4);
+ASSERT_BOOT_ARGS_OFF(regs[5], X5);
+ASSERT_BOOT_ARGS_OFF(regs[6], X6);
+ASSERT_BOOT_ARGS_OFF(regs[7], X7);
+ASSERT_BOOT_ARGS_OFF(cpacr_el1, CPACR_EL1);
+ASSERT_BOOT_ARGS_OFF(sctlr_el1, SCTLR_EL1);
+ASSERT_BOOT_ARGS_OFF(tcr_el1, TCR_EL1);
+ASSERT_BOOT_ARGS_OFF(mair_el1, MAIR_EL1);
+ASSERT_BOOT_ARGS_OFF(ttbr0_el1, TTBR0_EL1);
+ASSERT_BOOT_ARGS_OFF(vbar_el1, VBAR_EL1);
+ASSERT_BOOT_ARGS_OFF(tpidr_el1, TPIDR_EL1);
+ASSERT_BOOT_ARGS_OFF(sp_el1, SP_EL1);
+
+unsigned long pkvm_hvc(u32 func, u64 arg0, u64 arg1, u64 arg2)
+{
+	struct arm_smccc_res res;
+
+	smccc_hvc(func, arg0, arg1, arg2, 0, 0, 0, 0, &res);
+	return res.a0;
+}
+
+/* Shares whole granules, so pages next to the pool are shared with it. */
+void pkvm_guest_init(void)
+{
+	u64 granule = pkvm_hvc(ARM_SMCCC_VENDOR_HYP_KVM_HYP_MEMINFO_FUNC_ID, 0, 0, 0);
+	gpa_t end = pkvm_ucall_pool_gpa + pkvm_ucall_pool_size;
+	gpa_t gpa;
+
+	for (gpa = pkvm_ucall_pool_gpa & ~(granule - 1); gpa < end; gpa += granule)
+		GUEST_ASSERT_EQ(pkvm_hvc(ARM_SMCCC_VENDOR_HYP_KVM_MEM_SHARE_FUNC_ID, gpa, 0, 0), 0);
+}
+
+bool pkvm_supported(void)
+{
+	int kvm_fd, vm_fd;
+
+	kvm_fd = open_kvm_dev_path_or_exit();
+	vm_fd = __kvm_ioctl(kvm_fd, KVM_CREATE_VM, (void *)KVM_VM_TYPE_ARM_PROTECTED);
+
+	if (vm_fd >= 0)
+		close(vm_fd);
+	close(kvm_fd);
+
+	return vm_fd >= 0;
+}
+
+/*
+ * The trampoline turns the MMU on, so it runs from an identity-mapped page:
+ * the first guest page of a host page at the top of the IPA space.
+ */
+gpa_t pkvm_idmap_gpa(struct kvm_vm *vm)
+{
+	unsigned int npages = vm_adjust_num_guest_pages(vm->mode, 1);
+
+	return (vm_compute_max_gfn(vm) + 1 - npages) * vm->page_size;
+}
+
+struct kvm_vm *pkvm_vm_create(unsigned int nr_vcpus, u32 features, struct kvm_vcpu *vcpus[])
+{
+	struct vm_shape shape = VM_SHAPE_DEFAULT;
+	struct kvm_vm *vm;
+	gpa_t idmap_gpa;
+	unsigned int i;
+
+	TEST_ASSERT(pvm_entry_end - pvm_entry_start +
+		    nr_vcpus * sizeof(struct pvm_boot_args) <= MIN_PAGE_SIZE,
+		    "trampoline and %u boot-args blocks overflow the idmap page", nr_vcpus);
+
+	shape.type = KVM_VM_TYPE_ARM_PROTECTED;
+	vm = __vm_create(shape, nr_vcpus, 0);
+
+	for (i = 0; i < nr_vcpus; i++) {
+		struct kvm_vcpu_init init;
+
+		kvm_get_default_vcpu_target(vm, &init);
+		init.features[0] |= features | BIT(KVM_ARM_VCPU_PSCI_0_2);
+		if (i > 0)
+			init.features[0] |= BIT(KVM_ARM_VCPU_POWER_OFF);
+
+		vcpus[i] = aarch64_vcpu_add(vm, i, &init, NULL);
+	}
+	kvm_arch_vm_finalize_vcpus(vm);
+
+	idmap_gpa = pkvm_idmap_gpa(vm);
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, idmap_gpa, PKVM_IDMAP_MEMSLOT,
+				    vm_adjust_num_guest_pages(vm->mode, 1), 0);
+	memcpy(addr_gpa2hva(vm, idmap_gpa), pvm_entry_start, pvm_entry_end - pvm_entry_start);
+	virt_map(vm, idmap_gpa, idmap_gpa, 1);
+
+	vm_init_descriptor_tables(vm);
+	for (i = 0; i < nr_vcpus; i++) {
+		vcpu_set_reg(vcpus[i], ARM64_CORE_REG(regs.pc), idmap_gpa);
+		vcpu_init_descriptor_tables(vcpus[i]);
+	}
+
+	write_guest_global(vm, pkvm_ucall_pool_gpa, get_ucall_pool_gpa(vm));
+	write_guest_global(vm, pkvm_ucall_pool_size,
+			   ucall_nr_pages_required(vm->page_size) * vm->page_size);
+
+	return vm;
+}
+
+/* Every block must be written before the primary's first run, when the host donates the page. */
+static gpa_t pkvm_boot_args_gpa(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vm *vm = vcpu->vm;
+
+	return pkvm_idmap_gpa(vm) + vm->page_size - (vcpu->id + 1) * sizeof(struct pvm_boot_args);
+}
+
+static void pkvm_snapshot_boot_args(struct kvm_vcpu *vcpu, void *guest_code)
+{
+	struct pvm_boot_args *args = addr_gpa2hva(vcpu->vm, pkvm_boot_args_gpa(vcpu));
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(args->regs); i++)
+		args->regs[i] = vcpu_get_reg(vcpu, ARM64_CORE_REG(regs.regs[i]));
+
+	args->jump_tgt  = (u64)guest_code;
+	args->cpacr_el1 = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_CPACR_EL1));
+	args->sctlr_el1 = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_SCTLR_EL1));
+	args->tcr_el1   = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TCR_EL1));
+	args->mair_el1  = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MAIR_EL1));
+	args->ttbr0_el1 = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TTBR0_EL1));
+	args->vbar_el1  = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_VBAR_EL1));
+	args->tpidr_el1 = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TPIDR_EL1));
+	args->sp_el1    = vcpu_get_reg(vcpu, ARM64_CORE_REG(sp_el1));
+}
+
+void pkvm_vcpu_setup_boot(struct kvm_vcpu *vcpu, void *guest_code)
+{
+	pkvm_snapshot_boot_args(vcpu, guest_code);
+	vcpu_set_reg(vcpu, ARM64_CORE_REG(regs.regs[0]), pkvm_boot_args_gpa(vcpu));
+}
+
+gpa_t pkvm_vcpu_setup_boot_secondary(struct kvm_vcpu *vcpu, void *guest_code)
+{
+	int ret;
+
+	pkvm_snapshot_boot_args(vcpu, guest_code);
+
+	/*
+	 * A guest's CPU_ON requires the target's hyp vCPU, which KVM_RUN creates.
+	 * With immediate_exit set, KVM_RUN returns before the vCPU runs.
+	 */
+	vcpu->run->immediate_exit = 1;
+	ret = __vcpu_run(vcpu);
+	vcpu->run->immediate_exit = 0;
+	TEST_ASSERT(ret == -1 && errno == EINTR,
+		    "secondary hyp-vCPU registration: rc %d errno %d", ret, errno);
+
+	return pkvm_boot_args_gpa(vcpu);
+}
+
+struct kvm_vm *pkvm_vm_create_with_one_vcpu(struct kvm_vcpu **vcpu, void *guest_code)
+{
+	struct kvm_vm *vm = pkvm_vm_create(1, 0, vcpu);
+
+	pkvm_vcpu_setup_boot(*vcpu, guest_code);
+	return vm;
+}
+
+void pkvm_run_loop(struct kvm_vcpu *vcpu, void (*on_sync)(struct kvm_vcpu *vcpu, struct ucall *uc))
+{
+	bool done = false;
+	struct ucall uc;
+
+	while (!done) {
+		u64 cmd;
+
+		vcpu_run(vcpu);
+
+		switch (cmd = get_ucall(vcpu, &uc)) {
+		case UCALL_SYNC:
+			if (on_sync)
+				on_sync(vcpu, &uc);
+			break;
+		case UCALL_DONE:
+			done = true;
+			break;
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+			break;
+		case UCALL_PRINTF:
+			REPORT_GUEST_PRINTF(uc);
+			break;
+		default:
+			TEST_FAIL("Unexpected guest exit: ucall %lu, arg %lu", cmd, uc.args[1]);
+		}
+	}
+}
+
+/* Bytes the current process has locked, per RLIMIT_MEMLOCK accounting. */
+size_t pkvm_host_locked_vm(void)
+{
+	size_t size = 0, locked_kb = 0;
+	char *line = NULL;
+	FILE *f;
+
+	f = fopen("/proc/self/status", "r");
+	TEST_ASSERT(f, "fopen /proc/self/status");
+
+	while (getline(&line, &size, f) > 0) {
+		if (sscanf(line, "VmLck:\t%zu kB", &locked_kb) == 1)
+			break;
+	}
+
+	free(line);
+	fclose(f);
+
+	return locked_kb << 10;
+}
-- 
2.47.3


