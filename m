Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A97606A328
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4dcHzZh9;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wphqn7KM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2m+uq7MVnkIoFrhs7ntSWvQPgNiinhHqXi8jI9QVcsM=; b=4dcHzZh9/phmc+
	NOvhYZKjLaoLSn4K+TcMCNfvESSG7vl+3AwCuFYtUo2UnvYVytMD27Uy++O5w6+FrCHvNXkqaZzhK
	J2iScJdXSmtIVmUmPKuEVXLzB9MKNZaw/4Fz7xis3DbyaQ2Q90uIWcPUn6bJFHoN9gUb7K9JNUU32
	qMXXQMd4tSzP4rSpIYMmMyO0/o6Zq216u4Qu/tV7orSKlnE4UtCk2LGIDGrheUKCO9nCJ6kzVzYMR
	oYnnK1i3/nCg76IygfeOUdMG8G7WSPFc/o+u79d31/XfYPR4UJbiCNbpM7HpfSqNYiIlAehBbJkN7
	vsIpQS2JuIDamSV6GNSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ81-00000003PFA-0Sx6;
	Tue, 03 Nov 2026 18:21:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ80-00000003PES-0i3V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 18:21:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9CCF360A68;
	Tue,  3 Nov 2026 18:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64A21F00A1F;
	Tue,  3 Nov 2026 18:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793730059;
	bh=2m+uq7MVnkIoFrhs7ntSWvQPgNiinhHqXi8jI9QVcsM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Wphqn7KM2aepBbdu6GAoOlmiWHkO5KIB6AFAwlzHRi4mAkackCr3PdHLDrbISQ7+B
	 ekuhRO/zLrYwJTjxxinLJ5LAx8nZ969DrSiqL5uEEHikF+US9ZQY9fltPbGtYkPs76
	 lXff/S8iukhbpL0730HEp5FHEU7JG8EnYiLZNM6ncdJVp3prkzH6R26JFyMFKWebjE
	 OC0WDXbVMeoAawHj2gNjYRqGhOYByaqGuPHLFoLx7PzF63ksphnb2PAfq2QrJ7+bZt
	 mVIUs5SAEQaO6j0RgZCvxKtSXMW2KCj0R8UWefBoqcgYGaT9Oh3OeO3+t2wPTUg0Cx
	 qpXzad5cyeOsw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Nov 2026 18:19:23 +0000
Subject: [PATCH v9 3/3] KVM: selftests: arm64: Make set_id_regs bitfield
 validity checks non-fatal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-kvm-arm64-set-id-regs-aarch64-v9-3-ab32bc79fa9c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3918; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DR3JCmRl+vJjwzZoyBmX6kSjTvh5QD2/OBbm9i0ZJ1k=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeqf7b/vjYSQPlx+kztKuPaPqpbT4Q97Z+1oPUK6xTT
 i+5/vF2akcpC4MYF4OsmCJLXBb3y/qS12v4Di5sg5nDygQyhIGLUwAmEhHA8FfO8dss98cxd94J
 GR/6uliEk0NIq1YnTH7H71WV2i4G4Q8YGbZe2/3sXFTT+7N8f7/wh/etYDnjuPIr44+zaTX5s28
 mlzICAA==
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

Currently when set_id_regs encounters a problem checking validation of
writes to feature registers it uses an immediately fatal assert to report
the problem. This is not idiomatic for kselftest, and it is also not great
for usability. The affected bitfield is not clearly reported and further
tests do not have their results reported.

