Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8844FCA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+s4NWOlWqk4S+J0HZTfoSpJM7Gl6B52/Z0IH4Bg+ix8=; b=EO2gPrUpZlljsdwJEgvqvRfqgh
	hNeF6cNjFTnsHD3/UXNu9CJCEssLsqcCLJcdMM0R8xrgSi5F8jc3RZUhha/r18CqMxkyl1V9q/0Mj
	2QBlxIT6KE8fT/+8qi2bO+MFk+HPG4SzXbv+PPTiZrbvmuZQ/zxijAEwQGQq2cQv63GQtsVq8+Fgx
	axx6Fd0YGGtgwQuagtx+qwOSDeF3KThm0jYg0F481EsIC0CPanoq3kXhu+GGFb+4/RvjeAaku5tl8
	oC3+TybyTpqD6gn08bycNVeyfDUU6QODZDd6KvrQ9mJooctrFJ8eym5b0b6mKTunxAfiQdMDcz8dS
	xuKp5Bkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmS-00000009NA5-23Sr;
	Thu, 01 Oct 2026 14:29:04 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmP-00000009N5v-2MEV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:29:02 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-48885f0ffe7so3737226f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790864939; x=1791469739; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+s4NWOlWqk4S+J0HZTfoSpJM7Gl6B52/Z0IH4Bg+ix8=;
        b=PCfaW7Yz63CV/DzFNqa257tf1nOeM2cFjgBmZZk4m5ga229PpMuyCWLy0GmNQuntAp
         cw70xkA7sCDzQ6t/cgJ4Fgn2iQAWn1G7y/HrWggsIlRjuZwOyrTs4ZOPFaSP8Z7E8vH3
         /aDbU5Ma9z7c4Kx1aZg8dUvMljkyPH9e0N0Ln9KTDmwT8bPIlKPg+qE4i5E0Vvqotp7j
         JrEL/0d61uY9YjAAK1Q+ZTfQMw/Ha7BfAiJMsx9GY5HioCfP7wuELpPdns9/+CK8bIoh
         IGnnAQ0Z8WLfmyYzBihJL8J+w0q6V7r2YnEjL+q2h8v57M9j8puDkoh4jOfAdKGLgBrG
         kn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864939; x=1791469739;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+s4NWOlWqk4S+J0HZTfoSpJM7Gl6B52/Z0IH4Bg+ix8=;
        b=pjr2dS0GRdYLnp+Ayr7lLCziHw7TKu+tYIXyCIIxsO0jKUg9NPUgrz1cEiLJXLV49+
         +sbGQxhE7D86K3YUAA/ZFwCCgU9BbtUkqFipIJrh+/4TZSs8rxA8PpyJMokZyt/bdKA7
         g2VU3BO288SYf/bFKPuf8AjZ3wD/u6dH+Uw3syMAI9EWTL8I6GiuQHB0POV/jni6ewJg
         Wl1j/GEAEQl72V3aY59YMt2DEld+O4UL2QrdsFozyb4C6jcuw6Md5zExLfn6Wn+MmMXd
         fQXB5uk/jLXMU13s8dAk3SiIJK2gWaYKqy9MiiXSrAqFSYg6I/WBk9tVqse01pkBufzi
         fA/A==
X-Forwarded-Encrypted: i=1; AKwUvByultg8qmKZZt4A+/4NFBR8qCnMJmD+yZCpBZKN8nqt0atuP5F/OyG/n8i+7Zj3P7zIyZDXUfRrdd4bsH1YYoT6@lists.infradead.org
X-Gm-Message-State: AFuF++n0A4msB2IErhb3mwBn5Ql8cWjsnk0STm5GCwILtZFh/koINYLM
	HF6bCpD27yj55Iugaf0wZhrFP+rlpVqvcpZx3hTzhi/R+8ceWfII/y189Db1Y9CdyTnOBIjK1fD
	RQEr+o7UFV2uw7CW0DPF6Fw==
X-Received: from wmpr23.prod.google.com ([2002:a05:600c:3217:b0:4a0:1622:59a0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3d92:b0:4a0:25d5:e853 with SMTP id 5b1f17b1804b1-4a025d5eaf7mr14273125e9.35.1790864938529;
 Thu, 01 Oct 2026 07:28:58 -0700 (PDT)
Date: Thu,  1 Oct 2026 15:28:34 +0100
In-Reply-To: <20261001142849.3367614-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001142849.3367614-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001142849.3367614-4-vdonnefort@google.com>
Subject: [PATCH v6 03/18] KVM: arm64: Add pkvm_map_private_va_range
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_072901_639518_375D1F8C 
X-CRM114-Status: GOOD (  19.78  )
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

In preparation for the pKVM heap allocator, introduce
pkvm_map_private_va_range() to map a physical range into the pKVM
private range.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/include/nvhe/mm.h |  1 +
 arch/arm64/kvm/hyp/nvhe/mm.c         | 59 ++++++++++++++++++++++++----
 2 files changed, 52 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
index 00cadd13ee5d..ea97ea49820e 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
@@ -31,6 +31,7 @@ int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
 				  unsigned long *haddr);
 int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr);
 int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr);
+int pkvm_map_private_va_range(void *haddr, phys_addr_t phys, size_t size);
 phys_addr_t pkvm_private_va_range_pa(void *va);
 
 #endif /* __KVM_HYP_MM_H */
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 9ab7f613fa36..4a22fb74182b 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -25,6 +25,7 @@ struct memblock_region hyp_memory[HYP_MEMBLOCK_REGIONS];
 unsigned int hyp_memblock_nr;
 
 static u64 __io_map_base;
