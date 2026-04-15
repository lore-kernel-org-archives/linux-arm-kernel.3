Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C52F43858
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 16:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5JOeBNkxu4emZ1xR2H2OG6CLtF/UNlFtnq0p1aEYiSE=; b=yq2gEkpU3GYXrXakjgfJYPv9mE
	ntvjfXndXGgplAIvRf6O/mYvAle7qMrV4PscPVhgGGMP2LMbbxEcZhTHV5oH7KzG7sJZVyS0Vp/b3
	U+8Mf5+qnFfnr15DN+sxnTsywBNxRCGFWS2uEbwC7t+ZbBElE6YQV4T76AqicG1mrFkYZVRhOzJOu
	AM9Eds9fnqeKiGZUXghW1e9u5MFs8rgA0kjU0a4ov2meSan8jep5dnTAHTIAp3AQLbrPdy+ylmvbY
	ps8wJfSAsztS/6TmzGSD990/nROOHsh/bnGCYBor3/LQ4fOllz69rfkgDT+YqyX4ma2CFAKb8FjNW
	cvTLQoWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3P3-00000001Oaq-1SCk;
	Wed, 15 Apr 2026 16:47:49 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3Ox-00000001ORb-0wmy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 16:47:45 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fwn9v082YzHnGjb;
	Thu, 16 Apr 2026 00:47:15 +0800 (CST)
Received: from mscpeml500003.china.huawei.com (unknown [7.188.49.51])
	by mail.maildlp.com (Postfix) with ESMTPS id 6482A40584;
	Thu, 16 Apr 2026 00:47:31 +0800 (CST)
Received: from localhost.localdomain (10.123.66.205) by
 mscpeml500003.china.huawei.com (7.188.49.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 15 Apr 2026 19:47:30 +0300
From: Fedorov Nikita <fedorov.nikita@h-partners.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Ajay
 Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov
	<alexey.makhalov@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>, Arnd
 Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng
	<boqun@kernel.org>, Waiman Long <longman@redhat.com>, Darren Hart
	<dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	<andrealmeid@igalia.com>, Andrew Morton <akpm@linux-foundation.org>, David
 Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, Matthew Brost
	<matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim
	<rakie.kim@sk.com>, <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple
	<apopple@nvidia.com>, Anatoly Stepanov <stepanov.anatoly@huawei.com>
CC: Nikita Fedorov <fedorov.nikita@h-partners.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<virtualization@lists.linux.dev>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, <guohanjun@huawei.com>, <wangkefeng.wang@huawei.com>,
	<weiyongjun1@huawei.com>, <yusongping@huawei.com>, <leijitang@huawei.com>,
	<artem.kuzin@huawei.com>, <kang.sun@huawei.com>, <chenjieping3@huawei.com>
Subject: [RFC PATCH v3 7/7] futex: use hq-spinlock for hash buckets
Date: Thu, 16 Apr 2026 00:44:59 +0800
Message-ID: <20260415164459.2904963-8-fedorov.nikita@h-partners.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415164459.2904963-1-fedorov.nikita@h-partners.com>
References: <20260415164459.2904963-1-fedorov.nikita@h-partners.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.66.205]
X-ClientProxiedBy: mscpeml500003.china.huawei.com (7.188.49.51) To
 mscpeml500003.china.huawei.com (7.188.49.51)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_094743_488787_03466712 
X-CRM114-Status: GOOD (  11.42  )
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

Example of hq-spinlock enabled for futex hash-table bucket locks
(used in memcached testing scenario)

In the evaluated memcached workloads, this improved throughput by up to
10% on AMD EPYC 9654 and by up to 8% on Kunpeng 920, with corresponding
latency reductions.

Co-developed-by: Anatoly Stepanov <stepanov.anatoly@huawei.com>
Signed-off-by: Anatoly Stepanov <stepanov.anatoly@huawei.com>
Co-developed-by: Nikita Fedorov <fedorov.nikita@h-partners.com>
Signed-off-by: Nikita Fedorov <fedorov.nikita@h-partners.com>
---
 kernel/futex/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 31e83a0978..042cdc7f75 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -1521,7 +1521,7 @@ static void futex_hash_bucket_init(struct futex_hash_bucket *fhb,
 #endif
 	atomic_set(&fhb->waiters, 0);
 	plist_head_init(&fhb->chain);
-	spin_lock_init(&fhb->lock);
+	spin_lock_init_hq(&fhb->lock);
 }
 
 #define FH_CUSTOM	0x01
-- 
2.34.1


