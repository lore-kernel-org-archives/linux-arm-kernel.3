Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4149FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DT4zvpGacxHRk/WPHA3P347efnejtMNVhL3FmZpnqUQ=; b=0kXwDFzhY5KeLBVobB5rALNm01
	fxgFYvMgXBwjoTpZDULOg5gQ5l9lloZ417snxJRNQjLu0JAJ1AKtoUKppxEllyVy3K3oS68odN3kl
	bg9tT88DY+Tz+Tg5KcKKQWWLdEHCf5ZvbgeqHGN08pL4QkWrZ1uUrW/T7MlZzKBQUtnTMYnwSQyPo
	GBVWeUipR4Igb8uUhQNAeVCqq+yqC6L/vYiP7Q2Gi/3u3XQjBQLu8OIrWPT8gSeNd4NNq9eCdRviE
	/DfouP6LbCBqRQZQYFARiipes0IXp87cUpC/xvczDzH0toOwVlFWWYvHkxPH70cyjFdhkC549Tjd+
	ewpEm61w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHO0O-0000000HCxJ-1q0u;
	Mon, 27 Apr 2026 15:36:16 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHO00-0000000HCaP-3ZCn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:35:54 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4837b6f6b93so111416745e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777304151; x=1777908951; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DT4zvpGacxHRk/WPHA3P347efnejtMNVhL3FmZpnqUQ=;
        b=Ik50435pp521X8we4gN8zqkEg34f0Cu6ZNTIRuDsyDMMHW4X4brtY3NnO02IhCzHBO
         ypvTVAo50YUfnZk6YJGsYYoyDDpYOPOJ4NtSd7i+0hs4zd04312Qnh3w25+itLjij95F
         SYWe4osSvl/IEHTNX+fMg3Ypi2gpvAdiDTb6v4PhuUMVWF5TOSAuVLFJEEtfCH6OIeYu
         ogmJAREfn4wPQr0+Th1Ep1sH4dm4MCjymDm5ISTUmdsc/T5MKFFIWCKOxySP0J8aoeTu
         FTUjXqP+3fAx2e204F9S9q9xaBNw1Fnuf4e4rewxtUW68Hqr9WQoPk7S87AdVSP5i6Le
         bD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304151; x=1777908951;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DT4zvpGacxHRk/WPHA3P347efnejtMNVhL3FmZpnqUQ=;
        b=osgwOURU2kNbpM8ugXjIrpPc1FEuV1u75xU7tluo9ssrfMjkgxQ4RQBYJu1qvgxLH7
         MBZ4jfkD+BCRKDSSfEPinSj6+PRSjv2mwNKh0g9aKB6ntnSYlrGZ7uk8t34PC389gcPG
         uSczV9v3A36AmD8k4/78jcDLsbY4b+GGAmy1udBm+2hwOvRLw1K4HnvO/O2LXXoT0gt8
         OQ/rLkfsMNsYt3wlVZ/yNtLFGXBV0zcBpxKgIwsM72sMa0DUvBFtoZRU+/Tx7/rxSzEf
         wb11NrX0JJkkwcbmvIVWyeZGsHdGCBs1Jp+oQMVObmqEjzHAvEiMktPGq+hRsBEjPSOx
         4CJg==
X-Gm-Message-State: AOJu0YwixQbTxaxqJ06I40iSX3OUgnyD65+hk3KdISDgLVybINQxIiF1
	DHXiIkFLWIQZxw4xJEI7mkDNClfow6InG3KRj1tKZgZRtDIRJdck6DFIVd9+x5/mLGGZu+8ZhMR
	PWaoyu0RhzfdGL6MR1dpnm8SFSbZj7eCnvF3NToXTQXFpHHjtuSPpaYxhe8aTu28ss3xfazIZGD
	OfPMRN1DeGP8nMj/Qdq93dX+m7B7bfEVH0JXJyTwR1EaZ8
X-Received: from wmbdn19.prod.google.com ([2002:a05:600c:6553:b0:48a:55e6:d5c4])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:888b:b0:488:c40b:c8bf
 with SMTP id 5b1f17b1804b1-488fb73d234mr529149015e9.2.1777304150888; Mon, 27
 Apr 2026 08:35:50 -0700 (PDT)
