Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB15CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 06:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBpR0hcCLlZB27uUWF3895Xn+8vyX2GTzJaN8eQqtEs=; b=vzu5u7VGprvAO4B+oTGgAbVRR+
	g2YYICFVpd2iKkPHo6ENlSDXaIsECd5ma6sMkPv3KAPulSlyw9wUeKL5+FYhHhqXHdDpEbIqpziSD
	wefJskzaUdgIm6nPrTXjOFXBhmp/bWKEQWhqSbZBjuUS8URJxgdoP8Dsjj/5ag9SiX9PgUNW9x5S0
	4ucE2IQW8B4TkGAyJ1QzGEJulV2Po6hM3jDN66EZXWeT5dLhYslLNm4ZcUWnx85+z5/bsOUk0w47m
	5qC+3Xrz0f/wJczO9WQbsWiW5y2RqmT2i+QIX+Ez80eU53J0gBrd+oxaGOGBD2HMQONcxmkacr+hk
	rCE1ppqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLXj-00000001jYL-1lYP;
	Fri, 22 Aug 2025 06:46:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upGzh-00000001BbK-2Le7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 01:55:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47CE644070;
	Fri, 22 Aug 2025 01:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C74C4CEEB;
	Fri, 22 Aug 2025 01:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755827705;
	bh=8axVTKd1b6ikITueHwT3N1OlRgy3HWVT9HvnlpgFOig=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cVRzBFtNfZtKHMbH1kFwUNYEkFtK3sWmzpCkwUXavdCH8w6CqVFTzXnB1XAciAHKi
	 hxAdIGPCeqMaXUolOECq/WnrCpPY9gcRtlx14lI7tAtZ5/wz8fFo9WBRrQcTLddYYm
	 f9Ts3xWFPtEr5Y4a6T+C58cBFzSA/hYfuDiGByYiTohKsdTfwTY3CLVMsvFvygA3hm
	 tlPMgJHmWcuu81ppvwvIXaN+xPg7mkZT22b/iVu5KmX6KXRQyC9bbBprzEHnMzOKFL
	 na+iseeWX85VNtnQRmW9yxupRMniqvs0fj4AtSmDKop1v7NrHKvvXjN1Nu9XA8e+ga
	 znefzEWP9Ib8A==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 22 Aug 2025 02:53:39 +0100
Subject: [PATCH v7 10/29] KVM: arm64: Rename SVE finalization constants to
 be more general
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-kvm-arm64-sme-v7-10-7a65d82b8b10@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7220; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8axVTKd1b6ikITueHwT3N1OlRgy3HWVT9HvnlpgFOig=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBop83AJO0OzincENy0qWeaLvGbxvOYJ6wSSXwb3
 xsJi/j2faKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKfNwAAKCRAk1otyXVSH
 0OHvB/9mLghKYcWpzI+mdVz6pXmWpG7NtW8FvtX8lILx5HOhHFGjM7E7twcW4tqxPlsydap/NEQ
 0zES7O2++LoEDSiLMeY6R49LuXY/w4QmiAh5g/FVave5iyupE6XvnkuCiNWesY+w4WqHzfkCFVy
 9HhwXXZOjoxGLZb8tktVqXxVwOXOHd8owPE4Ov+VClG4CqgsBdBPVob5RHwWVgGZksdZUz3b7yn
 TQqLddg/jwxLcfEjkA2ZFWZK1Eaye4VCUlRvJXpvKXQRaYp9C0F9LE/siRN3jsuCrdpvrQYoe1x
 zqwus8RNpb98/vvT/XbmhIRyd+pFHvwQd4nHmjhKtJQWKczT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_185505_647106_BDB7E157 
X-CRM114-Status: GOOD (  20.14  )
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

Due to the overlap between SVE and SME vector length configuration
created by streaming mode SVE we will finalize both at once.  Rename the
existing finalization to use _VEC (vector) for the naming to avoid
confusion.

Since this includes the userspace API we create an alias
KVM_ARM_VCPU_VEC for the existing KVM_ARM_VCPU_SVE capability, existing
code which does not enable SME will be unaffected and any SME only code
will not need to use SVE constants.

