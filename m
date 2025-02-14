Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764A2C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 02:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcZUzoZlwLV/srIoVMGOR9jGo+QcRxLMNfNo2deoAsc=; b=A4OwUZ8dVKkNQOlZaCNZQXIYA5
	uci9FMJJ+EdmeESKQMV6+TycYpEVCj9oK0O6fyD/+A4B0EBp9DWPz+u/8qA7L009xwXEQI4jUc7UR
	afRN3zIdv/zg637mio1JXo+8kw2dMW5+hPgpcK2RHWXmjid9uLSMviJwFzqCHCiKXf/54RC8a0cwQ
	skXIlyZ/p2C6wpEob5qmrvbZ7t0vBfv9jCY56WWqROKrTca9O+JXikS+o+pYrrFEKakQ6JPV2UuHi
	UbOkHxiCHc1GDRA2RfOgbO9L+BktPzpPHAJHIsy9MQ/MgP2Qs1hSGIGCFMkSQQov17tuXk1f7MUWP
	GOcdxCog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tilUK-0000000DMFy-2GIU;
	Fri, 14 Feb 2025 02:31:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1til20-0000000DFXL-32jy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 02:02:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BEDD9A42AB5;
	Fri, 14 Feb 2025 02:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE01C4CEE2;
	Fri, 14 Feb 2025 02:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739498535;
	bh=qJoUCI/piVewnKDz2NbQYZx9SqUOrxIeyc4/FfZsD2w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZB8CfTpRWiYxxCrhL39z/xQ38EE+jDN008Sog4jTU2G8ZycnrofPb15OcsVErFcs0
	 3LzD5vnTGOkKoUyVS464XBeD7/AxYabp2CmvMeH026B5+XoGTTqZni63DbgU9XB2FN
	 yRhg44vMHtlj0jTW7j02+aW0yXIWSUKWZycqR7pZ399fMq3HsQRb14rtZO2KAGAH6K
	 Fj9D288HvzQTrPDCUO0UwGOxoxrRtD1WFHy5r6osmAblcFjLysQm84rE7bndDnLxNT
	 OFH5jgQYXpGqA9obD7XTnlNHkKO0j59lEWtP9wO22qx4gVlrQd4fDhW5iWEkZhMyX0
	 YHpyzpC1Jeolg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 14 Feb 2025 01:58:03 +0000
Subject: [PATCH v4 20/27] KVM: arm64: Support userspace access to streaming
 mode Z and P registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-kvm-arm64-sme-v4-20-d64a681adcc2@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4700; i=broonie@kernel.org;
 h=from:subject:message-id; bh=qJoUCI/piVewnKDz2NbQYZx9SqUOrxIeyc4/FfZsD2w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnrqPQVluPUgR4/8xMUi5D+iwEu3mCzO/0306nk2LS
 pfO/5nSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ66j0AAKCRAk1otyXVSH0KM5B/
 936FqN9s6ZPvcmAa1Q0hAWjtBvrBLxlnLr0wQlC5Wl9zTDmnHcXMiEYm+x8MupV6PRjhbYSgL/l/E2
 d7OOIPMMduHLij74JxAEUVWWUn4EIWtngkbRt82mTDQhaS6YwSuwtaIUK3njOU07EmRyEee8ZuSXCK
 5jfTdB43azT5V7JikQnT/+4IFQZ2MJknnEYvlyhLyj2tiE2n4Dct9JdU05taKbYoUAzUQUdgA1ZUAz
 9jcYbB+Jko/ITjBc9jyQtZNBc7+76aWhMyu4sf5merfLcbSLaKkZigYX0horu3gvEXYb8vgq83eHqF
 xZ9PYqpRutOA4/bMTrECU1qi3/Dh1P
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_180216_895655_8409F15D 
X-CRM114-Status: GOOD (  21.04  )
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
 arch/arm64/include/asm/kvm_host.h |  3 +++
 arch/arm64/kvm/guest.c            | 38 ++++++++++++++++++++++++++++++++++----
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index acd243a31ccb77cce3d95829e22456a71e87725c..67ac3e37fde31901513c2e692693d3ba1967b0bd 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1600,4 +1600,7 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 #define vcpu_has_fa64(vcpu)	kvm_has_fa64((vcpu)->kvm)
 #endif
 
+#define vcpu_in_streaming_mode(vcpu) \
+	(__vcpu_sys_reg(vcpu, SVCR) & SVCR_SM_MASK)
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 62df7830d11e6e7d01d175566e4b6a771ac2ec6d..87a0a027e1e7e2487eff703dee2958137c9640ef 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -73,6 +73,11 @@ static u64 core_reg_offset_from_id(u64 id)
 	return id & ~(KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK | KVM_REG_ARM_CORE);
 }
 
+static bool vcpu_has_sve_regs(const struct kvm_vcpu *vcpu)
+{
+	return vcpu_has_sve(vcpu) || vcpu_in_streaming_mode(vcpu);
+}
+
 static int core_reg_size_from_offset(const struct kvm_vcpu *vcpu, u64 off)
 {
 	int size;
@@ -110,9 +115,10 @@ static int core_reg_size_from_offset(const struct kvm_vcpu *vcpu, u64 off)
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
@@ -426,6 +432,24 @@ struct vec_state_reg_region {
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
@@ -466,7 +490,7 @@ static int sve_reg_to_region(struct vec_state_reg_region *region,
 		if (!vcpu_has_sve(vcpu) || (reg->id & SVE_REG_SLICE_MASK) > 0)
 			return -ENOENT;
 
-		vq = vcpu_sve_max_vq(vcpu);
+		vq = vcpu_sve_cur_vq(vcpu);
 
 		reqoffset = SVE_SIG_ZREG_OFFSET(vq, reg_num) -
 				SVE_SIG_REGS_OFFSET;
@@ -476,7 +500,7 @@ static int sve_reg_to_region(struct vec_state_reg_region *region,
 		if (!vcpu_has_sve(vcpu) || (reg->id & SVE_REG_SLICE_MASK) > 0)
 			return -ENOENT;
 
-		vq = vcpu_sve_max_vq(vcpu);
+		vq = vcpu_sve_cur_vq(vcpu);
 
 		reqoffset = SVE_SIG_PREG_OFFSET(vq, reg_num) -
 				SVE_SIG_REGS_OFFSET;
@@ -515,6 +539,9 @@ static int get_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 	if (!kvm_arm_vcpu_vec_finalized(vcpu))
 		return -EPERM;
 
+	if (!vcpu_has_sve_regs(vcpu))
+		return -EBUSY;
+
 	if (copy_to_user(uptr, vcpu->arch.sve_state + region.koffset,
 			 region.klen) ||
 	    clear_user(uptr + region.klen, region.upad))
@@ -541,6 +568,9 @@ static int set_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 	if (!kvm_arm_vcpu_vec_finalized(vcpu))
 		return -EPERM;
 
+	if (!vcpu_has_sve_regs(vcpu))
+		return -EBUSY;
+
 	if (copy_from_user(vcpu->arch.sve_state + region.koffset, uptr,
 			   region.klen))
 		return -EFAULT;

-- 
2.39.5


