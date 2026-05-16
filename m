Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85637CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 18:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8sHkcdtTlpdFpW8hXJTA1U9Z0yVcmyf+c3Ltf0OB+U=; b=XSmG94Shb2c5g611YfkAA1Lmgi
	bRG1aczzFeMHHvVgD7MVyuGJQRNLF9SO+s3P4QhXeS6roe80zbT1M3zy17Wc/ihbBTcs15SxlK2v5
	G/Dpvar1zn7Kg+xkBUKUxmVJHdKdK7ODUYC/yKeiGLxGCtq2CwVPV6QyqRUninp9YwqBCw9m71x12
	WwniQ045E7DOykOPjsgCH6RTyw0/a+V1K8cW9q7MSQmn3JP4NALDHRgt6b5hC1oZv/5Uj5tvx629x
	4QbNP6fSV0wxBjcSSav6yb7Uebw5vVJcQqZnWDs5VmAsjo/m54YWdn172KwzX5FKRA4Lem8MOq8KW
	cHGaHz+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJn5-0000000BCR1-1lts;
	Sat, 16 May 2026 18:31:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJmy-0000000BCLV-2zbi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 18:31:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C8DA1BF3;
	Sat, 16 May 2026 11:30:58 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 121DA3F85F;
	Sat, 16 May 2026 11:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778956263; bh=NjiLBvJulETNmJY6cc2tolrFjLCUJdQFnQKrPk5Q/hg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V5hbW2sNxeF4TdF7LOWlkkUOkMt8HpTKd4Fbof8XRzQYpGa+0RqLIAdVpmxwGVc60
	 ApBJjEWmke0KyERqvE6DzRYOE7seT53kLquSC2SKl17otKShgVwD55+IbwH3rwfWVE
	 hikNAFNwJRAXrp/c1pwEnkGLt/ehLgWvst4Qyeb4=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v3 5/9] KVM: arm64: selftests: Add shadow_stage2 test
Date: Sat, 16 May 2026 19:29:59 +0100
Message-ID: <20260516183003.799058-6-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516183003.799058-1-weilin.chang@arm.com>
References: <20260516183003.799058-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_113104_842120_C84412B5 
X-CRM114-Status: GOOD (  16.91  )
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

The shadow_stage2 test is aimed to exercise the shadow page table
management code in KVM. In this first patch a basic test similar to
hello_nested is created. Right now it doesn't turn on stage-2 for the
nested guest (L2) yet, therefore the shadow page table code in KVM will
only be triggered minimally now.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/shadow_stage2.c       | 128 ++++++++++++++++++
 2 files changed, 129 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/arm64/shadow_stage2.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index e8c108e0c487..c0fac2ba1339 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -176,6 +176,7 @@ TEST_GEN_PROGS_arm64 += arm64/page_fault_test
 TEST_GEN_PROGS_arm64 += arm64/psci_test
 TEST_GEN_PROGS_arm64 += arm64/sea_to_user
 TEST_GEN_PROGS_arm64 += arm64/set_id_regs
+TEST_GEN_PROGS_arm64 += arm64/shadow_stage2
 TEST_GEN_PROGS_arm64 += arm64/smccc_filter
 TEST_GEN_PROGS_arm64 += arm64/vcpu_width_config
 TEST_GEN_PROGS_arm64 += arm64/vgic_init
