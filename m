Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33AAC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 14:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TDbpvju1h5nfuwR761taS4vJXKcOCHPgBt8XdqRI41A=; b=hyFL+afrckYUKFSFUeI8vHYCLc
	SR1p6LwUOA8fIXaSsPVP/nrl5fL57c2lFljfjWXNeLj4leqmOK8PybgLUPi8piMY0aXpSj+xarrS5
	Z5lFbrxzbeTXeOXHdNcDFZfJ9HUfN6rJdwqwHbU552H//0XB3t99cZhRisliElWrVIqlpptLEnTCZ
	0ZqxNA5A6sweM7loSAG4ZCIJzQXDi28iY4hShKNQ4j231qhtXmzI3+OKYdsVa3nUN3CxThoUpM1/k
	k2somY8JGai1Gh60FFyzDGQ281bS9zNZO0HnM8arSXkgpBQuL1TZHDMkuXAvhaMGK/PM39IEd1/Mt
	viNlnI+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1l8-00000004ljY-41KN;
	Mon, 17 Feb 2025 14:06:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1jf-00000004lLS-37Nv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 14:04:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C3B9152B;
	Mon, 17 Feb 2025 06:04:54 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C68753F6A8;
	Mon, 17 Feb 2025 06:04:29 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Fixes for hugetlb and vmalloc on arm64
Date: Mon, 17 Feb 2025 14:04:13 +0000
Message-ID: <20250217140419.1702389-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_060435_868793_D14A6CF1 
X-CRM114-Status: GOOD (  14.00  )
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

Hi All,

This series contains some fixes for hugetlb on arm64, and is split out from v1
of a wider series at [1]. While the last patch is technically targetting core-mm
and is not directly related to arm64, I'd like to to go via the arm64 tree so
that the wider performance improvement series (v2 to be posted shortly) that
depends on this series doesn't have to be robust to the fix not being present.

I've included maintainers/reviewers for all the arches that are (trivially)
touched due to the API changes, hoping for some ACKs.

Changes since v1 [1]
====================
- Added Rb from Anshuman - Thanks!
- Added "#ifndef __PAGETABLE_PMD_FOLDED" around PUD_SIZE in flush_hugetlb_tlb_range()

I've marked all of these as candidates for backport to stable.

Applies on top of v6.14-rc3. All mm selftests run and pass.

[1] https://lore.kernel.org/linux-arm-kernel/20250205151003.88959-1-ryan.roberts@arm.com/

Thanks,
Ryan

Ryan Roberts (4):
  mm: hugetlb: Add huge page size param to huge_ptep_get_and_clear()
  arm64: hugetlb: Fix huge_ptep_get_and_clear() for non-present ptes
  arm64: hugetlb: Fix flush_hugetlb_tlb_range() invalidation level
  mm: Don't skip arch_sync_kernel_mappings() in error paths

 arch/arm64/include/asm/hugetlb.h     | 26 ++++++++++-----
 arch/arm64/mm/hugetlbpage.c          | 48 +++++++++++++---------------
 arch/loongarch/include/asm/hugetlb.h |  6 ++--
 arch/mips/include/asm/hugetlb.h      |  6 ++--
 arch/parisc/include/asm/hugetlb.h    |  2 +-
 arch/parisc/mm/hugetlbpage.c         |  2 +-
 arch/powerpc/include/asm/hugetlb.h   |  6 ++--
 arch/riscv/include/asm/hugetlb.h     |  3 +-
 arch/riscv/mm/hugetlbpage.c          |  2 +-
 arch/s390/include/asm/hugetlb.h      | 12 ++++---
 arch/s390/mm/hugetlbpage.c           | 10 ++++--
 arch/sparc/include/asm/hugetlb.h     |  2 +-
 arch/sparc/mm/hugetlbpage.c          |  2 +-
 include/asm-generic/hugetlb.h        |  2 +-
 include/linux/hugetlb.h              |  4 ++-
 mm/hugetlb.c                         |  4 +--
 mm/memory.c                          |  6 ++--
 mm/vmalloc.c                         |  4 +--
 18 files changed, 87 insertions(+), 60 deletions(-)

--
2.43.0


