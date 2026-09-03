Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CC8C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9taLyiYqD93JJjaXvNS2H0Tq/XxgRc4w/Y2D/omzLAc=; b=0J8/ZuhEG9tTmXRk6WIVdDeT98
	Q5c8n4NCUUmFIIX4vZWLprBzZaVCRmW7Ji5vPTY4JUTIvHIdWe6VTtl2YG792LQQJYnHk/EsjiTVX
	6gHU6WQFlmdT2mOjpZSjNhNnykKxVFvZ+XrsWhb2pKf/tezVBPLtvVO4jIBmHDZ9FqHZNEpTkRaKQ
	3k/TdYSoLnVxsPqUZTiVCarY7mfLxHykhGoR0GbBjB7OOBtIo1MUOWdg3bmjFqtLuRCRmID84M3K+
	J5AZtTeQXEp3putfYBrJhwMR0EI5hwCrzn9FPkuZT21oNr4aBmq502k9tzGON6pBZG9Hj6ng9XRkQ
	P6r9T+pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23lB-0000000Gwy9-28gz;
	Thu, 03 Sep 2026 09:29:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23lA-0000000GwxH-1hn0;
	Thu, 03 Sep 2026 09:29:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB8D6414B1;
	Thu,  3 Sep 2026 09:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD30A1F00A3D;
	Thu,  3 Sep 2026 09:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788427767;
	bh=9taLyiYqD93JJjaXvNS2H0Tq/XxgRc4w/Y2D/omzLAc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VrdwkTOyGAsb/ezHXc+RSd05q9lbZbkXr7tUSHsqn9+YHwi+EFYdLGxBjm5CEXVMa
	 5auPqef474FyEjKgj8ThRoUCvfHGgYnQrQthDskjPXuoECP/k/VPsudCaoY75xMYPe
	 xtW1Ik2FAt0F+TbQfVXOeFkTvnDfu7oeMBf1BzIBXeP6yqK6YCQrNsfEBrCap0Tjnd
	 AEHtUNOOUJvwzM8VRrjFghlSTKBiJJS98np8SWdOVL7n9OzZ0N5F+VXzsoYuEgNsT0
	 CrJbqG/BJ0ZyOoKN5/1tIx4deMMBTz6zHMCQzDcQyqbkmPUr9RlGTsoj/fbb33i1/Z
	 M4WhiG9yMbmJw==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 03 Sep 2026 12:28:31 +0300
Subject: [PATCH v3 5/6] mm/execmem: use VM_FLUSH_RESET_PERMS for ROX cache
 allocations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-execmem-set-vm-perms-v0-2-v3-5-949b64a9f755@kernel.org>
References: <20260903-execmem-set-vm-perms-v0-2-v3-0-949b64a9f755@kernel.org>
In-Reply-To: <20260903-execmem-set-vm-perms-v0-2-v3-0-949b64a9f755@kernel.org>
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

Set the area permissions with set_vm_flush_reset_perms() when populating
the execmem cache just before flipping the area to ROX.

This way freeing an allocated area on an error path won't incur two
updates of the direct map alias of that area and TLB flushing in
vm_reset_perms().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/execmem.c | 40 +++++++---------------------------------
 1 file changed, 7 insertions(+), 33 deletions(-)

diff --git a/mm/execmem.c b/mm/execmem.c
index 74a178a87e758..ad07cae9ed585 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -113,28 +113,6 @@ static inline unsigned long mas_range_len(struct ma_state *mas)
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
@@ -169,9 +147,6 @@ static void execmem_cache_clean(struct work_struct *work)
 
 		if (IS_ALIGNED(size, PMD_SIZE) &&
 		    IS_ALIGNED(mas.index, PMD_SIZE)) {
-			struct vm_struct *vm = find_vm_area(area);
-
-			execmem_set_direct_map_valid(vm, true);
 			mas_store_gfp(&mas, NULL, GFP_KERNEL);
 			vfree(area);
 		}
@@ -301,6 +276,8 @@ static void *execmem_cache_populate_alloc(struct execmem_range *range, size_t si
 	/* fill memory with instructions that will trap */
 	execmem_fill_trapping_insns(p, alloc_size);
 
+	set_vm_flush_reset_perms(p);
+
 	err = set_memory_rox((unsigned long)p, vm->nr_pages);
 	if (err)
 		goto err_free_mem;
@@ -312,18 +289,15 @@ static void *execmem_cache_populate_alloc(struct execmem_range *range, size_t si
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

-- 
2.53.0


