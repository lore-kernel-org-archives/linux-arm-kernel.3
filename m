Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A4CC02181
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jan 2025 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qlku4dtLamneeeUsbG60Xs5YhFOYT3vfBFK5fL3C5UQ=; b=XybB3KC73BC48tdZkSrEx2FyQK
	TO7BOeRigUyRLv7fkyYBxf/Fv6jK0HPL6FMUMOWgAdwt753sbmYqiua1121AIhMqMoVjmfU7rtH57
	G6UUwuB8n0/2hdPVvMbUYX7Ksppdeu92Jk51ajxM6E++bE+7gT11BkbCQMbekhUulY3rCRaPxS5gY
	5P1jG3yF8BoOre/wg1OKlgzYDvIf+n34a73OdWxxAKs0OWK8a/oUT90sU8wRPOyZPQUpBupzWsDXD
	TAzr4XlUmXCCL6KWoaCBLRNELwJfsZ6sjg9cQXqEetmKU2lzZmIS9eVIeYiGhW6Ro1FJ5Aj7liVpq
	dw02cXFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc407-0000000HUdK-33qX;
	Sun, 26 Jan 2025 14:52:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc3wk-0000000HTaa-3VsV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jan 2025 14:49:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 05397A403CF;
	Sun, 26 Jan 2025 14:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45101C4CED3;
	Sun, 26 Jan 2025 14:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737902949;
	bh=0XLn9vLxHEA2FrYvLm2zGqF8thjMeVk2zB+P6BMOENg=;
	h=From:To:Cc:Subject:Date:From;
	b=ATWzxJNDf/t2qP4yqsHH7lxZnVOVjh6HAfx9uoiaMyNk5A6FWJCD8GoI6Unn95vD+
	 vBk/Dhpq3W8ma/6cQXVneOTXCpc5oh1NYIhzI99mv3Ado1MM1nuqqXFh3YjXth9oqZ
	 +eu3pnSb2uY94imCULfE5+2ai/tiI4e7NQVf2urIsOcY/jgZ056FMz95iIP50eN5/5
	 R0v3eGsE8QnZD6gRqPjJVpvsdmTz6lMkfzadJuZRRzh4JYbUrZWmUtZN282I8FupPg
	 rBJFKzYvazbxh6igR5B5zrOc8xYkaateo4gJK5Qbttt2OjgEB88AlZeblcIvHa5js7
	 L7HN2VXKQKS1g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Gavin Shan <gshan@redhat.com>,
	Sasha Levin <sashal@kernel.org>,
	akpm@linux-foundation.org,
	peterx@redhat.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH AUTOSEL 6.6 1/5] arm64/mm: Ensure adequate HUGE_MAX_HSTATE
Date: Sun, 26 Jan 2025 09:49:02 -0500
Message-Id: <20250126144906.925468-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.74
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_064910_938519_CA12064E 
X-CRM114-Status: UNSURE (   9.81  )
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

From: Anshuman Khandual <anshuman.khandual@arm.com>

[ Upstream commit 1e5823c8e86de83a43d59a522b4de29066d3b306 ]

This asserts that HUGE_MAX_HSTATE is sufficient enough preventing potential
hugetlb_max_hstate runtime overflow in hugetlb_add_hstate() thus triggering
a BUG_ON() there after.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Link: https://lore.kernel.org/r/20241202064407.53807-1-anshuman.khandual@arm.com
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/mm/hugetlbpage.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 13fd592228b18..a5e1588780b2c 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -526,6 +526,18 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 
 static int __init hugetlbpage_init(void)
 {
+	/*
+	 * HugeTLB pages are supported on maximum four page table
+	 * levels (PUD, CONT PMD, PMD, CONT PTE) for a given base
+	 * page size, corresponding to hugetlb_add_hstate() calls
+	 * here.
+	 *
+	 * HUGE_MAX_HSTATE should at least match maximum supported
+	 * HugeTLB page sizes on the platform. Any new addition to
+	 * supported HugeTLB page sizes will also require changing
+	 * HUGE_MAX_HSTATE as well.
+	 */
+	BUILD_BUG_ON(HUGE_MAX_HSTATE < 4);
 	if (pud_sect_supported())
 		hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
 
-- 
2.39.5


