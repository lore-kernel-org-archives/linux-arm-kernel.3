Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE00E77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 17:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qbctXXUEYmaglYdoEL1dDI4e28aFyWpnLTTol9RJXcY=; b=RxgrJvTXB6HzyOmFtaMRfd76ea
	1ES93Cj9ydewWvtNCZT+MgVHKKIMobcjaTsX4GFlxFrguUZbtle0CJ4vO7xfuQxdHHEGz1l77UujX
	bsOUlaEJ81w63zszj+/MUGLwpzior/beTXC99Mo2DLBZgFosBDm9LlapELVewem1k7QGLDeZEIPX+
	eug8vOos+MKhH3Ir8YOg3X+DdlzARIK9cxvenfjLqxGkZdGgU0YUfRNs/euFgmh825zj8Kdn9fdTh
	lMc3jSXfeu/0YBsV7+7cMwNpohHT/IDr3mFXd9/n634gvQXUH2ksxQDi47ooBuOJ0Tuk4lBWrZ/LO
	9MC6NNfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tItWr-0000000DRSV-2KI4;
	Wed, 04 Dec 2024 17:51:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tItVp-0000000DR04-2a8Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 17:50:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 89AE9A40F1F;
	Wed,  4 Dec 2024 17:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34785C4CECD;
	Wed,  4 Dec 2024 17:50:07 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Sasha Levin <sashal@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	David Hildenbrand <david@redhat.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH] arm64: mte: Fix copy_highpage() warning on hugetlb folios
Date: Wed,  4 Dec 2024 17:50:04 +0000
Message-Id: <20241204175004.906754-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_095009_719863_4FE4AF1B 
X-CRM114-Status: GOOD (  13.91  )
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

Commit 25c17c4b55de ("hugetlb: arm64: add mte support") improved the
copy_highpage() function to update the tags in the destination hugetlb
folio. However, when the source folio isn't tagged, the code takes the
non-hugetlb path where try_page_mte_tagging() warns as the destination
is a hugetlb folio:

  WARNING: CPU: 0 PID: 363 at arch/arm64/include/asm/mte.h:58 copy_highpage+0x1d4/0x2d8
  [...]
  pc : copy_highpage+0x1d4/0x2d8
  lr : copy_highpage+0x78/0x2d8
  [...]
  Call trace:
   copy_highpage+0x1d4/0x2d8 (P)
   copy_highpage+0x78/0x2d8 (L)
   copy_user_highpage+0x20/0x48
   copy_user_large_folio+0x1bc/0x268
   hugetlb_wp+0x190/0x860
   hugetlb_fault+0xa28/0xc10
   handle_mm_fault+0x2a0/0x2c0
   do_page_fault+0x12c/0x578
   do_mem_abort+0x4c/0xa8
   el0_da+0x44/0xb0
   el0t_64_sync_handler+0xc4/0x138
   el0t_64_sync+0x198/0x1a0

Change the check for the tagged status of the source folio so that it
does not fall through the non-hugetlb case. In addition, only perform
the copy (for the full folio) if the source page is the folio head and
warn if the destination folio is already tagged, for symmetry with the
non-hugetlb case.

Fixes: 25c17c4b55de ("hugetlb: arm64: add mte support")
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Reported-by: Sasha Levin <sashal@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Will Deacon <will@kernel.org>
Link: https://lore.kernel.org/r/Z0STR6VLt2MCalnY@sashalap
---
 arch/arm64/mm/copypage.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
index 87b3f1a25535..a86c897017df 100644
--- a/arch/arm64/mm/copypage.c
+++ b/arch/arm64/mm/copypage.c
@@ -30,11 +30,13 @@ void copy_highpage(struct page *to, struct page *from)
 	if (!system_supports_mte())
 		return;
 
-	if (folio_test_hugetlb(src) &&
-	    folio_test_hugetlb_mte_tagged(src)) {
-		if (!folio_try_hugetlb_mte_tagging(dst))
+	if (folio_test_hugetlb(src)) {
+		if (!folio_test_hugetlb_mte_tagged(src) ||
+		    from != folio_page(src, 0))
 			return;
 
+		WARN_ON_ONCE(!folio_try_hugetlb_mte_tagging(dst));
+
 		/*
 		 * Populate tags for all subpages.
 		 *

