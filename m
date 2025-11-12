Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44562CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 06:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jnDM7QJ984SDs4XxKndYr6mBGqXlMC0t/TUhqM7AZQ=; b=DR00+RD91OPC/QR0rc+ABSHaL9
	msjrJeBDf+RNNF9mGRKe7YY0488foYe4+QZf69szTT2aXTN4qeDIYYbipXZvIEg6PYTdE/Fblxh+0
	nxSrXR8KL+4Lr/AQxdpcyOqQMZ/iH11F6rsdUU6NZiCT1Gff9kg5DXXe2YbOk0pprRv0q/PUe/RCo
	EfIRmtV1zCFCWVfNFdKEH/G5xl62sVHzKnkYXHh6JNnViQlMcbbytIbZcqhc1btbvGDig6UtdIRJ/
	9f4Y7OC1DWnw+pmUG9b3PoBsEiE8qlTuGmWh6B9GFqPor0+uFUM8pUIBnLTrAzBiJJv4erwpA0wJr
	afEq6sZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ4KP-00000008C7b-1TU2;
	Wed, 12 Nov 2025 06:27:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ4KN-00000008C6s-0xrl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 06:27:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A14131515;
	Tue, 11 Nov 2025 22:27:26 -0800 (PST)
Received: from MacBook-Pro.blr.arm.com.com (unknown [10.164.18.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3842E3F5A1;
	Tue, 11 Nov 2025 22:27:30 -0800 (PST)
From: Dev Jain <dev.jain@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: ryan.roberts@arm.com,
	rppt@kernel.org,
	shijie@os.amperecomputing.com,
	yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH 1/2] arm64/pageattr: Propagate return value from __change_memory_common
Date: Wed, 12 Nov 2025 11:57:15 +0530
Message-Id: <20251112062716.64801-2-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20251112062716.64801-1-dev.jain@arm.com>
References: <20251112062716.64801-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_222735_328588_AE9EADBF 
X-CRM114-Status: GOOD (  11.56  )
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

The rodata=on security measure requires that any code path which does
vmalloc -> set_memory_ro/set_memory_rox must protect the linear map alias
too. Therefore, if such a call fails, we must abort set_memory_* and caller
must take appropriate action; currently we are suppressing the error, and
there is a real chance of such an error arising post commit a166563e7ec3
("arm64: mm: support large block mapping when rodata=full"). Therefore,
propagate any error to the caller.

Fixes: a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full")
Signed-off-by: Dev Jain <dev.jain@arm.com>
---
v1 of this patch: https://lore.kernel.org/all/20251103061306.82034-1-dev.jain@arm.com/
I have dropped stable since no real chance of failure was there.

 arch/arm64/mm/pageattr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 5135f2d66958..b4ea86cd3a71 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -148,6 +148,7 @@ static int change_memory_common(unsigned long addr, int numpages,
 	unsigned long size = PAGE_SIZE * numpages;
 	unsigned long end = start + size;
 	struct vm_struct *area;
+	int ret;
 	int i;
 
 	if (!PAGE_ALIGNED(addr)) {
@@ -185,8 +186,10 @@ static int change_memory_common(unsigned long addr, int numpages,
 	if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
 			    pgprot_val(clear_mask) == PTE_RDONLY)) {
 		for (i = 0; i < area->nr_pages; i++) {
-			__change_memory_common((u64)page_address(area->pages[i]),
+			ret = __change_memory_common((u64)page_address(area->pages[i]),
 					       PAGE_SIZE, set_mask, clear_mask);
+			if (ret)
+				return ret;
 		}
 	}
 
-- 
2.30.2


