Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DC9C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnnxhEtakHnlWZ6TrxLH9yZilRgOwG+pAKz3xNRHD8s=; b=jeMpD5WrSMgTlQLLIgp/v+J5hx
	2OJ06tzwPA5d3GGGJ+tqOgG2kzZTLm2oNG5XpSEUalxyeWMFE3TdzgplaUqetwzjd1pcd1TRlydd4
	gRG2TwiCjhPiaIrZ0lcZfFNqwNIMekCKauVcnRCEbJ+TreLcBq34PHs2Na6RgD0cfQj1JS+oRbfv0
	EYpPXYKHC0F/3g3eJBnBaz2lhffhUWNaniXxgP538bugASGJX+AekDFDJDFHkjOxsamVLGkVSDfW+
	OQ5stHWl0JBSLiYf5HeoWXr2IHYpmVN1wxS++Fm7gaFGqlnqiw1VwHbpZE/WOp7CYG9NbAhRGOoAN
	6mgvWt4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29y7-000000005l3-01hK;
	Thu, 03 Sep 2026 16:07:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29y3-000000005cs-2OkF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:07:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52D141650;
	Thu,  3 Sep 2026 09:07:07 -0700 (PDT)
Received: from e140010.cambridge.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49A7F3F673;
	Thu,  3 Sep 2026 09:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788451631; bh=ICG37A7E0DN2o9Fc5Ao1zY5J5NmiPPMaM5NoSgGgT7I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fTyeC0QkHUTTijYjj919YtbsOsTKNFJz+gY6gh+u8HmhPkd9rZ5BN+OJL6rYwY3xO
	 dAL5hsP2Au3breuNVmuqw6/V6tOO1wj85TZ4PBlYnjd47zZyDdUEgUQsYfBsZoRT5c
	 IegzVD8ry51yiyP74iCylKns/qbtL4Vz4nxgNjsU=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: [RFC PATCH v7 17/28] KVM: arm64: Apply a RES0 mask to PMBLIMITR_EL1 writes
Date: Thu,  3 Sep 2026 17:06:12 +0100
Message-ID: <20260903160623.315525-18-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903160623.315525-1-alexandru.elisei@arm.com>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_090711_791498_6CC5892A 
X-CRM114-Status: GOOD (  20.82  )
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

PMBLIMITR_EL1 is special, because it has feature enable fields. If those
features are hidden from a guest, ignore them when the guest or the VMM
attempt to set them.

The least significant bits of the buffer limit address are RES0 based on
the smallest granule implemented. Make sure they are treated as zero even
if the smallest granule exposed to the VM is larger than what the hardware
implements.

Note that it is up to the user to write to the SPE buffer registers only
after the VM features have been configured in the VM id registers.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 Documentation/virt/kvm/devices/vcpu.rst |  3 ++
 arch/arm64/include/asm/kvm_spe.h        |  7 +++++
 arch/arm64/kvm/spe.c                    | 40 +++++++++++++++++++++++--
 arch/arm64/kvm/sys_regs.c               | 38 +++++++++++++++++++++--
 4 files changed, 83 insertions(+), 5 deletions(-)

diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
index e2eac48b9d28..eb352760869c 100644
--- a/Documentation/virt/kvm/devices/vcpu.rst
+++ b/Documentation/virt/kvm/devices/vcpu.rst
@@ -383,3 +383,6 @@ the in-kernel irqchip has been initialized.
 
 KVM will refuse to run the VCPU and KVM_RUN will return an error if the SPE
 feature has been set for the VCPU, but SPE hasn't been initialized.
