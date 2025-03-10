Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3517AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 06:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V4MZOMVQb7z0Lw8lq4tC+wIrKhLevavQt2BkxuMR25E=; b=AmgUZ+0XXXwbrITxr34Y0Rl3UC
	X+8WZqm7SsYQmCaeoSBM2kJ1NV2EcbCwSExYyIzCukeePtgNYSNVUqmlh/LrVfgFSIvnMTnvWbDUx
	fXAHaWi2BqkhSnkZ87d5yQYXzB6JUXj+O7/yO9sq3cSDOq5V7jJwjzeh/H50vbhVZxVJG5YTPt8/H
	7USQE1b4JB6ff+dhGQGkv5yVPrdi0oI7RZa25BeBRM8wokdxd3A5de1s8QzzmG23nD6PDvvU4UZCB
	TuTkK9y/BqwbzpQ1EGQ/aaNZPA6GfV6mLgiTSApSDUP7hzBs7L2ZetShGW6YnCCnlh+CT24siyjAh
	jDngRWVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trWeZ-00000001e2e-40eW;
	Mon, 10 Mar 2025 06:30:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trWcx-00000001dy0-3slR
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Mar 2025 06:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=V4MZOMVQb7z0Lw8lq4tC+wIrKhLevavQt2BkxuMR25E=; b=Wc5oheEDXi9M0il7QEvTc3Im5K
	O7GHzqHRY2JWhWuTti4ZFq79ALyO4OpLKasehY8M4z4xAhL1p+dwE/9Q2pJ2o6PU9K8QjZk8x2A+7
	vOMaTpDFn/zqjkeE7FMy8dfbQuDayzGsTky0XLa6Yp+Z7/wej3my8ZGOlSfTrfNKztwA2qSwcr0Xt
	6K3GEtDTZYUdBK4sNvWz0M2fv1kpBgRYCVr3eqaND3o/WsD1Xtc2mJZVmldZuGAkx1UuDTEL3PelV
	VD84z5CxNaskvTDje3Y5n78eLKanJquDAe8K6337tv7zECskZ2ZVbOmTP+ClhZw1HRkATxY2FFe5h
	KlN0iSAQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trWcr-00000001noH-3Rxg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 06:28:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8654415A1;
	Sun,  9 Mar 2025 23:28:37 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.42.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 46F523F673;
	Sun,  9 Mar 2025 23:28:22 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] arm64/mm: Create level specific section mappings in map_range()
Date: Mon, 10 Mar 2025 11:58:12 +0530
Message-Id: <20250310062812.216031-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_062834_090709_06DFAB3D 
X-CRM114-Status: GOOD (  14.29  )
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

Currently PMD section mapping mask i.e PMD_TYPE_SECT is used while creating
section mapping at all page table levels except the last level. This works
fine as the section mapping masks are exactly the same (0x1UL) for all page
table levels.

This will change in the future with D128 page tables that have unique skip
level values (SKL) required for creating section mapping at different page
table levels. Hence use page table level specific section mapping macros
instead of the common PMD_TYPE_SECT. While here also ensure that a section
mapping is only created on page table levels which could support that on a
given page size configuration otherwise fall back to create table entries.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.14-rc6

Changes in V2:

- Dropped PGD_TYPE_SECT macro and its instance from map_range()
- Create table entries on levels where section mapping is not possible

Changes in V1:

https://lore.kernel.org/all/20250303041834.2796751-1-anshuman.khandual@arm.com/

 arch/arm64/kernel/pi/map_range.c | 38 +++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
index 2b69e3beeef8..25a70c675c4d 100644
--- a/arch/arm64/kernel/pi/map_range.c
+++ b/arch/arm64/kernel/pi/map_range.c
@@ -11,6 +11,22 @@
 
 #include "pi.h"
 
+static bool sect_supported(int level)
+{
+	switch (level) {
+	case -1:
+		return false;
+	case 0:
+		if (IS_ENABLED(CONFIG_ARM64_16K_PAGES) ||
+		    IS_ENABLED(CONFIG_ARM64_64K_PAGES))
+			return false;
+		else
+			return true;
+	default:
+		return true;
+	}
+}
+
 /**
  * map_range - Map a contiguous range of physical pages into virtual memory
  *
@@ -44,13 +60,29 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
 	 * Set the right block/page bits for this level unless we are
 	 * clearing the mapping
 	 */
-	if (protval)
-		protval |= (level < 3) ? PMD_TYPE_SECT : PTE_TYPE_PAGE;
+	if (protval && sect_supported(level)) {
+		switch (level) {
+		case 3:
+			protval |= PTE_TYPE_PAGE;
+			break;
+		case 2:
+			protval |= PMD_TYPE_SECT;
+			break;
+		case 1:
+			protval |= PUD_TYPE_SECT;
+			break;
+		case 0:
+			protval |= P4D_TYPE_SECT;
+			break;
+		default:
+			break;
+		}
+	}
 
 	while (start < end) {
 		u64 next = min((start | lmask) + 1, PAGE_ALIGN(end));
 
-		if (level < 3 && (start | next | pa) & lmask) {
+		if ((level < 3 && (start | next | pa) & lmask) || !sect_supported(level)) {
 			/*
 			 * This chunk needs a finer grained mapping. Create a
 			 * table mapping if necessary and recurse.
-- 
2.25.1


