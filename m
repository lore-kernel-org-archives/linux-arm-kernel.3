Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1011DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6q2RcAVUcHJXSDerZte/wZkUxNLtsu6zF4B+0lVk2U=; b=16rZYJ/4XHQTepd8/UV3vuZHtP
	MMSkYR7SL/WVSJiD4sqUCpyAK41RXzVNyGj+JVYATWh4a+mCn7vTwPNOjBwihZ9ZrrZRFZCDgi8AM
	sUsveoKkT5nbadsTOulp9ZgXRvUUQ3aHEDRNc2oIcqMEIAwlvNytYzcpP9rJRDclbd+rZKjUEovHj
	aXEAn1+Zg9x9K65b0HLmPfL4yXTvt55q1RiGgD6chD+koA6JjWAjzERFsS1iltTiIqsB36PytBYIo
	KnFb4F7pLNWi/yQ1LDHHVJ2Wa5zIS+2zqXSlKXP/hvbC4f08XwQd3ib9VZoZxqdHK0gYnkGhbKY9i
	8SEvWZIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whthK-00000003H8u-2aqI;
	Thu, 09 Jul 2026 18:42:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whthJ-00000003H7t-3qVt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 18:42:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C28C6137D;
	Thu,  9 Jul 2026 18:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6971F00A3D;
	Thu,  9 Jul 2026 18:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783622529;
	bh=k6q2RcAVUcHJXSDerZte/wZkUxNLtsu6zF4B+0lVk2U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bKLI+JLqX4NCZ2sJnMBSiuKYZ4BjOS9In2l5a0uh0V38xejRgNjCvN0hgzNEjia27
	 KovVpFEiIndn/Co2JEN/58EkWZM49auZQ65JliYt7s4Pia798PWP3Ilk2SKgeBy8Gr
	 dRk59JllJbWFrzbtwtzFmbq3bx/luUs18ayGhGCkRuXDCwiWIW8JH4a3iP65Yne0FW
	 u4WHdbNE1PcPwEwGICWNK3iTnN1fZ573OpSYG1LExUcRZzu+p24ZWzAXyqDO/5uVgl
	 TuPr3XcVeSO6jbq5o8RlwKrx6g+48uoHmaCvYGDhzm6wL9LtcH58uUAPHKLaarqvfL
	 ycDdh950qBDtg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2026 19:27:48 +0100
Subject: [PATCH v12 27/29] KVM: arm64: selftests: Skip impossible invalid
 value tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-kvm-arm64-sme-v12-27-d0301d79ef58@kernel.org>
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
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
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT+r/MiDwO0nIa0JXTdKaad8Wg+Z3zHSyBtUTi
 eixAMTowpyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak/q/wAKCRAk1otyXVSH
 0GqpB/9SJ+V9vjmMk4vct0U2i+V//FUjRQ+6+kMG3OFbl/RyCbZPUcTjesS1emd0Ev7F1LWclaX
 Lw+FuanjD+6KLJ3fsF4ro+xWWm5uVXlsGCAJWgIiUTd+h7jsu4jwWOta8VpR7X5yySiiqPR5QyV
 a37BfdO0+Oi0Bu1sDWGSrXE6vT/pqHUPdlzIIvZJfl/yQsDSWMyn6JdMyLeRldD0c/XgesjPmEl
 xc6lPA6+4cyLNZdMNngdbUIoQ7xqY0x/XB+valUBDkqDGqxcUFrX31x7vq2Y/QilrH1yDQMtn9X
 /XP9UFjLhEqDUZgvwh4nwe3rMyJb5RgaBqjDywJGqwjhcOvq
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


