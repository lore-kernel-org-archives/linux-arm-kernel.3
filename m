Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF48E6B26C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 01:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7+2rqRUUANLMW8RpuMBxtce56HpwdZxDAGgBNgtXng=; b=xo4+Q8qSXNZ6FEczH56k4wtf6d
	d5D39mS6FZ/T7o9Kypawggrjbvt0BUGFJeO65yVUKl1c2eAMPYAUAVo+KhhhivICWykPbpGZHhnFO
	1efIOItTQf4gtqKEmJF3/ooEarSbInGi6pVUcjDzoFRIk6rmuImfXjRH4NVfzD1Q476W6z0qUvprL
	OE23HNJ26X/yn58WnATiI9V5Vc83mvWXz3k0PicpMxeYVxH2rgYSstv6p9bbLICTgIk0Ts28qhwgv
	r0o4WGO4PoEG5tX+jXEcSwrks6aXZvDS3R5mLpuy5kJuhOSJy2WPifoKUx6DTatSfh6KOiNxSen+S
	nubyH2TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr6s-0000000EM4v-3vnR;
	Tue, 23 Dec 2025 01:22:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr6e-0000000ELrv-1WvW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 01:22:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E391643803;
	Tue, 23 Dec 2025 01:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9991C4CEF1;
	Tue, 23 Dec 2025 01:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766452951;
	bh=3jPYWgE8QXiAVkyVE4qnWscHg7eNT+ByK51GsqGhdIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TuBXtgo0rm9XW/eNw/CQfsFuZu/KY2uB5tvdU9VM+slBsB7p1pp0jMG8wrzi+xjMj
	 1e1ISygjBuOlwjqLhOS/K+USr/ndHVlja9Pd8plTfHjvFzfE1JeCqGnbKtBPvKn1JD
	 CLguQctMi7YDNO60BfpfnZ1TAB3JWwBYgNQyycrxXybkSASj18y3EKpwm0cB1RvUpG
	 frqLp2KHF4ffCwNxHn5Lxl7l0y4WZJ97wtxbL30F2roJ+YiBKifvFTadQQRYE6zI3N
	 Yf7od1mtD9K+rBHiNNZwr/Z1fvF2H2R0Pu9st7EjroMCExYYG3RMrs6dg2SHlCrhNj
	 +3etV8snmy1aA==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 23 Dec 2025 01:21:07 +0000
Subject: [PATCH v9 13/30] KVM: arm64: Store vector lengths in an array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-kvm-arm64-sme-v9-13-8be3867cb883@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11792; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3jPYWgE8QXiAVkyVE4qnWscHg7eNT+ByK51GsqGhdIs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpSe6M9UL73xNMaycdUMejSG7qAV1QzG2HMbrJr
 2z/RTE6RtGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaUnujAAKCRAk1otyXVSH
 0DzcB/0QOAxrJ1VeLE6ZZJHcraLLmX9G8IxEAZ+d2usaxW/SixgELrV63akP86PbUP9gJq9sCsO
 AgJBn9d/GzyLUSt4cxOn7zFoHOKOKPgusf0m1BY4INW8nLazy1CPJodJzFBb+spzrBb7CkaOMnY
 1Z5uxXSmdRpT3nTFQ03PXDPaoSKPjKm4fllVm0zbVh4/x8snIxQWOLvNSJlrqsgF3YXcYu080rO
 MdnC59B6GWUsAtHkGtQ61SXUjT5yWXe/VmBRkezxW8zTXkO3jC7+Mco7joosEqYPQ5RdY20DHzh
 yXJDZBSjN3N0CgQ7CfhJSBjRSPblMF+IFiYb3LKzxRd/MNh4
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_172232_493296_CF6FC403 
X-CRM114-Status: GOOD (  21.97  )
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

SME adds a second vector length configured in a very similar way to the
SVE vector length, in order to facilitate future code sharing for SME
refactor our storage of vector lengths to use an array like the host does.
We do not yet take much advantage of this so the intermediate code is not
as clean as might be.

No functional change.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h       | 17 +++++++++++------
 arch/arm64/include/asm/kvm_hyp.h        |  2 +-
 arch/arm64/include/asm/kvm_pkvm.h       |  2 +-
 arch/arm64/kvm/fpsimd.c                 |  2 +-
 arch/arm64/kvm/guest.c                  |  6 +++---
 arch/arm64/kvm/hyp/include/hyp/switch.h |  6 +++---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  6 +++---
 arch/arm64/kvm/hyp/nvhe/pkvm.c          |  7 ++++---
 arch/arm64/kvm/reset.c                  | 22 +++++++++++-----------
 9 files changed, 38 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 0816180dc551..3a3330b2a6a9 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -77,8 +77,10 @@ enum kvm_mode kvm_get_mode(void);
 static inline enum kvm_mode kvm_get_mode(void) { return KVM_MODE_NONE; };
 #endif
 
