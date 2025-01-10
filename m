Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E40E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 11:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bfnWtsE5XFkJqK0Cjf634QpZ99f9UU8Q0TQQnu5Pq34=; b=jcFxeHKwGEQIN/Z/IG+K+IuzHG
	2Cc+haR8MQfc4mEVrRiYm8ASQ0EVwS3YBeb+iPwc36dZU9504OwvRUZ94JE//YBk1qVEa3S/R2+sE
	5exkEYnvZfMVMvzSlcYR58SsiZuI4jEOOyjBfK8m+DX1R+TIby33aUHfxM1KKwVQtAfmcvineGB1a
	BQRXrnbSa2mnz5tPz2bVIMcsC0ZpzhpRXV6ZwBqmZ1Wg1Tsp7cpJP3VNYOtgGwcGaGGjJw+KgooSt
	it767W8jX+6orga92TyeqIAL39ZzdEFROSVhcRhFDVkffV/sNLyxe1BmYsyEERn5DJDooAtNWAYBA
	UZjywxlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCrr-0000000F3eP-30vI;
	Fri, 10 Jan 2025 11:07:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCl9-0000000F2iJ-2rMY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 11:01:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2D8EDA41D3B;
	Fri, 10 Jan 2025 10:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45BF9C4CED6;
	Fri, 10 Jan 2025 11:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736506858;
	bh=9TRUXlBD9cnMC5DbsHqNqQnojwDs/LFT/n1O8JicJ8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=forSODSfA5wvDsad6NgM9MiLxYKOq6M8GDI68srPidmKv7oTJb2PAHUauu7I2ZqQY
	 XPSmKzbVYufufRIM12advoubbPsvl8dp95bcKzcGfsAcuNoe/58hTPHzJ2Dh3azeuO
	 w0WxFL/Wvf5lhhVl3GMIIUB1/QIna7pyBs90iQ8BzSBtF0+L9qpLWaN2OOo3WZSl7S
	 K0dulV+Edoo4ecmXF0cQB325pRJ7s6t+0TKN7oY+/wpZylt3fCaTQyTmDgbW1D2Aip
	 Bubrdcj6roBNw+1V8zpuwdntLDwNSlvE9Wmy1wD7piOK9BzQYlUGn0+t4KHRxKYYr8
	 5Bz4MeUYeTuzw==
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
Subject: [PATCH v2 5/7] KVM: arm64: MTE: Use stage-2 NoTagAccess memory attribute if supported
Date: Fri, 10 Jan 2025 16:30:21 +0530
Message-ID: <20250110110023.2963795-6-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250110110023.2963795-1-aneesh.kumar@kernel.org>
References: <20250110110023.2963795-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_030059_859164_33330FF6 
X-CRM114-Status: GOOD (  24.61  )
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
that VMM can decide to kill the guest or take any corrective actions

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 Documentation/virt/kvm/api.rst       |  3 +++
 arch/arm64/include/asm/kvm_emulate.h |  5 +++++
 arch/arm64/include/asm/kvm_pgtable.h |  1 +
 arch/arm64/kvm/hyp/pgtable.c         | 16 +++++++++++++---
 arch/arm64/kvm/mmu.c                 | 17 ++++++++++++++---
 include/linux/kvm_host.h             | 10 ++++++++++
 include/uapi/linux/kvm.h             |  1 +
 7 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e954fca76c27..3b357f9b76d6 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -7115,6 +7115,9 @@ describes properties of the faulting access that are likely pertinent:
  - KVM_MEMORY_EXIT_FLAG_PRIVATE - When set, indicates the memory fault occurred
    on a private memory access.  When clear, indicates the fault occurred on a
    shared access.
+ - KVM_MEMORY_EXIT_FLAG_NOTAGACCESS - When set, indicates the memory fault
+   occurred due to allocation tag access on a memory region that doesn't support
+   allocation tags.
 
 Note!  KVM_EXIT_MEMORY_FAULT is unique among all KVM exit reasons in that it
 accompanies a return code of '-1', not '0'!  errno will always be set to EFAULT
diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index cf811009a33c..609ed6a5ffce 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -378,6 +378,11 @@ static inline bool kvm_vcpu_trap_is_exec_fault(const struct kvm_vcpu *vcpu)
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
index aab04097b505..0daf4ffedc99 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -252,6 +252,7 @@ enum kvm_pgtable_prot {
 
 	KVM_PGTABLE_PROT_DEVICE			= BIT(3),
 	KVM_PGTABLE_PROT_NORMAL_NC		= BIT(4),
+	KVM_PGTABLE_PROT_NORMAL_NOTAGACCESS	= BIT(5),
 
 	KVM_PGTABLE_PROT_SW0			= BIT(55),
 	KVM_PGTABLE_PROT_SW1			= BIT(56),
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 40bd55966540..4eb6e9345c12 100644
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
index eb8220a409e1..3610bea7607d 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1660,9 +1660,11 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 
 	if (!fault_is_perm && !device && kvm_has_mte(kvm)) {
 		/* Check the VMM hasn't introduced a new disallowed VMA */
-		if (mte_allowed) {
+		if (mte_allowed)
 			sanitise_mte_tags(kvm, pfn, vma_pagesize);
-		} else {
+		else if (kvm_has_mte_perm(kvm))
+			prot |= KVM_PGTABLE_PROT_NORMAL_NOTAGACCESS;
+		else {
 			ret = -EFAULT;
 			goto out_unlock;
 		}
@@ -1840,6 +1842,14 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 
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
@@ -2152,7 +2162,8 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 		if (!vma)
 			break;
 
-		if (kvm_has_mte(kvm) && !kvm_vma_mte_allowed(vma)) {
+		if (kvm_has_mte(kvm) &&
+		    !kvm_has_mte_perm(kvm) && !kvm_vma_mte_allowed(vma)) {
 			ret = -EINVAL;
 			break;
 		}
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 401439bb21e3..8a270f658f36 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2471,6 +2471,16 @@ static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
 		vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_PRIVATE;
 }
 
+static inline void kvm_prepare_notagaccess_exit(struct kvm_vcpu *vcpu,
+						 gpa_t gpa, gpa_t size)
+{
+	vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
+	vcpu->run->memory_fault.flags = KVM_MEMORY_EXIT_FLAG_NOTAGACCESS;
+	vcpu->run->memory_fault.gpa = gpa;
+	vcpu->run->memory_fault.size = size;
+}
+
+
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
 static inline unsigned long kvm_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
 {
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 4900ff577819..7136d28eb307 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -442,6 +442,7 @@ struct kvm_run {
 		/* KVM_EXIT_MEMORY_FAULT */
 		struct {
 #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
+#define KVM_MEMORY_EXIT_FLAG_NOTAGACCESS (1ULL << 4)
 			__u64 flags;
 			__u64 gpa;
 			__u64 size;
-- 
2.43.0


