Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC58C55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 06:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c3V4qSzOkxpZx3NiN3u7t44+UfsiA1QFBuzhgGyCJts=; b=4Gz/wuVBmkbL616BZku42Xcox0
	dN9ZD/VEZlI4lCBm9NR0MVWup7h9OUcDJMiXjRtrM2Rdws+kSiUvuuNNKWkzWpYclLw3/I39p4aVo
	8HpjBg5Xhn2BoomiuW7SxSHwENDoMNJSnrRhCmh9Q+aZ1eX9K+QimV8I6Kj8m+MR8Hhwt4SevPqwL
	l9W8TkHoDui8vNJiB8K+CHYoIBCzRmktdgkRNiyblruHmELfL962MEcfvd4F58ZONy+LmxN1L/lhX
	DAcH9kRshmbOb6FxumTgTN2iuhkP0WB8NVCSPJyKMLhczsQJiO4aJmBTS2Mt3ZHzhWt2MiENvP2EV
	DDzWCkgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVPv-00000003LU9-14fS;
	Wed, 05 Aug 2026 06:47:55 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVPr-00000003LTK-1M6m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 06:47:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785912467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c3V4qSzOkxpZx3NiN3u7t44+UfsiA1QFBuzhgGyCJts=;
	b=l6JEi5PKIXxC+IhcLUBzscWRE8H5f3rOBUv0oBUbfK4BiGswrw47SKFd3lzGxvtzMWB4ds
	poYjl9sbX4WuhuQMTZEHjm62NxMUrvRXD/md9Z4ugpUqulPbfTycZyzz5sgXiH0WTVZOfu
	z4CCnJQxm2RhkPJeE1cFf2OHzscsL9E=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] KVM: arm64: selftests: Check ID regs are immutable after a failed run
Date: Wed,  5 Aug 2026 07:47:40 +0100
Message-Id: <20260805064740.3013538-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_234752_529710_36D73361 
X-CRM114-Status: GOOD (  22.49  )
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

Add a set_id_regs case covering ID register immutability when a vCPU's
first KVM_RUN fails after finalization but before
KVM_ARCH_FLAG_HAS_RAN_ONCE is set. The test provokes such a failure with
a PMUv3-enabled vCPU whose PMU is left uninitialized, then checks that
KVM_SET_ONE_REG on the feature and implementation ID registers, and
KVM_CREATE_DEVICE for a vGIC, are all rejected with -EBUSY.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    This exercises the bug fixed by the KVM/arm64 ID register finalisation
    series and fails without it, so it should be applied on top of that
    series:
    
    https://lore.kernel.org/r/20260803-kvm-arm64-idreg-final-v2-0-d7d7e4efc640@kernel.org
    
    Changes since v1:
    - Cover the VM-wide implementation ID registers (MIDR_EL1, REVIDR_EL1,
      AIDR_EL1) as well as the feature ID registers, per Mark's review.
    - Check every feature ID field that could still be lowered before
      finalization, rather than only the first one found.
    - Report the skip under the same name as the pass, with the reason as a
      ksft_print_msg() diagnostic, so automation can match results for this
      test across runs.

 .../testing/selftests/kvm/arm64/set_id_regs.c | 106 +++++++++++++++++-
 1 file changed, 105 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 7429a1055df56..10849d21c0dd2 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -13,6 +13,7 @@
 #include "kvm_util.h"
 #include "processor.h"
 #include "test_util.h"
+#include "vgic.h"
 #include <linux/bitfield.h>
 
 enum ftr_type {
@@ -803,6 +804,107 @@ static void test_reset_preserves_id_regs(struct kvm_vcpu *vcpu)
 	ksft_test_result_pass("%s\n", __func__);
 }
 