-extern unsigned int __ro_after_init kvm_sve_max_vl;
-extern unsigned int __ro_after_init kvm_host_sve_max_vl;
+extern unsigned int __ro_after_init kvm_max_vl[ARM64_VEC_MAX];
+extern unsigned int __ro_after_init kvm_host_max_vl[ARM64_VEC_MAX];
+DECLARE_STATIC_KEY_FALSE(userspace_irqchip_in_use);
+
 int __init kvm_arm_init_sve(void);
 
 u32 __attribute_const__ kvm_target_cpu(void);
@@ -811,7 +813,7 @@ struct kvm_vcpu_arch {
 	 */
 	void *sve_state;
 	enum fp_type fp_type;
-	unsigned int sve_max_vl;
+	unsigned int max_vl[ARM64_VEC_MAX];
 
 	/* Stage 2 paging state used by the hardware on next switch */
 	struct kvm_s2_mmu *hw_mmu;
@@ -1098,9 +1100,12 @@ struct kvm_vcpu_arch {
 
 /* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
 #define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +	\
-			     sve_ffr_offset((vcpu)->arch.sve_max_vl))
+			     sve_ffr_offset((vcpu)->arch.max_vl[ARM64_VEC_SVE]))
+
+#define vcpu_vec_max_vq(vcpu, type) sve_vq_from_vl((vcpu)->arch.max_vl[type])
+
+#define vcpu_sve_max_vq(vcpu)	vcpu_vec_max_vq(vcpu, ARM64_VEC_SVE)
 
-#define vcpu_sve_max_vq(vcpu)	sve_vq_from_vl((vcpu)->arch.sve_max_vl)
 
 #define vcpu_sve_zcr_elx(vcpu)						\
 	(unlikely(is_hyp_ctxt(vcpu)) ? ZCR_EL2 : ZCR_EL1)
@@ -1119,7 +1124,7 @@ struct kvm_vcpu_arch {
 	__size_ret;							\
 })
 
-#define vcpu_sve_state_size(vcpu) sve_state_size_from_vl((vcpu)->arch.sve_max_vl)
+#define vcpu_sve_state_size(vcpu) sve_state_size_from_vl((vcpu)->arch.max_vl[ARM64_VEC_SVE])
 
 /*
  * Only use __vcpu_sys_reg/ctxt_sys_reg if you know you want the
diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index 76ce2b94bd97..0317790dd3b7 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -146,6 +146,6 @@ extern u64 kvm_nvhe_sym(id_aa64smfr0_el1_sys_val);
 
 extern unsigned long kvm_nvhe_sym(__icache_flags);
 extern unsigned int kvm_nvhe_sym(kvm_arm_vmid_bits);
-extern unsigned int kvm_nvhe_sym(kvm_host_sve_max_vl);
+extern unsigned int kvm_nvhe_sym(kvm_host_max_vl[ARM64_VEC_MAX]);
 
 #endif /* __ARM64_KVM_HYP_H__ */
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 0aecd4ac5f45..0697c88f2210 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -167,7 +167,7 @@ static inline size_t pkvm_host_sve_state_size(void)
 		return 0;
 
 	return size_add(sizeof(struct cpu_sve_state),
-			SVE_SIG_REGS_SIZE(sve_vq_from_vl(kvm_host_sve_max_vl)));
+			SVE_SIG_REGS_SIZE(sve_vq_from_vl(kvm_host_max_vl[ARM64_VEC_SVE])));
 }
 
 struct pkvm_mapping {
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 9158353d8be3..1f4fcc8b5554 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -75,7 +75,7 @@ void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu)
 		 */
 		fp_state.st = &vcpu->arch.ctxt.fp_regs;
 		fp_state.sve_state = vcpu->arch.sve_state;
-		fp_state.sve_vl = vcpu->arch.sve_max_vl;
+		fp_state.sve_vl = vcpu->arch.max_vl[ARM64_VEC_SVE];
 		fp_state.sme_state = NULL;
 		fp_state.svcr = __ctxt_sys_reg(&vcpu->arch.ctxt, SVCR);
 		fp_state.fpmr = __ctxt_sys_reg(&vcpu->arch.ctxt, FPMR);
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 8c3405b5d7b1..456ef61b6ed5 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -318,7 +318,7 @@ static int get_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 	if (!vcpu_has_sve(vcpu))
 		return -ENOENT;
 
