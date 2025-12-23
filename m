Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2794FE6B261
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 01:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqFhXc6rFm4EkKkgpNwT/+XF5acTdRkOTO8gq91dSIo=; b=asGl1nXTekR15TJAP+IrAJTFx2
	ojJNDs4DHHELr+k162l4D/8msOJpmU5XdM9+KB96x9qz6p4BUdLJMNn0ujO/ifuepD+dfikYP37dX
	i3G8hHTRO0E2uJyes0HRmSUQAwoOmbE93jmOamSsHzI2lhyxDrrtM875Nx9JfZihTXXGFZhgRf6Jc
	G1iH1hFJhEsMGyniMjmjyeD0o82BfRUfCkng0IiqQKgCE4GAkTIl35HHAAjC+ryBHYVrXyWRLPqIb
	/YDouCN0ukL+lLy11lwc6vyHasO09kx1lJv4hC2pDrkY5BhpTrv4LgsYt/NVV0gyPuu0o+jipjJxK
	JVpiAA7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr7R-0000000EMeI-3Oko;
	Tue, 23 Dec 2025 01:23:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr7H-0000000EMTL-1KLs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 01:23:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AAC9560199;
	Tue, 23 Dec 2025 01:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B043C4CEF1;
	Tue, 23 Dec 2025 01:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766452990;
	bh=7nbId40f4lGVgDiFbYePxhC3YPr9PDugIlnIkOnzXtA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=t5ppQ1RnU3v7bu8ff3HL1cxnUhZ/5/dNccQHs2owzz4EWSwLf2vcX4HR7rLgYPGYw
	 YUXtfgAoqysFKOEpWrCI7AhWFMlXlHSiQDeLq68j4ijmbJq5jPnhVkSSO4qhvZmJjd
	 ljLpPTovTjDFxI9AI9XLRLZU+JUOTUEGF7coJbeMj0qAbjJWmIYifwSixL2XeU0ZVI
	 pnSr/zl/lacGdjhBIxNFGih7V5LMVAfPq4L2YqC3fZ6eFK0AuNi3Cu4sarxTOmQuw2
	 WKvuyMPeNBDwK4IOXYwcmhJOxKO7/tZJwWWTLJYgOdV2kdv8po7UzMATZ7IqdUuzV9
	 Ju5wVF+9hq6TQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 23 Dec 2025 01:21:16 +0000
Subject: [PATCH v9 22/30] KVM: arm64: Expose SME specific state to
 userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-kvm-arm64-sme-v9-22-8be3867cb883@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6845; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7nbId40f4lGVgDiFbYePxhC3YPr9PDugIlnIkOnzXtA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpSe6T5xhKhAr2RzPabC3qNrPi+jJwzkwFMsreo
 zU4HpoykdGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaUnukwAKCRAk1otyXVSH
 0PclB/94BuzaA5rHPB0q6bzNheNaDlNTInvUMU+/xj+ahC+ss0CQ3HsfZq7a6mxsP+mGlZ+jUuh
 fJF0EhdWF60pMXd6u8dx2Fc6ZNdYI43Llntpf7z2v6cgxxHo9IdWpYVvbS15lVQmwgJoqRYVbnA
 6gn4Y+Kq2H5FlOkkgtlk58SxsmHq0KSd78tAgV5iFjcLXQ9aDeyBUUIUkYL0vLhRJlKx6LHbhY7
 WJh9lUfN1SgJJqpWihS2e8AsAsppgzn085yvVNEMRTbbjdSVZlM2oMwTTc/+bJ8UVePJaBCsnz2
 57/NxiQ/0bG65tez2VejLvvQnSrRbmwfCSYQ0anQAmldliCv
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

SME introduces two new registers, the ZA matrix register and the ZT0 LUT
register.  Both of these registers are only accessible when PSTATE.ZA is
set and ZT0 is only present if SME2 is enabled for the guest. Provide
support for configuring these from VMMs.

