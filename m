Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8693CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ablq7SDSYy4OVFkmF058uoPsxyfZ6hOzCdrY1mFL1gw=; b=aaoOi44sPyJyEOWB0bG5hot0mb
	Vkr7L5B1f6L/aAGzW+bdFH7DGGWGnRta+djBMM/+Hc0MCUNYYAeBnXjMdMV88KAkHsCiiaLWFK5Zw
	JZ50BgddSBbQlYbtfRfor9wSE/Y51Enwdxhhje9YQK4Q12ziuY5U4bjsycJCloKhVvQcdXOjqp2qO
	Gl1z0y0q6rJP/Mwc3QTNtp4w7KCeInNvzX8JcAaJOPnk00z7QRrQ7yX26AHH80fUGFuQL5+p/mg5G
	P/qZ9uu+p6Ayv/gsTPai+Lg16fdH9MDpHd2F3WY5TCsijzDK8ptKuIRGUWomvm2YziwGdS9wuuyiV
	0vD6IAUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDN-00000001yfc-05By;
	Tue, 19 May 2026 15:18:37 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDC-00000001yUx-0XYP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:18:27 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-67f7c414c58so3639595a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 08:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779203904; x=1779808704; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ablq7SDSYy4OVFkmF058uoPsxyfZ6hOzCdrY1mFL1gw=;
        b=MfNiExEVNNo76R4MtgP0SowmrAFDwNzftpLF219otSlkNeoIL/FLoa6+Aq0ls8M6Sl
         TcKdfa20n/Jd9+XQ6s7kCjlCsScB49aPVvLtTTQ0jzix8oY0BJxnmdaFBMUFITCgDlK3
         H+gDdx52o6t+wZ0EBWqy7ihYHXsLJ87C8612a4eiWy0xrGgTnpVe7+sqTK7/YF4jh55J
         3NdQ8UuSYlK0HbQppGTDVtCmkEC463judtTdDwx/GOqIKYlVMki34A1bJa3EpuiI7rVz
         k02I/Ojkpd8G8QzBcSpd3zJBwF7SUCcvD9GqgaVCFA5dOeydeJKTIuTbpJ3jQGWj5+BJ
         HFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203904; x=1779808704;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ablq7SDSYy4OVFkmF058uoPsxyfZ6hOzCdrY1mFL1gw=;
        b=UU+hukcR7w/O2+8kSYfSvIqUQC9Pm4cSeow+Yz6eoWXXYjqz6H1aqPESaG2hrC9dRd
         C7Sm/dMqMRP5p29q7EtednyB6+BuGKKhuBnLBYWu2URdRr7YyXHfvUZOujBMY1kuK3o4
         Qs+d4yeXdz1cOZPpLH7shkOyH1YEkMpc6o9mECmzeyx5QNCdzWTKMmBvrmcVZOQaz6Nk
         FnI0Tqd1fqNBZqHYlt14FVHzI4Nosd7/6Cs7uYBkO5fTEuiM75bp5x50GpBFYpkNjL/5
         HkNj3V8FNL+kU8E9N6PCzOXhztyIBkPIm+dnobMsK9jNVaHnfmayVrDVaDg2L2gw6D07
         AHlg==
X-Gm-Message-State: AOJu0YyBt0UumpIfW3wGq/cQuDEMPP5CabyTMlS/3mSgE7+CggujD4Y3
	P9T71byt2vmPlUP5HKtW/tC3f4+YGi5IG25XVqSkU1ZFr2nzmuwvXUD+Blzevl4ps+si95MJGHh
	L3F6uLIWnJRd1viL3RcaYtwriPtFLKDDqXyt7Ghp3f3NRf2zY+oylsUv0tMf238+pOE9GeKRmg6
	qpTHInF7pfbgWwAo7Ys84kFDV78hhUCcLneR2baaQraxea
X-Received: from edbes15.prod.google.com ([2002:a05:6402:380f:b0:684:6ea:e4eb])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:d5d6:0:b0:67b:7a8f:3e2c
 with SMTP id 4fb4d7f45d1cf-683bd38d8b7mr7725381a12.25.1779203903770; Tue, 19
 May 2026 08:18:23 -0700 (PDT)
Date: Tue, 19 May 2026 17:16:23 +0200
In-Reply-To: <20260519151616.2557018-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260519151616.2557018-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3481; i=ardb@kernel.org;
 h=from:subject; bh=x6k1+hxAgsJePfYGlvJneg2rmFUShXoMj4/fbl0R3E4=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIYun7tQtN6G1hgdtjmgLWLOkd5w6PlPKS1nrbeH9NZPkW
 yVueP/qKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABNRMGP4X3OrUs34rDx3WHeP
 pWTXf/+ikjP81+7duOheUz55P7PXI0aGv4L+DLsrlFS2MG23Y1S+X9HDsL3d9bP+5tYiBT1N60J WAA==
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519151616.2557018-21-ardb+git@google.com>
Subject: [PATCH v5 06/13] arm64: mm: Drop redundant pgd_t* argument from map_mem()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_081826_182982_DA5AA6B3 
X-CRM114-Status: GOOD (  13.67  )
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
 arch/arm64/mm/mmu.c | 26 ++++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index cd841a392b44..0405fac18959 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1039,11 +1039,11 @@ static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
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
@@ -1091,13 +1091,13 @@ static phys_addr_t __init arm64_kfence_alloc_pool(void)
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
@@ -1133,11 +1133,11 @@ bool arch_kfence_init_pool(void)
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
@@ -1182,7 +1182,7 @@ static void __init map_mem(pgd_t *pgdp)
 		 * if MTE is present. Otherwise, it has the same attributes as
 		 * PAGE_KERNEL.
 		 */
-		__map_memblock(pgdp, start, end, pgprot_tagged(PAGE_KERNEL),
+		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
 			       flags);
 	}
 
@@ -1196,10 +1196,10 @@ static void __init map_mem(pgd_t *pgdp)
 	 * Note that contiguous mappings cannot be remapped in this way,
 	 * so we should avoid them here.
 	 */
-	__map_memblock(pgdp, kernel_start, kernel_end,
-		       pgprot_tagged(PAGE_KERNEL), NO_CONT_MAPPINGS);
+	__map_memblock(kernel_start, kernel_end, pgprot_tagged(PAGE_KERNEL),
+		       NO_CONT_MAPPINGS);
 	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
-	arm64_kfence_map_pool(early_kfence_pool, pgdp);
+	arm64_kfence_map_pool(early_kfence_pool);
 }
 
 void mark_rodata_ro(void)
@@ -1421,7 +1421,7 @@ static void __init create_idmap(void)
 
 void __init paging_init(void)
 {
-	map_mem(swapper_pg_dir);
+	map_mem();
 
 	memblock_allow_resize();
 
-- 
2.54.0.563.g4f69b47b94-goog


