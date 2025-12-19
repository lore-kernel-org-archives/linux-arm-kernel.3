Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F71D78770
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 19:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YyCtGckVozuyHcEy8uu3GLn7b5k6ydU81hFsFcmyINI=; b=QtNPpLULUdj7YHHvdRrSYe0NTF
	GRL9DiV5aFZWwMMBn/oWMG+K6V6SX2Z2AEY4iM/nBddoE21Sbp65mRh+QdCPMmEGTCUXLKAJHh1Sp
	ivCNeF3y5orOo9M3busk6dzDPlt9T5XrDrhh3cEd4Sng6dIr16EMPMyL7+Zv5V/08MX9dqgbGPqIj
	OVSqBBVcQBMESufmBByuB61a6AAN0rN+P2f6/t5iM6BSLmG4BC/GdQXolAvRzdi9ZCylYqrQbOB/6
	WEAYc/jErU6ZxX9ljFaHEl39Ico5EDn9ZoNaTQvWb/82etTFo7ErXPFwVLwYeofjdpM8Eu8m8sqAK
	a6sLYnqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWg9w-0000000At1c-0YP3;
	Fri, 19 Dec 2025 19:29:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWg9u-0000000At0m-24mw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 19:29:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E98216001D;
	Fri, 19 Dec 2025 19:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E6BC4CEF1;
	Fri, 19 Dec 2025 19:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766172541;
	bh=ePyIOcLw3qUF6qAyJngOGuOfqRNYRlISmZ1orSZP0mk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XfxsieM3KG2nemYgQZrRsqd2l9fZxnvc5TOZERMw7b+8ex5T6qtxVYRB+erKJWDI6
	 vpHXNGStP3jVV7ZDNKCPe3xQLbrMUxgjdagn7sDh3RUs2wQJ0d5BVwgTMBOOaQqeLP
	 fPKuO5hO8wE4+qTI/YdLKSjRKvG64a5Z5K+QV07i4Uex27/QL1kyQYbBF6HvuM5OaU
	 /tMt0+isLP3ieW59RXavIzA5tttN9xjTWYbknYXI0WNnmgv59tLSJcWVh19QGTYwPU
	 5bHalpaN97kMHjo+/dAY7lQFfpOYiYsyVN4kuhLk3vua/fxje63/sHW+xWlLLOFES/
	 Bg6Kb+CR/S5kA==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 19 Dec 2025 19:28:10 +0000
Subject: [PATCH v3 4/4] KVM: selftests: arm64: Skip all 32 bit IDs when
 set_id_regs is aarch64 only
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-kvm-arm64-set-id-regs-aarch64-v3-4-bfa474ec3218@kernel.org>
References: <20251219-kvm-arm64-set-id-regs-aarch64-v3-0-bfa474ec3218@kernel.org>
In-Reply-To: <20251219-kvm-arm64-set-id-regs-aarch64-v3-0-bfa474ec3218@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Oliver Upton <oupton@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=4530; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ePyIOcLw3qUF6qAyJngOGuOfqRNYRlISmZ1orSZP0mk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpRadv2AkLNtWtMjbY/XUUsUHGKaC7S3EPyHEjy
 ctjsXQSieWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaUWnbwAKCRAk1otyXVSH
 0HErB/0UKCEgiBTrpFERnJ4P/ggQezbnaMjbAqIfCY4o9cf3hDHlm637ZGRBLslfyNwMWhaD+Qf
 TktFtQtkhOIuO7JuGYgW/yoCkm+2s1KSkH6UFNgqlaF60Sc1TyiN5IMLj89+ekC84Yqm0NC1hmt
 z9+GkBKXHsiIdjYrnghmkSbNRmyh+WvHgPkugUJQb8lh9bjG/Arorb4fL44WK6pPIdv7MscI4c0
 6si7NnhyeWXs1/9Drq2jI+jMQlOVSrRpoQw73tS1GUj8BQHVvHnpm/Q+3tZqZvFg1O7k9peoagp
 MVx42cpsr8NFNmpgL6KKfTL9Xfe25XJRsnIRlzLGiT2StMPq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On an aarch64 only system the 32 bit ID registers have UNDEFINED values.
As a result set_id_regs skips tests for setting fields in these registers
when testing an aarch64 only guest. This has the side effect of meaning
that we don't record an expected value for these registers, meaning that
when the subsequent tests for values being visible in guests and preserved
over reset check the value they can spuriously fail. This can be seen by
running on an emulated system with both NV and 32 bit enabled, NV will
result in the guests created by the test program being 64 bit only but
the 32 bit ID registers will have values.