+/*
+ * ID registers must stay immutable even when a vCPU's first KVM_RUN fails
+ * after finalization but before KVM_ARCH_FLAG_HAS_RAN_ONCE is set.
+ */
+static void test_idreg_frozen_after_failed_run(void)
+{
+	static const u32 imp_id_regs[] = {
+		SYS_MIDR_EL1,
+		SYS_REVIDR_EL1,
+		SYS_AIDR_EL1,
+	};
+	struct kvm_vcpu_init init;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	int r;
+
+	if (!kvm_has_cap(KVM_CAP_ARM_PMU_V3)) {
+		ksft_print_msg("PMUv3 unsupported, cannot fail the first run\n");
+		ksft_test_result_skip("%s\n", __func__);
+		return;
+	}
+
+	/* Skip the default vGIC so the KVM_CREATE_DEVICE gate is reachable. */
+	test_disable_default_vgic();
+
+	vm = vm_create(1);
+	vm_enable_cap(vm, KVM_CAP_ARM_WRITABLE_IMP_ID_REGS, 0);
+	kvm_get_default_vcpu_target(vm, &init);
+	init.features[0] |= (1 << KVM_ARM_VCPU_PMU_V3);
+	vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code);
+	kvm_arch_vm_finalize_vcpus(vm);
+
+	/*
+	 * A PMUv3 vCPU left without PMU init is rejected by
+	 * kvm_arm_pmu_v3_enable(), which runs after sysreg finalization.
+	 */
+	r = _vcpu_run(vcpu);
+	TEST_ASSERT(r < 0 && errno == EINVAL,
+		    "first KVM_RUN should fail post-finalization: r=%d errno=%d",
+		    r, errno);
+
+	/*
+	 * Feature ID registers: use values that would have been accepted before
+	 * finalization, so that a rejection means the registers are final
+	 * rather than the value being invalid.
+	 */
+	for (int i = 0; i < ARRAY_SIZE(test_regs); i++) {
+		const struct reg_ftr_bits *ftr_bits = test_regs[i].ftr_bits;
+		u64 reg = KVM_ARM64_SYS_REG(test_regs[i].reg);
+		u64 val = vcpu_get_reg(vcpu, reg);
+
+		for (int j = 0; ftr_bits[j].type != FTR_END; j++) {
+			u64 ftr = (val & ftr_bits[j].mask) >> ftr_bits[j].shift;
+			u64 safe = get_safe_value(&ftr_bits[j], ftr);
+			u64 new_val;
+
+			if (safe == ftr)
+				continue;
+
+			new_val = (val & ~ftr_bits[j].mask) |
+				  (safe << ftr_bits[j].shift);
+
+			r = __vcpu_set_reg(vcpu, reg, new_val);
+			TEST_ASSERT(r < 0 && errno == EBUSY,
+				    "%s write after failed first run: r=%d errno=%d",
+				    ftr_bits[j].name, r, errno);
+			TEST_ASSERT_EQ(vcpu_get_reg(vcpu, reg), val);
+		}
+
+		/* A write matching the finalized value is still accepted. */
+		vcpu_set_reg(vcpu, reg, val);
+	}
+
+	/*
+	 * The VM-wide implementation ID registers are gated separately. Bit 0
+	 * is within the writable mask of all three, so flipping it is a change
+	 * KVM would otherwise accept.
+	 */
+	for (int i = 0; i < ARRAY_SIZE(imp_id_regs); i++) {
+		u64 reg = KVM_ARM64_SYS_REG(imp_id_regs[i]);
+		u64 val = vcpu_get_reg(vcpu, reg);
+
+		r = __vcpu_set_reg(vcpu, reg, val ^ 1);
+		TEST_ASSERT(r < 0 && errno == EBUSY,
+			    "implementation ID reg write after failed first run: r=%d errno=%d",
+			    r, errno);
+		TEST_ASSERT_EQ(vcpu_get_reg(vcpu, reg), val);
+	}
+
+	/* Creating an in-kernel irqchip would change the ID registers too. */
+	if (kvm_supports_vgic_v3()) {
+		r = __kvm_create_device(vm, KVM_DEV_TYPE_ARM_VGIC_V3);
+		TEST_ASSERT(r < 0 && errno == EBUSY,
+			    "vGIC creation after failed first run: r=%d errno=%d",
+			    r, errno);
+	}
+
+	kvm_vm_free(vm);
+	ksft_test_result_pass("%s\n", __func__);
+}
+
 int main(void)
 {
 	struct kvm_vcpu *vcpu;
@@ -828,7 +930,7 @@ int main(void)
 
 	ksft_print_header();
 
-	test_cnt = 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST;
+	test_cnt = 4 + MPAM_IDREG_TEST + MTE_IDREG_TEST;
 	for (i = 0; i < ARRAY_SIZE(test_regs); i++)
 		for (j = 0; test_regs[i].ftr_bits[j].type != FTR_END; j++)
 			test_cnt++;
@@ -847,5 +949,7 @@ int main(void)
 
 	kvm_vm_free(vm);
 
+	test_idreg_frozen_after_failed_run();
+
 	ksft_finished();
 }
-- 
2.39.5


