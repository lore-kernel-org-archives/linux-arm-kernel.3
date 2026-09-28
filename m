Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91215CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+C/gN6kTWG4u/gazhv5Ye+IpWz75t6Q3QGhbrhhLjQ=; b=GB353qi7jgXqM9gDpiRdx+W5T4
	PBfi4m3uUMS0llH99bwSzXrEYufgdq5yFW8pkeZ3O+hLVD5IZS1qheOHN0ndAhfjei0quyhZqc9Kb
	ox29EXnVke3xmJcctHYrbgByJjOEDwJbC7ab2ZTeRdGgFjKAseluzNvOJscGxv5GYJGSxfZo9m3oI
	hZ8eBIjJ4Ch0HQH1jdrgqzZA4tqUgypuL1+xllgLNc/RM8T6KuEQiY/I/FXqeE+soB1BxBy8OI5jp
	FWmLET8BsBjY0aluZHEfVI3e0T18QicsKqfF4/Q1yxgrYYGL7AuJe6nTDfnvJY+EQaxd8m+jhKCRa
	YTuIk3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB58l-0000000HTce-1xFG;
	Mon, 28 Sep 2026 06:47:07 +0000
Received: from out-117.mta0.migadu.com ([2001:41d0:1004:224b::75] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB58T-0000000HTUi-1c8T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 06:46:50 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=9u1xb87yGfGazyR96ri6hSUGdO9iU79tn1MK3OJoWjI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790578007; v=1; x=1791182807;
 b=sePZmadF3bjEm1yTRXRZF0Whz1SlK+soPls8LUWwFK1gyAeWI7p6kGxUBIAH3FtVqN09Ly68
 VhVZwvIH169Fgv4f9Z070RMEY3RxNey2KX/8YHyVjPEIqvCfxkH/FLyfdNb6J0SPdJqN+blAQDQ
 z4SwIyd5KFRRtfD0ZAnQ9wtc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 93d6d6c6cfc30250;
	Mon, 28 Sep 2026 06:46:46 +0000
X-Mizu-Trace-ID: 93d6d6c6cfc30250
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] KVM: arm64: selftests: Check a feature hidden in an ID register is UNDEF
Date: Mon, 28 Sep 2026 07:46:43 +0100
Message-Id: <20260928064643.3265087-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260928064643.3265087-1-fuad.tabba@linux.dev>
References: <20260928064643.3265087-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_234649_577090_04127192 
X-CRM114-Status: GOOD (  18.83  )
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

Userspace can hide a feature from a guest by clearing its field in a
writable ID register, and KVM then makes the feature's instructions
UNDEFINED in the guest by trapping or disabling them. No selftest checks
that.

Add a test that runs the instruction of each of TLBI OS, MOPS, TCR2_EL1
and FPMR once with its field as advertised and once with it cleared, and
expects an UNDEF only when cleared. A feature the vCPU doesn't advertise
is skipped, as is hidden TLBI OS on a CPU with neither FGT nor
FEAT_EVT2, where KVM can't trap it.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/hidden_features.c     | 184 ++++++++++++++++++
 2 files changed, 185 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/arm64/hidden_features.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 96bab7002d39e..864fdca7f362e 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -194,6 +194,7 @@ TEST_GEN_PROGS_arm64 += arm64/vgic_v5
 TEST_GEN_PROGS_arm64 += arm64/vpmu_counter_access
 TEST_GEN_PROGS_arm64 += arm64/no-vgic
 TEST_GEN_PROGS_arm64 += arm64/idreg-idst
+TEST_GEN_PROGS_arm64 += arm64/hidden_features
 TEST_GEN_PROGS_arm64 += arm64/kvm-uuid
 TEST_GEN_PROGS_arm64 += access_tracking_perf_test
 TEST_GEN_PROGS_arm64 += arch_timer
