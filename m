Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF74CD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHwZV4K/OQyLo87ubxB2N7tui2RqyNeWqpTDKGM1mWQ=; b=nsKjQpgB2wS/ARAMA2dySF3Ll7
	k/1NpBHJnl9/jxVyNn5KV4hXb8rErkgL6a/bj571Uf+GBt+nakS8OSjRHfK6PkWXUGt7tJo0F30FY
	kgR2z23fUDEg0YG+Z4FEX/CqZs8icssxNYlyjGnyXouI6TvQUHb7sbl6G1n+RVMUCTz5xM4+3bm1T
	kLZzd80qlD4aAgaL5u0aFDkTFCmfWXorpw5oBmlS9xZ8WJtxdKhfacS2PKg4U52h7E7juxFUU04Hw
	gHIRh4gvE2l2x+S0qAkNlPqHujrQ6mD/eJ5ykkenSxZzWyPkjRaniLFwkbUyEaxwHZcA9KzpSBiJP
	GcJsjtLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyjP-00000007bor-0Hew;
	Fri, 29 May 2026 15:02:39 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyj8-00000007bdm-1qlv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:02:23 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-49058295985so41885525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 08:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780066940; x=1780671740; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RHwZV4K/OQyLo87ubxB2N7tui2RqyNeWqpTDKGM1mWQ=;
        b=cuVgMPb0zigZ0Q/qtOt+YYlGCR4LRvVcc75JErIk5ts6WSY1l0+CKN5aEMbxEywQa3
         L5io4gfwutpfDpifhhwInNKenHAGSk+C/RjA+ekrDT/magn1+7XW6O27o+dv+KTFPrPv
         +laotlJ5G3iwee2o/hnNK3+XVHYKZQ1xwqLba1OP2hiCFNSF6yikN/Rki5BkxzpzIXuW
         CCPGQvpgcOS/S+JxM59HG8mKrGKAhQ/mJbR5RBVy9lsC4Ne10xFEyyaQwuRQA/Dy2V6p
         0h5G4mZrIiIgyuqrrHMPUrsefrwBb6b3LpVDXxHWT1OUMhS9IAUMLQafj7dn0c2Vma9G
         mDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066940; x=1780671740;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RHwZV4K/OQyLo87ubxB2N7tui2RqyNeWqpTDKGM1mWQ=;
        b=aEn75jeVif2zLo7scavA+6zBpsxkBgAaAJIpBKgYax/u5Ncv7UjTTbdgDWllu82sxF
         ZyMgXF9NYvi1uPQTu6FKVuyCUNPZQpdd9ghDMB6S//HW5KsdnOYEDMv8iCNaWA2Li7Lg
         fvdMcWNn7iuO+TYKqTFybdrVOVOX/2tMEk5LP7fFa3xJ3l8zcidjz1ggv87jvTb9wPQd
         5GFpkrUIVq9kElmZyn3GphX/6weh5cn9AUv7BxwfyySuWjykVgGV4WVUevEJfrsINvmM
         5R7xWa6k7T+mWkT6ogxVRqHxqo9db0nrY3AY51uaKrGnNTI+l1cTr1BOcn7ETIFfMbMP
         4+ag==
X-Gm-Message-State: AOJu0Yx6DcFA5xTQZrhql5kVVAiZv9ax+WBp0PvJgumD8g0zVuJJa1PW
	1ofbZBRRP0KoTRxAJavvq+xFgFtfxT/JoJlwdMwAHrn1XM7tM9hMC7KkZ/8Ymt+6AR8nfR91KSc
	nIw82147Op64txIa1W6S6oKtYGrVc3MFS7p7uZkelXeu1vnnH6SuzCbmQJIE+BBIRyE+GTGh5mk
	wNa0cl0D2f8A8FmAAQTi0uQUrYZoK7LQ1UXc/oM0A3xXwb
X-Received: from wmbz2.prod.google.com ([2002:a05:600c:c082:b0:490:3d2f:edc])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:828d:b0:490:507c:bdb1
 with SMTP id 5b1f17b1804b1-490a291cbbemr329805e9.15.1780066939649; Fri, 29
 May 2026 08:02:19 -0700 (PDT)