diff --git a/tools/testing/selftests/kvm/arm64/shadow_stage2.c b/tools/testing/selftests/kvm/arm64/shadow_stage2.c
new file mode 100644
index 000000000000..cf76a2b0582d
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/shadow_stage2.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * shadow_stage2 - Test correctness of shadow stage 2
+ */
+
+#include "nested.h"
+#include "processor.h"
+#include "test_util.h"
+#include "ucall.h"
+
+#define XLATE2GPA	(0xABCD)
+#define L2STACKSZ	(0x100)
+
+#define L2SUCCESS	(0x0)
+#define L2FAILED	(0x1)
+#define L2SYNC		(0x2)
+
+/*
+ * TPIDR_EL2 is used to store vcpu id, so save and restore it.
+ */
+static gpa_t ucall_translate_to_gpa(void *gva)
+{
+	gpa_t gpa;
+	u64 vcpu_id = read_sysreg(tpidr_el2);
+
+	GUEST_SYNC2(XLATE2GPA, gva);
+
+	/* get the result from userspace */
+	gpa = read_sysreg(tpidr_el2);
+
+	write_sysreg(vcpu_id, tpidr_el2);
+
+	return gpa;
+}
+
+static void l2_guest_code(void)
+{
+	do_hvc(L2SYNC, 10, 0);
+	do_hvc(L2SYNC, 20, 0);
+	do_hvc(L2SYNC, 30, 0);
+
+	do_hvc(L2SUCCESS, 0, 0);
+}
+
+static void guest_code(void)
+{
+	struct vcpu vcpu;
+	struct hyp_data hyp_data;
+	int ret, i = 0;
+	gpa_t l2_pc, l2_stack_top;
+	/* force 16-byte alignment for the stack pointer */
+	u8 l2_stack[L2STACKSZ] __attribute__((aligned(16)));
+
+	GUEST_ASSERT_EQ(get_current_el(), 2);
+	GUEST_PRINTF("vEL2 entry\n");
+
+	l2_pc = ucall_translate_to_gpa(l2_guest_code);
+	l2_stack_top = ucall_translate_to_gpa(&l2_stack[L2STACKSZ]);
+
+	init_vcpu(&vcpu, l2_pc, l2_stack_top);
+	prepare_hyp();
+
+	while (true) {
+		GUEST_PRINTF("L2 enter\n");
+		ret = run_l2(&vcpu, &hyp_data);
+		GUEST_PRINTF("L2 exit\n");
+		GUEST_ASSERT_EQ(ret, ARM_EXCEPTION_TRAP);
+		GUEST_ASSERT_EQ(ESR_ELx_EC(read_sysreg(esr_el2)), ESR_ELx_EC_HVC64);
+
+		if (vcpu.context.regs.regs[0] == L2SYNC)
+			GUEST_SYNC3(L2SYNC, i++, vcpu.context.regs.regs[1]);
+		else
+			break;
+	}
+
+	if (vcpu.context.regs.regs[0] != L2SUCCESS)
+		GUEST_FAIL("L2 failed\n");
+
+	GUEST_PRINTF("L2 success!\n");
+	GUEST_DONE();
+}
+
+int main(void)
+{
+	struct kvm_vcpu_init init;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct ucall uc;
+	gpa_t gpa;
+
+	TEST_REQUIRE(kvm_check_cap(KVM_CAP_ARM_EL2));
+	vm = vm_create(1);
+
+	kvm_get_default_vcpu_target(vm, &init);
+	init.features[0] |= BIT(KVM_ARM_VCPU_HAS_EL2);
+	vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code);
+	kvm_arch_vm_finalize_vcpus(vm);
+
+	while (true) {
+		vcpu_run(vcpu);
+
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_SYNC:
+			if (uc.args[0] == XLATE2GPA) {
+				gpa = addr_gva2gpa(vm, (gva_t)uc.args[1]);
+				vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TPIDR_EL2), gpa);
+			}
+			if (uc.args[0] == L2SYNC)
+				pr_info("L2SYNC, L1 info: %ld, L2 info: %ld\n", uc.args[1], uc.args[2]);
+			break;
+		case UCALL_PRINTF:
+			pr_info("[L1] %s", uc.buffer);
+			break;
+		case UCALL_DONE:
+			pr_info("DONE!\n");
+			goto end;
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+			fallthrough;
+		default:
+			TEST_FAIL("Unhandled ucall: %ld\n", uc.cmd);
+		}
+	}
+
+end:
+	kvm_vm_free(vm);
+	return 0;
+}
-- 
2.43.0


