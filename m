Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0766ACA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gOlWHS6ikwSKYf94v3vlKtk1UYBKQveZlSG528OIL8=; b=a6QB+JumoKm2NWx+czS4cfAw06
	YrKOiruUCm5ziPmfZqcGUzjrHAuqx8kfiUbwmWVju0CK/vIWS+TDcPnKSe9wO5D//iSzVIoESSUJA
	VoKDJF+rNDbxNbxSL+bHayvfjUZw/ZjXiE+vEH6Nwpk+FysnwJSuidUaKayJEX+pG0KGyTyQvxKhQ
	FmbuWNHOTWzSgyZjyr2pg3/TQW0I98+fP9yTAZxKn8LZv41HHrcNJGoKH1x3RFX4UiVnALCUqsIM4
	mF6EGiBVDsYFm2iU7FKj6SG2UhK5fOFPicjQvs2i2s7O2kV+0HarnHtxXISDLGtfda3aDYqFx5xVX
	NagwUolQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaeQ-000000042UN-0CYB;
	Tue, 29 Sep 2026 16:25:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaeK-000000042T4-3vII
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 16:25:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B00654479A;
	Tue, 29 Sep 2026 16:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080AC1F000FF;
	Tue, 29 Sep 2026 16:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790699148;
	bh=1gOlWHS6ikwSKYf94v3vlKtk1UYBKQveZlSG528OIL8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=B0JjsD4wh10Ep8YqzUiJCkmVed1/oDEt1LJJD572sxxSre21nw0528iPF+5/A17tc
	 54C1UfrSafZtbfzKXM6HXfk75d43p9yW0fwWTqojyLvk7a4AVdB8UMUsbC5IuSzQnj
	 TU1qxpz4wPIRLD+4v2pP+l/celUcILmz+mQQp3CqJ12yKY9c3uLVXv/MG0VDxx8owf
	 cHy1hAYLB5HyCQYLs2SbKzt24/fyj+FwZVrSnfL6XgVLI4tKvK+sWU6V465IQX/cwb
	 VMmrVEv2tP3HH5y9G4zW++ioiM65JsGF9NBETKQ0Vo7yoSJXeStbr9bYE3QeTexxom
	 Htk3MVeKpKNEg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 29 Sep 2026 17:16:53 +0100
Subject: [PATCH v8 2/3] KVM: selftests: arm64: Report register reset tests
 individually
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-kvm-arm64-set-id-regs-aarch64-v8-2-58aabe2c2fac@kernel.org>
References: <20260929-kvm-arm64-set-id-regs-aarch64-v8-0-58aabe2c2fac@kernel.org>
In-Reply-To: <20260929-kvm-arm64-set-id-regs-aarch64-v8-0-58aabe2c2fac@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Oliver Upton <oupton@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2570; i=broonie@kernel.org;
 h=from:subject:message-id; bh=issTURWk3fFjAsLpRQHWTMs63Mze57jNJY+Nej0WMA8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqu+aAvr351fq88Ry5PC/1skOaCwf9v+AC6MnHx
 DcdLEDvzieJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarvmgAAKCRAk1otyXVSH
 0DB4B/9bcNDvLKzhL0lsZEYUOUIDmG2k5cZzG+WIvA2PgnJHmApw8cR/y5HHOEgUu1ALEjGVhbP
 uElKy+6tg+gSYWV0XtKP8uc/3GKnJ9B6mqBYRHkpaUpp46cNpA6TBQsRp+ZgyPKYf2aBxXtPxBT
 iUem+v7kGmexi+D6oMfF5zNYACceMZSQ2kW6tBDLru1mLkJYPngBBKu7Wmd3aFvmfaoqiZ/BMWD
 I90NpVesq96lp3+ISfkQ53gkae1bPHIuwLG/cjxLvyj/MZaQlwn1iFFXvWjAqZd4hC+ZYulJiJt
 SLABbkycv5rRcCHlq4fT6X5tyen44aHC2Gd/Pjt/R27gyh5s
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
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
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