diff --git a/tools/testing/selftests/kvm/arm64/hidden_features.c b/tools/testing/selftests/kvm/arm64/hidden_features.c
new file mode 100644
index 0000000000000..194d746e7605e
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/hidden_features.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * hidden_features - Check that a feature's instruction runs in the guest when
+ * its ID register field is advertised, and is UNDEFINED when userspace clears
+ * the field.
+ *
+ * Copyright (c) 2026 Google LLC
+ * Author: Fuad Tabba <fuad.tabba@linux.dev>
+ */
+#include "kvm_util.h"
+#include "processor.h"
+#include "test_util.h"
+
+static volatile bool undef;
+
+static void guest_tlbi_os(void)
+{
+	/* tlbi vmalle1os */
+	asm volatile("sys #0, c8, c1, #0\n\tdsb ish\n\tisb" ::: "memory");
+}
+
+static void guest_mops(void)
+{
+	register u64 *d asm("x0");
+	register u64 n asm("x1");
+	register u64 s asm("x2");
+	u64 buf[8];
+
+	d = buf;
+	n = sizeof(buf);
+	s = 0;
+	/* setp [x0]!, x1!, x2; setm; sete */
+	asm volatile(".inst 0x19c20420\n\t.inst 0x19c24420\n\t.inst 0x19c28420"
+		     : "+r"(d), "+r"(n) : "r"(s) : "cc", "memory");
+}
+
+static void guest_tcr2(void)
+{
+	read_sysreg_s(SYS_TCR2_EL1);
+}
+
+static void guest_fpmr(void)
+{
+	read_sysreg_s(SYS_FPMR);
+}
+
+struct feature {
+	const char *name;
+	u64 id_reg;
+	u64 mask;
+	u8 shift;
+	u64 min;
+	void (*insn)(void);
+	bool (*trappable)(struct kvm_vcpu *vcpu);
+};
+
+/* Without FGT, KVM traps a hidden TLBI OS only through HCR_EL2.TTLBOS (FEAT_EVT2). */
+static bool tlbi_os_trappable(struct kvm_vcpu *vcpu)
+{
+	u64 mmfr0 = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64MMFR0_EL1));
+	u64 mmfr2 = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64MMFR2_EL1));
+
+	return SYS_FIELD_GET(ID_AA64MMFR0_EL1, FGT, mmfr0) >= ID_AA64MMFR0_EL1_FGT_IMP ||
+	       SYS_FIELD_GET(ID_AA64MMFR2_EL1, EVT, mmfr2) >= ID_AA64MMFR2_EL1_EVT_TTLBxS;
+}
+
+#define FEATURE(n, reg, field, min_val, fn, trap)		\
+{								\
+	.name		= n,					\
+	.id_reg		= SYS_##reg,				\
+	.mask		= reg##_##field##_MASK,			\
+	.shift		= reg##_##field##_SHIFT,		\
+	.min		= reg##_##field##_##min_val,		\
+	.insn		= fn,					\
+	.trappable	= trap,					\
+}
+
+static const struct feature features[] = {
+	FEATURE("TLBI OS", ID_AA64ISAR0_EL1, TLB, OS, guest_tlbi_os, tlbi_os_trappable),
+	FEATURE("MOPS", ID_AA64ISAR2_EL1, MOPS, IMP, guest_mops, NULL),
+	FEATURE("TCR2_EL1", ID_AA64MMFR3_EL1, TCRX, IMP, guest_tcr2, NULL),
+	FEATURE("FPMR", ID_AA64PFR2_EL1, FPMR, IMP, guest_fpmr, NULL),
+};
+
+static void guest_code(const struct feature *feat)
+{
+	undef = false;
+	feat->insn();
+	GUEST_SYNC(undef);
+	GUEST_DONE();
+}
+
+static void guest_undef_handler(struct ex_regs *regs)
+{
+	undef = true;
+	regs->pc += 4;
+}
+
+static bool run(const struct feature *feat, bool hide)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct ucall uc;
+	bool got = false;
+	u64 val;
+
+	vm = vm_create_with_one_vcpu(&vcpu, (void *)guest_code);
+	vm_init_descriptor_tables(vm);
+	vcpu_init_descriptor_tables(vcpu);
+	vm_install_sync_handler(vm, VECTOR_SYNC_CURRENT, ESR_ELx_EC_UNKNOWN, guest_undef_handler);
+	vcpu_args_set(vcpu, 1, feat);
+
+	if (hide) {
+		val = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(feat->id_reg));
+		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(feat->id_reg), val & ~feat->mask);
+	}
+
+	for (;;) {
+		vcpu_run(vcpu);
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_SYNC:
+			got = uc.args[1];
+			break;
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+			break;
+		case UCALL_DONE:
+			kvm_vm_free(vm);
+			return got;
+		default:
+			TEST_FAIL("Unknown ucall %lu", uc.cmd);
+		}
+	}
+}
+
+static void probe_feature(const struct feature *feat, bool *present, bool *trappable)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	u64 val;
+
+	vm = vm_create_with_one_vcpu(&vcpu, NULL);
+	val = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(feat->id_reg));
+	*present = ((val & feat->mask) >> feat->shift) >= feat->min;
+	*trappable = !feat->trappable || feat->trappable(vcpu);
+	kvm_vm_free(vm);
+}
+
+int main(void)
+{
+	const struct feature *feat;
+	bool present, trappable;
+	int i;
+
+	test_disable_default_vgic();
+
+	ksft_print_header();
+	ksft_set_plan(ARRAY_SIZE(features) * 2);
+
+	for (i = 0; i < ARRAY_SIZE(features); i++) {
+		feat = &features[i];
+
+		probe_feature(feat, &present, &trappable);
+		if (!present) {
+			ksft_test_result_skip("%s advertised, not supported\n", feat->name);
+			ksft_test_result_skip("%s hidden, not supported\n", feat->name);
+			continue;
+		}
+
+		if (run(feat, false))
+			ksft_test_result_fail("%s advertised, UNDEF\n", feat->name);
+		else
+			ksft_test_result_pass("%s advertised\n", feat->name);
+
+		if (!trappable)
+			ksft_test_result_skip("%s hidden, not trappable\n", feat->name);
+		else if (run(feat, true))
+			ksft_test_result_pass("%s hidden\n", feat->name);
+		else
+			ksft_test_result_fail("%s hidden, no UNDEF\n", feat->name);
+	}
+
+	ksft_finished();
+}
-- 
2.39.5


