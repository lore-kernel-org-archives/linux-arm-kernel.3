Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0CEC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGjkGxlJuV1y6dw2eZzjP+247wJLZyc/NOARJ+i0tsY=; b=z9+atGkN5wF9iwCN/wXWYf9AaN
	B8nhdnISMf2jbZPi8Ezaql8d9Fc+MKkinm9/TvY7G5GSqs9lahW0Fp4ivH2XmH6xM5/+6UDCQxcsw
	FS037gvS6f4RGITdTHtaSYpvYD19F16oXk1uhHQ5H/0ueYTfuAsmctbt3zMYXq9HYsPnuXQPc2RY/
	HgdfY0sfj9O0LF+h+OSse6Bha5fGfRkCaQVomBYXiT1AqgSASVkxv2q0hRIKgqcUsWnhMXbrrZZ+Y
	eVT8mfV0+eQj+cYA07GAlUPvKkey5ebQaYqtPcaIcXRQlzojwVvygWKdBUsNdDGxH7o7KZCSGJ3AT
	I4+QF4Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMmm-0000000HRlr-2EM3;
	Thu, 16 Jul 2026 14:10:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMmk-0000000HRl4-40pu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 14:09:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BE6360A59;
	Thu, 16 Jul 2026 14:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128C81F000E9;
	Thu, 16 Jul 2026 14:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784210997;
	bh=pGjkGxlJuV1y6dw2eZzjP+247wJLZyc/NOARJ+i0tsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TaqlmgNHxf7v6dfxYDKUNK3NIREPzioMN1RM9+U49mVKlpU6dCBOGUbNJkT+lzBZn
	 Bos1N7in0wJCKDbjkJUfejmLzgfF53FUhRJHpkN//s6evtmE+Ewjnk1r0sEbOB9ODR
	 252P8AfK4VDGqyA+Iu6DX12FWOCZTjCkq5+BABIQCwPQasORC6jXWbOcY16+eJ6kV+
	 gSVrzZbzJBlO1farHBA5Q6APephp1EC3MVfujeE0lB7i2+ucPhu/9RD44ErHOxin72
	 U9ishXTogAyFJ/yo9RjaVs1SjOo7jLRElugCYOYnKea0ePZbJfqYcC/n7ifnUp9S9E
	 /XFL1CNqlDlZw==
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
Subject: [RFC PATCH 2/5] KVM: arm64: Split hyp mapping APIs by address type
Date: Thu, 16 Jul 2026 19:39:33 +0530
Message-ID: <20260716140936.4003182-3-aneesh.kumar@kernel.org>
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

Kernel-image symbols and linear-map addresses may refer to the same
physical memory, but they are not interchangeable when constructing the
EL2 address space. A kernel-image symbol requires __pa_symbol() for its
physical address and kern_sym_hyp_va() for its runtime hyp VA, whereas a
linear-map address requires __pa() and kern_hyp_va().

The existing create_hyp_mappings() and pkvm_create_mappings() interfaces
do not express this distinction. Host callers prepare symbol addresses
before invoking create_hyp_mappings(), while the common implementation
attempts to infer the physical address from the resulting pointer. The
pKVM implementation similarly assumes that every input can be translated
using the linear hyp VA-to-PA offset.

This ambiguity works while hyp symbols and linear allocations share the
same fixed-offset translation. A later patch introduces an hVHE TTBR1
layout which retains kernel-image VAs for hyp symbols. That layout
requires symbol addresses to be distinguished from linear-map addresses.

Replace create_hyp_mappings() with explicit create_hyp_symbol_mappings()
and create_hyp_linear_mappings() interfaces. Resolve the appropriate hyp
VA and PA in each wrapper, then pass those values to a common mapping
helper. This also removes the need for the generic
kernel-address-to-physical-address classifier.

Apply the same separation to the pKVM mapping code. Introduce symbol and
linear-map wrappers around an internal helper which receives an already
resolved hyp VA range and starting PA. Retain a locked linear variant for
callers which already hold the hyp page-table lock.

Update all callers to use the interface matching the address type they
provide.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/kvm_mmu.h      |  5 +-
 arch/arm64/kvm/arm.c                  | 29 +++++------
 arch/arm64/kvm/hyp/include/nvhe/mm.h  |  8 ++-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 16 ++++--
 arch/arm64/kvm/hyp/nvhe/mm.c          | 46 ++++++++++++-----
 arch/arm64/kvm/hyp/nvhe/setup.c       | 18 ++++---
 arch/arm64/kvm/hyp_trace.c            |  2 +-
 arch/arm64/kvm/mmu.c                  | 71 +++++++++++++++------------
 8 files changed, 122 insertions(+), 73 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 6b708ff176fd..8c2972aa83b0 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -190,7 +190,10 @@ extern u32 __hyp_va_bits;
 
 int kvm_share_hyp(void *from, void *to);
 void kvm_unshare_hyp(void *from, void *to);
