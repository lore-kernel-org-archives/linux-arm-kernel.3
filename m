Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0169EFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 06:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sfkGLFkqEIBKOafl9GJMSprJeAoAdbx46V2yRo3AbZs=; b=quRdLdtvxVoevV
	zaL+2AMUQ0r+pv92ZEecSiPuK52O1j5fJNuZSUdNqyc53oL2yhIfHXPsOaBKpOULz+gszfkO0Ff5Z
	hHoiK7qjKMNv1AT/ZoM5vRhQJeYaLpsykq3yTHaz7fYMya2/ipiXRknlgKDERuiIhRumLZ9zYSb5N
	0Rd7URdKw8GgeqG87UQ17X0LSaZx8KTsMbMSDu0Ri+L4QyCHjv+tGGDqNurtaf//QBKA6Zt4n1s2k
	Y25cjm6++vJVorzn+1PJaKxabOr243oa313zOJ1Kdsyg0x8+SHwGsWObG80vfYIeH0yNcAILurkdm
	1W1/yEch2ZQxEa0zk6Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyHF-000000030PS-31p5;
	Wed, 29 Apr 2026 06:20:05 +0000
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyHC-000000030Og-2QZH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 06:20:04 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 63T6I3Cb046564;
	Wed, 29 Apr 2026 14:18:03 +0800 (+08)
	(envelope-from zhaoyang.huang@unisoc.com)
Received: from SHDLP.spreadtrum.com (BJMBX01.spreadtrum.com [10.0.64.7])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4g56V36rCxz2L0psS;
	Wed, 29 Apr 2026 14:15:07 +0800 (CST)
Received: from bj03382pcu03.spreadtrum.com (10.0.73.40) by
 BJMBX01.spreadtrum.com (10.0.64.7) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Wed, 29 Apr 2026 14:18:00 +0800
From: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Zhaoyang Huang <huangzhaoyang@gmail.com>, <steve.kang@unisoc.com>
Subject: [PATCH] arch: arm64: fix KERNEL_SEGMENT_COUNT error
Date: Wed, 29 Apr 2026 14:17:52 +0800
Message-ID: <20260429061752.2880923-1-zhaoyang.huang@unisoc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.73.40]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX01.spreadtrum.com (10.0.64.7)
X-MAIL: SHSQR01.spreadtrum.com 63T6I3Cb046564
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
	s=default; t=1777443491;
	bh=sfkGLFkqEIBKOafl9GJMSprJeAoAdbx46V2yRo3AbZs=;
	h=From:To:Subject:Date;
	b=LqAOy7qwexZuYBqyJkYmEvZAjGhroq6bo7dV7EAdQPUR4Q17uLbDpVHd0DXYWX5Z5
	 wC/LeY1SDy2mlXEd21hKGc9OZ0LgAMamvQU+/UnfXupSg25hpT8r89tP0OggBVE+TR
	 Hski1bxMMayhT4GyCXj2TJujSO2zRYRRPJeOYUL0RqJxSbGEYwMP1mEhobVUvz9ydH
	 ptICjA5J4TizrmH020JRL4wqTD4WUGKU4C9MXkdJhh5L+E5pIMnw9n4Ai6aS7nDSgy
	 xvIpElh7fhmamIBRiCwfLGaNMq65s7RnDY8Q4GLxteJg02Dw/clvhESRnsjd6W5Xgf
	 QkLN1YIUtZNcw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_232003_251431_95B8E0B0 
X-CRM114-Status: GOOD (  11.84  )
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

From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>

During debug of a kernel panic, we find that the pte_t of the final
part of [data, end] segment got overflow to the next page of
init_pg_end[1] which is the gap page before early_init_stack[2].
This should be introduced by the KERNEL_SEGMENT_COUNT's value is 5
which should be 6 as map_segment are called 6 times for the segments
of (text, stext, rodata, inittext, initdata, data+bss)

[1]
crash_arm64_v9.0.1> vtop ffffffed00601000
VIRTUAL           PHYSICAL
ffffffed00601000  83401000

PAGE DIRECTORY: ffffffecffd62000
   PGD: ffffffecffd62da0 => 10000000833fb003
   PMD: ffffff80033fb018 => 10000000833fe003
   PTE: ffffff80033fe008 => 68000083401f03
  PAGE: 83401000

     PTE        PHYSICAL  FLAGS
68000083401f03  83401000  (VALID|SHARED|AF|NG|PXN|UXN)

      PAGE       PHYSICAL      MAPPING       INDEX CNT FLAGS
fffffffec00d0040 83401000                0        0  1 4000 reserved

[2]
ffffffed002c8000 (r) __pi__data
ffffffed0054e000 (d) __pi___bss_start
ffffffed005f5000 (b) __pi_init_pg_dir
ffffffed005fe000 (b) __pi_init_pg_end
ffffffed005ff000 (B) early_init_stack
ffffffed00608000 (b) __pi__end

Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
---
 arch/arm64/include/asm/kernel-pgtable.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kernel-pgtable.h b/arch/arm64/include/asm/kernel-pgtable.h
index 74a4f738c5f5..14dd1c52552a 100644
--- a/arch/arm64/include/asm/kernel-pgtable.h
+++ b/arch/arm64/include/asm/kernel-pgtable.h
@@ -64,8 +64,8 @@
 #define INIT_IDMAP_FDT_PAGES	(EARLY_PAGES(INIT_IDMAP_PGTABLE_LEVELS, 0UL, UL(MAX_FDT_SIZE), 1) - 1)
 #define INIT_IDMAP_FDT_SIZE	((INIT_IDMAP_FDT_PAGES + EARLY_IDMAP_EXTRA_FDT_PAGES) * PAGE_SIZE)
 
-/* The number of segments in the kernel image (text, rodata, inittext, initdata, data+bss) */
-#define KERNEL_SEGMENT_COUNT	5
+/* The number of segments in the kernel image (text, stext, rodata, inittext, initdata, data+bss) */
+#define KERNEL_SEGMENT_COUNT	6
 
 #if SWAPPER_BLOCK_SIZE > SEGMENT_ALIGN
 #define EARLY_SEGMENT_EXTRA_PAGES (KERNEL_SEGMENT_COUNT + 1)
-- 
2.25.1