+static u64 __io_map_next;
 
 struct hyp_fixmap_slot {
 	u64 addr;
@@ -50,7 +51,7 @@ static int __pkvm_alloc_private_va_range(unsigned long start, size_t size)
 
 	hyp_assert_lock_held(&pkvm_pgd_lock);
 
-	if (!start || start < __io_map_base)
+	if (!start || start < __io_map_next)
 		return -EINVAL;
 
 	/* The allocated size is always a multiple of PAGE_SIZE */
@@ -60,7 +61,7 @@ static int __pkvm_alloc_private_va_range(unsigned long start, size_t size)
 	if (cur > __hyp_vmemmap)
 		return -ENOMEM;
 
-	__io_map_base = cur;
+	__io_map_next = cur;
 
 	return 0;
 }
@@ -70,7 +71,7 @@ static int __pkvm_alloc_private_va_range(unsigned long start, size_t size)
  * @size:	The size of the VA range to reserve.
  * @haddr:	The hypervisor virtual start address of the allocation.
  *
- * The private virtual address (VA) range is allocated above __io_map_base
+ * The private virtual address (VA) range is allocated above __io_map_next
  * and aligned based on the order of @size.
  *
  * Return: 0 on success or negative error code on failure.
@@ -81,7 +82,7 @@ int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr)
 	int ret;
 
 	hyp_spin_lock(&pkvm_pgd_lock);
-	addr = __io_map_base;
+	addr = __io_map_next;
 	ret = __pkvm_alloc_private_va_range(addr, size);
 	hyp_spin_unlock(&pkvm_pgd_lock);
 
@@ -90,6 +91,41 @@ int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr)
 	return ret;
 }
 
+/**
+ * pkvm_map_private_va_range() - Map a physical range into the private VA range
+ * @haddr:	The virtual address in the private range.
+ * @phys:	The physical address to map.
+ * @size:	The size of the range to map.
+ *
+ * The hypervisor VA @haddr must have been first allocated with
+ * pkvm_alloc_private_va_range(). The created mapping can later be removed
+ * with pkvm_remove_mappings().
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int pkvm_map_private_va_range(void *haddr, phys_addr_t phys, size_t size)
+{
+	unsigned long addr = (unsigned long)haddr;
+	int ret;
+
+	if (!PAGE_ALIGNED(addr | phys | size))
+		return -EINVAL;
+
+	guard(hyp_spinlock)(&pkvm_pgd_lock);
+
+	if (addr < __io_map_base || addr >= __io_map_next)
+		return -EINVAL;
+
+	if (size > __io_map_next - addr)
+		return -EINVAL;
+
+	ret = kvm_pgtable_hyp_map(&pkvm_pgtable, addr, size, phys, PAGE_HYP);
+	if (ret)
+		kvm_pgtable_hyp_unmap(&pkvm_pgtable, addr, size);
+
+	return ret;
+}
+
 /**
  * pkvm_private_va_range_pa - Translate a private VA to a physical address.
  * @va:		The private virtual address to translate.
@@ -168,6 +204,12 @@ int pkvm_create_mappings(void *from, void *to, enum kvm_pgtable_prot prot)
  * pkvm_remove_mappings - Remove mappings from the hypervisor page-table
  * @from:	The starting virtual address of the range to remove
  * @to:		The ending virtual address of the range to remove
+ *
+ * The range [@from, @to) can be a subset of the range previously mapped by
+ * pkvm_create_mappings(), as the latter enforces PTE-level mappings. However,
+ * it cannot be a subset of a range mapped by pkvm_map_private_va_range() as
+ * that function allows block mappings which the hypervisor page-table does not
+ * split.
  */
 void pkvm_remove_mappings(void *from, void *to)
 {
@@ -377,7 +419,7 @@ static int create_fixblock(void)
 		return -EINVAL;
 
 	hyp_spin_lock(&pkvm_pgd_lock);
-	addr = ALIGN(__io_map_base, PMD_SIZE);
+	addr = ALIGN(__io_map_next, PMD_SIZE);
 	ret = __pkvm_alloc_private_va_range(addr, PMD_SIZE);
 	if (ret)
 		goto unlock;
@@ -462,6 +504,7 @@ int hyp_create_idmap(u32 hyp_va_bits)
 	 */
 	__io_map_base = start & BIT(hyp_va_bits - 2);
 	__io_map_base ^= BIT(hyp_va_bits - 2);
+	__io_map_next = __io_map_base;
 	__hyp_vmemmap = __io_map_base | BIT(hyp_va_bits - 3);
 
 	return __pkvm_create_mappings(start, end - start, start, PAGE_HYP_EXEC);
@@ -475,13 +518,13 @@ int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr)
 
 	hyp_spin_lock(&pkvm_pgd_lock);
 
-	prev_base = __io_map_base;
+	prev_base = __io_map_next;
 	/*
 	 * Efficient stack verification using the NVHE_STACK_SHIFT bit implies
 	 * an alignment of our allocation on the order of the size.
 	 */
 	size = NVHE_STACK_SIZE * 2;
-	addr = ALIGN(__io_map_base, size);
+	addr = ALIGN(__io_map_next, size);
 
 	ret = __pkvm_alloc_private_va_range(addr, size);
 	if (!ret) {
@@ -497,7 +540,7 @@ int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr)
 		ret = kvm_pgtable_hyp_map(&pkvm_pgtable, addr + NVHE_STACK_SIZE,
 					  NVHE_STACK_SIZE, phys, PAGE_HYP);
 		if (ret)
-			__io_map_base = prev_base;
+			__io_map_next = prev_base;
 	}
 	hyp_spin_unlock(&pkvm_pgd_lock);
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