+
+Attempting to access any of the SPE registers until SPE has been initialized on
+the VCPU will fail with -EBUSY.
diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
index 56dc9e660bef..3d8e9720daca 100644
--- a/arch/arm64/include/asm/kvm_spe.h
+++ b/arch/arm64/include/asm/kvm_spe.h
@@ -14,6 +14,7 @@ struct kvm_device_attr;
 struct arm_spe_pmu;
 struct kvm_spe {
 	struct arm_spe_pmu *spe_pmu;
+	u64 pmblimitr_el1_res0_mask;
 };
 
 struct kvm_vcpu_spe {
@@ -26,6 +27,8 @@ bool kvm_supports_spe(void);
 #define vcpu_has_spe(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_SPE))
 
+bool kvm_vcpu_spe_initialized(struct kvm_vcpu *vcpu);
+
 int kvm_spe_vcpu_first_run_init(struct kvm_vcpu *vcpu);
 void kvm_spe_destroy_vm(struct kvm *kvm);
 
@@ -54,6 +57,10 @@ static __always_inline bool kvm_supports_spe(void)
 
 #define vcpu_has_spe(vcpu)	false
 
+static inline bool kvm_vcpu_spe_initialized(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
 static inline int kvm_spe_vcpu_first_run_init(struct kvm_vcpu *vcpu)
 {
 	return 0;
diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
index 6a00a44c73ed..8c173a1f48bd 100644
--- a/arch/arm64/kvm/spe.c
+++ b/arch/arm64/kvm/spe.c
@@ -60,13 +60,43 @@ bool kvm_supports_spe(void)
 	return !list_empty(&spe_pmus);
 }
 
-int kvm_spe_vcpu_first_run_init(struct kvm_vcpu *vcpu)
+bool kvm_vcpu_spe_initialized(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_spe *vcpu_spe = &vcpu->arch.vcpu_spe;
 
-	if (!vcpu_spe->initialized)
+	return vcpu_spe->initialized;
+}
+
+static void kvm_spe_compute_pmblimitr_el1_res0_mask(struct kvm *kvm)
+{
+	u64 res0_mask = GENMASK_ULL(11, 8) | BIT(6) | GENMASK_ULL(4, 3);
+
+	if (!kvm_has_feat(kvm, ID_AA64DFR2_EL1, SPE_nVM, IMP))
+		res0_mask |= PMBLIMITR_EL1_nVM_MASK;
+
+	if (!kvm_has_feat_enum(kvm, ID_AA64MMFR0_EL1, TGRAN4, NI))
+		goto set_mask;
+
+	if (kvm_has_feat(kvm, ID_AA64MMFR0_EL1, TGRAN16, IMP))
+		res0_mask |= GENMASK_ULL(13, 12);
+	else
+		res0_mask |= GENMASK_ULL(15, 12);
+
+set_mask:
+	WRITE_ONCE(kvm->arch.kvm_spe.pmblimitr_el1_res0_mask, res0_mask);
+}
+
+int kvm_spe_vcpu_first_run_init(struct kvm_vcpu *vcpu)
+{
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_spe *kvm_spe = &kvm->arch.kvm_spe;
+
+	if (!kvm_vcpu_spe_initialized(vcpu))
 		return -EINVAL;
 
+	if (!kvm_spe->pmblimitr_el1_res0_mask)
+		kvm_spe_compute_pmblimitr_el1_res0_mask(kvm);
+
 	return 0;
 }
 
@@ -85,8 +115,12 @@ void kvm_spe_destroy_vm(struct kvm *kvm)
 
 bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val)
 {
+	struct kvm_spe *kvm_spe = &vcpu->kvm->arch.kvm_spe;
+
 	switch (reg) {
 	case PMBLIMITR_EL1:
+		val &= ~kvm_spe->pmblimitr_el1_res0_mask;
+		fallthrough;
 	case PMBSR_EL1:
 	case PMBPTR_EL1:
 		__vcpu_assign_sys_reg(vcpu, reg, val);
@@ -217,7 +251,7 @@ int kvm_spe_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 	if (!vcpu_has_spe(vcpu))
 		return -ENODEV;
 
-	if (vcpu_spe->initialized)
+	if (kvm_vcpu_spe_initialized(vcpu))
 		return -EBUSY;
 
 	switch (attr->attr) {
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 89b01b6ac783..4c4bf88c9aa5 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1563,6 +1563,38 @@ static unsigned int spe_visibility(const struct kvm_vcpu *vcpu,
 	return REG_HIDDEN;
 }
 
+static int set_user_spe_sysreg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
+			       u64 val)
+{
+	int reg = r->reg;
+
+	if (!kvm_vcpu_spe_initialized(vcpu))
+		return -EBUSY;
+
+	if (reg == PMBLIMITR_EL1 || reg == PMBPTR_EL1 || reg == PMBSR_EL1)
+		kvm_spe_write_sysreg(vcpu, reg, val);
+	else
+		__vcpu_assign_sys_reg(vcpu, reg, val);
+
+	return 0;
+}
+
+static int get_user_spe_sysreg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
+			       u64 *val)
+{
+	int reg = r->reg;
+
+	if (!kvm_vcpu_spe_initialized(vcpu))
+		return -EBUSY;
+
+	if (reg == PMBLIMITR_EL1 || reg == PMBPTR_EL1 || reg == PMBSR_EL1)
+		*val = kvm_spe_read_sysreg(vcpu, reg);
+	else
+		*val = __vcpu_sys_reg(vcpu, reg);
+
+	return 0;
+}
+
 static bool access_spe_reg(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			   const struct sys_reg_desc *r)
 {
@@ -1610,11 +1642,13 @@ static bool access_spe_reg(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 
 #define SPE_SYS_REG(name)						\
 	SYS_DESC(SYS_##name), .reg = name, .access = access_spe_reg,	\
-	.reset = reset_val, .val = 0, .visibility = spe_visibility
+	.reset = reset_val, .val = 0, .visibility = spe_visibility,	\
+	.set_user = set_user_spe_sysreg, .get_user = get_user_spe_sysreg
 
 #define SPE_UNTRAPPED_REG(name)						\
 	SYS_DESC(SYS_##name), .reg = name, .access = undef_access,	\
-	.reset = reset_val, .val = 0, .visibility = spe_visibility
+	.reset = reset_val, .val = 0, .visibility = spe_visibility,	\
+	.set_user = set_user_spe_sysreg, .get_user = get_user_spe_sysreg
 
 /* Macro to expand the AMU counter and type registers*/
 #define AMU_AMEVCNTR0_EL0(n) { SYS_DESC(SYS_AMEVCNTR0_EL0(n)), undef_access }
-- 
2.43.0


