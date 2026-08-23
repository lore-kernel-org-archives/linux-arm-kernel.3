Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBC0C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 11:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VP6xAszPN9d5Ab+tWR5O9C7cLz2aPGLpAHH/Gr7UO8o=; b=U7JCoW48u+Q5xvaLjXgbXWB3Nn
	barpWlWEMm8AUZXj6mPguaHSqhQi4J55j36WvRIkW8LycODgLZ3rYxEl8rA671ZEUNhANpgwBGk2z
	a5h3A9Af4WQno8bqSWHz+yaKWsqmi350GSPR4PQn+UHI1Ogw92YCnIt02K+hbTWGbRmmOkafq3zz8
	uKNmMPD12WJjgq6bdva/6b0K19ZhGDxgCA3Js/FBiYG/835nVLmywCqi1MwOruQTJdOwF+5o46vTY
	+Y2bNkYD+9ccA2N8c35nbKIlxwQRyuG7GV0P+1LKhfA64joIaVbTEuTV0BicBvde3CArzQu0Sa1FD
	fG5qf46w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6fS-0000000FIUC-2wnE;
	Sun, 23 Aug 2026 11:47:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6fR-0000000FISd-0pXZ;
	Sun, 23 Aug 2026 11:47:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E9CDF40103;
	Sun, 23 Aug 2026 11:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC6E1F00A3A;
	Sun, 23 Aug 2026 11:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787485632;
	bh=VP6xAszPN9d5Ab+tWR5O9C7cLz2aPGLpAHH/Gr7UO8o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=H+w987WXJaPHn2bT6gKuUd72cuh1y13kfP506djkCA0zXRW/jORubuL195QaKVqmG
	 KuCmgCTHchPs/NniDr3HKwZqjXGQs3pex3kFQlGOv8/qmIVpaZRNERU7Dq5clxtTL1
	 g55BGIwhPam9+5AxnN7wlrCC/hP1Zp4Tw77b4/3dE1OxfgpIsQHjcEK9GPfawCOMs6
	 qwH2PXIXAxF94xauBdmZSyzpxHD+65Ap0G9d9F2i4cHYgdYz/i94AWYtOwIQxroq4d
	 id+esyyJnOy+p55d3eNo+FGuBcxpb+1iG6SOZe/vDkAASWckBuVJabv9IoLRGgBvwy
	 zoNlMXUs2wT7Q==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Sun, 23 Aug 2026 14:46:16 +0300
Subject: [PATCH v2 5/6] mm/execmem: use VM_FLUSH_RESET_PERMS for ROX cache
 allocations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-execmem-set-vm-perms-v0-2-v2-5-b013a37d84b3@kernel.org>
References: <20260823-execmem-set-vm-perms-v0-2-v2-0-b013a37d84b3@kernel.org>
In-Reply-To: <20260823-execmem-set-vm-perms-v0-2-v2-0-b013a37d84b3@kernel.org>
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

Initially execmem completely removed direct map alias for the memory
allocated for the ROX cache in PMD_SIZE chunks. When that memory was
freed, its direct map was restored also in PMD_SIZE chunks to avoid
fragmentation of the direct map caused by vmalloc::vm_reset_perms().

This required execmem to implement the wrappers for set_direct_map APIs for
proper sequencing of removal and restoration of the direct map aliases.

Since then x86's CPA gained support for collapsing the direct map page
tables for ROX pages and execmem switched from removing ROX caches from the
direct map to making them ROX there, so execmem only needs to update direct
map alias permissions when freeing the ROX cache memory.

vmalloc already handles those updates for areas with VM_FLUSH_RESET_PERMS
set and vmalloc::vm_reset_perms() does not force split of the direct map
for PMD_SIZE chunks.

Make all execmem vmalloc allocations use VM_FLUSH_RESET_PERMS and remove
custom wrappers for set_direct_map APIs.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/execmem.c | 42 +++++++-----------------------------------
 1 file changed, 7 insertions(+), 35 deletions(-)

diff --git a/mm/execmem.c b/mm/execmem.c
index 74a178a87e75..d35f1d0ea54a 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -36,6 +36,7 @@ static void *execmem_vmalloc(struct execmem_range *range, size_t size,
 	unsigned long end = range->end;
 	void *p;
 
+	vm_flags |= VM_FLUSH_RESET_PERMS;
 	if (kasan)
 		vm_flags |= VM_DEFER_KMEMLEAK;
 
@@ -113,28 +114,6 @@ static inline unsigned long mas_range_len(struct ma_state *mas)
 	return mas->last - mas->index + 1;
 }
 
-static int execmem_set_direct_map_valid(struct vm_struct *vm, bool valid)
-{
-	unsigned int nr = (1 << get_vm_area_page_order(vm));
-	unsigned int updated = 0;
-	int err = 0;
-
-	for (int i = 0; i < vm->nr_pages; i += nr) {
-		err = set_direct_map_valid_noflush(vm->pages[i], nr, valid);
-		if (err)
-			goto err_restore;
-		updated += nr;
-	}
-
-	return 0;
-
-err_restore:
-	for (int i = 0; i < updated; i += nr)
-		set_direct_map_valid_noflush(vm->pages[i], nr, !valid);
-
-	return err;
-}
-
 static int execmem_force_rw(void *ptr, size_t size)
 {
 	unsigned int nr = PAGE_ALIGN(size) >> PAGE_SHIFT;
@@ -169,9 +148,6 @@ static void execmem_cache_clean(struct work_struct *work)
 
 		if (IS_ALIGNED(size, PMD_SIZE) &&
 		    IS_ALIGNED(mas.index, PMD_SIZE)) {
-			struct vm_struct *vm = find_vm_area(area);
-
-			execmem_set_direct_map_valid(vm, true);
 			mas_store_gfp(&mas, NULL, GFP_KERNEL);
 			vfree(area);
 		}
@@ -312,18 +288,15 @@ static void *execmem_cache_populate_alloc(struct execmem_range *range, size_t si
 	 */
 	mutex_lock(mutex);
 	err = execmem_cache_add_locked(p, alloc_size, GFP_KERNEL);
-	if (err)
-		goto err_reset_direct_map;
-
-	p = execmem_cache_alloc_locked(range, size);
-
+	if (!err)
+		p = execmem_cache_alloc_locked(range, size);
 	mutex_unlock(mutex);
 
+	if (err)
+		goto err_free_mem;
+
 	return p;
 
-err_reset_direct_map:
-	mutex_unlock(mutex);
-	execmem_set_direct_map_valid(vm, true);
 err_free_mem:
 	vfree(p);
 	return NULL;
@@ -466,7 +439,6 @@ void *execmem_alloc(enum execmem_type type, size_t size)
 {
 	struct execmem_range *range = &execmem_info->ranges[type];
 	bool use_cache = range->flags & EXECMEM_ROX_CACHE;
-	unsigned long vm_flags = VM_FLUSH_RESET_PERMS;
 	pgprot_t pgprot = range->pgprot;
 	void *p = NULL;
 
@@ -475,7 +447,7 @@ void *execmem_alloc(enum execmem_type type, size_t size)
 	if (use_cache)
 		p = execmem_cache_alloc(range, size);
 	else
-		p = execmem_vmalloc(range, size, pgprot, vm_flags);
+		p = execmem_vmalloc(range, size, pgprot, 0);
 
 	return kasan_reset_tag(p);
 }

-- 
2.53.0


