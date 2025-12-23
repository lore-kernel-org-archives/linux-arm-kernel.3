Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB839E6B26C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 01:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFEZwVTNT14jI/0KRCrzgAMuhu/e5P/EdJNGc95VYgA=; b=2Oqz38/UiSJ3zQwJdQjc/23lcb
	wDFnYiLP77/+toYIXlTTH6ksu4fI+oy1+t1RcVgj8qfjT2cCkk7mOnPNEU0IBZC2n6rjgJI87wjaQ
	v4zwx44liwaZ2StFBwYU8swIclu4MQHsJ/db9MLq2bZLBb7WPUGRqgwZAcur0plt/yP6JOu1riH9h
	/WPhgu3iUFuAIXhymiFPhMoSq2lt6516RpC5q6kri5zeFzVwAlHk5g+sTI0SLs61c66N6tLqVzfdp
	F8XY/SR9NWzSoDEHqTHqFrOkNoh8q26DwM6ecOs0i3zUbfAH09yvVXbAg4v7Ylb6umSUu+q+PR2Sn
	kD/YtNYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr7n-0000000EN2K-47LS;
	Tue, 23 Dec 2025 01:23:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr7c-0000000EMpl-3IaM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 01:23:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D086B60189;
	Tue, 23 Dec 2025 01:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B13B3C19423;
	Tue, 23 Dec 2025 01:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766453011;
	bh=Z5j3l5hq06OVglsz6W9Xs4iwgZIZ/lq9hxI6ABS0IYM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q+qxLBd1+fBvecWLmFic4UBW2LgCAzlPUr9zb0EF80h8QkPP4HPOhbO1rYiVYjGw/
	 Jw/yDNNQ9ERhcqDPInp5hXfwMU9jFrWbRvCjExBqhyYrmwgs7bQe1ph9AGup0JCjap
	 osv3tq9df9wVDVMyI0Fd8zzQxG2Bk0SKNgPTsznaTCF0131x2EfWFuCfSNMx6iLjkz
	 Df/sZea2lE3kMBvsMpupIkq0UGmU8kZ0jKCUkfHTTdbMLq0mFI3sJ8IH8HJ2ss9h/H
	 oSKwuE8qVSTBLzmXbeIB2XWAQNHzi7jsoBZSkw3QToRd8h+fUJL0lQOAXzNLRroh2X
	 OEUuStJ92mzHA==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 23 Dec 2025 01:21:21 +0000
Subject: [PATCH v9 27/30] KVM: arm64: selftests: Remove spurious check for
 single bit safe values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-kvm-arm64-sme-v9-27-8be3867cb883@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1169; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Z5j3l5hq06OVglsz6W9Xs4iwgZIZ/lq9hxI6ABS0IYM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpSe6XuZqDZHAD1EbYrK8wn0phiB+1DdVn6PblO
 QAM9RR2+ICJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaUnulwAKCRAk1otyXVSH
 0JJCB/4y34p+VTk0tkbCqrPh1qJK7fJsyrMK/+p5SaTDCsoRuuE4RyMJ5RqomOK0FgfnkdBHk2P
 va9Xud+cf24Dezk4eYeg6HQaJtZRQnK1AnSqKOMOfxx5fqmK8wljWyR/QII8LA4UrQWX7vGTpYp
 t9Wmb+EZUJoVc14h9Mfmqcum/aUjTjiEm4RnN1HO+PdnxU5p3HRXlQfB0g1RRPSvkzwr3w+Bish
 0erE71BlCyTFzonFUO3SH+5UhD1w/bCILJybHOzBsnDEcw/jBIyIVUI7eKq9CJ7lEMfhxExTe2M
 bTitMkcm7AoeoGDCM1CjdBli5WAddd0qICzdghkryQSjmMmN
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

get_safe_value() currently asserts that bitfields it is generating a safe
value for must be more than one bit wide but in actual fact it should
always be possible to generate a safe value to write to a bitfield even if
it is just the current value and the function correctly handles that.
Remove the assert.

Fixes: bf09ee918053e ("KVM: arm64: selftests: Remove ARM64_FEATURE_FIELD_BITS and its last user")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index c4815d365816..322cd13b9352 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -270,8 +270,6 @@ uint64_t get_safe_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr)
 {
 	uint64_t ftr_max = ftr_bits->mask >> ftr_bits->shift;
 
-	TEST_ASSERT(ftr_max > 1, "This test doesn't support single bit features");
-
 	if (ftr_bits->sign == FTR_UNSIGNED) {
 		switch (ftr_bits->type) {
 		case FTR_EXACT:

-- 
2.47.3