-int create_hyp_mappings(void *from, void *to, enum kvm_pgtable_prot prot);
+int create_hyp_linear_mappings(void *from, void *to,
+			       enum kvm_pgtable_prot prot);
+int create_hyp_symbol_mappings(void *from, void *to,
+			       enum kvm_pgtable_prot prot);
 int __create_hyp_mappings(unsigned long start, unsigned long size,
 			  unsigned long phys, enum kvm_pgtable_prot prot);
 int hyp_alloc_private_va_range(size_t size, unsigned long *haddr);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index e1613186efb0..e498bb780382 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2620,7 +2620,7 @@ static int __init kvm_hyp_init_protection(u32 hyp_va_bits)
 	void *addr = phys_to_virt(hyp_mem_base);
 	int ret;
 
-	ret = create_hyp_mappings(addr, addr + hyp_mem_size, PAGE_HYP);
+	ret = create_hyp_linear_mappings(addr, addr + hyp_mem_size, PAGE_HYP);
 	if (ret)
 		return ret;
 
@@ -2772,29 +2772,29 @@ static int __init init_hyp_mode(void)
 	/*
 	 * Map the Hyp-code called directly from the host
 	 */
-	err = create_hyp_mappings(kvm_hyp_kimg_kaddr(__hyp_text_start),
-				  kvm_hyp_kimg_kaddr(__hyp_text_end), PAGE_HYP_EXEC);
+	err = create_hyp_symbol_mappings(__hyp_text_start, __hyp_text_end,
+					 PAGE_HYP_EXEC);
 	if (err) {
 		kvm_err("Cannot map world-switch code\n");
 		goto out_err;
 	}
 
-	err = create_hyp_mappings(kvm_hyp_kimg_kaddr(__hyp_data_start),
-				  kvm_hyp_kimg_kaddr(__hyp_data_end), PAGE_HYP);
+	err = create_hyp_symbol_mappings(__hyp_data_start, __hyp_data_end,
+					 PAGE_HYP);
 	if (err) {
 		kvm_err("Cannot map .hyp.data section\n");
 		goto out_err;
 	}
 
-	err = create_hyp_mappings(kvm_hyp_kimg_kaddr(__hyp_rodata_start),
-				  kvm_hyp_kimg_kaddr(__hyp_rodata_end), PAGE_HYP_RO);
+	err = create_hyp_symbol_mappings(__hyp_rodata_start, __hyp_rodata_end,
+					 PAGE_HYP_RO);
 	if (err) {
 		kvm_err("Cannot map .hyp.rodata section\n");
 		goto out_err;
 	}
 
