Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE96FC18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9eJ9ubH7HnG2LaNugS8OQeNVqE1iXZKcGYjDADqPrRM=; b=Ku+mUpg5Q3yRZulyKu8tTFFRhg
	0fLSIJ4jmrfFDwNyqNfbFhJ6dXyJcFAhl0hsWVABP2nVuItwW9TqgY33oCPEBFLNv8wMN4LDn3siI
	5pi563qnvkDSWmItDeg+aZxVI8xlHh78U/36isFB5CQtqdJ7K3H4y5zYFl/sAKPPtvazCcrWfOMH1
	UNmiGOPTta9YbVwEM8k988P2e4QeDA/zQ9W5fq/h/9cVCuULBqKxldmkz4NIJE+5yxQXMzLJ9s6jZ
	rDlFlbvwYGjxoLzhT0jB6ke+UgoCAtdVKhWAAFp4WkJbv22Hm/kH5KnkU69dhmHdLgZ9uqNyLaHMx
	Q7htPx9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHQc-00000003rn3-1St1;
	Wed, 26 Feb 2025 13:26:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGBz-00000003c06-3nbO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 12:07:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F17C413D5;
	Wed, 26 Feb 2025 04:07:26 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8056A3F5A1;
	Wed, 26 Feb 2025 04:07:05 -0800 (PST)
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
Subject: [PATCH v3 0/3] Fixes for hugetlb on arm64
Date: Wed, 26 Feb 2025 12:06:50 +0000
Message-ID: <20250226120656.2400136-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_040712_029677_6E897D29 
X-CRM114-Status: GOOD (  14.23  )
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

This series contains some fixes for hugetlb on arm64. It turns out that I will
need to rework the companion performance improvement series a bit and as a
result won't be relying on the purely mm fix that was patch 4 in v2. So I've
dropped that patch and will send it to mm separately.

I think this should be ready for merge now.

Changes since v2 [2]
====================
- Added Rb/Ab from various people - Thanks!
- Reworked num_contig_ptes() to return 1 by default and warn for bad sizes
- Fixed some formatting issues in s390 header
- Moved s390's huge_ptep_get_and_clear() to header and made it inline
- Removed patch 4; I'll send this to mm list separately
- Fixed various typos in commit logs

Changes since v1 [1]
====================
- Added Rb from Anshuman - Thanks!
- Added "#ifndef __PAGETABLE_PMD_FOLDED" around PUD_SIZE in flush_hugetlb_tlb_range()

I've marked all of these as candidates for backport to stable.

Applies on top of v6.14-rc3. All mm selftests run and pass.

[1] https://lore.kernel.org/all/20250205151003.88959-1-ryan.roberts@arm.com/
[2] https://lore.kernel.org/all/20250217140419.1702389-1-ryan.roberts@arm.com/

Thanks,
Ryan

Ryan Roberts (3):
  mm: hugetlb: Add huge page size param to huge_ptep_get_and_clear()
  arm64: hugetlb: Fix huge_ptep_get_and_clear() for non-present ptes
  arm64: hugetlb: Fix flush_hugetlb_tlb_range() invalidation level

 arch/arm64/include/asm/hugetlb.h     | 26 ++++++++----
 arch/arm64/mm/hugetlbpage.c          | 61 ++++++++++++----------------
 arch/loongarch/include/asm/hugetlb.h |  6 ++-
 arch/mips/include/asm/hugetlb.h      |  6 ++-
 arch/parisc/include/asm/hugetlb.h    |  2 +-
 arch/parisc/mm/hugetlbpage.c         |  2 +-
 arch/powerpc/include/asm/hugetlb.h   |  6 ++-
 arch/riscv/include/asm/hugetlb.h     |  3 +-
 arch/riscv/mm/hugetlbpage.c          |  2 +-
 arch/s390/include/asm/hugetlb.h      | 16 ++++++--
 arch/s390/mm/hugetlbpage.c           |  4 +-
 arch/sparc/include/asm/hugetlb.h     |  2 +-
 arch/sparc/mm/hugetlbpage.c          |  2 +-
 include/asm-generic/hugetlb.h        |  2 +-
 include/linux/hugetlb.h              |  4 +-
 mm/hugetlb.c                         |  4 +-
 16 files changed, 82 insertions(+), 66 deletions(-)

--
2.43.0


