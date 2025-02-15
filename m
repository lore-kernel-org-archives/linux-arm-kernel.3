Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77992C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 17:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jlDiG1x0WQEDGyGo9mDfO1JLSoCAemvjry7kIWXJlU=; b=wjb06b2wvPbPm752qZ5cGctmY3
	lpvqGWx84Z1Jk+P3jX3tdSwpvVKoql141XChMCHEB2HTVSUF3LgIRtZrimWqwR/t33kbzZHSxIlO0
	F4Yrp4RwwVHOhDjhZYlwcIIXjkZ0tK++rekGstdtMzwhcl7JAewqHrN37dkQbDZI8W6Hv1wZQ3/JC
	3YuBGikgWTs1R43r70qBCgU/br7gtZVN85ZElma041yA3CI1ADXyl9t21z5K7me8BzWxfQ9LT/xzk
	5QlFhP7TdBoAm2IapM587097WUBpHWirJAlXlI+Du7/7iCB2YJKtq7KDrbFD22mG8rv+568SPjPeZ
	y7h0JxOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjMDD-00000000VxQ-0mtf;
	Sat, 15 Feb 2025 17:44:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjM7U-00000000UpX-0d5e
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 17:38:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 37CEFA405AF;
	Sat, 15 Feb 2025 17:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F321CC4CEE6;
	Sat, 15 Feb 2025 17:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739641103;
	bh=3rQ7sS5vZjM6vbenQtanAQbuJs7l4zbUMP/xYyxer3w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZqNdv9ijD2WnHJbw/M4ayw7EwnhIIy8oV6Fh84I+iq/RQLXdwMoc9i5FOXPcix+w0
	 h3KehIgFEtI/eeg1w/7yrPkqamDb4dBv7i+r7v++Qh8F/igG8+Q1/U5gsSp0g5ezdR
	 kxCe2qmpj7WVxDGBBtXrBT85gJ/MdjlpxdhtLiW27F8JDmrYUGMO4b2v3J1/blzJXo
	 FQWL+XUbtQfoKQHuxJ1CKhwk12Gty2DE2IY4X3q6Wdv5Zo7WLoiHpUQsIO9bJ1zrSQ
	 FtQQEqMiDscJbt9t85ZdMXxiuTBQBdi7n173lS4rnBNHVakFG6ZK4Xs+w1CVjZQTHS
	 kuPs1TMyRbkIw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tjM7R-004Pqp-2F;
	Sat, 15 Feb 2025 17:38:21 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 04/14] KVM: arm64: Mark HCR.EL2.{NV*,AT} RES0 when ID_AA64MMFR4_EL1.NV_frac is 0
Date: Sat, 15 Feb 2025 17:38:06 +0000
Message-Id: <20250215173816.3767330-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250215173816.3767330-1-maz@kernel.org>
References: <20250215173816.3767330-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_093824_247772_98494A01 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

Enforce HCR_EL2.{NV*,AT} being RES0 when NV2 is disabled, so that
we can actually rely on these bits never being flipped behind our back.

This of course relies on our earlier ID reg sanitising.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index ed3add7d32f66..9f140560a6f5d 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1021,10 +1021,11 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 		res0 |= HCR_FIEN;
 	if (!kvm_has_feat(kvm, ID_AA64MMFR2_EL1, FWB, IMP))
 		res0 |= HCR_FWB;
-	if (!kvm_has_feat(kvm, ID_AA64MMFR2_EL1, NV, NV2))
-		res0 |= HCR_NV2;
-	if (!kvm_has_feat(kvm, ID_AA64MMFR2_EL1, NV, IMP))
-		res0 |= (HCR_AT | HCR_NV1 | HCR_NV);
+	/* Implementation choice: NV2 is the only supported config */
+	if (!kvm_has_feat(kvm, ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY))
+		res0 |= (HCR_NV2 | HCR_NV | HCR_AT);
+	if (!kvm_has_feat(kvm, ID_AA64MMFR4_EL1, E2H0, NI))
+		res0 |= HCR_NV1;
 	if (!(kvm_vcpu_has_feature(kvm, KVM_ARM_VCPU_PTRAUTH_ADDRESS) &&
 	      kvm_vcpu_has_feature(kvm, KVM_ARM_VCPU_PTRAUTH_GENERIC)))
 		res0 |= (HCR_API | HCR_APK);
-- 
2.39.2