Date: Fri, 29 May 2026 17:01:53 +0200
In-Reply-To: <20260529150150.1670604-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260529150150.1670604-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3439; i=ardb@kernel.org;
 h=from:subject; bh=RVK4+kwUNBzT2vP63qv/oNPK4oNSEDZX2ULcXiZameE=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUtyVeK1gth6p/IV1dd2mU+oVf+4YqKnwbIQxumu9bquP
 Yfu1HZ2lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIncvMPIcGzv+x2vrDJc2eUk
 LtltCDno/Lq1Z7LA5Ge9k44qbfyXuZqR4dqGMNajx9vSleJns73yeprz3enQ4h9HLk24LK1xMO+ dISMA
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150150.1670604-19-ardb+git@google.com>
Subject: [PATCH v7 02/15] arm64: mm: Drop redundant pgd_t* argument from map_mem()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_080222_501133_0E5ACC5B 
X-CRM114-Status: GOOD (  13.19  )
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

From: Ard Biesheuvel <ardb@kernel.org>

__map_memblock() and map_mem() always operate on swapper_pg_dir, so
there is no need to pass around a pgd_t pointer between them.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 25 ++++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 112fa4a3b0eb..aa0e2c6435f7 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1035,11 +1035,11 @@ static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
 	flush_tlb_kernel_range(virt, virt + size);
 }
 
-static void __init __map_memblock(pgd_t *pgdp, phys_addr_t start,
-				  phys_addr_t end, pgprot_t prot, int flags)
+static void __init __map_memblock(phys_addr_t start, phys_addr_t end,
+				  pgprot_t prot, int flags)
 {
-	early_create_pgd_mapping(pgdp, start, __phys_to_virt(start), end - start,
-				 prot, early_pgtable_alloc, flags);
+	early_create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
+				 end - start, prot, early_pgtable_alloc, flags);
 }
 
 void __init mark_linear_text_alias_ro(void)
@@ -1087,13 +1087,13 @@ static phys_addr_t __init arm64_kfence_alloc_pool(void)
 	return kfence_pool;
 }
 
-static void __init arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp)
+static void __init arm64_kfence_map_pool(phys_addr_t kfence_pool)
 {
 	if (!kfence_pool)
 		return;
 
 	/* KFENCE pool needs page-level mapping. */
-	__map_memblock(pgdp, kfence_pool, kfence_pool + KFENCE_POOL_SIZE,
+	__map_memblock(kfence_pool, kfence_pool + KFENCE_POOL_SIZE,
 			pgprot_tagged(PAGE_KERNEL),
 			NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS);
 	memblock_clear_nomap(kfence_pool, KFENCE_POOL_SIZE);
@@ -1129,11 +1129,11 @@ bool arch_kfence_init_pool(void)
 #else /* CONFIG_KFENCE */
 
 static inline phys_addr_t arm64_kfence_alloc_pool(void) { return 0; }
-static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp) { }
+static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool) { }
 
 #endif /* CONFIG_KFENCE */
 
-static void __init map_mem(pgd_t *pgdp)
+static void __init map_mem(void)
 {
 	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
 	phys_addr_t kernel_start = __pa_symbol(_text);
@@ -1178,7 +1178,7 @@ static void __init map_mem(pgd_t *pgdp)
 		 * if MTE is present. Otherwise, it has the same attributes as
 		 * PAGE_KERNEL.
 		 */
-		__map_memblock(pgdp, start, end, pgprot_tagged(PAGE_KERNEL),
+		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
 			       flags);
 	}
 
@@ -1192,10 +1192,9 @@ static void __init map_mem(pgd_t *pgdp)
 	 * Note that contiguous mappings cannot be remapped in this way,
 	 * so we should avoid them here.
 	 */
-	__map_memblock(pgdp, kernel_start, kernel_end,
-		       PAGE_KERNEL, NO_CONT_MAPPINGS);
+	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, NO_CONT_MAPPINGS);
 	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
-	arm64_kfence_map_pool(early_kfence_pool, pgdp);
+	arm64_kfence_map_pool(early_kfence_pool);
 }
 
 void mark_rodata_ro(void)
@@ -1417,7 +1416,7 @@ static void __init create_idmap(void)
 
 void __init paging_init(void)
 {
-	map_mem(swapper_pg_dir);
+	map_mem();
 
 	memblock_allow_resize();
 
-- 
2.54.0.823.g6e5bcc1fc9-goog


