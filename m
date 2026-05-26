Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5844ACD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 18:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yyd3IudRVUHVyeM6Sgx7GyCvuriuV9w8zEGgNDuF+gw=; b=17F7Y41EFJ7ZeI46fTZTAqS6dd
	VjujJFhsAvMequ6nlkuc6+P/lnECK6DlAacUQ8LR/YlYf4HrDKV+10AtUFSBJGkpTp3kb8CX+ixor
	GfJJhUDMoiNre8Tb6j2QlYjEiLFZvaE9QDpTbxG/MCeiJ8/iIE7ma6ryAI0lfdN6iGT8085UTd8lN
	y3ADA29nJCnObp5fu9GMSC1wsk4/qX1tcAOjkAAtkecu8mkOQTIZvgh/NBm74xP7xn2k0D6vfLQxh
	tq6n9VSbrXoSERDEdGf7ZO60/aNJZYCvJEq65LpPJM3iVYGFR2cfpeWgTI4d2A1kX7jtYJVEm4VWM
	s01A1gIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw3z-00000002mq9-3reN;
	Tue, 26 May 2026 17:59:35 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw3p-00000002mj0-19hD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:59:26 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-44f65835b77so7834476f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779818363; x=1780423163; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yyd3IudRVUHVyeM6Sgx7GyCvuriuV9w8zEGgNDuF+gw=;
        b=hAJnbhSh5xVCyZ/d8cC7xqis6bRnvyanAruqleU5wM/4ERo5wlnXkNWe6yvsf1uSmn
         HHLWrFrHt65CPCSLaGGYQN+GQ4nkJaikgk/CaW4xIZwfXXqd4IYe0NUV0BEiALnCfaMt
         YuBscttPx2h/+vmvbC872oSJ3Y372gB8Hq5ewd7FTHwZfejbv4wvbatJFzWguzLcG2u8
         54Wqw8Z5+Xccjn7A0QH5O3KuEjj0C/p7sH6VpIR7wadwkErji9ZWUDitATkZVcGBdWgp
         CyeAKIwJ0hVSCWpxNSP4M7l2Kpqkx1stNuFBPI4g//dmhbM2MVJtetO13PSS6icmpdZf
         4o2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818363; x=1780423163;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yyd3IudRVUHVyeM6Sgx7GyCvuriuV9w8zEGgNDuF+gw=;
        b=RrEryIR1riVbH08PBLdPpNfzUO846bkBwURhmXd3AUNgvAmtdivMQnUQWLhp0fuOkt
         WGCpiUuW665a2c35gVs0SVvzhxjG37RLSQC31Q4OAglRsktLfUndxKlnV/Mn2WlsSYL2
         aUGxFz6e62e+KruZN0MUfPJxO64jtu1V1QyDfXzvcrdT4HS+d6ewqCezSY+XpFUl62Aq
         kMuxiiUhjHSIDFa6f3flojYVTCzpyI6RwU9I4NSuN9UZ5p6mWbrFE3UxP58S9Paa5j5E
         8kwDsXBjbfUusjxiNsCxTNHtSvWLEA5pS0UMVLOWENedmsI0vN3VtUF1V/STub9Zkw6K
         f+yA==
X-Gm-Message-State: AOJu0YwNbq6E2o9pgtS7Saoc7XZ5DQQxiNL+kbEag7s5Qjayxe/gkIz3
	tUf5hZKhVHIrev8Ndvy3eE1yrHtwqB+mPOoHPxNkeiSfW6WM89Etyxx+z6kRKvcbDQQVmhpomW9
	vEmYXuy+8GN7+46U4s5jtzmGHjxkLaxV+gfpKsQwVMEuPozf6aXYg/UvvWBL3xEsOXpPi5g5oXh
	kJI1WVQUepQa7DPDtsM5Nv9Jj1xe75jyy6NlvW2Rdfe56b
X-Received: from wrwy1.prod.google.com ([2002:a05:6000:1081:b0:44c:3df5:500e])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4917:b0:43d:dd:8ca4
 with SMTP id ffacd0b85a97d-45eb36ab5c9mr33376312f8f.14.1779818362409; Tue, 26
 May 2026 10:59:22 -0700 (PDT)
Date: Tue, 26 May 2026 19:58:49 +0200
In-Reply-To: <20260526175846.2694125-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260526175846.2694125-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3439; i=ardb@kernel.org;
 h=from:subject; bh=vIIm6COov+NQzX2nIS8cvw7su4mTKmzskcBcPmulqnI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUv0fpS02zOfRUy3961i3vC1b7n+Evm+/R38NgG/DlrXZ
 Qm+/ezWUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYyZREjw8TXaqzPetiWhH24
 cp5p0vNHbzoXsV7Pm+XWwVYqvcHR9SUjw6wVekazft8qKTufNy9Z5jRL5boX02v9d1fyMKbXF/Q c4gAA
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260526175846.2694125-19-ardb+git@google.com>
Subject: [PATCH v6 02/15] arm64: mm: Drop redundant pgd_t* argument from map_mem()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_105925_339321_7D578F75 
X-CRM114-Status: GOOD (  13.76  )
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
2.54.0.794.g4f17f83d09-goog