Also skip those tests that use the values set in the field setting tests
for aarch64 only guests in order to avoid these spurious failures.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 42 +++++++++++++++++--------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 5837da63e9b9..f19ba949aa18 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -675,7 +675,7 @@ static void test_user_set_mte_reg(struct kvm_vcpu *vcpu)
 		ksft_test_result_pass("ID_AA64PFR1_EL1.MTE_frac no longer 0xF\n");
 }
 
-static void test_guest_reg_read(struct kvm_vcpu *vcpu)
+static void test_guest_reg_read(struct kvm_vcpu *vcpu, bool aarch64_only)
 {
 	bool done = false;
 	struct ucall uc;
@@ -694,6 +694,13 @@ static void test_guest_reg_read(struct kvm_vcpu *vcpu)
 			reg_id = uc.args[2];
 			guest_val = uc.args[3];
 			expected_val = test_reg_vals[encoding_to_range_idx(reg_id)];
+
+			if (aarch64_only && sys_reg_CRm(reg_id) < 4) {
+				ksft_test_result_skip("%s value seen in guest\n",
+						      get_reg_name(reg_id));
+				break;
+			}
+
 			match = expected_val == guest_val;
 			if (!match)
 				ksft_print_msg("%lx != %lx\n",
@@ -785,12 +792,19 @@ static void test_vcpu_non_ftr_id_regs(struct kvm_vcpu *vcpu)
 	ksft_test_result_pass("%s\n", __func__);
 }
 
-static void test_assert_id_reg_unchanged(struct kvm_vcpu *vcpu, uint32_t encoding)
+static void test_assert_id_reg_unchanged(struct kvm_vcpu *vcpu, uint32_t encoding,
+					 bool aarch64_only)
 {
 	size_t idx = encoding_to_range_idx(encoding);
 	uint64_t observed;
 	bool pass;
 
+	if (aarch64_only && sys_reg_CRm(encoding) < 4) {
+		ksft_test_result_skip("%s unchanged by reset\n",
+				      get_reg_name(encoding));
+		return;
+	}
+
 	observed = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(encoding));
 	pass = test_reg_vals[idx] == observed;
 	if (!pass)
@@ -801,7 +815,8 @@ static void test_assert_id_reg_unchanged(struct kvm_vcpu *vcpu, uint32_t encodin
 
 #define ID_REG_RESET_UNCHANGED_TEST (ARRAY_SIZE(test_regs) + 6)
 
-static void test_reset_preserves_id_regs(struct kvm_vcpu *vcpu)
+static void test_reset_preserves_id_regs(struct kvm_vcpu *vcpu,
+					 bool aarch64_only)
 {
 	/*
 	 * Calls KVM_ARM_VCPU_INIT behind the scenes, which will do an
@@ -810,14 +825,15 @@ static void test_reset_preserves_id_regs(struct kvm_vcpu *vcpu)
 	aarch64_vcpu_setup(vcpu, NULL);
 
 	for (int i = 0; i < ARRAY_SIZE(test_regs); i++)
-		test_assert_id_reg_unchanged(vcpu, test_regs[i].reg);
-
-	test_assert_id_reg_unchanged(vcpu, SYS_MPIDR_EL1);
-	test_assert_id_reg_unchanged(vcpu, SYS_CLIDR_EL1);
-	test_assert_id_reg_unchanged(vcpu, SYS_CTR_EL0);
-	test_assert_id_reg_unchanged(vcpu, SYS_MIDR_EL1);
-	test_assert_id_reg_unchanged(vcpu, SYS_REVIDR_EL1);
-	test_assert_id_reg_unchanged(vcpu, SYS_AIDR_EL1);
+		test_assert_id_reg_unchanged(vcpu, test_regs[i].reg,
+					     aarch64_only);
+
+	test_assert_id_reg_unchanged(vcpu, SYS_MPIDR_EL1, aarch64_only);
+	test_assert_id_reg_unchanged(vcpu, SYS_CLIDR_EL1, aarch64_only);
+	test_assert_id_reg_unchanged(vcpu, SYS_CTR_EL0, aarch64_only);
+	test_assert_id_reg_unchanged(vcpu, SYS_MIDR_EL1, aarch64_only);
+	test_assert_id_reg_unchanged(vcpu, SYS_REVIDR_EL1, aarch64_only);
+	test_assert_id_reg_unchanged(vcpu, SYS_AIDR_EL1, aarch64_only);
 }
 
 int main(void)
@@ -859,9 +875,9 @@ int main(void)
 	test_user_set_mpam_reg(vcpu);
 	test_user_set_mte_reg(vcpu);
 
-	test_guest_reg_read(vcpu);
+	test_guest_reg_read(vcpu, aarch64_only);
 
-	test_reset_preserves_id_regs(vcpu);
+	test_reset_preserves_id_regs(vcpu, aarch64_only);
 
 	kvm_vm_free(vm);
 

-- 
2.47.3


