Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80729FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPGO5NkKZbwBF89donUpo2WBB4phkcPD6/ayIGThuKs=; b=GPm9OMKIfJSArx96pN1Obx5ydM
	4rioBHMstYVfG5Ox7Q24Jc1TUI/QFr+L+XZyCBjxU3wdtnn1xe+/wts16ijT+Z8RX6QVu4MmnmozP
	5hEW2taqUmta9kDp1k+oqwZVwgBtSLLIG8qemuWQ7JOQwc5SdyITFFRsMQsKywSMptBJB3Hi9+Pdd
	LyNcLIxf/7fo6d6V5CHaW4aUoXTq+PVmCbAhhhsIlFgSPJaAggKP9SAWUJIVRvPfgjQ22zG+DXnvC
	2M93TO6lknV3YY9Hf816USIbWvC8qmhEhDUHWvS4fKM/ZeF2uUZtKOV51+gQgwM33Aza3a/NInukz
	p+qMtlVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzx-0000000HCXx-2i3g;
	Mon, 27 Apr 2026 15:35:49 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzq-0000000HCSA-2szT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:35:43 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4837b6f6b93so111412865e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777304140; x=1777908940; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XPGO5NkKZbwBF89donUpo2WBB4phkcPD6/ayIGThuKs=;
        b=v0pqpi1LyuT5bwylAGQLQdLuLwX1W0R0bl6zsaMJP7oIDjIq+EMUdFlPG6at19SNv6
         pIiU4ujJZr+z9C02r6qlB8+Bp2Alac8FT12O6unYO3T74xaEaeKpCCss2kn3RLdi/l+5
         1yZFs/QoXf2ibuxeLXrSCwFPPMbVwzUCJqhMdQsgLN17QoiaDOPLyfXJSOrYAiDdMULO
         gWbmkeR2rQcuXNhmuLep8ehOIQ0pFix7MrIyj4KWzKQLCTwpk/dfARcS+QlOXy9+e65c
         nwxVHyrxV+BK0VbybCDAsw8g54LQOiy3ZJwf5SRUC2IMtLbToAien3yaRU1Y9cI/L7AP
         22Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304140; x=1777908940;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XPGO5NkKZbwBF89donUpo2WBB4phkcPD6/ayIGThuKs=;
        b=LtrVga1+XyrfIlM2UFP3hx8dC9zMHo+f6OvYjXF77e7b9aq93RcnZTL4WpyNdmItLz
         79IVCY3p8+vRrezZfmE4DoC3R/FZ1brlSgYqw/37/XOLCcKqXWlG1A5kxbyEww5vXh4v
         4iOZdKmH6YvKDy0Md5fuXi6P8vjzwsj8Nk5Md0cso/ruebCOlydGCXDUShdRrksLIgim
         NzBZb0LqEHbNWZ1Sc1qnDCjwaqro/bLH2v8AvERa66MJU2BPajHWJJ4zwJNHOfZnAF5a
         c1wHVG25vvsSYLEf6uh40j3XkZ9tllywIs0ZssZ2lf0Zm1/mcGybjda6ASqW96PoOyEU
         LJsQ==
X-Gm-Message-State: AOJu0YxJwLt8MoLDwbo1p5E5eBPG6yM2N7m/AlmmjRXG6ZUwHAa8BsdV
	q4Zy4g+U90pLoBpjZ0DOo5e3ymrclCTOyyJ57shS3ED07+iXEFoiFYF53bANx7rBcnpb/7bS1zr
	JVVeJ7tR5kft/oC3I59ErCyJkoeFKmTRvp/AVXswqP0jjOhBXkdqgGdSs0vWl9aLl8t0z7JR8++
	97HqbgKoN1n8b32j/g8MH5fgzqOYh3u8PtXnAWp8Nh6Ugn
X-Received: from wmbjs21.prod.google.com ([2002:a05:600c:5655:b0:489:690:d5dd])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c04a:b0:487:12c:e7e1
 with SMTP id 5b1f17b1804b1-488fb750840mr434963185e9.11.1777304140187; Mon, 27
 Apr 2026 08:35:40 -0700 (PDT)
Date: Mon, 27 Apr 2026 17:34:23 +0200
In-Reply-To: <20260427153416.2103979-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260427153416.2103979-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3391; i=ardb@kernel.org;
 h=from:subject; bh=I2DZ4/UqDVyZEyJTtirGLkm2tY5dVwLgkN0d0TthFiQ=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfN9E5Oz4cnQFbZz/ubvO6+x9N2e9y2fv818/K0644BF2
 uqMO09WdZSyMIhxMciKKbIIzP77bufpiVK1zrNkYeawMoEMYeDiFICJfP3FyNCv9vzcT50tV2ab
 tKs6rdmtmP+ZSdS8q2CHk5bVhmD/I6sZGe6dv55h+qD/YWdJV464V9y9yPhfLStb8rbUHZdcsCT 6KCcA
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260427153416.2103979-23-ardb+git@google.com>
Subject: [PATCH v4 06/15] arm64: mm: Drop redundant pgd_t* argument from map_mem()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_083542_763015_FC79C77A 
X-CRM114-Status: GOOD (  13.09  )
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
index bfbf3fe0d1be..9610dd2d7bd9 100644
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
 
@@ -1196,10 +1196,9 @@ static void __init map_mem(pgd_t *pgdp)
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
@@ -1421,7 +1420,7 @@ static void __init create_idmap(void)
 
 void __init paging_init(void)
 {
-	map_mem(swapper_pg_dir);
+	map_mem();
 
 	memblock_allow_resize();
 
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


