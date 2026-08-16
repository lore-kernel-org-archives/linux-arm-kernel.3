Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0ECC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 11:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1IKL46JfxrcOqE7Q7MesTGEIIR01Ean6sDupkVMBBfo=; b=aICKnh5TKQ0n+yI3nyoyLvGa0Y
	skXZ0Qo5vHjUlwYEMoMQiRGwc9ReB4jRj9jSebsuZAGPS4mXXUgRLet8yRVBI5ljAkloB8VrPIuq+
	44hQj3VMFq70XuSJjTkp8+hL/QY1V1E2bAc9wfZhThoXpglVSyQJPkDK7T6Kw20+nVAhOT5UQ7TIq
	Lwieso297YTKxM3Sd/1lS/JMLoNduoNjfZX3ZLt7ElJvISmc4PZXe8qj4lcbo0CbzymkCq0Hm6ATl
	LRL5qkWFSBgHsd1Bq2NlT1VwI5XVjuFoAKHiGUnb85b128Iw6ayjgRVsmMet5/MP490BdWkpJSdAN
	qI+ussoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvYbT-00000004g8B-3NQL;
	Sun, 16 Aug 2026 11:00:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvYbS-00000004g7I-3gzV;
	Sun, 16 Aug 2026 11:00:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 51F45600BC;
	Sun, 16 Aug 2026 11:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4551F00A3D;
	Sun, 16 Aug 2026 11:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786878034;
	bh=1IKL46JfxrcOqE7Q7MesTGEIIR01Ean6sDupkVMBBfo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=P9+LCIokkZwCxlCXxUfmKZtBV+2ZFYeAUSRtldsh+4ZQEIUC27Nsf54Liq5GxaM39
	 YfPY+8QsJ7oU1AkJ98+FaB1liInriqrdmg6QGU8AR80VSGfFnkXvRwRAfZZDI/Jomu
	 kIwM1dSZLvEQt5yrvnxc+jGnvV4ktJCRFXK5ZYNpGsarsXvQygnusynQSHHUvXQuvr
	 u2HkLuP3TYOjS8eUNjbzEQoagVGwjjUt1C3gymqNh2BABKqw/jb0fWEDz2ZC6l8jCO
	 V5y4YFqIBqtBOeZJhmgcCc4QKD+EqboPW166BiKASPMgifH3tNoZdWwW83tBvwr6c8
	 hnja77sN6qqDA==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Sun, 16 Aug 2026 13:59:29 +0300
Subject: [PATCH 6/6] Revert "arch: introduce
 set_direct_map_valid_noflush()"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-execmem-set-vm-perms-v0-2-v1-6-90944a3ad43f@kernel.org>
References: <20260816-execmem-set-vm-perms-v0-2-v1-0-90944a3ad43f@kernel.org>
In-Reply-To: <20260816-execmem-set-vm-perms-v0-2-v1-0-90944a3ad43f@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: =?utf-8?q?Adrian_Barna=C5=9B?= <abarnas@google.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Len Brown <lenb@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Ryan Roberts <ryan.roberts@arm.com>, Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Gleixner <tglx@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, 
 Will Deacon <will@kernel.org>, x86@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-pm@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 loongarch@lists.linux.dev
X-Mailer: b4 0.17-dev
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

Commit 0c6378a71574 ("arch: introduce set_direct_map_valid_noflush()")
added set_direct_map_valid_noflush() to allow updating the direct map
for a physically contiguous range in execmem.

As Brendan recently pointed out [1], this API is confusing because on
arm64 it means that is sets VALID bit in ptes, while on other
architectures it is an analog of set_direct_map_default_noflush().

The only user of set_direct_map_valid_noflush() was execmem's ROX cache
freeing path and it was switched to utilize VM_FLUSH_RESET_PERMS for
resetting permissions of the direct map alias.

With the last user gone and with set_direct_map_{invalid,default}_noflush()
accepting number of pages as a parameter, set_direct_map_valid_noflush()
become a copy of set_memory_valid() on arm64 and a duplicate of
set_direct_map_{invalid,default}_noflush() on other architecture, it is
safe to remove set_direct_map_valid_noflush().

