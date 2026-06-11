Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72372CD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5h5bvBN14eW3fvu0tVxTv7/VrbeBwl0cY8Ur130Yko=; b=We06dHnWknFq7Nb5gY4XwaEBIK
	mQ8rSL0QEArZn56g/rBwoqLHQsOen4WjarDE5Ms2hX7EtaQvEHBHwBgS/VOfR+8u4UX0egPytEoJB
	RwBVAOsccuAkPA4L/7PR1sK+Eo/yRX/T8xGJoL/bhZt9TuIjZxPGW5Ik13g1yAYicsKjKrL9P4tpO
	KKIg8s0p0jHWhRxJH3Nbx72oB8To39+uv7pJ7YapPPqxTLsMTQMym0+HdUgLBxfU7f5SqHdw+CMpN
	i8Lfq5zXYCg/UFcK2Vdsp2dFzO60a4wHH+Vm3n319gbcv5i/AGQOsqil1rcj4To1UKwHQ3PWy/JaI
	nsgUxk2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf2q-00000009Sck-3oF8;
	Thu, 11 Jun 2026 13:02:04 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf2k-00000009SVF-3NEw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:02:00 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490b79e6b94so60696535e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 06:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781182916; x=1781787716; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5h5bvBN14eW3fvu0tVxTv7/VrbeBwl0cY8Ur130Yko=;
        b=r7SdVKnT5OmFdClOBHnajayhrWNoeel9zt2ltOaq1mS/2BWpvPIR5hxHcbksidPdGQ
         KO2/pUJxfgfLkZh6DzpzQIhRPuYMgK40X+BC3NyVrU3C9Rt6OOZpjHECOSsKznSTZgpd
         BJ6lkiSEesHQIAu0HKYeAMBjOFxJecriFkZUmggwnwPyUMU+3zXvIKP3DjAIMzeqApWf
         XUav8hnAJmOMs4N9sjU/3NcEbTAxYdpshxey5NNqFVdwKP18y3MRrVQVofmalQpbgZwx
         3pNcWvNy2DNT/TYHY15PvhTYgvYGbMzEVC8iwkeHMgzEd+KBsNPJGsy1ivwOrvTyQKL6
         ce4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781182916; x=1781787716;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g5h5bvBN14eW3fvu0tVxTv7/VrbeBwl0cY8Ur130Yko=;
        b=FtRew7rVNV0I4KQIHzSR3fV+6U//UBrI+Fez+S7OWAdEoHiF4pjVNr182w4laTR0xS
         W4cNK1xeXBlANV/tbGLrz3dk8pmTKYHzUW7Up/LmBC7MamyR/UPwNbqM9ifmZboU4hxn
         wq5Ku1tAuplWgObZ/HiBJqBVwnjQHZsJkHjg6wreF18kPxBuFQz6MbP2DGnd16OCuUl+
         /JA01qGaldAbALsoz+i/0WW0SfCsO/A+dks4wTLl82shoFe2Iua2XGrI97yiKDh1POa2
         oqUeCSldVW9YVGoPbK2nQAsbBFvwNcJYmxcwnsub67Ve6wggJTzr6O0DWCUEdAe0/KdN
         HrmA==
X-Gm-Message-State: AOJu0YyE4cCU/Xg1+JfMRRJdmg6H3xVZBgGQfQNFnHlQQkL8GbIpaE/Y
	cS6TjIrbfOmV4jpCyND0AY+hVvwJUSmZdgAldwrKAgGc+ZN/GkxstEAweSN47B7itE53b/bYWTJ
	HPEQpK0Ayg48SlYe2QczFCU1Ohcip9pOnyTDvAIZZTU4lMiHgzmSoQ2u/lDoXwRjPMrDAeG80V3
	OJEHRQJZV9auqC4V2YR9je6mRV5vo0wPNcMMhMCr/5Y54V/EsLE24N/4jl6Uhe
X-Received: from wmbjw14.prod.google.com ([2002:a05:600c:574e:b0:490:e190:39cb])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c0cb:b0:490:b9c3:6c69
 with SMTP id 5b1f17b1804b1-490e561edd9mr24134875e9.30.1781182915837; Thu, 11
 Jun 2026 06:01:55 -0700 (PDT)
Date: Thu, 11 Jun 2026 13:01:44 +0000
In-Reply-To: <20260611130144.1385343-1-abarnas@google.com>
Mime-Version: 1.0
References: <20260611130144.1385343-1-abarnas@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260611130144.1385343-7-abarnas@google.com>
Subject: [RFC PATCH 6/6] arm64: mm: support PMD page coalescing in the linear map
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-mm@kvack.org, "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, David Hildenbrand <david@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
	Yang Shi <yang@os.amperecomputing.com>, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_060158_891792_8DC83A1A 
X-CRM114-Status: GOOD (  17.70  )
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

Implement PMD block coalescing to merge fragmented linear mapping regions
back into huge pages when restoring the read-only attribute.

