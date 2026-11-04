Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C69606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nnX5hyh2;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nidFAkWC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cEjGGc4ra+Jku+/t9g0Fp5ckv970tCkfQhpv01qfbxk=; b=nnX5hyh2AJ4G5d
	ZQJlRB5eDJNpjboz8xN4BMaUics4Z5a1/ffstdND1C/duClpAAmoOWAlaaAd8tioLxPQ56LQgdxos
	ApO2ydPfVPCoWdbTghMVrVSXtudyBsFJYeMarfQY4/gdmobZC0jX6kXfm3LBvcqNVTwH+8tv0kc/4
	MekVS4cq1f0lliGZwZh5uFY1TGcoYf8vLdFJTbDdC1HFixeT+MEqzQWzzF/pxswP7v3ZHAF2xbRdx
	2jxs6VOp7V3db4RoZRa/xm6CJjmbaC7n4g3nf3tQDylCkjd9xyezz3O2ea993XkqIBOpFzRDr443/
	Kcyz3vtTwLMoAEjpFtoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWh6-00000004lxI-2GND;
	Wed, 04 Nov 2026 08:50:08 +0000
Received: from out-243.mta0.migadu.com ([2001:41d0:1004:224b::f3] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWh1-00000004lrZ-116w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:50:04 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=hbXO7VRqPpHhMkTHPIX3sU6rDHeRwFxxaEjp+HLzH4U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793782200; v=1; x=1794387000;
 b=nidFAkWCZmib6vpbWKRZdvEDDxHdPfVo4sOr+3Q3p8x1gSp2iRJPYe6+k/kbkvYDlFfh9bsH
 suLu1dB1HUn8qgFnxAYk399blCjPG6rOJ94tJwnjI7PoxLKePXlPRXgS9Z5LmV10jyW4iH6Hlna
 y3GSFAnqKz3RXJaX6Oh1JFes=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 0757b0a4fa57e123;
	Wed, 04 Nov 2026 08:50:00 +0000
X-Mizu-Trace-ID: 0757b0a4fa57e123
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
Subject: [PATCH 11/16] KVM: arm64: selftests: Add pkvm_id_regs register and trap test
Date: Wed,  4 Nov 2026 08:48:37 +0000
Message-ID: <20261104084842.132944-12-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104084842.132944-1-fuad.tabba@linux.dev>
References: <20261104084842.132944-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_005003_580501_893F7C3E 
X-CRM114-Status: GOOD (  20.57  )
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

pKVM gives a protected guest its own view of the ID registers, which
hides the features pKVM doesn't support. The registers of those features
UNDEF in the guest, except some of the hidden debug registers, which
read as zero and ignore writes.

Test that view and those UNDEFs from the guest, along with the registers
EL2 emulates with fixed values. The debug checks read
ID_AA64DFR0_EL1.DebugVer to choose between the hidden view and the
exposed one. PtrAuth, which a protected VM can be granted, gets its own
case.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/pkvm_id_regs.c        | 306 ++++++++++++++++++
 2 files changed, 307 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_id_regs.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 6bb436bd36205..8855c9abb2fd0 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -191,6 +191,7 @@ TEST_GEN_PROGS_arm64 += arm64/external_aborts
 TEST_GEN_PROGS_arm64 += arm64/mmio_sign_ext
 TEST_GEN_PROGS_arm64 += arm64/page_fault_test
 TEST_GEN_PROGS_arm64 += arm64/pkvm_host_abi
+TEST_GEN_PROGS_arm64 += arm64/pkvm_id_regs
 TEST_GEN_PROGS_arm64 += arm64/pkvm_mem_share
 TEST_GEN_PROGS_arm64 += arm64/pkvm_psci
 TEST_GEN_PROGS_arm64 += arm64/pkvm_smccc
diff --git a/tools/testing/selftests/kvm/arm64/pkvm_id_regs.c b/tools/testing/selftests/kvm/arm64/pkvm_id_regs.c
new file mode 100644
index 0000000000000..10c77ad9601dc
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/pkvm_id_regs.c
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pkvm_id_regs - the ID registers a protected VM sees, and which of its
+ * register accesses UNDEF.
+ *
+ * Copyright (C) 2025 Google LLC
+ * Author: Fuad Tabba <fuad.tabba@linux.dev>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+
+#include "gic_v3.h"
+#include "kvm_util.h"
+#include "pkvm.h"
+#include "processor.h"
+#include "test_util.h"
+
+/* vCPU 0's MPIDR: Aff0=0, bit31=1, MT=0. */
+#define MPIDR_VCPU0	0x80000000UL
+
+/* Hidden fields with a non-zero Not-Implemented encoding. */
+#define PVM_ID_AA64DFR0_NI	(					\
+	SYS_FIELD_PREP_ENUM(ID_AA64DFR0_EL1, DoubleLock, NI) |		\
+	SYS_FIELD_PREP_ENUM(ID_AA64DFR0_EL1, MTPMU, NI))
+#define PVM_ID_AA64MMFR4_NI	SYS_FIELD_PREP_ENUM(ID_AA64MMFR4_EL1, E2H0, NI)
+
+/* What self-hosted debug exposes: DebugVer and the breakpoint, watchpoint and CTX counts. */
+#define PVM_ID_AA64DFR0_DEBUG	(ID_AA64DFR0_EL1_DebugVer_MASK | ID_AA64DFR0_EL1_BRPs_MASK | \
+				 ID_AA64DFR0_EL1_WRPs_MASK | ID_AA64DFR0_EL1_CTX_CMPs_MASK)
+
+/* Breakpoint and watchpoint 0 controls with E clear: every byte, EL1, loads and stores. */
+#define DBGBCR_VAL	((0xfUL << 5) | (1UL << 1))
+#define DBGWCR_VAL	((0xffUL << 5) | (3UL << 3) | (1UL << 1))
+
+extern unsigned char brk_insn;
+
+static volatile bool undef_seen;
+static volatile u64 brk_pc;
+
+static void undef_handler(struct ex_regs *regs)
+{
+	undef_seen = true;
+	regs->pc += 4;
+}
+
+static void brk_handler(struct ex_regs *regs)
+{
+	brk_pc = regs->pc;
+	regs->pc += 4;
+}
+
+/* Access @expr must make the guest take an UNDEF (EC_UNKNOWN). */
+#define GUEST_ASSERT_UNDEF(expr) do {	\
+	undef_seen = false;		\
+	expr;				\
+	GUEST_ASSERT(undef_seen);	\
+} while (0)
+
+/* @reg reads back @pattern with no UNDEF. */
+#define GUEST_ASSERT_RW(reg, pattern) do {		\
+	u64 __saved = read_sysreg_s(reg);		\
+	undef_seen = false;				\
+	write_sysreg_s(pattern, reg);			\
+	GUEST_ASSERT_EQ(read_sysreg_s(reg), pattern);	\
+	write_sysreg_s(__saved, reg);			\
+	GUEST_ASSERT(!undef_seen);			\
+} while (0)
+
+static void assert_aarch32_id_raz(void)
+{
+	/* AArch32 is unsupported for protected guests: its ID block reads 0. */
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_PFR0_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_PFR1_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_DFR0_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_AFR0_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_MMFR0_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_MMFR1_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_MMFR2_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_MMFR3_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_ISAR0_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_ISAR1_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_ISAR2_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_ISAR3_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_ISAR4_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_ISAR5_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_MMFR4_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_ISAR6_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_MVFR0_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_MVFR1_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_MVFR2_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(sys_reg(3, 0, 0, 3, 3)), 0);	/* unallocated */
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_PFR2_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_DFR1_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_MMFR5_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(sys_reg(3, 0, 0, 3, 7)), 0);	/* unallocated */
+}
+
+/* A zero DebugVer means EL2 hides self-hosted debug from the guest. */
+static bool debug_exposed(void)
+{
+	return SYS_FIELD_GET(ID_AA64DFR0_EL1, DebugVer, read_sysreg_s(SYS_ID_AA64DFR0_EL1));
+}
+
+static void assert_id_regs(void)
+{
+	u64 pfr0 = read_sysreg_s(SYS_ID_AA64PFR0_EL1);
+	u64 dfr0 = read_sysreg_s(SYS_ID_AA64DFR0_EL1);
+
+	if (debug_exposed()) {
+		u64 debugver = SYS_FIELD_GET(ID_AA64DFR0_EL1, DebugVer, dfr0);
+		u64 brps = SYS_FIELD_GET(ID_AA64DFR0_EL1, BRPs, dfr0);
+
+		/* Exposed debug: at most v8.8, and at least two breakpoints and two watchpoints. */
+		GUEST_ASSERT_EQ(dfr0 & ~PVM_ID_AA64DFR0_DEBUG, PVM_ID_AA64DFR0_NI);
+		GUEST_ASSERT(debugver >= ID_AA64DFR0_EL1_DebugVer_IMP);
+		GUEST_ASSERT(debugver <= ID_AA64DFR0_EL1_DebugVer_V8P8);
+		GUEST_ASSERT(brps >= 1);
+		GUEST_ASSERT(SYS_FIELD_GET(ID_AA64DFR0_EL1, WRPs, dfr0) >= 1);
+		GUEST_ASSERT(SYS_FIELD_GET(ID_AA64DFR0_EL1, CTX_CMPs, dfr0) <= brps);
+	} else {
+		/* Debug and PMU are hidden: DFR0 has a fixed value, no breakpoints. */
+		GUEST_ASSERT_EQ(dfr0, PVM_ID_AA64DFR0_NI);
+	}
+
+	/* With no vCPU features, SVE, ZFR0 and PtrAuth read 0. */
+	GUEST_ASSERT_EQ(SYS_FIELD_GET(ID_AA64PFR0_EL1, SVE, pfr0), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_AA64ZFR0_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_AA64ISAR1_EL1) &
+			(ID_AA64ISAR1_EL1_APA_MASK | ID_AA64ISAR1_EL1_API_MASK), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_AA64ISAR2_EL1) &
+			(ID_AA64ISAR2_EL1_APA3_MASK | ID_AA64ISAR2_EL1_GPA3_MASK), 0);
+
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_AA64DFR1_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_AA64AFR0_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_AA64AFR1_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_AA64SMFR0_EL1), 0);
+	GUEST_ASSERT_EQ(SYS_FIELD_GET(ID_AA64PFR1_EL1, MTE, read_sysreg_s(SYS_ID_AA64PFR1_EL1)), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_AA64MMFR4_EL1), PVM_ID_AA64MMFR4_NI);
+
+	assert_aarch32_id_raz();
+}
+
+static void assert_debug_raz_wi(void)
+{
+	/* Breakpoint/watchpoint 0, MDSCR and OS-lock regs are RAZ/WI, with no UNDEF. */
+	undef_seen = false;
+	write_sysreg_s(~0UL, SYS_DBGBVRn_EL1(0));
+	write_sysreg_s(~0UL, SYS_DBGBCRn_EL1(0));
+	write_sysreg_s(~0UL, SYS_DBGWVRn_EL1(0));
+	write_sysreg_s(~0UL, SYS_DBGWCRn_EL1(0));
+	write_sysreg_s(~0UL, SYS_MDSCR_EL1);
+	write_sysreg_s(~0UL, SYS_OSLAR_EL1);
+	write_sysreg_s(~0UL, SYS_OSDLR_EL1);
+	isb();
+
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_DBGBVRn_EL1(0)), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_DBGBCRn_EL1(0)), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_DBGWVRn_EL1(0)), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_DBGWCRn_EL1(0)), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_MDSCR_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_OSLSR_EL1), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_OSDLR_EL1), 0);
+	GUEST_ASSERT(!undef_seen);
+
+	/* Breakpoint/watchpoint indices above 0 are not implemented. */
+	GUEST_ASSERT_UNDEF((void)read_sysreg_s(SYS_DBGBVRn_EL1(1)));
+	GUEST_ASSERT_UNDEF((void)read_sysreg_s(SYS_DBGWVRn_EL1(1)));
+}
+
+static void assert_debug_regs(void)
+{
+	u64 addr = (u64)&brk_insn;
+
+	/* Breakpoint/watchpoint 0 hold what the guest writes. */
+	GUEST_ASSERT_RW(SYS_DBGBVRn_EL1(0), addr);
+	GUEST_ASSERT_RW(SYS_DBGBCRn_EL1(0), DBGBCR_VAL);
+	GUEST_ASSERT_RW(SYS_DBGWVRn_EL1(0), addr & ~7UL);
+	GUEST_ASSERT_RW(SYS_DBGWCRn_EL1(0), DBGWCR_VAL);
+
+	/*
+	 * MDSCR doesn't UNDEF. The OS lock is implemented. The OS double lock isn't,
+	 * so OSDLR is RAZ/WI.
+	 */
+	undef_seen = false;
+	write_sysreg_s(read_sysreg_s(SYS_MDSCR_EL1), SYS_MDSCR_EL1);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_OSLSR_EL1) & OSLSR_EL1_OSLM_MASK,
+			OSLSR_EL1_OSLM_IMPLEMENTED);
+	write_sysreg_s(~0UL, SYS_OSDLR_EL1);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_OSDLR_EL1), 0);
+	GUEST_ASSERT(!undef_seen);
+}
+
+static void assert_undef_regs(void)
+{
+	/* The PMU is hidden, and its registers UNDEF. */
+	GUEST_ASSERT_UNDEF((void)read_sysreg_s(SYS_PMCR_EL0));
+	GUEST_ASSERT_UNDEF((void)read_sysreg_s(SYS_PMCNTENSET_EL0));
+	GUEST_ASSERT_UNDEF((void)read_sysreg_s(SYS_PMUSERENR_EL0));
+
+	/* Limited-ordering region registers UNDEF. */
+	GUEST_ASSERT_UNDEF((void)read_sysreg_s(SYS_LORID_EL1));
+
+	/* AMU and MTE are hidden, and so are the PtrAuth keys without the PtrAuth vCPU features. */
+	GUEST_ASSERT_UNDEF((void)read_sysreg_s(SYS_AMCNTENSET0_EL0));
+	GUEST_ASSERT_UNDEF((void)read_sysreg_s(SYS_GCR_EL1));
+	GUEST_ASSERT_UNDEF((void)read_sysreg_s(SYS_APIAKEYLO_EL1));
+
+	/*
+	 * Nor is SVE, so an SVE instruction UNDEFs even with CPACR_EL1.ZEN set. On a CPU
+	 * with SME but no SVE, SMEN gates it instead, so set that too.
+	 */
+	write_sysreg(read_sysreg(cpacr_el1) | CPACR_EL1_ZEN_EL1EN | CPACR_EL1_SMEN_EL1EN,
+		     cpacr_el1);
+	isb();
+	GUEST_ASSERT_UNDEF(asm volatile(".arch_extension sve\n rdvl x0, #1" : : : "x0"));
+}
+
+static void assert_host_handled(void)
+{
+	/* Host-handled registers reach the guest with no UNDEF. */
+	undef_seen = false;
+	(void)read_sysreg_s(SYS_CTR_EL0);
+	(void)read_sysreg_s(SYS_CLIDR_EL1);
+	GUEST_ASSERT(!undef_seen);
+}
+
+static void guest_baseline(void)
+{
+	pkvm_guest_init();
+
+	assert_id_regs();
+	if (debug_exposed())
+		assert_debug_regs();
+	else
+		assert_debug_raz_wi();
+	assert_undef_regs();
+	assert_host_handled();
+
+	asm volatile("brk_insn: brk #0");
+	GUEST_ASSERT_EQ(brk_pc, (u64)&brk_insn);
+
+	/* EL2 emulates ICC_SRE_EL1 with a fixed value. */
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ICC_SRE_EL1),
+			ICC_SRE_EL1_DIB | ICC_SRE_EL1_DFB | ICC_SRE_EL1_SRE);
+
+	GUEST_ASSERT_EQ(read_sysreg(mpidr_el1), MPIDR_VCPU0);
+
+	GUEST_DONE();
+}
+
+/* The host implements one of QARMA5, an IMP DEF algorithm or QARMA3: any may appear. */
+static void guest_ptrauth(void)
+{
+	pkvm_guest_init();
+	GUEST_ASSERT((read_sysreg_s(SYS_ID_AA64ISAR1_EL1) &
+		      (ID_AA64ISAR1_EL1_APA_MASK | ID_AA64ISAR1_EL1_API_MASK)) |
+		     (read_sysreg_s(SYS_ID_AA64ISAR2_EL1) &
+		      (ID_AA64ISAR2_EL1_APA3_MASK | ID_AA64ISAR2_EL1_GPA3_MASK)));
+	GUEST_DONE();
+}
+
+static void run_guest(u32 features, void *guest_code)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	vm = pkvm_vm_create(1, features, &vcpu);
+	vm_install_sync_handler(vm, VECTOR_SYNC_CURRENT, ESR_ELx_EC_UNKNOWN, undef_handler);
+	vm_install_sync_handler(vm, VECTOR_SYNC_CURRENT, ESR_ELx_EC_BRK64, brk_handler);
+
+	pkvm_vcpu_setup_boot(vcpu, guest_code);
+	pkvm_run_loop(vcpu, NULL);
+	kvm_vm_free(vm);
+}
+
+/* The host filters capabilities per VM, so ask a protected VM. */
+static bool pvm_has_cap(long cap)
+{
+	struct kvm_vm *vm = vm_create_barebones_type(KVM_VM_TYPE_ARM_PROTECTED);
+	bool ret = vm_check_cap(vm, cap);
+
+	kvm_vm_free(vm);
+	return ret;
+}
+
+int main(void)
+{
+	TEST_REQUIRE(pkvm_supported());
+
+	ksft_print_header();
+	ksft_set_plan(2);
+
+	run_guest(0, guest_baseline);
+	ksft_test_result_pass("baseline ID view and UNDEF matrix\n");
+
+	if (pvm_has_cap(KVM_CAP_ARM_PTRAUTH_ADDRESS) && pvm_has_cap(KVM_CAP_ARM_PTRAUTH_GENERIC)) {
+		run_guest(BIT(KVM_ARM_VCPU_PTRAUTH_ADDRESS) |
+			  BIT(KVM_ARM_VCPU_PTRAUTH_GENERIC), guest_ptrauth);
+		ksft_test_result_pass("PtrAuth ID delta\n");
+	} else {
+		ksft_test_result_skip("PtrAuth ID delta: PtrAuth unavailable\n");
+	}
+
+	ksft_finished();
+}
-- 
2.47.3


