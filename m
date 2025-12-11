Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93C3D41C05
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 08:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F7ZBUFth2QS91MsUVzia8UnQfPYwaqtJvLrEI1PCTTw=; b=4YE1lvp14TO0mMj6R8dr1FiZUx
	IKKb5SDJTeVMc7PdFhfozTUqOe1exX9of1SNV3zi9f4sTjzEJbVV8PtK11Vb96Yn1kabEdtUDD5S9
	H5n786SWArQARUdetZmlG/BsknkxKUkrwdEv/FdeF2pA/xFOXpYbYHZAum6rmS1Tn844PhEOyBLbF
	RssfUiNQBvl0FTgd7oisWc0dkSsjjlfRkzyd7cJtLOZ69eVFwx94noz24gB24IJ9Idw+K6GhNsN9C
	j6pnbYOPhLEXcPMG54pwIBBO3T2QDiboT5Z6GEgH+8l98cHq8HnB9Uhcyxzs9CJT5ZZXhGMKXWLZh
	gJjB+Q4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTbrW-0000000GMz8-2G0O;
	Thu, 11 Dec 2025 08:17:22 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTbrT-0000000GMxf-0URH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 08:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1765441031; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=F7ZBUFth2QS91MsUVzia8UnQfPYwaqtJvLrEI1PCTTw=;
	b=BkXQniJSXLcChS265vqghd45l7wNsRgJK6LYS81iEDCPRKxk8cjU1tptEGK1NJ2wzn8e8A8vTySyBPx8AiWqOoGpNTqOPE1p88U0ZWqAhK0yLRsE6gQSXKUxGvYAvPAgmU6aBNPxgDJMRIJMFWcm3i1Xn3FxF8HWYzfjf0h0afQ=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WuZl4F4_1765441028 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 11 Dec 2025 16:17:09 +0800
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
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] support batch checking of references and unmapping for large folios
Date: Thu, 11 Dec 2025 16:16:53 +0800
Message-ID: <cover.1765439380.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_001719_708953_3EC2C50E 
X-CRM114-Status: UNSURE (   9.09  )
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

Changes from v1:
 - Add a new patch to support batched unmapping for file large folios.
 - Update the cover letter.

Baolin Wang (3):
  arm64: mm: support batch clearing of the young flag for large folios
  mm: rmap: support batched checks of the references for large folios
  mm: rmap: support batched unmapping for file large folios

 arch/arm64/include/asm/pgtable.h | 23 ++++++++++++-----
 arch/arm64/mm/contpte.c          | 44 ++++++++++++++++++++++----------
 include/linux/mmu_notifier.h     |  9 ++++---
 include/linux/pgtable.h          | 19 ++++++++++++++
 mm/rmap.c                        | 29 +++++++++++++++++----
 5 files changed, 96 insertions(+), 28 deletions(-)

-- 
2.47.3