The ZA matrix is a single SVL*SVL register which is available when
PSTATE.ZA is set. We follow the pattern established by the architecture
itself and expose this to userspace as a series of horizontal SVE vectors
with the streaming mode vector length, using the format already established
for the SVE vectors themselves.

ZT0 is a single register with a refreshingly fixed size 512 bit register
which is like ZA accessible only when PSTATE.ZA is set. Add support for it
to the userspace API, as with ZA we allow the register to be read or written
regardless of the state of PSTATE.ZA in order to simplify userspace usage.
The value will be reset to 0 whenever PSTATE.ZA changes from 0 to 1,
userspace can read stale values but these are not observable by the guest
without manipulation of PSTATE.ZA by userspace.

While there is currently only one ZT register the naming as ZT0 and the
instruction encoding clearly leave room for future extensions adding more
ZT registers. This encoding can readily support such an extension if one is
introduced.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/uapi/asm/kvm.h |  17 ++++++
 arch/arm64/kvm/guest.c            | 114 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 129 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index 498a49a61487..9a19cc58d227 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -357,6 +357,23 @@ struct kvm_arm_counter_offset {
 /* SME registers */
 #define KVM_REG_ARM64_SME		(0x17 << KVM_REG_ARM_COPROC_SHIFT)
 
+#define KVM_ARM64_SME_VQ_MIN __SVE_VQ_MIN
+#define KVM_ARM64_SME_VQ_MAX __SVE_VQ_MAX
+
+/* ZA and ZTn occupy blocks at the following offsets within this range: */
+#define KVM_REG_ARM64_SME_ZA_BASE	0
+#define KVM_REG_ARM64_SME_ZT_BASE	0x600
+
+#define KVM_ARM64_SME_MAX_ZAHREG	(__SVE_VQ_BYTES * KVM_ARM64_SME_VQ_MAX)
+
+#define KVM_REG_ARM64_SME_ZAHREG(n, i)					\
+	(KVM_REG_ARM64 | KVM_REG_ARM64_SME | KVM_REG_ARM64_SME_ZA_BASE | \
+	 KVM_REG_SIZE_U2048 |						\
+	 (((n) & (KVM_ARM64_SME_MAX_ZAHREG - 1)) << 5) |		\
+	 ((i) & (KVM_ARM64_SVE_MAX_SLICES - 1)))
+
+#define KVM_REG_ARM64_SME_ZTREG_SIZE	(512 / 8)
+
 /* Vector lengths pseudo-register: */
 #define KVM_REG_ARM64_SME_VLS		(KVM_REG_ARM64 | KVM_REG_ARM64_SME | \
 					 KVM_REG_SIZE_U512 | 0xfffe)
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 90dcacb35f01..d4e30eb57a9c 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -594,23 +594,133 @@ static int set_sme_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 	return set_vec_vls(ARM64_VEC_SME, vcpu, reg);
 }
 
