Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F17ECCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 06:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W6RPq6GKgQygSy7lZFJTOQBRGa+VzCzu+Na3hE3P5i0=; b=Jdqc8Sz9J1h2uuk4NwhjW35KSc
	exkC/Jm5AolDxOzeYTI1mcCPtO8CguZgK8OnEJ1+HO9m/wfx8ZBshH36mqWGXtL6EAFHxeirGouLX
	DnpzYy3u2Q1JPMegBvKJfuSODJt2AONIiM0gruI/bDunuQVM2dXphwFlAs0KiV9oecNI5hAX1uGPe
	yQ7Xr8wg2a7lVIoFBnSKBiEhIcE9su0z7hBUU0pXQB5uidFD9ntw7gI0oV+UZSqgAVeZZRbGG5X4H
	98QnwmEBjUSmQf8EGPapsPcGgCnW4pzQgIWCdKWP1vcWOouN6rSnrZqhlNruCNJp73iWgu8uCCLjq
	eh8TdXkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFnov-00000009HKu-2DQ3;
	Mon, 03 Nov 2025 06:13:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFnot-00000009HKH-0bEr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 06:13:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A77228FA;
	Sun,  2 Nov 2025 22:13:21 -0800 (PST)
Received: from Mac.blr.arm.com (unknown [10.164.136.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D6CDA3F694;
	Sun,  2 Nov 2025 22:13:25 -0800 (PST)
From: Dev Jain <dev.jain@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: ryan.roberts@arm.com,
	rppt@kernel.org,
	shijie@os.amperecomputing.com,
	yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>,
	stable@vger.kernel.org
Subject: [PATCH] arm64/pageattr: Propagate return value from __change_memory_common
Date: Mon,  3 Nov 2025 11:43:06 +0530
Message-Id: <20251103061306.82034-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_221335_225893_2FA6BADF 
X-CRM114-Status: GOOD (  12.54  )
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

Post a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full"),
__change_memory_common has a real chance of failing due to split failure.
Before that commit, this line was introduced in c55191e96caa, still having
a chance of failing if it needs to allocate pagetable memory in
apply_to_page_range, although that has never been observed to be true.
In general, we should always propagate the return value to the caller.

Cc: stable@vger.kernel.org
Fixes: c55191e96caa ("arm64: mm: apply r/o permissions of VM areas to its linear alias as well")
Signed-off-by: Dev Jain <dev.jain@arm.com>
---
Based on Linux 6.18-rc4.

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


