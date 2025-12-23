Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2398DE6B261
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 01:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LLJJxlwfXoobC3N0QxHSQiUq4Tn/e/r2OKXS1LULcfE=; b=efy14E0/TLHda8EWlOrIc9Q1uu
	f44G4AmCBo5dEpopbwalw3jfKDyxenrkU/dbGzwvWbSkZttYJ8+jictnCyCRVHe6K6KmVKjCGAB0y
	ihnc+DdKD51gdcBMlirC1oCmAfYXh3ybxLOZ8yUgnMn7QzPINWHJyUCYxhBbEI1ibUolpuBxFPr7f
	5JSAW+Qp60JWcqA3LPbJdkaku7O+35IoFsOM1LiQ+cfQ3sE7sclJHcR/xhgJLC24JxvSchFzI09Pa
	AlAJn/N5RWt/zb9qG/9JNXNul1jejsFphC9iDySHBm4bi9Jlog3rw2iVTPkHwlfQzskYan2wDyjQR
	YqaSwltA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr7u-0000000EN7u-1Wzf;
	Tue, 23 Dec 2025 01:23:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr7g-0000000EMv5-3KCD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 01:23:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 16EA06018D;
	Tue, 23 Dec 2025 01:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED853C4CEF1;
	Tue, 23 Dec 2025 01:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766453015;
	bh=jbLNcvQ8qxr+FL0J4Bab/tdTijCeYtU2EXCu11Jdphc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EJ+BbwVJ5m3VApHWOcACnEn/Jtbrhz3GXdEHzeekIga3vryGLjkOdmsZwWXvDIOvA
	 BBxgwyPU7COryEy6mVlRZlH1M1GySUOo74ZpZV4vzwnepOJpu3u40EyJeDx5meyyjO
	 t+BakPXpQ/lA/tygjFk+NPGWxCqZXs46AeIkBmL4wL5FQb4EFwmrsu3b07okc/L3Hf
	 QH+5Z2LzInok83O39wAR0otC7kQm9VC9M3uW7HuLvCts3rYVg5ID7FmoN+EXUUCyca
	 MTjafTAzlcXP2WyAS9IdOPmbaOtX/H7zzjRsiT8gDGaEJfou0pOeMmagkWcuVg4qRS
	 qfylhUpbLObJw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 23 Dec 2025 01:21:22 +0000
Subject: [PATCH v9 28/30] KVM: arm64: selftests: Skip impossible invalid
 value tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-kvm-arm64-sme-v9-28-8be3867cb883@kernel.org>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=3644; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jbLNcvQ8qxr+FL0J4Bab/tdTijCeYtU2EXCu11Jdphc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpSe6YjlDBX+enbPVACfxp+aByWhyMVRBBrMoHp
 yKUFjTo7kmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaUnumAAKCRAk1otyXVSH
 0PAdB/wKnIGQ0YWaL2F/ONZhaNf7iTxCd4x4MoDNmNeqoCkxjB7QvAl3CDHLRjbPZXLqxliOVWW
 n9wi9014gJZ/JD0umqy8ZetSmzKsOQw1mmMhW3nd22zLuLKufd/KC6upoXXMBq56T6yiP5FWnoU
 J4qeY8twwIzjd/zVmXaiK9ZE4RIbMhyhLi4USL89FG08YCzCFBK0ginrTgJ3h255gW6KCzuVm5E
 fOMzXi83SHaSprSXVV2EFXxUsBZXwsyesJAMt/3GSB0xyLcYIlFfPiOI0bwUXJP/tKwj/sSSFbw
 OL2lN0rqRDQ57wtw06kB9PzKMie3b7CaLj2SW44lWrTJRErt
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
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 58 ++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 322cd13b9352..641194c5005a 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -318,11 +318,12 @@ uint64_t get_safe_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr)
 }
 
 /* Return an invalid value to a given ftr_bits an ftr value */
-uint64_t get_invalid_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr)
+uint64_t get_invalid_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr,
+			   bool *skip)
 {
 	uint64_t ftr_max = ftr_bits->mask >> ftr_bits->shift;
 
-	TEST_ASSERT(ftr_max > 1, "This test doesn't support single bit features");
+	*skip = false;
 
 	if (ftr_bits->sign == FTR_UNSIGNED) {
 		switch (ftr_bits->type) {
@@ -330,42 +331,72 @@ uint64_t get_invalid_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr)
 			ftr = max((uint64_t)ftr_bits->safe_val + 1, ftr + 1);
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
-			break;
+				break;
+			}
 		default:
+			*skip = true;
 			break;
 		}
 	} else if (ftr != ftr_max) {
 		switch (ftr_bits->type) {
 		case FTR_EXACT:
 			ftr = max((uint64_t)ftr_bits->safe_val + 1, ftr + 1);
+			if (ftr > ftr_max)
+				*skip = true;
 			break;
 		case FTR_LOWER_SAFE:
-			ftr++;
+			if (ftr == ftr_max)
+				*skip = true;
+			else
+				ftr++;
 			break;
 		case FTR_HIGHER_SAFE:
-			ftr--;
-			break;
-		case FTR_HIGHER_OR_ZERO_SAFE:
 			if (ftr == 0)
-				ftr = ftr_max - 1;
+				*skip = true;
 			else
 				ftr--;
 			break;
+		case FTR_HIGHER_OR_ZERO_SAFE:
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
+				ftr--;
+				break;
+			break;
+			}
 		default:
+			*skip = true;
 			break;
 		}
 	} else {
-		ftr = 0;
+		*skip = true;
 	}
 
 	return ftr;
@@ -400,12 +431,15 @@ static void test_reg_set_fail(struct kvm_vcpu *vcpu, uint64_t reg,
 	uint8_t shift = ftr_bits->shift;
 	uint64_t mask = ftr_bits->mask;
 	uint64_t val, old_val, ftr;
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


