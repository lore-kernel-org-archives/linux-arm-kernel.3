Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A51A606EE89
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3fyCHmxf;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Te2wDPBZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SttFgNGapOdf6xpekboIrIUVOuex4pZB9Q0xlVQAwr0=; b=3fyCHmxf0XrHIG
	G83aa9tYZbfNQEQx5YSjHUXrSpmP9Xh4zmPLHVe8wuxUDjnxst+buOJgTM9fmXvdDRfQ0xFTgq/O1
	+C+aGRkmww2se1iEFp2EsZJCxctvcneNI1iBL7xWXRbBGXADGiMsArjCgU8YUwnOCkN1tX7DQD9+x
	XRCwxLZyXs+5KDX57p0sJehH/9hQUKhnsXiILARXzVr5rAIUeI9xsrsDAsbK21QT1NWTKvobDe6re
	YFhiFwLxlg5oCrEHAz+ZmGjgtFURxUlcWrqLRxmAHhlxAQmygO2sjJoe4uZPZNCYx+03jaHJQwbh8
	ycAGsBLJd7qsuSCxAeEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ7v-00000003PCO-3mdU;
	Tue, 03 Nov 2026 18:20:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ7u-00000003PBV-1tTe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 18:20:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D8D1A60A06;
	Tue,  3 Nov 2026 18:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADB91F00919;
	Tue,  3 Nov 2026 18:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793730053;
	bh=SttFgNGapOdf6xpekboIrIUVOuex4pZB9Q0xlVQAwr0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Te2wDPBZ99J1SasnGE5Wb2Se9qMiLwvswIhNl3ner51yTWyddkJ5J/saXNrqRziAf
	 DQ+LHlmuAP4tSj6NRnH5oUH+IaoRLmQbS3BjQ/sKZ3A8elKX87yk/m4N1XQ1Gb95EC
	 CN93HB00BfPJN6ddAxYc4TnX3DEmwshO8pFBL3r5RbCPKs4+hp+KEu0u7RElXUf1F2
	 ajoOsP85P+JdsNIUCmGuV4onAgCCumlxLFn5tHoTfX+2immuqAGK1WTZI95uUSc3ak
	 XR0bj2UMANuvfk9Aw2hWLRy2HHCu5UKVGk6ZJ7+pFOT+farQhUxoDFh4CReKbbCzT7
	 Yt8BH3Mycn6Sg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Nov 2026 18:19:21 +0000
Subject: [PATCH v9 1/3] KVM: selftests: arm64: Report set_id_reg reads of
 test registers as tests
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-kvm-arm64-set-id-regs-aarch64-v9-1-ab32bc79fa9c@kernel.org>
References: <20261103-kvm-arm64-set-id-regs-aarch64-v9-0-ab32bc79fa9c@kernel.org>
In-Reply-To: <20261103-kvm-arm64-set-id-regs-aarch64-v9-0-ab32bc79fa9c@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Oliver Upton <oupton@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5698; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9ExxUMmwzxTlWd+nQzZOHwmnEACOrCfyZAfJJjqwcaU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeqf77XOTyN6ViIuPz+Vs2/VnKf6akmfO4vNifb5wtt
 9yfLTfX6ChlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEXP0Z/ocYSW1JOPd28XOW
 s62b1Y/xdshcTS62TYw7MvfdocjLwn8Z/llFVp/+VJJ/JOBfoofncpuH7prWC3ecvLT2Xrj+5Jq
 PFlwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

Currently when we run guest code to validate that the values we wrote to
the registers are seen by the guest we assert that these values match using
a KVM selftests level assert, resulting in unclear diagnostics if the test
fails. Replace this assert with reporting a kselftest test per register.

In order to support getting the names of the registers we repaint the array
of ID_ registers to store the names and open code the rest.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 82 +++++++++++++++++++------
 1 file changed, 63 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 1d2cc25cb3f4..0e6fd7b57e52 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -44,6 +44,7 @@ struct reg_ftr_bits {
 };
 
 struct test_feature_reg {
+	const char *name;
 	u32 reg;
 	const struct reg_ftr_bits *ftr_bits;
 };
@@ -228,30 +229,32 @@ static const struct reg_ftr_bits ftr_id_aa64zfr0_el1[] = {
 
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
 
 static void guest_code(void)
 {
+	/* Registers in test_regs array */
 	GUEST_REG_SYNC(SYS_ID_AA64DFR0_EL1);
 	GUEST_REG_SYNC(SYS_ID_DFR0_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64ISAR0_EL1);
@@ -265,6 +268,8 @@ static void guest_code(void)
 	GUEST_REG_SYNC(SYS_ID_AA64MMFR2_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64MMFR3_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64ZFR0_EL1);
+
+	/* Additional registers counted in NUM_EXTRA_REGS */
 	GUEST_REG_SYNC(SYS_MPIDR_EL1);
 	GUEST_REG_SYNC(SYS_CLIDR_EL1);
 	GUEST_REG_SYNC(SYS_CTR_EL0);
@@ -275,6 +280,35 @@ static void guest_code(void)
 	GUEST_DONE();
 }
 
+#define NUM_EXTRA_REGS 6
+#define GUEST_READ_TEST (ARRAY_SIZE(test_regs) + NUM_EXTRA_REGS)
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
 u64 get_safe_value(const struct reg_ftr_bits *ftr_bits, u64 ftr)
 {
@@ -675,7 +709,8 @@ static void test_guest_reg_read(struct kvm_vcpu *vcpu)
 	struct ucall uc;
 
 	while (!done) {
-		u64 val;
+		u64 reg_id, expected_val, guest_val;
+		bool match;
 
 		vcpu_run(vcpu);
 
@@ -684,11 +719,20 @@ static void test_guest_reg_read(struct kvm_vcpu *vcpu)
 			REPORT_GUEST_ASSERT(uc);
 			break;
 		case UCALL_SYNC:
-			val = test_reg_vals[encoding_to_range_idx(uc.args[2])];
-			val = reset_mutable_bits(uc.args[2], val);
+			expected_val = test_reg_vals[encoding_to_range_idx(uc.args[2])];
+			expected_val = reset_mutable_bits(uc.args[2], expected_val);
 
 			/* Make sure the written values are seen by guest */
-			TEST_ASSERT_EQ(val, reset_mutable_bits(uc.args[2], uc.args[3]));
+			reg_id = uc.args[2];
+			guest_val = reset_mutable_bits(uc.args[2], uc.args[3]);
+
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
@@ -941,7 +985,7 @@ int main(void)
 
 	ksft_print_header();
 
-	test_cnt = 4 + MPAM_IDREG_TEST + MTE_IDREG_TEST;
+	test_cnt = 4 + MPAM_IDREG_TEST + MTE_IDREG_TEST + GUEST_READ_TEST;
 	for (i = 0; i < ARRAY_SIZE(test_regs); i++)
 		for (j = 0; test_regs[i].ftr_bits[j].type != FTR_END; j++)
 			test_cnt++;

-- 
2.47.3


