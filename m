Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4D4CC6B3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKUNu0R0OKI1iq99wyKhkUQf3VNsVSOe7CUQAXnHoT8=; b=jOCN7QzriI9j4/h65kTO6i+Ivg
	26titK4RrsUL8lamJIz+9eco43fgh4rdC4MqfKtQ6xCgFknqlHKdSBWe029eZggp+L6ZF2dcpmPXv
	WpBV/Ol0WR68uuXXHgcw7J5xsVytMkVaFwOOcayMdpAdIElxxjNG1W9S/stPY5gZXFRq6EcR0Zohi
	KoJPojnVUDlvinUnXzUHmCMwSBNP46LEkIMsKeLedefjHt4Pan63eAMsUvdXtNthIQn+Dmt8AdnF0
	tO5mW/ICcWyH/DBL7pa8s3Ac1VastRiAzQn04wo5QFLn6u7yIlXra8+cb3Nhk4HM3yt1j56D1+3Ms
	1YTlKElw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMQC-00000000Mrr-1ypb;
	Thu, 15 Oct 2026 14:27:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMPq-00000000MUi-3zW1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:26:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6CE71477;
	Thu, 15 Oct 2026 07:26:38 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.2.198.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BEC33F871;
	Thu, 15 Oct 2026 07:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792074402; bh=PvdO6ybjWfdECdB34WQM6YyFeyokVUC8uljKKclPvzc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MMui53xcVFnSV+nAov7EKqY4GmNDQjZBjcOtMKkczFyBE7FizLCxhMyDpBVHI3hQB
	 5p3+9x9yMpP8yIHDmW5UaTF8ZM75R2xKXhPHGOga83IOYGvBvXqckPxeaKvtqY6YaV
	 Fe+NbtfLYSwESRx52t8Ydqi1Ifixe7NnHan7pK6A=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Alex Williamson <alex@shazbot.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH v2 11/15] KVM: arm64: Export stage-2 MMU config
Date: Thu, 15 Oct 2026 15:25:45 +0100
Message-ID: <20261015142552.4128028-12-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015142552.4128028-1-ryan.roberts@arm.com>
References: <20261015142552.4128028-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_072643_926735_DFEAAE08 
X-CRM114-Status: GOOD (  24.80  )
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

From: Jean-Philippe Brucker <jpb@kernel.org>

Provide an API to drivers that want to share the stage 2 configuration
of a VM with their device. At the moment it is rather limited:

* No invalidation notifiers. The TLBs on the device side, if any,
  receive CPU TLB invalidations.

* No remote page fault support. All paging still takes the normal data
  abort route on the CPU. Options are pinning all guest memory or
  device-specific mechanism for reporting pending faults to the guest.

* No nested VMs. Although we could perhaps support assigning devices to
  the hyp context of a nested VM, it seems performative.

So for the moment this API works for devices that share the CPU MMU, but
the SMMU driver could use it with DVM.

Signed-off-by: Jean-Philippe Brucker <jpb@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  11 ++++
 arch/arm64/include/asm/kvm_mmu.h  |   1 +
 arch/arm64/kvm/mmu.c              | 102 ++++++++++++++++++++++++++++++
 arch/arm64/kvm/sys_regs.c         |  14 +---
 4 files changed, 117 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 30d0082b15ec..c0932b43f959 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -235,6 +235,14 @@ struct kvm_s2_mmu {
 	atomic_t refcnt;
 };
 
+/* stage 2 MMU configuration, for drivers that speak VMSA */
+struct kvm_arch_guest_mmu {
+	u64 hcr;
+	u64 hcrx;
+	u64 vtcr;
+	u64 vttbr;
+};
+
 struct kvm_arch_memory_slot {
 };
 
@@ -1720,4 +1728,7 @@ static __always_inline enum fgt_group_id __fgt_reg_to_group_id(enum vcpu_sysreg
 
 long kvm_get_cap_for_kvm_ioctl(unsigned int ioctl, long *ext);
 
+struct kvm_arch_guest_mmu *kvm_arch_get_guest_mmu(struct kvm *kvm);
+void kvm_arch_put_guest_mmu(struct kvm *kvm, struct kvm_arch_guest_mmu *mmu);
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 6eae7e7e2a68..8a9d385fe14d 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -185,6 +185,7 @@ int kvm_handle_guest_sea(struct kvm_vcpu *vcpu);
 int kvm_handle_guest_abort(struct kvm_vcpu *vcpu);
 
 phys_addr_t kvm_mmu_get_httbr(void);
+u64 kvm_mmu_get_hcr(struct kvm *kvm, u64 hcr);
 phys_addr_t kvm_get_idmap_vector(void);
 int __init kvm_mmu_init(u32 hyp_va_bits);
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 2d44cd6a5aed..0bf1dff2a41f 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2805,3 +2805,105 @@ void kvm_toggle_cache(struct kvm_vcpu *vcpu, bool was_enabled)
 
 	trace_kvm_toggle_cache(*vcpu_pc(vcpu), was_enabled, now_enabled);
 }