-	if (WARN_ON(!sve_vl_valid(vcpu->arch.sve_max_vl)))
+	if (WARN_ON(!sve_vl_valid(vcpu->arch.max_vl[ARM64_VEC_SVE])))
 		return -EINVAL;
 
 	memset(vqs, 0, sizeof(vqs));
@@ -356,7 +356,7 @@ static int set_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 		if (vq_present(vqs, vq))
 			max_vq = vq;
 
-	if (max_vq > sve_vq_from_vl(kvm_sve_max_vl))
+	if (max_vq > sve_vq_from_vl(kvm_max_vl[ARM64_VEC_SVE]))
 		return -EINVAL;
 
 	/*
@@ -375,7 +375,7 @@ static int set_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 		return -EINVAL;
 
 	/* vcpu->arch.sve_state will be alloc'd by kvm_vcpu_finalize_sve() */
-	vcpu->arch.sve_max_vl = sve_vl_from_vq(max_vq);
+	vcpu->arch.max_vl[ARM64_VEC_SVE] = sve_vl_from_vq(max_vq);
 
 	return 0;
 }
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index c5d5e5b86eaf..9ce53524d664 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -458,8 +458,8 @@ static inline void __hyp_sve_save_host(void)
 	struct cpu_sve_state *sve_state = *host_data_ptr(sve_state);
 
 	sve_state->zcr_el1 = read_sysreg_el1(SYS_ZCR);
-	write_sysreg_s(sve_vq_from_vl(kvm_host_sve_max_vl) - 1, SYS_ZCR_EL2);
-	__sve_save_state(sve_state->sve_regs + sve_ffr_offset(kvm_host_sve_max_vl),
+	write_sysreg_s(sve_vq_from_vl(kvm_host_max_vl[ARM64_VEC_SVE]) - 1, SYS_ZCR_EL2);
+	__sve_save_state(sve_state->sve_regs + sve_ffr_offset(kvm_host_max_vl[ARM64_VEC_SVE]),
 			 &sve_state->fpsr,
 			 true);
 }
@@ -514,7 +514,7 @@ static inline void fpsimd_lazy_switch_to_host(struct kvm_vcpu *vcpu)
 			zcr_el2 = vcpu_sve_max_vq(vcpu) - 1;
 			write_sysreg_el2(zcr_el2, SYS_ZCR);
 		} else {
-			zcr_el2 = sve_vq_from_vl(kvm_host_sve_max_vl) - 1;
+			zcr_el2 = sve_vq_from_vl(kvm_host_max_vl[ARM64_VEC_SVE]) - 1;
 			write_sysreg_el2(zcr_el2, SYS_ZCR);
 
 			zcr_el1 = vcpu_sve_max_vq(vcpu) - 1;
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index a7c689152f68..208e9042aca4 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -34,7 +34,7 @@ static void __hyp_sve_save_guest(struct kvm_vcpu *vcpu)
 	 */
 	sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
 	__sve_save_state(vcpu_sve_pffr(vcpu), &vcpu->arch.ctxt.fp_regs.fpsr, true);
-	write_sysreg_s(sve_vq_from_vl(kvm_host_sve_max_vl) - 1, SYS_ZCR_EL2);
+	write_sysreg_s(sve_vq_from_vl(kvm_host_max_vl[ARM64_VEC_SVE]) - 1, SYS_ZCR_EL2);
 }
 
 static void __hyp_sve_restore_host(void)
@@ -50,8 +50,8 @@ static void __hyp_sve_restore_host(void)
 	 * that was discovered, if we wish to use larger VLs this will
 	 * need to be revisited.
 	 */
