Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4C1F5140F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 06:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kKRK+KpINJy/hP8loLkF6pCSehJDKosql8DLGWhzAI=; b=3wh/RHKEzs5uHjXpujLegdwHbG
	QwLb2NrGOT2DRDMpJpPj7GDROzhdOSDGrpJocNHtXguCYcWoRz677qq94MhlC8Cu/bVa4jlbidn6q
	yJRZLdoV4a8Its/nz7hW784OzWKVNRPhKnAgktmfyZr0ok6gcda5vXqrPXuIED8t3xVEdGavh4vnB
	KhbMWsR5R8e7BucVG4yczrHs96ZJl7dB3pVpOQTulh35gsijnzxtF21W4uaUb9tB9axLnZ6tH1xkn
	f0BQbcj6ibrNIBKHFdhRsYHjdUQEvGUzDAJN9QQ3csc50Io1mR718FGrl/UyECQJbI7ckLg9x0LoL
	RH81Djlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOuy-000000035yR-1ZQt;
	Fri, 06 Mar 2026 06:44:12 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOuu-000000035vn-0yri
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 06:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772779443; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=8kKRK+KpINJy/hP8loLkF6pCSehJDKosql8DLGWhzAI=;
	b=OQ2ZLqgaRo245nGM0sWABYeGVod200qWhXaKmHstUQ5GZQyDlKzw1jJJcV7n3g9BdLf0yT1yiZRxYoUjjHf9aMYNXKxDhaX/NEmXLjj3JnixD+NcWM8vWF81ve4ijQV8pnhOHB0x6G7MLrugefOvZM2zAtK7O2YwJVAfox3royk=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X-MKhDB_1772779440 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Mar 2026 14:44:00 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	lorenzo.stoakes@oracle.com,
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
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	hannes@cmpxchg.org,
	zhengqi.arch@bytedance.com,
	shakeel.butt@linux.dev,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] mm: rename ptep/pmdp_clear_young_notify() to ptep/pmdp_test_and_clear_young_notify()
Date: Fri,  6 Mar 2026 14:43:38 +0800
Message-ID: <b3454077ce88745e6f88386b1763721746884565.1772778858.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772778858.git.baolin.wang@linux.alibaba.com>
References: <cover.1772778858.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_224408_896577_A0CCD5FE 
X-CRM114-Status: GOOD (  10.56  )
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

Rename ptep/pmdp_clear_young_notify() to ptep/pmdp_test_and_clear_young_notify()
to make the function names consistent.

Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/internal.h | 8 ++++----
 mm/vmscan.c   | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 05eb0303f277..f45f97df0d28 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1819,7 +1819,7 @@ static inline int pmdp_clear_flush_young_notify(struct vm_area_struct *vma,
 	return young;
 }
 
-static inline int ptep_clear_young_notify(struct vm_area_struct *vma,
+static inline int ptep_test_and_clear_young_notify(struct vm_area_struct *vma,
 		unsigned long addr, pte_t *ptep)
 {
 	int young;
@@ -1829,7 +1829,7 @@ static inline int ptep_clear_young_notify(struct vm_area_struct *vma,
 	return young;
 }
 
-static inline int pmdp_clear_young_notify(struct vm_area_struct *vma,
+static inline int pmdp_test_and_clear_young_notify(struct vm_area_struct *vma,
 		unsigned long addr, pmd_t *pmdp)
 {
 	int young;
@@ -1843,8 +1843,8 @@ static inline int pmdp_clear_young_notify(struct vm_area_struct *vma,
 
 #define clear_flush_young_ptes_notify	clear_flush_young_ptes
 #define pmdp_clear_flush_young_notify	pmdp_clear_flush_young
-#define ptep_clear_young_notify	ptep_test_and_clear_young
-#define pmdp_clear_young_notify	pmdp_test_and_clear_young
+#define ptep_test_and_clear_young_notify	ptep_test_and_clear_young
+#define pmdp_test_and_clear_young_notify	pmdp_test_and_clear_young
 
 #endif /* CONFIG_MMU_NOTIFIER */
 
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 52adb37d1b01..e3425b4db755 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3504,7 +3504,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 		if (!folio)
 			continue;
 
-		if (!ptep_clear_young_notify(args->vma, addr, pte + i))
+		if (!ptep_test_and_clear_young_notify(args->vma, addr, pte + i))
 			continue;
 
 		if (last != folio) {
@@ -3595,7 +3595,7 @@ static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area
 		if (!folio)
 			goto next;
 
-		if (!pmdp_clear_young_notify(vma, addr, pmd + i))
+		if (!pmdp_test_and_clear_young_notify(vma, addr, pmd + i))
 			goto next;
 
 		if (last != folio) {
@@ -4185,7 +4185,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 	lockdep_assert_held(pvmw->ptl);
 	VM_WARN_ON_ONCE_FOLIO(folio_test_lru(folio), folio);
 
-	if (!ptep_clear_young_notify(vma, addr, pte))
+	if (!ptep_test_and_clear_young_notify(vma, addr, pte))
 		return false;
 
 	if (spin_is_contended(pvmw->ptl))
@@ -4237,7 +4237,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 		if (!folio)
 			continue;
 
-		if (!ptep_clear_young_notify(vma, addr, pte + i))
+		if (!ptep_test_and_clear_young_notify(vma, addr, pte + i))
 			continue;
 
 		if (last != folio) {
-- 
2.47.3


