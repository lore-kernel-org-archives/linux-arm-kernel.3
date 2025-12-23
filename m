Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87115E6B275
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 05:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+a78DMtklkrNbj5wKq84JjELX4bL639or56rrqyDL8M=; b=LFvA4tBQVejfEQ0XJvlf/sIQnf
	dTdy9I4ITDl19dLIDlB7rLDvqkrNHMB/geriBAhgzTkENncmOPWF1hF71Er5aB/YyTJtBmZx+qwfn
	EfuLLEx5WbVDakEbZ0R+jZj/ZnJE7FI1hTdlVD+0lsmVgql+ZxKooY9XCEgNq5yDKE95YAuysv7vm
	0wtbs7Lwiu7rgbPqMQ7nEct1aDExSwoezBO5OHW5td4CWh+aX+To5Mi2Nt0P6evMkgLutbLOjGpPR
	P5rtcQ138AGHLJEjfNwTR5VoS+W9/YCbJmU90X/S3MeV0Qjo2GRS12TDwqi3TOyAWO+I1wkd8/qPY
	rY0BBh2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXvGc-0000000EZ5r-1lKA;
	Tue, 23 Dec 2025 05:49:06 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXvGS-0000000EZ1B-2Zyc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 05:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766468929; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=+a78DMtklkrNbj5wKq84JjELX4bL639or56rrqyDL8M=;
	b=lccI3o52wq33fTkG6PUxq+hAgd5UzvDf6wJxQy6PMOK+O7RchlrQNVMUGnZFMEpyK/PKoA5Uxv2bwiaxuuLFaVo0kH1gY4D/USksoLiah5Yn5aeoMep+ZGTJsA9w34MNFegvzfj7Pfg9Mt4kRy8lp7PAQXvHV/oeU1kMa8UIhr0=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WvWWGsJ_1766468926 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 23 Dec 2025 13:48:47 +0800
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
Subject: [PATCH v4 2/5] arm64: mm: factor out the address and ptep alignment into a new helper
Date: Tue, 23 Dec 2025 13:48:36 +0800
Message-ID: <47e29030347c23ffce238ff5ed752da01a8cc7cb.1766455378.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1766455377.git.baolin.wang@linux.alibaba.com>
References: <cover.1766455377.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_214857_260118_BB19CA6D 
X-CRM114-Status: GOOD (  11.07  )
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

Factor out the contpte block's address and ptep alignment into a new helper,
and will be reused in the following patch.

No functional changes.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 arch/arm64/mm/contpte.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index 589bcf878938..e4ddeb46f25d 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -26,6 +26,26 @@ static inline pte_t *contpte_align_down(pte_t *ptep)
 	return PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
 }
 
+static inline pte_t *contpte_align_addr_ptep(unsigned long *start,
+					     unsigned long *end, pte_t *ptep,
+					     unsigned int nr)
+{
+	/*
+	 * Note: caller must ensure these nr PTEs are consecutive (present)
+	 * PTEs that map consecutive pages of the same large folio within a
+	 * single VMA and a single page table.
+	 */
+	if (pte_cont(__ptep_get(ptep + nr - 1)))
+		*end = ALIGN(*end, CONT_PTE_SIZE);
+
+	if (pte_cont(__ptep_get(ptep))) {
+		*start = ALIGN_DOWN(*start, CONT_PTE_SIZE);
+		ptep = contpte_align_down(ptep);
+	}
+
+	return ptep;
+}
+
 static void contpte_try_unfold_partial(struct mm_struct *mm, unsigned long addr,
 					pte_t *ptep, unsigned int nr)
 {
@@ -569,14 +589,7 @@ void contpte_clear_young_dirty_ptes(struct vm_area_struct *vma,
 	unsigned long start = addr;
 	unsigned long end = start + nr * PAGE_SIZE;
 
-	if (pte_cont(__ptep_get(ptep + nr - 1)))
-		end = ALIGN(end, CONT_PTE_SIZE);
-
-	if (pte_cont(__ptep_get(ptep))) {
-		start = ALIGN_DOWN(start, CONT_PTE_SIZE);
-		ptep = contpte_align_down(ptep);
-	}
-
+	ptep = contpte_align_addr_ptep(&start, &end, ptep, nr);
 	__clear_young_dirty_ptes(vma, start, ptep, (end - start) / PAGE_SIZE, flags);
 }
 EXPORT_SYMBOL_GPL(contpte_clear_young_dirty_ptes);
-- 
2.47.3


