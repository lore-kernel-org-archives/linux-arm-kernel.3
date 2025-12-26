Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B260E82CDE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 06:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2dDam6/A7wKLN/SEOzZ9mYQr/Agu3pyZVWIzX0An9W4=; b=15aPtHLpbEIE2s+BSNS74loiQl
	wwIo62XoAHS93VPWwsB1fRAliGRyA6fzbsLUMu+CgP3paBqOSeHKLypn7b7EEW4qG9s9nM9aIpRSB
	u4LvCuoiuGvJkoBGhue3IGQDhDKpnZsQKxnnOlQpySO1bYCyRiRljEzcFS5dpOqkxcpOGMgAocfnN
	db2PqyXusiKUrXLCUIzkibEVSw5nI8Jy4KzhMMkaoBxhIrL8W2Ho4xwTy4Rx2E3F/Heg+CVkWLh+b
	h1Z9PjtaI2KxDQPvPFDk/oWIo8tqghD9w4Bg0E7ZAlom1KQmcYEXOlNOucCvuMyIujtwu41UXF4si
	g30XHX0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ0zr-00000000wUE-39Rf;
	Fri, 26 Dec 2025 06:08:19 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ0zo-00000000wSc-3sfD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 06:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766729290; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=2dDam6/A7wKLN/SEOzZ9mYQr/Agu3pyZVWIzX0An9W4=;
	b=lP4GiUgTlRUS02vSyfQIKLhJuhQ1W+i9VJL08GG7myJqvKexLFDN3Iz0N+1ba4DH7bN7VmYWXLFj4rLlTkKz6HdMUFkrfs4wvbvaBfwPFvsUUmOtS6HJlQNZzs7TM0yqTZ74gN2A77rzxequHwTgeUsRIBDNJebuaR/tsJak0r8=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WvgaV-U_1766729284 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 26 Dec 2025 14:08:05 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	riel@surriel.com,
	harry.yoo@oracle.com,
	jannh@google.com,
	willy@infradead.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/5] support batch checking of references and unmapping for large folios
Date: Fri, 26 Dec 2025 14:07:54 +0800
Message-ID: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_220817_365648_32633802 
X-CRM114-Status: GOOD (  12.46  )
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

Currently, folio_referenced_one() always checks the young flag for each PTE
sequentially, which is inefficient for large folios. This inefficiency is
especially noticeable when reclaiming clean file-backed large folios, where
folio_referenced() is observed as a significant performance hotspot.

Moreover, on Arm architecture, which supports contiguous PTEs, there is already
an optimization to clear the young flags for PTEs within a contiguous range.
However, this is not sufficient. We can extend this to perform batched operations
for the entire large folio (which might exceed the contiguous range: CONT_PTE_SIZE).

Similar to folio_referenced_one(), we can also apply batched unmapping for large
file folios to optimize the performance of file folio reclamation. By supporting
batched checking of the young flags, flushing TLB entries, and unmapping, I can
observed a significant performance improvements in my performance tests for file
folios reclamation. Please check the performance data in the commit message of
each patch.

Run stress-ng and mm selftests, no issues were found.

Patch 1: Add a new generic batched PTE helper that supports batched checks of
the references for large folios.
Patch 2 - 3: Preparation patches.
patch 4: Implement the Arm64 arch-specific clear_flush_young_ptes().
Patch 5: Support batched unmapping for file large folios.

Changes from v4:
 - Fix passing the incorrect 'CONT_PTES' for non-batched APIs.
 - Rename ptep_clear_flush_young_notify() to clear_flush_young_ptes_notify() (per Ryan).
 - Fix some coding style issues (per Ryan).
 - Add reviewed tag from Ryan. Thanks.

Changes from v3:
 - Fix using an incorrect parameter in ptep_clear_flush_young_notify()
   (per Liam).

Changes from v2:
 - Rearrange the patch set (per Ryan).
 - Add pte_cont() check in clear_flush_young_ptes() (per Ryan).
 - Add a helper to do contpte block alignment (per Ryan).
 - Fix some coding style issues (per Lorenzo and Ryan).
 - Add more comments and update the commit message (per Lorenzo and Ryan).
 - Add acked tag from Barry. Thanks. 

Changes from v1:
 - Add a new patch to support batched unmapping for file large folios.
 - Update the cover letter

Baolin Wang (5):
  mm: rmap: support batched checks of the references for large folios
  arm64: mm: factor out the address and ptep alignment into a new helper
  arm64: mm: support batch clearing of the young flag for large folios
  arm64: mm: implement the architecture-specific
    clear_flush_young_ptes()
  mm: rmap: support batched unmapping for file large folios

 arch/arm64/include/asm/pgtable.h | 23 ++++++++----
 arch/arm64/mm/contpte.c          | 62 ++++++++++++++++++++------------
 include/linux/mmu_notifier.h     |  9 ++---
 include/linux/pgtable.h          | 31 ++++++++++++++++
 mm/rmap.c                        | 38 ++++++++++++++++----
 5 files changed, 125 insertions(+), 38 deletions(-)

-- 
2.47.3


