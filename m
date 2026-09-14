Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344DEC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnqHTFFg7SjKjtGZVIXxU+lBLQPtRSbaf8oHL0yupPo=; b=cf6l1T64BXqtNuV7Ec486qVCo7
	tCG+vZ9VdLuzDvuTp5+eQ8XD5PtRuIpeplEhkrXghYgH/f68tBfFqqbwQUNz51SXfjFSKCyxBZ7QT
	geTgIGhTuXpoKFi1qsCgewObTCkb/ZahJkb0a9s17peOk4lxuVv5007u02QqSgCRnjY+7WvrR/QvO
	0Dzs1YXt5Luf77LYqI8945KlVdhjVlyP+f9mGSMdTskne5bj2bIpj9SyYOtgRFfkvL3MG2urqJJci
	Se7gK0mz/Oemydzf5ltrfPBOeiVumqbVD+4aCS2a5btbbM3gDmX5vaMzZb9505JIY7KQwTmjvue/q
	7aPFSVEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x676n-00000003rvf-1wOM;
	Mon, 14 Sep 2026 13:52:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x676e-00000003roO-3h0R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:52:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60C4B1576;
	Mon, 14 Sep 2026 06:52:19 -0700 (PDT)
Received: from [127.0.1.1] (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1F373F882;
	Mon, 14 Sep 2026 06:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789393943; bh=M/GSINSwm6+Et2eyJmmD/tFqPTuI/A1b5T1YgKWiL9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l1MXFaUtsScvaXSmDpLzKQ0x5H2a0xG7fjpv0PnXJZhfGml/cb2/NWB6wiGm/2m/W
	 HbtYIf5YprgsmmREN4DpnnSbzRTpl0G8iRLXXwXoBcCYEWBUBfax0si2I2ttMOWuCI
	 JgPXqqlaUmx6uMk6xS6A4rRtyvVaJNKnNht1RaJ0=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Date: Mon, 14 Sep 2026 14:51:35 +0100
Subject: [PATCH 5/6] arm64: use HW PTE accessors in early map_range()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-pte0_arm-v1-5-bb53b663e396@arm.com>
References: <20260914-pte0_arm-v1-0-bb53b663e396@arm.com>
In-Reply-To: <20260914-pte0_arm-v1-0-bb53b663e396@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-efi@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 Muhammad Usama Anjum <usama.anjum@arm.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_065225_001405_A61C3D75 
X-CRM114-Status: GOOD (  14.64  )
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

map_range() uses HW PTE pointers to build early translation tables at
each level. Directly testing, decoding, or assigning *tbl treats an
HW PTE as a SW PTE value, which requires explicit conversion once
hw_pte_t becomes distinct.

Use __ptep_get() to load a SW PTE value for the empty-entry check and
child-table address, and __set_pte_nosync() to convert SW PTE values to
HW PTEs on stores. The no-sync helper performs WRITE_ONCE() without
adding the completion barriers used by __set_pte().

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 arch/arm64/kernel/pi/map_range.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
index 94f06da76e333..9c4c8060c5df4 100644
--- a/arch/arm64/kernel/pi/map_range.c
+++ b/arch/arm64/kernel/pi/map_range.c
@@ -51,19 +51,21 @@ void __init map_range(phys_addr_t *pte, u64 start, u64 end, phys_addr_t pa,
 
 	while (start < end) {
 		u64 next = min((start | lmask) + 1, PAGE_ALIGN(end));
+		pte_t entry = __ptep_get(tbl);
 
 		if (level < 2 || (level == 2 && (start | next | pa) & lmask)) {
 			/*
 			 * This chunk needs a finer grained mapping. Create a
 			 * table mapping if necessary and recurse.
 			 */
-			if (pte_none(*tbl)) {
-				*tbl = __pte(__phys_to_pte_val(*pte) |
+			if (pte_none(entry)) {
+				entry = __pte(__phys_to_pte_val(*pte) |
 					     PMD_TYPE_TABLE | PMD_TABLE_UXN);
-				*pte += PTRS_PER_PTE * sizeof(pte_t);
+				__set_pte_nosync(tbl, entry);
+				*pte += PTRS_PER_PTE * sizeof(hw_pte_t);
 			}
 			map_range(pte, start, next, pa, prot, level + 1,
-				  (hw_pte_t *)(__pte_to_phys(*tbl) + va_offset),
+				  (hw_pte_t *)(__pte_to_phys(entry) + va_offset),
 				  may_use_cont, va_offset);
 		} else {
 			/*
@@ -81,7 +83,8 @@ void __init map_range(phys_addr_t *pte, u64 start, u64 end, phys_addr_t pa,
 				protval &= ~PTE_CONT;
 
 			/* Put down a block or page mapping */
-			*tbl = __pte(__phys_to_pte_val(pa) | protval);
+			entry = __pte(__phys_to_pte_val(pa) | protval);
+			__set_pte_nosync(tbl, entry);
 		}
 		pa += next - start;
 		start = next;

-- 
2.47.3


