Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80415C44537
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Wguk/FKFbBfgrue612K7C908fnjMdpbMIygxr4WCGE=; b=30x7I7c2U8tvmwgrkGJ6wMYlwe
	toAesw0R5hcU9/3T49fH1FogDJDJOmMjshZZrcMQtPMUFuAL8bddalvWMAO+sOsqnVMJNol/jLzeD
	J1Zb6g0KmjqEygcylA43nA0ILN269KBYlmZNqxD0I7PhVJfrdBw2+KPhvepsaHTY4znJt+hIdn1WL
	Knmg9cSNq4nzDdDTiavVD2Y067PnGCfO+oWLsJH4Gy4rvgNNAWv0hGpU1L+VApHdMY9F2X0Mh1hUU
	25PriKdfIvPrTmoLDTjA0mKccXUgcjaBGQSadVlRGZcSnk1vEj9bujUzrBrI5X98XRmJO+m3l/fjG
	Kbc6aEBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDGM-00000009t7j-0wyI;
	Tue, 21 Jul 2026 16:24:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDGL-00000009t6q-2Ez4;
	Tue, 21 Jul 2026 16:24:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4AE8642446;
	Tue, 21 Jul 2026 16:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9301F000E9;
	Tue, 21 Jul 2026 16:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651049;
	bh=0Wguk/FKFbBfgrue612K7C908fnjMdpbMIygxr4WCGE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=n6oC1Y2YhkB33kl+lY/6bGcVcuCS/W837kNYiwgxRqaeUrDEn9g39wd1GM4MW8px3
	 oNj01sZ9u1lNDGqVzzXPfNa0Ea/Of96eh0QA4sqNpYWUbnY+yJky9ikCkzQmMhSxr9
	 6IvRG18RVe7qXyX3xCvW9Zz65lUPSfZFPe2svum1imsJKQRJfRIjxXtjMjE7tfR/Jy
	 YWYTcZ6iEPaaL37jM9qxoRu089n2DJI97hm3OHoC2zBYISI0/0uZFBSFN6Fh4t4EJs
	 J4dwYxv2Gk/8dIJughDCqh3Los59MNzkVdM9/sO0CdNg41rIY3YGtWzd8PgrLXK3a9
	 J9gqKimG7Gp5A==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:27 +0300
Subject: [PATCH RFC 04/18] x86/mm/pat: use page table accessors for
 effective RW/NX bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-4-2c1fc62306b3@kernel.org>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
In-Reply-To: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
To: linux-mm@kvack.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Brendan Jackman <jackmanb@google.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, x86@kernel.org
X-Mailer: b4 0.16-dev
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

In preparation to moving core parts of change_page_attr() to common
code, replace open coded checks for _PAGE_RW and _PAGE_NX bits in
lookup_address_in_pgd_attr() with pXd_write() and pXd_exec() accessors.

Add x86 implementation of pXd_write() and pXd_exec() accessors and
provide generic stubs in include/linux/pgtable.h.

The stubs follow the existing pattern and BUG() if they are called.

No functional change intended.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/include/asm/pgtable.h | 36 ++++++++++++++++++++++++++++++++++++
 arch/x86/mm/pat/set_memory.c   | 16 ++++++++--------
 include/linux/pgtable.h        | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 84 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index ac295ca6c92f..497aaf08ad36 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -227,6 +227,42 @@ static inline int pud_write(pud_t pud)
 	return pud_flags(pud) & _PAGE_RW;
 }
 
