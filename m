Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E964FEDA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 20:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lVianb5cWj7e5QkbhHl4Luz5+suZ0VLdCy1IUdMo5rI=; b=EpDKHm6ogxFEEh47U3aLGfYIv0
	s3NYx6el2dCR9IEr7x/d79ny1xSAfC92Jobk7Q8awxzfXn9sG+E5yu+UrClUzWNYCneV6GiIT37E2
	bx6CQBb5ipG//gK4dae0GzqZKLBphWdNqgEoaVIusyj2KFmbbC5B2qb1/QeUolTjii8BeyjRSVgsA
	dHVnjbbJ+Qp5uCYTNJ2TTppwze2glHl2XF992nM9jJG+9S7ALvYLkZbLGw1/pqTS5HvQS0mSOZXh3
	Qg0uwiQWheOb1/7qEv08F+EMnYI6Bj8YpGLMnjY/LKX61X09HwNM5hcAFT7W347C0Eu2zkSbdzhA3
	kOh7R2ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2akm-00000007Ab9-04nF;
	Tue, 17 Mar 2026 20:11:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2akj-00000007AZw-1n9E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 20:10:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 82D3360133;
	Tue, 17 Mar 2026 20:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3DBC19425;
	Tue, 17 Mar 2026 20:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773778256;
	bh=6dDHuW+3JnPVTu+x6wcXrghvQBtRlj+/DG5vIrcHhF0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r8zwYHlWLq50rhjhW4gRhHpvC6j9uoEMuetvW66QuY4uJhw+oQWzarWgow6TdIKkp
	 47q7DWk71OZbur8024d0l/r+XwDQj6nMqe4FF+DjT4eWJhA3qdj/591fVYADMNhoGZ
	 CXX0VriJnH8TS2JtmJ7afjQ9Td671HpV6TGxw0WZpPi/lQGOhLbCVhXVB3AiNhPYR1
	 cD2sFvGb+/vfWRAMG8ROkOlMa60WFFpMil116pMHUlx0PF8x5WU+vMfzX2S2VkUQAZ
	 0bFJp4/bQRiTOgb+0BlTgnz4mE+QgDcDexuSjTDm4ES41LeAFFQoTZWdgFwmjrTgKA
	 obcv1SlDudtjg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 17 Mar 2026 20:10:36 +0000
Subject: [PATCH v5 3/5] KVM: selftests: arm64: Make set_id_regs bitfield
 validatity checks non-fatal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-kvm-arm64-set-id-regs-aarch64-v5-3-a60f2b956e22@kernel.org>
References: <20260317-kvm-arm64-set-id-regs-aarch64-v5-0-a60f2b956e22@kernel.org>
In-Reply-To: <20260317-kvm-arm64-set-id-regs-aarch64-v5-0-a60f2b956e22@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Oliver Upton <oupton@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-e1b5b
X-Developer-Signature: v=1; a=openpgp-sha256; l=3569; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6dDHuW+3JnPVTu+x6wcXrghvQBtRlj+/DG5vIrcHhF0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpubVCSsYWqCVjfFXLy7wmXi50Yj6eGPMcyp20C
 ireXYfKlqeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabm1QgAKCRAk1otyXVSH
 0NrGB/0cfYW+8CKzBzLbLRFTdwiSb6WRYo46e0wJg5AslfCe5ynXSkB8QYazMrCWwf8+iCY8N6x
 BGd56olXlpcaOV1JPaw+rV8qU3G+tueMAtQ/tVyeEuBy4aobYh+3lD4zWOXlx13tED4hAly7qZh
 M5H7e5r8hnNZlCqA6VwmbqBZvBNOEjXF9m9QA/UTnG1QJ9S69D4F+xAXqM9RdSaiAqKW0Y+tYkP
 aIksmpENsuUO2Mo9+tXOHvYqlGbRtC3ucGauYZqIeDX8IyqGBJ40uQqU+Zrrn7FVbwURZad2mKN
 nS4+IdzIqws37C0NOfgWv0gqMg35DxYSSeSj0jJOBp40HPv4
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

Currently when set_id_regs encounters a problem checking validation of
writes to feature registers it uses an immediately fatal assert to report
the problem. This is not idiomatic for kselftest, and it is also not great
for usability. The affected bitfield is not clearly reported and further
tests do not have their results reported.

Switch to using standard kselftest result reporting for the two asserts
we do, these are non-fatal asserts so allow the program to continue and the
test names include the affected field.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 1072ee125b05..60e7f0c1bc26 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -408,6 +408,7 @@ static uint64_t test_reg_set_success(struct kvm_vcpu *vcpu, uint64_t reg,
 	uint8_t shift = ftr_bits->shift;
 	uint64_t mask = ftr_bits->mask;
 	uint64_t val, new_val, ftr;
+	bool match;
 
 	val = vcpu_get_reg(vcpu, reg);
 	ftr = (val & mask) >> shift;
@@ -420,7 +421,10 @@ static uint64_t test_reg_set_success(struct kvm_vcpu *vcpu, uint64_t reg,
 
 	vcpu_set_reg(vcpu, reg, val);
 	new_val = vcpu_get_reg(vcpu, reg);
-	TEST_ASSERT_EQ(new_val, val);
+	match = new_val == val;
+	if (!match)
+		ksft_print_msg("%lx != %lx\n", new_val, val);
+	ksft_test_result(match, "%s valid write succeeded\n", ftr_bits->name);
 
 	return new_val;
 }
@@ -432,6 +436,7 @@ static void test_reg_set_fail(struct kvm_vcpu *vcpu, uint64_t reg,
 	uint64_t mask = ftr_bits->mask;
 	uint64_t val, old_val, ftr;
 	int r;
+	bool match;
 
 	val = vcpu_get_reg(vcpu, reg);
 	ftr = (val & mask) >> shift;
@@ -448,7 +453,10 @@ static void test_reg_set_fail(struct kvm_vcpu *vcpu, uint64_t reg,
 		    "Unexpected KVM_SET_ONE_REG error: r=%d, errno=%d", r, errno);
 
 	val = vcpu_get_reg(vcpu, reg);
-	TEST_ASSERT_EQ(val, old_val);
+	match = val == old_val;
+	if (!match)
+		ksft_print_msg("%lx != %lx\n", val, old_val);
+	ksft_test_result(match, "%s invalid write rejected\n", ftr_bits->name);
 }
 
 static uint64_t test_reg_vals[KVM_ARM_FEATURE_ID_RANGE_SIZE];
@@ -488,7 +496,11 @@ static void test_vm_ftr_id_regs(struct kvm_vcpu *vcpu, bool aarch64_only)
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
@@ -500,8 +512,6 @@ static void test_vm_ftr_id_regs(struct kvm_vcpu *vcpu, bool aarch64_only)
 
 			test_reg_vals[idx] = test_reg_set_success(vcpu, reg,
 								  &ftr_bits[j]);
-
-			ksft_test_result_pass("%s\n", ftr_bits[j].name);
 		}
 	}
 }
@@ -838,7 +848,7 @@ int main(void)
 		ID_REG_RESET_UNCHANGED_TEST;
 	for (i = 0; i < ARRAY_SIZE(test_regs); i++)
 		for (j = 0; test_regs[i].ftr_bits[j].type != FTR_END; j++)
-			test_cnt++;
+			test_cnt += 2;
 
 	ksft_set_plan(test_cnt);
 

-- 
2.47.3


