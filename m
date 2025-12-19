Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08541D78770
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 19:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xtixo828wFh0kQNwbG25qkQ1l5GW+HSsnLoGdja0ihs=; b=ZSP8jm0p0wfcQDLJ7TPOCUcQe0
	vXcTwW5BDufV8heyEow/hAch9bx07DHLSIJgk5EGQTDdidPzVWn7RGoVwYbiaYM4oFSLqXzMdTGoC
	OnGoNKii6Q5b7fqIRh2HIfDoTIJgcZGYEseiKdPi5h/XThdeanmpVdjKmlPwqNB8p+OHWrZJHk2aU
	Vru8yMLzqj+tapL6KVnnKcXhOcou/XDEdExYrGAiUDZWAv5DdaEPIWgNj1l7q1mcFbq1fZOyMGwwL
	Gk2CuttENVnCAB8cFXqfIhCo2ksAey4DonjyocqTC1LMlrkqlJrhDOmUZK7Yx5hDgnShJoMlEdD8b
	zLy1/sbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWg9s-0000000Aszs-2ECr;
	Fri, 19 Dec 2025 19:29:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWg9p-0000000AsyQ-1w9M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 19:28:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D5B260125;
	Fri, 19 Dec 2025 19:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01AD4C4CEF1;
	Fri, 19 Dec 2025 19:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766172536;
	bh=SdYdUswJJiZaW0PkSaAFAoCdE/2lYRbBCPt0U91wSxc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nRS+LcaYKl/DMoBzXvuyOtROXvyzMXADsK6tPR1ihh0inlbly03MOGmPAxryDND5u
	 WIPuI5ER2sMzDFk+mdDuAkZ9jym+DxdyS4mgz+CEOARNGAgHqiMIgxVl99AXmpHr1g
	 O7btdXtKsB81g5n38iu6xKleTVB4MynnykbmdBhADd/474I+XWTr1DQleYpvL7vfEZ
	 WnqgMzgSWKrCjhHLsjRJhys/w6O81JX3sXYhZCe+pl/OUqN3xuflsIfQ2iIZneaKps
	 L3NXKUAyciHrtoU+Yi88uyej4+98LK/sMFea40E5p0XUH8yTJ5h5r5syxTBv+WTfX+
	 bbJzIL2khMf9w==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 19 Dec 2025 19:28:08 +0000
Subject: [PATCH v3 2/4] KVM: selftests: arm64: Report register reset tests
 individually
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-kvm-arm64-set-id-regs-aarch64-v3-2-bfa474ec3218@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2202; i=broonie@kernel.org;
 h=from:subject:message-id; bh=SdYdUswJJiZaW0PkSaAFAoCdE/2lYRbBCPt0U91wSxc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpRaduyXOPQ7ybAubYxY5U6OC4+AhX+gS6mGJas
 FH+FffP8s2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaUWnbgAKCRAk1otyXVSH
 0MCHB/9Qlhp2TdS0PikTLxu+Wv7EjxCICvVDUjybZ889JVmaaYKh1rQkTc696oeHE9Q4rESyyKk
 0agfINuguF0+oLxSxfEjbjwNGPotuosJLXWv6o7paIXtkuXTWHsAnHM4IcKW19FmCQz1AKIXrLy
 o64vKFk3kUvDaL4EvSB8OPmje/jvtqeZsXV8+WZ7Ka1BCFsnCVyMUjsuPUo8OAzfu2icqa2saLZ
 11UUJ4hHbWJAzniuL4yIat5ZaefYZSqErypFaSsjewSMmit5t16MwfHmyoM7ObzZK4PK1ks3Yeu
 LukLDeBzk/fijANyoqfhLTjsRwQ1Pl30UO51NiDPjPUPOEYR
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

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 84e9484a4899..b61942895808 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -779,11 +779,18 @@ static void test_assert_id_reg_unchanged(struct kvm_vcpu *vcpu, uint32_t encodin
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
@@ -801,8 +808,6 @@ static void test_reset_preserves_id_regs(struct kvm_vcpu *vcpu)
 	test_assert_id_reg_unchanged(vcpu, SYS_MIDR_EL1);
 	test_assert_id_reg_unchanged(vcpu, SYS_REVIDR_EL1);
 	test_assert_id_reg_unchanged(vcpu, SYS_AIDR_EL1);
-
-	ksft_test_result_pass("%s\n", __func__);
 }
 
 int main(void)
@@ -830,7 +835,8 @@ int main(void)
 
 	ksft_print_header();
 
-	test_cnt = 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST + GUEST_READ_TEST;
+	test_cnt = 2 + MPAM_IDREG_TEST + MTE_IDREG_TEST + GUEST_READ_TEST +
+		ID_REG_RESET_UNCHANGED_TEST;
 	for (i = 0; i < ARRAY_SIZE(test_regs); i++)
 		for (j = 0; test_regs[i].ftr_bits[j].type != FTR_END; j++)
 			test_cnt++;

-- 
2.47.3


