Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADCDCD1297
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 01:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F2jNYeDr5F6pCBPM7sUJqzwBw4ZiFroYQTaihiWqMoM=; b=jhMDSCNigsm/utom0z/q21q0VL
	RQWyP6wnzVy42pcEtI9WZYNmaw7fvR+3UFP1AG+NhO8oKQMc4fq9L+Z34iHNPPqS8AVlyYgtMK7A+
	nrudhqR9RZqKRkGALwxLMZC7BgIvvNCQpxVwCQIirqfo5u6tHkXvJqQgqc/maHn4TAL0zoHzXWB8W
	kFtl49q8wq8rg5vk++X6ZYsYJ51TQUghdjbOC8cHz4+wVc/+IDpJVcxa3ZxHhhK0idW7G4+hQkT/U
	Ishw9fre402ETRxXrbjChVbjbI4x1Id0yND2J2q2AsS+iBaoHXIcSKmEQ7UbD51ZSrJAoAboIKDAT
	4XSsdjNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIzp1-00000007y23-48UI;
	Wed, 12 Nov 2025 01:38:55 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIzoz-00000007y0Z-08bD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 01:38:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1762911528; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=F2jNYeDr5F6pCBPM7sUJqzwBw4ZiFroYQTaihiWqMoM=;
	b=l6ff8LWDCncfVfNnoQfZuyGxx8g2SpIrhLZVkDMTnJXUt+vUwe9UxYGlTsaDS2uyoDZf/x9oJpa0j8SQ3FYHk8dHp9t8naIPnrz1WWsrwlMwpTsrmQ4I52xzrWJnCmara6JZACGERhjTYU6WFK+nPztWTAAM3ipYfVJDftAuKnw=
Received: from localhost.localdomain(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WsEIP-m_1762911513 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 12 Nov 2025 09:38:45 +0800
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
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Yin Fengwei <fengwei_yin@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH -v5 0/2] arm, tlbflush: avoid TLBI broadcast if page reused in write fault
Date: Wed, 12 Nov 2025 09:38:20 +0800
Message-Id: <20251112013822.54334-1-ying.huang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_173853_441440_7F077EED 
X-CRM114-Status: UNSURE (   7.74  )
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

Changelog:

v5:

- Code cleanup for [2/2], Thanks David's comments.

- Rebased on v6.18-rc5.

v4:

- Collected Reviewed-by and Acked-by, Thanks Lorenzo, David, Ryan, and
  Barry.

v3:

- Various code cleanup and improved design and document in [1/2],
  Thanks Lorenzo and David's comments!
- Fixed a typo and improved function interface in [2/2], Thanks Ryan's
  comments!

v2:

- Various code cleanup in [1/2], Thanks David's comments!
- Remove unnecessary __local_flush_tlb_page_nosync() in [2/2], Thanks Ryan's comments!
- Add missing contpte processing, Thanks Rayn and Catalin's comments!

Huang Ying (2):
  mm: add spurious fault fixing support for huge pmd
  arm64, tlbflush: don't TLBI broadcast if page reused in write fault

 arch/arm64/include/asm/pgtable.h  | 14 ++++---
 arch/arm64/include/asm/tlbflush.h | 56 ++++++++++++++++++++++++++++
 arch/arm64/mm/contpte.c           |  3 +-
 arch/arm64/mm/fault.c             |  8 +++-
 include/linux/huge_mm.h           |  2 +-
 include/linux/pgtable.h           |  4 ++
 mm/huge_memory.c                  | 33 ++++++++++------
 mm/internal.h                     |  2 +-
 mm/memory.c                       | 62 +++++++++++++++++++++++--------
 9 files changed, 145 insertions(+), 39 deletions(-)

Best Regards,
Huang, Ying

