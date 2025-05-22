Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B11C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 11:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=01PjEPpcuZs1iJtzlEcbcVU6mRxNqu+hYO/XH56s0BU=; b=WSnAveY1c9zHVBz8DkFqDbae1I
	UXgjoI0GTI/R1VaGQrFjHB0PRcLt29+OQ2mButPvBt1tY58fGHr+Arx0RjxG+Iduharyq6qDBxipm
	WCkqyysAN3fffB8RBRaH8z5xHafbj7onmcsyLO0h5oKYJIG2fLENr5zWU7mBb8pWZ2vmruisUuAeo
	2+Wq3ue6dLh86qRseXdJE7Ik2xeYbyUgl8rsLOe1ZbwScyl6BLZeKrJJLdxrq946Zb1X2vuF603b9
	KRZ1RmUGW6KHSQ4GOwHOhHB4VbkW520oA7PuVkTeY9dOMQDAGewidEpNoTKV+B6bXwV69d4KUhU+d
	2wG4KVgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI4Ni-00000000u96-0iCZ;
	Thu, 22 May 2025 11:46:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI4Lc-00000000tjX-0bc2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 11:44:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FE301756;
	Thu, 22 May 2025 04:44:11 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.163.82.136])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CDE793F673;
	Thu, 22 May 2025 04:44:20 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mark.rutland@arm.com,
	anshuman.khandual@arm.com,
	yang@os.amperecomputing.com,
	wangkefeng.wang@huawei.com,
	yangyicong@hisilicon.com,
	baohua@kernel.org,
	pjaroszynski@nvidia.com,
	ardb@kernel.org,
	david@redhat.com,
	Dev Jain <dev.jain@arm.com>
Subject: [RFC PATCH] arm64: Elide dsb in kernel TLB invalidations
Date: Thu, 22 May 2025 17:14:14 +0530
Message-Id: <20250522114414.72322-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_044428_223244_338FBAEE 
X-CRM114-Status: UNSURE (   9.54  )
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

dsb(ishst) is used to ensure that prior pagetable updates are completed.
But, set_pmd/set_pud etc already issue a dsb-isb sequence for the exact
same purpose. Therefore, we can elide the dsb in kernel tlb invalidation.

There were no issues observed while running mm selftests, including
test_vmalloc.sh selftest to stress the vmalloc subsystem.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index eba1a98657f1..9b4adf1ee45e 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -508,7 +508,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
 		return;
 	}
 
-	dsb(ishst);
+	/* dsb(ishst) not needed as callers (set_pxd) have that */
 	__flush_tlb_range_op(vaale1is, start, pages, stride, 0,
 			     TLBI_TTL_UNKNOWN, false, lpa2_is_enabled());
 	dsb(ish);
@@ -523,7 +523,7 @@ static inline void __flush_tlb_kernel_pgtable(unsigned long kaddr)
 {
 	unsigned long addr = __TLBI_VADDR(kaddr, 0);
 
-	dsb(ishst);
+	/* dsb(ishst) not needed as callers (set_pxd) have that */
 	__tlbi(vaae1is, addr);
 	dsb(ish);
 	isb();
-- 
2.30.2


