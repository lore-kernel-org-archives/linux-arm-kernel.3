Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62794C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 16:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wvko6dEUsSENXj2MtsiTmaS4H8wzQCaDQ0OcCJJ6Exw=; b=AyCEQhlpXP65A2qU7VEm+c7EVP
	zADKCOUFjio3AOKcfiHgphr+QpHIe9R7Eh8d0B0b97TZEbfl6O738JQcG6s+4IAS5ahAEsKmabnJ4
	cHchtMDqkdCyo8cDhhDE13rFuh0tmTD1zAtq1v0lbF7U2n0HtTkwDOJ9TcSuCvRLWMRJ44weoIX++
	xBii0WCLDB4X8zmymLZ/2wrVihctzFMGRn/wk0yPTpG2KGL5A8k6Yz5hdS/+j4j1TxnvhbOrcEZnF
	uaeA8croO40/3imeDbg9Vc+g1GiUFRUYd1JjJyKMuH8Hdo9Jz/ieY95ke7tQRSbAEbSwgaVkky/Hf
	YJe402nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txptE-0000000BTw1-46ez;
	Thu, 27 Mar 2025 16:15:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txplA-0000000BSdp-3P8Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 16:07:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 294621063;
	Thu, 27 Mar 2025 09:07:15 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 540FA3F63F;
	Thu, 27 Mar 2025 09:07:08 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Dave Chinner <david@fromorbit.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v3] mm/filemap: Allow arch to request folio size for exec memory
Date: Thu, 27 Mar 2025 16:06:58 +0000
Message-ID: <20250327160700.1147155-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_090712_946218_8FCBB6EE 
X-CRM114-Status: GOOD (  25.82  )
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

Change the readahead config so that if it is being requested for an
executable mapping, do a synchronous read of an arch-specified size in a
naturally aligned manner into a folio of the same size (assuming an fs
with large folio support).

On arm64 if memory is physically contiguous and naturally aligned to the
"contpte" size, we can use contpte mappings, which improves utilization
of the TLB. When paired with the "multi-size THP" feature, this works
well to reduce dTLB pressure. However iTLB pressure is still high due to
executable mappings having a low likelihood of being in the required
folio size and mapping alignment, even when the filesystem supports
readahead into large folios (e.g. XFS).

The reason for the low likelihood is that the current readahead
algorithm starts with an order-2 folio and increases the folio order by
2 every time the readahead mark is hit. But most executable memory tends
to be accessed randomly and so the readahead mark is rarely hit and most
executable folios remain order-2. To make things worse, readahead
reduces the folio order to 0 at the readahead window boundaries if
required for alignment to those boundaries.

