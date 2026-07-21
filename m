Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0DBC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9b3WZj5jHk25VpgAWHevsEUQUuyXouMqSw6FbCmRVA=; b=BxTfU7YtKzVANJ15OG80EDBqGW
	l3vcFZGiMCSzB2bbNoe9tALCozrYYSTO97HCvkjnLZmlG+ybCKa2eh0o+NxxmgP3akLOe3qgGmvCH
	UAikLJgKJUpnhsITg11ClCA3lj8dzq+iOOr4RLiDRJRKmwxkhMTgusefwRVwTClxcaXrMRetSPYHP
	ir9zn1rz1PC5Ov0v+iyoaeiOhEy1EFKPUy/cFzSDvGrit4y3N7s+d9th/OqIfs0S9gCgVhgyYhfoO
	XB5wOZfmu44M7NnB83wIgt4affIyoWdUCc6Ur15s2ekaB+JvdBNiQtbVikas77okdYJCCS1eoN5hu
	0oQwMdtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDHh-00000009uxQ-3xlo;
	Tue, 21 Jul 2026 16:25:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDHg-00000009uts-0DV4;
	Tue, 21 Jul 2026 16:25:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BAAEC4065C;
	Tue, 21 Jul 2026 16:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5F81F000E9;
	Tue, 21 Jul 2026 16:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651131;
	bh=J9b3WZj5jHk25VpgAWHevsEUQUuyXouMqSw6FbCmRVA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jx7peZSSKvswuwTjFsyRK77utMba9/sCwesbc/K9+fo06K9IvmzAvdGGlzz4Bu3fc
	 kRKEjA55dkExDBgUR3eWzuAP3KFhmC65OnYn0JX6Rb63B85Mk2fdWPFYHZRUgZpMZL
	 zlLlj7XeXkjC9+s1pM1Hed8XCHEw7tNfTI+8Lj8iqVnt2FdBx9up4mA01kHjw6PzSt
	 KPGhKTDmAHLsnzBYf3G3vI2ctycqdIWtI0Cq6KpqDs0IOEVdaCU0ES2h6ZWx4uoHTU
	 g5XHwTUTgLxS/p9LTyr6WLkzgsMqv5j6Mn3bnGDGFFNsOfxexutYnMPmPPdK+Fjq0d
	 PacCIqlk4dtdA==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:39 +0300
Subject: [PATCH RFC 16/18] riscv: make set_direct_map_*_noflush actually
 noflush
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-16-2c1fc62306b3@kernel.org>
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

riscv versions of set_direct_memory_{default,invalid,valid}_noflush call
core CPA API (change_page_attr_set_clr()) that actually flush TLB after
the page table update.

This was also the case before the conversion of riscv to use generic CPA
core, riscv::__set_memory() always flushed TLBs, even when it was called
from _noflush API variants.

Switch the _noflush APIs to use __change_page_attr_set_clr() that does
not flush TLB unless there was an error or there was a split of higher
level page tables.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/riscv/mm/pageattr.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 677f42a6750d..66a20fc3d805 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -199,32 +199,46 @@ int set_memory_nx(unsigned long addr, int numpages)
 int set_direct_map_invalid_noflush(struct page *page)
 {
 	unsigned long start = (unsigned long)page_address(page);
-
-	return change_page_attr_clear(&start, 1, __pgprot(_PAGE_PRESENT), 0);
+	struct cpa_data cpa = { .vaddr = &start,
+				.pgd = NULL,
+				.numpages = 1,
+				.mask_set = __pgprot(0),
+				.mask_clr = __pgprot(_PAGE_PRESENT),
+				.flags = CPA_NO_CHECK_ALIAS };
+
+	return __change_page_attr_set_clr(&cpa, 1);
 }
 
 int set_direct_map_default_noflush(struct page *page)
 {
 	unsigned long start = (unsigned long)page_address(page);
-
-	return change_page_attr_set_clr(&start, 1, PAGE_KERNEL,
-					__pgprot(_PAGE_EXEC), 0, 0, NULL);
+	struct cpa_data cpa = { .vaddr = &start,
+				.pgd = NULL,
+				.numpages = 1,
+				.mask_set = PAGE_KERNEL,
+				.mask_clr = __pgprot(_PAGE_EXEC),
+				.flags = CPA_NO_CHECK_ALIAS };
+
+	return __change_page_attr_set_clr(&cpa, 1);
 }
 
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 {
 	unsigned long start = (unsigned long)page_address(page);
-	pgprot_t set, clear;
+	struct cpa_data cpa = { .vaddr = &start,
+				.pgd = NULL,
+				.numpages = nr,
+				.flags = CPA_NO_CHECK_ALIAS };
 
 	if (valid) {
-		set = PAGE_KERNEL;
-		clear = __pgprot(_PAGE_EXEC);
+		cpa.mask_set = PAGE_KERNEL;
+		cpa.mask_clr = __pgprot(_PAGE_EXEC);
 	} else {
-		set = __pgprot(0);
-		clear = __pgprot(_PAGE_PRESENT);
+		cpa.mask_set = __pgprot(0);
+		cpa.mask_clr = __pgprot(_PAGE_PRESENT);
 	}
 
-	return change_page_attr_set_clr(&start, nr, set, clear, 0, 0, NULL);
+	return __change_page_attr_set_clr(&cpa, 1);
 }
 
 #ifdef CONFIG_DEBUG_PAGEALLOC

-- 
2.53.0


