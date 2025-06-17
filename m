Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511EEC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 10:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9h6Blzh7jXPiN7IvTSUmNOHLwahbPeps/J5XPKclM/s=; b=EMECHRgmBl7/e0scPbtGxTqvwS
	5WGSUtmTlr48jshADSptjppqYIhdk2mBL5KTVvRpnvt6istPo/84rjFLc2S6guaq58XCFOFV+O+TS
	O/fSRlQsW7W/9jWbh4phxYxKOwmNh37NUJJtLz5mubcw5vH2qzfHPh/pBO8cZCyaUa1w23jo4Nm0Q
	zt0QQNXknYkr2r5JydD57xd8OO12TGJq8aGSaq3V10yG9uTmgQ8RHmOhmcQvfR5dO2uqlmiuyiioS
	vdgLHx5J++oO2GYRaiiMDIepJKP1Z/I7T3yV+/xY0NhEb/lu48hPsscHM81AvqhTSVOn5aYlxyrC/
	GhG548Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTSj-00000006tt3-3lNP;
	Tue, 17 Jun 2025 10:22:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSyb-00000006pS7-0Prt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 09:51:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0171A22EE;
	Tue, 17 Jun 2025 02:51:11 -0700 (PDT)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.2.80.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8D463F58B;
	Tue, 17 Jun 2025 02:51:28 -0700 (PDT)
From: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
To: ryan.roberts@arm.com,
	yang@os.amperecomputing.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	jean-philippe@linaro.org,
	robin.murphy@arm.com,
	joro@8bytes.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	james.morse@arm.com,
	broonie@kernel.org,
	ardb@kernel.org,
	baohua@kernel.org,
	suzuki.poulose@arm.com,
	david@redhat.com,
	jgg@ziepe.ca,
	nicolinc@nvidia.com,
	jsnitsel@redhat.com,
	mshavit@google.com,
	kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
Subject: [PATCH v7 4/4] arm64/mm: Elide tlbi in contpte_convert() under BBML2
Date: Tue, 17 Jun 2025 09:51:04 +0000
Message-ID: <20250617095104.6772-5-miko.lenczewski@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617095104.6772-1-miko.lenczewski@arm.com>
References: <20250617095104.6772-1-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_025133_233989_D888332B 
X-CRM114-Status: GOOD (  23.36  )
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

When converting a region via contpte_convert() to use mTHP, we have two
different goals. We have to mark each entry as contiguous, and we would
like to smear the dirty and young (access) bits across all entries in
the contiguous block. Currently, we do this by first accumulating the
dirty and young bits in the block, using an atomic
__ptep_get_and_clear() and the relevant pte_{dirty,young}() calls,
performing a tlbi, and finally smearing the correct bits across the
block using __set_ptes().

This approach works fine for BBM level 0, but with support for BBM level
2 we are allowed to reorder the tlbi to after setting the pagetable
entries. We expect the time cost of a tlbi to be much greater than the
cost of clearing and resetting the PTEs. As such, this reordering of the
tlbi outside the window where our PTEs are invalid greatly reduces the
duration the PTE are visibly invalid for other threads. This reduces the
likelyhood of a concurrent page walk finding an invalid PTE, reducing
the likelyhood of a fault in other threads, and improving performance
(more so when there are more threads).

Because we support via allowlist only bbml2 implementations that never
raise conflict aborts and instead invalidate the tlb entries
automatically in hardware, we can avoid the final flush altogether.

However, avoiding the intermediate tlbi+dsb must be carefully considered
to ensure that we remain both correct and performant. We document our
reasoning and the expected interactions further in the contpte_convert()
source. To do so we rely on the aarch64 spec (DDI 0487L.a D8.7.1.1)
requirements RNGLXZ and RJQQTC to provide guarantees that the elision is
correct.

Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/mm/contpte.c | 139 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 138 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index bcac4f55f9c1..203357061d0a 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -68,7 +68,144 @@ static void contpte_convert(struct mm_struct *mm, unsigned long addr,
 			pte = pte_mkyoung(pte);
 	}
 
