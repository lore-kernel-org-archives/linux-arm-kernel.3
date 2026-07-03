Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F5BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9HuOiOpXWxzQFq7LM08YqEZVME2FhpwkWkeqQztWEGM=; b=hUVOoWHESEv7DyKbLRtnUdAoRI
	4oCLaj2mesuyG1bOJd/Z8xiXtVw0gxMkvyZYfxCIZBaFGKrky8Z5uaGuzjslrLlcFr0fcaH20AuQY
	OnfRG0dZPzJTCIQ/khaVl8HSt2jR4DvQQVzEUp4Ch/3CBM4sBuA708hKxUrr74gAMMP7QQeqne/Ip
	ccrV3wTPXHFXZBKo4psOMdqCV0n0jsV1UjATP3+ct3012veAyCeG8ZCaIpN0sh8LJzi7zFtZ2otRF
	BCXgPvtyz3kpfhei3Q1IhmSJwlo9AedwGe0nmrvVeVEW9maFYoU5Y0DLSQEn01805SEt+BZu3aCqJ
	LsVea/Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcHt-00000006pPc-2BIX;
	Fri, 03 Jul 2026 11:42:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcHq-00000006pP0-2riU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:42:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85C691F91;
	Fri,  3 Jul 2026 04:42:19 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9D32C3F673;
	Fri,  3 Jul 2026 04:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783078943; bh=gjAG24FmQiHMD3ERiShpuM0M9pe6oRmukL9/yTrH5G4=;
	h=From:To:Cc:Subject:Date:From;
	b=tU7XRuHLJ8qyLSmm0z3GT/NObLP7sbopONklJMUamJbe4XQiIsNTvQhhwaMeM5nvW
	 UfcASUHl08SMUxPmqsVcp+LGj79dgKL8jhPQuukkEy0RhyyW6gwnpfScCLO6l9KK/M
	 JJVfz/sfLE7mngUB217h6HcadLLuV+4raCBnC6cM=
From: Dev Jain <dev.jain@arm.com>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	david@kernel.org,
	liam@infradead.org
Cc: Dev Jain <dev.jain@arm.com>,
	riel@surriel.com,
	vbabka@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	kas@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	apopple@nvidia.com,
	rcampbell@nvidia.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	ak@linux.intel.com,
	nao.horiguchi@gmail.com,
	mel@csn.ul.ie,
	j-nomura@ce.jp.nec.com,
	pfalcato@suse.de,
	tglx@kernel.org,
	dave.hansen@intel.com,
	jpoimboe@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com
Subject: [PATCH v3 0/6] Fix incorrect access of hugetlb pte entries
Date: Fri,  3 Jul 2026 11:41:53 +0000
Message-ID: <20260703114202.365553-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_044226_758374_A65A0390 
X-CRM114-Status: UNSURE (   9.24  )
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

There are various places which use ptep_get() to get the pte entry
corresponding to a hugetlb folio. Some arches (like s390) have special
handling to compute the pteval, so they provide huge_ptep_get(). Use this
helper consistently.

Additionally, some code paths may provide huge_ptep_get with an unaligned
address. This is a problem on arm64 (I checked other arches and it looks
fine for them), which is fixed in patch 1. The fix is made to be
backport-friendly: the cleaner fix would be to perhaps pass the hstate
to huge_ptep_get() - that is wider churn and we can do that later.

---
v2->v3:
 - Place comment at appropriate place in patches 2 and 3
 - Modify indentation in patch 2, patch 6

v1->v2:
 - Add patch 1
 - Mention s390 in cover letter

Dev Jain (6):
  arm64: make huge_ptep_get handled unaligned addresses
  mm/rmap: use huge_ptep_get() in try_to_unmap_one()
  mm/rmap: use huge_ptep_get() in try_to_migrate_one()
  mm/migrate: use huge_ptep_get() in remove_migration_pte()
  mm/page_vma_mapped: use huge_ptep_get() for hugetlb
  mm/mprotect: use huge_ptep_get() for hugetlb

 arch/arm64/mm/hugetlbpage.c |  2 +-
 include/linux/hugetlb.h     |  2 ++
 mm/migrate.c                |  6 +++++-
 mm/mprotect.c               | 12 +++++++++---
 mm/page_vma_mapped.c        |  8 +++++++-
 mm/rmap.c                   | 32 ++++++++++++++++++++------------
 6 files changed, 44 insertions(+), 18 deletions(-)

-- 
2.43.0