+/*
+ * Validate SVE register ID and get sanitised bounds for user/kernel SVE
+ * register copy
+ */
+static int sme_reg_to_region(struct vec_state_reg_region *region,
+			     struct kvm_vcpu *vcpu,
+			     const struct kvm_one_reg *reg)
+{
+	/* reg ID ranges for ZA.H[n] registers */
+	unsigned int vq = vcpu_sme_max_vq(vcpu) - 1;
+	const u64 za_h_max = vq * __SVE_VQ_BYTES;
+	const u64 zah_id_min = KVM_REG_ARM64_SME_ZAHREG(0, 0);
+	const u64 zah_id_max = KVM_REG_ARM64_SME_ZAHREG(za_h_max - 1,
+						       SVE_NUM_SLICES - 1);
+	unsigned int reg_num;
+
+	unsigned int reqoffset, reqlen; /* User-requested offset and length */
+	unsigned int maxlen; /* Maximum permitted length */
+
+	size_t sme_state_size;
+
+	reg_num = (reg->id & SVE_REG_ID_MASK) >> SVE_REG_ID_SHIFT;
+
+	if (reg->id >= zah_id_min && reg->id <= zah_id_max) {
+		if (!vcpu_has_sme(vcpu) || (reg->id & SVE_REG_SLICE_MASK) > 0)
+			return -ENOENT;
+
+		/* ZA is exposed as SVE vectors ZA.H[n] */
+		reqoffset = ZA_SIG_ZAV_OFFSET(vq, reg_num) -
+			ZA_SIG_REGS_OFFSET;
+		reqlen = KVM_SVE_ZREG_SIZE;
+		maxlen = SVE_SIG_ZREG_SIZE(vq);
+	} else if (reg->id == KVM_REG_ARM64_SME_ZT_BASE) {
+		/* ZA is exposed as SVE vectors ZA.H[n] */
+		if (!kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, SME, SME2) ||
+		    (reg->id & SVE_REG_SLICE_MASK) > 0 ||
+		    reg_num > 0)
+			return -ENOENT;
+
+		/* ZT0 is stored after ZA */
+		reqlen = KVM_REG_ARM64_SME_ZTREG_SIZE;
+		maxlen = KVM_REG_ARM64_SME_ZTREG_SIZE;
+	} else {
+		return -EINVAL;
+	}
+
+	sme_state_size = vcpu_sme_state_size(vcpu);
+	if (WARN_ON(!sme_state_size))
+		return -EINVAL;
+
+	region->koffset = array_index_nospec(reqoffset, sme_state_size);
+	region->klen = min(maxlen, reqlen);
+	region->upad = reqlen - region->klen;
+
+	return 0;
+}
+
+/*
+ * ZA is exposed as an array of horizontal vectors with the same
+ * format as SVE, mirroring the architecture's LDR ZA[Wv, offs], [Xn]
+ * instruction.
+ */
+
 static int get_sme_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 {
+	int ret;
+	struct vec_state_reg_region region;
+	char __user *uptr = (char __user *)reg->addr;
+
 	/* Handle the KVM_REG_ARM64_SME_VLS pseudo-reg as a special case: */
 	if (reg->id == KVM_REG_ARM64_SME_VLS)
 		return get_sme_vls(vcpu, reg);
 
-	return -EINVAL;
+	/* Try to interpret reg ID as an architectural SME register... */
+	ret = sme_reg_to_region(&region, vcpu, reg);
+	if (ret)
+		return ret;
+
+	if (!kvm_arm_vcpu_vec_finalized(vcpu))
+		return -EPERM;
+
+	/*
+	 * None of the SME specific registers are accessible unless
+	 * PSTATE.ZA is set.
+	 */
+	if (!vcpu_za_enabled(vcpu))
+		return -EINVAL;
+
+	if (copy_from_user(vcpu->arch.sme_state + region.koffset, uptr,
+			   region.klen))
+		return -EFAULT;
+
+	return 0;
 }
 
 static int set_sme_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 {
+	int ret;
+	struct vec_state_reg_region region;
+	char __user *uptr = (char __user *)reg->addr;
+
 	/* Handle the KVM_REG_ARM64_SME_VLS pseudo-reg as a special case: */
 	if (reg->id == KVM_REG_ARM64_SME_VLS)
 		return set_sme_vls(vcpu, reg);
 
-	return -EINVAL;
+	/* Try to interpret reg ID as an architectural SME register... */
+	ret = sme_reg_to_region(&region, vcpu, reg);
+	if (ret)
+		return ret;
+
+	if (!kvm_arm_vcpu_vec_finalized(vcpu))
+		return -EPERM;
+
+	/*
+	 * None of the SME specific registers are accessible unless
+	 * PSTATE.ZA is set.
+	 */
+	if (!vcpu_za_enabled(vcpu))
+		return -EINVAL;
+
+	if (copy_from_user(vcpu->arch.sme_state + region.koffset, uptr,
+			   region.klen))
+		return -EFAULT;
+
+	return 0;
 }
+
 int kvm_arch_vcpu_ioctl_get_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
 {
 	return -EINVAL;

-- 
2.47.3


