Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016F9FF8869
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmP6R09Q9nWqYYDZQR+Duu/8tNuRQcuIH0M5Nuu7R3A=; b=PXSxGNhV/kGlphyzgpPLcDixN6
	cwTdBnzCDn5f+9RjigICIMu6ChUMF5LYRyhMqgldW0jxlYj7P3kM+iSGD3d/12i7OUn9+DbwkBU0Z
	iVNJ5EMq/m+IlnQsophGUK/eSrhIaTBC88lm77yb6fEfq/Nf6sseueVINEPwwH2739UILi1Kjzr6T
	x+iC2fajM2IM2p85RPLzov+mCpjKJ0aTGmqTDAm91+oRYdIcTgCb+9yNyp++YXNz8VE/3/Pq/nrbL
	7WXQu1aMirMU31tBtb/hJqLl8N43AejJgymdHPc1HEpK4dwE49ohhwQcIaBSkfHBhT8m+I4OwjBc/
	M9LqNRUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHO0H-0000000HCoe-4ARg;
	Mon, 27 Apr 2026 15:36:10 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzv-0000000HCU7-2Vqy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:35:48 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48a5775d647so60541565e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777304145; x=1777908945; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pmP6R09Q9nWqYYDZQR+Duu/8tNuRQcuIH0M5Nuu7R3A=;
        b=djAIF8NCej9VMuqb6xewnsyRc8SCLiqBLKK97wPMKgIpAfjOLUEN/1yp3OEPpn2Jq4
         ET68vroDuZF4BowltOAfrNg87nfpYxvlaiiBmqub4vnUMdMP+crvMqs/D7fc1IMJJLS2
         JS7vBi4iU/+ZllGdDIbZ9T9SK6t4tWoGWFLOtzeAtKX+8epvlaz1RBt59TnS7eLJSosR
         xSNhIUfF9yNj5d6cQlGr24bXQopDNn/TXH0Y2oAUMVpoBHYhVrVTIIvP0mjYkl8F/j/k
         wnai8Exjwr1EsWTSKUk/q2d1OVhMChKgIgFrL0AHQXyWY0LVcviz3kuBoumvCwJIYbND
         SRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304145; x=1777908945;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmP6R09Q9nWqYYDZQR+Duu/8tNuRQcuIH0M5Nuu7R3A=;
        b=FvKpOeM9ptQgt11BsJLfN9fJwkuPhFbReu4oJndlqkED39aV8VQfsiIexcJVgIpyjp
         LUnUcd6YzVDbXpswkQi0Bqyhk1a5RiGX3iN7Q4f+wlONeuUyFaVBw5KJWFAkapJ6B807
         klY5sy8XzGuX+024eKtDoxiv1qs7F3bTcRbINQqLyUrYJ+grZiOL/2rtaFYsO5MTUFg5
         YVOEeXCZzsMrQQ61nHCpqrtxlCYl0O4xY2DrS6mrbvnXa5dOZ+qreVnIwycTufK8fAth
         o9ynM2VDYSrz+sZbtk4214lK27uyTds7rmRSYaHNsqnF177JEW10Z/j6RLteXZuX446n
         f3nw==
X-Gm-Message-State: AOJu0Yy7SxrSeDRJZUnCPwkU4v7IALlMUORPH/zGKmAJx5z6q4ZHhlWy
	4kLa9IKRrw41Yw308jtT5r+3l5Ao43KN93icHLQCkXCKabbS7d+k7ZPWz59dbG+f8oblAz2kSkn
	g+rYzqVpK/R++89XCnhEE46RphPVVORW+x0SED4p7TxlxUefnGWTyoc8cIePjjk9P/5bNE1+auB
	HtlXa+pTNPLZEGnUIoGCZeYsw9ysYvmvPUqtC2q0Yd+bK2
X-Received: from wmqo21.prod.google.com ([2002:a05:600c:4fd5:b0:486:7a8:4f4e])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:190f:b0:48a:6315:da26
 with SMTP id 5b1f17b1804b1-48a6315da72mr216539215e9.26.1777304144872; Mon, 27
 Apr 2026 08:35:44 -0700 (PDT)
Date: Mon, 27 Apr 2026 17:34:27 +0200
In-Reply-To: <20260427153416.2103979-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260427153416.2103979-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1971; i=ardb@kernel.org;
 h=from:subject; bh=TaqiODuFtOBPeOY7+zirlhCAHHbOKzDzJrx2Uvu6+0U=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfN9E4fzFC72tqPtWjWHA8yaWU1Y72S85i48K/X2HmNcy
 pIdrxM7SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwETSPjIybPkSXFT9mmXt+wyr
 Tw3/otuqXJ56eLXKyPRt3vTriPK1hYwM5w6/Xlfbco49iWf7XsYt/4uijGorz1hflb/6oC80o/Y yDwA=
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260427153416.2103979-27-ardb+git@google.com>
Subject: [PATCH v4 10/15] arm64: Move fixmap page tables to end of kernel image
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
X-CRM114-CacheID: sfid-20260427_083547_655801_77FC67DF 
X-CRM114-Status: GOOD (  13.46  )
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

Move the fixmap page tables out of the BSS section, and place them at
the end of the image, right before the init_pg_dir section where some of
the other statically allocated page tables live.

These page tables are currently the only data objects in vmlinux that
are meant to be accessed via the kernel image's linear alias, and so
placing them together allows the remainder of the data/bss section to be
remapped read-only or unmapped entirely.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/vmlinux.lds.S | 5 +++++
 arch/arm64/mm/fixmap.c          | 7 ++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index e1ac876200a3..2dca18574619 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -353,6 +353,11 @@ SECTIONS
 	__pi___bss_start = __bss_start;
 
 	. = ALIGN(PAGE_SIZE);
+	.fixmap_pgdir : {
+		__fixmap_pgdir_start = .;
+		*(.fixmap_bss)
+	}
+
 	__pi_init_pg_dir = .;
 	. += INIT_DIR_SIZE;
 	__pi_init_pg_end = .;
diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index c5c5425791da..b649ea1a46e4 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -31,9 +31,10 @@ static_assert(NR_BM_PMD_TABLES == 1);
 
 #define BM_PTE_TABLE_IDX(addr)	__BM_TABLE_IDX(addr, PMD_SHIFT)
 
-static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __page_aligned_bss;
-static pmd_t bm_pmd[PTRS_PER_PMD] __page_aligned_bss __maybe_unused;
-static pud_t bm_pud[PTRS_PER_PUD] __page_aligned_bss __maybe_unused;
+#define __fixmap_bss	__section(".fixmap_bss") __aligned(PAGE_SIZE)
+static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __fixmap_bss;
+static pmd_t bm_pmd[PTRS_PER_PMD] __fixmap_bss __maybe_unused;
+static pud_t bm_pud[PTRS_PER_PUD] __fixmap_bss __maybe_unused;
 
 static inline pte_t *fixmap_pte(unsigned long addr)
 {
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


