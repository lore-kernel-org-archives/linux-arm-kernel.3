Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8676606A334
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kWthCeRg;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=phcI9/rK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YYtZXvG9+UdS+4Z9GxZSoWsbkG0GwWt2msV5s/Y8pAo=; b=kWthCeRgwMR69J
	rYSaY8WOCEhjJxHuL3DCxIIDqbgME/X2sTU5K0tThLog30QKjv5KSRt990LnQU5JCxrpSPQGHJThm
	/KdkW+98z585V+xYqxBXPlhZOBcQ994eNQkTxRO57FRVaOSjBZ2TPeGJNiW3/qkrXzVgd4TK+//gt
	R5Ln/B0yF8RJOmPCKXOUI+VNIRbaY23KZJqTViVLqzwah0Hgf+nZJhGlAtEu5uUBEwaNOUsjKRRqM
	/ZvaIKpsBkIDBpHOX0gjTFsM5cdq8hM80/uP3H0X0y0eU2KVLUOHiDdrh1uodLJ5AP3aEzeVwtAOj
	n0hTsLi7WtbkfvsYJCyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWhq-00000004mW4-4B6O;
	Wed, 04 Nov 2026 08:50:54 +0000
Received: from out-244.mta1.migadu.com ([95.215.58.244] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWhj-00000004mQC-0m1G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:50:53 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Ia4ROUhNRdc6AFPTEZfdVXbpoKxOmfz2LXLKwxYl31Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793782245; v=1; x=1794387045;
 b=phcI9/rKxlOSpz5zlsSr4yNnVqAYZwezIzSGB3yDKYoTKTLeyRDJRVNPlVQgDjHWTrUCRfBQ
 MmHPJkztcGO+aTRitHsXqMgHolxmrL0g+GAsvq+XVEVmOKvwETHesP0OPve8WPOwOz5F7DVYvL8
 LLds8dZ/Y0uYZX9u6M9uAGA8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3647c177266f6c99;
	Wed, 04 Nov 2026 08:50:44 +0000
X-Mizu-Trace-ID: 3647c177266f6c99
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
Subject: [PATCH 16/16] KVM: arm64: selftests: Add pkvm_exceptions debug and SError test
Date: Wed,  4 Nov 2026 08:48:42 +0000
Message-ID: <20261104084842.132944-17-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104084842.132944-1-fuad.tabba@linux.dev>
References: <20261104084842.132944-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_005047_383559_D68D93B1 
X-CRM114-Status: GOOD (  19.06  )
X-Spam-Score: -2.1 (--)
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

pKVM can hide self-hosted debug from a protected guest, which then reads
ID_AA64DFR0_EL1.DebugVer as 0. A virtual SError the host injects has to
be delivered by EL2, since the host can't see whether the guest has it
masked.

Verify that the guest's own handler takes a hardware breakpoint, a
watchpoint and a single step, and that an injected SError is pending in
ISR_EL1.A while PSTATE.A masks it and is taken once unmasked. The debug
cases skip while ID_AA64DFR0_EL1.DebugVer is 0.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/pkvm_exceptions.c     | 261 ++++++++++++++++++
 2 files changed, 262 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_exceptions.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 214f38e3f67a7..1045136aacc16 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -190,6 +190,7 @@ TEST_GEN_PROGS_arm64 += arm64/nv_pre_fault_memory_test
 TEST_GEN_PROGS_arm64 += arm64/external_aborts
 TEST_GEN_PROGS_arm64 += arm64/mmio_sign_ext
 TEST_GEN_PROGS_arm64 += arm64/page_fault_test
+TEST_GEN_PROGS_arm64 += arm64/pkvm_exceptions
 TEST_GEN_PROGS_arm64 += arm64/pkvm_host_abi
 TEST_GEN_PROGS_arm64 += arm64/pkvm_id_regs
 TEST_GEN_PROGS_arm64 += arm64/pkvm_irq
diff --git a/tools/testing/selftests/kvm/arm64/pkvm_exceptions.c b/tools/testing/selftests/kvm/arm64/pkvm_exceptions.c
new file mode 100644
index 0000000000000..f7f9b666dd089
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/pkvm_exceptions.c
@@ -0,0 +1,261 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pkvm_exceptions - debug exceptions and a virtual SError in a protected VM.
+ *
+ * Copyright (C) 2026 Google LLC
+ * Author: Fuad Tabba <fuad.tabba@linux.dev>
+ */
+
+#include "kvm_util.h"
+#include "pkvm.h"
+#include "processor.h"
+#include "test_util.h"
+
+/* Debug register programming bits, as debug-exceptions.c has them. */
+#define DBGBCR_LEN8	(0xff << 5)
+#define DBGBCR_EXEC	(0x0 << 3)
+#define DBGBCR_EL1	(0x1 << 1)
+#define DBGBCR_E	(0x1 << 0)
+
+#define DBGWCR_LEN8	(0xff << 5)
+#define DBGWCR_RD	(0x1 << 3)
+#define DBGWCR_WR	(0x2 << 3)
+#define DBGWCR_EL1	(0x1 << 1)
+#define DBGWCR_E	(0x1 << 0)
+
+#define SPSR_SS		(1 << 21)
+
+#define NR_STEPS	3
+
+enum { CMD_INJECT_SERROR, CMD_CHECK_SERROR };
+
+extern unsigned char hw_bp, ss_start;
+
+static volatile u64 ex_pc, ex_addr;
+static volatile u64 ss_addr[NR_STEPS + 1];
+static volatile int ss_idx;
+static volatile char write_data;
+static volatile bool serror_taken;
+
+static bool debug_exposed;
+
+/* Masks debug on return so the breakpointed instruction runs. */
+static void hw_bp_handler(struct ex_regs *regs)
+{
+	ex_pc = regs->pc;
+	regs->pstate |= PSR_D_BIT;
+}
+
+/* Records FAR, the accessed address, and masks debug on return so the access completes. */
+static void wp_handler(struct ex_regs *regs)
+{
+	ex_pc = regs->pc;
+	ex_addr = read_sysreg(far_el1);
+	regs->pstate |= PSR_D_BIT;
+}
+
+/* Records the stepped PC and sets SPSR.SS so that the next instruction is stepped too. */
+static void ss_handler(struct ex_regs *regs)
+{
+	__GUEST_ASSERT(ss_idx <= NR_STEPS, "step %d past the stepped range", ss_idx);
+	ss_addr[ss_idx++] = regs->pc;
+	regs->pstate |= SPSR_SS;
+}
+
+static void reset_debug_state(void)
+{
+	asm volatile("msr daifset, #8");
+
+	/* Clear the OS lock and double lock so debug exceptions are permitted. */
+	write_sysreg(0, osdlr_el1);
+	write_sysreg(0, oslar_el1);
+	isb();
+
+	write_sysreg(0, mdscr_el1);
+	write_sysreg(0, dbgbcr0_el1);
+	write_sysreg(0, dbgbvr0_el1);
+	write_sysreg(0, dbgwcr0_el1);
+	write_sysreg(0, dbgwvr0_el1);
+	isb();
+
+	ex_pc = 0;
+	ex_addr = 0;
+}
+
+/* A zero DebugVer means EL2 hides self-hosted debug, so the case has nothing to test. */
+static bool guest_debug_exposed(void)
+{
+	bool exposed = SYS_FIELD_GET(ID_AA64DFR0_EL1, DebugVer, read_sysreg(id_aa64dfr0_el1));
+
+	GUEST_SYNC(exposed);
+	return exposed;
+}
+
+static void enable_monitor_debug(void)
+{
+	asm volatile("msr daifclr, #8");
+	write_sysreg(read_sysreg(mdscr_el1) | MDSCR_EL1_KDE | MDSCR_EL1_MDE, mdscr_el1);
+	isb();
+}
+
+static void guest_hw_breakpoint(void)
+{
+	pkvm_guest_init();
+	if (!guest_debug_exposed())
+		GUEST_DONE();
+
+	reset_debug_state();
+	write_sysreg(DBGBCR_LEN8 | DBGBCR_EXEC | DBGBCR_EL1 | DBGBCR_E, dbgbcr0_el1);
+	write_sysreg((u64)&hw_bp, dbgbvr0_el1);
+	enable_monitor_debug();
+	asm volatile("hw_bp: nop");
+	GUEST_ASSERT_EQ(ex_pc, (u64)&hw_bp);
+
+	reset_debug_state();
+	GUEST_DONE();
+}
+
+static void guest_watchpoint(void)
+{
+	pkvm_guest_init();
+	if (!guest_debug_exposed())
+		GUEST_DONE();
+
+	reset_debug_state();
+	write_sysreg(DBGWCR_LEN8 | DBGWCR_RD | DBGWCR_WR | DBGWCR_EL1 | DBGWCR_E, dbgwcr0_el1);
+	/*
+	 * BAS = 0xff watches all eight bytes only from a doubleword-aligned DBGWVR.
+	 * FAR still holds the byte's address.
+	 */
+	write_sysreg((u64)&write_data & ~7UL, dbgwvr0_el1);
+	enable_monitor_debug();
+	write_data = 'x';
+	GUEST_ASSERT_EQ(write_data, 'x');
+	GUEST_ASSERT_EQ(ex_addr, (u64)&write_data);
+
+	reset_debug_state();
+	GUEST_DONE();
+}
+
+static void guest_single_step(void)
+{
+	pkvm_guest_init();
+	if (!guest_debug_exposed())
+		GUEST_DONE();
+
+	reset_debug_state();
+	write_sysreg(read_sysreg(mdscr_el1) | MDSCR_EL1_KDE | MDSCR_EL1_SS, mdscr_el1);
+	isb();
+	ss_idx = 0;
+	/* Unmasking makes the step active-pending, so the first one is taken at ss_start. */
+	asm volatile("msr daifclr, #8\n"
+		     "ss_start:\n"
+		     "mrs x0, esr_el1\n"
+		     "add x0, x0, #1\n"
+		     "msr daifset, #8\n"
+		     : : : "x0");
+	GUEST_ASSERT_EQ(ss_addr[0], (u64)&ss_start);
+	GUEST_ASSERT_EQ(ss_addr[1], (u64)&ss_start + 4);
+	GUEST_ASSERT_EQ(ss_addr[2], (u64)&ss_start + 8);
+
+	reset_debug_state();
+	GUEST_DONE();
+}
+
+static void serror_handler(struct ex_regs *regs)
+{
+	GUEST_ASSERT_EQ(ESR_ELx_EC(read_sysreg(esr_el1)), ESR_ELx_EC_SERROR);
+	serror_taken = true;
+}
+
+/*
+ * The guest sees the injected SError in ISR_EL1.A while PSTATE.A masks it, and
+ * takes it on unmasking. EL2 has to deliver it through HCR_EL2.VSE, because the
+ * host can't read a protected guest's PSTATE.A for serror_is_masked().
+ */
+static void guest_serror(void)
+{
+	pkvm_guest_init();
+
+	GUEST_SYNC(CMD_INJECT_SERROR);
+	GUEST_ASSERT(read_sysreg(isr_el1) & ISR_EL1_A);
+	GUEST_ASSERT(!serror_taken);
+
+	local_serror_enable();
+	isb();
+	local_serror_disable();
+
+	GUEST_ASSERT(serror_taken);
+	GUEST_SYNC(CMD_CHECK_SERROR);
+	GUEST_DONE();
+}
+
+static void serror_sync(struct kvm_vcpu *vcpu, struct ucall *uc)
+{
+	struct kvm_vcpu_events events = {};
+
+	switch (uc->args[1]) {
+	case CMD_INJECT_SERROR:
+		events.exception.serror_pending = true;
+		vcpu_events_set(vcpu, &events);
+		memset(&events, 0, sizeof(events));
+		vcpu_events_get(vcpu, &events);
+		TEST_ASSERT(events.exception.serror_pending, "vSError not pending after injection");
+		break;
+	case CMD_CHECK_SERROR:
+		vcpu_events_get(vcpu, &events);
+		TEST_ASSERT(!events.exception.serror_pending, "vSError still pending once taken");
+		break;
+	}
+}
+
+static void test_serror(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	vm = pkvm_vm_create_with_one_vcpu(&vcpu, guest_serror);
+	vm_install_exception_handler(vm, VECTOR_ERROR_CURRENT, serror_handler);
+	pkvm_run_loop(vcpu, serror_sync);
+	kvm_vm_free(vm);
+}
+
+static void debug_sync(struct kvm_vcpu *vcpu, struct ucall *uc)
+{
+	debug_exposed = uc->args[1];
+}
+
+static void run_debug_guest(void *guest_code, int ec, handler_fn handler, const char *name)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	vm = pkvm_vm_create_with_one_vcpu(&vcpu, guest_code);
+	vm_install_sync_handler(vm, VECTOR_SYNC_CURRENT, ec, handler);
+	pkvm_run_loop(vcpu, debug_sync);
+	kvm_vm_free(vm);
+
+	if (debug_exposed)
+		ksft_test_result_pass("%s\n", name);
+	else
+		ksft_test_result_skip("%s: self-hosted debug not exposed to protected guests\n",
+				      name);
+}
+
+int main(void)
+{
+	TEST_REQUIRE(pkvm_supported());
+
+	ksft_print_header();
+	ksft_set_plan(4);
+
+	run_debug_guest(guest_hw_breakpoint, ESR_ELx_EC_BREAKPT_CUR, hw_bp_handler,
+			"hardware breakpoint");
+	run_debug_guest(guest_watchpoint, ESR_ELx_EC_WATCHPT_CUR, wp_handler, "watchpoint");
+	run_debug_guest(guest_single_step, ESR_ELx_EC_SOFTSTP_CUR, ss_handler, "single step");
+
+	test_serror();
+	ksft_test_result_pass("virtual SError taken on unmasking\n");
+
+	ksft_finished();
+}
-- 
2.47.3


