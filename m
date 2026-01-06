Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A479BCE9D7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 16:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LhblIIF8I9dD3XDEx0D9hlQ3+iUAGtvZuYReRjb1gpo=; b=bZkzI0RwKtPjP2fJO0Cy+dPOQt
	iiM6X/7fDWvnV+WS8MXtkGnYzbBDL2bTYKttcDLGK6LOjDwduzfpuXmGk4Z2U9lLDXu+MTiFnjqAn
	tJr3VdV69XphZrjsZmxyp8Ns2MP+05/nKtV9jkfeL4opRFpJaZI4zZF2iP3J/r79DGMHFKY7vULeD
	Q9aIPdiTBwrsX34SOK+PMXw7Rp2r8FCqojAuzghFJaSHFAe+bRjLqlspLVJWKIhkspq+BGUmfx3Xd
	buXZCqSIi2sVTAIIHmULpAXW64gZZK0+lHctyoPSlue9pLnqCH8Cwmq8AuMHX9RLOk0tkeYn0V76T
	Fa/0RMjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdA7N-0000000DVO8-33cu;
	Tue, 06 Jan 2026 16:41:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdA7L-0000000DVMk-03CK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 16:41:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 53D6144222;
	Tue,  6 Jan 2026 16:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2645C116C6;
	Tue,  6 Jan 2026 16:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767717670;
	bh=/9fO9HltczDK8z6tnrwTg+VY6XIFgeW+AlaaLIcWhnE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ngvY8V64PZc8rB8bDVqvmPoZxj4H8p048XGdCbQopKMg9mofeMuOJp+f25PiBGbVP
	 JVgdtiaJ06JyTYQMqN3H8ocSZF6S8kbplwRxvwajFZle/PJ8rlPxhZgSbiw2pwVI2j
	 /RcJ1btTK59hFttHwAjU0dudxdr3PofdNIDUvvlAg+eQfV2pNdh5GaccwNq+U2nMWC
	 dTmlpO6lyJp4rTL1L/q45ca+gEa6U+jyNfH8/GB3nwS7CgQSeENkPBtDzj/jYuEoM9
	 rLt5PTZF41q/3+31rBTZ+KYT6PXhbz3prw01gJqK0MPeSL+OyyMAuSG6wg7zttYewx
	 WL3C4kC1aS4XQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 06 Jan 2026 16:35:42 +0000
Subject: [PATCH v4 2/5] KVM: selftests: arm64: Report register reset tests
 individually
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-kvm-arm64-set-id-regs-aarch64-v4-2-c7ef4551afb3@kernel.org>
References: <20260106-kvm-arm64-set-id-regs-aarch64-v4-0-c7ef4551afb3@kernel.org>
In-Reply-To: <20260106-kvm-arm64-set-id-regs-aarch64-v4-0-c7ef4551afb3@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Oliver Upton <oupton@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2248; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/9fO9HltczDK8z6tnrwTg+VY6XIFgeW+AlaaLIcWhnE=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhsxYa6m3vbbzpCs6JrmKBwp9n3BNfkvWnwynZWZf9kws5
 v3GvjCjk9GYhYGRi0FWTJFl7bOMVenhElvnP5r/CmYQKxPIFAYuTgGYSMBd9r8yrz6EvpJ/dGzC
 JXGTzGtBghnzfjut4ouaIXo1/3W/7Wa5W1estnjUM8uqfYxtWSI7UaaqxuYid3T8tKtX4sQrbsp
 VWvcGr7zr2VeycPqGK11zJ3Mw/iiLr5fovsWQaXre0kVx75LP86vZ396p9TU/ftnc1E4vzM+I3Y
 CtdaZRe+7+m+lVpiX278X97pf/3MHc9U73+lwPvql71k0weckVaOfWk/bgVA1nwgmZ4syK998Ya
 j6sbvdu/SzAqnyH1a5+X4rQqh0Mf23y1OffnqfR+c5DStcsasu6b62aFXdM1Y50fc+7YMsvWpqW
 E6lh8vyb/QmH8HWSP2pvb6muefNWlWOWU/Dp2a736l3cAQ==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_084111_094773_10C51A29 
X-CRM114-Status: GOOD (  12.12  )
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


