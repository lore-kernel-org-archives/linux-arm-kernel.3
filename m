Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8D9606D817
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ssCaBkRq;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mk9KQ5XO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CPXc0O7MKcjSrwtn6DF7S5L9f42l8jD3XdoUxmsVzys=; b=ssCaBkRqADavoy
	+a5Zf3UkcPtyTqqvoIYEwNg/puxbf889+EaNHHXwkhMEs4lSBig4mEEx8nt6PTHHCNdY7Urcaorm8
	sd0d0tifbTe2NmnclKKYyPZ+8EsUqMGry76LeumO4fWQgpVGd4F1IFsjFgcfvjAJP1ojNbhI5cmFY
	kyZkvkqIsFygCoyblYBzRKB02fBo3Uwbp6PPppip5h1pVW+ZB2XC7MRF7MoiZMaiyTLXzBwx72HjB
	79snLnSmws6306tUoIV7DJteS5OvtBQMzOAFh8MUYvmfs0WQAAOG2iD3OgqGWIvL+9ehAaxVSRIxV
	E0XT3+9x2FtLVOMwsyYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ7z-00000003PDt-03CW;
	Tue, 03 Nov 2026 18:20:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ7w-00000003PCx-3cOa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 18:20:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C1824380F;
	Tue,  3 Nov 2026 18:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000E71F00A1D;
	Tue,  3 Nov 2026 18:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793730056;
	bh=CPXc0O7MKcjSrwtn6DF7S5L9f42l8jD3XdoUxmsVzys=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mk9KQ5XOQnfQGcYANyqz4cYvRavaP5wjATSQoyUh0VUTh6j6Yb24flZdf/DcRyh3S
	 VufQJfUJsU8fPBglU4ck6NLkFHetD5bL7KqUqxGlWsQiIgpVUN9Odkvu4tJLRyhCTy
	 1fEbqyEhZdj9L0+ZQbj3rOtx4ong7/XRneCCw7Z6UT6jyb8rbMhxKtebf62fpfCjZA
	 Xi5mlwiLS8DkzdjTSJXSSuC3fYaBXqFEEnr3UKtnjL9rhs40pILFZXZUrlWP20zHVx
	 RRH8JIP1U0omxsKEc6NySr3b7VzJXstT+S4uGd5nkANJrIa9cBdZvVui2teBqeIbsr
	 nOyFGoKcFtoVg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Nov 2026 18:19:22 +0000
Subject: [PATCH v9 2/3] KVM: selftests: arm64: Report register reset tests
 individually
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-kvm-arm64-set-id-regs-aarch64-v9-2-ab32bc79fa9c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2558; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JfGzRjUuJXbYAXGFKmvMsIMx4V5AP4Sez6FLWFTsalI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeqf577MX1kGOfpc+laVd6vxj0VzQ+3H98fd1mKyO+9
 fb5s5c5dZSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAi898y/M9gYZzZlLy3vtJ4
 hZFl8N1vsWwZh7JfL13xdErJ4mXzT25m+F+26M3zy3MTU1WkDe1OLi1Y+aZZfRfXgruNs4V+bvP
 JEWMDAA==
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

set_id_regs tests that registers have their values preserved over reset.
Currently it reports all registers in a single test with an instantly fatal
assert which isn't great for diagnostics, it's hard to tell which register
failed or if it's just one register. Change this to report each register as
a separate test so that it's clear from the program output which registers
have problems.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 0e6fd7b57e52..37107eadd985 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -820,13 +820,21 @@ static void test_vcpu_non_ftr_id_regs(struct kvm_vcpu *vcpu)
 static void test_assert_id_reg_unchanged(struct kvm_vcpu *vcpu, u32 encoding)
 {
 	size_t idx = encoding_to_range_idx(encoding);
-	u64 observed;
+	u64 observed, expected;
+	bool pass;
 
 	observed = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(encoding));
-	TEST_ASSERT_EQ(reset_mutable_bits(encoding, test_reg_vals[idx]),
-		       reset_mutable_bits(encoding, observed));
+	observed = reset_mutable_bits(encoding, observed);
+	expected = reset_mutable_bits(encoding, test_reg_vals[idx]);
+	pass = expected == observed;
+	if (!pass)
+		ksft_print_msg("%lx != %lx\n", expected, observed);
+	ksft_test_result(pass, "%s unchanged by reset\n",
+			 get_reg_name(encoding));
 }
 
+#define ID_REG_RESET_UNCHANGED_TEST (ARRAY_SIZE(test_regs) + NUM_EXTRA_REGS)
+
 static void test_reset_preserves_id_regs(struct kvm_vcpu *vcpu)
 {
 	/*
@@ -844,8 +852,6 @@ static void test_reset_preserves_id_regs(struct kvm_vcpu *vcpu)
 	test_assert_id_reg_unchanged(vcpu, SYS_MIDR_EL1);
 	test_assert_id_reg_unchanged(vcpu, SYS_REVIDR_EL1);
 	test_assert_id_reg_unchanged(vcpu, SYS_AIDR_EL1);
-
-	ksft_test_result_pass("%s\n", __func__);
 }
 
 /*
@@ -985,7 +991,8 @@ int main(void)
 
 	ksft_print_header();
 
-	test_cnt = 4 + MPAM_IDREG_TEST + MTE_IDREG_TEST + GUEST_READ_TEST;
+	test_cnt = 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST + GUEST_READ_TEST +
+		ID_REG_RESET_UNCHANGED_TEST;
 	for (i = 0; i < ARRAY_SIZE(test_regs); i++)
 		for (j = 0; test_regs[i].ftr_bits[j].type != FTR_END; j++)
 			test_cnt++;

-- 
2.47.3


