Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D26C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 09:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CkdW/a2Hvmrqjfcssl8Faz1pj9UbEewMEk2GRrnC/A8=; b=YrzYfsefYvjHKAyMNsdxpxnYWh
	OGys7RLw50sYzg19IsSOqfIHTZ6DIoY+2XUUI6kvQcMdDosNEJSydVYd5R1uvpFu7t4V+svrkpLdv
	K82sCKsOQBfFBMFqLkHJM+qzDdUqrt3UXqmMkvmhsK1RdT3oCLGSFLNlhVXFIIneNTjAOn6N7SNHi
	7/hxdTfc8UlM9XlKD3FlWCQPDXAcYhqElD+nPwuHv4v1ax3iNLgfPpDrqF+LZkF6QQF+7bQNYqcsg
	3qvE63NUbnySpIlXLnPmnQ5EkPTdfk2g2SxlNc4k06IdMASE3ywG3EO0eYM8CLY6ECbW38WJ9wCuM
	bFFan4xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u259y-00000003QH9-1euN;
	Tue, 08 Apr 2025 09:22:22 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24xH-00000003ODV-1kI0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 09:09:17 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZX0XG56XlzvWt6;
	Tue,  8 Apr 2025 17:05:02 +0800 (CST)
Received: from kwepemg100017.china.huawei.com (unknown [7.202.181.58])
	by mail.maildlp.com (Postfix) with ESMTPS id 385AE180104;
	Tue,  8 Apr 2025 17:09:05 +0800 (CST)
Received: from huawei.com (10.175.124.71) by kwepemg100017.china.huawei.com
 (7.202.181.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 8 Apr
 2025 17:09:03 +0800
From: Wupeng Ma <mawupeng1@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <ryan.roberts@arm.com>,
	<anshuman.khandual@arm.com>, <akpm@linux-foundation.org>
CC: <peterx@redhat.com>, <joey.gouly@arm.com>, <yangyicong@hisilicon.com>,
	<ioworker0@gmail.com>, <baohua@kernel.org>, <jack@suse.cz>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, Wupeng Ma <mawupeng1@huawei.com>
Subject: [PATCH] arm64: dax: add devmap check for pmd_trans_huge
Date: Tue, 8 Apr 2025 16:59:14 +0800
Message-ID: <20250408085914.1946183-1-mawupeng1@huawei.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.71]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemg100017.china.huawei.com (7.202.181.58)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_020915_797327_1EDC7109 
X-CRM114-Status: GOOD (  14.47  )
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

During our test in ext4 dax linux-v5.10 on arm64. A BUG_ON is trigger in
follow_invalidate_pte as follow since this pmd is seem as pmd_trans_huge.
However this page is really a dax-pmds rather than a pmd trans huge.

Call trace is shown as follow:

  ------------[ cut here ]------------
  kernel BUG at mm/memory.c:5185!
  CPU: 0 PID: 150 Comm: kworker/u8:10 Not tainted 5.10.0-01678-g1e62aad66bbc-dirty #36
  pc : follow_invalidate_pte+0xdc/0x5e0
  lr : follow_invalidate_pte+0xc4/0x5e0
  sp : ffffa00012997110
  Call trace:
   follow_invalidate_pte+0xdc/0x5e0
   dax_entry_mkclean+0x250/0x870
   dax_writeback_one+0xac/0x380
   dax_writeback_mapping_range+0x22c/0x704
   ext4_dax_writepages+0x234/0x6e4
   do_writepages+0xc8/0x1c0
   __writeback_single_inode+0xb8/0x560
   writeback_sb_inodes+0x344/0x7a0
   wb_writeback+0x1f8/0x6b0
   wb_do_writeback+0x194/0x3cc
   wb_workfn+0x14c/0x590
   process_one_work+0x470/0xa30
   worker_thread+0xac/0x510
   kthread+0x1e0/0x220
   ret_from_fork+0x10/0x18
  ---[ end trace 0f479050bd4b1818 ]---
  Kernel panic - not syncing: Oops - BUG: Fatal exception
  ---[ end Kernel panic - not syncing: Oops - BUG: Fatal exception ]---

Commit 5c7fb56e5e3f ("mm, dax: dax-pmd vs thp-pmd vs hugetlbfs-pmd") and
commit 36b78402d97a ("powerpc/hash64/devmap: Use H_PAGE_THP_HUGE when
setting up huge devmap PTE entries") already check pmd_devmap during
checking pmd_trans_huge. Since pmd_devmap() is used to distinguish dax-pmds,
add the same check for arm64 to fix this problem.

Add PTE_DEVMAP in pte_modify as commit 4628a64591e6 ("mm: Preserve
_PAGE_DEVMAP across mprotect() calls") does to avoid the same issue in
mprotect.

Fixes: 73b20c84d42d ("arm64: mm: implement pte_devmap support")
Signed-off-by: Wupeng Ma <mawupeng1@huawei.com>
---
 arch/arm64/include/asm/pgtable.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index d3b538be1500b..b9a618127c01b 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -740,7 +740,7 @@ static inline int pmd_trans_huge(pmd_t pmd)
 	 * as a table, so force the valid bit for the comparison.
 	 */
 	return pmd_val(pmd) && pmd_present(pmd) &&
-	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
+	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID)) && !pmd_devmap(pmd);
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
@@ -1186,7 +1186,8 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 	 */
 	const pteval_t mask = PTE_USER | PTE_PXN | PTE_UXN | PTE_RDONLY |
 			      PTE_PRESENT_INVALID | PTE_VALID | PTE_WRITE |
-			      PTE_GP | PTE_ATTRINDX_MASK | PTE_PO_IDX_MASK;
+			      PTE_GP | PTE_ATTRINDX_MASK | PTE_PO_IDX_MASK |
+			      PTE_DEVMAP;
 
 	/* preserve the hardware dirty information */
 	if (pte_hw_dirty(pte))
-- 
2.43.0


