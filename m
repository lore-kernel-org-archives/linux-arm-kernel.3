Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F44DCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 18:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJx2KhHmtgY53AkMvOyg5uK/J3luFDMcMijObo9+4vo=; b=QWjzDwklSfovN+cFHpkXplnfKj
	z8OQi0xrH8fGKqKI2bS9wzJ9Qf67PsDIQviyrbdfi+XmTNkOPhbjtkwsT7TIi1eJuDAxsGtSM2ldR
	NZZDbyKTOZQnbGBC2L3AQF7rzPID5DESm8ms3PA55Z0od8Sji8i6I/+qHFTTi/c6qXCKXxAfw7K8k
	npY58gO9PCmBTUltpOMMiWpxDVgII6zuMZPPCqnu0ep5fSKWNQ8VHioQCFbgjm9qU7LxHe9KweloV
	dV4b7cGSlkAl7HQ5e+7Fklzo4YQmjcfQ7hkiS/Xo84tZTQUDTovLZcgFkvyQbQYsiUNpay0TMYHlr
	u7Wq3SFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw4T-00000002nJS-3PpF;
	Tue, 26 May 2026 18:00:05 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw3y-00000002moJ-36Ci
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:59:35 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-49058295985so20435685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779818372; x=1780423172; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TJx2KhHmtgY53AkMvOyg5uK/J3luFDMcMijObo9+4vo=;
        b=nhTFm4xswUXMGIixbKnmrrTxxw11zccNz4t+ReLBF4zhRvb6F38RP21BNP/EhPPLW5
         AlSUTBpnrymQAjYHidQziIZqGJ3Sf7h7fMNeWXqCbHkv/ZSkRk1SipcmPArctcSy6kcO
         djDjdJGevHcS35buD1xGlThwnP2KWqVZ5XNt9qsmsult+D42sE+iaemd2hTNOAvL7HOL
         Mjc5Qp99lqd49fBKWzgSOkHx0cpoxr8Otl/Tsi5wJ0eAQX2QH17vreKIp7tBEH78sa2+
         WxwStg192gLN6Vwt6USo8AaeBTLLkOez+3fq8miWCuj/k4nB+xoLXpvMVcPyNncrUUeo
         6FbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818372; x=1780423172;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJx2KhHmtgY53AkMvOyg5uK/J3luFDMcMijObo9+4vo=;
        b=Vsrp5hZefjl5R/56Y6HSOgW4xtS+5ETa2O+YjXAIAcbi5BhwWKT2CDgYdNOBNjk8wB
         7h5Wjs8+GfPMHO85bD7R7oCRzdHmD3AJEJFTENqdOb66TZws3ee/UILWc4ji33Yb3+sq
         AiPMf4p57ZdRP6EUW8LNmjb8rEuMiawWyJFO+9Jt/7HvYlIhpCb8kktB3SsPdzy+WiBK
         PZxzfPaloV9T+C8u6LfQKOcfsg1Kdv5IAM/IJB864Q2tMQvPusk1LAY31xiCEJDPEn1C
         WvUgZ+B1ppMZMYbqQDh4NPjH1HHnZlfarZOJSyeI1IjY/sA8F1WQfiNqc/zcB+LS63sf
         GncA==
X-Gm-Message-State: AOJu0Yzd9cGVAUrCBTBmcqh141HAXmXCAt72e5j15WDTlscSrNWqkF48
	wArCHC4il/1JNmHNiVgVQkGg/ifg+N0Kn85dkWMwfyhECJuwHZpU3TOvfZ6a5JHVBohvbk5IX6C
	6qEUZTb7E5RxvkxT47px+TGf+ZkX+fZrMakw/WsKsnvGG3N9XRjAQEU7DvtfG1zG/TZV5mpKrMq
	BcyZ9pSFw6qHBJSqoowPGTZensWOm7i3pfLaFT0Iqo3lde
X-Received: from wrjn10.prod.google.com ([2002:adf:e34a:0:b0:43d:6f5f:8c52])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:35c8:b0:490:44eb:c1e7
 with SMTP id 5b1f17b1804b1-49044ebc2d5mr360486815e9.30.1779818372100; Tue, 26
 May 2026 10:59:32 -0700 (PDT)
Date: Tue, 26 May 2026 19:58:56 +0200
In-Reply-To: <20260526175846.2694125-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260526175846.2694125-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3242; i=ardb@kernel.org;
 h=from:subject; bh=Qta0PMsGcvlQhpXqhjldDBt900x2YBq541ys84w8Z6A=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUv0frL6+VN/jnUf5F5tPjtywfpJk9QUy2MKCjk0NTccj
 r7PUqfVUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACayl53hf8n7L8U7Dq/XtJM8
 aaNT5xu9zmX9+a6ICfks3cp+rZ7mixj+Z6226zYNmPCvKn7q8tmXSzeumHZtU+IR1bAruyazqkp WMAIA
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260526175846.2694125-26-ardb+git@google.com>
Subject: [PATCH v6 09/15] arm64: Move fixmap and kasan page tables to end of
 kernel image
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
X-CRM114-CacheID: sfid-20260526_105934_799315_C01F1129 
X-CRM114-Status: GOOD (  17.43  )
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
2.54.0.794.g4f17f83d09-goog


