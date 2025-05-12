Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86684C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 10:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kS54aYfvY/Lc/pq+XKDAHStSOWbUNQbDoyfez/W8dLI=; b=q5Tox4gO6MnOm5LhUo1iLFrJPB
	BDiSKnDeQuTC1w0SWn7Wc0nOECTTDebKq/xrTr3oi/gUWxlJOYNevA83YWjP6lrgIsIyPaDrGK/Rl
	WG4BLEfGjGOnYnsb+KQEegCDEd6SODCGfa2e9aM/vH1R7c5vNQROqFhYyP9igygHeO560LMm02mNf
	azNXDBpnGJOyTcDD433gw7RmxdX/IEDHJKD9VMqyWb1NQmGedSxqh4FTzyJ9eIdGwwYgx8GDinRVj
	wOnmX9CZbluVo9ci+uMvcXJ6eprjWWwEDlKJrZ7i8IDAAJ/OjT2DkrbvnhKH2B9w3EW6Jzh8OnmGU
	q9rV/V1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQS3-000000096dB-2EAM;
	Mon, 12 May 2025 10:32:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQJD-000000095Ow-13Dj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 10:22:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F05D150C;
	Mon, 12 May 2025 03:22:43 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5014F3F673;
	Mon, 12 May 2025 03:22:52 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
Subject: [PATCH] arm64/mm: Disable barrier batching in interrupt contexts
Date: Mon, 12 May 2025 11:22:40 +0100
Message-ID: <20250512102242.4156463-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_032255_383983_2E535C8C 
X-CRM114-Status: GOOD (  19.41  )
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

Commit 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel
mappings") enabled arm64 kernels to track "lazy mmu mode" using TIF
flags in order to defer barriers until exiting the mode. At the same
time, it added warnings to check that pte manipulations were never
performed in interrupt context, because the tracking implementation
could not deal with nesting.

But it turns out that some debug features (e.g. KFENCE, DEBUG_PAGEALLOC)
do manipulate ptes in softirq context, which triggered the warnings.

So let's take the simplest and safest route and disable the batching
optimization in interrupt contexts. This makes these users no worse off
than prior to the optimization. Additionally the known offenders are
debug features that only manipulate a single PTE, so there is no
performance gain anyway.

There may be some obscure case of encrypted/decrypted DMA with the
dma_free_coherent called from an interrupt context, but again, this is
no worse off than prior to the commit.

Some options for supporting nesting were considered, but there is a
difficult to solve problem if any code manipulates ptes within interrupt
context but *outside of* a lazy mmu region. If this case exists, the
code would expect the updates to be immediate, but because the task
context may have already been in lazy mmu mode, the updates would be
deferred, which could cause incorrect behaviour. This problem is avoided
by always ensuring updates within interrupt context are immediate.

Fixes: 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel mappings")
Reported-by: syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-arm-kernel/681f2a09.050a0220.f2294.0006.GAE@google.com/
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---

Hi Will,

I've tested before and after with KFENCE enabled and it solves the issue. I've
also run all the mm-selftests which all continue to pass.

Catalin suggested a Fixes patch targetting the SHA as it is in for-next/mm was
the preferred approach, but shout if you want something different. I'm hoping
that with this fix we can still make it for this cycle, subject to not finding
any more issues.

Thanks,
Ryan


 arch/arm64/include/asm/pgtable.h | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index ab4a1b19e596..e65083ec35cb 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -64,7 +64,11 @@ static inline void queue_pte_barriers(void)
 {
 	unsigned long flags;

-	VM_WARN_ON(in_interrupt());
+	if (in_interrupt()) {
+		emit_pte_barriers();
+		return;
+	}
+
 	flags = read_thread_flags();

 	if (flags & BIT(TIF_LAZY_MMU)) {
@@ -79,7 +83,9 @@ static inline void queue_pte_barriers(void)
 #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
 static inline void arch_enter_lazy_mmu_mode(void)
 {
-	VM_WARN_ON(in_interrupt());
+	if (in_interrupt())
+		return;
+
 	VM_WARN_ON(test_thread_flag(TIF_LAZY_MMU));

 	set_thread_flag(TIF_LAZY_MMU);
@@ -87,12 +93,18 @@ static inline void arch_enter_lazy_mmu_mode(void)

 static inline void arch_flush_lazy_mmu_mode(void)
 {
+	if (in_interrupt())
+		return;
+
 	if (test_and_clear_thread_flag(TIF_LAZY_MMU_PENDING))
 		emit_pte_barriers();
 }

 static inline void arch_leave_lazy_mmu_mode(void)
 {
+	if (in_interrupt())
+		return;
+
 	arch_flush_lazy_mmu_mode();
 	clear_thread_flag(TIF_LAZY_MMU);
 }
--
2.43.0


