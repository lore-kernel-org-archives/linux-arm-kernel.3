Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5506AC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 01:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sohMnFThSx+MGbH+YKOhNE2kbM7dK1ZUrwX8hwiwxBM=; b=k+Wvrx/+39lsSX2uvnr0khWo+w
	CKG6WRkdfC9ePvZQUc8du8BojnzE73j1EAg1nzu+VbEPWABMVd1OXrBBkqfCioLcMw5V2rRD/Fhra
	gKCsmnpAhnzzrZFpEpP6SrTwYAhazO49Hn3mOBdbXp0inCi3APcTwpjptMO0UKvl95se9cqY0ba1C
	VuBDC8o1mWCbMS8izI0ZVEGvaFyplStRHkzftSVXxM6BPMSCN6dTnIkemRe+IZFWVdcp6MkIYCboq
	v4gV8/kO+O5O9gXXmygD/AR6FUmHrZs8NKeglVucCaq3I/39WtN5JXA/bW7da9QCMvOJkZnbB/1hK
	VjMwACXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5DrN-0000000BPSS-0wCk;
	Thu, 17 Apr 2025 01:16:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5D6B-0000000BHKL-2E8Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 00:27:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ABC236842A;
	Thu, 17 Apr 2025 00:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2587AC4CEE2;
	Thu, 17 Apr 2025 00:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744849642;
	bh=h3hcTuhJ/enbUfNVFyfDycfLuRL7LaoTm3WlqJwa4DQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=husKvgdpNGac4aEmz2a8LrtekbLfHboqcUZTISl25gegAlsSISd2QxneSp4ORGFED
	 fAjrjtPZHo3rBf04uAuXwwvla5fntn/XrZ82Ke/EwuQQnJYiy5M7eh1iN1aqhar+Zt
	 PkqHf1WIUt8dsTwzoZa3rHsHccxTe67whG8iutYEvQs2noL8l0/IcidhhQlTunX7uZ
	 FcoK25ca2+Sc3OB77m9CtMmEeYENFpGjhhcgBqAKYvmdsRgUKFZCUteZWaL/HtXv0p
	 ztd6V3Knvnp20un3cFDtg8z84fZFDOjVCHKvNftyvCixxluxVioAX92QyrbTF14w74
	 Z/MbxIPlt6sSQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 17 Apr 2025 01:25:29 +0100
Subject: [PATCH v5 25/28] KVM: arm64: Expose SME to nested guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-kvm-arm64-sme-v5-25-f469a2d5f574@kernel.org>
References: <20250417-kvm-arm64-sme-v5-0-f469a2d5f574@kernel.org>
In-Reply-To: <20250417-kvm-arm64-sme-v5-0-f469a2d5f574@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1232; i=broonie@kernel.org;
 h=from:subject:message-id; bh=h3hcTuhJ/enbUfNVFyfDycfLuRL7LaoTm3WlqJwa4DQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoAEqCQNyqY3LZseLPc/PyUZbteRvSD1dXOrGL020K
 YedjAN2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaABKggAKCRAk1otyXVSH0LCbB/
 9BF3Mn5ovMuDqziZZPCiLH51J+v/o26aqdZXm7BidvPRR+1FKOtjOli2O62XceQ9oZxtM4+OatkK8X
 JO9l5Olh4UHg5AxMD1SqwPamsY9cGN0qSk3EuoxHDm6IOTZtpZY81egCAQlJzgTj6uYE5au84H0KdL
 2y9s7VFUIT6+JXKBZfYT1d/0DFqo7VgvFoy4AqnVHTGI8QRqNvKAfdLwaYNFxt5vZE8fp/J7JDY1QU
 0mzm3gp7pIvoy/O73+hqGn/SlmOcZUiQQSwMsWDugQLhL24QeKPHpNJzIEpKfcwtTHj2Dsb6z2HSGm
 PHXHtBAvUK0TBqV7tj/kdmTktd8MjL
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

With support for context switching SME state in place allow access to SME
in nested guests.

The SME floating point state is handled along with all the other floating
point state, SME specific floating point exceptions are directed into the
same handlers as other floating point exceptions with NV specific handling
for the vector lengths already in place.

TPIDR2_EL0 is context switched along with the other TPIDRs as part of the
main guest register context switch.

SME priority support is currently masked from all guests including nested
ones.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/nested.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 4a3fc11f7ecf..a599216ce1ce 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -841,9 +841,10 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 		break;
 
 	case SYS_ID_AA64PFR1_EL1:
-		/* Only support BTI, SSBS, CSV2_frac */
+		/* Only support BTI, SSBS, SME, CSV2_frac */
 		val &= (ID_AA64PFR1_EL1_BT	|
 			ID_AA64PFR1_EL1_SSBS	|
+			ID_AA64PFR1_EL1_SME	|
 			ID_AA64PFR1_EL1_CSV2_frac);
 		break;
 

-- 
2.39.5


