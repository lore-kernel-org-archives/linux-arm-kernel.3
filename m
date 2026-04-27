Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF7CFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxYPOVRWmcj1klY6tkKd45C/dDkcyiHdqjwOkqhsN/0=; b=swF3xD7NM94w3+BoFU3zVIHL6w
	N1GmIGxYBMM2Gg0xButkvEUA2PZsbsV9SsY0VNWVAJrVF9SfMLLudflAYeiPJC5fgltTfNl/t7AAQ
	L2B1sqQy6ZSiHSZaekbp67RmrXdgonctyq+qCHjUGMeXDiW2tlOs/wBiEju5QE95QcVB4vIgpPjCl
	NU6wASyf44ocNwf4bA5MdO/2CEhLC5nV93gkCoWye/iaH+sTwSpOSommvmZLPZY4eu3DZLznBmH0V
	k3Q8evDCHAthfIQBOL+cHdludSel4CTSmzaZvHtBirlDZRfJX2qiH6S0EQMDw50OooJQ5TKawohz8
	QU7bu/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHO0I-0000000HCq9-462b;
	Mon, 27 Apr 2026 15:36:11 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzx-0000000HCVF-1v93
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:35:50 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-43d7a5b9678so8097218f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777304147; x=1777908947; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UxYPOVRWmcj1klY6tkKd45C/dDkcyiHdqjwOkqhsN/0=;
        b=VSAGWhEWdFW3NAI44P0+FYR+TpV18PmALcasRtDc+Nw6yrm3D54OZRRuTn3sQk54r1
         YXXOMEhMIr+MFr3VgwffzNLYrfz1afWeQ9MB/DWouq1IaEK3yVgwWqWLgCzRpg0NrjKH
         vEPXaj8ukxqJp1bLsTlyAJDV+x3lTw+Yzb6R7OzHB2RRmn1+G62jpIElWXCj7ogIRcML
         IL/eX2nloYS/s6XPbYVY5S5RbQ1qg8gryrv55N+/DvFGFrK43Nhqnb1SRyOFxa0c1NKt
         fRx6w3Gih3XA8Ghb5R81ei99CxKxnU/rWrp2dUuIUvaNdSdnC8FB7HMWRW3zFoKLF3sS
         CsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304147; x=1777908947;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UxYPOVRWmcj1klY6tkKd45C/dDkcyiHdqjwOkqhsN/0=;
        b=f18/9sksgHyj9vSvpA/1wH8Cm6ZaEl657NV/5kTiyGzJDm8YTt2JMK3UJyCrLgsLUM
         XtVgNqbOxXOWSxQ21JU1KVjD3UFTNKlmecHkZhuLeWdVq7UicpbZhKRtNUsWH4o9old5
         y8pgfdbt68zV8QH1KEB4vcW93GO0R6viTQPKj9nmEifhmvbVZGw/LYB/rDxASjHB5+pS
         5aRVA8Cyb7jR2vlmNcgF3pT0zv/QpijUpR81LS/e9skyfWJ8TDqRIkrvZZVoW+Ohngpx
         Lf702N9JioDBJ9A+2qHDdSHUS529Gfwn9VLPDoH7AU/FFey2V3z5/i4dHBbd67WmQOMW
         hXvg==
X-Gm-Message-State: AOJu0YwMjclOVM9QAQ4dIvhvUE5vxWI5+5rqJ02cmGGpTEdbLhFeilUU
	7GkQCByOhTxKeRjN/Is+F7hnz3fw6xi0+51SffQ7oGECj01ploxtc6AR4uRP6eCpvv60Wka4DKx
	JOdS8TacGpb0ojLAffRskTed4tMU4glbI8KyQ8ghyZ0Pl0RQ2T5RGbJmA4d2qSyfCNXRHGr5pt/
	P+CxHzyPNT4/ABF2jpsueOe4y6huvR6GQbUlY76+00hhRS
X-Received: from wrsm7.prod.google.com ([2002:adf:fe47:0:b0:43f:e932:b48d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5d88:0:b0:43d:6e0:9458
 with SMTP id ffacd0b85a97d-43fe3e0c779mr67106901f8f.39.1777304147061; Mon, 27
 Apr 2026 08:35:47 -0700 (PDT)
Date: Mon, 27 Apr 2026 17:34:29 +0200
In-Reply-To: <20260427153416.2103979-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260427153416.2103979-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3111; i=ardb@kernel.org;
 h=from:subject; bh=vnOPgzR9gwGy7RU3jbNwlQgfBXncMvaaP3oMs7gg07Y=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfN9E7fhjbPcgs4XVKfeTnOd6X5d81L1wd6JdtmfgucZt
 Dn6GzB2lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIlM/Mfwz1hYf8184+dKqf8u
 huwKYeCbfkN1Q8PZ5+f9Qlm8AtrWXmX4Z3804IBu667aItk0A8Wfbn81/Y/98HK+tuNd4pHLyrc 5WQA=
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260427153416.2103979-29-ardb+git@google.com>
Subject: [PATCH v4 12/15] arm64: mm: Map the kernel data/bss read-only in the
 linear map
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_083549_544572_E7FECE67 
X-CRM114-Status: GOOD (  16.86  )
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
 arch/arm64/mm/mmu.c               | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/sections.h b/arch/arm64/include/asm/sections.h
index 51b0d594239e..32ec21af0823 100644
--- a/arch/arm64/include/asm/sections.h
+++ b/arch/arm64/include/asm/sections.h
@@ -23,6 +23,7 @@ extern char __irqentry_text_start[], __irqentry_text_end[];
 extern char __mmuoff_data_start[], __mmuoff_data_end[];
 extern char __entry_tramp_text_start[], __entry_tramp_text_end[];
 extern char __relocate_new_kernel_start[], __relocate_new_kernel_end[];
+extern char __fixmap_pgdir_start[];
 
 static inline size_t entry_tramp_text_size(void)
 {
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 1a4b4337d29a..9361b7efb848 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1122,7 +1122,9 @@ static void __init map_mem(void)
 {
 	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
 	phys_addr_t kernel_start = __pa_symbol(_text);
-	phys_addr_t kernel_end = __pa_symbol(__init_begin);
+	phys_addr_t init_begin = __pa_symbol(__init_begin);
+	phys_addr_t init_end = __pa_symbol(__init_end);
+	phys_addr_t kernel_end = __pa_symbol(__fixmap_pgdir_start);
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
@@ -1168,6 +1174,12 @@ static void __init map_mem(void)
 		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
 			       flags);
 	}
+
+	/* Map the kernel data/bss read-only in the linear map */
+	__map_memblock(init_end, kernel_end, pgprot_tagged(PAGE_KERNEL_RO),
+		       flags);
+	flush_tlb_kernel_range((unsigned long)lm_alias(__init_end),
+			       (unsigned long)lm_alias(__fixmap_pgdir_start));
 }
 
 void mark_rodata_ro(void)
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


