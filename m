Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B24606D808
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GidhIPMb;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YLUzwbAt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZqLRHECtu1IbyfmzqydS0xcErU/tndix94XGkirfv30=; b=GidhIPMbxKvG+I
	R3Lan9K7F7FYOTXKNM1jkkAKGj2zS79nZT4QITNlFhJId9bumF21pPkEsYcSIzBzGBMoK+73CzgVo
	on2U4lqtO5IQT+idzl/ewoQTZx6XqRlNgQdbl0G2VTYBRWLvaRU6oLP3tUdEAeAa19Eu0J3PKEpsZ
	CrUlJ9zpEOTcJ2jpqwk+c2/NDaOvIitusJvNXETLpdq19b+fPkjqChTGDKaf5QYwMy1B8xCxGzTvt
	UmvgIMihWO4zJHH9gCCFzADNKrQTjVV9OVuDG8oa3WUDQps6U/hl4kjclMUbo0gJACm3Eh/Ln3Op7
	j2V7th5KD5tfACf4XwuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWh2-00000004luL-1lPI;
	Wed, 04 Nov 2026 08:50:04 +0000
Received: from out-238.mta0.migadu.com ([2001:41d0:1004:224b::ee] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWgv-00000004lnp-2ofb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:50:03 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=f+5i3cnibFXJG4SEb8GtpTgqVNwtOWpsHcWaN7rrewI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793782195; v=1; x=1794386995;
 b=YLUzwbAt9vS1mFhO1bSoPI0bQm0x9rLlWr5JEn7pekmT29QZ6UxVhgGjexmvtZiIK4o2doy9
 dyHVHNH6i9oV3sb2QHZWR46Xf/s29TqtutrbzACssQaRrz0cnTbhdiYP+ljmkRU5UwhOItu3pom
 4lo+QDJUPBNZL5MWKZ7QXFgc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b91f71648611a956;
	Wed, 04 Nov 2026 08:49:55 +0000
X-Mizu-Trace-ID: b91f71648611a956
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
Subject: [PATCH 10/16] KVM: arm64: selftests: Add pkvm_smccc hypercall test
Date: Wed,  4 Nov 2026 08:48:36 +0000
Message-ID: <20261104084842.132944-11-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104084842.132944-1-fuad.tabba@linux.dev>
References: <20261104084842.132944-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_004957_857317_0D46F6F7 
X-CRM114-Status: GOOD (  16.03  )
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

EL2 handles a protected guest's SMCCC calls other than PSCI rather than
forwarding them to the host. The vendor-hyp feature bitmap advertises
only FEATURES and the three memory calls.

Check SMCCC_VERSION, the vendor-hyp UID and feature bitmap, that the
calls EL2 doesn't implement (FF-A, TRNG, an unknown function) return
NOT_SUPPORTED, and that an SMC makes the guest take an UNDEF.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/arm64/pkvm_smccc.c  | 117 ++++++++++++++++++
 2 files changed, 118 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_smccc.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 88c1159cb3bf1..6bb436bd36205 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -193,6 +193,7 @@ TEST_GEN_PROGS_arm64 += arm64/page_fault_test
 TEST_GEN_PROGS_arm64 += arm64/pkvm_host_abi
 TEST_GEN_PROGS_arm64 += arm64/pkvm_mem_share
 TEST_GEN_PROGS_arm64 += arm64/pkvm_psci
+TEST_GEN_PROGS_arm64 += arm64/pkvm_smccc
 TEST_GEN_PROGS_arm64 += arm64/psci_test
 TEST_GEN_PROGS_arm64 += arm64/sea_to_user
 TEST_GEN_PROGS_arm64 += arm64/set_id_regs
diff --git a/tools/testing/selftests/kvm/arm64/pkvm_smccc.c b/tools/testing/selftests/kvm/arm64/pkvm_smccc.c
new file mode 100644
index 0000000000000..64bfa12b26824
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/pkvm_smccc.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pkvm_smccc - the SMCCC calls EL2 handles for a protected VM, and its SMC.
+ *
+ * Copyright (C) 2025 Google LLC
+ * Author: Fuad Tabba <fuad.tabba@linux.dev>
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/bits.h>
+
+#include "kvm_util.h"
+#include "pkvm.h"
+#include "processor.h"
+#include "test_util.h"
+
+/* KVM UID 28b46fb6-2ec5-11e9-a9ca-4b564d003a74, as four SMCCC result regs. */
+#define ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_0	0xb66fb428U
+#define ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_1	0xe911c52eU
+#define ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_2	0x564bcaa9U
+#define ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3	0x743a004dU
+
+/* The vendor-hyp feature bitmap EL2 advertises to protected guests. */
+#define KVM_FEATURES (					\
+	BIT(ARM_SMCCC_KVM_FUNC_FEATURES) |		\
+	BIT(ARM_SMCCC_KVM_FUNC_HYP_MEMINFO) |		\
+	BIT(ARM_SMCCC_KVM_FUNC_MEM_SHARE) |		\
+	BIT(ARM_SMCCC_KVM_FUNC_MEM_UNSHARE))
+
+#define FFA_VERSION_FUNC_ID						\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32,	\
+			   ARM_SMCCC_OWNER_STANDARD, 0x63)
+
+/* An unallocated vendor-hyp function id. */
+#define UNKNOWN_FUNC_ID							\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,	\
+			   ARM_SMCCC_OWNER_VENDOR_HYP, 30)
+
+extern unsigned char smc_insn;
+
+static volatile u64 undef_pc;
+
+static void guest_code(void)
+{
+	struct arm_smccc_res res;
+	unsigned long ret;
+
+	pkvm_guest_init();
+
+	/* The vendor-hyp calls require SMCCC 1.1. */
+	ret = pkvm_hvc(ARM_SMCCC_VERSION_FUNC_ID, 0, 0, 0);
+	__GUEST_ASSERT((s32)ret >= ARM_SMCCC_VERSION_1_1, "SMCCC_VERSION 0x%lx", ret);
+
+	smccc_hvc(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, 0, 0, 0, 0, 0, 0, 0, &res);
+	GUEST_ASSERT_EQ(res.a0, ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_0);
+	GUEST_ASSERT_EQ(res.a1, ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_1);
+	GUEST_ASSERT_EQ(res.a2, ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_2);
+	GUEST_ASSERT_EQ(res.a3, ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3);
+
+	ret = pkvm_hvc(ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID, 0, 0, 0);
+	GUEST_ASSERT_EQ(ret, KVM_FEATURES);
+
+	/* EL2 returns NOT_SUPPORTED for a call it doesn't implement, rather than forward it. */
+	GUEST_ASSERT_EQ(pkvm_hvc(FFA_VERSION_FUNC_ID, 0, 0, 0), SMCCC_RET_NOT_SUPPORTED);
+	GUEST_ASSERT_EQ(pkvm_hvc(ARM_SMCCC_TRNG_VERSION, 0, 0, 0), SMCCC_RET_NOT_SUPPORTED);
+	GUEST_ASSERT_EQ(pkvm_hvc(UNKNOWN_FUNC_ID, 0, 0, 0), SMCCC_RET_NOT_SUPPORTED);
+
+	GUEST_DONE();
+}
+
+static void undef_handler(struct ex_regs *regs)
+{
+	undef_pc = regs->pc;
+	regs->pc += 4;
+}
+
+/* EL2 injects an UNDEF for a protected guest's SMC. */
+static void guest_smc(void)
+{
+	pkvm_guest_init();
+
+	{
+		register u64 x0 asm("x0") = ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID;
+
+		asm volatile("smc_insn: smc #0" : "+r"(x0) : : "memory");
+	}
+	GUEST_ASSERT_EQ(undef_pc, (u64)&smc_insn);
+	GUEST_DONE();
+}
+
+static void run_guest(void *guest_code, bool smc)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	vm = pkvm_vm_create_with_one_vcpu(&vcpu, guest_code);
+	if (smc)
+		vm_install_sync_handler(vm, VECTOR_SYNC_CURRENT, ESR_ELx_EC_UNKNOWN, undef_handler);
+	pkvm_run_loop(vcpu, NULL);
+	kvm_vm_free(vm);
+}
+
+int main(void)
+{
+	TEST_REQUIRE(pkvm_supported());
+
+	ksft_print_header();
+	ksft_set_plan(2);
+
+	run_guest(guest_code, false);
+	ksft_test_result_pass("SMCCC surface\n");
+
+	run_guest(guest_smc, true);
+	ksft_test_result_pass("SMC takes an UNDEF\n");
+
+	ksft_finished();
+}
-- 
2.47.3


