Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA84BC44512
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 19:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vfSs3xN+iG2ar+D4KsRWb6ogp8LrkeeccY8yQZbssA=; b=gRMQ4fZGCg8EthKmWhVQOljO45
	/cTyx2aC4dXmBuWcN006kj9HAGqPCeX+cDc/dn7g81jlLAKZe3o3Xlrvr3wfSE87jWFz46hWSYGwa
	OHA5M4886wJFyeTsK3Aq/CZqWb7mg1Fvus66EDmr9YP/5wHatQPW9r6mw2ZZUfCTx35zJTfWzzUeN
	PhxsQntHxaLv2/RZ04R0dtfFJTkdTcGDb9Oo4pPgHBSsTtGB7hA9jGdpDISHbcJmxt0QELgCYw2Fs
	4Qvjm0MsboV2zG7HjCBOpi8a0YBnPcNwqEsFW14mi9cDvd3C2dZ+8E7y2IVPD0XDx3RZH8xk1CJDJ
	AAXEh+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlXB2-00000005Itn-2oEo;
	Sun, 19 Jul 2026 19:27:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlXAz-00000005Isx-0lUB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 19:27:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 496A6408CD;
	Sun, 19 Jul 2026 19:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E360A1F000E9;
	Sun, 19 Jul 2026 19:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784489268;
	bh=1vfSs3xN+iG2ar+D4KsRWb6ogp8LrkeeccY8yQZbssA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bgFOyh3TiTo8/28FIMnEDqPS1XToNuZhoOoul2+x34855j09a2WWFz/wZCLIn9v9r
	 WIb8HUDOPlIESu9Z+pEVbqnpYZmaizBPZF9hZmhtcACZvaw7aR9aagCbeA1LhO7Rdl
	 OF3vr7Bmfu7uelTjgxH11qer2/dwIiAmtyLPX+/RaN0HXG+pT5PmFqgPVqVfESYnOe
	 Tz7fwXCxZ5lry8t9IMHDkebaWnIKEmtC7f2mJvqsVKy8uubKD7CIcDObGl6oF9F2og
	 YiEWjAW+9uJ4Y/x1jAPt5ySTlZKX9C+QAZLkRCOWDUhrTkUQcx/35aJTGsjjd1Km7M
	 0rA9n+6jz902Q==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 19 Jul 2026 20:24:41 +0100
Subject: [PATCH v6 2/3] KVM: selftests: arm64: Report register reset tests
 individually
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-kvm-arm64-set-id-regs-aarch64-v6-2-724287f5f108@kernel.org>
References: <20260719-kvm-arm64-set-id-regs-aarch64-v6-0-724287f5f108@kernel.org>
In-Reply-To: <20260719-kvm-arm64-set-id-regs-aarch64-v6-0-724287f5f108@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Oliver Upton <oupton@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2517; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IJUCIxvw4excQxKCa7m51cgP09d2ulJBN4CshTpCm2I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqXSUqNPlopUVi10luMCHqIc0BWU7OoV+DV5/10
 +5CCEx3XM2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal0lKgAKCRAk1otyXVSH
 0CLCB/4sTJQIBl44wnRefXp4qppuX404jEjFkQCC2mwAFci6f/31YJd8feBHQH6pgbRbaq/Fb+M
 Tx8GfMJzo3gcNR/PJ3xBTafaVgK7KAbcMoZHwVpVX7ljTkF/xcBUBGDTYNxbWW/lXknzsC5MrAh
 teed0YTCD92jS73spYGDz/EDytpwDQD2FEcjSuotQaagZ5jKB5dtkBSFLGkiySFGDeGh1OI/V7O
 D4tTzmqyx+yzDrTIS708d7RKFMYHI/5h2Sey4g16jV7/v7m3GTH68RZbCtyR94XGtgcsEkZtdNt
 1v8BtfxPkhIhCXIZbJp4oJRFzULLe13xuLF4SSXTkvpePVu6
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
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index db6414a93ad3..3aa8886e8b70 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -819,13 +819,21 @@ static void test_vcpu_non_ftr_id_regs(struct kvm_vcpu *vcpu)
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
@@ -843,8 +851,6 @@ static void test_reset_preserves_id_regs(struct kvm_vcpu *vcpu)
 	test_assert_id_reg_unchanged(vcpu, SYS_MIDR_EL1);
 	test_assert_id_reg_unchanged(vcpu, SYS_REVIDR_EL1);
 	test_assert_id_reg_unchanged(vcpu, SYS_AIDR_EL1);
-
-	ksft_test_result_pass("%s\n", __func__);
 }
 
 int main(void)
@@ -872,7 +878,8 @@ int main(void)
 
 	ksft_print_header();
 
-	test_cnt = 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST + GUEST_READ_TEST;
+	test_cnt = 2 + MPAM_IDREG_TEST + MTE_IDREG_TEST + GUEST_READ_TEST +
+		ID_REG_RESET_UNCHANGED_TEST;
 	for (i = 0; i < ARRAY_SIZE(test_regs); i++)
 		for (j = 0; test_regs[i].ftr_bits[j].type != FTR_END; j++)
 			test_cnt++;

-- 
2.47.3


