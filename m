Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FF6D778BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 09:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6c13B4dAZW2mAGZnzKmX4nddpklZOgYUawWDxi2JBv4=; b=PyGlATWtFG9mxd/ORkBk/BBNgB
	aYqbbHjGaSG6HBhdaC03TDYWlZ0QJJdlw7u1IfkYQntr+T2IP2x2e3RQhl321vkz56Pn4H5LLOm/I
	eLoWXe2JRC6Ee9BtMffm4QBoyrKPjGy4hkXT7+vUj6ZWJIV+23v//xez4oqAnQiAmne90J8V/69mG
	ulwPZ/fSkamkLPk4LsL3LQhpR0nEOEx10YRh+hOFKKwq/UrI+CuYOTBFN5zF9XHi5ZGmMGqDW0atC
	NWlMAfA9Pvlx2LDWU+Bj+lYuf+kjyizzbU9ClexdU4nP2oOu2OrXFDh6bmVt3JhI5mpHh5Hm8H7jO
	VjSty/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIss-0000000CC6c-0phW;
	Mon, 26 Jan 2026 09:27:46 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIsl-0000000CC0z-3Rah
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 09:27:41 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-480593535efso8351235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 01:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769419658; x=1770024458; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6c13B4dAZW2mAGZnzKmX4nddpklZOgYUawWDxi2JBv4=;
        b=KTl0iBskrS+zHwQvSlzEv0LMzp/DILLYczjSltDnbRFYmHvrc5geDHrwmTtLH3oq+6
         e95aIUEWc6ZBrIc10yhZN3DIXT5I099Mc9b2D7PLRigaJgcd6YDYgxICdJZpBHZBsx5r
         lfpc7tmhdJunCmjuiqdzh8UqNyyX1/J/kDjKRDgzQhvY8nUehO0Hz0gMyLQZ+gIkmnYO
         nYZJv5c+8riaCz9AH7j1auQS1E7J2OeAztj8u+pkLnrW5GZWHwt9dupcjejfR/xeEny8
         LTY7oeXLGtW0LJUA6oNmsFF1GINZSpc2dogt+QeMTRydYvsrmxpC7S+ux3Ul7mmeqaXB
         fryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769419658; x=1770024458;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6c13B4dAZW2mAGZnzKmX4nddpklZOgYUawWDxi2JBv4=;
        b=f3Z/bvlcVmUtAV3vJU7J5BBlX2JfeY4ngiC0iMPFHFUMP6221DlYKUDUcsY6pF578K
         P5d+pwlRmdva+LyF4QJBcHY5Kbx+U4hjxtNNutn/kes/NyKTHWySknwnZ7V7OR9zR6QI
         ufVvMAo4jnw6VaUlDR5FzFJ6juE5hU2KmHB06ZIxdz1p498qk3nK0SG1IfYlOxYRrtW+
         0HS5u3D3TFiaQM3Q8ykpZkRPu5U3+Dt4gLE7FhY6QqLhcHGbLSneL93GqBLY1i5nCaO5
         vPcvwo0ljVy4oKKVLEF/jB5sJ4qu+GmgUUW9MXzb/+ktjv9HJq59uU7YRtZlqGr9JLV5
         Vuzg==
X-Gm-Message-State: AOJu0YxATINnDWT38/xx6jSbTTVVu1Bhj6Ss+k6eIOuuI0LrdHXviXR8
	XFH977+HPsV21Gq811jyAfaMzVBRFd75rNtV4AHXfhwKiDBCPTyoefdcioZH+IcDhZkCdVitkA=
	=
X-Received: from wmbjw5.prod.google.com ([2002:a05:600c:5745:b0:477:7aa2:99cb])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4592:b0:46e:49fb:4776
 with SMTP id 5b1f17b1804b1-48063973de2mr13675465e9.11.1769419657809; Mon, 26
 Jan 2026 01:27:37 -0800 (PST)
Date: Mon, 26 Jan 2026 10:26:38 +0100
In-Reply-To: <20260126092630.1800589-12-ardb+git@google.com>
Mime-Version: 1.0
References: <20260126092630.1800589-12-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3337; i=ardb@kernel.org;
 h=from:subject; bh=3Dm3E0e2jB3pb2AJ/LEeXuocNeiU12Y5ft9q6XhOB74=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIbPc2OuSwELFPPtn3tW6gekaj0/clPAoOR+hfaN7W0y1q
 lTWW76OUhYGMS4GWTFFFoHZf9/tPD1RqtZ5lizMHFYmkCEMXJwCMJHNQQx/eO/+MwrUbC/XWVhk
 zVG5JVvZOvLKmcMbHqhvutM+RYzvDMMfzoLCiVmn310unfv/g/VMhmN756dHaPJc2rFMTOP9zg0 a7AA=
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126092630.1800589-19-ardb+git@google.com>
Subject: [PATCH v2 07/10] arm64: mm: Drop redundant pgd_t* argument from map_mem()
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
X-CRM114-CacheID: sfid-20260126_012739_880642_D6CB690D 
X-CRM114-Status: GOOD (  13.38  )
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

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 25 ++++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 377bdc4d84a1..80587cd47ce7 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1020,11 +1020,11 @@ static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
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
@@ -1072,13 +1072,13 @@ static phys_addr_t __init arm64_kfence_alloc_pool(void)
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
@@ -1114,11 +1114,11 @@ bool arch_kfence_init_pool(void)
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
@@ -1163,7 +1163,7 @@ static void __init map_mem(pgd_t *pgdp)
 		 * if MTE is present. Otherwise, it has the same attributes as
 		 * PAGE_KERNEL.
 		 */
-		__map_memblock(pgdp, start, end, pgprot_tagged(PAGE_KERNEL),
+		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
 			       flags);
 	}
 
@@ -1177,10 +1177,9 @@ static void __init map_mem(pgd_t *pgdp)
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
@@ -1402,7 +1401,7 @@ static void __init create_idmap(void)
 
 void __init paging_init(void)
 {
-	map_mem(swapper_pg_dir);
+	map_mem();
 
 	memblock_allow_resize();
 
-- 
2.52.0.457.g6b5491de43-goog


