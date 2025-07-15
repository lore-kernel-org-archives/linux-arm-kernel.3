Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5AFC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 04:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PRtwa/wzzR4VisK8uGb0/9+yj9opW6ILFoF3QMmI7uQ=; b=i9nzALfFgexliYbDk4KVcWWWJd
	wTnZKEbX3w3yoPmLsDhEFENlO59EgG57a1cLvgAXjXX5AZGemeJB9RU+6dnNuyWLV0dO4UDI6b9O5
	5gvkZCioRt/STi2NzKEceP9RyFVc6E2G3KqrvMyOb2T+mq1PxDa7Fl2YVLAzj90E3xeA+QNAYQal8
	Fd23feDlSle64xy5xHH36BPEIZeAAq4jQ1ONrfKT3hWOhcy2tWj0895+cgZJBgVxrtuNdbxVCvshK
	NxEV1CLJsL6QkkfSLoITPixQigN+TWnP+YnCdwWb94qyqr2oIxIclah1odK1BWjqmA2DRPGKgAJMI
	tHkdzvzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXe3-0000000432w-1m6r;
	Tue, 15 Jul 2025 04:51:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXSC-000000041tN-3PXt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 04:39:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD3551515;
	Mon, 14 Jul 2025 21:39:26 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 84E993F6A8;
	Mon, 14 Jul 2025 21:39:34 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/mm: Drop redundant addr increment in set_huge_pte_at()
Date: Tue, 15 Jul 2025 05:39:22 +0100
Message-Id: <20250715043922.57195-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_213944_893686_362B9296 
X-CRM114-Status: GOOD (  10.23  )
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

The 'addr' need not be incremented while operating on single entry basis as
BBM is not required for such updates.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/mm/hugetlbpage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 0c8737f4f2ce..1d90a7e75333 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -225,7 +225,7 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 	ncontig = num_contig_ptes(sz, &pgsize);
 
 	if (!pte_present(pte)) {
-		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
+		for (i = 0; i < ncontig; i++, ptep++)
 			__set_ptes_anysz(mm, ptep, pte, 1, pgsize);
 		return;
 	}
-- 
2.30.2


