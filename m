Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A318F3ED7E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 06:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8i8mPauj/f/nJuhyMXnVTFcajYsPl5NLDtfrWoT0Kbc=; b=QG/T5kvUy/R8bGqvF+EE8lmLeC
	wlQEnTUdXd7JfLJzhG2xVL0IRbiXfA1oy4M7zPWt0OmY+ex4P0IO6OkF86rraKfLVjzjEIahC35GA
	yXHN/G0cCVoxe36/K+LoL7hi3xIHbY5AfkKQDDmQLGEPMG4g90yswnoJ0HGD56w/MmxfXNPuHBJoU
	OObrZ/VXBxdVoyufIoowLlvh9cWLYyCLCQIVV6SbbA7JhOUK8inipkhGYPoRfVehonbj6oez0TkTz
	lquP6mQoqlVoDtdpSecE0cWwBUkuBWhTRkO232XqZQMd8rja7e7qQkvNRcF0KKwHzwIcVKpfLJ53c
	tLx3G8Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCAfq-0000000F440-2XtB;
	Mon, 13 Apr 2026 06:21:30 +0000
Received: from [101.204.27.37] (helo=mailgw2.hygon.cn)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCAfn-0000000F42S-12w0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 06:21:29 +0000
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw2.hygon.cn (Postfix) with ESMTP id 4fvHNX68Ypz1YQpmD;
	Mon, 13 Apr 2026 14:21:16 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw2.hygon.cn (Postfix) with ESMTP id 4fvHNW0JZ7z1YQpmD;
	Mon, 13 Apr 2026 14:21:15 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id F402830004D3;
	Mon, 13 Apr 2026 14:19:21 +0800 (CST)
Received: from SH-HV00110.Hygon.cn (172.19.26.208) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 13 Apr
 2026 14:21:13 +0800
From: Huang Shijie <huangsj@hygon.cn>
To: <akpm@linux-foundation.org>, <viro@zeniv.linux.org.uk>,
	<brauner@kernel.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
	<muchun.song@linux.dev>, <osalvador@suse.de>,
	<linux-trace-kernel@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<linux-parisc@vger.kernel.org>, <nvdimm@lists.linux.dev>,
	<zhongyuan@hygon.cn>, <fangbaoshun@hygon.cn>, <yingzhiwei@hygon.cn>, Huang
 Shijie <huangsj@hygon.cn>
Subject: [PATCH 0/3] mm: split the file's i_mmap tree for NUMA
Date: Mon, 13 Apr 2026 14:20:39 +0800
Message-ID: <20260413062042.804-1-huangsj@hygon.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.26.208]
X-ClientProxiedBy: cncheex06.Hygon.cn (172.23.18.116) To cncheex04.Hygon.cn
 (172.23.18.114)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_232127_475714_3D04DCA1 
X-CRM114-Status: GOOD (  12.31  )
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

  In NUMA, there are maybe many NUMA nodes and many CPUs.
For example, a Hygon's server has 12 NUMA nodes, and 384 CPUs.
In the UnixBench tests, there is a test "execl" which tests
the execve system call.

  When we test our server with "./Run -c 384 execl",
the test result is not good enough. The i_mmap locks contended heavily on
"libc.so" and "ld.so". For example, the i_mmap tree for "libc.so" can have 
over 6000 VMAs, all the VMAs can be in different NUMA mode.
The insert/remove operations do not run quickly enough.

patch 1 & patch 2 are try to hide the direct access of i_mmap.
patch 3 splits the i_mmap into sibling trees, and we can get better 
performance with this patch set:
    we can get 77% performance improvement(10 times average)


Huang Shijie (3):
  mm: use mapping_mapped to simplify the code
  mm: use get_i_mmap_root to access the file's i_mmap
  mm: split the file's i_mmap tree for NUMA

 arch/arm/mm/fault-armv.c   |  3 ++-
 arch/arm/mm/flush.c        |  3 ++-
 arch/nios2/mm/cacheflush.c |  3 ++-
 arch/parisc/kernel/cache.c |  4 ++-
 fs/dax.c                   |  3 ++-
 fs/hugetlbfs/inode.c       | 10 +++----
 fs/inode.c                 | 55 +++++++++++++++++++++++++++++++++++++-
 include/linux/fs.h         | 40 +++++++++++++++++++++++++++
 include/linux/mm.h         | 33 +++++++++++++++++++++++
 include/linux/mm_types.h   |  1 +
 kernel/events/uprobes.c    |  3 ++-
 mm/hugetlb.c               |  7 +++--
 mm/khugepaged.c            |  6 +++--
 mm/memory-failure.c        |  8 +++---
 mm/memory.c                |  8 +++---
 mm/mmap.c                  |  3 ++-
 mm/nommu.c                 | 11 +++++---
 mm/pagewalk.c              |  2 +-
 mm/rmap.c                  |  2 +-
 mm/vma.c                   | 36 +++++++++++++++++++------
 mm/vma_init.c              |  1 +
 21 files changed, 204 insertions(+), 38 deletions(-)

-- 
2.43.0



