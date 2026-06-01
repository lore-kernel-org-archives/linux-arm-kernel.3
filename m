Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD2FCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 18:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=453LPwlZ8/0XDh2NTel4qFyIHs7frDqHpyzC5sHiGyg=; b=RgOEXEhnlZxg2UxcDU8OSQRq8Y
	yfM2e8GkN0VBF5OiRIeqQI42NdjmZjcM8kXFemEooObp6UeL//OhjvTro20bt17d375pQp1eudAf+
	CbmVUGois3tb3kbjBfKaURp3cnUwUJS6Sc6L+g/UUMfa0dbHFaKcETIxtGfZC4sUrzJ7t2KaL4yi4
	FWZtwSrj5Rs9jJiVLyt8qbqLy9VpZHHMNV9amTJ3p0T7bo4lUAyScqSe4EyS1xy771ccLEp4MbVp+
	jKqn9qh4agnBmmcdoIcjBhc0HGUach9GQAT/p+bkjq/iuhA+iDNBKcHKxGHkA2TFhs3Ik123sH42p
	RFK3eYdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU7W1-0000000Bfdj-0wSR;
	Mon, 01 Jun 2026 18:37:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU7Vz-0000000BfdZ-0yoX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 18:37:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 77D34600AA;
	Mon,  1 Jun 2026 18:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F091C1F00893;
	Mon,  1 Jun 2026 18:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780339050;
	bh=453LPwlZ8/0XDh2NTel4qFyIHs7frDqHpyzC5sHiGyg=;
	h=From:To:Cc:Subject:Date;
	b=AeGFnrrsK0E5ty6ct0u3gW1VReUmbexgBW8yoXoczN3DxBHadkBk6Lt6cLL27yoji
	 TD1au2oJ5rgsPB625hifuG8gVWIBPcbCDrzp1n8n35hCsjzKOaTyqRT0ItaNZwMlAY
	 f/73X4KLIu4ok1+/RZGsXdm2QoT0qZ1jwuYRLF3o+3Wpdb+EV34DBTnALMJwS+qNyI
	 cTCahpNQQz9nE6Yvd6nY5uBKHMvFkDjtmLAdrYfLYnJUSiI+40RGegaBz8hCYfPYl7
	 u8DuXmy6UZwlxyhDHuYg+BXR8YRybd3v9alFTqrTU68jWbLzX9R+PwvzjFdY7RZCD2
	 CzjYu29f8VVLA==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	ast@kernel.org,
	andrii@kernel.org,
	daniel@iogearbox.net,
	martin.lau@linux.dev,
	memxor@gmail.com
Cc: peterz@infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	rppt@kernel.org,
	emil@etsalapatis.com,
	sched-ext@lists.linux.dev,
	bpf@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH bpf-next] bpf: Replace scratch PTE atomically when allocating arena pages
Date: Mon,  1 Jun 2026 08:37:28 -1000
Message-ID: <20260601183728.1800490-1-tj@kernel.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

apply_range_set_cb() maps the pages for a new arena allocation and returned
-EBUSY when the target PTE was already populated. Kernel-fault recovery
leaves the per-arena scratch page in unallocated arena PTEs, so a later
bpf_arena_alloc_pages() over such a page hits that -EBUSY, and every
subsequent allocation of it fails the same way. Allocation must install the
real page over scratch instead.

Overwriting the scratch PTE in place is a valid->valid change, which arm64
forbids without break-before-make. Route through an invalid entry instead:
ptep_try_set() fills only a none slot, so the PTE goes scratch->none->page.
On finding scratch, clear it and flush_tlb_before_set() before retrying. The
new flush_tlb_before_set() is a no-op except on arches like arm64 that need
the break-before-make TLB invalidate. The loop also copes with a concurrent
fault re-scratching the slot.

Arches without ptep_try_set() never install the scratch page, so keep the
must-be-empty check and set_pte_at() for them.

Fixes: dc11a4dba246 ("bpf: Recover arena kernel faults with scratch page")
Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: David Hildenbrand <david@kernel.org>
---

 arch/arm64/include/asm/pgtable.h |   11 +++++++++++
 include/linux/pgtable.h          |   18 ++++++++++++++++++
 kernel/bpf/arena.c               |   38 +++++++++++++++++++++++++++++++++-----
 3 files changed, 62 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 984f050..3ce0f2a 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1842,6 +1842,17 @@ static inline bool ptep_try_set(pte_t *ptep, pte_t new_pte)
 }
 #define ptep_try_set ptep_try_set
 
