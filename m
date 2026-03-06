Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEC3FCB637
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dlc26ECvnvKf/6qGxFnpyWd5raC+JUzp2+AcgcGx2Ks=; b=1RO4G4gOTmrxthnPVLsYxg8mAW
	cPsRBJU2CYAOU303GjxOt+ofWLst7/yrz88odlfmy4W2bmpk4WiHDK1tpZHC2EsjElHX2pdRGv7gL
	V2Jpi0+ylWRyavtnJUGT9NO/yeEe6Mp6qKM+lX9lOJPGP3izy/Jdxsf2YS2i7ZzBfG5Uv7np0gT6m
	zH9DbI1PUl0JSrOQ6HdUXEAP2n/70bckZTUC/BUTPdk5NS+c1dH/TnfLSs/Qz12H7QxUmf4SoAGf7
	JStGmyMq2v03lf37rrWtW6v8L9yyH+rnxeA6OTHINYemN9rw6MGU3FzYqDgk2iAa66Qivsn+78BpF
	bTzRQDlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYi4-00000004EZg-1VfO;
	Fri, 06 Mar 2026 17:11:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYi2-00000004EWb-09Ma
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:11:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CF0E60018;
	Fri,  6 Mar 2026 17:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A94C2BC86;
	Fri,  6 Mar 2026 17:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772817089;
	bh=48J6vOELlRnKwnvRZfyB0150FtcIqOvT0BA0oxdO4r8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lwLFFjDNOuu1sfuYaweC0SyZJ9rrIiPS40Z2CtQ9ba4apRuHWnJiSsXWef7e5OQBu
	 tiU1Dl6vTgZATqWG6M1Gv94S0lXT4GCD8LiKW2uxB/x0SbufAVwUcZi4uuowhAMYKV
	 bKeeZee9ec+5nQKzpAFyU4DcRGGZBV4CBukzvZM7Orx15lF4lo2ONAixI7Q3lrV3q4
	 0fV6X2ETisCHyfWTfPG56TiATOOC3cQqJouFdbbsA/Fj5ccEAcnzzvmdR1FKF4m1mk
	 J6vVA2RBFTuDq9VFWQ7W54diTrayAkKV1KuOzEsh7Tza7vaDz3KGnJ+UVX3acQL+GO
	 rJj6/f/yprLWw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 06 Mar 2026 17:01:20 +0000
Subject: [PATCH v10 28/30] KVM: arm64: selftests: Skip impossible invalid
 value tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-kvm-arm64-sme-v10-28-43f7683a0fb7@kernel.org>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
In-Reply-To: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
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
X-Mailer: b4 0.15-dev-6ac23
X-Developer-Signature: v=1; a=openpgp-sha256; l=3787; i=broonie@kernel.org;
 h=from:subject:message-id; bh=48J6vOELlRnKwnvRZfyB0150FtcIqOvT0BA0oxdO4r8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpqwo+wHKzAuHcwdnrh2mF3OuVoFygnzjy+m5WJ
 1ySn5i4AduJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaasKPgAKCRAk1otyXVSH
 0FWcB/95h8TYFaJLtY9Mig1aiCYlIxNxOjNvHHu24TrccFxyTJ06ypfmagGF+VP5x9Pbj8n6KnU
 hdBNCUXSjBt5seAx22tcbMzTRoVaurCnYiCMWjL1+5ze7yQ4D3geNWPduq1D8OHfIrDlNjVCrEj
 FQY8J1EOeYVXQDqE9HN+oEwZ/k80twTLdA/pZP/iOYTq8ApNKmpuo3paT2MzkKUNFulB6dQuPNN
 eKjm9xweYdVRvCf4E/fA5sgqxWen6AVTuA+IuGjwdm0zsw8HSP2rdK3XYxVRsvUiMj+CsWGGofP
 h3ItgX/Qu1x/b9e4qrGcczWSkDFV1SNEQWmn/eIM5tGtZcOv
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
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 63 +++++++++++++++++++++----
 1 file changed, 53 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index bfca7be3e766..928e7d9e5ab7 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -317,11 +317,12 @@ uint64_t get_safe_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr)
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
@@ -329,42 +330,81 @@ uint64_t get_invalid_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr)
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
 			ftr = max((uint64_t)ftr_bits->safe_val + 1, ftr + 1);
+			if (ftr >= ftr_max)
+				*skip = true;
 			break;
 		case FTR_LOWER_SAFE:
 			ftr++;
 			break;
 		case FTR_HIGHER_SAFE:
-			ftr--;
+			/* FIXME: "need to check for the actual highest." */
+			if (ftr == ftr_max)
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
@@ -399,12 +439,15 @@ static void test_reg_set_fail(struct kvm_vcpu *vcpu, uint64_t reg,
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


