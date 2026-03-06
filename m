Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399E4FCB637
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yl5Yx4/qRRm3QRBw1pKbbXHXP9ae4u4rxYcd1+aFtfw=; b=ITDqEBHGoaz/hcNigZzK3aRqE0
	IMB1gXINBBfn1O/mbyvrEIIuiCXdj3de3aDYT04Vv/UO77fbh1jcVnaQJUmKN8ijBSqXAmlahejXL
	3TI+joSsVSdNKAHQTjCRG3+Jkbo+QqAV9TsHtlqKpWx++4OuG9rhIgmNz9mHydUwJlpm13Iaa7OXV
	15CPqENz1Wx65H2kMp2W0S5MsWTmZhJaa6/OE+Ui9NgPnYsGOWMPwhKueOWrO0qe1HnCxV6i0RmYM
	7iz2cI9JvJaDLqgkM0Cv2E5PESEw2zUC6KhaMVpTPEQef23/2d0Naq3XFe2JbBRYB4KXJ7n7vDNhE
	qTpJpvEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYgi-00000004D1O-0Jqz;
	Fri, 06 Mar 2026 17:10:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYgf-00000004Cz3-2w0W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:10:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 247D36012A;
	Fri,  6 Mar 2026 17:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB07EC4CEF7;
	Fri,  6 Mar 2026 17:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772817005;
	bh=BKO7iJk2IhyUeOcAxAzJmMDV35mroMAKYnKUOQP13Fg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MG50ustpwFvAzXQGd6PIyWdUQ1JjYf+8iyfc39XPB/5PeuukLDErjQPbx9CXUc++f
	 QwmpTbfk3jTfCW9UouegSufW5mbxbfdvM/VO/QpTN29279upIjNrQdBGdTA3K/tmoF
	 FwTSLZllP04HGT0DEU2dVpA21bbbcwrsBV7RwR5IwUNhWG1zHgA/Ce4saQJiGUC/mv
	 bWDoJ8sTrf51Ij/w351vm/2E9kKDr7OMJzL6K6MYbRPenKQTR5mQFCjpc5JkhZhKlW
	 p9JUII/LPB+9t3cA0GmrgPkPuPLabb059Ccdg6BG00WMLCFVavDkDO37iSVHuUilxT
	 tQ/Hv/LH//7wg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 06 Mar 2026 17:01:01 +0000
Subject: [PATCH v10 09/30] KVM: arm64: Define internal features for SME
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-kvm-arm64-sme-v10-9-43f7683a0fb7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3307; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BKO7iJk2IhyUeOcAxAzJmMDV35mroMAKYnKUOQP13Fg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpqwovGjatnkSdoMG1R7IqeeLHYVyk4vOq/u0bv
 10T1mcq7eaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaasKLwAKCRAk1otyXVSH
 0PrrB/9Hg8AGVXjAruDGgoXORBmhD7QMKXYrUDcD4+9YqTX1wkK6LYvmJgAZfl/sZ0mHV8RsAkw
 3ebwtOUYs0sbSxewQPIqq2jCubvEfdnPKeqNRavQFEjKDqit4frkvcEeFCoZYuVCBUcK9Ybk6wb
 QzHyZ9vwfORoX7sIKQsjk1B9rLnyZakOQC+Z8RmldljooFyMh2r2i4OdRAhBEIK11JR24Chj4ie
 9uipE0mCRmBVr6uglVJjXmT3uCxOilPoTNR7Z+sAfFwsBVUXa5uTjp12vQPc/c76BB6P3D7TUuv
 Kb8wyVDEooOzlOV4F2Tc3NYQB03qfbmtbiLYqIa5Hgn/IxQy
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

In order to simplify interdependencies in the rest of the series define
the feature detection for SME and its subfeatures.  Due to the need for
vector length configuration we define a flag for SME like for SVE.  We
also have two subfeatures which add architectural state, FA64 and SME2,
which are configured via the normal ID register scheme.

Also provide helpers which check if the vCPU is in streaming mode or has
ZA enabled.

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 35 ++++++++++++++++++++++++++++++++++-
 arch/arm64/kvm/sys_regs.c         |  2 +-
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 656464179ba8..906dbefc5b33 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -353,6 +353,8 @@ struct kvm_arch {
 #define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS		10
 	/* Unhandled SEAs are taken to userspace */
 #define KVM_ARCH_FLAG_EXIT_SEA				11
+	/* SME exposed to guest */
+#define KVM_ARCH_FLAG_GUEST_HAS_SME			12
 	unsigned long flags;
 
 	/* VM-wide vCPU feature set */
@@ -1086,7 +1088,16 @@ struct kvm_vcpu_arch {
 #define vcpu_has_sve(vcpu)	kvm_has_sve((vcpu)->kvm)
 #endif
 
-#define vcpu_has_vec(vcpu) vcpu_has_sve(vcpu)
+#define kvm_has_sme(kvm)	(system_supports_sme() &&		\
+				 test_bit(KVM_ARCH_FLAG_GUEST_HAS_SME, &(kvm)->arch.flags))
+
+#ifdef __KVM_NVHE_HYPERVISOR__
+#define vcpu_has_sme(vcpu)	kvm_has_sme(kern_hyp_va((vcpu)->kvm))
+#else
+#define vcpu_has_sme(vcpu)	kvm_has_sme((vcpu)->kvm)
+#endif
+
+#define vcpu_has_vec(vcpu) (vcpu_has_sve(vcpu) || vcpu_has_sme(vcpu))
 
 #ifdef CONFIG_ARM64_PTR_AUTH
 #define vcpu_has_ptrauth(vcpu)						\
@@ -1627,6 +1638,28 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 #define kvm_has_sctlr2(k)				\
 	(kvm_has_feat((k), ID_AA64MMFR3_EL1, SCTLRX, IMP))
 
+#define kvm_has_fa64(k)					\
+	(system_supports_fa64() &&			\
+	 kvm_has_feat((k), ID_AA64SMFR0_EL1, FA64, IMP))
+
+#define kvm_has_sme2(k)					\
+	(system_supports_sme2() &&			\
+	 kvm_has_feat((k), ID_AA64PFR1_EL1, SME, SME2))
+
+#ifdef __KVM_NVHE_HYPERVISOR__
+#define vcpu_has_sme2(vcpu)	kvm_has_sme2(kern_hyp_va((vcpu)->kvm))
+#define vcpu_has_fa64(vcpu)	kvm_has_fa64(kern_hyp_va((vcpu)->kvm))
+#else
+#define vcpu_has_sme2(vcpu)	kvm_has_sme2((vcpu)->kvm)
+#define vcpu_has_fa64(vcpu)	kvm_has_fa64((vcpu)->kvm)
+#endif
+
+#define vcpu_in_streaming_mode(vcpu) \
+	(__vcpu_sys_reg(vcpu, SVCR) & SVCR_SM_MASK)
+
+#define vcpu_za_enabled(vcpu) \
+	(__vcpu_sys_reg(vcpu, SVCR) & SVCR_ZA_MASK)
+
 static inline bool kvm_arch_has_irq_bypass(void)
 {
 	return true;
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 1b4cacb6e918..f94fe57adcad 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1948,7 +1948,7 @@ static unsigned int sve_visibility(const struct kvm_vcpu *vcpu,
 static unsigned int sme_visibility(const struct kvm_vcpu *vcpu,
 				   const struct sys_reg_desc *rd)
 {
-	if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, SME, IMP))
+	if (vcpu_has_sme(vcpu))
 		return 0;
 
 	return REG_HIDDEN;

-- 
2.47.3


