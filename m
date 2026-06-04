Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB0CCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 15:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vft77YELPmjJ4ZOMQRn5jvDbuRX5+oDiBLjSUaVIbM=; b=p0/q3WS6uUGILR2Bevmlex0jR9
	OW8qz2Kv8wd7bKwMUdWT189t2dIOYn6EobEkT67Ac/5fYahPdG2dF64/+zVezVTWqt5xeHhYDl+Tx
	6UzA7MM06Mgn52qp3f/d7qGix/QpIioGhbrNHdPLBb0dNo6WOZv42Z+Qj49P7/dKwKrTr6buh88dh
	kCHhO7JAV8I/pCziLYrmaUAof4nI6HVDsjgwHwLk2fsx9KfLK+FR3WFPZH5P4zzVr/ckU/o/imn47
	9N3/vjH8mxueXMkc7JqKs7Lqdv6ZrCBqBolEI+Ancc6/syLl42PsCXF8JpslKSCeLE6FrhaCD1EWo
	xQ1AmgIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9k7-0000000GxyX-1j4R;
	Thu, 04 Jun 2026 15:12:23 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9k3-0000000Gxwa-3fwe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 15:12:21 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490bde3d239so6721245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 08:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780585938; x=1781190738; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1vft77YELPmjJ4ZOMQRn5jvDbuRX5+oDiBLjSUaVIbM=;
        b=G2U+yhcFL0bY4HVNgaCqYDpEvM1hBTDnb6EgOSoUKPUU9c4hq0/9QC1/EIVREzFzfV
         lHzo4KZl34XuZmADGTxyt7vWz6QSafcTkXOyWISksHTECqcabAWFoBTQ1o6QFJBrUI89
         O3ZUO67o8guPcZaE/tuSfLa3PDLX1GavMLzkPJByjc4dTV9qpnxz4eLfkVrOVGyqcy32
         ozI9cjnTVApLu3Ec3aFzIH2yiVYDxxisIDjr618b2s9SFuGMCKYqe0QmiSw59kbkYplO
         xZYkToUrqnWbA+r58zN7/MkpcgYRcgIGdYHm0aykAIMjlBBEziGYxbd6gCT9RA0HDP5t
         MNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585938; x=1781190738;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1vft77YELPmjJ4ZOMQRn5jvDbuRX5+oDiBLjSUaVIbM=;
        b=BzbbHOaVPwIDL0ImfWpRzN2rWGnV7tmTbI2qKZDeltkZjynKcCIRhTO31f1PWP0nUN
         st6Dp4I+uxioVULP8X/93WfCxcIFS7QY/eNy4nfH0ZNmwLl9QBt4TipKYXIpjIC9EHN3
         AsVAY8ziM7wxNwhb0m7wjNLJzlcAQiHsx1vBoii9rzViskvowV0gmWME9FaaDEFki+v5
         zzgzZUU0BA3Zh4kU3p384Sugwx/XuH4GIh24wv5imvMMW8k0OoUSPgS8zW1Sr8UKJe7J
         YKFgfNarkt7k+4yn6gJPLFXsrIxSSxxNX86hvAOtLrXUmflRBYAOoG3w16ergNze4hEi
         NmfA==
X-Gm-Message-State: AOJu0Yzpnv85WbLsB/PPbOWYkDpb/WiA0G7NhQFzqof0sEcjU5ZilcEI
	nGftHxGMgJca1biKZkA+5XK0B45MSfhJt03/LYxLJZLxdd2dDkpNe3tfaMuwo3gsqsr+JcWO69Z
	5yqz07RKpVAfGqxt9crLO17jsk2D/mG70sira9FiUeLbH/gie6Enbb+n2iE8lUUCIY4UuCAJT1N
	MuszRPgLu0mk3zZJaXqQn7v2pKhEsrUdtYoLJwH9Upcc6J
X-Received: from wrbfi7.prod.google.com ([2002:a05:6000:4407:b0:45e:e6b0:3979])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b01:b0:490:6237:5200
 with SMTP id 5b1f17b1804b1-490b5d36863mr138738705e9.10.1780585937520; Thu, 04
 Jun 2026 08:12:17 -0700 (PDT)