-	__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
+	/*
+	 * On eliding the __tlb_flush_range() under BBML2+noabort:
+	 *
+	 * NOTE: Instead of using N=16 as the contiguous block length, we use
+	 *       N=4 for clarity.
+	 *
+	 * NOTE: 'n' and 'c' are used to denote the "contiguous bit" being
+	 *       unset and set, respectively.
+	 *
+	 * We worry about two cases where contiguous bit is used:
+	 *  - When folding N smaller non-contiguous ptes as 1 contiguous block.
+	 *  - When unfolding a contiguous block into N smaller non-contiguous ptes.
+	 *
+	 * Currently, the BBML0 folding case looks as follows:
+	 *
+	 *  0) Initial page-table layout:
+	 *
+	 *   +----+----+----+----+
+	 *   |RO,n|RO,n|RO,n|RW,n| <--- last page being set as RO
+	 *   +----+----+----+----+
+	 *
+	 *  1) Aggregate AF + dirty flags using __ptep_get_and_clear():
+	 *
+	 *   +----+----+----+----+
+	 *   |  0 |  0 |  0 |  0 |
+	 *   +----+----+----+----+
+	 *
+	 *  2) __flush_tlb_range():
+	 *
+	 *   |____ tlbi + dsb ____|
+	 *
+	 *  3) __set_ptes() to repaint contiguous block:
+	 *
+	 *   +----+----+----+----+
+	 *   |RO,c|RO,c|RO,c|RO,c|
+	 *   +----+----+----+----+
+	 *
+	 *  4) The kernel will eventually __flush_tlb() for changed page:
+	 *
+	 *                  |____| <--- tlbi + dsb
+	 *
+	 * As expected, the intermediate tlbi+dsb ensures that other PEs
+	 * only ever see an invalid (0) entry, or the new contiguous TLB entry.
+	 * The final tlbi+dsb will always throw away the newly installed
+	 * contiguous TLB entry, which is a micro-optimisation opportunity,
+	 * but does not affect correctness.
+	 *
+	 * In the BBML2 case, the change is avoiding the intermediate tlbi+dsb.
+	 * This means a few things, but notably other PEs will still "see" any
+	 * stale cached TLB entries. This could lead to a "contiguous bit
+	 * misprogramming" issue until the final tlbi+dsb of the changed page,
+	 * which would clear out both the stale (RW,n) entry and the new (RO,c)
+	 * contiguous entry installed in its place.
+	 *
+	 * What this is saying, is the following:
+	 *
+	 *  +----+----+----+----+
+	 *  |RO,n|RO,n|RO,n|RW,n| <--- old page tables, all non-contiguous
+	 *  +----+----+----+----+
+	 *
+	 *  +----+----+----+----+
+	 *  |RO,c|RO,c|RO,c|RO,c| <--- new page tables, all contiguous
+	 *  +----+----+----+----+
+	 *   /\
+	 *   ||
+	 *
+	 *  If both the old single (RW,n) and new contiguous (RO,c) TLB entries
+	 *  are present, and a write is made to this address, do we fault or
+	 *  is the write permitted (via amalgamation)?
+	 *
+	 * The relevant Arm ARM DDI 0487L.a requirements are RNGLXZ and RJQQTC,
+	 * and together state that when BBML1 or BBML2 are implemented, either
+	 * a TLB conflict abort is raised (which we expressly forbid), or will
+	 * "produce an OA, access permissions, and memory attributes that are
+	 * consistent with any of the programmed translation table values".
+	 *
+	 * That is to say, will either raise a TLB conflict, or produce one of
+	 * the cached TLB entries, but never amalgamate.
+	 *
+	 * Thus, as the page tables are only considered "consistent" after
+	 * the final tlbi+dsb (which evicts both the single stale (RW,n) TLB
+	 * entry as well as the new contiguous (RO,c) TLB entry), omitting the
+	 * initial tlbi+dsb is correct.
+	 *
+	 * It is also important to note that at the end of the BBML2 folding
+	 * case, we are still left with potentially all N TLB entries still
+	 * cached (the N-1 non-contiguous ptes, and the single contiguous
+	 * block). However, over time, natural TLB pressure will cause the
+	 * non-contiguous pte TLB entries to be flushed, leaving only the
+	 * contiguous block TLB entry. This means that omitting the tlbi+dsb is
+	 * not only correct, but also keeps our eventual performance benefits.
+	 *
+	 * For the unfolding case, BBML0 looks as follows:
+	 *
+	 *  0) Initial page-table layout:
+	 *
+	 *   +----+----+----+----+
+	 *   |RW,c|RW,c|RW,c|RW,c| <--- last page being set as RO
+	 *   +----+----+----+----+
+	 *
+	 *  1) Aggregate AF + dirty flags using __ptep_get_and_clear():
+	 *
+	 *   +----+----+----+----+
+	 *   |  0 |  0 |  0 |  0 |
+	 *   +----+----+----+----+
+	 *
+	 *  2) __flush_tlb_range():
+	 *
+	 *   |____ tlbi + dsb ____|
+	 *
+	 *  3) __set_ptes() to repaint as non-contiguous:
+	 *
+	 *   +----+----+----+----+
+	 *   |RW,n|RW,n|RW,n|RW,n|
+	 *   +----+----+----+----+
+	 *
+	 *  4) Update changed page permissions:
+	 *
+	 *   +----+----+----+----+
+	 *   |RW,n|RW,n|RW,n|RO,n| <--- last page permissions set
+	 *   +----+----+----+----+
+	 *
+	 *  5) The kernel will eventually __flush_tlb() for changed page:
+	 *
+	 *                  |____| <--- tlbi + dsb
+	 *
+	 * For BBML2, we again remove the intermediate tlbi+dsb. Here, there
+	 * are no issues, as the final tlbi+dsb covering the changed page is
+	 * guaranteed to remove the original large contiguous (RW,c) TLB entry,
+	 * as well as the intermediate (RW,n) TLB entry; the next access will
+	 * install the new (RO,n) TLB entry and the page tables are only
+	 * considered "consistent" after the final tlbi+dsb, so software must
+	 * be prepared for this inconsistency prior to finishing the mm dance
+	 * regardless.
+	 */
+
+	if (!system_supports_bbml2_noabort())
+		__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
 
 	__set_ptes(mm, start_addr, start_ptep, pte, CONT_PTES);
 }
-- 
2.49.0


