Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD94BCD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEcGnBezuQEwMCEt3W5bYotUgDgNX6KXYvPMaE0362Y=; b=Ew5jRkfr1XJLB+v7jr4qt6SEuf
	KQc6UUNutRzqZ7nuzLNWznG88nx75Sv2ae+2POuG2voyyk8lVzRJqoA8uBmCEUzi/xRqcxMq79jYW
	sTAmMMj0WE+GetuPYDa+P8H3qYXtvTBSGez+pZpL4XiwODQt1TU5rkqEwOzWlsOeocfcmpcjKLVqM
	3OdlK5mAPNVw14FrqT+WxeThzW0FE2orAjvHg9UFNWN5pTpMIB+aHDWyOzxqwHZyzwOYkBKeeVvpD
	XgGcQNbaTjXOTyZKs/Q8HugYfJfW0Prqs0XrpZFqmzZtQhINGQzvey8WhXU6fCWlDZU3xJX2ew5NE
	YP7jWASA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDd-00000001yyT-0Zur;
	Tue, 19 May 2026 15:18:53 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDR-00000001yjs-3HzB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:18:46 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48feb029961so21881335e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 08:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779203919; x=1779808719; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bEcGnBezuQEwMCEt3W5bYotUgDgNX6KXYvPMaE0362Y=;
        b=QbJNseMBYbkTsP9Ono9v7mQMyYEJuFowva6z/2HwtMxK2RRtW6ecZupiXiMdBtzk93
         Wycr1e2+lReY+PF1IfeWz4bLyU67Xj6iMYXNMnh3k3k/83qzuVSYTWXh3KtT9orkj3p2
         /HWhvNAEcp/p9ldPpfkZZu09/fssGMvaYqbY9wpTMVmrr1MEUryCVuxPlRjee3kROyQO
         3ytM+8DD1nMEokoZOOAHGacZ/00jK7bloEaB7s5J49xjZTicEPhI9ko4dP4G+3yx9LYv
         EGg6DWuk5t49io3dMDE/+avqIbKMOvyqBbH3hDVw+HAqStOXXucEFDh0bfmmOATNNVj2
         4P0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203919; x=1779808719;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bEcGnBezuQEwMCEt3W5bYotUgDgNX6KXYvPMaE0362Y=;
        b=alFBfS0KnAbodmezm46h1WCjxLK4YaNiudTETy5kWZ6tCQERsKcErzXW3NCJ9+xdE1
         OZfH5QgKc3l4Gd7PvwXXg6g84q8OVa3toYNshu2GGj4RxaEwBGBpxeKzTp5e/wJj5wpV
         +lUcsIFvcCtD/E1bRHWCaazVYi8HWVVZaL7ijLod/5AcoEXBOh6H6Fi6+GW+uBpEQJv3
         /frmYFm/8p/HwrTf/Jsabu4flc63djqe6YT6D8Ogk18rmB5xP8xQU4Ge3aXbbyscSs6I
         tIZT+dGYXQZq/Xl3doc7lfKlMHzTIqI+nq1zXKzLZmeh3JcLrZmQIO7KzsHKfW1P0lWr
         5NXA==
X-Gm-Message-State: AOJu0YyGe+LL76tVQfvkq40wHF+5fmnYz874Ryb13Rt/VzIJx9R+5BLH
	mvOdOpR7kkD0/nxiaTQfH4QB/g6peQ+DmKj/cwGZrY3dp7tcTl31FxEWn4Zxdzvl9U5Hk/uwsKy
	oIz6vBSqCwg6mtkXX+6vcmC3Ifm6kXMvTwq125zGzI21syfdZtVoCwS/pLTeZgPD9Jo5RqOCt8b
	bYnnI6DYN4OIPuDu0x1/oDjxjV/qsbn9p9xS67/PmjhY4X
X-Received: from wmqu11.prod.google.com ([2002:a05:600c:19cb:b0:489:1a41:9f2])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6592:b0:48a:557e:6b4f
 with SMTP id 5b1f17b1804b1-48fe62f8861mr324426035e9.23.1779203919263; Tue, 19
 May 2026 08:18:39 -0700 (PDT)
Date: Tue, 19 May 2026 17:16:29 +0200
In-Reply-To: <20260519151616.2557018-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260519151616.2557018-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2420; i=ardb@kernel.org;
 h=from:subject; bh=hpZj9tDbz4ule6SV7Pe9qCHUBgjdBV9xPIuiKyNVEQo=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIYun7rLlscTzvLYmAbbOjevCUpJ7xev0pTvrw3s0BZueZ
 ivtudxRysIgxsUgK6bIIjD777udpydK1TrPkoWZw8oEMoSBi1MAJnL/DyPDH21Z3q7FHTe+b2Y5
 kpVzasa36zIhHIduB3jOl9g38ZiCK8N/x3P33asf13pw90ttVIyeHyVzWv/N67UNyRmxq6ZfUXz LCgA=
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519151616.2557018-27-ardb+git@google.com>
Subject: [PATCH v5 12/13] arm64: mm: Map the kernel data/bss read-only in the
 linear map
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_081841_939684_14A3FC56 
X-CRM114-Status: GOOD (  16.28  )
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
 arch/arm64/mm/mmu.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index dcff1a538f20..136cfe0f7375 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1122,7 +1122,9 @@ static void __init map_mem(void)
 {
 	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
 	phys_addr_t kernel_start = __pa_symbol(_text);
-	phys_addr_t kernel_end = __pa_symbol(__init_begin);
+	phys_addr_t init_begin = __pa_symbol(__init_begin);
+	phys_addr_t init_end = __pa_symbol(__init_end);
+	phys_addr_t kernel_end = __pa_symbol(__bss_stop);
 	phys_addr_t start, end;
 	int flags = NO_EXEC_MAPPINGS;
 	u64 i;
@@ -1155,7 +1157,11 @@ static void __init map_mem(void)
 	 * of the region accessible to subsystems such as hibernate,
 	 * but protects it from inadvertent modification or execution.
 	 */
-	__map_memblock(kernel_start, kernel_end, pgprot_tagged(PAGE_KERNEL),
+	__map_memblock(kernel_start, init_begin, pgprot_tagged(PAGE_KERNEL),
+		       flags);
+
+	/* Map the kernel data/bss so it can be remapped later */
+	__map_memblock(init_end, kernel_end, pgprot_tagged(PAGE_KERNEL),
 		       flags);
 
 	/* map all the memory banks */
@@ -1168,6 +1174,11 @@ static void __init map_mem(void)
 		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
 			       flags);
 	}
+
+	/* Map the kernel data/bss read-only in the linear map */
+	__map_memblock(init_end, kernel_end, PAGE_KERNEL_RO, flags);
+	flush_tlb_kernel_range((unsigned long)lm_alias(__init_end),
+			       (unsigned long)lm_alias(__bss_stop));
 }
 
 void mark_rodata_ro(void)
-- 
2.54.0.563.g4f69b47b94-goog


