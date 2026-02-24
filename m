Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C4CEFB7F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 06:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HMFLeT6pMM4BynW1w1H1drFPBJgoY5QwHa7vgRHSC0M=; b=vfssISxiGkfVRkxgkJ0CpFq80E
	c/S3KQ++Z/SQ1+RleIBZ725rHpMaoUUecHHt9zOXa0UIsnSeUh8NfpEjymlBsitCrrka6wyuviQc6
	Y3HszdOUo9/5Hv6w6o5GZ4Y1lLT8t63jzAgZI/ZLezey7XuC1q2OJLCmm4aSRT3UhZmSyKfKmN3tN
	OvkyFGWKtc+8cPTm+9r4yAnyb/7jQCkn0Nr7zw4KEkksVQphX16DiGFOincMwKcv9vwf7FsjzZmdH
	GHJ/tphKUH3gfND+9vxB6KF5eDPPA0Q4P9pZlJ0px7xCB+OoVnA7fWP/cYFWDyl73m3l1ThQ99hh+
	xZ0F+oiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vulqY-00000001WrF-2hRX;
	Tue, 24 Feb 2026 06:24:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vulqV-00000001Wps-1BWk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 06:24:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46912339;
	Mon, 23 Feb 2026 22:24:27 -0800 (PST)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 10F033F62B;
	Mon, 23 Feb 2026 22:24:31 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: david@kernel.org,
	mark.rutland@arm.com,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Christoph Lameter <cl@gentwo.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 0/2] arm64/mm: Enable batched TLB flush in unmap_hotplug_range()
Date: Tue, 24 Feb 2026 06:24:21 +0000
Message-Id: <20260224062423.972404-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_222435_367414_0CD97562 
X-CRM114-Status: UNSURE (   9.30  )
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

This series enables batched TLB flush in unmap_hotplug_range() which avoids
individual page TLB flush for potential CONT blocks in linear mapping while
also improving performance due to range based TLB operation along with less
synchronization barrier instructions.

It also now rejects memory removal that might split a leaf entry in kernel
mapping, which would have otherwise required re-structuring using the break
before make (BBM) semantics. But kernel cannot tolerate BBM, so remapping to
fine grained leaves would not be possible on systems without BBML2_NOABORT.

This series applies on 7.0-rc1 and tested on KVM guest.

Changes in V3:

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
Cc: Yang Shi <yang@os.amperecomputing.com>
Cc: Christoph Lameter <cl@gentwo.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Anshuman Khandual (2):
  arm64/mm: Enable batched TLB flush in unmap_hotplug_range()
  arm64/mm: Reject memory removal that splits a kernel leaf mapping

 arch/arm64/mm/mmu.c | 236 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 216 insertions(+), 20 deletions(-)

-- 
2.30.2