Date: Thu,  4 Jun 2026 17:11:53 +0200
In-Reply-To: <20260604151151.150377-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20260604151151.150377-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3698; i=ardb@kernel.org;
 h=from:subject; bh=evI3lVeMOyNIXHC2cUpGPRX/cshmKemdx+fpRfwf0/A=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUtx6q6G5VHLWGY3VFw34+IQ3qEXUnKc4ZZBKBvbzNkrD
 p/ZN2FmRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZiIyHuG/55z5G491F67/dKX
 M2zJqSlrH13o3vVvk3rTlv8siw7Hlsxm+Gd77uWt5Jrk549dry/TLf15NfRb/8ySPecfMnDc6u/ PWMAFAA==
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <20260604151151.150377-8-ardb+git@google.com>
Subject: [PATCH v2 1/5] arm64: Rename page table BSS section to .bss..pgtbl
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, Mark Brown <broonie@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_081219_931138_2D1DF8DB 
X-CRM114-Status: GOOD (  13.16  )
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

Rename the .pgdir.bss section to .bss..pgtbl so that the compiler will
notice the leading ".bss" and mark it as NOBITS by default (rather than
PROGBITS, which would take up space in Image binary, forcing all of the
preceding BSS to be emitted into the image as well). This supersedes the
NOLOAD linker directive, which achieves the same thing, and can be
therefore be dropped.

Also, rename .pgdir to .pgtbl to be more generic, as page tables of
various levels will reside here.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/linkage.h | 2 ++
 arch/arm64/include/asm/mmu.h     | 2 --
 arch/arm64/kernel/vmlinux.lds.S  | 8 ++++----
 arch/arm64/mm/fixmap.c           | 6 +++---
 arch/arm64/mm/kasan_init.c       | 2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/linkage.h b/arch/arm64/include/asm/linkage.h
index 40bd17add539..8637f667667c 100644
--- a/arch/arm64/include/asm/linkage.h
+++ b/arch/arm64/include/asm/linkage.h
@@ -43,4 +43,6 @@
 	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
 	bti c ;
 
+#define __bss_pgtbl __section(".bss..pgtbl") __aligned(PAGE_SIZE)
+
 #endif
diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index fb95754f2876..5e1211c540ab 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -13,8 +13,6 @@
 
 #ifndef __ASSEMBLER__
 
-#define __pgtbl_bss __section(".pgdir.bss") __aligned(PAGE_SIZE)
-
 #include <linux/refcount.h>
 #include <asm/cpufeature.h>
 
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 2b0ebfb30c63..d3ed59abab38 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -352,11 +352,11 @@ SECTIONS
 	BSS_SECTION(SBSS_ALIGN, 0, PAGE_SIZE)
 	__pi___bss_start = __bss_start;
 
-	/* fixmap BSS starts here - preceding data/BSS is omitted from the linear map */
-	.pgdir.bss (NOLOAD) : ALIGN(PAGE_SIZE) {
-		*(.pgdir.bss)
+	/* page table BSS starts here - preceding data/BSS is omitted from the linear map */
+	.pgtbl : ALIGN(PAGE_SIZE) {
+		*(.bss..pgtbl)
 	}
-	ASSERT(ADDR(.pgdir.bss) == __bss_stop, ".pgdir.bss must follow BSS")
+	ASSERT(ADDR(.pgtbl) == __bss_stop, ".pgtbl must follow BSS")
 
 	. = ALIGN(PAGE_SIZE);
 	__pi_init_pg_dir = .;
diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index 1a3bbd67dd76..f66a0016dd02 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -31,9 +31,9 @@ static_assert(NR_BM_PMD_TABLES == 1);
 
 #define BM_PTE_TABLE_IDX(addr)	__BM_TABLE_IDX(addr, PMD_SHIFT)
 
-static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __pgtbl_bss;
-static pmd_t bm_pmd[PTRS_PER_PMD] __pgtbl_bss __maybe_unused;
-static pud_t bm_pud[PTRS_PER_PUD] __pgtbl_bss __maybe_unused;
+static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __bss_pgtbl;
+static pmd_t bm_pmd[PTRS_PER_PMD] __bss_pgtbl __maybe_unused;
+static pud_t bm_pud[PTRS_PER_PUD] __bss_pgtbl __maybe_unused;
 
 static inline pte_t *fixmap_pte(unsigned long addr)
 {
diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index dbf22cae82ee..3fcad956fdf7 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -214,7 +214,7 @@ asmlinkage void __init kasan_early_init(void)
 		 * shadow pud_t[]/p4d_t[], which could end up getting corrupted
 		 * when the linear region is mapped.
 		 */
-		static pte_t tbl[PTRS_PER_PTE] __pgtbl_bss;
+		static pte_t tbl[PTRS_PER_PTE] __bss_pgtbl;
 		pgd_t *pgdp = pgd_offset_k(KASAN_SHADOW_START);
 
 		set_pgd(pgdp, __pgd(__pa_symbol(tbl) | PGD_TYPE_TABLE));
-- 
2.54.0.1032.g2f8565e1d1-goog