No functional change.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  8 +++++---
 arch/arm64/include/uapi/asm/kvm.h |  6 ++++++
 arch/arm64/kvm/guest.c            | 10 +++++-----
 arch/arm64/kvm/hyp/nvhe/pkvm.c    |  2 +-
 arch/arm64/kvm/reset.c            | 20 ++++++++++----------
 5 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 8f48c2a488f7..88d184aac789 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -985,8 +985,8 @@ struct kvm_vcpu_arch {
 
 /* KVM_ARM_VCPU_INIT completed */
 #define VCPU_INITIALIZED	__vcpu_single_flag(cflags, BIT(0))
-/* SVE config completed */
-#define VCPU_SVE_FINALIZED	__vcpu_single_flag(cflags, BIT(1))
+/* Vector config completed */
+#define VCPU_VEC_FINALIZED	__vcpu_single_flag(cflags, BIT(1))
 /* pKVM VCPU setup completed */
 #define VCPU_PKVM_FINALIZED	__vcpu_single_flag(cflags, BIT(2))
 
@@ -1059,6 +1059,8 @@ struct kvm_vcpu_arch {
 #define vcpu_has_sve(vcpu)	kvm_has_sve((vcpu)->kvm)
 #endif
 
+#define vcpu_has_vec(vcpu) vcpu_has_sve(vcpu)
+
 #ifdef CONFIG_ARM64_PTR_AUTH
 #define vcpu_has_ptrauth(vcpu)						\
 	((cpus_have_final_cap(ARM64_HAS_ADDRESS_AUTH) ||		\
@@ -1561,7 +1563,7 @@ struct kvm *kvm_arch_alloc_vm(void);
 int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature);
 bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
 
-#define kvm_arm_vcpu_sve_finalized(vcpu) vcpu_get_flag(vcpu, VCPU_SVE_FINALIZED)
+#define kvm_arm_vcpu_vec_finalized(vcpu) vcpu_get_flag(vcpu, VCPU_VEC_FINALIZED)
 
 #define kvm_has_mte(kvm)					\
 	(system_supports_mte() &&				\
diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index ed5f3892674c..4d789871bec1 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -107,6 +107,12 @@ struct kvm_regs {
 #define KVM_ARM_VCPU_HAS_EL2		7 /* Support nested virtualization */
 #define KVM_ARM_VCPU_HAS_EL2_E2H0	8 /* Limit NV support to E2H RES0 */
 
+/*
+ * An alias for _SVE since we finalize VL configuration for both SVE and SME
+ * simultaneously.
+ */
+#define KVM_ARM_VCPU_VEC		KVM_ARM_VCPU_SVE
+
 struct kvm_vcpu_init {
 	__u32 target;
 	__u32 features[7];
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 16ba5e9ac86c..f38b95a73169 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -342,7 +342,7 @@ static int set_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 	if (!vcpu_has_sve(vcpu))
 		return -ENOENT;
 
-	if (kvm_arm_vcpu_sve_finalized(vcpu))
+	if (kvm_arm_vcpu_vec_finalized(vcpu))
 		return -EPERM; /* too late! */
 
 	if (WARN_ON(vcpu->arch.sve_state))
@@ -497,7 +497,7 @@ static int get_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 	if (ret)
 		return ret;
 
-	if (!kvm_arm_vcpu_sve_finalized(vcpu))
+	if (!kvm_arm_vcpu_vec_finalized(vcpu))
 		return -EPERM;
 
 	if (copy_to_user(uptr, vcpu->arch.sve_state + region.koffset,
@@ -523,7 +523,7 @@ static int set_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 	if (ret)
 		return ret;
 
-	if (!kvm_arm_vcpu_sve_finalized(vcpu))
+	if (!kvm_arm_vcpu_vec_finalized(vcpu))
 		return -EPERM;
 
 	if (copy_from_user(vcpu->arch.sve_state + region.koffset, uptr,
@@ -657,7 +657,7 @@ static unsigned long num_sve_regs(const struct kvm_vcpu *vcpu)
 		return 0;
 
 	/* Policed by KVM_GET_REG_LIST: */
-	WARN_ON(!kvm_arm_vcpu_sve_finalized(vcpu));
+	WARN_ON(!kvm_arm_vcpu_vec_finalized(vcpu));
 
 	return slices * (SVE_NUM_PREGS + SVE_NUM_ZREGS + 1 /* FFR */)
 		+ 1; /* KVM_REG_ARM64_SVE_VLS */
@@ -675,7 +675,7 @@ static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
 		return 0;
 
 	/* Policed by KVM_GET_REG_LIST: */
-	WARN_ON(!kvm_arm_vcpu_sve_finalized(vcpu));
+	WARN_ON(!kvm_arm_vcpu_vec_finalized(vcpu));
 
 	/*
 	 * Enumerate this first, so that userspace can save/restore in
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 338505cb0171..a461f192230a 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -420,7 +420,7 @@ static int pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *h
 	int ret = 0;
 
 	if (!vcpu_has_feature(vcpu, KVM_ARM_VCPU_SVE)) {
-		vcpu_clear_flag(vcpu, VCPU_SVE_FINALIZED);
+		vcpu_clear_flag(vcpu, VCPU_VEC_FINALIZED);
 		return 0;
 	}
 
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 959532422d3a..f7c63e145d54 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -92,7 +92,7 @@ static void kvm_vcpu_enable_sve(struct kvm_vcpu *vcpu)
  * Finalize vcpu's maximum SVE vector length, allocating
  * vcpu->arch.sve_state as necessary.
  */
-static int kvm_vcpu_finalize_sve(struct kvm_vcpu *vcpu)
+static int kvm_vcpu_finalize_vec(struct kvm_vcpu *vcpu)
 {
 	void *buf;
 	unsigned int vl;
@@ -122,21 +122,21 @@ static int kvm_vcpu_finalize_sve(struct kvm_vcpu *vcpu)
 	}
 	
 	vcpu->arch.sve_state = buf;
-	vcpu_set_flag(vcpu, VCPU_SVE_FINALIZED);
+	vcpu_set_flag(vcpu, VCPU_VEC_FINALIZED);
 	return 0;
 }
 
 int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature)
 {
 	switch (feature) {
-	case KVM_ARM_VCPU_SVE:
-		if (!vcpu_has_sve(vcpu))
+	case KVM_ARM_VCPU_VEC:
+		if (!vcpu_has_vec(vcpu))
 			return -EINVAL;
 
-		if (kvm_arm_vcpu_sve_finalized(vcpu))
+		if (kvm_arm_vcpu_vec_finalized(vcpu))
 			return -EPERM;
 
-		return kvm_vcpu_finalize_sve(vcpu);
+		return kvm_vcpu_finalize_vec(vcpu);
 	}
 
 	return -EINVAL;
@@ -144,7 +144,7 @@ int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature)
 
 bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu)
 {
-	if (vcpu_has_sve(vcpu) && !kvm_arm_vcpu_sve_finalized(vcpu))
+	if (vcpu_has_vec(vcpu) && !kvm_arm_vcpu_vec_finalized(vcpu))
 		return false;
 
 	return true;
@@ -163,7 +163,7 @@ void kvm_arm_vcpu_destroy(struct kvm_vcpu *vcpu)
 	kfree(vcpu->arch.ccsidr);
 }
 
-static void kvm_vcpu_reset_sve(struct kvm_vcpu *vcpu)
+static void kvm_vcpu_reset_vec(struct kvm_vcpu *vcpu)
 {
 	if (vcpu_has_sve(vcpu))
 		memset(vcpu->arch.sve_state, 0, vcpu_sve_state_size(vcpu));
@@ -203,11 +203,11 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 	if (loaded)
 		kvm_arch_vcpu_put(vcpu);
 
-	if (!kvm_arm_vcpu_sve_finalized(vcpu)) {
+	if (!kvm_arm_vcpu_vec_finalized(vcpu)) {
 		if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_SVE))
 			kvm_vcpu_enable_sve(vcpu);
 	} else {
-		kvm_vcpu_reset_sve(vcpu);
+		kvm_vcpu_reset_vec(vcpu);
 	}
 
 	if (vcpu_el1_is_32bit(vcpu))

-- 
2.39.5


