Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7C2C44521
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 23:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6q2RcAVUcHJXSDerZte/wZkUxNLtsu6zF4B+0lVk2U=; b=qTODHmvY7parg+ft8xJmv7OpY/
	S0wBdzwGCx2Tr71zQBbZ8yn3qBi1b2NxbwCFpERwC40m12Ct/v/ch4VjEweuUcijHMh8cuefNTOge
	TBqvpZDJf2kp1DrG2Zg9w1/7xZacjuyTjM6mXO2pI5+KNXTLWcBwGbC6kMxUoNDIrQXYTh/og2znX
	XNohUCZ7VuLeQxvyRQoXwiwPdWt1Z04rogHGfF0ZAzzpOkTwe+I3q43OjiCVD1pb7+I8Uqu0eq4T5
	StuCCzgt+KKAQfsJBaS9kraJvKw8GyRjGkMLW54L+gvRpvknC/alnYXaoZgm2HRTjIKy/jz2FnM6C
	8GLIBflg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlagP-00000005UII-3cLk;
	Sun, 19 Jul 2026 23:12:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlag3-00000005TvI-3xTM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 23:12:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A3EB240E87;
	Sun, 19 Jul 2026 23:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2801F000E9;
	Sun, 19 Jul 2026 23:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784502727;
	bh=k6q2RcAVUcHJXSDerZte/wZkUxNLtsu6zF4B+0lVk2U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VHItgEX6/YP2Ozy/roLHwG3vf3bR69hSpR1DUlRiB81FP7Gbm5ey4b6DhDJpNcmbr
	 TLk5dNTHYuEsw/0fZpNl6QDoGh0z6zUmlT2JJ20h9vCoDigNdDagYZRKqzlU+GhfcI
	 8x+uCcb2Yee4Y+quz/okcIyNoRuyDN03TYOrq7gZ/qiaGxgUmF4CJdXYpyPSwWLtwo
	 RAWgc4xkrEMp0j1KaL6F6nMMfNVbZ4/OzqIsSyrncER7wNtWkEq4zxMlyFocVDd/Uh
	 tJzgtloC8ctgNyMqkAGCgGSigPKJI7CiHVY6BI+CBHPZfp4LeuGF93jZsoPcP1XtPH
	 dVUKaBcSFMvuA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 20 Jul 2026 00:07:57 +0100
Subject: [PATCH v13 30/32] KVM: arm64: selftests: Skip impossible invalid
 value tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kvm-arm64-sme-v13-30-d9abd3ffa245@kernel.org>
References: <20260720-kvm-arm64-sme-v13-0-d9abd3ffa245@kernel.org>
In-Reply-To: <20260720-kvm-arm64-sme-v13-0-d9abd3ffa245@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Jean-Philippe Brucker <jpb@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3690; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DoSXFT1XFLMt5bL77ymD5uWM5fFd8Skxma7c37DB6O8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqXVk+ePDwSiD4VpzeYE3Id9Rc+zhBWemm3WIxc
 k5BrRZvK1yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal1ZPgAKCRAk1otyXVSH
 0AdJB/wP/giklcwigwFEGFkW6wN64uXabgyc3gw+Vbq+QvoRCYFBOd/fUghgQKbm155Ze2D8KyK
 MnBusZQAzlKmg/sFstsLmakD/2vTWZOLjLblcx9dLnzlHoi/bCS8ynS0DYHu5RcDwdvT8sIs/Vg
 xzXqk3GCIdWl7L/Fe4ApJK65MYGRjFa91uJfHf+6EzuiGfEXhXZykSweG9xQe+qcFUzcPKe0E2t
 lJtfSUcnd5gbPzM5M4sxvdHL030+dol1TIi2qtt9C/QXkaWC1QuPZANzx57gIZ2Z1HB4EfEHSNr
 w5R5Www7gZwUifp6pFf1/H2RfcdcPriBjttYHs2MerjIUzVC
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