Switch to using standard kselftest result reporting for the asserts we
do, these are non-fatal asserts so allow the program to continue and the
test names include the affected field.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 31 ++++++++++++++++++-------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 37107eadd985..d7f8b8efe1e2 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -423,6 +423,7 @@ static u64 test_reg_set_success(struct kvm_vcpu *vcpu, u64 reg,
 	u8 shift = ftr_bits->shift;
 	u64 mask = ftr_bits->mask;
 	u64 val, new_val, ftr;
+	bool match;
 
 	val = vcpu_get_reg(vcpu, reg);
 	ftr = (val & mask) >> shift;
@@ -435,7 +436,10 @@ static u64 test_reg_set_success(struct kvm_vcpu *vcpu, u64 reg,
 
 	vcpu_set_reg(vcpu, reg, val);
 	new_val = vcpu_get_reg(vcpu, reg);
-	TEST_ASSERT_EQ(new_val, val);
+	match = new_val == val;
+	if (!match)
+		ksft_print_msg("%lx != %lx\n", new_val, val);
+	ksft_test_result(match, "%s valid write succeeded\n", ftr_bits->name);
 
 	return new_val;
 }
@@ -447,6 +451,7 @@ static void test_reg_set_fail(struct kvm_vcpu *vcpu, u64 reg,
 	u64 mask = ftr_bits->mask;
 	u64 val, old_val, ftr;
 	int r;
+	bool match;
 
 	val = vcpu_get_reg(vcpu, reg);
 	ftr = (val & mask) >> shift;
@@ -459,11 +464,19 @@ static void test_reg_set_fail(struct kvm_vcpu *vcpu, u64 reg,
 	val |= ftr;
 
 	r = __vcpu_set_reg(vcpu, reg, val);
-	TEST_ASSERT(r < 0 && errno == EINVAL,
-		    "Unexpected KVM_SET_ONE_REG error: r=%d, errno=%d", r, errno);
+	if (r >= 0 || errno != EINVAL) {
+		ksft_print_msg("Unexpected KVM_SET_ONE_REG error: r=%d, errno=%d (%s)\n",
+			       r, errno, strerror(errno));
+		ksft_test_result_fail("%s invalid write rejected\n",
+				      ftr_bits->name);
+		return;
+	}
 
 	val = vcpu_get_reg(vcpu, reg);
-	TEST_ASSERT_EQ(val, old_val);
+	match = val == old_val;
+	if (!match)
+		ksft_print_msg("%lx != %lx\n", val, old_val);
+	ksft_test_result(match, "%s invalid write rejected\n", ftr_bits->name);
 }
 
 static u64 test_reg_vals[KVM_ARM_FEATURE_ID_RANGE_SIZE];
@@ -503,7 +516,11 @@ static void test_vm_ftr_id_regs(struct kvm_vcpu *vcpu, bool aarch64_only)
 		for (int j = 0;  ftr_bits[j].type != FTR_END; j++) {
 			/* Skip aarch32 reg on aarch64 only system, since they are RAZ/WI. */
 			if (aarch64_only && sys_reg_CRm(reg_id) < 4) {
-				ksft_test_result_skip("%s on AARCH64 only system\n",
+				ksft_print_msg("%s on AARCH64 only system\n",
+					       ftr_bits[j].name);
+				ksft_test_result_skip("%s invalid write rejected\n",
+						      ftr_bits[j].name);
+				ksft_test_result_skip("%s valid write succeeded\n",
 						      ftr_bits[j].name);
 				continue;
 			}
@@ -515,8 +532,6 @@ static void test_vm_ftr_id_regs(struct kvm_vcpu *vcpu, bool aarch64_only)
 
 			test_reg_vals[idx] = test_reg_set_success(vcpu, reg,
 								  &ftr_bits[j]);
-
-			ksft_test_result_pass("%s\n", ftr_bits[j].name);
 		}
 	}
 }
@@ -995,7 +1010,7 @@ int main(void)
 		ID_REG_RESET_UNCHANGED_TEST;
 	for (i = 0; i < ARRAY_SIZE(test_regs); i++)
 		for (j = 0; test_regs[i].ftr_bits[j].type != FTR_END; j++)
-			test_cnt++;
+			test_cnt += 2;
 
 	ksft_set_plan(test_cnt);
 

-- 
2.47.3


