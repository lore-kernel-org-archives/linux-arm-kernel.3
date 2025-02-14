Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730F8C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 02:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19qGFbGHz08KM3d9ERMgtvcNTb3ko33bCLMVj/P1y5U=; b=oN9eGhfbC9Bpd0gbMaJvPQPyQx
	yB+RtGNMBiUZyxxhziRTlhpB/31zQaUrPKbNDaVptqfkHvhDYb3bdd7oQ5uMsik01AOm9Ofug7UHt
	LPqo2jyVdN3uMrJhKEF6EEwHNvuu5sWgp9kloaFuEAt8HS4MNBrp68wD1my856vEjXS34+fpJj0DH
	s/RXMIuZStf3VViKt1+x3K9WdMj6eJbgKjMFkxh3R5OCWTGgdu1h25g1zO0J957PNKizaciHhpFEM
	ER4TW2McHghTZ61AaVvc/tmwwEikjF1c9Jny4h5bAfSfUCK2d5HpkAIGWQRoVtd5sXIwVfFBq2y0F
	GgwLqeFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tilKV-0000000DKch-3gB2;
	Fri, 14 Feb 2025 02:21:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1til1a-0000000DFP1-165g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 02:01:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1AA445C5D2C;
	Fri, 14 Feb 2025 02:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F54C4CEE8;
	Fri, 14 Feb 2025 02:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739498509;
	bh=GuWrMzYMv30MyOuz8QmLC5BbCjRiVvr/3ixjt4maNuo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fVB5tNyXRl1qqEzv9qBQIMgOuegKIFNPeB6NAoLg+nDaO7TqgLd5FVBh5oB0gTHqG
	 K1lBZgtSxQGOaga5W/C1M/nphDOSGCmp/I6H41mC/MJP2Ng/a7sk40WFXxQRDPxMou
	 Rq/yLYH8sQyTE8Ps+MV6tcfooxuQuAFtejr/PhpuqKdBlyvv4SeNEcSqmin8aMs+zA
	 waJhOwlnB+R3ubLHAxkhQlgII/b73EFWhfCfDb0twhKGgJeXwuJ/nmYT4wlKXkefIr
	 XTJj17D5Aos4qQffoK/Pc7GF34pCoYnUCuIqnL+z48DKNE/zi+tuRknxgj4CKPS75B
	 0SmO+iGfd8F7Q==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 14 Feb 2025 01:57:56 +0000
