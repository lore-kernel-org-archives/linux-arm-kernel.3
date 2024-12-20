Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F31DE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRxFT60RiXetagsX2aLRZ6/TrjtRxoconBmKNXu/Y6Y=; b=3t7jj7S90OdF42FNTH4ECqr9CP
	e/5Q7VwXfte3UNifJhUQzXdjLBm7ObiQoPmcH7SYC8VqZlhk4tTd879PTKfH576MVVkCtTIXmR1xq
	IcYhbPRmzfGGCyyzFBVxz8sG3ur+zXqmjUsS+0z3gdq/Rd5tPYLX9GdtTHQh4BVEjH07+5YEh38w3
	jxDZANamzQNKJRveKEm78kIMnEm8rSKBtvUN/N/lElXLOEPzjHoFI5Z87FY+Kdgc+Wui9MQK94cGh
	LMbACCc7ozc4exYMco0g+Xmj2KR54lMsBhXefLnSRKsVBv9lLVx3jUobgZC/n6IK+WDn2wTMmLZfW
	lOPIpXdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgYe-00000005adl-24t6;
	Fri, 20 Dec 2024 17:13:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgEM-00000005W21-3Jgp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:52:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9B516A4081B;
	Fri, 20 Dec 2024 16:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B4CC4CEDC;
	Fri, 20 Dec 2024 16:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734713521;
	bh=bf57/Mt8lkovk9yTZssGPdXZll/Sjexpxib+fRQYfOY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kC/tLDSQl2HZQDgFxku8z644+vm4uF7U5j/HxAXs/eEds3UqDpzlPZo71f8pFBFG2
	 u8YzAGod4rZDiBRBorz4VgkYlG6kV4f7Mw2U9iyC2yAjKXfa/i+fb6zGYeeR5qo8Nn
	 aE0WtAD7f141UoQIV7BdKVwDx87aIpOiRNyeua9fRG4I4HwWJHmXSJ2qYilSHVajMl
	 y7rsa2eo/78mwfKJ0jSQOVVvGKkcNZSXPJSq+H5RLVFaiUhgh/SUNydJcUFL/Pkj8p
	 i4ct6ksCigh51yqeXQ3rpAHv3S4xwXyFqATtEJqTTJb/FQFxewUOzexp6C0UnTeY5M
	 JKnI0Yf4vFssw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 20 Dec 2024 16:46:42 +0000
Subject: [PATCH RFC v3 17/27] KVM: arm64: Support TPIDR2_EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-kvm-arm64-sme-v3-17-05b018c1ffeb@kernel.org>
References: <20241220-kvm-arm64-sme-v3-0-05b018c1ffeb@kernel.org>
In-Reply-To: <20241220-kvm-arm64-sme-v3-0-05b018c1ffeb@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=4482; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bf57/Mt8lkovk9yTZssGPdXZll/Sjexpxib+fRQYfOY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnZaBhz28kj9hkbHjMLTSudh2GXiccrVHMInwBUooh
 +mbZBVKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ2WgYQAKCRAk1otyXVSH0IkLB/
 4zrC9EMskzptln4mEPPt0kerJH86JtWGK4Qv5qziXvaYzaKI8ZB0/+Hb2bKehkg9bH6DymfV7VLzPQ
 HT/1mWCt96XTe2R3/pMS6HVbuFVKqAGhtDdoL0qa73iQkRAHgWQzcuBqe5LdEYnGo7qtVs3nJyDwV5
 fSnOBMOGtljuA3aqtzQzJsJD1R1oSHZTKi0LWE2pfTrp5gQuVHAk68xg709FcTrIHjm6rw7wXMfI1M
 ZLtlOFVE6PuH+fio3zBOSyXBTAsjL4vwVDsPw3sd0ON/pN9HyKTU1cK88AWYA8m5U1PJQ5JKneu6gG
 KT1qvLysO4wyuioNxkNH5Te2VFLOMc
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_085202_972615_278FCCB1 
X-CRM114-Status: GOOD (  14.92  )
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

SME adds a new thread ID register, TPIDR2_EL0. This is used in userspace
for delayed saving of the ZA state but in terms of the architecture is
not really connected to SME other than being part of FEAT_SME. It has an
independent fine grained trap and the runtime connection with the rest
of SME is purely software defined.

