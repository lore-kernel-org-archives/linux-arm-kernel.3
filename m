Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454CB1098792
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Jh/oU+9W3ai+MQNGkutnA3eVYC0Uphnsk6tMJ4kF8k=; b=zPV/y+56y03NbQ5ZnWeWEmzORL
	R2CX18wKEfb0wUz6Q1r8D7U/bkljlnaD/l1fbBg/T1FP7pgKY5Qi44kRzTNsAb5w6I/U8kaqVQmPW
	iOutFUuo2FSK9vgPSxqSNmvw21HooLXIWx3E6WolVnw5U9cCR5RBNTTFQGnbakcIv9goYaa+6ojyp
	DuJ+rhhZ0mBNPHKMnEFvdoOLvYNXjF1I/38eb7o95m/92fptuATCi5qZrOeQMs3pIXJ1Vu7SxRxEB
	gbiIFy7VUpBk8nj5wjR5itgwj2xWD8WUFNEqWp870jSIiCTEoi9NIkcKGjB5N08mvuvsfphTBmu0T
	8Ek4/cyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKs-0000000Cyjg-1h3p;
	Fri, 20 Mar 2026 15:00:26 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKX-0000000CyQi-35Dm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:00:06 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-486fcc05b20so4238045e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 08:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774018803; x=1774623603; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Jh/oU+9W3ai+MQNGkutnA3eVYC0Uphnsk6tMJ4kF8k=;
        b=lljqUbpCUZ7GMaGHmoVaDgnTcolqPvBoOmmYd7AQQG5RkhfZi1Chv+1g4I/hHQJjCZ
         0rNxIoUJdizLS8a8OGxVzn9BwiI/VlOMaJQUYc0xnG4jKNYY7QDW0xqe8zB7+SSBMi9d
         72aB2YGZxrS/oliC56jL6p3vHE6P30zTb84ds/F9BUC8uC8EsrN12tb8roQrGTn46pVm
         kTw1mIvkszCuDvoA8VjWZyPXWi1XHVuwZ3utRpZrdNOMjQZkAcVlVpHnhRUCdPc5tqNY
         ijzxfxShPYbuRcYX7FA7caIF3gKcqEBWRkF4zJHFLt/V4iDnKEZldtR9Zo+TZqOQfLBd
         keSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018803; x=1774623603;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Jh/oU+9W3ai+MQNGkutnA3eVYC0Uphnsk6tMJ4kF8k=;
        b=OeOROXcb7bcqiXT6fcl1i6A9u9feYUzR9BG9lKYL0A1o+8stL8454aGeFjvqZBhN/P
         qKWTYprpb/h6oCo88EnmYxp+b9vs5Ix0Pl7RFJnT4duRQ+gpN0Q8Tq65S4sYHYauKTLL
         3fRav7MeU6X8M16q2WmUDW2H+a8rdYaPR8O+20//frQQ193UsdztCjXVnb/d568aLccI
         54Gq1zXAoLgor+JOlwN4OBmuj2FJYpP5YPmDATTwVRDsJ1DnRYF2LstTJYDXq5NvCB4P
         jr/kCej+55ZFYuaabdcWzO+fB7edVrGuT0fWVXiYJuLbgItm1jRhGAIywoRLAH1R4jz7
         Qxhg==
X-Gm-Message-State: AOJu0Yz8Suor6GX1Rm1xN8VoWf1C929OorToHrwEE74OOrKQrmRNipvs
	S1mnVqfUs4D54tsMMhwfT7yAR+GiNNEjcxHuCKFE9h3ae2DJv4H7Dgc31MO/FbjcfO92QsMBTg=
	=
X-Received: from wmi11.prod.google.com ([2002:a05:600c:20b:b0:477:5a4b:d57f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5299:b0:486:fe46:b647
 with SMTP id 5b1f17b1804b1-486fedbfd67mr48551215e9.10.1774018803211; Fri, 20
 Mar 2026 08:00:03 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:59:40 +0100
In-Reply-To: <20260320145934.2349881-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260320145934.2349881-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3387; i=ardb@kernel.org;
 h=from:subject; bh=5dRiPzrD0xyZ8rzbnMvrrnQQbnRprbflRHsa9Z++mUs=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIXNvwr17PDktXg+PWEvusPPc9vGt+LUQ2ZsvgwX3cE77/
 WzZLsaDHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAioYcZ/lkbHt4863555up0
 h9ylYX8m9e1cPyPO4pT6kuUv8xPXz9vL8M/OvY/Tar30Hws7Q/357jxH3lzkNbDyZuJKvJ9wrEA gkwkA
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260320145934.2349881-20-ardb+git@google.com>
Subject: [PATCH v3 05/13] arm64: mm: Drop redundant pgd_t* argument from map_mem()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_080005_816100_33F2CC10 
X-CRM114-Status: GOOD (  12.45  )
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
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 25 ++++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 652fe2c52b5a..744cf76f25aa 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1019,11 +1019,11 @@ static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
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
@@ -1071,13 +1071,13 @@ static phys_addr_t __init arm64_kfence_alloc_pool(void)
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
@@ -1113,11 +1113,11 @@ bool arch_kfence_init_pool(void)
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
@@ -1162,7 +1162,7 @@ static void __init map_mem(pgd_t *pgdp)
 		 * if MTE is present. Otherwise, it has the same attributes as
 		 * PAGE_KERNEL.
 		 */
-		__map_memblock(pgdp, start, end, pgprot_tagged(PAGE_KERNEL),
+		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
 			       flags);
 	}
 
@@ -1176,10 +1176,9 @@ static void __init map_mem(pgd_t *pgdp)
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
@@ -1401,7 +1400,7 @@ static void __init create_idmap(void)
 
 void __init paging_init(void)
 {
-	map_mem(swapper_pg_dir);
+	map_mem();
 
 	memblock_allow_resize();
 
-- 
2.53.0.959.g497ff81fa9-goog


