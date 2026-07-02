Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3901C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 05:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NndCCJkZv43xfNRj3zNTTeSh2cEDBxHxuVEE70dEQNE=; b=JB6QgePd9L2ARU84ce3wvEqaEu
	gLyOh++L/Uy6DblGbGTh43a7YrnfW5RZNsCzHqGA+Uw1LBVcOVSCj8oneRxhVq0coTO3ESnxnX2ZO
	63SihSME6iV8yunN6ZJkdDMCeBlXBJRlqIkMpfIdjJh6s2v0EBc5GLf6i3Zpc/XCMD6GQfaPx/ARg
	82GkE99tRK2xIR5wndNQbtACVbMbMUeh8tDzkbBpCikhq4c9UKRT80W8AAa81c0NCY4mFPdxWMuvW
	sMWb7sA5whS2UADAmgam3ySrS0UmY0RkDjaOC/m5omDcNUYbb2fLcEzXKlHL+jnarb1we8r4rvYps
	fUQKK8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf9kd-00000003aGe-40h5;
	Thu, 02 Jul 2026 05:14:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf9kb-00000003aGI-1VB0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 05:14:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 362CB3580;
	Wed,  1 Jul 2026 22:14:07 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 411CE3F85F;
	Wed,  1 Jul 2026 22:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782969251; bh=GBEwdvQfsBB33jxX2WsSLwobJOlQGrrqxOQ+45Al7L8=;
	h=From:To:Cc:Subject:Date:From;
	b=HO6URRUp9xtDNWrDMW9g4YfZa9P5WhTXzTbwfaQ/Dwx2XrYhcs+FbzD/asfeNhtvd
	 A3lOPCKjmIEShSKH0S6ZH2dTMGRZOkYtCXkHovSetRqQQH17yxW+Vhhr5zkGs4sTyb
	 fLVg+jdj6wo431KhBToC0j2IPtBfLYVVmx1qaVlE=
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
	rcampbell@nvidia.com,
	apopple@nvidia.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	j-nomura@ce.jp.nec.com,
	nao.horiguchi@gmail.com,
	ak@linux.intel.com,
	mel@csn.ul.ie,
	pfalcato@suse.de,
	jpoimboe@kernel.org,
	dave.hansen@intel.com,
	tglx@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com
Subject: [PATCH v2 0/6] Fix incorrect access of hugetlb pte entries
Date: Thu,  2 Jul 2026 05:13:34 +0000
Message-ID: <20260702051341.126509-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_221413_457762_2E0F2C0A 
X-CRM114-Status: UNSURE (   8.94  )
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
 include/linux/hugetlb.h     |  3 +++
 mm/migrate.c                |  6 +++++-
 mm/mprotect.c               |  8 +++++++-
 mm/page_vma_mapped.c        |  8 +++++++-
 mm/rmap.c                   | 32 ++++++++++++++++++++------------
 6 files changed, 43 insertions(+), 16 deletions(-)

-- 
2.43.0


