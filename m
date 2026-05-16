Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B705CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 18:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15IgbdZUlCnu9c+LUAuC9+Pq8I4yC4ZkBwNgKIgxnng=; b=DrdXjwUC3aTqG9AQUMmFH0XACQ
	pS1jQ//XqWsnROac6r5qBMmJAr9Gtd95bBy1SDstoG7XiPFVFvaz3Rdsvb5/U6Pq/Q3EHOHn/pHv9
	aonWGFqLJ4xyodCwLeO98j3aSXWfvgb7MooZJK+EEnrBzdL64/mPZBNVQ75XDx9NuH1Qbwsz5i5Hv
	snAivEmigig0GiZGZxn2StcUrLhxXryemlZ/nJVeowbeVOJi7kxvieo1yCI2SLWd0QvX7Hv/ETCoM
	m2XN3NR1WWyLOO5bkS+w9HahyOvTn9z5TTUTuwPBDer5ehQ4nOa1CEB+FQYNFzM/WGtFWPD75qPEg
	RcYSC/nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJmz-0000000BCM5-0Wus;
	Sat, 16 May 2026 18:31:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJms-0000000BCHv-3Aaf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 18:31:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 790171BF3;
	Sat, 16 May 2026 11:30:52 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C0533F85F;
	Sat, 16 May 2026 11:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778956257; bh=5dITwd1Xwtsf0FSmhxiGWNKsuOsFRRNYwaEcdnmG+YA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FOwnjdBjlESEb170DESQ3X5e+PRe5gxDF0rQ8ZGbNG3VlEnEQV7v8SaQ01z9chRVZ
	 ZmtIiYTmO2di+dG8IwawubT6mzxEY4TnHTS3QygNZ5nPcZmVy4P8b3pcrUiEqHuvpa
	 0VtpkA7y3SZE/j9Ddv9qDdEeclKdJ5Z55LFh8G1Q=
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
Subject: [PATCH v3 3/9] KVM: arm64: selftests: Add hello_nested basic NV selftest
Date: Sat, 16 May 2026 19:29:57 +0100
Message-ID: <20260516183003.799058-4-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516183003.799058-1-weilin.chang@arm.com>
References: <20260516183003.799058-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_113058_898708_03599590 
X-CRM114-Status: GOOD (  15.07  )
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

This selftest simply starts an L1, which starts its own guest (L2). L2
runs without stage-1 and 2 translations, it calls an HVC to jump back
to L1.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/hello_nested.c        | 104 ++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/arm64/hello_nested.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 3dc3e39f7025..e8c108e0c487 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -168,6 +168,7 @@ TEST_GEN_PROGS_arm64 += arm64/arch_timer_edge_cases
 TEST_GEN_PROGS_arm64 += arm64/at
 TEST_GEN_PROGS_arm64 += arm64/debug-exceptions
 TEST_GEN_PROGS_arm64 += arm64/hello_el2
+TEST_GEN_PROGS_arm64 += arm64/hello_nested
 TEST_GEN_PROGS_arm64 += arm64/host_sve
 TEST_GEN_PROGS_arm64 += arm64/hypercalls
 TEST_GEN_PROGS_arm64 += arm64/external_aborts
diff --git a/tools/testing/selftests/kvm/arm64/hello_nested.c b/tools/testing/selftests/kvm/arm64/hello_nested.c
new file mode 100644
index 000000000000..1cab56e4597b
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/hello_nested.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * hello_nested - Go from vEL2 to EL1 then back
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
+	do_hvc();
+}
+
+static void guest_code(void)
+{
+	struct vcpu vcpu;
+	struct hyp_data hyp_data;
+	int ret;
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
+	ret = run_l2(&vcpu, &hyp_data);
+	GUEST_ASSERT_EQ(ret, ARM_EXCEPTION_TRAP);
+	GUEST_ASSERT_EQ(ESR_ELx_EC(read_sysreg(esr_el2)), ESR_ELx_EC_HVC64);
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
+			break;
+		case UCALL_PRINTF:
+			pr_info("%s", uc.buffer);
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


