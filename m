Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED357C282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 15:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zq+cpplVIbdafYmKh04Zm3BYxIpGtlL4VcJXVKSI9kY=; b=P6nVrX3zxVnGwel4ICkiJb/FM/
	YaEoFj6pUOcIelehlm2cqZFx/CTxS3P3ku+yaZAm8zwVVvBjYvfyUohOKQg09NGkrys07e+PdKKmB
	v/0ngP33dbBytDM/u2SHSFuERLWdRNfEOduKzxW3IBn/4Iu68m5/+nyYbVJntINy+SkrkM7d9p3Bu
	IW04CoxuvG9GoiuH1/H1wXpkSujqzjafIj3J1lXbib7I3QV/6e3A0K3FVqdfv+i4rrKBbA8vyczB0
	YBv27i2ZDRsqomK72/ExXCf6yKW76I7fl14uHfVqEkhAl8U5UZ3usnAwaxFeqN6CkVsKwIrnbDyI5
	ppQVsA7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUIW-00000005Eh5-2WTC;
	Tue, 04 Mar 2025 15:35:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTpW-000000057Xj-1Qg6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:05:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B52451007;
	Tue,  4 Mar 2025 07:05:23 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EEE23F66E;
	Tue,  4 Mar 2025 07:05:08 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/11] mm/vmalloc: Warn on improper use of vunmap_range()
Date: Tue,  4 Mar 2025 15:04:37 +0000
Message-ID: <20250304150444.3788920-8-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304150444.3788920-1-ryan.roberts@arm.com>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_070510_425393_B923F2EE 
X-CRM114-Status: GOOD (  13.79  )
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

A call to vmalloc_huge() may cause memory blocks to be mapped at pmd or
pud level. But it is possible to subsequently call vunmap_range() on a
sub-range of the mapped memory, which partially overlaps a pmd or pud.
In this case, vmalloc unmaps the entire pmd or pud so that the
no-overlapping portion is also unmapped. Clearly that would have a bad
outcome, but it's not something that any callers do today as far as I
can tell. So I guess it's just expected that callers will not do this.

However, it would be useful to know if this happened in future; let's
add a warning to cover the eventuality.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 mm/vmalloc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index a6e7acebe9ad..fcdf67d5177a 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -374,8 +374,10 @@ static void vunmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
 		if (cleared || pmd_bad(*pmd))
 			*mask |= PGTBL_PMD_MODIFIED;
 
-		if (cleared)
+		if (cleared) {
+			WARN_ON(next - addr < PMD_SIZE);
 			continue;
+		}
 		if (pmd_none_or_clear_bad(pmd))
 			continue;
 		vunmap_pte_range(pmd, addr, next, mask);
@@ -399,8 +401,10 @@ static void vunmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
 		if (cleared || pud_bad(*pud))
 			*mask |= PGTBL_PUD_MODIFIED;
 
-		if (cleared)
+		if (cleared) {
+			WARN_ON(next - addr < PUD_SIZE);
 			continue;
+		}
 		if (pud_none_or_clear_bad(pud))
 			continue;
 		vunmap_pmd_range(pud, addr, next, mask);
-- 
2.43.0