Also drop a stale comment in arm64::__kernel_map_pages() that Linus
bothered to add when merging changes containing set_direct_map_valid_noflush()
to his tree.

This reverts commit 0c6378a71574daa6cd1534ad42a956e3262756c7.

[1] https://lore.kernel.org/all/DJ69RCVRBO0Y.3JCYSW50IC4RC@linux.dev

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/arm64/include/asm/set_memory.h     |  1 -
 arch/arm64/mm/pageattr.c                | 16 ----------------
 arch/loongarch/include/asm/set_memory.h |  1 -
 arch/loongarch/mm/pageattr.c            | 19 -------------------
 arch/riscv/include/asm/set_memory.h     |  1 -
 arch/riscv/mm/pageattr.c                | 15 ---------------
 arch/s390/include/asm/set_memory.h      |  1 -
 arch/s390/mm/pageattr.c                 | 12 ------------
 arch/x86/include/asm/set_memory.h       |  1 -
 arch/x86/mm/pat/set_memory.c            |  8 --------
 include/linux/set_memory.h              |  6 ------
 11 files changed, 81 deletions(-)

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index b07fd4e026ea..0091ba12200e 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -13,7 +13,6 @@ int set_memory_valid(unsigned long addr, int numpages, int enable);
 
 int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
 int set_direct_map_default_noflush(struct page *page, unsigned int numpages);
-int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
 bool kernel_page_present(struct page *page);
 
 int set_memory_encrypted(unsigned long addr, int numpages);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index db8d60a84d14..132938b32eb1 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -355,23 +355,7 @@ int realm_register_memory_enc_ops(void)
 	return arm64_mem_crypt_ops_register(&realm_crypt_ops);
 }
 
-int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
-{
-	unsigned long addr = (unsigned long)page_address(page);
-
-	if (!can_set_direct_map())
-		return 0;
-
-	return set_memory_valid(addr, nr, valid);
-}
-
 #ifdef CONFIG_DEBUG_PAGEALLOC
-/*
- * This is - apart from the return value - doing the same
- * thing as the new set_direct_map_valid_noflush() function.
- *
- * Unify? Explain the conceptual differences?
- */
 void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
 	if (!can_set_direct_map())
diff --git a/arch/loongarch/include/asm/set_memory.h b/arch/loongarch/include/asm/set_memory.h
index 563aab92896e..4bb01172fbc2 100644
--- a/arch/loongarch/include/asm/set_memory.h
+++ b/arch/loongarch/include/asm/set_memory.h
@@ -17,6 +17,5 @@ int set_memory_rw(unsigned long addr, int numpages);
 bool kernel_page_present(struct page *page);
 int set_direct_map_default_noflush(struct page *page, unsigned int nr);
 int set_direct_map_invalid_noflush(struct page *page, unsigned int nr);
-int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
 
 #endif /* _ASM_LOONGARCH_SET_MEMORY_H */
diff --git a/arch/loongarch/mm/pageattr.c b/arch/loongarch/mm/pageattr.c
index 43ad2a104f19..a7dcff40f759 100644
--- a/arch/loongarch/mm/pageattr.c
+++ b/arch/loongarch/mm/pageattr.c
@@ -217,22 +217,3 @@ int set_direct_map_invalid_noflush(struct page *page, unsigned int nr)
 
 	return __set_memory(addr, nr, __pgprot(0), __pgprot(_PAGE_PRESENT | _PAGE_VALID));
 }
