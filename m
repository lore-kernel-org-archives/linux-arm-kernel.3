Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7719D78770
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 19:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Ge/dK/q/Wj/6sBN1EN94xmF8ARwdM4SBR48MHXkkNM=; b=vTphHKsSyGVvox3S9gpWzYroS/
	9Fi6VkVOFap2xAnOQN0Tc8/s2Yy7NbQbbJaX0jVpVJkxugeJH/X+xTyanzewCIcF7mpLSWvVedqp2
	Tbcr3YBgVOaE+raI0AC8lpZJqmGLIS+Ov7BsmH1S2E2DUFtrjEGm89p/U6jnZ9+fDaivWNuj1NHUz
	yYoJBFbYEB3N9KKJIcBaF4Sel5QXBbnb86tiwY9XIu5G2wFVnuwyFdwO7KINE0Woixj8cYgD4y8jN
	q8Do2xcvjAbIU9vh1jGunVao5/qHv/oa5foz7SxqpG0/zwdLtcNGE9Ipka5kc/5B4tGoj14ZH+2/E
	7DNv3v9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWg9p-0000000Asye-2zvI;
	Fri, 19 Dec 2025 19:28:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWg9n-0000000Asxm-2Hh3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 19:28:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A947C443B2;
	Fri, 19 Dec 2025 19:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B6EC16AAE;
	Fri, 19 Dec 2025 19:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766172533;
	bh=SaPZPOIho/DNNXy8lUHHqnW23Nrz/VpzQ3D/fLJ4Iqw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tSkjkIYAtkIso4fBWa46CFRhL8jSm4p5h0RIOcNLopCfHImYngKa2ohM/BP8wepq4
	 8OOrexX8w49NXsGMKl8yRc1NSxJ6C2/alvYuiJ9OLlGGhp/bbrFSpmBfVFkR6q/7jg
	 UNTCOPxvmRBhMNY82vbZl+hUJ1VNphiXOJNieNft0xrvetjkHRKgjMemiaHcCM1F0x
	 2VmFqIKqJv6Cvtv1y6GT5u3cQ26oaWF53pVZze8Ew4jxh2BWlMvFvrr0cImtWc8HnB
	 FIiWlvZqUae5l7cDfHtaQmA/vBIONTEYLtUPeD2QaSidDk+mbQf5ZrpcRrAdXs1jIi
	 lTuYQTkzaJIAw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 19 Dec 2025 19:28:07 +0000
Subject: [PATCH v3 1/4] KVM: selftests: arm64: Report set_id_reg reads of
 test registers as tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-kvm-arm64-set-id-regs-aarch64-v3-1-bfa474ec3218@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4838; i=broonie@kernel.org;
 h=from:subject:message-id; bh=SaPZPOIho/DNNXy8lUHHqnW23Nrz/VpzQ3D/fLJ4Iqw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpRadtwYsuoz4nmH/iJ5tCts/hvKpqU4VNOFY4l
 kX/WAgh6MyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaUWnbQAKCRAk1otyXVSH
 0OmlB/9g+nq00OGZ9vxahUOt5/PqvgxvUaKy8Bkr6xrPYFoiw2w2gaNrF/hTm0QWiBZ8fActnR9
 j5wCWxZ3IvFwlyXMVfY98cxMfmMhnsf8Cctfg7d0Vei/9FN14iFfB0IDtCHL2L9D0j4gdSFwf7V
 kvB39G60sH2M2+P2qz1BngwPJulI94/be/QaBfoAVejyI+RW+1AMNspOJC9BBp7nKTY0C8P06hW
 x1VjshMlX0Iaz+m0eiie+/Cr6qmgRzcVg8CqPx1kTYZqhGQwXXQcQy4FYa3AlNiPcTITfsDwGSK
 B9p+NCFPYlIUgQxlnszD6rbUolQwdL0jVPSi9YfNjrioejht
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_112855_648954_5AA6B8EF 
X-CRM114-Status: GOOD (  16.78  )
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

Currently when we run guest code to validate that the values we wrote to
the registers are seen by the guest we assert that these values match using
a KVM selftests level assert, resulting in unclear diagnostics if the test
fails. Replace this assert with reporting a kselftest test per register.

In order to support getting the names of the registers we repaint the array
of ID_ registers to store the names and open code the rest.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 74 +++++++++++++++++++------
 1 file changed, 57 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index c4815d365816..84e9484a4899 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -40,6 +40,7 @@ struct reg_ftr_bits {
 };
 
 struct test_feature_reg {
+	const char *name;
 	uint32_t reg;
 	const struct reg_ftr_bits *ftr_bits;
 };
