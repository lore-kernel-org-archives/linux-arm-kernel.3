Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F2BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 04:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I9rkxPgkR9wY/NsTR+xuIpXHWRLQ67PZNdy0kPDZoNg=; b=iV4svRi5A7BpB0AzPT8L+q9Qx/
	Jy5++RUM9Upv+nRx+gzPxPTGTgqhMmj5/3pIo/o8bafERpEXp2vko/Qo0nU8rVbrTIxn8z7l7smgr
	lwd1hUcypLwEabXTZNG4R5ooYKgcFLOt1+q2UpZEU9cHcJiSfbiDuh4nCknGJPShmyUnTe1hERroD
	XlIX3NLjFkoPv+o/G+FMq0/Gx20GaQIucjOYNNLjRANetCbPeBzyh6EwJE02Vyxz1NyZO3CTAocnb
	IiuACbZ7hilBTi+8JhnlqSJa3lcxgCWeLH/+WtssnZYLZdBFWymA5Vzly0Bkryvow6LcnJe4+CCzH
	zeyIxEBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue4Lp-00000001EtP-31vc;
	Tue, 22 Jul 2025 04:11:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue4JM-00000001EdT-2UCb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 04:09:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C0B3152B;
	Mon, 21 Jul 2025 21:08:56 -0700 (PDT)
Received: from entos-yitian-01.shanghai.arm.com (unknown [10.169.217.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CF0CD3F66E;
	Mon, 21 Jul 2025 21:08:57 -0700 (PDT)
From: Jia He <justin.he@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Peter Xu <peterx@redhat.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Jia He <justin.he@arm.com>
Subject: [PATCH] mm: vmalloc: use VMALLOC_EARLY_START boundary for early vmap area
Date: Tue, 22 Jul 2025 04:08:50 +0000
Message-Id: <20250722040850.2017769-1-justin.he@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_210904_687949_0D287891 
X-CRM114-Status: GOOD (  11.61  )
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

When VMALLOC_START is redefined to a new boundary, most subsystems
continue to function correctly. However, vm_area_register_early()
assumes the use of the global _vmlist_ structure before vmalloc_init()
is invoked. This assumption can lead to issues during early boot.

See the calltrace as follows:
	start_kernel()
		setup_per_cpu_areas()
			pcpu_page_first_chunk()
				vm_area_register_early()
		mm_core_init()
			vmalloc_init()

The early vm areas will be added to vmlist at declare_kernel_vmas()
->declare_vma(): 
ffff800080010000 T _stext
ffff800080da0000 D __start_rodata
ffff800081890000 T __inittext_begin
ffff800081980000 D __initdata_begin
ffff800081ee0000 D _data
The starting address of the early areas is tied to the *old* VMALLOC_START
(i.e. 0xffff800080000000 on an arm64 N2 server).

If VMALLOC_START is redefined, it can disrupt early VM area allocation,
particularly in like pcpu_page_first_chunk()->vm_area_register_early().

To address this potential risk on arm64, introduce a new boundary,
VMALLOC_EARLY_START, to avoid boot issues when VMALLOC_START is
occasionaly redefined.

Signed-off-by: Jia He <justin.he@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 2 ++
 mm/vmalloc.c                     | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 192d86e1cc76..91031912a906 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -18,9 +18,11 @@
  * VMALLOC range.
  *
  * VMALLOC_START: beginning of the kernel vmalloc space
+ * VMALLOC_EARLY_START: early vm area before vmalloc_init()
  * VMALLOC_END: extends to the available space below vmemmap
  */
 #define VMALLOC_START		(MODULES_END)
+#define VMALLOC_EARLY_START	(MODULES_END)
 #if VA_BITS == VA_BITS_MIN
 #define VMALLOC_END		(VMEMMAP_START - SZ_8M)
 #else
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 6dbcdceecae1..86ab1e99641a 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -50,6 +50,10 @@
 #include "internal.h"
 #include "pgalloc-track.h"
 
+#ifndef VMALLOC_EARLY_START
+#define VMALLOC_EARLY_START		VMALLOC_START
+#endif
+
 #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
 static unsigned int __ro_after_init ioremap_max_page_shift = BITS_PER_LONG - 1;
 
@@ -3126,7 +3130,7 @@ void __init vm_area_add_early(struct vm_struct *vm)
  */
 void __init vm_area_register_early(struct vm_struct *vm, size_t align)
 {
-	unsigned long addr = ALIGN(VMALLOC_START, align);
+	unsigned long addr = ALIGN(VMALLOC_EARLY_START, align);
 	struct vm_struct *cur, **p;
 
 	BUG_ON(vmap_initialized);
-- 
2.34.1


