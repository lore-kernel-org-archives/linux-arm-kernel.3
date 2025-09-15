Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478A7CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 03:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1dkxC6b9R+oe5bvNNaXAu1xng9mdxaGiWxJPd/5Wb1I=; b=Mec2PzpN9MEheayTWuiK4RtvpP
	7jX0qhvck+t3UilUx535z0nn2L1KBJ4JZyDVMtiJSWBExlNwWOxsWHh/108XG9qDiQO+pismCl6oQ
	+kbDpKCnmr4Nt3ciOgtBDQ0fxK0cp1nSxhgFe2NB+eva/syUdEJiNmYIcuyp1bLy9Z1kuXp5L6H0c
	LWGR6p14p2ys4pK9Y8gxXMEpq4HPggUyzG7j+lHI1sRGP6D2mfDf1NKeX4spK7bDZfgvlmoXxn9AN
	li9d75ieQrp2gwFjNJJyju2AtqloIQ+25/VG5cdg/6sa9uZARua3kqjbuqvBqwdonzoVJKeGow8EV
	ZCECgrCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxzv6-00000002fkn-3pcn;
	Mon, 15 Sep 2025 03:30:24 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxzv3-00000002fiu-0HJk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 03:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1757907016; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=1dkxC6b9R+oe5bvNNaXAu1xng9mdxaGiWxJPd/5Wb1I=;
	b=cxZG3JF2pY2GlhRbEE00P3OGt1zjV+3L+MSfV52BJvGpG1lqTB3FD0CQldoUhoj2Ts6icknudfg1/qC6eFFhz4fCoOycd6QdHe6x2iBSBLU0qGnWLtmmy+5u1nWYOoFSyds4PNDgLeE7LZkwuisgjQoIEpofUnMEIYLR/FNkKk4=
Received: from localhost.localdomain(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0Wnx2CEE_1757906997 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 15 Sep 2025 11:30:13 +0800
From: Huang Ying <ying.huang@linux.alibaba.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>
Cc: Huang Ying <ying.huang@linux.alibaba.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	"Christoph Lameter (Ampere)" <cl@gentwo.org>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Yin Fengwei <fengwei_yin@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 0/2] arm, tlbflush: avoid TLBI broadcast if page reused in write fault
Date: Mon, 15 Sep 2025 11:29:44 +0800
Message-Id: <20250915032946.33203-1-ying.huang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_203021_747091_4B2AF429 
X-CRM114-Status: UNSURE (   6.82  )
X-CRM114-Notice: Please train this message.
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

This series is to optimize the system performance via avoiding TLBI
broadcast if page is reused in the write protect fault handler.  More
details of the background and the test results can be found in [2/2].

Huang Ying (2):
  mm: add spurious fault fixing support for huge pmd
  arm64, tlbflush: don't TLBI broadcast if page reused in write fault

 arch/arm64/include/asm/pgtable.h  | 14 ++++++++-----
 arch/arm64/include/asm/tlbflush.h | 33 +++++++++++++++++++++++++++++++
 arch/arm64/mm/fault.c             |  2 +-
 include/linux/pgtable.h           |  4 ++++
 mm/huge_memory.c                  | 25 +++++++++++++++++++----
 mm/internal.h                     |  4 ++--
 6 files changed, 70 insertions(+), 12 deletions(-)

Best Regards,
Huang, Ying

