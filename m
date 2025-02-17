Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FE8C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xry47zGAchMXm/CQivW2Uq1N/cGYByLui2LKXDCBvrM=; b=Ul1MxNERuxdsvIFfXDqh2TN/kO
	IORmzeVnk7Myh9i8UIom5H7akwmVrMrGYF9xTiqeIXojPNxtra6gy1IdjT4Dr2EUtpydWoQinZeNB
	DlMTT5vXet3EN7mi6HMX4nMCCzqb3wIqigLvhwzsmgG0HZZQpEYoJiHMpXJCuP2Fwu3VRQSCRViwL
	Hb1ht+yc9JHK3iito39clS/a+GCRDqUPWU5W07x3dt7Q+d6LDZ50lunTkm8aix335KTdylGMgYUnE
	oIsI8js7XAijI/DPcAp+Gd1XmxJi4079Qky5f3BDF64T7OTJqN4sWRm9b7wXvtmrj/6SjtbMVDa2q
	2Gu347Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjv2n-00000003XEy-3HTp;
	Mon, 17 Feb 2025 06:55:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjv1K-00000003X6h-1YYa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 06:54:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AF0E1063;
	Sun, 16 Feb 2025 22:54:40 -0800 (PST)
Received: from a077893.blr.arm.com (unknown [10.162.16.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 10C463F6A8;
	Sun, 16 Feb 2025 22:54:18 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ryan.roberts@arm.com,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/hugetlb: Consistently use pud_sect_supported()
Date: Mon, 17 Feb 2025 12:24:14 +0530
Message-Id: <20250217065414.49489-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_225422_453180_29172678 
X-CRM114-Status: UNSURE (   8.11  )
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

Let's be consistent in using pud_sect_supported() for PUD_SIZE sized pages.
Hence change hugetlb_mask_last_page() and arch_make_huge_pte() as required.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.14-rc3

 arch/arm64/mm/hugetlbpage.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 98a2a0e64e25..5b7cfdba9c93 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -342,7 +342,9 @@ unsigned long hugetlb_mask_last_page(struct hstate *h)
 	switch (hp_size) {
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SIZE:
-		return PGDIR_SIZE - PUD_SIZE;
+		if (pud_sect_supported())
+			return PGDIR_SIZE - PUD_SIZE;
+		break;
 #endif
 	case CONT_PMD_SIZE:
 		return PUD_SIZE - CONT_PMD_SIZE;
@@ -364,7 +366,8 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	switch (pagesize) {
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SIZE:
-		entry = pud_pte(pud_mkhuge(pte_pud(entry)));
+		if (pud_sect_supported())
+			entry = pud_pte(pud_mkhuge(pte_pud(entry)));
 		break;
 #endif
 	case CONT_PMD_SIZE:
-- 
2.30.2


