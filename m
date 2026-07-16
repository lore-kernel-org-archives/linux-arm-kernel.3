Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451A0C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iiBob4u3aYVxL2rvtOvM7lNyulBaXp//qwtdfCmAvSI=; b=YxreNoZopADduXYqLQ4SF1nZfJ
	JmnI63tepja3oFUGTr2EqzgG7q0BhgFWgz3xWDu/ZI9iQkuOqUUB2VdXq0AAH5itHZwtLhu/yBwHc
	FbOgbGfubTSXD12dbjz35pdW3Daze4VqsNPR8vS6EnB9/giQTDFwb7GJs7R/2hXKxlW0iDUuF2M6E
	fiZ2k2hGBJcCJwelCWnoDxlQrMevE2XPpo6d3YG+Z27gW/n6nuoXdNzXs/RC6r+aGcHOGYemAacos
	8BWJGHJYXiAEj7LEOV0M8MM132KhlB+bYQHCTY96VvTPsVYRjcN9TyAqjd1v7rHWjkgSElVtI8xP6
	vdexn0yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMmv-0000000HRsI-3tuw;
	Thu, 16 Jul 2026 14:10:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMmt-0000000HRqQ-3TKP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 14:10:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4ABC360A58;
	Thu, 16 Jul 2026 14:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353CD1F00A3D;
	Thu, 16 Jul 2026 14:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784211007;
	bh=iiBob4u3aYVxL2rvtOvM7lNyulBaXp//qwtdfCmAvSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZeciVQYKDBpXeGR5yBpMPBNFWFdnl6kXZ7TXw3NQOEkQepZ3fR3khduZJo2KByfLx
	 qAQYt72eXClmm6VNVzfsCzS5dw9IkLHd+jOBZ8kCzWuTD51lCMR52B5m/Vc9SO+P8X
	 hm+jMRYP+yY5lpXXidXqiQu+Vz5UVUAOuI1UBCa8sahjb0G0gCmRWaHh9XNaR9UeeU
	 pQXg5qYN1cmbLxK9Udj0BmP1yn3IgVHiU/R3+TOsKNDC+QVWTwmEn9Cp78MssVCRQ5
	 YYr/ALI0T2vaqMRLj/r1jMONRmiSIhykV3mf8G5e703SXOs0BUy7fCL5uwy94gcBZC
	 tt8DvbZ8sx87w==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [RFC PATCH 4/5] KVM: arm64: Rename the hyp private VA allocation base
Date: Thu, 16 Jul 2026 19:39:35 +0530
Message-ID: <20260716140936.4003182-5-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716140936.4003182-1-aneesh.kumar@kernel.org>
References: <20260716140936.4003182-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

io_map_base is not used for I/O mappings. It is the allocation base for
private hyp VAs used by stacks, fixmaps and others.

Rename it to __hyp_private_va_base in the hyp code

No functional change in this patch.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/mm.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 061fca95a78a..3233a7c70f7c 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -24,7 +24,7 @@ hyp_spinlock_t pkvm_pgd_lock;
 struct memblock_region hyp_memory[HYP_MEMBLOCK_REGIONS];
 unsigned int hyp_memblock_nr;
 
-static u64 __io_map_base;
+static u64 __hyp_private_va_base;
 
 struct hyp_fixmap_slot {
 	u64 addr;
@@ -50,7 +50,7 @@ static int __pkvm_alloc_private_va_range(unsigned long start, size_t size)
 
 	hyp_assert_lock_held(&pkvm_pgd_lock);
 
-	if (!start || start < __io_map_base)
+	if (!start || start < __hyp_private_va_base)
 		return -EINVAL;
 
 	/* The allocated size is always a multiple of PAGE_SIZE */
@@ -60,7 +60,7 @@ static int __pkvm_alloc_private_va_range(unsigned long start, size_t size)
 	if (cur > __hyp_vmemmap)
 		return -ENOMEM;
 
-	__io_map_base = cur;
+	__hyp_private_va_base = cur;
 
 	return 0;
 }
@@ -70,8 +70,8 @@ static int __pkvm_alloc_private_va_range(unsigned long start, size_t size)
  * @size:	The size of the VA range to reserve.
  * @haddr:	The hypervisor virtual start address of the allocation.
  *
- * The private virtual address (VA) range is allocated above __io_map_base
- * and aligned based on the order of @size.
+ * The private virtual address (VA) range is allocated from
+ * __hyp_private_va_base and aligned based on the order of @size.
  *
  * Return: 0 on success or negative error code on failure.
  */
@@ -81,7 +81,7 @@ int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr)
 	int ret;
 
 	hyp_spin_lock(&pkvm_pgd_lock);
-	addr = __io_map_base;
+	addr = __hyp_private_va_base;
 	ret = __pkvm_alloc_private_va_range(addr, size);
 	hyp_spin_unlock(&pkvm_pgd_lock);
 
@@ -365,7 +365,7 @@ static int create_fixblock(void)
 		return -EINVAL;
 
 	hyp_spin_lock(&pkvm_pgd_lock);
-	addr = ALIGN(__io_map_base, PMD_SIZE);
+	addr = ALIGN(__hyp_private_va_base, PMD_SIZE);
 	ret = __pkvm_alloc_private_va_range(addr, PMD_SIZE);
 	if (ret)
 		goto unlock;
@@ -446,12 +446,13 @@ int hyp_create_idmap(u32 hyp_va_bits)
 	 * memory -- see va_layout.c for more details. The other half of the VA
 	 * space contains the trampoline page, and needs some care. Split that
 	 * second half in two and find the quarter of VA space not conflicting
-	 * with the idmap to place the IOs and the vmemmap. IOs use the lower
-	 * half of the quarter and the vmemmap the upper half.
+	 * with the idmap to place private mappings and the vmemmap. Private
+	 * mappings use the lower half of the quarter and the vmemmap the upper
+	 * half.
 	 */
-	__io_map_base = start & BIT(hyp_va_bits - 2);
-	__io_map_base ^= BIT(hyp_va_bits - 2);
-	__hyp_vmemmap = __io_map_base | BIT(hyp_va_bits - 3);
+	__hyp_private_va_base = start & BIT(hyp_va_bits - 2);
+	__hyp_private_va_base ^= BIT(hyp_va_bits - 2);
+	__hyp_vmemmap = __hyp_private_va_base | BIT(hyp_va_bits - 3);
 
 	return __pkvm_create_mappings(start, end - start, start, PAGE_HYP_EXEC);
 }
@@ -464,13 +465,13 @@ int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr)
 
 	hyp_spin_lock(&pkvm_pgd_lock);
 
-	prev_base = __io_map_base;
+	prev_base = __hyp_private_va_base;
 	/*
 	 * Efficient stack verification using the NVHE_STACK_SHIFT bit implies
 	 * an alignment of our allocation on the order of the size.
 	 */
 	size = NVHE_STACK_SIZE * 2;
-	addr = ALIGN(__io_map_base, size);
+	addr = ALIGN(__hyp_private_va_base, size);
 
 	ret = __pkvm_alloc_private_va_range(addr, size);
 	if (!ret) {
@@ -486,7 +487,7 @@ int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr)
 		ret = kvm_pgtable_hyp_map(&pkvm_pgtable, addr + NVHE_STACK_SIZE,
 					  NVHE_STACK_SIZE, phys, PAGE_HYP);
 		if (ret)
-			__io_map_base = prev_base;
+			__hyp_private_va_base = prev_base;
 	}
 	hyp_spin_unlock(&pkvm_pgd_lock);
 
-- 
2.43.0


