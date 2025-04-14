Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15240C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 12:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNOa2mcqso+WJV1d4ZtK+LmbslnOY5yGWhK4YwToORg=; b=Nn4L2n/Lk7LIgCZu9EMDNmXXPU
	HFNYiaWzrgUUqFTYdbzJd/MdZpIA6z8NVRZkN7pEZjFbaPsF9vDFyjKxrrJUGgrVyAHNhwj2EFob/
	9o0m6QTRNb+Nh1qxkVdToK6dLtXwpTiM1sbstSSoKmV5CX5Yke90uAPibSdhlXTDveFGPxqoqq9Es
	f0sOOWQR/qHh7YGeEqQTkMH2lhZsj96vgGT/+t+ImNCZSTmfq6IRNOH2+h+UkXAwcIzA2fQmbDG1f
	VhbgmppuaRL3fb+vpbXK1dLfIAHQvrucI+S6HyWblN5CLMnH9tYpcWcXLWfKbvxG00e4R3M5RuCZG
	RWjEaROA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4JM5-000000021M9-3nSN;
	Mon, 14 Apr 2025 12:56:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J8F-00000001zRn-0P5L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 12:41:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 110D01007;
	Mon, 14 Apr 2025 05:41:45 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9F07E3F59E;
	Mon, 14 Apr 2025 05:41:44 -0700 (PDT)
From: Ben Horgan <ben.horgan@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Cc: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	shuah@kernel.org,
	Ben Horgan <ben.horgan@arm.com>
Subject: [RFC PATCH 3/3] KVM: selftests: Confirm exposing MTE_frac does not break migration
Date: Mon, 14 Apr 2025 13:40:59 +0100
Message-ID: <20250414124059.1938303-4-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414124059.1938303-1-ben.horgan@arm.com>
References: <20250414124059.1938303-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_054147_237713_6729855F 
X-CRM114-Status: GOOD (  16.52  )
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

When MTE is supported but MTE_ASYMM is not (ID_AA64PFR1_EL1.MTE == 2)
ID_AA64PFR1_EL1.MTE_frac == 0xF indicates MTE_ASYNC is unsupported
and MTE_frac == 0 indicates it is supported.

As MTE_frac was previously unconditionally read as 0 from the guest
and user-space, check that using SET_ONE_REG to set it to 0 succeeds
but does not change MTE_frac from unsupported (0xF) to supported (0).
This is required as values originating from KVM from user-space must
be accepted to avoid breaking migration.

Also, to allow this MTE field to be tested, enable KVM_ARM_CAP_MTE
for the set_id_regs test. No effect on existing tests is expected.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 .../testing/selftests/kvm/arm64/set_id_regs.c | 77 ++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 322b9d3b0125..34f4174e7285 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -15,6 +15,8 @@
 #include "test_util.h"
 #include <linux/bitfield.h>
 
+bool have_cap_arm_mte;
+
 enum ftr_type {
 	FTR_EXACT,			/* Use a predefined safe value */
 	FTR_LOWER_SAFE,			/* Smaller value is safe */
@@ -543,6 +545,70 @@ static void test_user_set_mpam_reg(struct kvm_vcpu *vcpu)
 		ksft_test_result_fail("ID_AA64PFR1_EL1.MPAM_frac value should not be ignored\n");
 }
 
