Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7E2606EE80
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yyg13crI;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mA8OGImI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EjHHerbQtH8PkJVTm5A4n/paGtt5ATnY9+Koe88/4LE=; b=yyg13crIFkuVQs
	qos0f/31744sF4y3DdEL6BFzobpv12qDT3rCRPr7I1RSETNhRnFgIvPvk0Z+nj5Qp21g2AUxmDNzU
	pI1X/FpPohBYN/NLPnE8Sc1/9SJ6tL6TCZasA1SwszaKRu29+skK+EkPNZtaVfEw/NZHM7AFe0rGB
	K7jWDbqJl0SSx319UXX2GiXjun9kswYZiuwp3iGlM48A9wve6cX7LKbVJs89aaBU0yElHYO8N/vo/
	A3z6dQO756QZGrI2rIl0aSwL/z6fleL82LYD5oDJfNJjUJAL1+UbqxriTflqS1in/llwuj7IAHqPH
	XaBK6s8LwwB9JO4VcusA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwN7-00000008sMp-28Pb;
	Thu, 05 Nov 2026 12:15:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwN3-00000008sJS-3BzK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:15:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3768160F1C;
	Thu,  5 Nov 2026 12:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0E11F00A02;
	Thu,  5 Nov 2026 12:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793880908;
	bh=EjHHerbQtH8PkJVTm5A4n/paGtt5ATnY9+Koe88/4LE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mA8OGImIAM2oSGIP6F5xMkpDWUGpMztlncn928slbRyyhHGiBi/3BaNJRuXq1Y/Cb
	 +GEX6MG5wvXI8aWsGMw4fevZeZdXBTz8CZUp894GolHb3rHvMRsVDmy+JJkMGuWgtW
	 v9/LchHxd26rFXUQ5+O8apewCW34AGL2TqroGTZDw0tz0KNGJUKyUAuede4TIaGCGV
	 E7Q2sWoRDtDSDNPcacMmJegj8QcxOvzkMd+7akCRkYbkeA+IhKX1Llkmy8GLVEQPkM
	 O/riGsnRp3QtG9sc2QGQcYq4GlDGaZYiUZUVzZsoJL5eSu2Nyr2N8lT3G+0witrb1L
	 4XlwTsCh0xUjQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 11:47:21 +0000
Subject: [PATCH v10 3/3] KVM: selftests: arm64: Make set_id_regs bitfield
 validity checks non-fatal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-kvm-arm64-set-id-regs-aarch64-v10-3-d5a6aba69d19@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4751; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sCUDXK5zt6Sullbao2LmXhfh5JZy+wCGZCip8JVi8Mo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeFNv3bWz8fi7ymNTlDDbb398jIkX+MRu+WKO++IRtw
 obI3z5hHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjIdCmGP9x98gumb0799vhh
 v8CKitCpDMuT0szuqHd8fvhRIIPFfhMjw4GZbDNzTgqIftv2q1ieO37lqa8LbuxczDSdX8zFLum
 5OwsA
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
Reviewed-by: Sebastian Ott <sebott@redhat.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 52 +++++++++++++++++--------
 1 file changed, 35 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 69aebb3a28f4..8c484db65484 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -417,12 +417,14 @@ u64 get_invalid_value(const struct reg_ftr_bits *ftr_bits, u64 ftr)
 	return ftr;
 }
 
-static u64 test_reg_set_success(struct kvm_vcpu *vcpu, u64 reg,
-				const struct reg_ftr_bits *ftr_bits)
+static void test_reg_set_success(struct kvm_vcpu *vcpu, u64 reg,
+				 const struct reg_ftr_bits *ftr_bits)
 {
 	u8 shift = ftr_bits->shift;
 	u64 mask = ftr_bits->mask;
 	u64 val, new_val, ftr;
+	bool pass;
+	int ret;
 
 	val = vcpu_get_reg(vcpu, reg);
 	ftr = (val & mask) >> shift;
@@ -433,11 +435,17 @@ static u64 test_reg_set_success(struct kvm_vcpu *vcpu, u64 reg,
 	val &= ~mask;
 	val |= ftr;
 
-	vcpu_set_reg(vcpu, reg, val);
-	new_val = vcpu_get_reg(vcpu, reg);
-	TEST_ASSERT_EQ(new_val, val);
-
-	return new_val;
+	ret = __vcpu_set_reg(vcpu, reg, val);
+	if (ret == 0) {
+		new_val = vcpu_get_reg(vcpu, reg);
+		pass = new_val == val;
+		if (!pass)
+			ksft_print_msg("%lx != %lx\n", new_val, val);
+	} else {
+		ksft_print_msg("Write of 0x%lx failed: %d\n", val, ret);
+		pass = false;
+	}
+	ksft_test_result(pass, "%s valid write succeeded\n", ftr_bits->name);
 }
 
 static void test_reg_set_fail(struct kvm_vcpu *vcpu, u64 reg,
@@ -447,6 +455,7 @@ static void test_reg_set_fail(struct kvm_vcpu *vcpu, u64 reg,
 	u64 mask = ftr_bits->mask;
 	u64 val, old_val, ftr;
 	int r;
+	bool match;
 
 	val = vcpu_get_reg(vcpu, reg);
 	ftr = (val & mask) >> shift;
@@ -459,11 +468,19 @@ static void test_reg_set_fail(struct kvm_vcpu *vcpu, u64 reg,
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
@@ -503,7 +520,11 @@ static void test_vm_ftr_id_regs(struct kvm_vcpu *vcpu, bool aarch64_only)
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
@@ -512,11 +533,8 @@ static void test_vm_ftr_id_regs(struct kvm_vcpu *vcpu, bool aarch64_only)
 			TEST_ASSERT_EQ(masks[idx] & ftr_bits[j].mask, ftr_bits[j].mask);
 
 			test_reg_set_fail(vcpu, reg, &ftr_bits[j]);
-
-			test_reg_vals[idx] = test_reg_set_success(vcpu, reg,
-								  &ftr_bits[j]);
-
-			ksft_test_result_pass("%s\n", ftr_bits[j].name);
+			test_reg_set_success(vcpu, reg, &ftr_bits[j]);
+			test_reg_vals[idx] = vcpu_get_reg(vcpu, reg);
 		}
 	}
 }
@@ -996,7 +1014,7 @@ int main(void)
 		ID_REG_RESET_UNCHANGED_TEST;
 	for (i = 0; i < ARRAY_SIZE(test_regs); i++)
 		for (j = 0; test_regs[i].ftr_bits[j].type != FTR_END; j++)
-			test_cnt++;
+			test_cnt += 2;
 
 	ksft_set_plan(test_cnt);
 

-- 
2.47.3