@@ -218,24 +219,25 @@ static const struct reg_ftr_bits ftr_id_aa64zfr0_el1[] = {
 
 #define TEST_REG(id, table)			\
 	{					\
-		.reg = id,			\
+		.name = #id,			\
+		.reg = SYS_ ## id,		\
 		.ftr_bits = &((table)[0]),	\
 	}
 
 static struct test_feature_reg test_regs[] = {
-	TEST_REG(SYS_ID_AA64DFR0_EL1, ftr_id_aa64dfr0_el1),
-	TEST_REG(SYS_ID_DFR0_EL1, ftr_id_dfr0_el1),
-	TEST_REG(SYS_ID_AA64ISAR0_EL1, ftr_id_aa64isar0_el1),
-	TEST_REG(SYS_ID_AA64ISAR1_EL1, ftr_id_aa64isar1_el1),
-	TEST_REG(SYS_ID_AA64ISAR2_EL1, ftr_id_aa64isar2_el1),
-	TEST_REG(SYS_ID_AA64ISAR3_EL1, ftr_id_aa64isar3_el1),
-	TEST_REG(SYS_ID_AA64PFR0_EL1, ftr_id_aa64pfr0_el1),
-	TEST_REG(SYS_ID_AA64PFR1_EL1, ftr_id_aa64pfr1_el1),
-	TEST_REG(SYS_ID_AA64MMFR0_EL1, ftr_id_aa64mmfr0_el1),
-	TEST_REG(SYS_ID_AA64MMFR1_EL1, ftr_id_aa64mmfr1_el1),
-	TEST_REG(SYS_ID_AA64MMFR2_EL1, ftr_id_aa64mmfr2_el1),
-	TEST_REG(SYS_ID_AA64MMFR3_EL1, ftr_id_aa64mmfr3_el1),
-	TEST_REG(SYS_ID_AA64ZFR0_EL1, ftr_id_aa64zfr0_el1),
+	TEST_REG(ID_AA64DFR0_EL1, ftr_id_aa64dfr0_el1),
+	TEST_REG(ID_DFR0_EL1, ftr_id_dfr0_el1),
+	TEST_REG(ID_AA64ISAR0_EL1, ftr_id_aa64isar0_el1),
+	TEST_REG(ID_AA64ISAR1_EL1, ftr_id_aa64isar1_el1),
+	TEST_REG(ID_AA64ISAR2_EL1, ftr_id_aa64isar2_el1),
+	TEST_REG(ID_AA64ISAR3_EL1, ftr_id_aa64isar3_el1),
+	TEST_REG(ID_AA64PFR0_EL1, ftr_id_aa64pfr0_el1),
+	TEST_REG(ID_AA64PFR1_EL1, ftr_id_aa64pfr1_el1),
+	TEST_REG(ID_AA64MMFR0_EL1, ftr_id_aa64mmfr0_el1),
+	TEST_REG(ID_AA64MMFR1_EL1, ftr_id_aa64mmfr1_el1),
+	TEST_REG(ID_AA64MMFR2_EL1, ftr_id_aa64mmfr2_el1),
+	TEST_REG(ID_AA64MMFR3_EL1, ftr_id_aa64mmfr3_el1),
+	TEST_REG(ID_AA64ZFR0_EL1, ftr_id_aa64zfr0_el1),
 };
 
 #define GUEST_REG_SYNC(id) GUEST_SYNC_ARGS(0, id, read_sysreg_s(id), 0, 0);
@@ -265,6 +267,34 @@ static void guest_code(void)
 	GUEST_DONE();
 }
 
+#define GUEST_READ_TEST (ARRAY_SIZE(test_regs) + 6)
+
+static const char *get_reg_name(u64 id)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(test_regs); i++)
+		if (test_regs[i].reg == id)
+			return test_regs[i].name;
+
+	switch (id) {
+	case SYS_MPIDR_EL1:
+		return "MPIDR_EL1";
+	case SYS_CLIDR_EL1:
+		return "CLIDR_EL1";
+	case SYS_CTR_EL0:
+		return "CTR_EL0";
+	case SYS_MIDR_EL1:
+		return "MIDR_EL1";
+	case SYS_REVIDR_EL1:
+		return "REVIDR_EL1";
+	case SYS_AIDR_EL1:
+		return "AIDR_EL1";
+	default:
+		TEST_FAIL("Unknown register");
+	}
+}
+
 /* Return a safe value to a given ftr_bits an ftr value */
 uint64_t get_safe_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr)
 {
@@ -639,6 +669,8 @@ static void test_guest_reg_read(struct kvm_vcpu *vcpu)
 {
 	bool done = false;
 	struct ucall uc;
+	uint64_t reg_id, expected_val, guest_val;
+	bool match;
 
 	while (!done) {
 		vcpu_run(vcpu);
@@ -649,8 +681,16 @@ static void test_guest_reg_read(struct kvm_vcpu *vcpu)
 			break;
 		case UCALL_SYNC:
 			/* Make sure the written values are seen by guest */
-			TEST_ASSERT_EQ(test_reg_vals[encoding_to_range_idx(uc.args[2])],
-				       uc.args[3]);
+			reg_id = uc.args[2];
+			guest_val = uc.args[3];
+			expected_val = test_reg_vals[encoding_to_range_idx(reg_id)];
+			match = expected_val == guest_val;
+			if (!match)
+				ksft_print_msg("%lx != %lx\n",
+					       expected_val, guest_val);
+			ksft_test_result(match,
+					 "%s value seen in guest\n",
+					 get_reg_name(reg_id));
 			break;
 		case UCALL_DONE:
 			done = true;
@@ -790,7 +830,7 @@ int main(void)
 
 	ksft_print_header();
 
-	test_cnt = 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST;
+	test_cnt = 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST + GUEST_READ_TEST;
 	for (i = 0; i < ARRAY_SIZE(test_regs); i++)
 		for (j = 0; test_regs[i].ftr_bits[j].type != FTR_END; j++)
 			test_cnt++;

-- 
2.47.3


