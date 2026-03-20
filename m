Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB901098797
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AllHBw18cmDC2YVJSjzRxyh9hUFulIuf1ZVRU3fSw0M=; b=aD+I5+rqHXXlzLzFjOE0BI+VwR
	iJ66MnZAr0Mn4oKg7MZAObJHo6mlGetf1TSzm4tyj6BL8Ur/NfPBmlDTWIoeudJ7hI/neJ2r9ewgy
	YFMZk/U2Dn8X4iwRt6fwMsUxLIYz7e1m8QfW1c+y1bmW8v4SOSMGxBnIgsTXPMnLOFHRYwr26ekE4
	I+/pScYZscYiQn0w0tCcmAkIs4NCgd72RlkS/HfU1ldhRXBpL/Wa8WWZuXViiCe+Ih8ADnwZxiWUY
	+092pfpgDAcWUMat/vfyh8UkBmiuG/MzpVdw/eeqePcJNNrkltAGL1wUs6YJF9uQtGTDysVoNfpM+
	xRWWJgKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKz-0000000Cyrz-1FI0;
	Fri, 20 Mar 2026 15:00:33 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKi-0000000CyaE-0iZN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:00:17 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-486fa35b005so19471235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 08:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774018813; x=1774623613; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AllHBw18cmDC2YVJSjzRxyh9hUFulIuf1ZVRU3fSw0M=;
        b=Bz3NuWMGo/yjIacaYjSdwCGmuiWHUneu4wYQ12Zq5r1pUoRzbk4cgge6jsN4Qu+unU
         1uKaRsugXB6x7Hbg6p/yKVlhvCFfZgYqSPCsOFHT7lwj1x9V3c5MCxdtYC2vRBwy5SiC
         IqNzpS7PObidBaBVmRYa89MTbqRpBeEvb+iOPb9xZtjBydz7ReGTtN6oJ618LhYJMoPq
         RMC25u0eaPd1Wj0ZxmTPcv0gwOV8eAX5FZtukNSCNW8nkmLdVWbwWB5vIfMstxyVFIcp
         CT8ngSbVDXRLyoXms8UBE0VOQXXYbjfzGEc7aG8aHI5EYfWc+al3rKWEumQHXl9ceCbs
         Hlmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018813; x=1774623613;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AllHBw18cmDC2YVJSjzRxyh9hUFulIuf1ZVRU3fSw0M=;
        b=JPHC8y/R5FLPP/xWuyZJ6crEQDDAo9G9HcuKSrUf5Hj3IsNZbaSqkPNd/bBPAeut5A
         9CRwNiEkY7u7i4WajZTtStH1kSNBjsVKkbgDEuxaeO5r6wcGJ7de2BCAYiCsbNwKkvtV
         L54uyu4yIjANqLU2/9JUGB6z8Owr07AxwNMtvmyV9+YyDmzQhcGjJKGBV/E3EODXXJYb
         n6LuX4fKv2WfUUWIiTblPWVe66LxPJAxg38QLSc/rUyGV10p5aj0Z7EKs1m2OKcsGKhu
         vIbRUgtFhp1hKe1x9qeK/XUCBOEBpKXK8cNODfd3FB7M9E5m853ueZ7nYM6A4aISB42i
         FIcQ==
X-Gm-Message-State: AOJu0Yxu653bKBGVNEvuQdT6rUPVbiqRfcOIU/IGL8YYa9M/ZjLqmERF
	r+Eke5DzG10Xzro88VvCYOE6p/rasyLz1h6OkrV7lwlYrzr9TnVEw/0q66wYOo41HvnF/gNEEw=
	=