+/*
+ * arm64 mandates break-before-make: a cleared kernel PTE must have its TLB
+ * invalidated before a different page is installed in its place. The broadcast
+ * TLBI is an instruction, not an IPI, so this is safe with interrupts disabled.
+ */
+static inline void flush_tlb_before_set(unsigned long addr)
+{
+	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+}
+#define flush_tlb_before_set flush_tlb_before_set
+
 #define test_and_clear_young_ptes test_and_clear_young_ptes
 static inline bool test_and_clear_young_ptes(struct vm_area_struct *vma,
 		unsigned long addr, pte_t *ptep, unsigned int nr)
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index b5739bb..4c6c408 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1061,6 +1061,24 @@ static inline bool ptep_try_set(pte_t *ptep, pte_t new_pte)
 }
 #endif
 
+#ifndef flush_tlb_before_set
+/**
+ * flush_tlb_before_set - invalidate a kernel PTE's TLB before re-setting it
+ * @addr: kernel virtual address whose PTE was just cleared
+ *
+ * Some architectures (e.g. arm64) do not allow a live page-table entry to be
+ * repointed at a different page in one step. The old entry must first be made
+ * invalid and its translation flushed from every TLB, and only then may the new
+ * entry be written.
+ *
+ * This is only for the lockless atomic kernel-PTE installers (ptep_try_set()).
+ * It must be callable with interrupts disabled.
+ */
+static inline void flush_tlb_before_set(unsigned long addr)
+{
+}
+#endif
+
 #ifndef wrprotect_ptes
 /**
  * wrprotect_ptes - Write-protect PTEs that map consecutive pages of the same
diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
index 1727503..b6ac5a9 100644
--- a/kernel/bpf/arena.c
+++ b/kernel/bpf/arena.c
@@ -142,6 +142,7 @@ static long compute_pgoff(struct bpf_arena *arena, long uaddr)
 
 struct apply_range_data {
 	struct page **pages;
+	struct page *scratch_page;
 	int i;
 };
 
@@ -154,19 +155,44 @@ static int apply_range_set_cb(pte_t *pte, unsigned long addr, void *data)
 {
 	struct apply_range_data *d = data;
 	struct page *page;
+	pte_t pteval;
 
 	if (!data)
 		return 0;
-	/* sanity check */
-	if (unlikely(!pte_none(ptep_get(pte))))
-		return -EBUSY;
 
 	page = d->pages[d->i];
 	/* paranoia, similar to vmap_pages_pte_range() */
 	if (WARN_ON_ONCE(!pfn_valid(page_to_pfn(page))))
 		return -EINVAL;
 
-	set_pte_at(&init_mm, addr, pte, mk_pte(page, PAGE_KERNEL));
+	pteval = mk_pte(page, PAGE_KERNEL);
+#ifdef ptep_try_set
+	/*
+	 * Kernel-fault recovery may have installed the scratch page here, and
+	 * some architectures (arm64) prohibit valid->valid PTE transitions.
+	 * Install atomically into a none slot. If scratch is present, clear it
+	 * and flush_tlb_before_set() (break-before-make) before retrying.
+	 */
+	while (!ptep_try_set(pte, pteval)) {
+		pte_t old = ptep_get(pte);
+
+		if (pte_none(old))
+			continue;
+		if (WARN_ON_ONCE(pte_page(old) != d->scratch_page))
+			return -EBUSY;
+		ptep_get_and_clear(&init_mm, addr, pte);
+		flush_tlb_before_set(addr);
+	}
+#else
+	/*
+	 * Without ptep_try_set() there is no atomic installer, but such arches
+	 * also do not wire up bpf_arena_handle_page_fault(), so no scratch page
+	 * is ever installed and the slot is always none here.
+	 */
+	if (unlikely(!pte_none(ptep_get(pte))))
+		return -EBUSY;
+	set_pte_at(&init_mm, addr, pte, pteval);
+#endif
 	d->i++;
 	return 0;
 }
@@ -475,7 +501,8 @@ static vm_fault_t arena_vm_fault(struct vm_fault *vmf)
 	if (ret)
 		goto out_sigsegv_memcg;
 
-	struct apply_range_data data = { .pages = &page, .i = 0 };
+	struct apply_range_data data = { .pages = &page, .i = 0,
+					 .scratch_page = arena->scratch_page };
 	/* Account into memcg of the process that created bpf_arena */
 	ret = bpf_map_alloc_pages(map, NUMA_NO_NODE, 1, &page);
 	if (ret) {
@@ -665,6 +692,7 @@ static long arena_alloc_pages(struct bpf_arena *arena, long uaddr, long page_cnt
 		return 0;
 	}
 	data.pages = pages;
+	data.scratch_page = arena->scratch_page;
 
 	if (raw_res_spin_lock_irqsave(&arena->spinlock, flags))
 		goto out_free_pages;