+
+#define HCR_MMU_BITS (HCR_VM | HCR_PTW | HCR_DC | HCR_TGE | HCR_RW |	\
+		      HCR_CD | HCR_ID | HCR_E2H | HCR_NV | HCR_NV1 |	\
+		      HCR_FWB | HCR_ATA | HCR_DCT)
+
+/* Update MMU-specific host bits of HCR_EL2 */
+u64 kvm_mmu_get_hcr(struct kvm *kvm, u64 hcr)
+{
+	lockdep_assert_held(&kvm->arch.config_lock);
+
+	WARN_ON(!test_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED,
+			  &kvm->arch.flags));
+
+	hcr &= ~HCR_MMU_BITS;
+	hcr |= HCR_VM | HCR_PTW;
+
+	if (has_vhe() || has_hvhe())
+		hcr |= HCR_E2H;
+
+	if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
+		hcr |= HCR_FWB;
+
+	if (kvm_has_mte(kvm))
+		hcr |= HCR_ATA;
+
+	if (!test_bit(KVM_ARM_VCPU_EL1_32BIT, kvm->arch.vcpu_features))
+		hcr |= HCR_RW;
+
+	return hcr;
+}
+
+/**
+ * kvm_arch_get_guest_mmu - Get a reference to the guest MMU config
+ * @kvm: KVM instance. Caller must hold a reference.
+ *
+ * Get the stage 2 MMU config of an EL1 VM. The returned object contains
+ * settings that do not change until the object is released with
+ * kvm_arch_put_guest_mmu(). This function does not support nested VMs.
+ *
+ * HCR has lots of settings, some of which differ between vCPUs, but most of
+ * them control traps. For EL1 VMs, the bits relevant to MMU translation are
+ * common to all vCPUs:
+ * - VM, PTW, DC, TGE, CD, ID, NV, NV1, DCT have fixed values.
+ * - E2H, FWB, ATA depend on host CPU features (respectively VHE, FWB and MTE2).
+ * - RW depends on vCPU features. This function does not support 32-bit VMs.
+ *
+ * HCRX: EnSDERR, EnSNERR set to 0. TODO: is GCSEn relevant?
+ *
+ * VTCR is set once for the VM, depends on the VM's IPA size.
+ *
+ * VTTBR:
+ * - VMID is pinned, until kvm_arch_put_guest_mmu() is called.
+ * - PGD is allocated and freed with the vm (the caller must hold their
+ *   reference to @kvm). KVM may create and remove page table mappings at any
+ *   moment, and uses normal TLB maintenance operations to synchronize with
+ *   page table walkers. KVM does not notify the caller about mapping changes.
+ * - CNP is a property of the host system.
+ *
+ * Return: a new kvm_arch_guest_mmu instance, or an error pointer on failure.
+ */
+struct kvm_arch_guest_mmu *kvm_arch_get_guest_mmu(struct kvm *kvm)
+{
+	int ret;
+	struct kvm_arch_guest_mmu *mmu;
+
+	guard(mutex)(&kvm->arch.config_lock);
+
+	if (is_protected_kvm_enabled())
+		return ERR_PTR(-EOPNOTSUPP);
+
+	if (!test_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags) ||
+	    test_bit(KVM_ARM_VCPU_EL1_32BIT, kvm->arch.vcpu_features) ||
+	    test_bit(KVM_ARM_VCPU_HAS_EL2, kvm->arch.vcpu_features))
+		return ERR_PTR(-EINVAL);
+
+	ret = kvm_arm_pinned_vmid_get(kvm);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	ret = -ENOMEM;
+	mmu = kzalloc_obj(*mmu, GFP_KERNEL_ACCOUNT);
+	if (!mmu)
+		goto err_unpin_vmid;
+
+	mmu->vtcr = kvm->arch.mmu.vtcr;
+	mmu->vttbr = kvm_get_vttbr(&kvm->arch.mmu);
+	mmu->hcr = kvm_mmu_get_hcr(kvm, 0);
+
+	return mmu;
+
+err_unpin_vmid:
+	kvm_arm_pinned_vmid_put(kvm);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(kvm_arch_get_guest_mmu);
+
+void kvm_arch_put_guest_mmu(struct kvm *kvm, struct kvm_arch_guest_mmu *mmu)
+{
+	kvm_arm_pinned_vmid_put(kvm);
+	kfree(mmu);
+}
+EXPORT_SYMBOL_GPL(kvm_arch_put_guest_mmu);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index a2f4e769a428..20277f888380 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5798,8 +5798,8 @@ static void vcpu_set_hcr(struct kvm_vcpu *vcpu)
 {
 	struct kvm *kvm = vcpu->kvm;
 
-	if (has_vhe() || has_hvhe())
-		vcpu->arch.hcr_el2 |= HCR_E2H;
+	vcpu->arch.hcr_el2 = kvm_mmu_get_hcr(kvm, vcpu->arch.hcr_el2);
+
 	if (cpus_have_final_cap(ARM64_HAS_RAS_EXTN)) {
 		/* route synchronous external abort exceptions to EL2 */
 		vcpu->arch.hcr_el2 |= HCR_TEA;
@@ -5807,9 +5807,6 @@ static void vcpu_set_hcr(struct kvm_vcpu *vcpu)
 		vcpu->arch.hcr_el2 |= HCR_TERR;
 	}
 
-	if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
-		vcpu->arch.hcr_el2 |= HCR_FWB;
-
 	if (cpus_have_final_cap(ARM64_HAS_EVT) &&
 	    !cpus_have_final_cap(ARM64_MISMATCHED_CACHE_TYPE) &&
 	    kvm_read_vm_id_reg(kvm, SYS_CTR_EL0) == read_sanitised_ftr_reg(SYS_CTR_EL0))
@@ -5817,12 +5814,7 @@ static void vcpu_set_hcr(struct kvm_vcpu *vcpu)
 	else
 		vcpu->arch.hcr_el2 |= HCR_TID2;
 
-	if (vcpu_el1_is_32bit(vcpu))
-		vcpu->arch.hcr_el2 &= ~HCR_RW;
-
-	if (kvm_has_mte(vcpu->kvm))
-		vcpu->arch.hcr_el2 |= HCR_ATA;
-	else
+	if (!kvm_has_mte(vcpu->kvm))
 		vcpu->arch.hcr_el2 |= HCR_TID5;
 
 	/*
-- 
2.43.0


