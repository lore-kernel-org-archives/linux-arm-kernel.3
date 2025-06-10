Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB396C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 12:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPFbrCJR4whsFotVgvMj1EGBPS8eYSd2Wm4xESIvMNs=; b=NLr4Bh1bO8Jd7UvUPwFHXmeqwZ
	RklPk1Gdwhf//8AqXvCgfo8J8c+b6/DlSo+ixBfneoMB1vJbF4a8/eznoQ21wnyD526MwY/Shmn8O
	/2bElt6rFZ131J3GRf/FlNSC9Lm6Fkf+0E35lDdMTnnLpq8jKYgFNlCkzz27vZ47KqmkXWdKzxrAK
	pqI+4eSGs7QKWqUJj7ox8UWAOZ3pMhX5XHus0Snsub9+xgGg/YGoOwvUpeW0rLlZNttRLcpxco55E
	pdNeKVgXgAIKJMyl4zuoIvFjfEOxfP0pkmMgRgmzLYCftwCoBtMXY7frubaqJ/PymjtVfoZ0u4m89
	NLBpdZ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOy4i-00000006ld4-2T0J;
	Tue, 10 Jun 2025 12:27:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxOy-00000006gO7-3K8o
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 11:44:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QPFbrCJR4whsFotVgvMj1EGBPS8eYSd2Wm4xESIvMNs=; b=XT3tmNxqgcqHf7dpDod8bAgBxC
	MtPUuOEoR3fIlB5Y8LXDW46TVZ9YMoDWsIHpRiia6XymUdiQIZQ8a+CiEzS81YnTKU6n4TgtKzgL5
	JnFaLOpS9oK7LyayEgbQ2jT54oO0zOO2JCUg7r5Ww3P7/DkLi8TvagSWBwRUuohYDYQv6UU4W5rJy
	jAib00iLm8SoEYWQchmX+lCommdPHuu4it4u/mIcGV6HtJs8rzjDLRlBJcdwq+gKPr+sDr+oblq2w
	uvYwHEVNoakfSoMP6d1ub1rRXBM18OI2lsUYvYCi4cKwRUcK/BWde8TUPOlnoxzI0Pg+/yiF+jXh4
	5S1giDYQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxOw-00000001mvU-2u7T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 11:44:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E84F0169C;
	Tue, 10 Jun 2025 04:44:01 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 781653F59E;
	Tue, 10 Jun 2025 04:44:15 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com,
	steven.price@arm.com,
	gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	yang@os.amperecomputing.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v2 1/2] mm: Allow lockless kernel pagetable walking
Date: Tue, 10 Jun 2025 17:14:00 +0530
Message-Id: <20250610114401.7097-2-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250610114401.7097-1-dev.jain@arm.com>
References: <20250610114401.7097-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_124423_065754_10EA20BD 
X-CRM114-Status: GOOD (  17.28  )
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

arm64 currently changes permissions on vmalloc objects locklessly, via
apply_to_page_range. Patch 2 moves away from this to use the pagewalk API,
since a limitation of the former is to deny changing permissions for block
mappings. However, the API currently enforces the init_mm.mmap_lock to be
held. To avoid the unnecessary bottleneck of the mmap_lock for our usecase,
this patch extends this generic API to be used locklessly, so as to retain
the existing behaviour for changing permissions. Apart from this reason,
it is noted at [1] that KFENCE can manipulate kernel pgtable entries during
softirqs. It does this by calling set_memory_valid() -> __change_memory_common().
This being a non-sleepable context, we cannot take the init_mm mmap lock.

