Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3038EA854C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 02:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NO6xPX7wBMDX97kR76nmeCVqe5T9Iqd+K73lSupum3U=; b=3YzJ+pZ5cgoPhborY1gqpBbY7z
	7E5AINQpob7d2qyzck10fZ4Zzs70NU9MT8MgBEFoijLgpmzrdPsnGXQCIAJ+JmFckBg3aiJroKIUA
	pJxdonRHzAFlgO0AEfUidXyepLHxJq6X2mfeBQnusezo/xp1N15i6rwqMbqkU/QuwBEG2EqQytdvc
	FJpzhrssWSTGePvxY05I+pAjFUGF+vsSwzp9AOG2oU5Chkb4n6D+ZjetcEcYXi0QCv8iLV4saa/KB
	QQKBB5jjOWpuRcvGGrfjmcLD/AScOK5VN5K9QAFANG8s+h5ORWUI/PIjE2KgaSWmVxFCDHrBEqoGj
	QhlfX5YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzQoN-00000006ZGg-2ymo;
	Mon, 09 Mar 2026 02:57:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzQoJ-00000006ZFW-336y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 02:57:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B7D11D13;
	Sun,  8 Mar 2026 19:57:25 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 02AE83F694;
	Sun,  8 Mar 2026 19:57:29 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Christoph Lameter <cl@gentwo.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 0/2] arm64/mm: Enable batched TLB flush in unmap_hotplug_range()
Date: Mon,  9 Mar 2026 02:57:23 +0000
Message-Id: <20260309025725.455004-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_195735_810561_81F2E2DD 
X-CRM114-Status: GOOD (  10.90  )
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

This series enables batched TLB flush in unmap_hotplug_range() which avoids
individual page TLB flush for potential CONT blocks in linear mapping while
also improving performance due to range based TLB operation along with less
synchronization barrier instructions.

It also now rejects memory removal that might split a leaf entry in kernel
mapping, which would have otherwise required re-structuring using the break
before make (BBM) semantics. But kernel cannot tolerate BBM, so remapping to
fine grained leaves would not be possible on systems without BBML2_NOABORT.

This series applies on 7.0-rc3 and tested on KVM guest.

Changes in V5:

- Fixed all single liner in code comments per David

Changes in V4:

https://lore.kernel.org/all/20260305053148.3765710-1-anshuman.khandual@arm.com/

Accommodated all comments from David H

- Dropped 'size' in can_unmap_without_split()
- Added BUILD_BUG_ON() for SPARSEMEM_VMEMMAP in can_unmap_without_split()
- Added unified comment in addr_splits_kernel_leaf()
- Replaced ALIGNED_DOWN() with IS_ALIGNED()
- Dropped all PXX_SIZE comments in addr_splits_kernel_leaf()
- Dropped the comment in unmap_hotplug_range()
- Dropped the comments about TLB flush being essential for freeing memory
- Replaced the comments regarding CONT blocks
- Replaced the comments as unmap_hotplug_range() flushes TLB for !free_mapped
- Dropped "Fixes:" and "Closes:" tag from [PATCH 2/2], added "Link:" instead

Changes in V3:

https://lore.kernel.org/all/20260224062423.972404-1-anshuman.khandual@arm.com/

- Fixed some typos in the commit message for [PATCH 2/2]
- Dropped copying stable@vger.kernel.org per Ryan

Changes in V2:

https://lore.kernel.org/all/20260203130348.612150-1-anshuman.khandual@arm.com/

- Renamed split_kernel_leaf_boundary() as addr_splits_kernel_leaf()
- Dropped pte_valid()/pmd_leaf() before checking pte_cont()/pmd_cont()
- Changed and dropped variables in can_unmap_without_split()
- Moved can_unmap_without_split() after boot memory check
- Renamed 'prevent_bootmem' as 'prevent_memory' across the board
- Updated commit message in both patches

Changes in V1:

- https://lore.kernel.org/all/20260202042617.504183-1-anshuman.khandual@arm.com/

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: David Hildenbrand <david@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>
Cc: Christoph Lameter <cl@gentwo.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Anshuman Khandual (2):
  arm64/mm: Enable batched TLB flush in unmap_hotplug_range()
  arm64/mm: Reject memory removal that splits a kernel leaf mapping

 arch/arm64/mm/mmu.c | 156 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 134 insertions(+), 22 deletions(-)

-- 
2.30.2


