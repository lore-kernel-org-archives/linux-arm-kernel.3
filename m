Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23F6D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 09:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCEFUBSeBtH/w8czurRCDNXIaBEQ8K3HP0Tt9FrZzT0=; b=QG78xkqQHd1RFX2ntV3uTwcCAC
	xsJ2iVIGGCeKO5lolFrSX7hp76e/Ee0TuHEG22DoQWPukVWa5sXB2hforE2m+2I5LBhLdtN1SO/uY
	imyorp32J8T1fLNXGKz+7g97TNUxtD3WVH6oVvy7MeSV2dpepcPYk2MS79n+VgYuwGxUUTthmmgI5
	nZtb51f3ytnbWibi9Km2lCAyKqhVEW7jZnIG2Jt5breAYOSJ4rHFxXRKfu46HxrhBM3/Qujf3HH9n
	tp5eby1049iZvLSbOOGqB3TBjJfoZM17YYmQ6xkZClI+RqdUS9rC/kaW/tdhZ1eXI7ZhvZuQsPwgL
	3yFvmZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MVD-0000000AK54-3Kaq;
	Mon, 28 Oct 2024 09:57:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MF3-0000000AGTm-28Du
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 09:40:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ACA99A41B42;
	Mon, 28 Oct 2024 09:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864ABC4CEC3;
	Mon, 28 Oct 2024 09:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730108452;
	bh=G2GbVBqUrl/bAsu9wwCmWG5UWW1Trj57AeTzu57FnfQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jSS9RfBkSCnnPdCu2wVQvHxuuqy4udopoF4zaUlic+tFZf2ZW8eoma6SZoY4+7Agu
	 ILxq83L5EJ6nt/N6TDvo/HYW6ATlKxGP5T5+r3VIlVFXbcTwK7WddFAbcp7ywPAq0a
	 BWY8wK1oamFTPBHzHf+uASLl/5BjsT3Znk5P/T1zT0VkNUoJ2/IohdIYBfiNRxKXLS
	 YAVzh8OSGb9YPZV7XPLkhJa0pnhUa5qkQsXkKi7x6cRfm/bPqVDkz+m2Io+sXYA4eF
	 jzcr8TIBH50Vqz68u90QC+7pxSIEQxwdLgirrXhRV6yo9TpmKqPQ1Pi3Sj0VkPtI2t
	 G2fVt+FoqpdPA==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: [PATCH 4/4] arm64: mte: Use stage-2 NoTagAccess memory attribute if supported
Date: Mon, 28 Oct 2024 15:10:14 +0530
Message-ID: <20241028094014.2596619-5-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028094014.2596619-1-aneesh.kumar@kernel.org>
References: <20241028094014.2596619-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_024053_700193_EF47679E 
X-CRM114-Status: GOOD (  23.61  )
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

Currently, the kernel won't start a guest if the MTE feature is enabled
and the guest RAM is backed by memory which doesn't support access tags.
Update this such that the kernel uses the NoTagAccess memory attribute
while mapping pages from VMAs for which MTE is not allowed. The fault
from accessing the access tags with such pages is forwarded to VMM so
that VMM can decide to kill the guest or remap the pages so that
access tag storage is allowed.

NOTE: We could also use KVM_EXIT_MEMORY_FAULT for this. I chose to
add a new EXIT type because this is arm64 specific exit type.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/kvm_emulate.h |  5 +++++
 arch/arm64/include/asm/kvm_pgtable.h |  1 +
 arch/arm64/kvm/hyp/pgtable.c         | 16 +++++++++++++---
 arch/arm64/kvm/mmu.c                 | 28 ++++++++++++++++++++++------
 include/uapi/linux/kvm.h             |  7 +++++++
 5 files changed, 48 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index a601a9305b10..fa0149a0606a 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -373,6 +373,11 @@ static inline bool kvm_vcpu_trap_is_exec_fault(const struct kvm_vcpu *vcpu)
 	return kvm_vcpu_trap_is_iabt(vcpu) && !kvm_vcpu_abt_iss1tw(vcpu);
 }
 
