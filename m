Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41019CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 01:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iWOMFoOs5ZLB23ex2t3PflHDKuzpdvnCncHsvkS8LTU=; b=aaxq+BTC1fiiUIk26+f4k7QXws
	BH2ith6gxoIvzawGHUJJt+X2AzY3dINCa1HetWodKJq91EHAX8xiwKfvu5n0CRBLtXvw7Mt90A2dg
	kMOm8CHRry5cJ2ywAb9X26RbFdF1aKM50TN9K6kMXon2fHJMifF1C4nEOTXj8HOvr8PNKnMbTydeS
	tRaYNn9dq7awXrDqc2w6mZMW/myttIrFZG2VzC9GjLBohNELe3erU6pG5Zlw5gZkd7E9jBMA1P/zB
	OgOBJBIpY6jw0rF4ukTz6eTxB/6WGk73ec+9jzaEihI7BL0DYZdl+b5t7PQ2XJPs+0vZBJ6ZZ5Qdc
	VJKxDb1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMy0N-00000000pVA-2sIY;
	Wed, 13 May 2026 01:03:19 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMy0L-00000000pUD-0vy8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 01:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=iWOMFoOs5ZLB23ex2t3PflHDKuzpdvnCncHsvkS8LTU=;
	b=iK722dMgsK6yDVjlZkJn+BP2CbLApDyDAsda7/SH2VgEorS27xqd2l+CfYC6ub
	58NUpOqV7hFVcXipuEDIGVLTOoLDCXgu1pcq560MSqJh3yGW73i16Eeg7paWs7GJ
	HfwJT9oADQJvFVAafzmNo4R4wAU78Tfvcew+y1PB/j0ZE=
Received: from server227.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wBn222_zQNq_ZQcBA--.5332S2;
	Wed, 13 May 2026 09:02:55 +0800 (CST)
From: liulhong617@163.com
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liulhong617 <liulhong617@gmail.com>
Subject: [PATCH] arm64: mm: fix accidental linear mapping of no-map reserved memory
Date: Wed, 13 May 2026 09:02:55 +0800
Message-Id: <20260513010255.3764038-1-liulhong617@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBn222_zQNq_ZQcBA--.5332S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr4ktrWxtr15Zw4UAw1xuFg_yoW5Cw13p3
	y8GFn8Cr4jqryIq3ySy34DXrn5Zan3tF45JFsIkryjyFs8WFya9F4xC3W2gryjyayxZr1Y
	gr42ya4UWr15ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jOZ2-UUUUU=
X-Originating-IP: [39.170.101.209]
X-CM-SenderInfo: holxzxxrqjliqx6rljoofrz/xtbC+h-9WGoDzb+uCQAA38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_180317_660350_2C01F325 
X-CRM114-Status: GOOD (  14.52  )
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

From: liulhong617 <liulhong617@gmail.com>

When reserved-memory regions with the "no-map" property are not
page-aligned, the kernel may accidentally map them into the linear
mapping, contradicting the no-map semantics.

The root cause is a mismatch between /proc/iomem's address boundaries
and the actual page table mapping boundaries:

1. /proc/iomem derives its ranges from memblock via
   memblock_region_reserved_base_pfn/memblock_region_reserved_end_pfn,
   which perform PFN rounding so the displayed boundaries are
   page-aligned. This gives the impression that the no-map region
   occupies whole pages.

2. However, memblock_mark_nomap() splits memblock.memory regions at
   exact byte boundaries (memblock_isolate_range preserves raw DT
   base/size with no alignment). When for_each_mem_range iterates the
   non-NOMAP regions adjacent to a no-map region, it returns start/end
   values that are NOT page-aligned — they are the precise byte
   boundaries from the memblock split.

3. These sub-page-aligned values are passed to
   __create_pgd_mapping_locked(), which does:
     phys &= PAGE_MASK;
     addr = virt & PAGE_MASK;
     end = PAGE_ALIGN(virt + size);
   The downward rounding of phys via PAGE_MASK extends the mapped
   range backward into the adjacent no-map region, effectively
   including no-map memory in the linear mapping.

For example, with 64K pages, reserved_region@A2000000 (base=0xA2000000,
size=0x8000, no-map) causes for_each_mem_range to return
start=0xA2008000 for the next mappable region. After phys &= PAGE_MASK,
the actual mapping starts at 0xA2000000 — the entire no-map region is
incorrectly mapped.

Fix this by rounding the mappable range inward to PAGE_SIZE boundaries
before passing it to __map_memblock: start is rounded UP and end is
rounded DOWN. This ensures the mapped area never overlaps with adjacent
no-map regions. The cost is at most one page of unmapped gap at each
boundary, which is preferable to violating no-map semantics.

Signed-off-by: liulhong617 <liulhong617@gmail.com>
---
 arch/arm64/mm/mmu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index dd85e093f..bc8ac7622 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1175,6 +1175,20 @@ static void __init map_mem(pgd_t *pgdp)
 	for_each_mem_range(i, &start, &end) {
 		if (start >= end)
 			break;
+		/*
+		 * for_each_mem_range may return sub-page-aligned boundaries
+		 * after memblock_mark_nomap() splits regions at byte precision.
+		 * __create_pgd_mapping_locked aligns phys down to PAGE_MASK,
+		 * which could accidentally map no-map memory on the boundary.
+		 * Round the mappable range inward: start UP, end DOWN, so
+		 * that the mapped area never overlaps with adjacent no-map
+		 * regions. The cost is at most one page of unmapped gap at
+		 * each boundary.
+		 */
+		start = PAGE_ALIGN(start);
+		end = end & PAGE_MASK;
+		if (start >= end)
+			continue;
 		/*
 		 * The linear map must allow allocation tags reading/writing
 		 * if MTE is present. Otherwise, it has the same attributes as
-- 
2.34.1