Expose the register as a system register if the guest supports SME,
context switching it along with the other EL0 TPIDRs.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h          |  1 +
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 15 +++++++++++++++
 arch/arm64/kvm/sys_regs.c                  |  9 ++++++---
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 8d6342dde02fd99cfd7d2bedeccf0581ad3504ee..063b75eb4f3bc4fb425d2abc8118a950bccc2317 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -428,6 +428,7 @@ enum vcpu_sysreg {
 	CSSELR_EL1,	/* Cache Size Selection Register */
 	TPIDR_EL0,	/* Thread ID, User R/W */
 	TPIDRRO_EL0,	/* Thread ID, User R/O */
+	TPIDR2_EL0,	/* Thread ID, Register 2 */
 	TPIDR_EL1,	/* Thread ID, Privileged */
 	CNTKCTL_EL1,	/* Timer Control Register (EL1) */
 	PAR_EL1,	/* Physical Address Register */
diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index 8c234d53acb2753c59aa37d7a66f856f2eb87882..93d2b81e8d0678a16c88bda3549ee790db7f5bc2 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -66,6 +66,17 @@ static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt)
 	return kvm_has_s1poe(kern_hyp_va(vcpu->kvm));
 }
 
+static inline bool ctxt_has_sme(struct kvm_cpu_context *ctxt)
+{
+	struct kvm_vcpu *vcpu;
+
+	if (!system_supports_sme())
+		return false;
+
+	vcpu = ctxt_to_vcpu(ctxt);
+	return kvm_has_sme(kern_hyp_va(vcpu->kvm));
+}
+
 static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
 {
 	ctxt_sys_reg(ctxt, MDSCR_EL1)	= read_sysreg(mdscr_el1);
@@ -79,6 +90,8 @@ static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
 {
 	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
 	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
+	if (ctxt_has_sme(ctxt))
+		ctxt_sys_reg(ctxt, TPIDR2_EL0)	= read_sysreg_s(SYS_TPIDR2_EL0);
 }
 
 static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
@@ -148,6 +161,8 @@ static inline void __sysreg_restore_user_state(struct kvm_cpu_context *ctxt)
 {
 	write_sysreg(ctxt_sys_reg(ctxt, TPIDR_EL0),	tpidr_el0);
 	write_sysreg(ctxt_sys_reg(ctxt, TPIDRRO_EL0),	tpidrro_el0);
+	if (ctxt_has_sme(ctxt))
+		write_sysreg_s(ctxt_sys_reg(ctxt, TPIDR2_EL0), SYS_TPIDR2_EL0);
 }
 
 static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt,
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index a9429d9d63b54b5b4d4fe365aa6af4d84a256539..b5a38fc7a4a9ed4fce053018eb6ff353ae5c0d09 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2855,7 +2855,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	  .visibility = s1poe_visibility },
 	{ SYS_DESC(SYS_TPIDR_EL0), NULL, reset_unknown, TPIDR_EL0 },
 	{ SYS_DESC(SYS_TPIDRRO_EL0), NULL, reset_unknown, TPIDRRO_EL0 },
-	{ SYS_DESC(SYS_TPIDR2_EL0), undef_access },
+	{ SYS_DESC(SYS_TPIDR2_EL0), NULL, reset_unknown, TPIDR2_EL0,
+	  .visibility = sme_visibility},
 
 	{ SYS_DESC(SYS_SCXTNUM_EL0), undef_access },
 
@@ -4959,8 +4960,7 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
 				       HFGxTR_EL2_nMAIR2_EL1		|
 				       HFGxTR_EL2_nS2POR_EL1		|
 				       HFGxTR_EL2_nACCDATA_EL1		|
-				       HFGxTR_EL2_nSMPRI_EL1_MASK	|
-				       HFGxTR_EL2_nTPIDR2_EL0_MASK);
+				       HFGxTR_EL2_nSMPRI_EL1_MASK);
 
 	if (!kvm_has_feat(kvm, ID_AA64ISAR0_EL1, TLB, OS))
 		kvm->arch.fgu[HFGITR_GROUP] |= (HFGITR_EL2_TLBIRVAALE1OS|
@@ -5007,6 +5007,9 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
 		kvm->arch.fgu[HAFGRTR_GROUP] |= ~(HAFGRTR_EL2_RES0 |
 						  HAFGRTR_EL2_RES1);
 
+	if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, SME, IMP))
+		kvm->arch.fgu[HFGxTR_GROUP] |= HFGxTR_EL2_nTPIDR2_EL0;
+
 	set_bit(KVM_ARCH_FLAG_FGU_INITIALIZED, &kvm->arch.flags);
 out:
 	mutex_unlock(&kvm->arch.config_lock);

-- 
2.39.5


