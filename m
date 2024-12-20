Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB235E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AvWONrF+WtWsA2Lz3Op8lY52ObXw3XQuUEjWcCX2BbE=; b=F0CYQV09Ps5JRifY37FfeaaSmF
	mHdBGa98hGijL6HEykNtZUjFoq4qp9rxOdoN2CQfNB07PfiBJjbDO2G8LeLPV3vtL3VwvbT7GKCtj
	e6XOrmLVwjZHtC2TaZZYdsJ7EDfHa3mWNqioSqqyFcvUK9szBFw+a3gSFzJ/vDIE4bH1MYAFdelle
	K0jwATomP1bi7FC5IOO8a2Z1jWp3Lm/Q237oOQVZy3tY9EWzuYD8mpui4+oQrXeTE7Wnyq0+MOWgt
	mJ9zXOzl/2H9wuW+eT78bWoJPMbitaZu+cBdEN89a45UpWTxqsX2VXB3XQaq67ZY/8LA72lSrywkn
	cBdfj6ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgQl-00000005YsB-40nB;
	Fri, 20 Dec 2024 17:04:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgE0-00000005VyJ-3C3f
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Dec 2024 16:51:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AvWONrF+WtWsA2Lz3Op8lY52ObXw3XQuUEjWcCX2BbE=; b=lVs52ukJrxGgEvxek1tdaT/n4C
	yVyc+ljydj7UNE3LStrKg/cAKwDZZJW0xg5ZceUdpArue8bXAfES5+x8+ceDk75CMaeunweGQk82+
	uJhN0fGlGgQBqIJZgUI5RdHykOFOoVIfwqmQ2SgwmjNJSKc2/QqZkdbF/4ugEDC9/kKYjw39dqjNR
	JFBLVFn0pbn15ErMN9TuUtq9CSUAEv2JxNrqyObrPmUOu+sZaL7cYjZmGM7x2uIADDF9ziOHEgxVW
	B3p4KYb/sM57aiumt/qgAxYtpjreGaF1LVKChoSlDT0WQUW4WKyH0AZxwWuYcpKUtrQH9+SoRQYiL
	KGCiT49Q==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgDw-00000005jXa-47Vn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:51:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 60A84A4201C;
	Fri, 20 Dec 2024 16:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3109EC4CEDC;
	Fri, 20 Dec 2024 16:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734713495;
	bh=3aaZhNirOZ+7l9BeX+c3sgo5KaaCuR6ys35EPFSwf5I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ivQ4iWm1QqcGDvdvFW2D7CizC4bu4+NLYAkUu1z6hEuoDkKIRPNgFdoOjGrPLZPx0
	 8iunglxHnzAf/Kw+EyWDi999khVY2SmWxFb8jn6V/WCUXOzthp0RDO0TjfSwCpBPx1
	 L/2qboNeQKxSTgBDgs9xsKF1MgOLis83ORHb6s1Osr0wy0iI+gkFhZnXnAZc6IGlMA
	 9CLcet2iXGVta8LAt5sse2AR6W67K1pGEafmWc71jWluWW6OPtkr4S3gseNAQI9cHz
	 XN4+4r8upRTpK463qnJEv/IUwvzk/VqN6OvUDrNayOJuUcyn+AFmXPH8xOIB/OsExE
	 o9Js31he67Nqg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 20 Dec 2024 16:46:35 +0000
Subject: [PATCH RFC v3 10/27] KVM: arm64: Rename SVE finalization constants
 to be more general
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-kvm-arm64-sme-v3-10-05b018c1ffeb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7533; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3aaZhNirOZ+7l9BeX+c3sgo5KaaCuR6ys35EPFSwf5I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnZaBcHuq5Lk45QXE8KUQ/QhEs1N1N14WzcOZ4wGiW
 krf/jliJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ2WgXAAKCRAk1otyXVSH0IF6B/
 4t9q0gL7iHDyrcIJDUPG9jcN0euzIJJrpuoBsjuqccr3yuWuHS+PskLa+15vbpMf/dMpx6VTNMpISo
 Hw6QNQq5HECzh66lBgfetGl9X28k6KB+mid8G6x/X5XrkYPLBL8fKzWu5kowdwGINS1WOiwmkybCIe
 ShCjwWUEz9BNx3ertYmduRBlhprlCpEsQ4HkTbtlJzXd+mnkjgSh3qpwND2fqFoOWOaLs8UO+62vIA
 /gHCB3DrMJtiqB1jvIvtFW1dmg4hlPEe0UHsNRglkTmz8yrW3HNQLVfv+aLRFFmtuNvldsTEX09MVN
 GVJBvuszAqq3rHyaa7GqsuPLCjBtkE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_165138_291271_BAF47CC1 
