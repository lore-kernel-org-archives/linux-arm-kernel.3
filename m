Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DE2CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 21:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dsN3ynMMxlhmMyFt7gPVET0BUqsdBDsHXRxFy4kqjM0=; b=A47SWciG0b9tiBkYzIPYS5WHP8
	Tvs5Dso5TJjLRm8yiKasK11I4qbODxjCYTjrKC+07Su4nkV0SMCnVUrB0O5VWjhRDMF3umG56+IrW
	1ZPDIK8eOsp2bSe70OUOzz+EifrESMM/+d1HnPUCKe0feV8MbM2DuG9ELem40ash/YCy4rdh5w0HJ
	VHHXKj7v9Yd4YVFnb4byatif8TwSBuquqz2TzjVOYXKuWjPoWdSTZUo5d+TXS3JYN6wJCczovhi1g
	uTwX2FiFhoLd8osQUdS7Z/yjAUxqZ6jb3sor6J5t+kqEJNgRZKKdNnxkhPkicT5zqLFjUejzdyqTe
	+O7pa3lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO1G-0000000ADlH-2Ryr;
	Thu, 01 Oct 2026 21:08:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO1G-0000000ADjN-0tsy
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 21:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dsN3ynMMxlhmMyFt7gPVET0BUqsdBDsHXRxFy4kqjM0=; b=MSM706OBneBFTCGEm0NCsJFp3p
	0MzuCTpJmKaa0SDclTKYa6LQbbCUDzqSW1dz03k8Gb0LMjxgXwpDo9oHCEZPgKW4pFsNX3rWXzmqY
	UU75pPlx2HkvRi1Qa3Zvz5uEvxIMEQost2QLiXVAJBdYEvUJ4vyqx9+W/m5d0ZULrAdXqIuF3bDup
	MpjFBX0KK0rRXuQbOFgE7llVTtOu1vMDrTJukACYa9U2sYsYMt4AhwAFac8JU4EoY+EJpWO8tBqCL
	SnwXiwoGEz1Fp/YEP+50Km0RzpYfN06x+INY8iFhxiaooW+xVZDkxSMnNjabm1W9lwm+OQVVu62Bc
	Ekc3XPTg==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO0x-00000009yvQ-01mn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 21:08:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B16A9497;
	Thu,  1 Oct 2026 14:08:05 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B6A3E3F86F;
	Thu,  1 Oct 2026 14:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790888889; bh=aUMJm4MmfVPuRwP9cR6se83O2r8UV6BA2hVIN/OMalE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hjkHIlzzIi8jgVefRLWrLvcg+DhxiA1FPuo8P5j9/UEhQauQa5exAHd8+tCC9jscf
	 3qqznzN7MnSHuf+Eqbr/wTcsc89UD7N1eN3YsNUw186L0MT8qCXnTjW3OzwS9JUDVQ
	 Mu3Snx6mZSBw2dOy93Ig25BNJyOiUC3EnNlHxD0g=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v21 13/23] KVM: arm64: Mandate VGIC v3 for pKVM VMs and Realms
Date: Thu,  1 Oct 2026 22:06:53 +0100
Message-ID: <20261001210703.1597150-14-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001210703.1597150-1-suzuki.poulose@arm.com>
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_220828_044092_8E7B667B 
X-CRM114-Status: GOOD (  13.26  )
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

pKVM does not trust the host. Realm VMs follow a similar trust model, with
the Realm Management Monitor owning the protected state instead of the host.
Add a helper to identify VMs that run under a host-distrusting hypervisor.

Use this for blocking ioremap of vgic-v2 into stage2 and prevent creation of
VGIC other than v3.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v18:
 - Cover pKVM guests for VGIC v3 mandate.
 - Merge the VGIC mandate check in here.
---
 arch/arm64/include/asm/kvm_host.h | 3 +++
 arch/arm64/kvm/mmu.c              | 2 +-
 arch/arm64/kvm/vgic/vgic-init.c   | 2 ++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 871f503e9f164..4d75b8e6797bb 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -328,6 +328,8 @@ enum fgt_group_id {
 enum kvm_arm_vm_flavor {
 	VM_NVHE,
 	VM_VHE,
+	/* VMs running on a hyp that doesn't trust */
+	MARKER(__VM_DISTRUSTING_HYP),
 	VM_PKVM,		/* Normal guests on pKVM */
 	MARKER(__VM_PROTECTED),
 	VM_PROTECTED_PKVM,	/* Protected VM */
@@ -1575,6 +1577,7 @@ struct kvm *kvm_arch_alloc_vm(void);
 #define kvm_vm_is_unprotected_pkvm(kvm)		\
 	(is_protected_kvm_enabled() && ((kvm)->arch.vm_flavor == VM_PKVM))
 
+#define kvm_vm_hyp_is_distrusting(kvm)	((kvm)->arch.vm_flavor >= __VM_DISTRUSTING_HYP)
 
 int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature);
 bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 8e092efdf0825..8f21652d3625c 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1252,7 +1252,7 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
 				     KVM_PGTABLE_PROT_R |
 				     (writable ? KVM_PGTABLE_PROT_W : 0);
 
-	if (is_protected_kvm_enabled())
+	if (kvm_vm_hyp_is_distrusting(kvm))
 		return -EPERM;
 
 	size += offset_in_page(guest_ipa);
diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 4012df6002ea6..874025513afcc 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -84,6 +84,8 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
 		!kvm_vgic_global_state.can_emulate_gicv2)
 		return -ENODEV;
 
+	if (kvm_vm_hyp_is_distrusting(kvm) && type != KVM_DEV_TYPE_ARM_VGIC_V3)
+		return -ENODEV;
 	/*
 	 * Ensure mutual exclusion with vCPU creation and any vCPU ioctls by:
 	 *
-- 
2.43.0