-
-int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
-{
-	unsigned long addr = (unsigned long)page_address(page);
-	pgprot_t set, clear;
-
-	if (addr < vm_map_base)
-		return 0;
-
-	if (valid) {
-		set = PAGE_KERNEL;
-		clear = __pgprot(0);
-	} else {
-		set = __pgprot(0);
-		clear = __pgprot(_PAGE_PRESENT | _PAGE_VALID);
-	}
-
-	return __set_memory(addr, nr, set, clear);
-}
diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index db1d0ed82b69..e9f9960c1947 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -42,7 +42,6 @@ static inline int set_kernel_memory(char *startp, char *endp,
 
 int set_direct_map_invalid_noflush(struct page *page, unsigned int nr);
 int set_direct_map_default_noflush(struct page *page, unsigned int nr);
-int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
 bool kernel_page_present(struct page *page);
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 20ef95b1d0c3..5b3cf326455d 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -386,21 +386,6 @@ int set_direct_map_default_noflush(struct page *page, unsigned int nr)
 			    PAGE_KERNEL, __pgprot(_PAGE_EXEC));
 }
 
-int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
-{
-	pgprot_t set, clear;
-
-	if (valid) {
-		set = PAGE_KERNEL;
-		clear = __pgprot(_PAGE_EXEC);
-	} else {
-		set = __pgprot(0);
-		clear = __pgprot(_PAGE_PRESENT);
-	}
-
-	return __set_memory((unsigned long)page_address(page), nr, set, clear);
-}
-
 #ifdef CONFIG_DEBUG_PAGEALLOC
 static int debug_pagealloc_set_page(pte_t *pte, unsigned long addr, void *data)
 {
diff --git a/arch/s390/include/asm/set_memory.h b/arch/s390/include/asm/set_memory.h
index 6b0aa9147ed8..e3562bf0c1aa 100644
--- a/arch/s390/include/asm/set_memory.h
+++ b/arch/s390/include/asm/set_memory.h
@@ -62,7 +62,6 @@ __SET_MEMORY_FUNC(set_memory_4k, SET_MEMORY_4K)
 
 int set_direct_map_invalid_noflush(struct page *page, unsigned int nr);
 int set_direct_map_default_noflush(struct page *page, unsigned int nr);
-int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
 bool kernel_page_present(struct page *page);
 
 #endif
diff --git a/arch/s390/mm/pageattr.c b/arch/s390/mm/pageattr.c
index 02d992b251cb..f46a666bc5c7 100644
--- a/arch/s390/mm/pageattr.c
+++ b/arch/s390/mm/pageattr.c
@@ -397,18 +397,6 @@ int set_direct_map_default_noflush(struct page *page, unsigned int nr)
 	return __set_memory((unsigned long)page_to_virt(page), nr, SET_MEMORY_DEF);
 }
 
-int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
-{
-	unsigned long flags;
-
-	if (valid)
-		flags = SET_MEMORY_DEF;
-	else
-		flags = SET_MEMORY_INV;
-
-	return __set_memory((unsigned long)page_to_virt(page), nr, flags);
-}
-
 bool kernel_page_present(struct page *page)
 {
 	unsigned long addr;
diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
index 0c4235d159f4..39271a5ea925 100644
--- a/arch/x86/include/asm/set_memory.h
+++ b/arch/x86/include/asm/set_memory.h
@@ -88,7 +88,6 @@ int set_pages_rw(struct page *page, int numpages);
 
 int set_direct_map_invalid_noflush(struct page *page, unsigned int nr);
 int set_direct_map_default_noflush(struct page *page, unsigned int nr);
-int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
 bool kernel_page_present(struct page *page);
 
 extern int kernel_set_to_readonly;
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 9022354e26e9..a6b2912a4837 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2683,14 +2683,6 @@ int set_direct_map_default_noflush(struct page *page, unsigned int nr)
 	return __set_pages_p(page, nr);
 }
 
-int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
-{
-	if (valid)
-		return __set_pages_p(page, nr);
-
-	return __set_pages_np(page, nr);
-}
-
 #ifdef CONFIG_DEBUG_PAGEALLOC
 void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 0b77f1d7d8b9..3fe293cfed8c 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -36,12 +36,6 @@ static inline int set_direct_map_default_noflush(struct page *page,
 	return 0;
 }
 
-static inline int set_direct_map_valid_noflush(struct page *page,
-					       unsigned nr, bool valid)
-{
-	return 0;
-}
-
 static inline bool kernel_page_present(struct page *page)
 {
 	return true;

-- 
2.53.0


