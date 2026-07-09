Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DA6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 00:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3S9ahELkZZIZ12rSRHflO3V7CBzUhWm1iIfAQIars4=; b=PEa/BoukABCzeQxI0EVFSyRnEU
	UpKAwwxHFRKgm8ske9oJOyagvroBpRL7wu74mGyIWxSUKVMREv/Gf4q5CkuS7LuXTNp4+5/WTFAtR
	3+VULIZefMP8+5wJ0NAHZW6p56oWDzZy9c9G+g8ymGrzBkjPcHld5BHYUSvEWcozO426F6g0NVzNv
	XnsYJpDm4+9AzPfsy3gcNZX59yJ9e17eLSqShdZkvvslIeGvcioFq3jirhy7HHk1NJocvKL3JpLQG
	66DmvvCi4xnoRYIcNHSu5/pz6Xg7u2nIDO7Wlyv3WVtJWPX7CwYqdjnQSvBWRn9xJQXp1Ri9VHjgB
	B3brJDLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whd1e-00000000hff-1Ta0;
	Thu, 09 Jul 2026 00:54:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whd1c-00000000hdq-3FRx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 00:54:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 879AD434C3;
	Thu,  9 Jul 2026 00:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A51E1F00A3A;
	Thu,  9 Jul 2026 00:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783558440;
	bh=P3S9ahELkZZIZ12rSRHflO3V7CBzUhWm1iIfAQIars4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZRIygJHwfbF5EPa/yb0Z937z5tpFxCuuetqnvV1Z9TSuy2z18IWpvHgT6V+Qyr47l
	 tEZDxJZkRnvuQMCgLuigpk1j7IxpajREMYW4zLYVE7nUnFI62KKjAxwH/nGUNa3hCn
	 mYgeR88ICQja8lSgqByNXsU0S1H0paQoqm50rEA/AaHO3vd1jKjxzEW/8di1RrgyJx
	 8lt2ziTrJtBCMPWEybh9GtWXdbJeFMMkGIibBlvUkyXFimoKHB7/CzsuEGC6hcr4Ku
	 N/7Od0hjApOPuePmtuSe+iUC3a8r9xg/Iwuvh9KMIUq6pLYbrURO0kFPBEuqrRLpyy
	 MYWKvnRnvupcA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2026 01:51:56 +0100
Subject: [PATCH v11 19/29] KVM: arm64: Support userspace access to
 streaming mode Z and P registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-kvm-arm64-sme-v11-19-32799f66db9d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6007; i=broonie@kernel.org;
 h=from:subject:message-id; bh=eYifdoGL1bXvWRmzpU9jq6qwsx2hr1vVYHaneD9gHQ4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqTvDIfoSnoWU9s+XTJNLkw4woPSFT7XDPK2iBt
 CH2cqgmVu+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak7wyAAKCRAk1otyXVSH
 0K3iB/4v/FCBZcvKVcsGsjEF5I1ayQegN2KPZrZNnr46CFqFz16frGj5xobXK2yat1zgUJNjQDZ
 on21NWXzvjLYml+iiFRuwwBA/PKNyAADbaPQlbUvyDHLEi+nUHl8HkSHwzFNkcwf1ObXPsre6nK
 z/ezSeXkzX6NRllwpmuJ+tMi3eudNYtw1usX4JHGEisQBJMoKPLAUCRfOlae6EswlSegOrvlaT0
 KvQUFf4Vvb03E7fm/TRNkCMHwyj6zvuhduUw/NsIMPN6fv+r3v49IN1jCsZqCx78RkhYsggt26F
 TxskHvE8+0pEE0n+mlXSNQUfv/z1QaGCG04WoYxLQAqr/G3d
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

SME introduces a mode called streaming mode where the Z, P and optionally
FFR registers can be accessed using the SVE instructions but with the SME
vector length. Reflect this in the ABI for accessing the guest registers by
making the vector length for the vcpu reflect the vector length that would
be seen by the guest were it running, using the SME vector length when the
guest is configured for streaming mode.

Since SME may be present without SVE we also update the existing checks for
access to the Z, P and V registers to check for either SVE or streaming
mode. When not in streaming mode the guest floating point state may be
accessed via the V registers.

Any VMM that supports SME must be aware of the need to configure streaming
mode prior to writing the floating point registers that this creates.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/guest.c | 83 +++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 65 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 48e6b500f531..110cc7f7527a 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -73,6 +73,19 @@ static u64 core_reg_offset_from_id(u64 id)
 	return id & ~(KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK | KVM_REG_ARM_CORE);
 }
 
