Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F72C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 09:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8Sm5f91QA1tdWrfXa5e4gB1UAyQQXD+cJTKtv5k94I=; b=Euiy1XrxrCyv7Wwoz7VFEpUzY0
	X++mY3NjlP64dYiArm6uS+QqIIsGw2Vl07nkcLs9YlKBfaQkxEYJqLJB7z1IFmKpNXHNFyKhiVL2I
	K0FcUQDvdr4F0SGclh6h2UScHHsya+le0onR/5JRTC8Nq/rtQocnDUsY3tViZipBoh5tQ7oZJJg1a
	q+MuGhfYQvo+rlFFLxnugTE7VUSyu6O7xybpzDM1fxF1cYz7VnFNK2YIYsziZwfMnMcnyDBAbTnNd
	8e1aNA30AoDqBKxuSr9qw1QJO2hKVLFAmvLkQd3qzLsNHMfLCvJqjx3+WFrC4mGHJ5qoqAhaD9uLS
	5Cxas+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvjV-000000004ug-1StL;
	Fri, 30 May 2025 09:08:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvfJ-000000004MZ-26N6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 09:04:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 919E116F8;
	Fri, 30 May 2025 02:04:20 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (unknown [10.164.18.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F3C603F5A1;
	Fri, 30 May 2025 02:04:31 -0700 (PDT)
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
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH 1/3] mm: Allow pagewalk without locks
Date: Fri, 30 May 2025 14:34:05 +0530
Message-Id: <20250530090407.19237-2-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250530090407.19237-1-dev.jain@arm.com>
References: <20250530090407.19237-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_020437_583519_5748654D 
X-CRM114-Status: GOOD (  12.78  )
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

It is noted at [1] that KFENCE can manipulate kernel pgtable entries during
softirqs. It does this by calling set_memory_valid() -> __change_memory_common().
This being a non-sleepable context, we cannot take the init_mm mmap lock.
Therefore, add PGWALK_NOLOCK to enable walk_page_range_novma() usage without
locks.

[1] https://lore.kernel.org/linux-arm-kernel/89d0ad18-4772-4d8f-ae8a-7c48d26a927e@arm.com/

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 include/linux/pagewalk.h |  2 ++
 mm/pagewalk.c            | 12 ++++++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
index 9700a29f8afb..9bc8853ed3de 100644
--- a/include/linux/pagewalk.h
+++ b/include/linux/pagewalk.h
@@ -14,6 +14,8 @@ enum page_walk_lock {
 	PGWALK_WRLOCK = 1,
 	/* vma is expected to be already write-locked during the walk */
 	PGWALK_WRLOCK_VERIFY = 2,
+	/* no lock is needed */
+	PGWALK_NOLOCK = 3,
 };
 
 /**
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index e478777c86e1..9657cf4664b2 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -440,6 +440,8 @@ static inline void process_vma_walk_lock(struct vm_area_struct *vma,
 	case PGWALK_RDLOCK:
 		/* PGWALK_RDLOCK is handled by process_mm_walk_lock */
 		break;
+	default:
+		break;
 	}
 #endif
 }
@@ -640,10 +642,12 @@ int walk_page_range_novma(struct mm_struct *mm, unsigned long start,
 	 * specified address range from being freed. The caller should take
 	 * other actions to prevent this race.
 	 */
-	if (mm == &init_mm)
-		mmap_assert_locked(walk.mm);
-	else
-		mmap_assert_write_locked(walk.mm);
+	if (ops->walk_lock != PGWALK_NOLOCK) {
+		if (mm == &init_mm)
+			mmap_assert_locked(walk.mm);
+		else
+			mmap_assert_write_locked(walk.mm);
+	}
 
 	return walk_pgd_range(start, end, &walk);
 }
-- 
2.30.2


