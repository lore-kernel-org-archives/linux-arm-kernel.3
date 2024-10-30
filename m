Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47101D6B6A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 16:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DxM85YmPZTK/aA1iMFVYii+eeikx7fiXPRGT8XuCCgk=; b=4mG/LgFY1ajzG8WpxYYcFaVZJo
	Bgc18Xa77VrUqWTheVsgbmgXJ2m+nLqLCdYwXoOS8sGnM1kEv4uHUtrfPKcs4190zbqFN08jGxHeV
	8eqUTDMqNMtAO3evOmDP6eQKaVI9g3w1J2wyrZHeSRMISEGFsD8Fm4rXkR14s5aZxOJoZM2dZrd1H
	qcV6tmfnvLl6PGOl6quyXj6KerxR1yqAjsnchOZyjkHn4uiP0XfZxKd2zEe8m8I/g58VZNdtbrKHo
	zt6+CwlRKIz7nkDH1ZvZo/PCVYO8T13jh5h79UkI1ro7SlxRhDnDeVLKdflUzRP4aV69gRHBf6T8h
	eFxsRmBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BHV-000000011mN-0Knn;
	Wed, 30 Oct 2024 16:10:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BAc-00000001070-27o0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 16:03:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65358176C;
	Wed, 30 Oct 2024 09:04:11 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 789723F528;
	Wed, 30 Oct 2024 09:03:39 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: anshuman.khandual@arm.com,
	gshan@redhat.com,
	james.morse@arm.com,
	joey.gouly@arm.com,
	shameerali.kolothum.thodi@huawei.com,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jing Zhang <jingzhangos@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v6 7/7] KVM: arm64: selftests: Test ID_AA64PFR0.MPAM isn't completely ignored
Date: Wed, 30 Oct 2024 16:03:17 +0000
Message-Id: <20241030160317.2528209-8-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030160317.2528209-1-joey.gouly@arm.com>
References: <20241030160317.2528209-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_090342_683006_C07A4CFA 
X-CRM114-Status: GOOD (  17.81  )
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

From: James Morse <james.morse@arm.com>

The ID_AA64PFR0.MPAM bit was previously accidentally exposed to guests,
and is ignored by KVM. KVM will always present the guest with 0 here,
and trap the MPAM system registers to inject an undef.

But, this value is still needed to prevent migration when the value
is incompatible with the target hardware. Add a kvm unit test to try
and write multiple values to ID_AA64PFR0.MPAM. Only the hardware value
previously exposed should be ignored, all other values should be
rejected.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 .../selftests/kvm/aarch64/set_id_regs.c       | 99 ++++++++++++++++++-
 1 file changed, 98 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/aarch64/set_id_regs.c b/tools/testing/selftests/kvm/aarch64/set_id_regs.c
index b87e53580bfc..a79b7f18452d 100644
--- a/tools/testing/selftests/kvm/aarch64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/aarch64/set_id_regs.c
@@ -443,6 +443,101 @@ static void test_vm_ftr_id_regs(struct kvm_vcpu *vcpu, bool aarch64_only)
 	}
 }
 