When memory allocated with VM_ALLOW_HUGE_VMAP (such as for the execmem
ROX cache) has its permissions modified, the PMD block mapping is split
into individual PTEs. Without this change, when that memory have its RO
attribute subsequently cleared and set the mapping remains permanently
fragmented into 4K pages.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 arch/arm64/include/asm/mmu.h |  1 +
 arch/arm64/mm/mmu.c          | 95 ++++++++++++++++++++++++++++++++++++
 arch/arm64/mm/pageattr.c     |  7 +++
 3 files changed, 103 insertions(+)

diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index 137a173df1ff..19158bacb2df 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -80,6 +80,7 @@ extern void *fixmap_remap_fdt(phys_addr_t dt_phys, int *s=
ize, pgprot_t prot);
 extern void mark_linear_text_alias_ro(void);
 extern int split_kernel_leaf_mapping(unsigned long start, unsigned long en=
d);
 extern void linear_map_maybe_split_to_ptes(void);
+void try_collapse_kernel_pmd(unsigned long addr);
=20
 /*
  * This check is triggered during the early boot before the cpufeature
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index a6a00accf4f9..d74226fa1c9b 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -769,6 +769,101 @@ static inline bool force_pte_mapping(void)
=20
 static DEFINE_MUTEX(pgtable_split_lock);
=20
+static inline bool __pte_can_be_collapsed(pte_t pte, unsigned long pfn, pg=
prot_t prot)
+{
+	if (!pte_valid(pte))
+		return false;
+	if (pte_pfn(pte) !=3D pfn)
+		return false;
+	if ((pgprot_val(pte_pgprot(pte)) & ~PTE_CONT) !=3D pgprot_val(prot))
+		return false;
+
+	return true;
+}
+
+static void __try_collapse_pmd(pmd_t *pmdp, pmd_t pmd, unsigned long addr)
+{
+	pte_t *ptep;
+	pte_t first_pte;
+	unsigned long pfn;
+	pgprot_t prot;
+	int i;
+
+	ptep =3D (pte_t *)pmd_page_vaddr(pmd);
+	first_pte =3D __ptep_get(ptep);
+
+	if (!pte_valid(first_pte))
+		return;
+
+	prot =3D pte_pgprot(first_pte);
+	prot =3D __pgprot(pgprot_val(prot) & ~PTE_CONT);
+	pfn =3D pte_pfn(first_pte);
+
+	if (!IS_ALIGNED(pfn, PMD_SIZE >> PAGE_SHIFT))
+		return;
+
+	for (i =3D 1; i < PTRS_PER_PTE; i++) {
+		if (!__pte_can_be_collapsed(__ptep_get(ptep + i), pfn + i, prot))
+			return;
+	}
+
+	set_pmd(pmdp, pmd_mkhuge(pfn_pmd(pfn, prot)));
+
+	__flush_tlb_kernel_pgtable(addr);
+
+	if (static_branch_unlikely(&arm64_ptdump_lock_key)) {
+		mmap_read_lock(&init_mm);
+		mmap_read_unlock(&init_mm);
+	}
+
+	pte_free_kernel(NULL, ptep);
+}
+
+void try_collapse_kernel_pmd(unsigned long addr)
+{
+	pgd_t *pgdp;
+	p4d_t *p4dp;
+	pud_t *pudp;
+	pmd_t *pmdp;
+	pmd_t pmd;
+
+	/*
+	 * collapse_pmd expects exact address of block to be collapsed
+	 */
+	if (WARN_ON(ALIGN_DOWN(addr, PMD_SIZE) !=3D addr))
+		return;
+
+	mutex_lock(&pgtable_split_lock);
+
+	pgdp =3D pgd_offset_k(addr);
+	if (pgd_none(READ_ONCE(*pgdp)))
+		goto out;
+
+	p4dp =3D p4d_offset(pgdp, addr);
+	if (p4d_none(READ_ONCE(*p4dp)))
+		goto out;
+
+	pudp =3D pud_offset(p4dp, addr);
+	if (pud_none(READ_ONCE(*pudp)))
+		goto out;
+
+	if (pud_leaf(READ_ONCE(*pudp)))
+		goto out;
+
+	pmdp =3D pmd_offset(pudp, addr);
+	pmd =3D pmdp_get(pmdp);
+
+	if (!pmd_table(pmd))
+		goto out;
+
+	lazy_mmu_mode_enable();
+	__try_collapse_pmd(pmdp, pmd, addr);
+	lazy_mmu_mode_disable();
+
+out:
+	mutex_unlock(&pgtable_split_lock);
+}
+
 int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
 {
 	int ret;
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index eaefdf90b0d5..11e0b60264c3 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -200,6 +200,13 @@ static int change_memory_common(unsigned long addr, in=
t numpages,
 			if (ret)
 				return ret;
 		}
+		/*
+		 * When setting a read-only flag on the linear region, the memory
+		 * may have been backed by a PMD before being split. Try to
+		 * collapse it back into a PMD to restore huge page performance.
+		 */
+		if (pgprot_val(set_mask) =3D=3D PTE_RDONLY && area->flags & VM_ALLOW_HUG=
E_VMAP)
+			try_collapse_kernel_pmd((u64)page_address(area->pages[0]));
 	}
=20
 	/*
--=20
2.54.0.1136.gdb2ca164c4-goog


