Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECDDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 00:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/D7A+/K09S6yFl/i+7JwiO/DHtiAAbsIdjqdAGJ7jGk=; b=qVdVQvKdiS+9Ap+gYuaAerc4HS
	hWH1kFb7v09SS4N/9JShNpDPX+uvVl6VrQNw3NGTKgJB9NpDVBSjw4G3dtG/3Yg8IoPf2DKZ7U0L8
	a6SfclgiTeMOnTr0M/ue8NcUVXxjmi92wUFSQRTPNDh/oj094hTomRhfoUlJ+UgX4mbw51W4mWf13
	Qyc0ad/A4kh8XAvymW+btZKGonSex05v8gEn04jtKj8aGXWzCwC1U7E/sztY4QYm8PLZYCL061j7Z
	TXFfdruhA89CaH/SIx9/A5zcITfPcfVacBMpSYyBQBrN0/E0MVdtR2R7NC/dRAfOiun4spM4pr2Tv
	2EI0iVAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whd0w-00000000gg4-3q5Z;
	Thu, 09 Jul 2026 00:53:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whd0v-00000000gen-3ERy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 00:53:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B973601EC;
	Thu,  9 Jul 2026 00:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060F21F00A3E;
	Thu,  9 Jul 2026 00:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783558396;
	bh=/D7A+/K09S6yFl/i+7JwiO/DHtiAAbsIdjqdAGJ7jGk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dn3BlFbr4OQr/wWj5BmBh6vmdDgrvtJFvb0sabwYUfl0pYWznRxHmqY3AzLOWpYUu
	 aw89SCscuU67rZtYVK6KUvLWG9QHnn3V2biPczlFXyKmXpMCodkQme0w+PDYe7mfr8
	 +5T4D1ocQBrrCqk7RfjFGJXqiH3ypMMaBX6jrrLBH4kWqGLuHsN75rH0S/jkYEZIJf
	 ejzBAO4WYoOZAuaNhn7kM3pU3jlK0fvxeF3KJZllZZBX5MNOHfdnTktuOkJ6q4T8XV
	 7RHrGroj3cL4REzZ+fhrp2d0MDRXB+9YqenSf9EDYDIUnXtm2KWEp6kYwSeA2bu8cO
	 PBYpBk4OdK+/g==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2026 01:51:46 +0100
Subject: [PATCH v11 09/29] KVM: arm64: Define internal features for SME
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-kvm-arm64-sme-v11-9-32799f66db9d@kernel.org>
References: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3307; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sk5UV4D8nxCJMJ3xILivF4E7O/FkNOR/tMjqIGqB6Y0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqTvDAvOUf3jv8uMUbtqNwXLRoN4R9+X35Oq8jC
 ItLbLkgbnCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak7wwAAKCRAk1otyXVSH
 0De4B/9p8CgfD+bz8gqN1cuAN/ZFPUb1gU2XHN2SwfpuBr4VoN9DwCQu8K5OAOvOfE9ymVyhx0S
 M6TSupvQG/7dn4FCrq50tiFZpGUmLN4oJQnE75QuOx6EdUH0NI6siRB+VaEbt+EsHF0J9ubOozL
 lVuiVZEvXpbkBRlfHTynpjFTaoOX6TqFA8mU/GrZd+yrwwk6yt+t/5gMPlj9xLbuKBnpeEuS6nR
 iV5Ox6/hLZAS14ydZvw4g2AG/Q6uGwKR1KB3f6MEfbrjZXXKN7XnL+dsnfevIcr6uofyDFVHmEk
 Xsr82onsiyk6sJSXiXpGqPZZFf0svVXrMgmj5PLGNZ2MrbA0
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
index 8b746b1a1e53..8e185e43fbff 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -367,6 +367,8 @@ struct kvm_arch {
 #define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS		10
 	/* Unhandled SEAs are taken to userspace */
 #define KVM_ARCH_FLAG_EXIT_SEA				11
+	/* SME exposed to guest */
+#define KVM_ARCH_FLAG_GUEST_HAS_SME			12
 	unsigned long flags;
 
 	/* VM-wide vCPU feature set */
@@ -1133,7 +1135,16 @@ struct kvm_vcpu_arch {
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
@@ -1650,6 +1661,28 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
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
index b352cd323e30..ba8a3ed8f5ff 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2028,7 +2028,7 @@ static unsigned int sve_visibility(const struct kvm_vcpu *vcpu,
 static unsigned int sme_visibility(const struct kvm_vcpu *vcpu,
 				   const struct sys_reg_desc *rd)
 {
-	if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, SME, IMP))
+	if (vcpu_has_sme(vcpu))
 		return 0;
 
 	return REG_HIDDEN;

-- 
2.47.3


