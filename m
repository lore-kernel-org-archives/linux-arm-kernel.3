Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F978C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 14:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUPgw/7pzLD6N6r0driX00E5pSCpiid8jSWJPmUN/DU=; b=uME8KhRgpR/NrJ95bRO9UDw/Sq
	8bVT7B9muhG1mjb4mvkMlAj3Vv/f5Ri4MONgNqanPK3k6dG6u6LFScr5yjuxXOqrRJxYqrlB0KKMe
	h1SU2cattCE9iEZP2taSTcRrrbSk1lAL7sKHNpZiYnMFykQAjj3PdvqXjL1zgt4wah7frva/7blQl
	DKzGuzWmlkoOTB8ubnAjT/8njks6qJGvuvBzFkqeO16DO7nN6OwhuyH7FoYnugM95ikxv15y27Cxy
	3W04itLxsnHugesHhFmln9bm6lsWpVDEQtdibDmpMNRwWf1PAZy3ve/nqSaLy5MyT5Z/R8jpObIZf
	VjRzrPMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL0Yn-00000000skE-1Sis;
	Fri, 30 May 2025 14:18:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL0MV-00000000qjX-45T9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 14:05:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A52826A4;
	Fri, 30 May 2025 07:05:15 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9729C3F673;
	Fri, 30 May 2025 07:05:26 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-mm@kvack.org
Subject: [RFC PATCH v1 5/6] mm: Avoid calling page allocator while in lazy mmu mode
Date: Fri, 30 May 2025 15:04:43 +0100
Message-ID: <20250530140446.2387131-6-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530140446.2387131-1-ryan.roberts@arm.com>
References: <20250530140446.2387131-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_070532_112908_6CDA4AAA 
X-CRM114-Status: GOOD (  19.67  )
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

Lazy mmu mode applies to the current task and permits pte modifications
to be deferred and updated at a later time in a batch to improve
performance. tlb_next_batch() is called in lazy mmu mode as follows:

zap_pte_range
  arch_enter_lazy_mmu_mode
  do_zap_pte_range
    zap_present_ptes
      zap_present_folio_ptes
        __tlb_remove_folio_pages
          __tlb_remove_folio_pages_size
            tlb_next_batch
  arch_leave_lazy_mmu_mode

tlb_next_batch() may call into the page allocator which is problematic
with CONFIG_DEBUG_PAGEALLOC because debug_pagealloc_[un]map_pages()
calls the arch implementation of __kernel_map_pages() which must modify
the ptes for the linear map.

There are two possibilities at this point:

- If the arch implementation modifies the ptes directly without first
  entering lazy mmu mode, the pte modifications may get deferred until
  the existing lazy mmu mode is exited. This could result in taking
  spurious faults for example.

- If the arch implementation enters a nested lazy mmu mode before
  modification of the ptes (many arches use apply_to_page_range()),
  then the linear map updates will definitely be applied upon leaving
  the inner lazy mmu mode. But because lazy mmu mode does not support
  nesting, the remainder of the outer user is no longer in lazy mmu
  mode and the optimization opportunity is lost.

So let's just ensure that the page allocator is never called from within
lazy mmu mode. Use the new arch_in_lazy_mmu_mode() API to check if we
are in lazy mmu mode, and if so, when calling into the page allocator,
temporarily leave lazy mmu mode.

Given this new API we can also add VM_WARNings to check that we exit
lazy mmu mode when required to ensure the PTEs are actually updated
prior to tlb flushing.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 include/asm-generic/tlb.h |  2 ++
 mm/mmu_gather.c           | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 88a42973fa47..84fb269b78a5 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -469,6 +469,8 @@ tlb_update_vma_flags(struct mmu_gather *tlb, struct vm_area_struct *vma)
 
 static inline void tlb_flush_mmu_tlbonly(struct mmu_gather *tlb)
 {
+	VM_WARN_ON(arch_in_lazy_mmu_mode());
+
 	/*
 	 * Anything calling __tlb_adjust_range() also sets at least one of
 	 * these bits.
diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
index db7ba4a725d6..0bd1e69b048b 100644
--- a/mm/mmu_gather.c
+++ b/mm/mmu_gather.c
@@ -18,6 +18,7 @@
 static bool tlb_next_batch(struct mmu_gather *tlb)
 {
 	struct mmu_gather_batch *batch;
+	bool lazy_mmu;
 
 	/* Limit batching if we have delayed rmaps pending */
 	if (tlb->delayed_rmap && tlb->active != &tlb->local)
@@ -32,7 +33,15 @@ static bool tlb_next_batch(struct mmu_gather *tlb)
 	if (tlb->batch_count == MAX_GATHER_BATCH_COUNT)
 		return false;
 
+	lazy_mmu = arch_in_lazy_mmu_mode();
+	if (lazy_mmu)
+		arch_leave_lazy_mmu_mode();
+
 	batch = (void *)__get_free_page(GFP_NOWAIT | __GFP_NOWARN);
+
+	if (lazy_mmu)
+		arch_enter_lazy_mmu_mode();
+
 	if (!batch)
 		return false;
 
@@ -145,6 +154,8 @@ static void tlb_batch_pages_flush(struct mmu_gather *tlb)
 {
 	struct mmu_gather_batch *batch;
 
+	VM_WARN_ON(arch_in_lazy_mmu_mode());
+
 	for (batch = &tlb->local; batch && batch->nr; batch = batch->next)
 		__tlb_batch_free_encoded_pages(batch);
 	tlb->active = &tlb->local;
@@ -154,6 +165,8 @@ static void tlb_batch_list_free(struct mmu_gather *tlb)
 {
 	struct mmu_gather_batch *batch, *next;
 
+	VM_WARN_ON(arch_in_lazy_mmu_mode());
+
 	for (batch = tlb->local.next; batch; batch = next) {
 		next = batch->next;
 		free_pages((unsigned long)batch, 0);
@@ -363,6 +376,8 @@ void tlb_remove_table(struct mmu_gather *tlb, void *table)
 {
 	struct mmu_table_batch **batch = &tlb->batch;
 
+	VM_WARN_ON(arch_in_lazy_mmu_mode());
+
 	if (*batch == NULL) {
 		*batch = (struct mmu_table_batch *)__get_free_page(GFP_NOWAIT | __GFP_NOWARN);
 		if (*batch == NULL) {
-- 
2.43.0