Subject: [PATCH v4 13/27] KVM: arm64: Store vector lengths in an array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-kvm-arm64-sme-v4-13-d64a681adcc2@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12082; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GuWrMzYMv30MyOuz8QmLC5BbCjRiVvr/3ixjt4maNuo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnrqPK9S643LEgi4MEPAawDBMbtXLW5be2jRkrjSWb
 Z47BF06JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ66jygAKCRAk1otyXVSH0AT8CA
 CDdDLivP9ekZLnciBIA474rLH9dZWrJYusSFoCaDv/IGW/bAv7mLDSAECI5ahDt8Z2o094hBJpSYfx
 eSAXgee+j6D7P+MvSzjXOpq4Rq218PR6zUwPWCCaRHt8v1ar0gfsWu13SV60YEAQW7bCNf1FlNbFhG
 RqBfNLHUh68+TQKklhlRrzeAuYTWotQA3SjtCm2jDoyuB6vId4g3YdWXEzGL2UNoSzQfkplPKszujG
 yMJkJwsLaDyVs1b/82SkOFnUiETKnd4JV8BX/sT9S4NSOSPDiBPmnxwf1qUrczZrW6zfFpxWDlDEX1
 qgDVw0lQU2APpmiExmMYralfj0I55W
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_180150_424540_83DB43B2 
X-CRM114-Status: GOOD (  22.29  )
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
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  9 +++++----
 arch/arm64/kvm/hyp/nvhe/pkvm.c          |  2 +-
 arch/arm64/kvm/reset.c                  | 22 +++++++++++-----------
 9 files changed, 37 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 55ada264b7383925269674a47446b8f659a7e4e6..84aa728718e13b99b4f17f5fdffa81e380834e69 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -74,8 +74,10 @@ enum kvm_mode kvm_get_mode(void);
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
@@ -716,7 +718,7 @@ struct kvm_vcpu_arch {
 	 */
 	void *sve_state;
 	enum fp_type fp_type;
-	unsigned int sve_max_vl;
+	unsigned int max_vl[ARM64_VEC_MAX];
 
 	/* Stage 2 paging state used by the hardware on next switch */
 	struct kvm_s2_mmu *hw_mmu;
@@ -977,9 +979,12 @@ struct kvm_vcpu_arch {
 
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
@@ -988,7 +993,7 @@ struct kvm_vcpu_arch {
 	size_t __size_ret;						\
 	unsigned int __vcpu_vq;						\
 									\
-	if (WARN_ON(!sve_vl_valid((vcpu)->arch.sve_max_vl))) {		\
+	if (WARN_ON(!sve_vl_valid((vcpu)->arch.max_vl[ARM64_VEC_SVE]))) { \
 		__size_ret = 0;						\
 	} else {							\
 		__vcpu_vq = vcpu_sve_max_vq(vcpu);			\
diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index c838309e4ec47e395d78127a8ee6bad8390c4411..21943cb98542750a1b626a8de6bbc095d7770ccf 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -143,6 +143,6 @@ extern u64 kvm_nvhe_sym(id_aa64smfr0_el1_sys_val);
 
 extern unsigned long kvm_nvhe_sym(__icache_flags);
 extern unsigned int kvm_nvhe_sym(kvm_arm_vmid_bits);
-extern unsigned int kvm_nvhe_sym(kvm_host_sve_max_vl);
+extern unsigned int kvm_nvhe_sym(kvm_host_max_vl[ARM64_VEC_MAX]);
 
 #endif /* __ARM64_KVM_HYP_H__ */
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index eb65f12e81d90939de45f0c6e59f0777a1f3f78f..950aa6a7d2c0fd41ac9ddfc374681a41cca97d4f 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -159,7 +159,7 @@ static inline size_t pkvm_host_sve_state_size(void)
 		return 0;
 
 	return size_add(sizeof(struct cpu_sve_state),
-			SVE_SIG_REGS_SIZE(sve_vq_from_vl(kvm_host_sve_max_vl)));
+			SVE_SIG_REGS_SIZE(sve_vq_from_vl(kvm_host_max_vl[ARM64_VEC_SVE])));
 }
 
 struct pkvm_mapping {
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index f324990a400293976fd505442f9eaccc6d01ed8f..656e02312a5991419bfc3c22193b6b9b4354be64 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -106,7 +106,7 @@ void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu)
 		 */
 		fp_state.st = &vcpu->arch.ctxt.fp_regs;
 		fp_state.sve_state = vcpu->arch.sve_state;
-		fp_state.sve_vl = vcpu->arch.sve_max_vl;
+		fp_state.sve_vl = vcpu->arch.max_vl[ARM64_VEC_SVE];
 		fp_state.sme_state = NULL;
 		fp_state.svcr = &__vcpu_sys_reg(vcpu, SVCR);
 		fp_state.fpmr = &__vcpu_sys_reg(vcpu, FPMR);
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index bb4b91e4392359026a4115468138f16f48a5b850..e9f17b8a6fba476a472d3f09691611228ee9d203 100644
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
index c24e418cec101433f7484eb4f7af788c474eda3a..2c2e22d86a2353531efa49187fe80acb01d31d20 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -370,8 +370,8 @@ static inline void __hyp_sve_save_host(void)
 	struct cpu_sve_state *sve_state = *host_data_ptr(sve_state);
 
 	sve_state->zcr_el1 = read_sysreg_el1(SYS_ZCR);
-	write_sysreg_s(sve_vq_from_vl(kvm_host_sve_max_vl) - 1, SYS_ZCR_EL2);
-	__sve_save_state(sve_state->sve_regs + sve_ffr_offset(kvm_host_sve_max_vl),
+	write_sysreg_s(sve_vq_from_vl(kvm_host_max_vl[ARM64_VEC_SVE]) - 1, SYS_ZCR_EL2);
+	__sve_save_state(sve_state->sve_regs + sve_ffr_offset(kvm_host_max_vl[ARM64_VEC_SVE]),
 			 &sve_state->fpsr,
 			 true);
 }
@@ -426,7 +426,7 @@ static inline void fpsimd_lazy_switch_to_host(struct kvm_vcpu *vcpu)
 			zcr_el2 = vcpu_sve_max_vq(vcpu) - 1;
 			write_sysreg_el2(zcr_el2, SYS_ZCR);
 		} else {
-			zcr_el2 = sve_vq_from_vl(kvm_host_sve_max_vl) - 1;
+			zcr_el2 = sve_vq_from_vl(kvm_host_max_vl[ARM64_VEC_SVE]) - 1;
 			write_sysreg_el2(zcr_el2, SYS_ZCR);
 
 			zcr_el1 = vcpu_sve_max_vq(vcpu) - 1;
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 2c37680d954cf2c2aed5abe7c2225b682861869a..a4ba03380d6e1049a5453772fa5291b08c1f70c1 100644
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
@@ -125,7 +125,8 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	hyp_vcpu->vcpu.arch.sve_state	= kern_hyp_va(host_vcpu->arch.sve_state);
 	/* Limit guest vector length to the maximum supported by the host.  */
-	hyp_vcpu->vcpu.arch.sve_max_vl	= min(host_vcpu->arch.sve_max_vl, kvm_host_sve_max_vl);
+	hyp_vcpu->vcpu.arch.max_vl[ARM64_VEC_SVE] = min(host_vcpu->arch.max_vl[ARM64_VEC_SVE],
+							kvm_host_max_vl[ARM64_VEC_SVE]);
 
 	hyp_vcpu->vcpu.arch.mdcr_el2	= host_vcpu->arch.mdcr_el2;
 	hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE);
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 5896e581c1fac943cf372f1df24311ef43529d62..2a2f932143d5e5b2164162422ba6cf0e6731b13a 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -20,7 +20,7 @@ unsigned long __icache_flags;
 /* Used by kvm_get_vttbr(). */
 unsigned int kvm_arm_vmid_bits;
 
-unsigned int kvm_host_sve_max_vl;
+unsigned int kvm_host_max_vl[ARM64_VEC_MAX];
 
 /*
  * The currently loaded hyp vCPU for each physical CPU. Used only when
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index ce726b1d4e8e90cfd4459a6cb9c67b8805424e22..3cb91dc6dc3dc5cc484900dbd9f4cdfedb3e2b4a 100644
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
2.39.5


