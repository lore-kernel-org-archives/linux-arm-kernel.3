Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74FBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 11:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhbOHS1LSUQnR0ZAmptYt5E326/dXJ8jgX1+l0kSoEs=; b=y4FLWGscXQOI/S6oDP7ogT3/J1
	3zqKQ+vMZ5P8HNu2jJtRHD5cbvAONePbMma5sBo8B5UV94PXmBfTlcdiRGMHsYZ/pqwdJZQTJGuV8
	750Rt5m/gA4SmRfAlTzjF2TYJy/bUyOw6x4J9C/1L0DuzTWv+ZXzl9tK8YaUsgeV503ZEHSZ039la
	B4rlFMV2QvYQ2dw6B0yu5uOAICyk5mPQNSlxYL7wkLes40QNK2VyDQOAOcCj0LYWxvj4D6rsWzSkT
	ZAbOhduQ1vXd/RxW8sgKHtN9DK5IhKTISPinqHzWXZu+x6GhAk3l1QtfWB0+HAg/cK2TO80yU/NZC
	EtJLQd8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCuG-0000000F45w-02eH;
	Fri, 10 Jan 2025 11:10:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWClI-0000000F2kk-45nI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 11:01:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 798325C5BEA;
	Fri, 10 Jan 2025 11:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A23A3C4CED6;
	Fri, 10 Jan 2025 11:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736506868;
	bh=UC8nUjZKGXc68nYBY2MUUDphy0F97Omhafd+N3duSlE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iiuAzdT9jlu5T0GUYeDJlrjDEHehXsr778oIyn2pohGSexWVblLet9S41jaMgZ6jM
	 0DltV1Uhj6jvxwB75aS+DnSkvPdg5Tht76d+fpCQY8WtmLwztAmq6D+NgBT81o+LBb
	 6K8VWbTW2aihb4WJ+CFdwCeXdrPEF14457VYIIMYsNk2RXSNJeZUMJJJ4fK9u53zBk
	 NFWW5uWPw9PmS5aD2tC76NepCGog+M1LiQ9CHKEQuFciRbdXrUs9jxB0Qnt1fSHJeY
	 ypxSTpCbVz+f+DOC2odNSTj1vDdKsSztE44Yxlp1HYr30ji//idUrdeSIbE2f3BAK/
	 MKLmhLeTkwPrg==
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
Subject: [PATCH v2 7/7] KVM: arm64: Split some of the kvm_pgtable_prot bits into separate defines
Date: Fri, 10 Jan 2025 16:30:23 +0530
Message-ID: <20250110110023.2963795-8-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250110110023.2963795-1-aneesh.kumar@kernel.org>
References: <20250110110023.2963795-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_030109_090379_63C4F889 
X-CRM114-Status: GOOD (  18.27  )
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

Some of the kvm_pgtable_prot values are mutually exclusive, like
KVM_PGTABLE_PROT_NORMAL_NC and KVM_PGTABLE_PROT_DEVICE. This patch
splits the Normal memory non-cacheable and NoTagAccess attributes into
separate #defines. With this change, the kvm_pgtable_prot bits only
indicate whether it is a device or normal memory mapping.