X-CRM114-Status: GOOD (  19.11  )
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
 arch/arm64/include/asm/kvm_host.h |  6 ++++--
 arch/arm64/include/uapi/asm/kvm.h |  6 ++++++
 arch/arm64/kvm/guest.c            | 10 +++++-----
 arch/arm64/kvm/hyp/nvhe/pkvm.c    |  2 +-
 arch/arm64/kvm/reset.c            | 20 ++++++++++----------
 5 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 97b617606221e8c11fd2b55d9636848d8453209f..f64ad573573cf000c4644f12f9e072a2fdfc3824 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -873,7 +873,7 @@ struct kvm_vcpu_arch {
 /* KVM_ARM_VCPU_INIT completed */
 #define VCPU_INITIALIZED	__vcpu_single_flag(cflags, BIT(0))
 /* SVE config completed */
-#define VCPU_SVE_FINALIZED	__vcpu_single_flag(cflags, BIT(1))
+#define VCPU_VEC_FINALIZED	__vcpu_single_flag(cflags, BIT(1))
 
 /* Exception pending */
 #define PENDING_EXCEPTION	__vcpu_single_flag(iflags, BIT(0))
@@ -948,6 +948,8 @@ struct kvm_vcpu_arch {
 #define vcpu_has_sve(vcpu)	kvm_has_sve((vcpu)->kvm)
 #endif
 
+#define vcpu_has_vec(vcpu) vcpu_has_sve(vcpu)
+
 #ifdef CONFIG_ARM64_PTR_AUTH
 #define vcpu_has_ptrauth(vcpu)						\
 	((cpus_have_final_cap(ARM64_HAS_ADDRESS_AUTH) ||		\
@@ -1414,7 +1416,7 @@ struct kvm *kvm_arch_alloc_vm(void);
 int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature);
 bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
 
-#define kvm_arm_vcpu_sve_finalized(vcpu) vcpu_get_flag(vcpu, VCPU_SVE_FINALIZED)
+#define kvm_arm_vcpu_vec_finalized(vcpu) vcpu_get_flag(vcpu, VCPU_VEC_FINALIZED)
 
 #define kvm_has_mte(kvm)					\
 	(system_supports_mte() &&				\
diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index 66736ff04011e0fa9fcfb74154d5613bf4ee89f7..9d80d22af9d4e00204f5096fb7c8c2ee8c3646c1 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -109,6 +109,12 @@ struct kvm_regs {
 #define KVM_ARM_VCPU_PTRAUTH_GENERIC	6 /* VCPU uses generic authentication */
 #define KVM_ARM_VCPU_HAS_EL2		7 /* Support nested virtualization */
 
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
index 12dad841f2a51276eee4d4da7400c1b2a5732ff8..62ff51d6e4584acc71205f5d4b1d2f3d2e2d2f88 100644
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
index 446a9114b0d3ee4323a9cd8d618d36035e85e4d0..0a4e1f5105592b23a0505bf7680c66e76b5c2a65 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -314,7 +314,7 @@ static void pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *
 	struct kvm_vcpu *vcpu = &hyp_vcpu->vcpu;
 
 	if (!vcpu_has_feature(vcpu, KVM_ARM_VCPU_SVE))
-		vcpu_clear_flag(vcpu, VCPU_SVE_FINALIZED);
+		vcpu_clear_flag(vcpu, VCPU_VEC_FINALIZED);
 }
 
 static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 803e11b0dc8f5eb74b07b0ad745b0c4f666713d5..ce726b1d4e8e90cfd4459a6cb9c67b8805424e22 100644
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
@@ -161,7 +161,7 @@ void kvm_arm_vcpu_destroy(struct kvm_vcpu *vcpu)
 	kfree(vcpu->arch.ccsidr);
 }
 
-static void kvm_vcpu_reset_sve(struct kvm_vcpu *vcpu)
+static void kvm_vcpu_reset_vec(struct kvm_vcpu *vcpu)
 {
 	if (vcpu_has_sve(vcpu))
 		memset(vcpu->arch.sve_state, 0, vcpu_sve_state_size(vcpu));
@@ -204,11 +204,11 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
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