The set_id_regs test currently assumes that there will always be invalid
values available in bitfields for it to generate but this may not be the
case if the architecture has defined meanings for every possible value for
the bitfield. An assert added in commit bf09ee918053e ("KVM: arm64:
selftests: Remove ARM64_FEATURE_FIELD_BITS and its last user") refuses to
run for single bit fields which will show the issue most readily but there
is no reason wider ones can't show the same issue.

Rework the tests for invalid value to check if an invalid value can be
generated and skip the test if not, removing the assert.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 64 +++++++++++++++++++++----
 1 file changed, 54 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 9eceac84e297..da9349bf31ab 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -327,54 +327,95 @@ u64 get_safe_value(const struct reg_ftr_bits *ftr_bits, u64 ftr)
 }
 
 /* Return an invalid value to a given ftr_bits an ftr value */
-u64 get_invalid_value(const struct reg_ftr_bits *ftr_bits, u64 ftr)
+u64 get_invalid_value(const struct reg_ftr_bits *ftr_bits, u64 ftr, bool *skip)
 {
 	u64 ftr_max = ftr_bits->mask >> ftr_bits->shift;
 
-	TEST_ASSERT(ftr_max > 1, "This test doesn't support single bit features");
+	*skip = false;
 
 	if (ftr_bits->sign == FTR_UNSIGNED) {
 		switch (ftr_bits->type) {
 		case FTR_EXACT:
 			ftr = max((u64)ftr_bits->safe_val + 1, ftr + 1);
+			if (ftr >= ftr_max)
+				*skip = true;
 			break;
 		case FTR_LOWER_SAFE:
+			if (ftr == ftr_max)
+				*skip = true;
 			ftr++;
 			break;
 		case FTR_HIGHER_SAFE:
+			if (ftr == 0)
+				*skip = true;
 			ftr--;
 			break;
 		case FTR_HIGHER_OR_ZERO_SAFE:
-			if (ftr == 0)
+			switch (ftr) {
+			case 0:
 				ftr = ftr_max;
-			else
+				break;
+			case 1:
+				*skip = true;
+				break;
+			default:
 				ftr--;
+				break;
+			}
 			break;
 		default:
+			*skip = true;
 			break;
 		}
 	} else if (ftr != ftr_max) {
 		switch (ftr_bits->type) {
 		case FTR_EXACT:
 			ftr = max((u64)ftr_bits->safe_val + 1, ftr + 1);
+			if (ftr >= ftr_max)
+				*skip = true;
 			break;
 		case FTR_LOWER_SAFE:
 			ftr++;
 			break;
 		case FTR_HIGHER_SAFE:
-			ftr--;
+			/* FIXME: "need to check for the actual highest." */
+			if (ftr == 0 || ftr == ftr_max)
+				*skip = true;
+			else
+				ftr--;
 			break;
 		case FTR_HIGHER_OR_ZERO_SAFE:
-			if (ftr == 0)
-				ftr = ftr_max - 1;
-			else
+			switch (ftr) {
+			case 0:
+				if (ftr_max > 1)
+					ftr = ftr_max - 1;
+				else
+					*skip = true;
+				break;
+			case 1:
+				*skip = true;
+				break;
+			default:
 				ftr--;
+				break;
+			}
 			break;
 		default:
+			*skip = true;
 			break;
 		}
 	} else {
-		ftr = 0;
+		switch (ftr_bits->type) {
+		case FTR_LOWER_SAFE:
+			if (ftr == 0)
+				*skip = true;
+			else
+				ftr = 0;
+			break;
+		default:
+			*skip = true;
+			break;
+		}
 	}
 
 	return ftr;
@@ -409,12 +450,15 @@ static void test_reg_set_fail(struct kvm_vcpu *vcpu, u64 reg,
 	u8 shift = ftr_bits->shift;
 	u64 mask = ftr_bits->mask;
 	u64 val, old_val, ftr;
+	bool skip;
 	int r;
 
 	val = vcpu_get_reg(vcpu, reg);
 	ftr = (val & mask) >> shift;
 
-	ftr = get_invalid_value(ftr_bits, ftr);
+	ftr = get_invalid_value(ftr_bits, ftr, &skip);
+	if (skip)
+		return;
 
 	old_val = val;
 	ftr <<= shift;

-- 
2.47.3