+#define MPAM_IDREG_TEST	6
+static void test_user_set_mpam_reg(struct kvm_vcpu *vcpu)
+{
+	uint64_t masks[KVM_ARM_FEATURE_ID_RANGE_SIZE];
+	struct reg_mask_range range = {
+		.addr = (__u64)masks,
+	};
+	uint64_t val;
+	int idx, err;
+
+	/*
+	 * If ID_AA64PFR0.MPAM is _not_ officially modifiable and is zero,
+	 * check that if it can be set to 1, (i.e. it is supported by the
+	 * hardware), that it can't be set to other values.
+	 */
+
+	/* Get writable masks for feature ID registers */
+	memset(range.reserved, 0, sizeof(range.reserved));
+	vm_ioctl(vcpu->vm, KVM_ARM_GET_REG_WRITABLE_MASKS, &range);
+
+	/* Writeable? Nothing to test! */
+	idx = encoding_to_range_idx(SYS_ID_AA64PFR0_EL1);
+	if ((masks[idx] & ID_AA64PFR0_EL1_MPAM_MASK) == ID_AA64PFR0_EL1_MPAM_MASK) {
+		ksft_test_result_skip("ID_AA64PFR0_EL1.MPAM is officially writable, nothing to test\n");
+		return;
+	}
+
+	/* Get the id register value */
+	vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64PFR0_EL1), &val);
+
+	/* Try to set MPAM=0. This should always be possible. */
+	val &= ~ID_AA64PFR0_EL1_MPAM_MASK;
+	val |= FIELD_PREP(ID_AA64PFR0_EL1_MPAM_MASK, 0);
+	err = __vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64PFR0_EL1), val);
+	if (err)
+		ksft_test_result_fail("ID_AA64PFR0_EL1.MPAM=0 was not accepted\n");
+	else
+		ksft_test_result_pass("ID_AA64PFR0_EL1.MPAM=0 worked\n");
+
+	/* Try to set MPAM=1 */
+	val &= ~ID_AA64PFR0_EL1_MPAM_MASK;
+	val |= FIELD_PREP(ID_AA64PFR0_EL1_MPAM_MASK, 1);
+	err = __vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64PFR0_EL1), val);
+	if (err)
+		ksft_test_result_skip("ID_AA64PFR0_EL1.MPAM is not writable, nothing to test\n");
+	else
+		ksft_test_result_pass("ID_AA64PFR0_EL1.MPAM=1 was writable\n");
+
+	/* Try to set MPAM=2 */
+	val &= ~ID_AA64PFR0_EL1_MPAM_MASK;
+	val |= FIELD_PREP(ID_AA64PFR0_EL1_MPAM_MASK, 2);
+	err = __vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64PFR0_EL1), val);
+	if (err)
+		ksft_test_result_pass("ID_AA64PFR0_EL1.MPAM not arbitrarily modifiable\n");
+	else
+		ksft_test_result_fail("ID_AA64PFR0_EL1.MPAM value should not be ignored\n");
+
+	/* And again for ID_AA64PFR1_EL1.MPAM_frac */
+	idx = encoding_to_range_idx(SYS_ID_AA64PFR1_EL1);
+	if ((masks[idx] & ID_AA64PFR1_EL1_MPAM_frac_MASK) == ID_AA64PFR1_EL1_MPAM_frac_MASK) {
+		ksft_test_result_skip("ID_AA64PFR1_EL1.MPAM_frac is officially writable, nothing to test\n");
+		return;
+	}
+
+	/* Get the id register value */
+	vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64PFR1_EL1), &val);
+
+	/* Try to set MPAM_frac=0. This should always be possible. */
+	val &= ~ID_AA64PFR1_EL1_MPAM_frac_MASK;
+	val |= FIELD_PREP(ID_AA64PFR1_EL1_MPAM_frac_MASK, 0);
+	err = __vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64PFR1_EL1), val);
+	if (err)
+		ksft_test_result_fail("ID_AA64PFR0_EL1.MPAM_frac=0 was not accepted\n");
+	else
+		ksft_test_result_pass("ID_AA64PFR0_EL1.MPAM_frac=0 worked\n");
+
+	/* Try to set MPAM_frac=1 */
+	val &= ~ID_AA64PFR1_EL1_MPAM_frac_MASK;
+	val |= FIELD_PREP(ID_AA64PFR1_EL1_MPAM_frac_MASK, 1);
+	err = __vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64PFR1_EL1), val);
+	if (err)
+		ksft_test_result_skip("ID_AA64PFR1_EL1.MPAM_frac is not writable, nothing to test\n");
+	else
+		ksft_test_result_pass("ID_AA64PFR0_EL1.MPAM_frac=1 was writable\n");
+
+	/* Try to set MPAM_frac=2 */
+	val &= ~ID_AA64PFR1_EL1_MPAM_frac_MASK;
+	val |= FIELD_PREP(ID_AA64PFR1_EL1_MPAM_frac_MASK, 2);
+	err = __vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64PFR1_EL1), val);
+	if (err)
+		ksft_test_result_pass("ID_AA64PFR1_EL1.MPAM_frac not arbitrarily modifiable\n");
+	else
+		ksft_test_result_fail("ID_AA64PFR1_EL1.MPAM_frac value should not be ignored\n");
+}
+
 static void test_guest_reg_read(struct kvm_vcpu *vcpu)
 {
 	bool done = false;
@@ -581,12 +676,14 @@ int main(void)
 		   ARRAY_SIZE(ftr_id_aa64isar2_el1) + ARRAY_SIZE(ftr_id_aa64pfr0_el1) +
 		   ARRAY_SIZE(ftr_id_aa64pfr1_el1) + ARRAY_SIZE(ftr_id_aa64mmfr0_el1) +
 		   ARRAY_SIZE(ftr_id_aa64mmfr1_el1) + ARRAY_SIZE(ftr_id_aa64mmfr2_el1) +
-		   ARRAY_SIZE(ftr_id_aa64zfr0_el1) - ARRAY_SIZE(test_regs) + 2;
+		   ARRAY_SIZE(ftr_id_aa64zfr0_el1) - ARRAY_SIZE(test_regs) + 2 +
+		   MPAM_IDREG_TEST;
 
 	ksft_set_plan(test_cnt);
 
 	test_vm_ftr_id_regs(vcpu, aarch64_only);
 	test_vcpu_ftr_id_regs(vcpu);
+	test_user_set_mpam_reg(vcpu);
 
 	test_guest_reg_read(vcpu);
 
-- 
2.25.1