So let's special-case the read(ahead) logic for executable mappings. The
trade-off is performance improvement (due to more efficient storage of
the translations in iTLB) vs potential read amplification (due to
reading too much data around the fault which won't be used), and the
latter is independent of base page size. I've chosen 64K folio size for
arm64 which benefits both the 4K and 16K base page size configs and
shouldn't lead to any read amplification in practice since the old
read-around path was (usually) reading blocks of 128K. I don't
anticipate any write amplification because text is always RO.

Note that the text region of an ELF file could be populated into the
page cache for other reasons than taking a fault in a mmapped area. The
most common case is due to the loader read()ing the header which can be
shared with the beginning of text. So some text will still remain in
small folios, but this simple, best effort change provides good
performance improvements as is.

Benchmarking
============

The below shows nginx and redis benchmarks on Ampere Altra arm64 system.

First, confirmation that this patch causes more text to be contained in
64K folios:

| File-backed folios     |   system boot   |      nginx      |      redis      |
| by size as percentage  |-----------------|-----------------|-----------------|
| of all mapped text mem | before |  after | before |  after | before |  after |
|========================|========|========|========|========|========|========|
| base-page-4kB          |    26% |     9% |    27% |     6% |    21% |     5% |
| thp-aligned-8kB        |     4% |     2% |     3% |     0% |     4% |     1% |
| thp-aligned-16kB       |    57% |    21% |    57% |     6% |    54% |    10% |
| thp-aligned-32kB       |     4% |     1% |     4% |     1% |     3% |     1% |
| thp-aligned-64kB       |     7% |    65% |     8% |    85% |     9% |    72% |
| thp-aligned-2048kB     |     0% |     0% |     0% |     0% |     7% |     8% |
| thp-unaligned-16kB     |     1% |     1% |     1% |     1% |     1% |     1% |
| thp-unaligned-32kB     |     0% |     0% |     0% |     0% |     0% |     0% |
| thp-unaligned-64kB     |     0% |     0% |     0% |     1% |     0% |     1% |
| thp-partial            |     1% |     1% |     0% |     0% |     1% |     1% |
|------------------------|--------|--------|--------|--------|--------|--------|
| cont-aligned-64kB      |     7% |    65% |     8% |    85% |    16% |    80% |

The above shows that for both workloads (each isolated with cgroups) as
well as the general system state after boot, the amount of text backed
by 4K and 16K folios reduces and the amount backed by 64K folios
increases significantly. And the amount of text that is contpte-mapped
significantly increases (see last row).

And this is reflected in performance improvement:

| Benchmark                                     |          Improvement |
+===============================================+======================+
| pts/nginx (200 connections)                   |                8.96% |
| pts/nginx (1000 connections)                  |                6.80% |
+-----------------------------------------------+----------------------+
| pts/redis (LPOP, 50 connections)              |                5.07% |
| pts/redis (LPUSH, 50 connections)             |                3.68% |

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---

Hi All,

This is follow up from LSF/MM where we discussed this and there was concensus to
take this most simple approach. I know Dave Chinner had reservations when I
originally posted it last year, but I think he was coming around in the
discussion at [3].

This applies on top of yesterday's mm-unstable (87f556baedc9).

Changes since v2 [2]
====================

 - Rename arch_wants_exec_folio_order() to arch_exec_folio_order() (per Andrew)
 - Fixed some typos (per Andrew)

Changes since v1 [1]
====================

 - Remove "void" from arch_wants_exec_folio_order() macro args list

[1] https://lore.kernel.org/linux-mm/20240111154106.3692206-1-ryan.roberts@arm.com/
[2] https://lore.kernel.org/all/20240215154059.2863126-1-ryan.roberts@arm.com/
[3] https://lore.kernel.org/linux-mm/ce3b5402-79b8-415b-9c51-f712bb2b953b@arm.com/

Thanks,
Ryan


 arch/arm64/include/asm/pgtable.h | 14 ++++++++++++++
 include/linux/pgtable.h          | 12 ++++++++++++
 mm/filemap.c                     | 19 +++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 15211f74b035..5f75e2ddef02 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1514,6 +1514,20 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
  */
 #define arch_wants_old_prefaulted_pte	cpu_has_hw_af

+/*
+ * Request exec memory is read into pagecache in at least 64K folios. The
+ * trade-off here is performance improvement due to storing translations more
+ * efficiently in the iTLB vs the potential for read amplification due to
+ * reading data from disk that won't be used (although this is not a real
+ * concern as readahead is almost always 128K by default so we are actually
+ * potentially reducing the read bandwidth). The latter is independent of base
+ * page size, so we set a page-size independent block size of 64K. This size can
+ * be contpte-mapped when 4K base pages are in use (16 pages into 1 iTLB entry),
+ * and HPA can coalesce it (4 pages into 1 TLB entry) when 16K base pages are in
+ * use.
+ */
+#define arch_exec_folio_order() ilog2(SZ_64K >> PAGE_SHIFT)
+
 static inline bool pud_sect_supported(void)
 {
 	return PAGE_SIZE == SZ_4K;
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 787c632ee2c9..944ff80e8f4f 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -456,6 +456,18 @@ static inline bool arch_has_hw_pte_young(void)
 }
 #endif

+#ifndef arch_exec_folio_order
+/*
+ * Returns preferred minimum folio order for executable file-backed memory. Must
+ * be in range [0, PMD_ORDER]. Negative value implies that the HW has no
+ * preference and mm will not special-case executable memory in the pagecache.
+ */
+static inline int arch_exec_folio_order(void)
+{
+	return -1;
+}
+#endif
+
 #ifndef arch_check_zapped_pte
 static inline void arch_check_zapped_pte(struct vm_area_struct *vma,
 					 pte_t pte)
diff --git a/mm/filemap.c b/mm/filemap.c
index cc69f174f76b..22ff25a60598 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3223,6 +3223,25 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
 	}
 #endif

+	/*
+	 * Allow arch to request a preferred minimum folio order for executable
+	 * memory. This can often be beneficial to performance if (e.g.) arm64
+	 * can contpte-map the folio. Executable memory rarely benefits from
+	 * readahead anyway, due to its random access nature.
+	 */
+	if (vm_flags & VM_EXEC) {
+		int order = arch_exec_folio_order();
+
+		if (order >= 0) {
+			fpin = maybe_unlock_mmap_for_io(vmf, fpin);
+			ra->size = 1UL << order;
+			ra->async_size = 0;
+			ractl._index &= ~((1UL << order) - 1);
+			page_cache_ra_order(&ractl, ra, order);
+			return fpin;
+		}
+	}
+
 	/* If we don't want any read-ahead, don't bother */
 	if (vm_flags & VM_RAND_READ)
 		return fpin;
--
2.43.0