+#define p4d_write p4d_write
+static inline int p4d_write(p4d_t p4d)
+{
+	return p4d_flags(p4d) & _PAGE_RW;
+}
+
+#define pgd_write pgd_write
+static inline int pgd_write(pgd_t pgd)
+{
+	return pgd_flags(pgd) & _PAGE_RW;
+}
+
+#define pmd_exec pmd_exec
+static inline int pmd_exec(pmd_t pmd)
+{
+	return !(pmd_flags(pmd) & _PAGE_NX);
+}
+
+#define pud_exec pud_exec
+static inline int pud_exec(pud_t pud)
+{
+	return !(pud_flags(pud) & _PAGE_NX);
+}
+
+#define p4d_exec p4d_exec
+static inline int p4d_exec(p4d_t p4d)
+{
+	return !(p4d_flags(p4d) & _PAGE_NX);
+}
+
+#define pgd_exec pgd_exec
+static inline int pgd_exec(pgd_t pgd)
+{
+	return !(pgd_flags(pgd) & _PAGE_NX);
+}
+
 static inline int pte_huge(pte_t pte)
 {
 	return pte_flags(pte) & _PAGE_PSE;
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 328805933d4d..8a1782f5de3e 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -729,8 +729,8 @@ pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
 		return NULL;
 
 	*level = PGTABLE_LEVEL_P4D;
-	*nx |= pgd_flags(*pgd) & _PAGE_NX;
-	*rw &= !!(pgd_flags(*pgd) & _PAGE_RW);
+	*nx |= !pgd_exec(*pgd);
+	*rw &= !!(pgd_write(*pgd));
 
 	p4d = p4d_offset(pgd, address);
 	if (p4d_none(*p4d))
@@ -740,8 +740,8 @@ pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
 		return (pte_t *)p4d;
 
 	*level = PGTABLE_LEVEL_PUD;
-	*nx |= p4d_flags(*p4d) & _PAGE_NX;
-	*rw &= !!(p4d_flags(*p4d) & _PAGE_RW);
+	*nx |= !p4d_exec(*p4d);
+	*rw &= !!(p4d_write(*p4d));
 
 	pud = pud_offset(p4d, address);
 	if (pud_none(*pud))
@@ -751,8 +751,8 @@ pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
 		return (pte_t *)pud;
 
 	*level = PGTABLE_LEVEL_PMD;
-	*nx |= pud_flags(*pud) & _PAGE_NX;
-	*rw &= !!(pud_flags(*pud) & _PAGE_RW);
+	*nx |= !pud_exec(*pud);
+	*rw &= !!(pud_write(*pud));
 
 	pmd = pmd_offset(pud, address);
 	if (pmd_none(*pmd))
@@ -762,8 +762,8 @@ pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
 		return (pte_t *)pmd;
 
 	*level = PGTABLE_LEVEL_PTE;
-	*nx |= pmd_flags(*pmd) & _PAGE_NX;
-	*rw &= !!(pmd_flags(*pmd) & _PAGE_RW);
+	*nx |= !pmd_exec(*pmd);
+	*rw &= !!(pmd_write(*pmd));
 
 	return pte_offset_kernel(pmd, address);
 }
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 3889bc2a1f76..4b42ac5c27d9 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -2105,6 +2105,46 @@ static inline int pud_write(pud_t pud)
 }
 #endif /* pud_write */
 
+#ifndef p4d_write
+static inline int p4d_write(p4d_t p4d)
+{
+	BUG();
+	return 0;
+}
+#endif /* p4d_write */
+
+#ifndef pmd_exec
+static inline int pmd_exec(pmd_t pmd)
+{
+	BUG();
+	return 0;
+}
+#endif /* pmd_exec */
+
+#ifndef pud_exec
+static inline int pud_exec(pud_t pud)
+{
+	BUG();
+	return 0;
+}
+#endif /* pud_exec */
+
+#ifndef p4d_exec
+static inline int p4d_exec(p4d_t p4d)
+{
+	BUG();
+	return 0;
+}
+#endif /* p4d_exec */
+
+#ifndef pgd_exec
+static inline int pgd_exec(pgd_t pgd)
+{
+	BUG();
+	return 0;
+}
+#endif /* pgd_exec */
+
 #if !defined(CONFIG_TRANSPARENT_HUGEPAGE) || \
 	!defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
 static inline int pud_trans_huge(pud_t pud)

-- 
2.53.0


