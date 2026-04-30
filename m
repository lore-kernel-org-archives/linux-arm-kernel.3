Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8ECFF887E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 02:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GPDDvWgl/s7dZoayqq/i64CZE2KFXHaJFBEQdJtsAa8=; b=axE6FzPAmSJ2BL
	8UOv08sL7+jTpN/CgUoEs1u3YfGvj0qVEL2XbrNpfevfjKAPPix05g/R6ai3wO1qnrx1pAgd2g5qY
	3hZN2jNPuAuXf9h3GNE9zGRV+60VyHJhUSLRJNcNe1nW+DXbLj5JmzmZXzN/8QTRMi36IbICrUu/F
	OddnLExa2KX0QzMI1OzHR8ijOljt2uRn/d6rKQ/Z38aLRzpPWmuX/K4daElAaWQBY4yNocsle22g1
	ACVdkkP4wpThcE2a7YKw5LtftiSVGtKLcVy0uFzdEQkBmRBcr0pr0Bx+DpJ/Bqga30pZgKIIJErx2
	6kJveNENGewPQ0TvNQdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGn0-00000004PxE-2ZDt;
	Thu, 30 Apr 2026 02:06:06 +0000
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGmx-00000004PwO-0Z0k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 02:06:05 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 63U244CY051377;
	Thu, 30 Apr 2026 10:04:04 +0800 (+08)
	(envelope-from zhaoyang.huang@unisoc.com)
Received: from SHDLP.spreadtrum.com (BJMBX01.spreadtrum.com [10.0.64.7])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4g5cpW05mpz2LYw4K;
	Thu, 30 Apr 2026 10:01:06 +0800 (CST)
Received: from bj03382pcu03.spreadtrum.com (10.0.73.40) by
 BJMBX01.spreadtrum.com (10.0.64.7) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Thu, 30 Apr 2026 10:04:01 +0800
From: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Zhaoyang Huang <huangzhaoyang@gmail.com>, <steve.kang@unisoc.com>
Subject: [PATCHv2] arch: arm64: fix KERNEL_SEGMENT_COUNT error
Date: Thu, 30 Apr 2026 10:03:51 +0800
Message-ID: <20260430020351.2925330-1-zhaoyang.huang@unisoc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.73.40]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX01.spreadtrum.com (10.0.64.7)
X-MAIL: SHSQR01.spreadtrum.com 63U244CY051377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
	s=default; t=1777514661;
	bh=GPDDvWgl/s7dZoayqq/i64CZE2KFXHaJFBEQdJtsAa8=;
	h=From:To:Subject:Date;
	b=MpB3qZSAIFdpAJhz2hbXEA5czVyCUGoeCWhW3SQ9oiRxkZCd8lz/wuLBU2cyVXfQw
	 67rqoKwEKIgFHYkijBK5p7IvJnzJbBQApI8r3a3h4bHz9sjr8D8o3SRAevHg7HcS6e
	 mk1nQKfY6JmW6xjiuvDYcCvWnf74YvnnKMWhBok4jpVc9WxpsATQKzQGeynNE8hscu
	 twXj/NuYRfNKYMblHbQiKCAXyoSjn44vAPdOPS+d3QKGX1zwscKve3fyM0q+GeiTvM
	 qfwuwMN733OVnhVXfED8L7+oJoPWj81c0tNlW2pWvl1tfzAR2jlE1q8rADwFPpesy/
	 2cx4Bh1+zxKoQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_190603_814445_28A3E9BB 
X-CRM114-Status: GOOD (  14.08  )
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

Fixes: 5973a62efa34 ("arm64: map [_text, _stext) virtual address range non-executable+read-only")
Assisted-by: TRAE: GLM-5.1
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
---
Patchv2: make the size of vmlinux_reg[] more reasonable
---
---
 arch/arm64/include/asm/kernel-pgtable.h | 4 ++--
 arch/arm64/mm/mmu.c                     | 6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

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
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index a6a00accf4f9..c807119c7bd7 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1355,7 +1355,11 @@ core_initcall(map_entry_trampoline);
  */
 static void __init declare_kernel_vmas(void)
 {
-	static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT];
+	/*
+	 * [_text, _stext) is mapped in init_pg_dir seperatly while they got
+	 * merged into one here
+	 */
+	static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT - 1];
 
 	declare_vma(&vmlinux_seg[0], _text, _etext, VM_NO_GUARD);
 	declare_vma(&vmlinux_seg[1], __start_rodata, __inittext_begin, VM_NO_GUARD);
-- 
2.25.1