X-Received: from wmaj7.prod.google.com ([2002:a05:600c:6c07:b0:480:4a03:7b6f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8215:b0:485:4388:348b
 with SMTP id 5b1f17b1804b1-486feb5a3camr48030045e9.0.1774018812807; Fri, 20
 Mar 2026 08:00:12 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:59:47 +0100
In-Reply-To: <20260320145934.2349881-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260320145934.2349881-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3040; i=ardb@kernel.org;
 h=from:subject; bh=mMdF4nB0Sfg+/JaqMNkV+NJRkgmrh0vw+xoaE44MJaI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIXNvwvMJ98weNU5ptLIJkv/+Oj2Ay5hDUO1NXFvd89uqx
 9r0Hgl1lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgImUzWP4H7t84yyZKcV7+2Zt
 ypvonf/98fKYjb9+hDk/FNIVvnnampvhn0WH35Jm2fqL8y/5SM/0LvQuyv63O988PprzjlyX3p0 nfAA=
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260320145934.2349881-27-ardb+git@google.com>
Subject: [PATCH v3 12/13] arm64: mm: Map the kernel data/bss read-only in the
 linear map
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_080016_243314_7C23AC3E 
X-CRM114-Status: GOOD (  15.99  )
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

From: Ard Biesheuvel <ardb@kernel.org>

On systems where the bootloader adheres to the original arm64 boot
protocol, the placement of the kernel in the physical address space is
highly predictable, and this makes the placement of its linear alias in
the kernel virtual address space equally predictable, given the lack of
randomization of the linear map.

The linear aliases of the kernel text and rodata regions are already
mapped read-only, but the kernel data and bss are mapped read-write in
this region. This is not needed, so map them read-only as well.

Note that the statically allocated kernel page tables do need to be
modifiable via the linear map, so leave these mapped read-write.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/sections.h |  1 +
 arch/arm64/mm/mmu.c               | 14 ++++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/sections.h b/arch/arm64/include/asm/sections.h
index 51b0d594239e..f7fe2bcbfd03 100644
--- a/arch/arm64/include/asm/sections.h
+++ b/arch/arm64/include/asm/sections.h
@@ -23,6 +23,7 @@ extern char __irqentry_text_start[], __irqentry_text_end[];
 extern char __mmuoff_data_start[], __mmuoff_data_end[];
 extern char __entry_tramp_text_start[], __entry_tramp_text_end[];
 extern char __relocate_new_kernel_start[], __relocate_new_kernel_end[];
+extern char __pgdir_start[];
 
 static inline size_t entry_tramp_text_size(void)
 {
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 34ad45a2d95f..5332f4ec743e 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1102,7 +1102,9 @@ static void __init map_mem(void)
 {
 	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
 	phys_addr_t kernel_start = __pa_symbol(_text);
-	phys_addr_t kernel_end = __pa_symbol(__init_begin);
+	phys_addr_t init_begin = __pa_symbol(__init_begin);
+	phys_addr_t init_end = __pa_symbol(__init_end);
+	phys_addr_t kernel_end = __pa_symbol(__pgdir_start);
 	phys_addr_t start, end;
 	int flags = NO_EXEC_MAPPINGS;
 	u64 i;
@@ -1135,7 +1137,10 @@ static void __init map_mem(void)
 	 * of the region accessible to subsystems such as hibernate,
 	 * but protects it from inadvertent modification or execution.
 	 */
-	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, flags);
+	__map_memblock(kernel_start, init_begin, PAGE_KERNEL, flags);
+
+	/* Map the kernel data/bss so it can be remapped later */
+	__map_memblock(init_end, kernel_end, PAGE_KERNEL, flags);
 
 	/* map all the memory banks */
 	for_each_mem_range(i, &start, &end) {
@@ -1147,6 +1152,11 @@ static void __init map_mem(void)
 		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
 			       flags);
 	}
+
+	/* Map the kernel data/bss read-only in the linear map */
+	__map_memblock(init_end, kernel_end, PAGE_KERNEL_RO, flags);
+	flush_tlb_kernel_range((unsigned long)lm_alias(__init_end),
+			       (unsigned long)lm_alias(__pgdir_start));
 }
 
 void mark_rodata_ro(void)
-- 
2.53.0.959.g497ff81fa9-goog


