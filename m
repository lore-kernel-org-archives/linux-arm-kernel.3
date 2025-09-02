Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E270ECA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 14:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xn6+Pu58bwK+nuCJdH9unZOQSMLAf8ekv9GEThxBk1U=; b=4J9D15Bcd/9R3OKKhR3dQ7LFSy
	HGMJZwjjs/59BgmFXE3OlKb28MMO1G3JhVbJbvjn7p4T/ogtxr2jzzbjtntGwVr12OfmpR7KMYipI
	I3f8ZsE9P4s7/SJ28vS4qO3bchgAuQ1zPGQPClIFDc6Kq1XribsA5nl0yXZYMAcrLkRR6uWl59dVL
	6mO1BXfr30WJfqQ5CdR6YIHvc5VQ9kkdbn0ymwJQVWd1ZP3M5dENwxaqkt6J7zwmWw6r/9yQxDGIb
	malWbZ9Lbpp0YsGd/fHgvIRAVZKmwPHjSAnzWXMVLeiEK70GuenBqorgOHR1pUIm+PmKSZXPB5Pu2
	L2GgxWnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utS6V-00000000OJk-09Sm;
	Tue, 02 Sep 2025 14:35:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPT3-0000000GzVU-2gF2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:46:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 177D160212;
	Tue,  2 Sep 2025 11:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F138C4CEED;
	Tue,  2 Sep 2025 11:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756813588;
	bh=nitp/ehKgCus2GLbBQJBw9hgUMhrPQICaIiiL3f5Pj4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mteyJTi4KgOZSPIMQkhNh5JNgR82tE2sd3dR4ckNiBIjapz2PaGQ+qKZa+vpN4miR
	 GitVMWXvlojCrBGCIFo/ug8TqdsgBLI5h7eai8ET8x3Jvy6IUFMHpu0+OAZbYqBh9M
	 rok49FFSc8bsKoffqoRzTBPnsHWUabRdBP7f/b5uHV8smpwOYYy5PIIWyPpyW/r6xd
	 gU5V7CC5QHbDs40v7m4SN5SlLhQLT4q3yBOtDY1pE2M9W7Ee+Q9VWDu536lh1uDfrZ
	 6vlDmxoezOat/sojpiyFVvWvAls2dyFejQW9szrQtz+DhFmBl9n9Y5+2UeBX7V/WKT
	 OB1LN8wPHDE0w==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 02 Sep 2025 12:36:32 +0100
Subject: [PATCH v8 29/29] KVM: arm64: selftests: Add SME to set_id_regs
 test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-kvm-arm64-sme-v8-29-2cb2199c656c@kernel.org>
References: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
In-Reply-To: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=3326; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nitp/ehKgCus2GLbBQJBw9hgUMhrPQICaIiiL3f5Pj4=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhoxtNyb4ca8+OKcvTa5ZVLXtgXt0W490XMG2T8cv/+9N+
 xeg9jiwk9GYhYGRi0FWTJFl7bOMVenhElvnP5r/CmYQKxPIFAYuTgGYyLpDHAwN8y/HMatZMEzy
 7prVXRXwQeeRbf1nnSP7RWdVfHnXLM45Y/OZbqNlq2bZ/tZ4cvH5duOcQvHPHsnrfD75dUhN3Pm
 wOfg+SzDXXon4Uz1KGU7RJ2xX3OyTe96317RJNVLs8W+tJIeDX9PCs3bPr/hzvmRC7sMNTn98tE
 rEfa7riblnzrOqO2sVWpT19fYxdhXZ93PLTU26uXeyTT63Yu2T1z6Od3TONpaFhXoHHLL29anWD
 tXUUq3IaprTIdR3Iuq3x97HHNPCm+MF1sz0SXxX1mXx1TLqy9rCF0XS3lEzZt3lNDojfP7ujny/
 ln+GSUtnTjrSdNq+XtFWwEap5a2Fk9G3OJbDrLodsrM6AA==
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

Add coverage of the SME ID registers to set_id_regs, ID_AA64PFR1_EL1.SME
becomes writable and we add ID_AA64SMFR_EL1 and it's subfields.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 27 ++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index d3bf9204409c..f3f15145aa69 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -196,6 +196,28 @@ static const struct reg_ftr_bits ftr_id_aa64mmfr3_el1[] = {
 	REG_FTR_END,
 };
 
+static const struct reg_ftr_bits ftr_id_aa64smfr0_el1[] = {
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, FA64, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, LUTv2, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, SMEver, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, I16I64, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, F64F64, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, I16I32, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, B16B16, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, F16F16, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, F8F16, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, F8F32, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, I8I32, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, F16F32, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, B16F32, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, BI32I32, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, F32F32, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, SF8FMA, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, SF8DP4, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, SF8DP2, 0),
+	REG_FTR_END,
+};
+
 static const struct reg_ftr_bits ftr_id_aa64zfr0_el1[] = {
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ZFR0_EL1, F64MM, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ZFR0_EL1, F32MM, 0),
@@ -227,6 +249,7 @@ static struct test_feature_reg test_regs[] = {
 	TEST_REG(SYS_ID_AA64MMFR1_EL1, ftr_id_aa64mmfr1_el1),
 	TEST_REG(SYS_ID_AA64MMFR2_EL1, ftr_id_aa64mmfr2_el1),
 	TEST_REG(SYS_ID_AA64MMFR3_EL1, ftr_id_aa64mmfr3_el1),
+	TEST_REG(SYS_ID_AA64SMFR0_EL1, ftr_id_aa64smfr0_el1),
 	TEST_REG(SYS_ID_AA64ZFR0_EL1, ftr_id_aa64zfr0_el1),
 };
 
@@ -243,6 +266,7 @@ static void guest_code(void)
 	GUEST_REG_SYNC(SYS_ID_AA64MMFR0_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64MMFR1_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64MMFR2_EL1);
+	GUEST_REG_SYNC(SYS_ID_AA64SMFR0_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64ZFR0_EL1);
 	GUEST_REG_SYNC(SYS_CTR_EL0);
 	GUEST_REG_SYNC(SYS_MIDR_EL1);
@@ -784,7 +808,8 @@ int main(void)
 		   ARRAY_SIZE(ftr_id_aa64isar2_el1) + ARRAY_SIZE(ftr_id_aa64pfr0_el1) +
 		   ARRAY_SIZE(ftr_id_aa64pfr1_el1) + ARRAY_SIZE(ftr_id_aa64mmfr0_el1) +
 		   ARRAY_SIZE(ftr_id_aa64mmfr1_el1) + ARRAY_SIZE(ftr_id_aa64mmfr2_el1) +
-		   ARRAY_SIZE(ftr_id_aa64mmfr3_el1) + ARRAY_SIZE(ftr_id_aa64zfr0_el1) -
+		   ARRAY_SIZE(ftr_id_aa64mmfr3_el1) + ARRAY_SIZE(ftr_id_aa64smfr0_el1) +
+		   ARRAY_SIZE(ftr_id_aa64zfr0_el1) -
 		   ARRAY_SIZE(test_regs) + 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST;
 
 	ksft_set_plan(test_cnt);

-- 
2.39.5


