Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FDECA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 06:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsjfZZlbODN4awwj5xJvP6IJw7ZgyuvIZmE3mis7KCs=; b=MUsWCyTNogJTh2Bb1vwnVnBNB3
	R5nhJ8//8vUPrxymvC5UGEI26yECT+vWjKwO4ONcaZBHaMP2hBN0O3gw0TmfE/zR+q+MnYXc5LQMw
	EsGemKfIHy+DofmvKBKGK3KVK8pkxZzZtyDcwqHIC8vll/fMrWQUW1cWtNQ0ZJ46gRpALiYFktRKx
	hv+tn92xOIPIl1AbMkHy9MR+68/oPFXswHxfOTtzCnQCMJZSki7UkZ/Ol/WJHVNZsjgcixQcRR78j
	6IiNBHYPcu4KKuA+Vy+RLVAgp1qxr2eGGkuH7btMWy5SACGdAH3wauf/V5V5RtBARAz8RZU2SZ+o6
	DasAx16A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLfV-00000001kmq-0z84;
	Fri, 22 Aug 2025 06:54:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upGzp-00000001Bd5-1xgN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 01:55:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E400F60243;
	Fri, 22 Aug 2025 01:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E793C116C6;
	Fri, 22 Aug 2025 01:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755827712;
	bh=m/G5Vt7qKGaxjn4aWQkuI02V12W35pAJXakUbFGbMwk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TBs7dgTiwh33hv551ZAHacgP58uPQrtlwAfievM10cbZMLZ6YvFe0/4cWcjLdNqKv
	 dJ4nWR4GbklXM+OfJFVpW2MNG5aINaEaqFCT11dCcs7yotRGqQ+t20BlNQ89MUDO37
	 PlyRSDmZu0o97E8JGQBhESKEeclK5695cI8l3No9RrkNEBIVGxLe/AYjXdCpSihg+v
	 eAfuKZSSPO1+SnzEm0k+XkMPYcELOybFb+GpNhMxqQ4c/0K1UORwcT+1qVDkkwGcim
	 Wd88UwLTwgOZVFkjCUBv6cgVT0KMMCj7PFpznXBKnmwZu9q9KbJDUnOqryyM+1U8vK
	 84TmF+ba+wTlA==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 22 Aug 2025 02:53:41 +0100
Subject: [PATCH v7 12/29] KVM: arm64: Define internal features for SME
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-kvm-arm64-sme-v7-12-7a65d82b8b10@kernel.org>
References: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
In-Reply-To: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
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
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=3292; i=broonie@kernel.org;
 h=from:subject:message-id; bh=m/G5Vt7qKGaxjn4aWQkuI02V12W35pAJXakUbFGbMwk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBop83BBFv+sv999YKibb/D21tUr8ymdJtyRKoBm
 AXXkUQkZIiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKfNwQAKCRAk1otyXVSH
 0I9YB/kBcl0vQdFBdBbs73JgIp62ggW/IZ29f+yPbCDfX/xl6R7HQpRZ6rpNdjHvCGis+jqrVK3
 yH/TUy+BfbwkLoPMvcmkg9SUIaK3fHROvZx4OIzZ62tF/7nOUuNyuhVV+dFMPBVHrhNFlH2qGcE
 8Zb7gAVFDJYJcc11evXdHOYEL+d9r1MbluwaaYif1CkpTbZFxLMzZ1EZkSYq+kQzwCuxT4mCw6M
 vNsdKaUOX246fbmk87gboKH3UThG0RBjafi8s3I1Z4M8Q6d6ous25bjLykInO1UsvReOAkFawcX
 mSS0rXhzHhu+cIhIPcsL83JiKp+ZkG4GoFX435g9w3fnx1FR
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
the feature detection for SME and it's subfeatures.  Due to the need for
vector length configuration we define a flag for SME like for SVE.  We
also have two subfeatures which add architectural state, FA64 and SME2,
which are configured via the normal ID register scheme.

Also provide helpers which check if the vCPU is in streaming mode or has
ZA enabled.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 35 ++++++++++++++++++++++++++++++++++-
 arch/arm64/kvm/sys_regs.c         |  2 +-
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 88d184aac789..98761b601457 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -355,6 +355,8 @@ struct kvm_arch {
 #define KVM_ARCH_FLAG_GUEST_HAS_SVE			9
 	/* MIDR_EL1, REVIDR_EL1, and AIDR_EL1 are writable from userspace */
 #define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS		10
+	/* SME exposed to guest */
+#define KVM_ARCH_FLAG_GUEST_HAS_SME			11
 	unsigned long flags;
 
 	/* VM-wide vCPU feature set */
@@ -1059,7 +1061,16 @@ struct kvm_vcpu_arch {
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
@@ -1705,6 +1716,28 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
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
index 82ffb3b3b3cf..111b07a78787 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1782,7 +1782,7 @@ static unsigned int sve_visibility(const struct kvm_vcpu *vcpu,
 static unsigned int sme_visibility(const struct kvm_vcpu *vcpu,
 				   const struct sys_reg_desc *rd)
 {
-	if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, SME, IMP))
+	if (vcpu_has_sme(vcpu))
 		return 0;
 
 	return REG_HIDDEN;

-- 
2.39.5


