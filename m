Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD567FD707A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 20:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jgYOwp8u+MLTrrZTzpzG0nGZV+mALXi61AnCc7omDWI=; b=2myktJ7aYIhV5Fz01lzEpyPyEB
	SfaCnDr/HyjZIVQHsMPn/7w8glH1QmIBVoGTF2J/GaSNBuk5sVaG8LoTnU+WoSH8awk31yC/zzyPy
	pymDpMPqxVtgUkMHoMs3Y0WescwvDXh/lRffFD/jNT2jULlVNZrqSiysjDtv4KYhUwGsgvX5PDXvX
	XBn0goXIOGw0/oIHZPfzbtEM+uNgU3SK6vzY7RqjSRsgYMRdJJiM5a6ffQRvopjGdm3dEQKvgld0j
	w1p8WKCtuh1qcCal83m2fn2V5UiU1UBCNG5ocf/QzPTSLbh0aL2h5Bu9P8bIInVmSItTLWkuE4xNI
	6oGUrAAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2akl-00000007Aao-34Zi;
	Tue, 17 Mar 2026 20:10:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2akg-00000007AZL-1bL9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 20:10:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC75461119;
	Tue, 17 Mar 2026 20:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF32DC4CEF7;
	Tue, 17 Mar 2026 20:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773778253;
	bh=kFeKoFDmekxxcafvujeqVbvYB0xH3vg3F9QRQrkEoOE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vEC5qbo6U6FpH2KAtG9ztjEoqKsccUXFiwJQ5ufPj6QHIsvmD0Aw0f/31CIH2stGd
	 VjgtaqM5HiAb3SZBTZlbuI85y1QdVIST6+Shv73n1owHIQSYSbmvNAoQgY9LMAj8Gt
	 /WtwCHuSEjcWuN7dkk7eVnd4GF8t6dIumVOlcoy57eezyFVgu6thVv5QUEB0GpOQAf
	 BFnVWL0ZFF0UKnEFh2zaODre/F2C48aBKiZqJZgwiCzw/fhWevZKGTc/ppCgn6ziH/
	 ed/moA+4ztWJke3fBaS7ATs9OfjB9dsIy71NYwguzGvHMj5Bf8451MCJ+/0NoswSZx
	 nsRP8JQbjsCTg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 17 Mar 2026 20:10:35 +0000
Subject: [PATCH v5 2/5] KVM: selftests: arm64: Report register reset tests
 individually
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-kvm-arm64-set-id-regs-aarch64-v5-2-a60f2b956e22@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2248; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kFeKoFDmekxxcafvujeqVbvYB0xH3vg3F9QRQrkEoOE=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGm5tUGgGcVX2IzCqGQdpFqqfPs4PTc8/c20iS58WDLQyFAC4
 IkBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJpubVBAAoJECTWi3JdVIfQJvYIAIKM
 Gwp4XdxPZ7J5pq7cW6MgthHq/HwyKfkJgBu/c6vGZVADnsf40qXyX1qM4httVOeCLZOTZppMQ8r
 PqrXWvttHaAdizNUlJR7HDQn0CSJkHvs2bYNPsdWjl1uW7/LPxlOhmxepTZX7b52qW5XUaPTxET
 Nmri8Ng8IoLtNMLYQhz1YjQ63gTs3uE7dYWsg3mvAYTmvMLcN91zW1LuVGFMdQoo0Q7+WOG6566
 RVayZ8XtOgEZaCIJTO/nMVH/5RI8cgPTKu2Kqoq4gsvC5VFCYNLyXFTuwkTF4E0q122NSVmE3BK
 yfIC/EniKBF4nssSHEpOmdX0c1Mv8ZkIpmuNnPs=
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

set_id_regs tests that registers have their values preserved over reset.
Currently it reports all registers in a single test with an instantly fatal
assert which isn't great for diagnostics, it's hard to tell which register
failed or if it's just one register. Change this to report each register as
a separate test so that it's clear from the program output which registers
have problems.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 75f23371d97d..1072ee125b05 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -778,11 +778,18 @@ static void test_assert_id_reg_unchanged(struct kvm_vcpu *vcpu, uint32_t encodin
 {
 	size_t idx = encoding_to_range_idx(encoding);
 	uint64_t observed;
+	bool pass;
 
 	observed = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(encoding));
-	TEST_ASSERT_EQ(test_reg_vals[idx], observed);
+	pass = test_reg_vals[idx] == observed;
+	if (!pass)
+		ksft_print_msg("%lx != %lx\n", test_reg_vals[idx], observed);
+	ksft_test_result(pass, "%s unchanged by reset\n",
+			 get_reg_name(encoding));
 }
 
+#define ID_REG_RESET_UNCHANGED_TEST (ARRAY_SIZE(test_regs) + 6)
+
 static void test_reset_preserves_id_regs(struct kvm_vcpu *vcpu)
 {
 	/*
@@ -800,8 +807,6 @@ static void test_reset_preserves_id_regs(struct kvm_vcpu *vcpu)
 	test_assert_id_reg_unchanged(vcpu, SYS_MIDR_EL1);
 	test_assert_id_reg_unchanged(vcpu, SYS_REVIDR_EL1);
 	test_assert_id_reg_unchanged(vcpu, SYS_AIDR_EL1);
-
-	ksft_test_result_pass("%s\n", __func__);
 }
 
 int main(void)
@@ -829,7 +834,8 @@ int main(void)
 
 	ksft_print_header();
 
-	test_cnt = 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST + GUEST_READ_TEST;
+	test_cnt = 2 + MPAM_IDREG_TEST + MTE_IDREG_TEST + GUEST_READ_TEST +
+		ID_REG_RESET_UNCHANGED_TEST;
 	for (i = 0; i < ARRAY_SIZE(test_regs); i++)
 		for (j = 0; test_regs[i].ftr_bits[j].type != FTR_END; j++)
 			test_cnt++;

-- 
2.47.3