+#define MTE_IDREG_TEST 1
+static void test_user_set_mte_reg(struct kvm_vcpu *vcpu)
+{
+	uint64_t masks[KVM_ARM_FEATURE_ID_RANGE_SIZE];
+	struct reg_mask_range range = {
+		.addr = (__u64)masks,
+	};
+	uint64_t val;
+	uint64_t mte;
+	uint64_t mte_frac;
+	int idx, err;
+
+	if (!have_cap_arm_mte) {
+		ksft_test_result_skip("MTE capability not supported, nothing to test\n");
+		return;
+	}
+
+	/* Get writable masks for feature ID registers */
+	memset(range.reserved, 0, sizeof(range.reserved));
+	vm_ioctl(vcpu->vm, KVM_ARM_GET_REG_WRITABLE_MASKS, &range);
+
+	idx = encoding_to_range_idx(SYS_ID_AA64PFR1_EL1);
+	if ((masks[idx] & ID_AA64PFR1_EL1_MTE_frac_MASK) == ID_AA64PFR1_EL1_MTE_frac_MASK) {
+		ksft_test_result_skip("ID_AA64PFR1_EL1.MTE_frac is officially writable, nothing to test\n");
+		return;
+	}
+
+	/*
+	 * When MTE is supported but MTE_ASYMM is not (ID_AA64PFR1_EL1.MTE == 2)
+	 * ID_AA64PFR1_EL1.MTE_frac == 0xF indicates MTE_ASYNC is unsupported
+	 * and MTE_frac == 0 indicates it is supported.
+	 *
+	 * As MTE_frac was previously unconditionally read as 0, check
+	 * that the set to 0 succeeds but does not change MTE_frac
+	 * from unsupported (0xF) to supported (0).
+	 *
+	 */
+	val = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64PFR1_EL1));
+
+	mte = FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE), val);
+	mte_frac = FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE_frac), val);
+	if (mte != ID_AA64PFR1_EL1_MTE_MTE2 ||
+	    mte_frac != ID_AA64PFR1_EL1_MTE_frac_NI) {
+		ksft_test_result_skip("MTE_ASYNC or MTE_ASYMM are supported, nothing to test\n");
+		return;
+	}
+
+	/* Try to set MTE_frac=0. */
+	val &= ~ID_AA64PFR1_EL1_MTE_frac_MASK;
+	val |= FIELD_PREP(ID_AA64PFR1_EL1_MTE_frac_MASK, 0);
+	err = __vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64PFR1_EL1), val);
+	if (err) {
+		ksft_test_result_fail("ID_AA64PFR1_EL1.MTE_frac=0 was not accepted\n");
+		return;
+	}
+
+	val = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64PFR1_EL1));
+	mte_frac = FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE_frac), val);
+	if (mte_frac == ID_AA64PFR1_EL1_MTE_frac_NI)
+		ksft_test_result_pass("ID_AA64PFR1_EL1.MTE_frac=0 accepted and still 0xF\n");
+	else
+		ksft_test_result_pass("ID_AA64PFR1_EL1.MTE_frac no longer 0xF\n");
+}
+
 static void test_guest_reg_read(struct kvm_vcpu *vcpu)
 {
 	bool done = false;
@@ -673,6 +739,14 @@ static void test_reset_preserves_id_regs(struct kvm_vcpu *vcpu)
 	ksft_test_result_pass("%s\n", __func__);
 }
 
+void kvm_arch_vm_post_create(struct kvm_vm *vm)
+{
+	if (vm_check_cap(vm, KVM_CAP_ARM_MTE)) {
+		vm_enable_cap(vm, KVM_CAP_ARM_MTE, 0);
+		have_cap_arm_mte = true;
+	}
+}
+
 int main(void)
 {
 	struct kvm_vcpu *vcpu;
@@ -701,7 +775,7 @@ int main(void)
 		   ARRAY_SIZE(ftr_id_aa64pfr1_el1) + ARRAY_SIZE(ftr_id_aa64mmfr0_el1) +
 		   ARRAY_SIZE(ftr_id_aa64mmfr1_el1) + ARRAY_SIZE(ftr_id_aa64mmfr2_el1) +
 		   ARRAY_SIZE(ftr_id_aa64zfr0_el1) - ARRAY_SIZE(test_regs) + 3 +
-		   MPAM_IDREG_TEST;
+		   MPAM_IDREG_TEST + MTE_IDREG_TEST;
 
 	ksft_set_plan(test_cnt);
 
@@ -709,6 +783,7 @@ int main(void)
 	test_vcpu_ftr_id_regs(vcpu);
 	test_vcpu_non_ftr_id_regs(vcpu);
 	test_user_set_mpam_reg(vcpu);
+	test_user_set_mte_reg(vcpu);
 
 	test_guest_reg_read(vcpu);
 
-- 
2.43.0