Since such extension can potentially be dangerous for other callers
consuming the pagewalk API, explicitly disallow lockless traversal for
userspace pagetables by returning EINVAL. Add comments to highlight the
conditions under which we can use the API locklessly - no underlying VMA,
and the user having exclusive control over the range, thus guaranteeing no
concurrent access.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 include/linux/pagewalk.h |  7 +++++++
 mm/pagewalk.c            | 23 ++++++++++++++++++-----
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
index 8ac2f6d6d2a3..5efd6541239b 100644
--- a/include/linux/pagewalk.h
+++ b/include/linux/pagewalk.h
@@ -14,6 +14,13 @@ enum page_walk_lock {
 	PGWALK_WRLOCK = 1,
 	/* vma is expected to be already write-locked during the walk */
 	PGWALK_WRLOCK_VERIFY = 2,
+	/*
+	 * Walk without any lock. Use of this is only meant for the
+	 * case where there is no underlying VMA, and the user has
+	 * exclusive control over the range, guaranteeing no concurrent
+	 * access. For example, changing permissions of vmalloc objects.
+	 */
+	PGWALK_NOLOCK = 3,
 };
 
 /**
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index ff5299eca687..d55d933f84ec 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -417,13 +417,17 @@ static int __walk_page_range(unsigned long start, unsigned long end,
 	return err;
 }
 
-static inline void process_mm_walk_lock(struct mm_struct *mm,
+static inline bool process_mm_walk_lock(struct mm_struct *mm,
 					enum page_walk_lock walk_lock)
 {
+	if (walk_lock == PGWALK_NOLOCK)
+		return 1;
+
 	if (walk_lock == PGWALK_RDLOCK)
 		mmap_assert_locked(mm);
 	else
 		mmap_assert_write_locked(mm);
+	return 0;
 }
 
 static inline void process_vma_walk_lock(struct vm_area_struct *vma,
@@ -440,6 +444,8 @@ static inline void process_vma_walk_lock(struct vm_area_struct *vma,
 	case PGWALK_RDLOCK:
 		/* PGWALK_RDLOCK is handled by process_mm_walk_lock */
 		break;
+	case PGWALK_NOLOCK:
+		break;
 	}
 #endif
 }
@@ -470,7 +476,8 @@ int walk_page_range_mm(struct mm_struct *mm, unsigned long start,
 	if (!walk.mm)
 		return -EINVAL;
 
-	process_mm_walk_lock(walk.mm, ops->walk_lock);
+	if (process_mm_walk_lock(walk.mm, ops->walk_lock))
+		return -EINVAL;
 
 	vma = find_vma(walk.mm, start);
 	do {
@@ -626,8 +633,12 @@ int walk_kernel_page_table_range(unsigned long start, unsigned long end,
 	 * to prevent the intermediate kernel pages tables belonging to the
 	 * specified address range from being freed. The caller should take
 	 * other actions to prevent this race.
+	 *
+	 * If the caller can guarantee that it has exclusive access to the
+	 * specified address range, only then it can use PGWALK_NOLOCK.
 	 */
-	mmap_assert_locked(mm);
+	if (ops->walk_lock != PGWALK_NOLOCK)
+		mmap_assert_locked(mm);
 
 	return walk_pgd_range(start, end, &walk);
 }
@@ -699,7 +710,8 @@ int walk_page_range_vma(struct vm_area_struct *vma, unsigned long start,
 	if (!check_ops_valid(ops))
 		return -EINVAL;
 
-	process_mm_walk_lock(walk.mm, ops->walk_lock);
+	if (process_mm_walk_lock(walk.mm, ops->walk_lock))
+		return -EINVAL;
 	process_vma_walk_lock(vma, ops->walk_lock);
 	return __walk_page_range(start, end, &walk);
 }
@@ -719,7 +731,8 @@ int walk_page_vma(struct vm_area_struct *vma, const struct mm_walk_ops *ops,
 	if (!check_ops_valid(ops))
 		return -EINVAL;
 
-	process_mm_walk_lock(walk.mm, ops->walk_lock);
+	if (process_mm_walk_lock(walk.mm, ops->walk_lock))
+		return -EINVAL;
 	process_vma_walk_lock(vma, ops->walk_lock);
 	return __walk_page_range(vma->vm_start, vma->vm_end, &walk);
 }
-- 
2.30.2


