Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E1BC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 02:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFxFVctH7mWSIvkbn/yWWYh9K9T6v6gpiTFM4HyNMZw=; b=SEhZrA9i1ze7t1rCnU6ky4nhoM
	kWRwDZNqR4wudiSrmBplkOZJkUkZ/qobO6+vYvJt+613e32kJ7ZRx5qayoRRUoAWPTIA6nT0ONlvl
	GPQxeJCCAerswdDWxKbk41fhTfIdQzjiDDgslurjZFOLVRuO+hDSdqeFxOxWXinmkAqnP6IIZd73C
	16eQfRZlLPBwaBqxaZGX0VyOlb91ZNT+jwWzreJXPeV7qKJQlh3/O3meBOsbEpGH2YHRkD9kaTlMC
	YxuLey8DEzGAVKjlAIQiqyW379uu0U6lM0BMqQRkHdLDD8YvBS/5PSzbudjzZ1COWKhaPP1Hq1wjN
	rC9hU10w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tilZw-0000000DMxR-0oOB;
	Fri, 14 Feb 2025 02:37:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1til2F-0000000DFfM-34Hz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 02:02:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD6945C5D26;
	Fri, 14 Feb 2025 02:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79305C4CEE5;
	Fri, 14 Feb 2025 02:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739498550;
	bh=O9fUykpOFCE6cffP6rch/hK0pXpC+JZZQ2fo1WCQyng=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fukQWye/fA/0QbZiSWxfKT8vKRA4t6gbBeNEGE33xtt4MIgWZWzgDALsSPFkuKHwF
	 A5+Qmqee8dVdaMkV8QSFjHhbteVwOuJd7U5FRAXLvKC44eNdhCnfs5exvkYF1j4L01
	 OGlYUsLTEVdYExaYlrlozji9TWxaSq+woWiQz2s5SDBzLl5/8unLfOr/9YyCE8YU3F
	 QVD+HeCRMgKd5USbT1nH3p29bXr7M61pp8iya+N7PAfMlCWkRxQnb6nzHoD12w9pzQ
	 nzZLgg1UzU6rPVSa9m3IwDpXlSzGREk6NxX/XSBuC672b5KOAkjmJtoTOOc2kusG3L
	 hYIfpwRfi3w/Q==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 14 Feb 2025 01:58:07 +0000
Subject: [PATCH v4 24/27] KVM: arm64: Expose SME to nested guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-kvm-arm64-sme-v4-24-d64a681adcc2@kernel.org>
References: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
In-Reply-To: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
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
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428; i=broonie@kernel.org;
 h=from:subject:message-id; bh=O9fUykpOFCE6cffP6rch/hK0pXpC+JZZQ2fo1WCQyng=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnrqPTY/O9PimbZOlJQsTehPrB4TODTPWvtUWQWIQY
 8sv6NXuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ66j0wAKCRAk1otyXVSH0LFZB/
 9ior0jJCdNBf81HfqHzJn/jvJY8NN7KoBMDvFl7WH3vVlBcf0AsoMkLVB3kNYoIY13gVuPEddEP8cw
 MVvuosaYdK2Udy5A2uuIwaCGPLpArix2bLDawT6/Of0P9t3BA5teHZGUVwxVAxAEdWdXI3rU78qn1u
 kW3qQq3p42aOMNPr36emzR9ydYiIWgu1fmEXkS4NLEL4cEzgR2NlZntI2VL3qziR1qXHhWw+2HSN8R
 g1xyg9FITMKxVxhmAiRrwC52g9To3eLt0eNyXxzDr0eD32f/o3jjyY6IVByhhVxNp7kqjiZiA19kVJ
 ImrRmgnMLFJ6+EG7PQMshN3D9MOwtC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_180231_864277_AFE04B8D 
X-CRM114-Status: GOOD (  10.90  )
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
index 0c9387d2f50708565b5aac1fc0f86fefffd94ea1..58324806c8d588b0a77c835bafc89236a1ad52d1 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -840,10 +840,11 @@ static void limit_nv_id_regs(struct kvm *kvm)
 	val |= FIELD_PREP(NV_FTR(PFR0, EL3), 0b0001);
 	kvm_set_vm_id_reg(kvm, SYS_ID_AA64PFR0_EL1, val);
 
-	/* Only support BTI, SSBS, CSV2_frac */
+	/* Only support BTI, SSBS, CSV2_frac and SME */
 	val = kvm_read_vm_id_reg(kvm, SYS_ID_AA64PFR1_EL1);
 	val &= (NV_FTR(PFR1, BT)	|
 		NV_FTR(PFR1, SSBS)	|
+		NV_FTR(PFR1, SME)	|
 		NV_FTR(PFR1, CSV2_frac));
 	kvm_set_vm_id_reg(kvm, SYS_ID_AA64PFR1_EL1, val);
 

-- 
2.39.5


