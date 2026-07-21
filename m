Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACE8C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 19:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65iu+fvv6zg80Z2TEtDP0fDG9xB3qx2rnoHkZO/RyA8=; b=vnQbd4p7UB5OBOrpTa2yd0Lwxo
	y9MJiG7UvRGcIFv3XScN8zgEv2DkiWAB+I6kz1+3LyrDlvcpB1uD9NPmDwccTl/323gTVGAHiFmu7
	7mWniWSqdZrfNCPCcZ5ncvgTCO+8hNszS0ybHlwgS3XhIflps1yrW54KJjB410tO39PJ4EP8grBA3
	ceb96oPbSLUj1UqveizBaErA9dij9uc5BUYeU0YvuR60QoMIfSz240Z/AcelkPNrN+Ca0nBCCkJYK
	KaXVR0fqHRR5bT3y8Hk4ORc3XqhLS3+WoHP7HkOHDZ92BegOVA+ey9+jEaJllJdR1wrHQD2eoJCup
	WwA2LXkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGRE-0000000AJG5-3vCc;
	Tue, 21 Jul 2026 19:47:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGRE-0000000AJFz-1Hiv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 19:47:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B28BF60A5A;
	Tue, 21 Jul 2026 19:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2B41F000E9;
	Tue, 21 Jul 2026 19:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784663255;
	bh=65iu+fvv6zg80Z2TEtDP0fDG9xB3qx2rnoHkZO/RyA8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bLzYBqZxvYWoG0KG0AbvgjMGGA+6I2rBc2wyJ09UWl6zhZbAZ8ZJ16MucpdBrOaFE
	 Xe2vVWlSXZo19F8x8i88IlRUDsxuWMltA88Os3xrsCJ7GdwPEAt/a1UyoTyDzBSHjJ
	 K1lnzZCngMXfszWzKR5Yc3cRBGNt4AHuw2DxjtFU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ben Hutchings <ben@decadent.org.uk>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.12 0755/1276] arm64/mm: Optimize TLB flush in unmap_hotplug_[pmd|pud]_range()
Date: Tue, 21 Jul 2026 17:19:58 +0200
Message-ID: <20260721152502.972518391@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721152446.065700225@linuxfoundation.org>
References: <20260721152446.065700225@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

6.12-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Anshuman Khandual <anshuman.khandual@arm.com>

[ Upstream commit ff4c5a0de1f2ef7737a8688a86e19301e567020d ]

Commit 48478b9f7913 ("arm64/mm: Enable batched TLB flush in
unmap_hotplug_range") inadvertently introduced redundant TLB
invalidation when clearing a block entry, resulting in unnecessary
broadcast invalidation on CPUs without support for range-based
invalidation.

Re-introduce the old behaviour, along with some expanded comments to
help people working in this area next time around.

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
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
[will: Reword comments and commit message]
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/mm/mmu.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 872227e4fada7f..2b5e0ccc0af555 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -900,7 +900,13 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
 			if (free_mapped) {
 				/* CONT blocks are not supported in the vmemmap */
 				WARN_ON(pmd_cont(pmd));
-				flush_tlb_kernel_range(addr, addr + PMD_SIZE);
+				/*
+				 * Invalidating a block entry requires just
+				 * a single overlapping TLB invalidation,
+				 * so limit the range of the flush to a single
+				 * page.
+				 */
+				flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 				free_hotplug_page_range(pmd_page(pmd),
 							PMD_SIZE, altmap);
 			}
@@ -930,7 +936,8 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
 		if (pud_sect(pud)) {
 			pud_clear(pudp);
 			if (free_mapped) {
-				flush_tlb_kernel_range(addr, addr + PUD_SIZE);
+				/* See comment in unmap_hotplug_pmd_range(). */
+				flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 				free_hotplug_page_range(pud_page(pud),
 							PUD_SIZE, altmap);
 			}
-- 
2.53.0