+static inline bool kvm_vcpu_trap_is_tagaccess(const struct kvm_vcpu *vcpu)
+{
+	return !!(ESR_ELx_ISS2(kvm_vcpu_get_esr(vcpu)) & ESR_ELx_TagAccess);
+}
+
 static __always_inline u8 kvm_vcpu_trap_get_fault(const struct kvm_vcpu *vcpu)
 {
 	return kvm_vcpu_get_esr(vcpu) & ESR_ELx_FSC;
diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 03f4c3d7839c..5657ac1998ad 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -252,6 +252,7 @@ enum kvm_pgtable_prot {
 
 	KVM_PGTABLE_PROT_DEVICE			= BIT(3),
 	KVM_PGTABLE_PROT_NORMAL_NC		= BIT(4),
+	KVM_PGTABLE_PROT_NORMAL_NOTAGACCESS	= BIT(5),
 
 	KVM_PGTABLE_PROT_SW0			= BIT(55),
 	KVM_PGTABLE_PROT_SW1			= BIT(56),
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index b11bcebac908..bc0d9f08c49a 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -677,9 +677,11 @@ static int stage2_set_prot_attr(struct kvm_pgtable *pgt, enum kvm_pgtable_prot p
 {
 	kvm_pte_t attr;
 	u32 sh = KVM_PTE_LEAF_ATTR_LO_S2_SH_IS;
+	unsigned long prot_mask = KVM_PGTABLE_PROT_DEVICE |
+				  KVM_PGTABLE_PROT_NORMAL_NC |
+				  KVM_PGTABLE_PROT_NORMAL_NOTAGACCESS;
 
-	switch (prot & (KVM_PGTABLE_PROT_DEVICE |
-			KVM_PGTABLE_PROT_NORMAL_NC)) {
+	switch (prot & prot_mask) {
 	case KVM_PGTABLE_PROT_DEVICE | KVM_PGTABLE_PROT_NORMAL_NC:
 		return -EINVAL;
 	case KVM_PGTABLE_PROT_DEVICE:
@@ -692,6 +694,12 @@ static int stage2_set_prot_attr(struct kvm_pgtable *pgt, enum kvm_pgtable_prot p
 			return -EINVAL;
 		attr = KVM_S2_MEMATTR(pgt, NORMAL_NC);
 		break;
+	case KVM_PGTABLE_PROT_NORMAL_NOTAGACCESS:
+		if (system_supports_notagaccess())
+			attr = KVM_S2_MEMATTR(pgt, NORMAL_NOTAGACCESS);
+		else
+			return -EINVAL;
+		break;
 	default:
 		attr = KVM_S2_MEMATTR(pgt, NORMAL);
 	}
@@ -872,7 +880,9 @@ static void stage2_unmap_put_pte(const struct kvm_pgtable_visit_ctx *ctx,
 static bool stage2_pte_cacheable(struct kvm_pgtable *pgt, kvm_pte_t pte)
 {
 	u64 memattr = pte & KVM_PTE_LEAF_ATTR_LO_S2_MEMATTR;
-	return kvm_pte_valid(pte) && memattr == KVM_S2_MEMATTR(pgt, NORMAL);
+	return kvm_pte_valid(pte) &&
+	       ((memattr == KVM_S2_MEMATTR(pgt, NORMAL)) ||
+		(memattr == KVM_S2_MEMATTR(pgt, NORMAL_NOTAGACCESS)));
 }
 
 static bool stage2_pte_executable(kvm_pte_t pte)
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index b5824e93cee0..e56c6996332e 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1647,12 +1647,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		 *  not a permission fault implies a translation fault which
 		 *  means mapping the page for the first time
 		 */
-		if (mte_allowed) {
+		if (mte_allowed)
 			sanitise_mte_tags(kvm, pfn, vma_pagesize);
-		} else {
-			ret = -EFAULT;
-			goto out_unlock;
-		}
+		else
+			prot |= KVM_PGTABLE_PROT_NORMAL_NOTAGACCESS;
 	}
 
 	if (writable)
@@ -1721,6 +1719,15 @@ static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 		kvm_set_pfn_accessed(kvm_pte_to_pfn(pte));
 }
 
+static inline void kvm_prepare_notagaccess_exit(struct kvm_vcpu *vcpu,
+						 gpa_t gpa, gpa_t size)
+{
+	vcpu->run->exit_reason = KVM_EXIT_ARM_NOTAG_ACCESS;
+	vcpu->run->notag_access.flags = 0;
+	vcpu->run->notag_access.gpa = gpa;
+	vcpu->run->notag_access.size = size;
+}
+
 /**
  * kvm_handle_guest_abort - handles all 2nd stage aborts
  * @vcpu:	the VCPU pointer
@@ -1833,6 +1840,14 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 
 	gfn = ipa >> PAGE_SHIFT;
 	memslot = gfn_to_memslot(vcpu->kvm, gfn);
+
+	if (kvm_vcpu_trap_is_tagaccess(vcpu)) {
+		/* exit to host and handle the error */
+		kvm_prepare_notagaccess_exit(vcpu, gfn << PAGE_SHIFT, PAGE_SIZE);
+		ret = 0;
+		goto out;
+	}
+
 	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
 	write_fault = kvm_is_write_fault(vcpu);
 	if (kvm_is_error_hva(hva) || (write_fault && !writable)) {
@@ -2145,7 +2160,8 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 		if (!vma)
 			break;
 
-		if (kvm_has_mte(kvm) && !kvm_vma_mte_allowed(vma)) {
+		if (kvm_has_mte(kvm) && !system_supports_notagaccess() &&
+		    !kvm_vma_mte_allowed(vma)) {
 			ret = -EINVAL;
 			break;
 		}
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 637efc055145..a8268a164c4d 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -178,6 +178,7 @@ struct kvm_xen_exit {
 #define KVM_EXIT_NOTIFY           37
 #define KVM_EXIT_LOONGARCH_IOCSR  38
 #define KVM_EXIT_MEMORY_FAULT     39
+#define KVM_EXIT_ARM_NOTAG_ACCESS 40
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -446,6 +447,12 @@ struct kvm_run {
 			__u64 gpa;
 			__u64 size;
 		} memory_fault;
+		/* KVM_EXIT_ARM_NOTAG_ACCESS */
+		struct {
+			__u64 flags;
+			__u64 gpa;
+			__u64 size;
+		} notag_access;
 		/* Fix the size of the union. */
 		char padding[256];
 	};
-- 
2.43.0


