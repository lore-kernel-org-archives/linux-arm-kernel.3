Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CC7C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 15:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V68pH4S7d/Sl2VYKE0uFiVbQmTdTAcmGvsS/XLOraMg=; b=44p9RAdU8bkYl3ysGpaP98iC49
	5ykvY3kRnDqsNnfrtSyQpdIdFD47xLUsy+mhltAK5r1jaevw4sT7wA9i/AkF9763AuOQjIAVXsCUf
	+PmUgmLzoqwK2cZiTPRjqCOLYtA8pIA9Bo9JeH6ZX9l2FW7tIsLTUUmEWqDncDbhf/iehbRQqoBW2
	DDEdnHc+KG72lUHOC82HvwBmxeguQJZuj9wyrH33h/iwjKNu7MydGq1gmA/S10z14BksecNUfjGcA
	xhpDfyXKQnNzB0PzsseKVgiVX4vS35Or58lPgYFEALjmPIkeyfpaPde8YlMEX4eSv9EUAZScLjPHR
	aNEukEmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhKK-00000003laA-0S6W;
	Wed, 05 Feb 2025 15:28:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfh3N-00000003iL4-1QoH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 15:11:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88D461C01;
	Wed,  5 Feb 2025 07:11:24 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CE293F5A1;
	Wed,  5 Feb 2025 07:10:58 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Steve Capper <steve.capper@linaro.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 12/16] arm64/mm: Support huge pte-mapped pages in vmap
Date: Wed,  5 Feb 2025 15:09:52 +0000
Message-ID: <20250205151003.88959-13-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205151003.88959-1-ryan.roberts@arm.com>
References: <20250205151003.88959-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_071101_463974_C955AA84 
X-CRM114-Status: GOOD (  17.29  )
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

Implement the required arch functions to enable use of contpte in the
vmap when VM_ALLOW_HUGE_VMAP is specified. This speeds up vmap
operations due to only having to issue a DSB and ISB per contpte block
instead of per pte. But it also means that the TLB pressure reduces due
to only needing a single TLB entry for the whole contpte block.

Since vmap uses set_huge_pte_at() to set the contpte, that API is now
used for kernel mappings for the first time. Although in the vmap case
we never expect it to be called to modify a valid mapping so
clear_flush() should never be called, it's still wise to make it robust
for the kernel case, so amend the tlb flush function if the mm is for
kernel space.

Tested with vmalloc performance selftests:

  # kself/mm/test_vmalloc.sh \
	run_test_mask=1
	test_repeat_count=5
	nr_pages=256
	test_loop_count=100000
	use_huge=1

Duration reduced from 1274243 usec to 1083553 usec on Apple M2 for 15%
reduction in time taken.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/vmalloc.h | 40 ++++++++++++++++++++++++++++++++
 arch/arm64/mm/hugetlbpage.c      |  5 +++-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 38fafffe699f..fbdeb40f3857 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -23,6 +23,46 @@ static inline bool arch_vmap_pmd_supported(pgprot_t prot)
 	return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
 }
 
+#define arch_vmap_pte_range_map_size arch_vmap_pte_range_map_size
+static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
+						unsigned long end, u64 pfn,
+						unsigned int max_page_shift)
+{
+	if (max_page_shift < CONT_PTE_SHIFT)
+		return PAGE_SIZE;
+
+	if (end - addr < CONT_PTE_SIZE)
+		return PAGE_SIZE;
+
+	if (!IS_ALIGNED(addr, CONT_PTE_SIZE))
+		return PAGE_SIZE;
+
+	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
+		return PAGE_SIZE;
+
+	return CONT_PTE_SIZE;
+}
+
+#define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
+static inline unsigned long arch_vmap_pte_range_unmap_size(unsigned long addr,
+							   pte_t *ptep)
+{
+	/*
+	 * The caller handles alignment so it's sufficient just to check
+	 * PTE_CONT.
+	 */
+	return pte_valid_cont(__ptep_get(ptep)) ? CONT_PTE_SIZE : PAGE_SIZE;
+}
+
+#define arch_vmap_pte_supported_shift arch_vmap_pte_supported_shift
+static inline int arch_vmap_pte_supported_shift(unsigned long size)
+{
+	if (size >= CONT_PTE_SIZE)
+		return CONT_PTE_SHIFT;
+
+	return PAGE_SHIFT;
+}
+
 #endif
 
 #define arch_vmap_pgprot_tagged arch_vmap_pgprot_tagged
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 02afee31444e..a74e43101dad 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -217,7 +217,10 @@ static void clear_flush(struct mm_struct *mm,
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
 		___ptep_get_and_clear(mm, ptep, pgsize);
 
-	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, true);
+	if (mm == &init_mm)
+		flush_tlb_kernel_range(saddr, addr);
+	else
+		__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, true);
 }
 
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
-- 
2.43.0


