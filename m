Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE0FC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 17:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pj6zntRm2UsXiu7O6afBkef2slo4ahz9V97Xg066oVU=; b=hW+aavSE+ViVVo8Iru4m5radrs
	J+LN2aScAIt0Hu1eprh+nsA/VbvwOE5MO0q4E0J+NQTzr0+C/RLB2cDoppnlPfsg+eiGJvI5UMD92
	lHalFW2nhS/ozwDD7eaKrzgpv9hnDw84cVwhcVdM65Ebj0rM6tDBVR0J8/BE5yvOv5X59fd1CEDW9
	EHjhPzG3408nU69fCO/95L+pbQU2ea9nIQWsUQAlW5XdOInMm7f+b5WlVBYYCg7p9/bPZA5qTl33b
	bs22oidkEkqFpU80ITuARb0klVWM/sL555qXDR0O7ofSczsJEVxuBVjennPxyqx/BZLXNlXshYkIN
	kkx+o2Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjMKK-00000000WuT-2ocL;
	Sat, 15 Feb 2025 17:51:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjM7V-00000000UqX-0wUp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 17:38:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D4E505C48D9;
	Sat, 15 Feb 2025 17:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E8DC4CEE2;
	Sat, 15 Feb 2025 17:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739641104;
	bh=Cptvvdg58Mif3ou0/tPyf1Nbz5VIb9W2RdSQkk+mm0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LpSCmhSrjcKzDokvmluRQxX01ZBowLxhPSNmQmVHx36lqUkFLLT2b5cYwrvfP6Jqr
	 iBEA11ASqUh+MauSC+bom+iVlXFc8rVVrQ1rz6spd05vnB2k+iO6sm/TsTaJK7TRdw
	 Yz5MYMTrv829LGqieVE4Xs6HUc/t28IJ5bUFVDIA5Fns0upKP5Kci8Gkl6leMezCa0
	 qZMvxV9mfOzaJzLJeU2P51bNPWyiER6Prik5Myo8VGjNRF2MRg3lyyGAGUhMidkHi0
	 AUUhUOiQ+noP0cL8F4J3w1p7613IlE0i2hg2VPrDM77Kqatmjv4kOZhmoASwHZAy0K
	 lyn805L4CzuSg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tjM7S-004Pqp-81;
	Sat, 15 Feb 2025 17:38:22 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 10/14] KVM: arm64: Allow userspace to limit NV support to nVHE
Date: Sat, 15 Feb 2025 17:38:12 +0000
Message-Id: <20250215173816.3767330-11-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250215_093825_375793_32C0947E 
X-CRM114-Status: GOOD (  15.02  )
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

NV is hard. No kidding.

In order to make things simpler, we have established that NV would
support two mutually exclusive configurations:

- VHE-only, and supporting recursive virtualisation

- mVHE-only, and not supporting recursive virtualisation

For that purpose, introduce a new vcpu feature flag that denotes
the second configuration. We use this flag to limit the idregs
further.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/uapi/asm/kvm.h |  1 +
 arch/arm64/kvm/nested.c           | 28 ++++++++++++++++++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index 568bf858f3198..3bcab2a106c98 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -105,6 +105,7 @@ struct kvm_regs {
 #define KVM_ARM_VCPU_PTRAUTH_ADDRESS	5 /* VCPU uses address authentication */
 #define KVM_ARM_VCPU_PTRAUTH_GENERIC	6 /* VCPU uses generic authentication */
 #define KVM_ARM_VCPU_HAS_EL2		7 /* Support nested virtualization */
+#define KVM_ARM_VCPU_HAS_EL2_E2H0	8 /* Limit NV support to E2H RES0 */
 
 struct kvm_vcpu_init {
 	__u32 target;
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 96d1d300e79f9..5ec5acb6310e9 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -51,6 +51,10 @@ int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
 	struct kvm_s2_mmu *tmp;
 	int num_mmus, ret = 0;
 
+	if (test_bit(KVM_ARM_VCPU_HAS_EL2_E2H0, kvm->arch.vcpu_features) &&
+	    !cpus_have_final_cap(ARM64_HAS_HCR_NV1))
+		return -EINVAL;
+
 	/*
 	 * Let's treat memory allocation failures as benign: If we fail to
 	 * allocate anything, return an error and keep the allocated array
@@ -894,6 +898,9 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 			ID_AA64MMFR1_EL1_HPDS	|
 			ID_AA64MMFR1_EL1_VH	|
 			ID_AA64MMFR1_EL1_VMIDBits);
+		/* FEAT_E2H0 implies no VHE */
+		if (test_bit(KVM_ARM_VCPU_HAS_EL2_E2H0, kvm->arch.vcpu_features))
+			val &= ~ID_AA64MMFR1_EL1_VH;
 		break;
 
 	case SYS_ID_AA64MMFR2_EL1:
@@ -909,8 +916,25 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 		break;
 
 	case SYS_ID_AA64MMFR4_EL1:
-		val = SYS_FIELD_PREP_ENUM(ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY);
-		val |= SYS_FIELD_PREP_ENUM(ID_AA64MMFR4_EL1, E2H0, NI_NV1);
+		/*
+		 * You get EITHER
+		 *
+		 * - FEAT_VHE without FEAT_E2H0
+		 * - FEAT_NV limited to FEAT_NV2
+		 * - HCR_EL2.NV1 being RES0
+		 *
+		 * OR
+		 *
+		 * - FEAT_E2H0 without FEAT_VHE nor FEAT_NV
+		 *
+		 * Life is too short for anything else.
+		 */
+		if (test_bit(KVM_ARM_VCPU_HAS_EL2_E2H0, kvm->arch.vcpu_features)) {
+			val = 0;
+		} else {
+			val = SYS_FIELD_PREP_ENUM(ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY);
+			val |= SYS_FIELD_PREP_ENUM(ID_AA64MMFR4_EL1, E2H0, NI_NV1);
+		}
 		break;
 
 	case SYS_ID_AA64DFR0_EL1:
-- 
2.39.2


