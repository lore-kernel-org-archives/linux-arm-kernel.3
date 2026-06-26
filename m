Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D747DCDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 01:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4QZCW2WD0I1Ud179ax0zyVCkwMcWKW49HjCpVJb+pkw=; b=mKyXMp4h7v8S+r4zh61dyyZKlX
	wODXGjYQG7K4jh21cgQfGh4TF81sYgeh2pJ6YKX+MMoQcuY4QGddmmhvxxE9MoldloZEXhjnTbLXU
	e7sSURE0PluKrv+uCfCRkiv6uC7lp5Hq9NnHlZRUCW/2CpYTtONd+m9BkNrCvy+y6B5pEEhjJ6fW6
	3mBOPPDsLazNT947l4ascJavOSsfvHXEoJRxkq33ZrWioAUXssqdME6HBm1M2zyi/pi9rlMq5t9vM
	DhKsstbaO1JtRy0Mf30NBCgNierKICQkn3soLr9DXbzHkwtutow89OXHgJFoed2PNx7n0TxNiKOyc
	yZzv+flQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcvNQ-0000000A5Jk-0XQE;
	Fri, 26 Jun 2026 01:29:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcvNM-0000000A5J4-0VnG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 01:29:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE98222F8;
	Thu, 25 Jun 2026 18:28:52 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.2.208.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 417B23F905;
	Thu, 25 Jun 2026 18:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782437337; bh=LAjGyH45anWhF4mbgZr6YtXceXC2SIVSd+wfQJBLzek=;
	h=From:To:Cc:Subject:Date:From;
	b=LtOm2Slg7RHXFbaZ6bGQEtwNAkV2zbruaWUuZ6hU029o8y2W6YtXK6XNY+e36SJQ4
	 sSrplXcDAXvTfGNoFRwjGgurqvTRvZv1Du0qiv/sn6JEbTLz0FaSHvEvMtQXzbp9TE
	 PW572ylQaXyh1DNqarsMmVoiubr8iiYVl+SUF8yQ=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	linux-kernel@vger.kernel.org,
	Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH] arm64/mm: Optimize TLB flush in unmap_hotplug_[pmd|pud]_range()
Date: Fri, 26 Jun 2026 02:28:45 +0100
Message-Id: <20260626012845.475959-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_182900_399557_CD7CB23D 
X-CRM114-Status: GOOD (  10.99  )
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

flush_tlb_kernel_range() could flush down an entire block mapping just with
a single PAGE_SIZE stride. This capability was being used umapping PMD and
PUD based block mappings in unmap_hotplug_[pmd|pud]_range().

But later on the commit 48478b9f7913
("arm64/mm: Enable batched TLB flush in unmap_hotplug_range()") replaced
this PAGE_SIZE stride with [PMD|PUD]_SIZE strides, hence forcing multiple
PAGE_SIZE stride based TLB flushes on platforms where TLB range operation
is not supported. Revert back to the earlier TLB behaviour along with the
required comments that were dropped earlier.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: David Hildenbrand <david@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Reported-by: Ben Hutchings <ben@decadent.org.uk>
Closes: https://lore.kernel.org/all/b0d5836032ce3135bfc473f6bff791306d086925.camel@decadent.org.uk/
Fixes: 48478b9f7913 ("arm64/mm: Enable batched TLB flush in unmap_hotplug_range()")
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/mm/mmu.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 8242f93f05e4..5ff0041f4a5f 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1509,7 +1509,11 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
 			if (free_mapped) {
 				/* CONT blocks are not supported in the vmemmap */
 				WARN_ON(pmd_cont(pmd));
-				flush_tlb_kernel_range(addr, addr + PMD_SIZE);
+				/*
+				 * One TLBI should be sufficient here as the PMD_SIZE
+				 * range is mapped with a single block entry.
+				 */
+				flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 				free_hotplug_page_range(pmd_page(pmd),
 							PMD_SIZE, altmap);
 			}
@@ -1539,7 +1543,11 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
 		if (pud_leaf(pud)) {
 			pud_clear(pudp);
 			if (free_mapped) {
-				flush_tlb_kernel_range(addr, addr + PUD_SIZE);
+				/*
+				 * One TLBI should be sufficient here as the PUD_SIZE
+				 * range is mapped with a single block entry.
+				 */
+				flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 				free_hotplug_page_range(pud_page(pud),
 							PUD_SIZE, altmap);
 			}
-- 
2.30.2