There are no functional changes in this patch.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/kvm_pgtable.h  | 10 +++---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c |  2 +-
 arch/arm64/kvm/hyp/pgtable.c          | 47 +++++++++++++--------------
 arch/arm64/kvm/mmu.c                  | 10 +++---
 4 files changed, 36 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 0daf4ffedc99..9443a8ad9343 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -239,7 +239,6 @@ enum kvm_pgtable_stage2_flags {
  * @KVM_PGTABLE_PROT_W:		Write permission.
  * @KVM_PGTABLE_PROT_R:		Read permission.
  * @KVM_PGTABLE_PROT_DEVICE:	Device attributes.
- * @KVM_PGTABLE_PROT_NORMAL_NC:	Normal noncacheable attributes.
  * @KVM_PGTABLE_PROT_SW0:	Software bit 0.
  * @KVM_PGTABLE_PROT_SW1:	Software bit 1.
  * @KVM_PGTABLE_PROT_SW2:	Software bit 2.
@@ -251,8 +250,6 @@ enum kvm_pgtable_prot {
 	KVM_PGTABLE_PROT_R			= BIT(2),
 
 	KVM_PGTABLE_PROT_DEVICE			= BIT(3),
-	KVM_PGTABLE_PROT_NORMAL_NC		= BIT(4),
-	KVM_PGTABLE_PROT_NORMAL_NOTAGACCESS	= BIT(5),
 
 	KVM_PGTABLE_PROT_SW0			= BIT(55),
 	KVM_PGTABLE_PROT_SW1			= BIT(56),
@@ -263,6 +260,11 @@ enum kvm_pgtable_prot {
 #define KVM_PGTABLE_PROT_RW	(KVM_PGTABLE_PROT_R | KVM_PGTABLE_PROT_W)
 #define KVM_PGTABLE_PROT_RWX	(KVM_PGTABLE_PROT_RW | KVM_PGTABLE_PROT_X)
 
+/* different memory attribute requested */
+#define	KVM_PGTABLE_ATTR_NORMAL_NC		0x1
+#define	KVM_PGTABLE_ATTR_NORMAL_NOTAGACCESS	0x2
+
+
 #define PKVM_HOST_MEM_PROT	KVM_PGTABLE_PROT_RWX
 #define PKVM_HOST_MMIO_PROT	KVM_PGTABLE_PROT_RW
 
@@ -606,7 +608,7 @@ kvm_pte_t *kvm_pgtable_stage2_create_unlinked(struct kvm_pgtable *pgt,
  * Return: 0 on success, negative error code on failure.
  */
 int kvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
-			   u64 phys, enum kvm_pgtable_prot prot,
+			   u64 phys, enum kvm_pgtable_prot prot, int mem_attr,
 			   void *mc, enum kvm_pgtable_walk_flags flags);
 
 /**
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index caba3e4bd09e..25c8b2fbce15 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -411,7 +411,7 @@ static inline int __host_stage2_idmap(u64 start, u64 end,
 				      enum kvm_pgtable_prot prot)
 {
 	return kvm_pgtable_stage2_map(&host_mmu.pgt, start, end - start, start,
-				      prot, &host_s2_pool, 0);
+				      prot, 0, &host_s2_pool, 0);
 }
 
 /*
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 4eb6e9345c12..9dd93ae8bb97 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -673,35 +673,34 @@ void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
 #define KVM_S2_MEMATTR(pgt, attr) PAGE_S2_MEMATTR(attr, stage2_has_fwb(pgt))
 
 static int stage2_set_prot_attr(struct kvm_pgtable *pgt, enum kvm_pgtable_prot prot,
-				kvm_pte_t *ptep)
+				int mem_attr, kvm_pte_t *ptep)
 {
 	kvm_pte_t attr;
 	u32 sh = KVM_PTE_LEAF_ATTR_LO_S2_SH_IS;
-	unsigned long prot_mask = KVM_PGTABLE_PROT_DEVICE |
-				  KVM_PGTABLE_PROT_NORMAL_NC |
-				  KVM_PGTABLE_PROT_NORMAL_NOTAGACCESS;
+	bool device = prot & KVM_PGTABLE_PROT_DEVICE;
 
-	switch (prot & prot_mask) {
-	case KVM_PGTABLE_PROT_DEVICE | KVM_PGTABLE_PROT_NORMAL_NC:
-		return -EINVAL;
-	case KVM_PGTABLE_PROT_DEVICE:
+	if (device) {
 		if (prot & KVM_PGTABLE_PROT_X)
 			return -EINVAL;
 		attr = KVM_S2_MEMATTR(pgt, DEVICE_nGnRE);
-		break;
-	case KVM_PGTABLE_PROT_NORMAL_NC:
-		if (prot & KVM_PGTABLE_PROT_X)
+		if (!mem_attr)
 			return -EINVAL;
-		attr = KVM_S2_MEMATTR(pgt, NORMAL_NC);
-		break;
-	case KVM_PGTABLE_PROT_NORMAL_NOTAGACCESS:
-		if (system_supports_notagaccess())
-			attr = KVM_S2_MEMATTR(pgt, NORMAL_NOTAGACCESS);
-		else
-			return -EINVAL;
-		break;
-	default:
-		attr = KVM_S2_MEMATTR(pgt, NORMAL);
+	} else {
+		switch (mem_attr) {
+		case KVM_PGTABLE_ATTR_NORMAL_NC:
+			if (prot & KVM_PGTABLE_PROT_X)
+				return -EINVAL;
+			attr = KVM_S2_MEMATTR(pgt, NORMAL_NC);
+			break;
+		case KVM_PGTABLE_ATTR_NORMAL_NOTAGACCESS:
+			if (system_supports_notagaccess())
+				attr = KVM_S2_MEMATTR(pgt, NORMAL_NOTAGACCESS);
+			else
+				return -EINVAL;
+			break;
+		default:
+			attr = KVM_S2_MEMATTR(pgt, NORMAL);
+		}
 	}
 
 	if (!(prot & KVM_PGTABLE_PROT_X))
@@ -1060,7 +1059,7 @@ static int stage2_map_walker(const struct kvm_pgtable_visit_ctx *ctx,
 }
 
 int kvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
-			   u64 phys, enum kvm_pgtable_prot prot,
+			   u64 phys, enum kvm_pgtable_prot prot, int mem_attr,
 			   void *mc, enum kvm_pgtable_walk_flags flags)
 {
 	int ret;
@@ -1081,7 +1080,7 @@ int kvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	if (WARN_ON((pgt->flags & KVM_PGTABLE_S2_IDMAP) && (addr != phys)))
 		return -EINVAL;
 
-	ret = stage2_set_prot_attr(pgt, prot, &map_data.attr);
+	ret = stage2_set_prot_attr(pgt, prot, mem_attr, &map_data.attr);
 	if (ret)
 		return ret;
 
@@ -1408,7 +1407,7 @@ kvm_pte_t *kvm_pgtable_stage2_create_unlinked(struct kvm_pgtable *pgt,
 	if (!IS_ALIGNED(phys, kvm_granule_size(level)))
 		return ERR_PTR(-EINVAL);
 
-	ret = stage2_set_prot_attr(pgt, prot, &map_data.attr);
+	ret = stage2_set_prot_attr(pgt, prot, 0, &map_data.attr);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 54e5bfe4f126..87afc8862459 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1130,8 +1130,8 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
 			break;
 
 		write_lock(&kvm->mmu_lock);
-		ret = kvm_pgtable_stage2_map(pgt, addr, PAGE_SIZE, pa, prot,
-					     &cache, 0);
+		ret = kvm_pgtable_stage2_map(pgt, addr, PAGE_SIZE,
+					     pa, prot, 0, &cache, 0);
 		write_unlock(&kvm->mmu_lock);
 		if (ret)
 			break;
@@ -1452,6 +1452,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt;
 	struct page *page;
+	int normal_memattr = 0;
 
 	if (fault_is_perm)
 		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
@@ -1666,7 +1667,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		if (mte_allowed)
 			sanitise_mte_tags(kvm, pfn, vma_pagesize);
 		else if (kvm_has_mte_perm(kvm))
-			prot |= KVM_PGTABLE_PROT_NORMAL_NOTAGACCESS;
+			normal_memattr = KVM_PGTABLE_ATTR_NORMAL_NOTAGACCESS;
 		else {
 			ret = -EFAULT;
 			goto out_unlock;
@@ -1681,7 +1682,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 
 	if (device) {
 		if (vfio_allow_any_uc)
-			prot |= KVM_PGTABLE_PROT_NORMAL_NC;
+			normal_memattr = KVM_PGTABLE_ATTR_NORMAL_NC;
 		else
 			prot |= KVM_PGTABLE_PROT_DEVICE;
 	} else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC) &&
@@ -1704,6 +1705,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	} else {
 		ret = kvm_pgtable_stage2_map(pgt, fault_ipa, vma_pagesize,
 					     __pfn_to_phys(pfn), prot,
+					     normal_memattr,
 					     memcache,
 					     KVM_PGTABLE_WALK_HANDLE_FAULT |
 					     KVM_PGTABLE_WALK_SHARED);
-- 
2.43.0


