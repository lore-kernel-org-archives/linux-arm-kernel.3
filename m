Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3F3C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 23:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/howEIvgndH8o3pTfe48AeTP4vfYaSSQLtkWDw5tX8=; b=0DjpmXNNr7+8huf15Akot4q69L
	/XztRrIiyLGdgovSdIXfQA/ySLe96rIkqNN5X2laWDAQjWcxAoa2sIoYN7s6PgjfBm+yM3tPM8k0o
	YqyP/1HgkgLE0Md7vqbKMhpYOZOQThF18Eva0FwMBIb3WMcWkissc+PkBEsZ1B0f1g0Bf94cYRyN6
	Ndn2m5LlsNW0CbLp0QZcr9CJon8hw4VISCH/S21jDdTv8iozUtQfaZ6LrkVoP3dE+mxjDXvzlTrgT
	SMCTBDGjnz0D3GSzYpIHTbFVVCbyiLfcBITsG+8Q3FA0uOPsNRS2QWZ8bjuGb1Ys1NzJ9ntN3xyz9
	FKabmO7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkVi4-00000000oJs-0XLt;
	Thu, 16 Jul 2026 23:41:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkVi2-00000000oJk-2HD6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 23:41:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2478740A64;
	Thu, 16 Jul 2026 23:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05ED01F000E9;
	Thu, 16 Jul 2026 23:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784245300;
	bh=S/howEIvgndH8o3pTfe48AeTP4vfYaSSQLtkWDw5tX8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GWrE81XllWQl5SeoAjAivl6b6wYYesCrb3N/mzexAllJ4UnlAwuaaRX7GYBfNhYIr
	 rUzjVX8SFgudmVpquJg4CpGAaGpYbm4V4SpJVtnrB0p3D/HJCveyAZSGNKLNPTz3Qn
	 +RaTiHE7dRlrCVuMrmUyMzGB6SBYcoddUR9tNrCE=
Date: Thu, 16 Jul 2026 16:41:39 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt
 <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Uladzislau
 Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Dev Jain
 <dev.jain@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, David Carlier
 <devnexen@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Denis V. Lunev"
 <den@virtuozzo.com>, stable@vger.kernel.org,
 syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
Subject: Re: [PATCH mm-hotfixes v4 0/4] mm: fix UAF caused by race between
 ptdump and vmap pgtable freeing
Message-Id: <20260716164139.0b447152db49db857cc73037@linux-foundation.org>
In-Reply-To: <20260716-series-vmap-race-fix-v4-0-8c108c4317df@kernel.org>
References: <20260716-series-vmap-race-fix-v4-0-8c108c4317df@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 16 Jul 2026 22:31:11 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> Kernel page table walkers fall into two broad categories - those ranges
> where no exclusion is required via walk_kernel_page_table_range_lockless()
> and those where exclusion is required via walk_kernel_page_table_range()
> or walk_page_range_debug().
> 
> ...
> 
> This series works around this by #ifndef CONFIG_ARM64'ing the mmap read
> lock in vmap logic, then partially reverting commit fa93b45fd397 ("arm64:
> Enable vmalloc-huge with ptdump"), keeping the enablement of huge vmap
> support, and removing the ifdeffery with the partial revert patch.

Thanks, I've updated mm.git's mm-hotfixes-unstable branch to this
version.

> v4:
> * Rebased on latest master of Linus's tree.
> * Accumulated tags, thanks everybody!
> * Updated commit messages further as per Kiryl.
> * Took the mmap write lock across the whole CPA operation as per Will.

Here's how v4 altered mm.git:


 arch/x86/mm/pat/set_memory.c |   25 +++++++++++++++----------
 include/linux/mmap_lock.h    |    2 ++
 mm/vmalloc.c                 |    8 ++++----
 3 files changed, 21 insertions(+), 14 deletions(-)

--- a/arch/x86/mm/pat/set_memory.c~b
+++ a/arch/x86/mm/pat/set_memory.c
@@ -411,7 +411,7 @@ static void __cpa_flush_tlb(void *data)
 
 static int collapse_large_pages(unsigned long addr, struct list_head *pgtables);
 
-static void cpa_collapse_large_pages(struct cpa_data *cpa)
+static void __cpa_collapse_large_pages(struct cpa_data *cpa)
 {
 	unsigned long start, addr, end;
 	struct ptdesc *ptdesc, *tmp;
@@ -437,17 +437,22 @@ static void cpa_collapse_large_pages(str
 
 	flush_tlb_all();
 
+	list_for_each_entry_safe(ptdesc, tmp, &pgtables, pt_list) {
+		list_del(&ptdesc->pt_list);
+		pagetable_free(ptdesc);
+	}
+}
+
+static void cpa_collapse_large_pages(struct cpa_data *cpa)
+{
 	/*
-	 * ptdump might read these page tables, so avoid a use-after-free by
-	 * acquiring the mmap read lock on init_mm (ptdump acquires the mmap
-	 * write lock).
+	 * Take the mmap write lock on init_mm to:
+	 * - Avoid a use-after-free if raced by ptdump (which takes its own
+	 *   write lock on init_mm).
+	 * - Serialise concurrent CPA walkers.
 	 */
-	scoped_guard(mmap_read_lock, &init_mm) {
-		list_for_each_entry_safe(ptdesc, tmp, &pgtables, pt_list) {
-			list_del(&ptdesc->pt_list);
-			pagetable_free(ptdesc);
-		}
-	}
+	scoped_guard(mmap_write_lock, &init_mm)
+		__cpa_collapse_large_pages(cpa);
 }
 
 static void cpa_flush(struct cpa_data *cpa, int cache)
--- a/include/linux/mmap_lock.h~b
+++ a/include/linux/mmap_lock.h
@@ -621,6 +621,8 @@ static inline void mmap_read_unlock(stru
 
 DEFINE_GUARD(mmap_read_lock, struct mm_struct *,
 	     mmap_read_lock(_T), mmap_read_unlock(_T))
+DEFINE_GUARD(mmap_write_lock, struct mm_struct *,
+	     mmap_write_lock(_T), mmap_write_unlock(_T))
 DEFINE_GUARD_COND(mmap_read_lock, _try, mmap_read_trylock(_T))
 
 static inline void mmap_read_unlock_non_owner(struct mm_struct *mm)
--- a/mm/vmalloc.c~b
+++ a/mm/vmalloc.c
@@ -163,11 +163,11 @@ static int vmap_try_huge_pmd(pmd_t *pmd,
 		return pmd_set_huge(pmd, phys_addr, prot);
 
 	/*
-	 * Acquire the mmap read lock to exclude ptdump, which walks kernel
-	 * page tables it does not own under the mmap write lock.
+	 * Acquire the mmap read lock to exclude ptdump, which walks
+	 * kernel page tables it does not own under the mmap write lock.
 	 *
-	 * Concurrent read lock holders are safe: each exclusively owns the
-	 * range it operates on and cannot reach this page table.
+	 * Concurrent read lock holders are safe: each exclusively owns
+	 * the range it operates on and cannot reach this page table.
 	 */
 	scoped_cond_guard(mmap_read_lock_try, return 0, &init_mm) {
 		if (!pmd_free_pte_page(pmd, addr))
_


