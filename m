Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813C0FD531B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gb3TnxdXPB7NGEqIRzrILLzcA1IoPG9elueOZ+c741Q=; b=lO6LQNU2yCz1NRpeCrZXXs+EwM
	jLhk342ySHng2MPNQxiTzpJ2tRIA5Gnkae2Rn7nP8aDQcy0w8AuRFfJPv/a6Dcv2OZwTnOzOl/CxJ
	drx/MfhOyWz/yv7/g9os8EdScx6j3hCgGXTP5abEyWiKnWadcOvDNBnUw6eDUv/pdSfZLWU7jtBEh
	FB54iy2AIAjmV+44+UhLWb1RA/SaIqrsqwzQnfreNfUp4NkI1xBpYD4b54PhIWgye4/iDt6rgARZ2
	dTP6uIu3AsM742apvZbDocDvepqyPwfjP9oM9oHWdYenfrkbYnMXKbeIp43j3MkoIhUt7Ee5Y3OwE
	zooeCkiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuPY-00000008A9L-1VPD;
	Fri, 27 Feb 2026 09:45:28 +0000
Received: from out199-7.us.a.mail.aliyun.com ([47.90.199.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuPV-00000008A69-00Ej
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772185497; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Gb3TnxdXPB7NGEqIRzrILLzcA1IoPG9elueOZ+c741Q=;
	b=URX/SBkwYZmrpiiJUS4yi0b2GfHVPmrPdBzZkRBbJqyrrDg5/ycIkiFi354HdV3h2d9IyTcyg32WRDWp1+5NFhJB8xJ7kFsZEHU4ZkLcCRkX/LDYX4SSnUkK3ysNDp4cNFnhAOQHw07JZgDS+VmPgq+mLulje/OxO93PZ5BQ9pI=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wztvd08_1772185492 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 27 Feb 2026 17:44:53 +0800
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
Subject: [PATCH v2 2/6] mm: rename ptep/pmdp_clear_young_notify() to ptep/pmdp_test_and_clear_young_notify()
Date: Fri, 27 Feb 2026 17:44:36 +0800
Message-ID: <283d103c5131e32879bd847263c93b768df64d15.1772185080.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772185080.git.baolin.wang@linux.alibaba.com>
References: <cover.1772185080.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_014525_741238_5CA55513 
X-CRM114-Status: GOOD (  10.85  )
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

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/internal.h | 8 ++++----
 mm/vmscan.c   | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index f27cdad98c1e..af04b177f21f 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1814,7 +1814,7 @@ static inline int pmdp_clear_flush_young_notify(struct vm_area_struct *vma,
 	return young;
 }
 
-static inline int ptep_clear_young_notify(struct vm_area_struct *vma,
+static inline int ptep_test_and_clear_young_notify(struct vm_area_struct *vma,
 		unsigned long addr, pte_t *ptep)
 {
 	int young;
@@ -1824,7 +1824,7 @@ static inline int ptep_clear_young_notify(struct vm_area_struct *vma,
 	return young;
 }
 
-static inline int pmdp_clear_young_notify(struct vm_area_struct *vma,
+static inline int pmdp_test_and_clear_young_notify(struct vm_area_struct *vma,
 		unsigned long addr, pmd_t *pmdp)
 {
 	int young;
@@ -1838,8 +1838,8 @@ static inline int pmdp_clear_young_notify(struct vm_area_struct *vma,
 
 #define clear_flush_young_ptes_notify	clear_flush_young_ptes
 #define pmdp_clear_flush_young_notify	pmdp_clear_flush_young
-#define ptep_clear_young_notify	ptep_test_and_clear_young
-#define pmdp_clear_young_notify	pmdp_test_and_clear_young
+#define ptep_test_and_clear_young_notify	ptep_test_and_clear_young
+#define pmdp_test_and_clear_young_notify	pmdp_test_and_clear_young
 
 #endif /* CONFIG_MMU_NOTIFIER */
 
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 6c94e4ecebb2..0a5622420987 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3508,7 +3508,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 		if (!folio)
 			continue;
 
-		if (!ptep_clear_young_notify(args->vma, addr, pte + i))
+		if (!ptep_test_and_clear_young_notify(args->vma, addr, pte + i))
 			continue;
 
 		if (last != folio) {
@@ -3599,7 +3599,7 @@ static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area
 		if (!folio)
 			goto next;
 
-		if (!pmdp_clear_young_notify(vma, addr, pmd + i))
+		if (!pmdp_test_and_clear_young_notify(vma, addr, pmd + i))
 			goto next;
 
 		if (last != folio) {
@@ -4189,7 +4189,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 	lockdep_assert_held(pvmw->ptl);
 	VM_WARN_ON_ONCE_FOLIO(folio_test_lru(folio), folio);
 
-	if (!ptep_clear_young_notify(vma, addr, pte))
+	if (!ptep_test_and_clear_young_notify(vma, addr, pte))
 		return false;
 
 	if (spin_is_contended(pvmw->ptl))
@@ -4241,7 +4241,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 		if (!folio)
 			continue;
 
-		if (!ptep_clear_young_notify(vma, addr, pte + i))
+		if (!ptep_test_and_clear_young_notify(vma, addr, pte + i))
 			continue;
 
 		if (last != folio) {
-- 
2.47.3


