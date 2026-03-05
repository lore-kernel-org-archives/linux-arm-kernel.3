Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A344EDEC05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 05:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=24RkFyPe62/GNqXCWOv6MoCfRiZvqpKjurFSrd1sFdQ=; b=JOfick/zv0LSPhjrRzLP8TqZp2
	aDiYxnCJLHnAAsgMecXKdiYnYcm6XlkurajRT3EjC71d0jkVM3G1+ul0+Rs2MXbCMQhLRSMBH9ksL
	IVidXqAadUQMfI/4yECz9nx0qTUW1WXJoX5IYwyBcqlnqlCNP5thGl2x1FFMZZwlk0+TPdCuX/N5j
	FIhJxMi/g7w1bMTYWSWzW0L0am6LrYQOZJ6rkalhYg4f5o9DXU96ctaeMjEHsad0h/xgcBeKHAPQL
	uJ85+LBHzFz8E6Jq3echGorOxTjqJ///m9Fg4xTs+vzZ8fxVwZjlDzbE+l1vte9dHx/9c3gE7C91A
	oLeEcVNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1Ja-00000000wxN-2KFw;
	Thu, 05 Mar 2026 05:32:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1JX-00000000wwG-19nN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 05:32:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31811339;
	Wed,  4 Mar 2026 21:31:50 -0800 (PST)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D66E43F694;
	Wed,  4 Mar 2026 21:31:54 -0800 (PST)
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
Subject: [PATCH V4 0/2] arm64/mm: Enable batched TLB flush in unmap_hotplug_range()
Date: Thu,  5 Mar 2026 05:31:45 +0000
Message-Id: <20260305053148.3765710-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_213159_361938_90652DC9 
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

This series enables batched TLB flush in unmap_hotplug_range() which avoids
individual page TLB flush for potential CONT blocks in linear mapping while
also improving performance due to range based TLB operation along with less
synchronization barrier instructions.

It also now rejects memory removal that might split a leaf entry in kernel
mapping, which would have otherwise required re-structuring using the break
before make (BBM) semantics. But kernel cannot tolerate BBM, so remapping to
fine grained leaves would not be possible on systems without BBML2_NOABORT.

This series applies on 7.0-rc2 and tested on KVM guest.

Changes in V4:

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

 arch/arm64/mm/mmu.c | 170 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 148 insertions(+), 22 deletions(-)

-- 
2.30.2