-	write_sysreg_s(sve_vq_from_vl(kvm_host_sve_max_vl) - 1, SYS_ZCR_EL2);
-	__sve_restore_state(sve_state->sve_regs + sve_ffr_offset(kvm_host_sve_max_vl),
+	write_sysreg_s(sve_vq_from_vl(kvm_host_max_vl[ARM64_VEC_SVE]) - 1, SYS_ZCR_EL2);
+	__sve_restore_state(sve_state->sve_regs + sve_ffr_offset(kvm_host_max_vl[ARM64_VEC_SVE]),
 			    &sve_state->fpsr,
 			    true);
 	write_sysreg_el1(sve_state->zcr_el1, SYS_ZCR);
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index b402dcb7691e..f4ec6695a6a5 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -20,7 +20,7 @@ unsigned long __icache_flags;
 /* Used by kvm_get_vttbr(). */
 unsigned int kvm_arm_vmid_bits;
 
-unsigned int kvm_host_sve_max_vl;
+unsigned int kvm_host_max_vl[ARM64_VEC_MAX];
 
 /*
  * The currently loaded hyp vCPU for each physical CPU. Used in protected mode
@@ -450,7 +450,8 @@ static int pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *h
 	}
 
 	/* Limit guest vector length to the maximum supported by the host. */
-	sve_max_vl = min(READ_ONCE(host_vcpu->arch.sve_max_vl), kvm_host_sve_max_vl);
+	sve_max_vl = min(READ_ONCE(host_vcpu->arch.max_vl[ARM64_VEC_SVE]),
+			 kvm_host_max_vl[ARM64_VEC_SVE]);
 	sve_state_size = sve_state_size_from_vl(sve_max_vl);
 	sve_state = kern_hyp_va(READ_ONCE(host_vcpu->arch.sve_state));
 
@@ -464,7 +465,7 @@ static int pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *h
 		goto err;
 
 	vcpu->arch.sve_state = sve_state;
-	vcpu->arch.sve_max_vl = sve_max_vl;
+	vcpu->arch.max_vl[ARM64_VEC_SVE] = sve_max_vl;
 
 	return 0;
 err:
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index f7c63e145d54..a8684a1346ec 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -32,7 +32,7 @@
 
 /* Maximum phys_shift supported for any VM on this host */
 static u32 __ro_after_init kvm_ipa_limit;
-unsigned int __ro_after_init kvm_host_sve_max_vl;
+unsigned int __ro_after_init kvm_host_max_vl[ARM64_VEC_MAX];
 
 /*
  * ARMv8 Reset Values
@@ -46,14 +46,14 @@ unsigned int __ro_after_init kvm_host_sve_max_vl;
 #define VCPU_RESET_PSTATE_SVC	(PSR_AA32_MODE_SVC | PSR_AA32_A_BIT | \
 				 PSR_AA32_I_BIT | PSR_AA32_F_BIT)
 
-unsigned int __ro_after_init kvm_sve_max_vl;
+unsigned int __ro_after_init kvm_max_vl[ARM64_VEC_MAX];
 
 int __init kvm_arm_init_sve(void)
 {
 	if (system_supports_sve()) {
-		kvm_sve_max_vl = sve_max_virtualisable_vl();
-		kvm_host_sve_max_vl = sve_max_vl();
-		kvm_nvhe_sym(kvm_host_sve_max_vl) = kvm_host_sve_max_vl;
+		kvm_max_vl[ARM64_VEC_SVE] = sve_max_virtualisable_vl();
+		kvm_host_max_vl[ARM64_VEC_SVE] = sve_max_vl();
+		kvm_nvhe_sym(kvm_host_max_vl[ARM64_VEC_SVE]) = kvm_host_max_vl[ARM64_VEC_SVE];
 
 		/*
 		 * The get_sve_reg()/set_sve_reg() ioctl interface will need
@@ -61,16 +61,16 @@ int __init kvm_arm_init_sve(void)
 		 * order to support vector lengths greater than
 		 * VL_ARCH_MAX:
 		 */
-		if (WARN_ON(kvm_sve_max_vl > VL_ARCH_MAX))
-			kvm_sve_max_vl = VL_ARCH_MAX;
+		if (WARN_ON(kvm_max_vl[ARM64_VEC_SVE] > VL_ARCH_MAX))
+			kvm_max_vl[ARM64_VEC_SVE] = VL_ARCH_MAX;
 
 		/*
 		 * Don't even try to make use of vector lengths that
 		 * aren't available on all CPUs, for now:
 		 */
-		if (kvm_sve_max_vl < sve_max_vl())
+		if (kvm_max_vl[ARM64_VEC_SVE] < sve_max_vl())
 			pr_warn("KVM: SVE vector length for guests limited to %u bytes\n",
-				kvm_sve_max_vl);
+				kvm_max_vl[ARM64_VEC_SVE]);
 	}
 
 	return 0;
@@ -78,7 +78,7 @@ int __init kvm_arm_init_sve(void)
 
 static void kvm_vcpu_enable_sve(struct kvm_vcpu *vcpu)
 {
-	vcpu->arch.sve_max_vl = kvm_sve_max_vl;
+	vcpu->arch.max_vl[ARM64_VEC_SVE] = kvm_max_vl[ARM64_VEC_SVE];
 
 	/*
 	 * Userspace can still customize the vector lengths by writing
@@ -99,7 +99,7 @@ static int kvm_vcpu_finalize_vec(struct kvm_vcpu *vcpu)
 	size_t reg_sz;
 	int ret;
 
-	vl = vcpu->arch.sve_max_vl;
+	vl = vcpu->arch.max_vl[ARM64_VEC_SVE];
 
 	/*
 	 * Responsibility for these properties is shared between

-- 
2.47.3


