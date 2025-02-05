Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC9FC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 15:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xq0gzkQCuzS6qPgu3GdElgorB/nMOeYTLDAAFULqJX0=; b=havFpCxHg8y7X25EXwXlDtoGOA
	qs9GKOqwEcZz1HAi5yDcM3O2S4qZWb5Pj/W4/Z1oRByFXTohGuDsRzPbXa/VcjF8QYWMezdQUK1bW
	AsvCiOYQnot7TK5UR7IFSK4jZ3oaw7BC8d0aUmjZfbPv5Ca6FMLLpPk9lypitJXFsOxxntQrUsEZW
	qwM9XuqaEbQKYjjMSb7oWMJgu0LJHC/L9SUmRurQmzUXBcYDysEQnrFLumcXEZcWfz1lmQRLt8aeM
	TWFqo4qJU5ZZFi/rYTvktBukYDrDbFDiMccJl9T/c1ZpR/TLA8/pC9zCTwrCtbw5OYKsLKSbYcYbj
	7Ie60cIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfh8G-00000003jDt-2Z5q;
	Wed, 05 Feb 2025 15:16:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfh2y-00000003i7T-0YD9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 15:10:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FB141C01;
	Wed,  5 Feb 2025 07:10:59 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 242593F5A1;
	Wed,  5 Feb 2025 07:10:33 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Steve Capper <steve.capper@linaro.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1 03/16] arm64: hugetlb: Fix flush_hugetlb_tlb_range() invalidation level
Date: Wed,  5 Feb 2025 15:09:43 +0000
Message-ID: <20250205151003.88959-4-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205151003.88959-1-ryan.roberts@arm.com>
References: <20250205151003.88959-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_071036_212015_9CE8EE0C 
X-CRM114-Status: GOOD (  11.69  )
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

commit c910f2b65518 ("arm64/mm: Update tlb invalidation routines for
FEAT_LPA2") changed the "invalidation level unknown" hint from 0 to
TLBI_TTL_UNKNOWN (INT_MAX). But the fallback "unknown level" path in
flush_hugetlb_tlb_range() was not updated. So as it stands, when trying
to invalidate CONT_PMD_SIZE or CONT_PTE_SIZE hugetlb mappings, we will
spuriously try to invalidate at level 0 on LPA2-enabled systems.

Fix this so that the fallback passes TLBI_TTL_UNKNOWN, and while we are
at it, explicitly use the correct stride and level for CONT_PMD_SIZE and
CONT_PTE_SIZE, which should provide a minor optimization.

Cc: <stable@vger.kernel.org>
Fixes: c910f2b65518 ("arm64/mm: Update tlb invalidation routines for FEAT_LPA2")
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/hugetlb.h | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index 03db9cb21ace..8ab9542d2d22 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -76,12 +76,20 @@ static inline void flush_hugetlb_tlb_range(struct vm_area_struct *vma,
 {
 	unsigned long stride = huge_page_size(hstate_vma(vma));
 
-	if (stride == PMD_SIZE)
-		__flush_tlb_range(vma, start, end, stride, false, 2);
-	else if (stride == PUD_SIZE)
-		__flush_tlb_range(vma, start, end, stride, false, 1);
-	else
-		__flush_tlb_range(vma, start, end, PAGE_SIZE, false, 0);
+	switch (stride) {
+	case PUD_SIZE:
+		__flush_tlb_range(vma, start, end, PUD_SIZE, false, 1);
+		break;
+	case CONT_PMD_SIZE:
+	case PMD_SIZE:
+		__flush_tlb_range(vma, start, end, PMD_SIZE, false, 2);
+		break;
+	case CONT_PTE_SIZE:
+		__flush_tlb_range(vma, start, end, PAGE_SIZE, false, 3);
+		break;
+	default:
+		__flush_tlb_range(vma, start, end, PAGE_SIZE, false, TLBI_TTL_UNKNOWN);
+	}
 }
 
 #endif /* __ASM_HUGETLB_H */
-- 
2.43.0


