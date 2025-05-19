Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FF3C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 07:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vRwlAFhQaOa6OKdw30la2cac+LHun1qtiEK+lD7gygs=; b=T0u75REXst9OHnY02nMHD5qXY/
	UM+PacRTea+YgGob9oGmxWg1uQxaLrz/t/t0USx3tkglEotmuOdfKk6owi/eLnXCATQxQPLIB+BQK
	m9XV1NXUiJhJc4+tBfJu3jtwHxnAQRNU24se9BYaFHNRvkAG/djjo3+JXb/rTaAFcT5+nUTfspEw9
	63Ow9SHCOd0kcT6FWHHPl3ZAJ8H31dhdykwoPx+Z2J5BwnTqMiutUKpnsEV7XNAjzMKi0ubYBF7k6
	qatsfQnR7nPRnGaz+DYZkJm42HAI2FIGR04usepaQKhWirC9obWtVf+9iHA751wfo1pyppO/AwqkT
	CL8qUTsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGvGr-00000008GqI-2akk;
	Mon, 19 May 2025 07:50:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGvEo-00000008GPP-2uwP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 07:48:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2580D14BF;
	Mon, 19 May 2025 00:48:28 -0700 (PDT)
Received: from K4MQJ0H1H2.blr.arm.com (unknown [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6A31F3F6A8;
	Mon, 19 May 2025 00:48:34 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org
Cc: ryan.roberts@arm.com,
	david@redhat.com,
	willy@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	jannh@google.com,
	anshuman.khandual@arm.com,
	peterx@redhat.com,
	joey.gouly@arm.com,
	ioworker0@gmail.com,
	baohua@kernel.org,
	kevin.brodsky@arm.com,
	quic_zhenhuah@quicinc.com,
	christophe.leroy@csgroup.eu,
	yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	hughd@google.com,
	yang@os.amperecomputing.com,
	ziy@nvidia.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v3 0/5] Optimize mprotect() for large folios
Date: Mon, 19 May 2025 13:18:19 +0530
Message-Id: <20250519074824.42909-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_004842_850094_90FAE690 
X-CRM114-Status: GOOD (  11.07  )
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

This patchset optimizes the mprotect() system call for large folios
by PTE-batching.

We use the following test cases to measure performance, mprotect()'ing
the mapped memory to read-only then read-write 40 times:

Test case 1: Mapping 1G of memory, touching it to get PMD-THPs, then
pte-mapping those THPs
Test case 2: Mapping 1G of memory with 64K mTHPs
Test case 3: Mapping 1G of memory with 4K pages

Average execution time on arm64, Apple M3:
Before the patchset:
T1: 7.9 seconds   T2: 7.9 seconds   T3: 4.2 seconds

After the patchset:
T1: 2.1 seconds   T2: 2.2 seconds   T3: 4.3 seconds

Observing T1/T2 and T3 before the patchset, we also remove the regression
introduced by ptep_get() on a contpte block. And, for large folios we get
an almost 74% performance improvement, albeit the trade-off being a slight
degradation in the small folio case.

Here is the test program:

 #define _GNU_SOURCE
 #include <sys/mman.h>
 #include <stdlib.h>
 #include <string.h>
 #include <stdio.h>
 #include <unistd.h>

 #define SIZE (1024*1024*1024)

unsigned long pmdsize = (1UL << 21);
unsigned long pagesize = (1UL << 12);

static void pte_map_thps(char *mem, size_t size)
{
	size_t offs;
	int ret = 0;


	/* PTE-map each THP by temporarily splitting the VMAs. */
	for (offs = 0; offs < size; offs += pmdsize) {
		ret |= madvise(mem + offs, pagesize, MADV_DONTFORK);
		ret |= madvise(mem + offs, pagesize, MADV_DOFORK);
	}

	if (ret) {
		fprintf(stderr, "ERROR: mprotect() failed\n");
		exit(1);
	}
}

int main(int argc, char *argv[])
{
	char *p;
        int ret = 0;
	p = mmap((1UL << 30), SIZE, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
	if (p != (1UL << 30)) {
		perror("mmap");
		return 1;
	}



	memset(p, 0, SIZE);
	if (madvise(p, SIZE, MADV_NOHUGEPAGE))
		perror("madvise");
	explicit_bzero(p, SIZE);
	pte_map_thps(p, SIZE);

	for (int loops = 0; loops < 40; loops++) {
		if (mprotect(p, SIZE, PROT_READ))
			perror("mprotect"), exit(1);
		if (mprotect(p, SIZE, PROT_READ|PROT_WRITE))
			perror("mprotect"), exit(1);
		explicit_bzero(p, SIZE);
	}
}

The patchset is rebased onto mm-unstable (9ead4336d7c07f085def6ab372245640a22af5bd).

v2->v3:
 - Add comments for the new APIs (Ryan, Lorenzo)
 - Instead of refactoring, use a "skip_batch" label
 - Move arm64 patches at the end (Ryan)
 - In can_change_pte_writable(), check AnonExclusive page-by-page (David H)
 - Resolve implicit declaration; tested build on x86 (Lance Yang)

v1->v2:
 - Rebase onto mm-unstable (6ebffe676fcf: util_macros.h: make the header more resilient)
 - Abridge the anon-exclusive condition (Lance Yang)
  
Dev Jain (5):
  mm: Optimize mprotect() by batch-skipping PTEs
  mm: Add batched versions of ptep_modify_prot_start/commit
  mm: Optimize mprotect() by PTE batching
  arm64: Add batched version of ptep_modify_prot_start
  arm64: Add batched version of ptep_modify_prot_commit

 arch/arm64/include/asm/pgtable.h |  10 ++
 arch/arm64/mm/mmu.c              |  21 ++++-
 include/linux/mm.h               |   7 +-
 include/linux/pgtable.h          |  79 ++++++++++++++++
 mm/mprotect.c                    | 154 +++++++++++++++++++++++++------
 mm/pgtable-generic.c             |  16 +++-
 6 files changed, 246 insertions(+), 41 deletions(-)

-- 
2.30.2


