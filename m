Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B9DCD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xs8UZJaaGpDG2dm36q3rutkvNlrSNXe/Bj9mb4oSyno=; b=vuUoxtSPDgWSwGYKCbGNKP74yf
	HtLp9uxsa5PqgL7/cUqVJuajI5EsrDq+AKgoZbwV9qWUgjXW9w1KWRS3JSY3VAPfOyiLHKohQ3qV1
	44HyOPcBZdlaqJbszJy+6ctUXSTrrjn1gG/pMwwvRXSInKx63B6JTL9ay/Wd4infNyjPBupZ9zCVA
	CTWEqZL925U8RnQw8htX7pL3Yxn8XAaBVJvgHt3SCKY7YusN4ntHssURPBjh9dC9tG6WatljWFr6T
	sSwv+rxFs1LEcRTQdQEkTVclRU8zJN3BW2aPkbb7mHklPmZr/20SqkGNHRUvezntEtRkrYuP8PMsf
	kvLR0/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyjQ-00000007bqp-0GDF;
	Fri, 29 May 2026 15:02:40 +0000
Received: from mail-lj1-x24a.google.com ([2a00:1450:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyjK-00000007bjH-3WHL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:02:36 +0000
Received: by mail-lj1-x24a.google.com with SMTP id 38308e7fff4ca-393adad635dso81469521fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 08:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780066949; x=1780671749; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xs8UZJaaGpDG2dm36q3rutkvNlrSNXe/Bj9mb4oSyno=;
        b=j/AyjaWbLmPGw+Qf8HF5Rj5fmRiXPXnGEI7bV2ozVmauxSqZ6hftwuMW3xD9XW/8f5
         Aw666rOd3lCUcXUoAmyObDx4ibIItGKbb7i1ZpSUg1DyC9oCW3LjgyUxXIlJJEXFodKf
         DF3nl9hR42w40YQJZMt6PFwSFuvJHMgrTTgOpNabC3JtZrWHn2EwHeyTcuLwwvvCexzQ
         5v3GQ+mIJ8OUljD4DrFnCg+na2CShqYW63G4olQmTVP3GXwOQeA1BjI117AywBHrqw/U
         rZ1mWnMiwYzGLGWq+4mQ3SeoL/on8uf+N/NfHMMlqZ5h196EYMRy47o8IVkJq0DvHH9+
         1QUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066949; x=1780671749;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xs8UZJaaGpDG2dm36q3rutkvNlrSNXe/Bj9mb4oSyno=;
        b=MaU1KQtffY6NEPrNN9xTK7wIfhBnKpL84bDlv/7CRTtMvYMqYQCyixKbEJ2YLRTGZ3
         KTUo9IAT/9GjTemd+Qe2Gm1tHtSdedsVWu3+p/IZxwqZ47tlUWI7AfZEu0PaO0nlhQfm
         1hYDbWKjoUOViBjdN6JiIr7oehNvFkC0Rx72EBpuMnPftVX/obK1sHUZ9IBvjLJJ8yWo
         lGLIXhpi+lHJzwzu1+Jqdw8mmifiEo/xjOjYfJ7zCcGn99E4dLqClHnVSCMtkfuct0YN
         Y/tJyD1eOPVp5qKCgfIJHoEwG8cnOprKS0LUFQIjJGRS8qSqyn1ScH3hgl/mIuUU1wq4
         Uobg==
X-Gm-Message-State: AOJu0Yzf68WCZVlw3THQWptf4aUTgcC6xvDxYYBAHKQBnuoaQVjtQmle
	IlhuaC9mIDdPMl1+YfGA+mlvoUkFip5vrXanGCL5RYpNTSuioKhYz21JOfzXVjKZzGUGsPf/jaK
	HMjLzFikETZ0SxX+TkSOI/8euE5F4hVR6NEuS9Z0kK5FX9TxqYW+uMDUchG+g9pIWUiWHhXrQuB
	ZEjSs18caDGkpwlCs4VKtcBtDOInQN+HX+UF3i6vt322Jl
X-Received: from wrjb2.prod.google.com ([2002:adf:e302:0:b0:45e:f542:3761])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a2e:990d:0:b0:395:ae3b:3375
 with SMTP id 38308e7fff4ca-39664e981c0mr41301fa.2.1780066948187; Fri, 29 May
 2026 08:02:28 -0700 (PDT)
Date: Fri, 29 May 2026 17:02:00 +0200
In-Reply-To: <20260529150150.1670604-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260529150150.1670604-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3242; i=ardb@kernel.org;
 h=from:subject; bh=QwDzTM46GdUE+NivIT38dC1HutxUWa2GWKTenTtP7nY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUtyVWb2gvjDypnblG6ZO3Wv1Bft/jrhexd79oV7t577u
 RU+EnfqKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABNZI8zw36neUKL4j/F/nsar
 u7+2BlcevsMd8uPEywc1ppJzt9RzHGb4K8J9S++osuTMJf0rlUt33Z06V/Xzwox9+yqmH1l/Qee ZAysA
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150150.1670604-26-ardb+git@google.com>
Subject: [PATCH v7 09/15] arm64: Move fixmap and kasan page tables to end of
 kernel image
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
X-CRM114-CacheID: sfid-20260529_080234_924663_8180650C 
X-CRM114-Status: GOOD (  16.95  )
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

Move the fixmap and kasan page tables out of the BSS section, and place
them at the end of the image, right before the init_pg_dir section where
some of the other statically allocated page tables live.

These page tables are currently the only data objects in vmlinux that
are meant to be accessed via the kernel image's linear alias, and so
placing them together allows the remainder of the data/bss section to be
remapped read-only or unmapped entirely.

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/mmu.h    | 2 ++
 arch/arm64/kernel/vmlinux.lds.S | 8 +++++++-
 arch/arm64/mm/fixmap.c          | 6 +++---
 arch/arm64/mm/kasan_init.c      | 2 +-
 4 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index 5e1211c540ab..fb95754f2876 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -13,6 +13,8 @@
 
 #ifndef __ASSEMBLER__
 
+#define __pgtbl_bss __section(".pgdir.bss") __aligned(PAGE_SIZE)
+
 #include <linux/refcount.h>
 #include <asm/cpufeature.h>
 
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index e1ac876200a3..2b0ebfb30c63 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -349,9 +349,15 @@ SECTIONS
 	_edata = .;
 
 	/* start of zero-init region */
-	BSS_SECTION(SBSS_ALIGN, 0, 0)
+	BSS_SECTION(SBSS_ALIGN, 0, PAGE_SIZE)
 	__pi___bss_start = __bss_start;
 
+	/* fixmap BSS starts here - preceding data/BSS is omitted from the linear map */
+	.pgdir.bss (NOLOAD) : ALIGN(PAGE_SIZE) {
+		*(.pgdir.bss)
+	}
+	ASSERT(ADDR(.pgdir.bss) == __bss_stop, ".pgdir.bss must follow BSS")
+
 	. = ALIGN(PAGE_SIZE);
 	__pi_init_pg_dir = .;
 	. += INIT_DIR_SIZE;
diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index c5c5425791da..1a3bbd67dd76 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -31,9 +31,9 @@ static_assert(NR_BM_PMD_TABLES == 1);
 
 #define BM_PTE_TABLE_IDX(addr)	__BM_TABLE_IDX(addr, PMD_SHIFT)
 
-static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __page_aligned_bss;
-static pmd_t bm_pmd[PTRS_PER_PMD] __page_aligned_bss __maybe_unused;
-static pud_t bm_pud[PTRS_PER_PUD] __page_aligned_bss __maybe_unused;
+static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __pgtbl_bss;
+static pmd_t bm_pmd[PTRS_PER_PMD] __pgtbl_bss __maybe_unused;
+static pud_t bm_pud[PTRS_PER_PUD] __pgtbl_bss __maybe_unused;
 
 static inline pte_t *fixmap_pte(unsigned long addr)
 {
diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index abeb81bf6ebd..dbf22cae82ee 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -214,7 +214,7 @@ asmlinkage void __init kasan_early_init(void)
 		 * shadow pud_t[]/p4d_t[], which could end up getting corrupted
 		 * when the linear region is mapped.
 		 */
-		static pte_t tbl[PTRS_PER_PTE] __page_aligned_bss;
+		static pte_t tbl[PTRS_PER_PTE] __pgtbl_bss;
 		pgd_t *pgdp = pgd_offset_k(KASAN_SHADOW_START);
 
 		set_pgd(pgdp, __pgd(__pa_symbol(tbl) | PGD_TYPE_TABLE));
-- 
2.54.0.823.g6e5bcc1fc9-goog


