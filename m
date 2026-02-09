Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1401E81BCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 14:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtnCI5sMjOjZdukKqKEgSsDbixroOMT6jGSMxfo0RNQ=; b=UKuOr0gXs15GNA55IXiSArJuCO
	8IiE2dhmYWGDgYklQJ5QoT2401x+OySEnxUxXLNgke4d9zr3BTIRC2WPF3a0sCCN1J/Oq2nWGnuA6
	SiF4cHhtuI4XbQm3fFpHVsAXkZyF01TJg+PwTaXho339N4Wz0lH1ApRKQMnBXb4RmykbZrAbK64e3
	aOUrZUlhWZ8LF57F0kEacikRkfNVdp0gy0KWJHSyXNWKDojpaSRkP7Iu7mEFCrnPC7Yffq4Gkl+jZ
	eSV/GCiJj/E0/ZYFSEgObpcTiom38aZ+PE5ItY5JSdH/lcPYjNItXcMFvbYqy9SNLJbBShjcB1xNw
	HRUzg7iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpRvh-0000000FTvw-3qpT;
	Mon, 09 Feb 2026 14:07:57 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpRvb-0000000FTqj-0jHV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 14:07:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770646066; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=xtnCI5sMjOjZdukKqKEgSsDbixroOMT6jGSMxfo0RNQ=;
	b=xMrHHPebhvoDQXtBpXZCQ1PusufVUV0AiO6W3ddUMZRuc987/sPaBbSOMTR+pMSEyF/aNfAYad6sh8fT9BRHhXmud6jU0Qk03Ec8XveeraxE/Tm0/c3BDxrsjEA4JNlHkYsrcWFJlAOz/6SHL/viRr4kwJedM1ylj6rJGvL9/EM=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wyt-ZaP_1770646064 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Feb 2026 22:07:45 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	riel@surriel.com,
	harry.yoo@oracle.com,
	jannh@google.com,
	willy@infradead.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/5] mm: rmap: support batched unmapping for file large folios
Date: Mon,  9 Feb 2026 22:07:28 +0800
Message-ID: <b53a16f67c93a3fe65e78092069ad135edf00eff.1770645603.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770645603.git.baolin.wang@linux.alibaba.com>
References: <cover.1770645603.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_060751_449243_0E92BB46 
X-CRM114-Status: GOOD (  12.50  )
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

Similar to folio_referenced_one(), we can apply batched unmapping for file
large folios to optimize the performance of file folios reclamation.

Barry previously implemented batched unmapping for lazyfree anonymous large
folios[1] and did not further optimize anonymous large folios or file-backed
large folios at that stage. As for file-backed large folios, the batched
unmapping support is relatively straightforward, as we only need to clear
the consecutive (present) PTE entries for file-backed large folios.

Note that it's not ready to support batched unmapping for uffd case, so
let's still fallback to per-page unmapping for the uffd case.

Performance testing:
Allocate 10G clean file-backed folios by mmap() in a memory cgroup, and try to
reclaim 8G file-backed folios via the memory.reclaim interface. I can observe
75% performance improvement on my Arm64 32-core server (and 50%+ improvement
on my X86 machine) with this patch.

W/o patch:
real    0m1.018s
user    0m0.000s
sys     0m1.018s

W/ patch:
real	0m0.249s
user	0m0.000s
sys	0m0.249s

[1] https://lore.kernel.org/all/20250214093015.51024-4-21cnbao@gmail.com/T/#u
Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Acked-by: Barry Song <baohua@kernel.org>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/rmap.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 8807f8a7df28..43cb9ac6f523 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1945,12 +1945,16 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
 	end_addr = pmd_addr_end(addr, vma->vm_end);
 	max_nr = (end_addr - addr) >> PAGE_SHIFT;
 
-	/* We only support lazyfree batching for now ... */
-	if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
+	/* We only support lazyfree or file folios batching for now ... */
+	if (folio_test_anon(folio) && folio_test_swapbacked(folio))
 		return 1;
+
 	if (pte_unused(pte))
 		return 1;
 
+	if (userfaultfd_wp(vma))
+		return 1;
+
 	return folio_pte_batch(folio, pvmw->pte, pte, max_nr);
 }
 
@@ -2313,7 +2317,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			 *
 			 * See Documentation/mm/mmu_notifier.rst
 			 */
-			dec_mm_counter(mm, mm_counter_file(folio));
+			add_mm_counter(mm, mm_counter_file(folio), -nr_pages);
 		}
 discard:
 		if (unlikely(folio_test_hugetlb(folio))) {
-- 
2.47.3