+static bool vcpu_has_sve_regs(const struct kvm_vcpu *vcpu)
+{
+	return vcpu_has_sve(vcpu) || vcpu_in_streaming_mode(vcpu);
+}
+
+static bool vcpu_ffr_enabled(const struct kvm_vcpu *vcpu)
+{
+	if (vcpu_in_streaming_mode(vcpu))
+		return vcpu_has_fa64(vcpu);
+	else
+		return vcpu_has_sve(vcpu);
+}
+
 static int core_reg_size_from_offset(const struct kvm_vcpu *vcpu, u64 off)
 {
 	int size;
@@ -110,9 +123,10 @@ static int core_reg_size_from_offset(const struct kvm_vcpu *vcpu, u64 off)
 	/*
 	 * The KVM_REG_ARM64_SVE regs must be used instead of
 	 * KVM_REG_ARM_CORE for accessing the FPSIMD V-registers on
-	 * SVE-enabled vcpus:
+	 * SVE-enabled vcpus or when a SME enabled vcpu is in
+	 * streaming mode:
 	 */
-	if (vcpu_has_sve(vcpu) && core_reg_offset_is_vreg(off))
+	if (vcpu_has_sve_regs(vcpu) && core_reg_offset_is_vreg(off))
 		return -EINVAL;
 
 	return size;
@@ -423,6 +437,24 @@ struct vec_state_reg_region {
 	unsigned int upad;	/* extra trailing padding in user memory */
 };
 
+/*
+ * We represent the Z and P registers to userspace using either the
+ * SVE or SME vector length, depending on which features the guest has
+ * and if the guest is in streaming mode.
+ */
+static unsigned int vcpu_sve_cur_vq(struct kvm_vcpu *vcpu)
+{
+	unsigned int vq = 0;
+
+	if (vcpu_has_sve(vcpu))
+		vq = vcpu_sve_max_vq(vcpu);
+
+	if (vcpu_in_streaming_mode(vcpu))
+		vq = vcpu_sme_max_vq(vcpu);
+
+	return vq;
+}
+
 /*
  * Validate SVE register ID and get sanitised bounds for user/kernel SVE
  * register copy
@@ -460,20 +492,25 @@ static int sve_reg_to_region(struct vec_state_reg_region *region,
 	reg_num = (reg->id & SVE_REG_ID_MASK) >> SVE_REG_ID_SHIFT;
 
 	if (reg->id >= zreg_id_min && reg->id <= zreg_id_max) {
-		if (!vcpu_has_sve(vcpu) || (reg->id & SVE_REG_SLICE_MASK) > 0)
+		if (!vcpu_has_sve_regs(vcpu) || (reg->id & SVE_REG_SLICE_MASK) > 0)
 			return -ENOENT;
 
-		vq = vcpu_sve_max_vq(vcpu);
+		vq = vcpu_sve_cur_vq(vcpu);
 
 		reqoffset = SVE_SIG_ZREG_OFFSET(vq, reg_num) -
 				SVE_SIG_REGS_OFFSET;
 		reqlen = KVM_SVE_ZREG_SIZE;
 		maxlen = SVE_SIG_ZREG_SIZE(vq);
 	} else if (reg->id >= preg_id_min && reg->id <= preg_id_max) {
-		if (!vcpu_has_sve(vcpu) || (reg->id & SVE_REG_SLICE_MASK) > 0)
+		if (!vcpu_has_sve_regs(vcpu) || (reg->id & SVE_REG_SLICE_MASK) > 0)
 			return -ENOENT;
 
-		vq = vcpu_sve_max_vq(vcpu);
+		if (!vcpu_ffr_enabled(vcpu) &&
+		    (reg->id >= KVM_REG_ARM64_SVE_FFR(0)) &&
+		    (reg->id <= KVM_REG_ARM64_SVE_FFR(SVE_NUM_SLICES - 1)))
+			return -ENOENT;
+
+		vq = vcpu_sve_cur_vq(vcpu);
 
 		reqoffset = SVE_SIG_PREG_OFFSET(vq, reg_num) -
 				SVE_SIG_REGS_OFFSET;
@@ -640,15 +677,21 @@ static unsigned long num_core_regs(const struct kvm_vcpu *vcpu)
 static unsigned long num_sve_regs(const struct kvm_vcpu *vcpu)
 {
 	const unsigned int slices = vcpu_sve_slices(vcpu);
+	int regs, ret;
 
-	if (!vcpu_has_sve(vcpu))
+	if (!vcpu_has_sve(vcpu) && !vcpu_in_streaming_mode(vcpu))
 		return 0;
 
 	/* Policed by KVM_GET_REG_LIST: */
 	WARN_ON(!kvm_arm_vcpu_vec_finalized(vcpu));
 
-	return slices * (SVE_NUM_PREGS + SVE_NUM_ZREGS + 1 /* FFR */)
-		+ 1; /* KVM_REG_ARM64_SVE_VLS */
+	regs = SVE_NUM_PREGS + SVE_NUM_ZREGS;
+	if (vcpu_ffr_enabled(vcpu))
+		regs++;  /* FFR */
+	ret = regs * slices;
+	if (vcpu_has_sve(vcpu))
+		ret++; /* KVM_REG_ARM64_SVE_VLS */
+	return ret;
 }
 
 static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
@@ -659,7 +702,7 @@ static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
 	unsigned int i, n;
 	int num_regs = 0;
 
-	if (!vcpu_has_sve(vcpu))
+	if (!vcpu_has_sve_regs(vcpu))
 		return 0;
 
 	/* Policed by KVM_GET_REG_LIST: */
@@ -669,10 +712,12 @@ static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
 	 * Enumerate this first, so that userspace can save/restore in
 	 * the order reported by KVM_GET_REG_LIST:
 	 */
-	reg = KVM_REG_ARM64_SVE_VLS;
-	if (put_user(reg, uindices++))
-		return -EFAULT;
-	++num_regs;
+	if (vcpu_has_sve(vcpu)) {
+		reg = KVM_REG_ARM64_SVE_VLS;
+		if (put_user(reg, uindices++))
+			return -EFAULT;
+		++num_regs;
+	}
 
 	for (i = 0; i < slices; i++) {
 		for (n = 0; n < SVE_NUM_ZREGS; n++) {
@@ -689,10 +734,12 @@ static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
 			num_regs++;
 		}
 
-		reg = KVM_REG_ARM64_SVE_FFR(i);
-		if (put_user(reg, uindices++))
-			return -EFAULT;
-		num_regs++;
+		if (vcpu_ffr_enabled(vcpu)) {
+			reg = KVM_REG_ARM64_SVE_FFR(i);
+			if (put_user(reg, uindices++))
+				return -EFAULT;
+			num_regs++;
+		}
 	}
 
 	return num_regs;

-- 
2.47.3


