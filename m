Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4623DC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FvbhN7L/22FEvDfiZoo/Nf7w38CON9xdSVEGHayP5/4=; b=wveZBSFQC1sm6+ahA9NOrZZmYM
	oTv/bKr0IZX6qg7uoBnAPiEgL2j7CHshPd5KrCtFJrNneZ5xbWHM4B616/6DmUHNJ1jn6Tc5baTtx
	yEbCxXLHmVdNmRF2CFBNt6I3ZT75AQecTEsfGcsvMHJJAhmbzMMi8jZ9sJLBD6pe6ai4lSwdqux6Z
	Zzb1wKUowNrRuQ4uTeSyoLIUHnmAXKkbwH9LWu4m1fA1Bs+v9U+U8uL7z7Wc/ZKNBqEHOSydSd/yy
	cckSxCPtmFMmaYTN/Pb2SRlKNa5nAsSMCFFFDBeoqitLHuxD07MqvIHDAJsvsmqskBBAJIQK09Coh
	eU8GzHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yZF-00000009cqe-0SxI;
	Tue, 08 Sep 2026 16:21:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yZB-00000009cpn-1wjO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:21:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1F9F1476;
	Tue,  8 Sep 2026 09:20:54 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A3E6A3F7B4;
	Tue,  8 Sep 2026 09:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788884458; bh=FSUo7Pt8lcgEvc4rkDNallbtbDIA877OOKisYkRqqwk=;
	h=From:To:Cc:Subject:Date:From;
	b=krw/EAJZgHh1NHFXD1hUij640z8F016zFh33tPvY2mScgDu7bzsUZ3BQ1TKqfMui7
	 A66LRPt4Pu5AF1bq4J54FcFsx5NQUWi3wtXl1mip/iisbbeX07wDUQA8Vw1tUX33ic
	 X3UV2IUbcEAoBMGgJMYJQLqwQvxF/5aj0o32qAK0=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	liulhong617@gmail.com
Subject: [PATCH] arm64: mm: Fix pfn_is_map_memory() misreporting mapped memory
Date: Tue,  8 Sep 2026 17:20:33 +0100
Message-Id: <20260908162033.74509-1-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_092101_602334_D37EA642 
X-CRM114-Status: UNSURE (   9.40  )
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

Commit 7ace06a01efa ("arm64: mm: fix accidental linear mapping of
no-map reserved memory") removed sub-page no-map regions from the
linear mapping. However, pfn_is_map_memory() can still report that
such a region is mapped.

For instance, with 64K pages, say we have

normal:        ...–0xa2007fff
no-map: 0xa2008000–0xa200ffff
normal: 0xa2010000–...

The range 0xa2000000–0xa200ffff is not linearly mapped, but
pfn_is_map_memory(__phys_to_pfn(0xa2008000)) aligns the address to
page granularity and passes 0xa2000000 to memblock_is_map_memory().
That address belongs to the preceding normal memblock region, so the
no-map region is ignored and the function returns true.

Fix that by checking if entire page is subset of memory block.

Fixes: 7ace06a01efa ("arm64: mm: fix accidental linear mapping of no-map reserved memory")
Assisted-by: LLM
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/mm/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index fbf215ecc7d0..5da80e1e1727 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -172,7 +172,8 @@ int pfn_is_map_memory(unsigned long pfn)
 	if (PHYS_PFN(addr) != pfn)
 		return 0;
 
-	return memblock_is_map_memory(addr);
+	return memblock_is_region_memory(addr, PAGE_SIZE) &&
+		memblock_is_map_memory(addr);
 }
 EXPORT_SYMBOL(pfn_is_map_memory);
 
-- 
2.34.1