Date: Mon, 27 Apr 2026 17:34:32 +0200
In-Reply-To: <20260427153416.2103979-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260427153416.2103979-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3660; i=ardb@kernel.org;
 h=from:subject; bh=5/WaFTKUieGOECS5oMgCFK1ktF6MkiLzxXcp+K6DIKQ=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfN9E3/1lYfbJ77dJSXx5Ty7SW+1FL9kwrFd8h9mz9lz8
 P9LxbYTHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAibycx/M9OuztxTuOemrh5
 3P/U/VdeN3wn/f+WxmsXu7Ztgtv4VhYz/HfpvK1unhEare1hsj3hZmaG3YWulTsrSjxvCd3xnTH xNxMA
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260427153416.2103979-32-ardb+git@google.com>
Subject: [PATCH v4 15/15] arm64: mm: Remap linear aliases of the fixmap page
 tables read-only
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
X-CRM114-CacheID: sfid-20260427_083552_991200_2855FB56 
X-CRM114-Status: GOOD (  15.62  )
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

The fixmap page tables are statically allocated, and are currently
mapped read-write both in the kernel mapping as well as its linear
alias. Due to lack of randomization of the linear map, these tables will
appear at a priori known offsets in the virtual address space when
booting without physical randomization, which means that a single kernel
write primitive is sufficient for an attacker to map memory of their own
choosing with any permissions at a known virtual address in the kernel's
address space.

To harden against this, move the fixmap PUD and PMD tables to
.pgdir_rodata, so that both their kernel mappings as well as their
linear aliases are mapped read-only during ordinary execution.
The PTE table needs to remain read-write accessible via the kernel
mapping, but its linear alias can be remapped read-only as well.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/pgtable.h | 6 ++++--
 arch/arm64/kernel/vmlinux.lds.S  | 1 +
 arch/arm64/mm/fixmap.c           | 5 +++--
 arch/arm64/mm/mmu.c              | 5 +++++
 4 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 94235dd428be..21afe923cd71 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -822,8 +822,10 @@ extern void set_rodata_pte(pte_t *ptep, pte_t pte);
 
 static inline bool in_pgdir_rodata(void *addr)
 {
-	return addr >= (void *)__pgdir_rodata_start &&
-	       addr < (void *)__pgdir_rodata_end;
+	phys_addr_t pa = __pa_nodebug(addr);
+
+	return pa >= __pa_symbol_nodebug(__pgdir_rodata_start) &&
+	       pa < __pa_symbol_nodebug(__pgdir_rodata_end);
 }
 
 static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index e5e1d0fd7f27..9b346dd24d1c 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -247,6 +247,7 @@ SECTIONS
 		__pgdir_rodata_start = .;
 		swapper_pg_dir = .;
 		. += PAGE_SIZE;
+		*(.fixmap_rodata)
 		__pgdir_rodata_end = .;
 	}
 
diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index b649ea1a46e4..ad6d46e5c23e 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -32,9 +32,10 @@ static_assert(NR_BM_PMD_TABLES == 1);
 #define BM_PTE_TABLE_IDX(addr)	__BM_TABLE_IDX(addr, PMD_SHIFT)
 
 #define __fixmap_bss	__section(".fixmap_bss") __aligned(PAGE_SIZE)
+#define __fixmap_rodata	__section(".fixmap_rodata") __aligned(PAGE_SIZE)
 static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __fixmap_bss;
-static pmd_t bm_pmd[PTRS_PER_PMD] __fixmap_bss __maybe_unused;
-static pud_t bm_pud[PTRS_PER_PUD] __fixmap_bss __maybe_unused;
+static pmd_t bm_pmd[PTRS_PER_PMD] __fixmap_rodata __maybe_unused;
+static pud_t bm_pud[PTRS_PER_PUD] __fixmap_rodata __maybe_unused;
 
 static inline pte_t *fixmap_pte(unsigned long addr)
 {
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 84d81bae07a7..e76fe5b0c5fe 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1076,6 +1076,11 @@ void __init mark_linear_text_alias_ro(void)
 			    (unsigned long)__init_begin - (unsigned long)_text,
 			    pgprot_tagged(PAGE_KERNEL_RO));
 
+	/* Map the fixmap PTE table at __fixmap_pgdir_start R/O in linear map too */
+	update_mapping_prot(__pa_symbol(__fixmap_pgdir_start),
+			    (unsigned long)lm_alias(__fixmap_pgdir_start),
+			    PAGE_SIZE, pgprot_tagged(PAGE_KERNEL_RO));
+
 	remap_linear_data_alias(true);
 
 	if (IS_ENABLED(CONFIG_HIBERNATION)) {
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


