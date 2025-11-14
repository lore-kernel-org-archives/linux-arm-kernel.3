Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE96CE8D47
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cByvY7PqUsMTxOyvg4sef5N9idgk6FkgcL3axstXZ0=; b=dTELokwM7WaHbkMNgSx0feDq1/
	1TDTdUqicAN8y5kDwhJYsPw2QjJXSNwy6wQE3+CCGeut8LtSKUdemBeADzQIhVN4GI8f9M7KSivFR
	jYDynM0StKdm7/TpfHLbd5q4hqAzFDD3to1urvTMKYRGe23065HlJh5OrN7XhlIetPJHrWp+A9Dv1
	C8ul1i8TMmFRBC8930kxD1BwoCtCoTzfVbI78c6+7smzH0nBdMAj8mdjfvLG/jkxasGPTSyWIMGO4
	jIM9Is3dNLAd4F7lHVAUDEGmyiTFBBtFfy2t8NIcBFRpFAfF+K+fDt0OKmWyOCbg+4JSLG8mbAOSy
	uYbSO93A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvtE-0000000CaZZ-21Iv;
	Fri, 14 Nov 2025 15:39:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvtA-0000000CaY0-3oRl
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:39:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/cByvY7PqUsMTxOyvg4sef5N9idgk6FkgcL3axstXZ0=; b=VbA9E+WNa9Iz7tKVqn6m0fxINM
	fA1pfuGxIH8q2oVkV8H/cIQgwpPTNro8JvHcjAdKTZ9ulNZEDVkgvX8HZwciU0Y+n9D5tYGImkeBO
	cTF4G/Ry30IubCcy/OwAw9tP0FAgPVUFR7eUD18/pInFN5EPpBZE0mnatnIhInxTnknTj82wgeG0T
	K0d+/CUnBfP3uMu7KjGTBZJUb182FH3ywRcIzv4H+iwiHiwyKt+FEOBOazJkLMg/7lyWTNQybVkFe
	jU2zbdSdFCT7ybxJVk4Rfv9AhYT3Jnr7Gj+XsM+Nhquwi8BzEOO2mr77owgwnxjfuAJCsRMZjsF2h
	8gtNAAQg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJv1T-00000002qsK-0Wm7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:43:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7479140994;
	Fri, 14 Nov 2025 15:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFAEEC4CEFB;
	Fri, 14 Nov 2025 15:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763134740;
	bh=uNwDXUwlPyXEgttCCR2gAD/CSzRiWE8XchLoChLWNmw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eiDWJd0vyrOdBwR9stZ0zhpF0IHbzcqNEQgzkTwii3Bn/QOkTZ/vsmtawWqKTjz7e
	 rw9F8q8EydcaKFwjTIuHWbiHeRr/kjKqgwD06SAY/ynsS4hwXqfE0oCdQLPXh/RTCN
	 mLK0qZrsVaqMFqnhjGhmaT3CvwnJL9l1fYESDd5b4SjIOXTA9NIuIMlB862l0+/TuA
	 Li8d/XKemkVJCS0c+53xSv4wAWc4q88FUW/NapuRrDRh/m9n2mZR5R0m9TFFKsT0OI
	 QlZx1it3lbal3fMeC0uj1aITklUAsA0XxKiBQ8XwJ8tVnLOhQvYx/XWjuZOHR3HIog
	 jGd89XNcM97gQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 14 Nov 2025 15:35:37 +0000
Subject: [PATCH v2 4/4] KVM: selftests: arm64: Skip all 32 bit IDs when
 set_id_regs is aarch64 only
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kvm-arm64-set-id-regs-aarch64-v2-4-672f214f41bf@kernel.org>
References: <20251114-kvm-arm64-set-id-regs-aarch64-v2-0-672f214f41bf@kernel.org>
In-Reply-To: <20251114-kvm-arm64-set-id-regs-aarch64-v2-0-672f214f41bf@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-88d78
X-Developer-Signature: v=1; a=openpgp-sha256; l=4530; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uNwDXUwlPyXEgttCCR2gAD/CSzRiWE8XchLoChLWNmw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpF00FlaR6CysOhNqJuXUWWXOCFqVSb6pOhNFeL
 HTvgq8VpbuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaRdNBQAKCRAk1otyXVSH
 0PHNB/9n9jGVcM3keHTaLahbLR+v1VCSDWfsgbzxVQB7r/YLwElPxt6CuWXXa527vbk0KqdY+1C
 h1vJRUn2ktLos+3q+obK/94l4yrbSV0OnbWLVVRPENUgwhX1AlLX5H6EIk6B8SUWMHArBmxqGOL
 O9CnniEyYaRZ2zT4g94IWXp6m8XfbAxMtluFZAlvUHFyOAJvFAO8Q7DXF1hV1OeZ7RmP6lEzmIl
 ZtoPLxR44pfes3ZEpZEYaoUiwBgyXj8UcoiId9VFNbKkjacMohBKs3abG7LsvDQEkxRYmajaERp
 H+lmh/A0KFRwz5u5Z9bzlJ7PrHX0A3iuVZIhfakK23tXlcGA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_144335_693635_11D98D89 
X-CRM114-Status: GOOD (  13.21  )
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
index abe97f9293c9..55e13aa758ff 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -671,7 +671,7 @@ static void test_user_set_mte_reg(struct kvm_vcpu *vcpu)
 		ksft_test_result_pass("ID_AA64PFR1_EL1.MTE_frac no longer 0xF\n");
 }
 
-static void test_guest_reg_read(struct kvm_vcpu *vcpu)
+static void test_guest_reg_read(struct kvm_vcpu *vcpu, bool aarch64_only)
 {
 	bool done = false;
 	struct ucall uc;
@@ -690,6 +690,13 @@ static void test_guest_reg_read(struct kvm_vcpu *vcpu)
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
@@ -781,12 +788,19 @@ static void test_vcpu_non_ftr_id_regs(struct kvm_vcpu *vcpu)
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
@@ -797,7 +811,8 @@ static void test_assert_id_reg_unchanged(struct kvm_vcpu *vcpu, uint32_t encodin
 
 #define ID_REG_RESET_UNCHANGED_TEST (ARRAY_SIZE(test_regs) + 6)
 
-static void test_reset_preserves_id_regs(struct kvm_vcpu *vcpu)
+static void test_reset_preserves_id_regs(struct kvm_vcpu *vcpu,
+					 bool aarch64_only)
 {
 	/*
 	 * Calls KVM_ARM_VCPU_INIT behind the scenes, which will do an
@@ -806,14 +821,15 @@ static void test_reset_preserves_id_regs(struct kvm_vcpu *vcpu)
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
@@ -855,9 +871,9 @@ int main(void)
 	test_user_set_mpam_reg(vcpu);
 	test_user_set_mte_reg(vcpu);
 
-	test_guest_reg_read(vcpu);
+	test_guest_reg_read(vcpu, aarch64_only);
 
-	test_reset_preserves_id_regs(vcpu);
+	test_reset_preserves_id_regs(vcpu, aarch64_only);
 
 	kvm_vm_free(vm);
 

-- 
2.47.2


