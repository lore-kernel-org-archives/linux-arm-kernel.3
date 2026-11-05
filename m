Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BD9606D832
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=08tKntDq;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HET13OAy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gvu63V7M7umrgDXBMaR7yNvzMp7zi7dv7vshULv5LKg=; b=08tKntDqluDx1x
	tbR5SV4zDaEPmvuBGgL87GLg061GHQkznWt40F5Z/EH4buN96uHpeNG4KvsPS4Q8BvYycw9AHG1Gv
	0IdS0R4VK87cOoX7q0l4ZNNC4CXi9dJFcxoLFBuGzqn4ZEXC+q8wBvJdvFqeEK+FKcRyMJOjPHdhe
	ffEkL3HlSwOtnVrZliFNzAis29r4PKnLekZWc5lcABSxOtEb/DpsPkSqdpnYjOKSc4I1zSOWsYdfS
	CvBu2YfTBH68gUDudXrm3wNxh1ibcgzPuZQ5tjVT4Xf1SWprCLSemQZnKkrzQgU8VPBJbcrnd8Lck
	SCxfnMT3iJQZqJs2WzOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwN1-00000008sI7-0qh9;
	Thu, 05 Nov 2026 12:15:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwMx-00000008sFw-1BWj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:15:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E9FF438DC;
	Thu,  5 Nov 2026 12:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487341F00919;
	Thu,  5 Nov 2026 12:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793880902;
	bh=gvu63V7M7umrgDXBMaR7yNvzMp7zi7dv7vshULv5LKg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HET13OAy3FUdTTo+2EzEyE3RfiUN0e+t0GHlqQm9HJ107JUgX63LRFE8riBZWBLD1
	 BAEbfqTrpAaFsD7PWYTgCvOaTpU9EfEqALcG65bmOd4B8byXRssb7hfMeq9ejKE4ci
	 s88WorSvUKWKiQSOln2j3u/Ls3cP7K0VRQU4WPpmn88AZ5p2f36b9oQnyeHL+99CCU
	 SPjskO+97HsWTagEYlgTfAGcS09ynBh5+z5xzDMEeTVLx25BseBcBAABB4criekHK5
	 R3bDitpl6ryr9XZDjaLmboiiUG3Yz9irI1WuvdIhXyVPOVoH5WOUE114uecnsBUVW9
	 UbjOeaIXx8hjA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 11:47:19 +0000
Subject: [PATCH v10 1/3] KVM: selftests: arm64: Report set_id_reg reads of
 test registers as tests
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-kvm-arm64-set-id-regs-aarch64-v10-1-d5a6aba69d19@kernel.org>
References: <20261105-kvm-arm64-set-id-regs-aarch64-v10-0-d5a6aba69d19@kernel.org>
In-Reply-To: <20261105-kvm-arm64-set-id-regs-aarch64-v10-0-d5a6aba69d19@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Oliver Upton <oupton@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
 Sebastian Ott <sebott@redhat.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5737; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hAmt2QTBd6TcJcaAcp6zUczcT8F3PROgm10FL3FF92M=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeFNu/N1cWC/M74L92we/c2iqT5mbd0r+zrUqXWpTKn
 vGR2Lu6o5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABPJm8bwPyO7Niyu+s2Mdaa/
 A9eWrbm4rODznYP+Jy68r1e+8vZzzmZGhoOq8tydXHE/Jv3dcDGYZ32fsyiT4zLG2zt8rVqeV1Y
 UsQAA
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
Reviewed-by: Sebastian Ott <sebott@redhat.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 83 +++++++++++++++++++------
 1 file changed, 64 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 1d2cc25cb3f4..ef833ab3e6ce 100644
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
 
@@ -684,11 +719,21 @@ static void test_guest_reg_read(struct kvm_vcpu *vcpu)
 			REPORT_GUEST_ASSERT(uc);
 			break;
 		case UCALL_SYNC:
-			val = test_reg_vals[encoding_to_range_idx(uc.args[2])];
-			val = reset_mutable_bits(uc.args[2], val);
+			reg_id = uc.args[2];
+
+			expected_val = test_reg_vals[encoding_to_range_idx(reg_id)];
+			expected_val = reset_mutable_bits(reg_id, expected_val);
 
 			/* Make sure the written values are seen by guest */
-			TEST_ASSERT_EQ(val, reset_mutable_bits(uc.args[2], uc.args[3]));
+			guest_val = reset_mutable_bits(reg_id, uc.args[3]);
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
@@ -941,7 +986,7 @@ int main(void)
 
 	ksft_print_header();
 
-	test_cnt = 4 + MPAM_IDREG_TEST + MTE_IDREG_TEST;
+	test_cnt = 4 + MPAM_IDREG_TEST + MTE_IDREG_TEST + GUEST_READ_TEST;
 	for (i = 0; i < ARRAY_SIZE(test_regs); i++)
 		for (j = 0; test_regs[i].ftr_bits[j].type != FTR_END; j++)
 			test_cnt++;

-- 
2.47.3