-	err = create_hyp_mappings(kvm_hyp_kimg_kaddr(__start_rodata),
-				  kvm_hyp_kimg_kaddr(__end_rodata), PAGE_HYP_RO);
+	err = create_hyp_symbol_mappings(__start_rodata, __end_rodata,
+					 PAGE_HYP_RO);
 	if (err) {
 		kvm_err("Cannot map rodata section\n");
 		goto out_err;
@@ -2805,15 +2805,15 @@ static int __init init_hyp_mode(void)
 	 * section thanks to an assertion in the linker script. Map it RW and
 	 * the rest of .bss RO.
 	 */
-	err = create_hyp_mappings(kvm_hyp_kimg_kaddr(__hyp_bss_start),
-				  kvm_hyp_kimg_kaddr(__hyp_bss_end), PAGE_HYP);
+	err = create_hyp_symbol_mappings(__hyp_bss_start, __hyp_bss_end,
+					 PAGE_HYP);
 	if (err) {
 		kvm_err("Cannot map hyp bss section: %d\n", err);
 		goto out_err;
 	}
 
-	err = create_hyp_mappings(kvm_hyp_kimg_kaddr(__hyp_bss_end),
-				  kvm_hyp_kimg_kaddr(__bss_stop), PAGE_HYP_RO);
+	err = create_hyp_symbol_mappings(__hyp_bss_end, __bss_stop,
+					 PAGE_HYP_RO);
 	if (err) {
 		kvm_err("Cannot map bss section\n");
 		goto out_err;
@@ -2846,7 +2846,8 @@ static int __init init_hyp_mode(void)
 		char *percpu_end = percpu_begin + nvhe_percpu_size();
 
 		/* Map Hyp percpu pages */
-		err = create_hyp_mappings(percpu_begin, percpu_end, PAGE_HYP);
+		err = create_hyp_linear_mappings(percpu_begin, percpu_end,
+						 PAGE_HYP);
 		if (err) {
 			kvm_err("Cannot map hyp percpu region\n");
 			goto out_err;
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
index 6e83ce35c2f2..c41152c84705 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
@@ -23,8 +23,12 @@ int hyp_create_idmap(u32 hyp_va_bits);
 int hyp_map_vectors(void);
 int hyp_back_vmemmap(phys_addr_t back);
 int pkvm_cpu_set_vector(enum arm64_hyp_spectre_vector slot);
-int pkvm_create_mappings(void *from, void *to, enum kvm_pgtable_prot prot);
-int pkvm_create_mappings_locked(void *from, void *to, enum kvm_pgtable_prot prot);
+int pkvm_create_linear_mappings(void *from, void *to,
+				enum kvm_pgtable_prot prot);
+int pkvm_create_symbol_mappings(void *from, void *to,
+				enum kvm_pgtable_prot prot);
+int pkvm_create_linear_mappings_locked(void *from, void *to,
+				       enum kvm_pgtable_prot prot);
 int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
 				  enum kvm_pgtable_prot prot,
 				  unsigned long *haddr);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 4e329e39a695..7f815345d6a5 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1109,7 +1109,7 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 		goto unlock;
 
 	__hyp_set_page_state_range(phys, size, PKVM_PAGE_OWNED);
-	WARN_ON(pkvm_create_mappings_locked(virt, virt + size, PAGE_HYP));
+	WARN_ON(pkvm_create_linear_mappings_locked(virt, virt + size, PAGE_HYP));
 	WARN_ON(host_stage2_set_owner_locked(phys, size, PKVM_ID_HYP));
 
 unlock:
@@ -1175,12 +1175,18 @@ int hyp_pin_shared_mem(void *from, void *to)
 		goto unlock;
 
 	for (cur = start; cur < end; cur += PAGE_SIZE) {
+		void *addr = (void *)cur;
+
 		p = hyp_virt_to_page(cur);
 		hyp_page_ref_inc(p);
-		if (p->refcount == 1)
-			WARN_ON(pkvm_create_mappings_locked((void *)cur,
-							    (void *)cur + PAGE_SIZE,
-							    PAGE_HYP));
+		if (p->refcount == 1) {
+			int err;
+
+			err = pkvm_create_linear_mappings_locked(addr,
+								 addr + PAGE_SIZE,
+								 PAGE_HYP);
+			WARN_ON(err);
+		}
 	}
 
 unlock:
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 3b0bee496bff..9150ff94b01a 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -110,23 +110,21 @@ int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
 	return err;
 }
 
-int pkvm_create_mappings_locked(void *from, void *to, enum kvm_pgtable_prot prot)
+static int __pkvm_create_mappings_locked(unsigned long start,
+					 unsigned long end,
+					 phys_addr_t phys,
+					 enum kvm_pgtable_prot prot)
 {
-	unsigned long start = (unsigned long)from;
-	unsigned long end = (unsigned long)to;
-	unsigned long virt_addr;
-	phys_addr_t phys;
-
 	hyp_assert_lock_held(&pkvm_pgd_lock);
 
 	start = start & PAGE_MASK;
 	end = PAGE_ALIGN(end);
+	phys = ALIGN_DOWN(phys, PAGE_SIZE);
 
-	for (virt_addr = start; virt_addr < end; virt_addr += PAGE_SIZE) {
+	for (; start < end; start += PAGE_SIZE, phys += PAGE_SIZE) {
 		int err;
 
-		phys = hyp_virt_to_phys((void *)virt_addr);
-		err = kvm_pgtable_hyp_map(&pkvm_pgtable, virt_addr, PAGE_SIZE,
+		err = kvm_pgtable_hyp_map(&pkvm_pgtable, start, PAGE_SIZE,
 					  phys, prot);
 		if (err)
 			return err;
@@ -135,12 +133,38 @@ int pkvm_create_mappings_locked(void *from, void *to, enum kvm_pgtable_prot prot
 	return 0;
 }
 
-int pkvm_create_mappings(void *from, void *to, enum kvm_pgtable_prot prot)
+int pkvm_create_linear_mappings_locked(void *from, void *to,
+				       enum kvm_pgtable_prot prot)
+{
+	unsigned long start = (unsigned long)from & PAGE_MASK;
+	phys_addr_t phys = hyp_virt_to_phys((void *)start);
+
+	return __pkvm_create_mappings_locked(start, (unsigned long)to,
+					     phys, prot);
+}
+
+int pkvm_create_linear_mappings(void *from, void *to,
+				enum kvm_pgtable_prot prot)
+{
+	int ret;
+
+	hyp_spin_lock(&pkvm_pgd_lock);
+	ret = pkvm_create_linear_mappings_locked(from, to, prot);
+	hyp_spin_unlock(&pkvm_pgd_lock);
+
+	return ret;
+}
+
+int pkvm_create_symbol_mappings(void *from, void *to,
+				enum kvm_pgtable_prot prot)
 {
+	unsigned long start = (unsigned long)from & PAGE_MASK;
+	phys_addr_t phys = __hyp_pa(start);
 	int ret;
 
 	hyp_spin_lock(&pkvm_pgd_lock);
-	ret = pkvm_create_mappings_locked(from, to, prot);
+	ret = __pkvm_create_mappings_locked(start, (unsigned long)to,
+					    phys, prot);
 	hyp_spin_unlock(&pkvm_pgd_lock);
 
 	return ret;
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 75b00c323310..66a3d01cd79e 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -86,7 +86,7 @@ static int pkvm_create_host_sve_mappings(void)
 
 		start = kern_hyp_va(sve_regs);
 		end = start + PAGE_ALIGN(pkvm_host_sve_state_size());
-		ret = pkvm_create_mappings(start, end, PAGE_HYP);
+		ret = pkvm_create_linear_mappings(start, end, PAGE_HYP);
 		if (ret)
 			return ret;
 	}
@@ -121,23 +121,27 @@ static int recreate_hyp_mappings(phys_addr_t phys, unsigned long size,
 	if (ret)
 		return ret;
 
-	ret = pkvm_create_mappings(__hyp_text_start, __hyp_text_end, PAGE_HYP_EXEC);
+	ret = pkvm_create_symbol_mappings(__hyp_text_start, __hyp_text_end,
+					  PAGE_HYP_EXEC);
 	if (ret)
 		return ret;
 
-	ret = pkvm_create_mappings(__hyp_data_start, __hyp_data_end, PAGE_HYP);
+	ret = pkvm_create_symbol_mappings(__hyp_data_start, __hyp_data_end,
+					  PAGE_HYP);
 	if (ret)
 		return ret;
 
-	ret = pkvm_create_mappings(__hyp_rodata_start, __hyp_rodata_end, PAGE_HYP_RO);
+	ret = pkvm_create_symbol_mappings(__hyp_rodata_start, __hyp_rodata_end,
+					  PAGE_HYP_RO);
 	if (ret)
 		return ret;
 
-	ret = pkvm_create_mappings(__hyp_bss_start, __hyp_bss_end, PAGE_HYP);
+	ret = pkvm_create_symbol_mappings(__hyp_bss_start, __hyp_bss_end,
+					  PAGE_HYP);
 	if (ret)
 		return ret;
 
-	ret = pkvm_create_mappings(virt, virt + size, PAGE_HYP);
+	ret = pkvm_create_linear_mappings(virt, virt + size, PAGE_HYP);
 	if (ret)
 		return ret;
 
@@ -146,7 +150,7 @@ static int recreate_hyp_mappings(phys_addr_t phys, unsigned long size,
 
 		start = (void *)kern_hyp_va(per_cpu_base[i]);
 		end = start + PAGE_ALIGN(hyp_percpu_size);
-		ret = pkvm_create_mappings(start, end, PAGE_HYP);
+		ret = pkvm_create_linear_mappings(start, end, PAGE_HYP);
 		if (ret)
 			return ret;
 
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 2411b4c32932..0cf073682173 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -142,7 +142,7 @@ static int __map_hyp(void *start, size_t size)
 	if (is_protected_kvm_enabled())
 		return 0;
 
-	return create_hyp_mappings(start, start + size, PAGE_HYP);
+	return create_hyp_linear_mappings(start, start + size, PAGE_HYP);
 }
 
 static int __share_page(unsigned long va)
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6c941aaa10c6..154d53dca619 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -436,17 +436,6 @@ int __create_hyp_mappings(unsigned long start, unsigned long size,
 	return err;
 }
 
-static phys_addr_t kvm_kaddr_to_phys(void *kaddr)
-{
-	if (!is_vmalloc_addr(kaddr)) {
-		BUG_ON(!virt_addr_valid(kaddr));
-		return __pa(kaddr);
-	} else {
-		return page_to_phys(vmalloc_to_page(kaddr)) +
-		       offset_in_page(kaddr);
-	}
-}
-
 struct hyp_shared_pfn {
 	u64 pfn;
 	int count;
@@ -559,7 +548,7 @@ int kvm_share_hyp(void *from, void *to)
 		return -EINVAL;
 
 	if (kvm_host_owns_hyp_mappings())
-		return create_hyp_mappings(from, to, PAGE_HYP);
+		return create_hyp_linear_mappings(from, to, PAGE_HYP);
 
 	start = ALIGN_DOWN(__pa(from), PAGE_SIZE);
 	end = PAGE_ALIGN(__pa(to));
@@ -608,23 +597,10 @@ void kvm_unshare_hyp(void *from, void *to)
 	}
 }
 
-/**
- * create_hyp_mappings - duplicate a kernel virtual address range in Hyp mode
- * @from:	The virtual kernel start address of the range
- * @to:		The virtual kernel end address of the range (exclusive)
- * @prot:	The protection to be applied to this range
- *
- * The same virtual address as the kernel virtual address is also used
- * in Hyp-mode mapping (modulo HYP_PAGE_OFFSET) to the same underlying
- * physical pages.
- */
-int create_hyp_mappings(void *from, void *to, enum kvm_pgtable_prot prot)
+static int __create_hyp_mapping_range(unsigned long start, unsigned long end,
+				      phys_addr_t phys,
+				      enum kvm_pgtable_prot prot)
 {
-	phys_addr_t phys_addr;
-	unsigned long virt_addr;
-	unsigned long start = kern_hyp_va((unsigned long)from);
-	unsigned long end = kern_hyp_va((unsigned long)to);
-
 	if (is_kernel_in_hyp_mode())
 		return 0;
 
@@ -633,13 +609,12 @@ int create_hyp_mappings(void *from, void *to, enum kvm_pgtable_prot prot)
 
 	start = start & PAGE_MASK;
 	end = PAGE_ALIGN(end);
+	phys = ALIGN_DOWN(phys, PAGE_SIZE);
 
-	for (virt_addr = start; virt_addr < end; virt_addr += PAGE_SIZE) {
+	for (; start < end; start += PAGE_SIZE, phys += PAGE_SIZE) {
 		int err;
 
-		phys_addr = kvm_kaddr_to_phys(from + virt_addr - start);
-		err = __create_hyp_mappings(virt_addr, PAGE_SIZE, phys_addr,
-					    prot);
+		err = __create_hyp_mappings(start, PAGE_SIZE, phys, prot);
 		if (err)
 			return err;
 	}
@@ -647,6 +622,38 @@ int create_hyp_mappings(void *from, void *to, enum kvm_pgtable_prot prot)
 	return 0;
 }
 
+/**
+ * create_hyp_linear_mappings - map a host linear-map range at EL2
+ * @from:	The host linear-map start address
+ * @to:		The host linear-map end address (exclusive)
+ * @prot:	The protection to apply to the mapping
+ */
+int create_hyp_linear_mappings(void *from, void *to,
+			       enum kvm_pgtable_prot prot)
+{
+	unsigned long start = kern_hyp_va((unsigned long)from);
+	unsigned long end = kern_hyp_va((unsigned long)to);
+	phys_addr_t phys = __pa((unsigned long)from & PAGE_MASK);
+
+	return __create_hyp_mapping_range(start, end, phys, prot);
+}
+
+/**
+ * create_hyp_symbol_mappings - map a kernel-image symbol range at EL2
+ * @from:	The kernel-image symbol at the start of the range
+ * @to:		The kernel-image symbol at the end of the range (exclusive)
+ * @prot:	The protection to apply to the mapping
+ */
+int create_hyp_symbol_mappings(void *from, void *to,
+			       enum kvm_pgtable_prot prot)
+{
+	unsigned long start = (unsigned long)kern_sym_hyp_va(from);
+	unsigned long end = (unsigned long)kern_sym_hyp_va(to);
+	phys_addr_t phys = __pa_symbol((unsigned long)from & PAGE_MASK);
+
+	return __create_hyp_mapping_range(start, end, phys, prot);
+}
+
 static int __hyp_alloc_private_va_range(unsigned long base)
 {
 	lockdep_assert_held(&kvm_hyp_pgd_mutex);
-- 
2.43.0


