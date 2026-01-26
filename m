Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF7BD74EFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 09:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFepSabf96QcVfXCKhTiM0/xD6vjSZxLElXj77bKxb0=; b=e8/CoYqI78l7umJGSic3ZcGTET
	jDyDmMxB+GA3rIDUoM43i58joRGDfHI4cti677ukK451aqiESlaxN9rX3CDD7YoTEdGyVo4gPfckG
	lFdtnq6AImsz/RhreUPgF3MrBxKNRW99Vu+WKpVhFNbr+zzrtc0lJTULpPznnbLfyRMNBsPSxo9x/
	ij9SV+Zz+O0Y8+aa5EpG73+Dh3/+G7+0J/SRO5Lq4ZSCN5HxRo6NRKRUQeYGYaoIvtf1oLbuAaR05
	GhSZaN6fwOYZL9OPxOEZ0KPfxISmteZK4wwgPYjdTNPXwP6jSgd3kXF0v+Kks6/teRWmjaL2MY3j8
	RPoRPNsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIst-0000000CC8L-0F2x;
	Mon, 26 Jan 2026 09:27:47 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIso-0000000CC2R-03dC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 09:27:43 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4803e8b6007so33554785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 01:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769419660; x=1770024460; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qFepSabf96QcVfXCKhTiM0/xD6vjSZxLElXj77bKxb0=;
        b=Rn9oc7YJAKEGWEW3gCi7nzQ6F1IMgZFIJFJvTFt3BKivNIV7xLBRMcUit7hxzHFhlB
         nL3FmvIaVnqBvdzEMiH+V+1YWoPaqBlqwWQKiZQpj2VAPV3z5dvkVYjTLy6+/71n0U1D
         4O8QKXCRFN0fj/Dq42X8Wx3SnqG2LOSNth0UUR3YrCHWJriheAMqDnliY3i2FcOHzunW
         ZDnwOmwR5BI5rvmkAFGhjCrt2SpUTeioHq8/lj8NctFw1Gi1s1JqWPmALIs8O8XfVdOH
         4n4F0sXqj70vSh55nrRIyBFd7fYGMNBLkRLJBql8LnvL9qZBGpwAXMQpsARaCa8a+Gcw
         rPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769419660; x=1770024460;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qFepSabf96QcVfXCKhTiM0/xD6vjSZxLElXj77bKxb0=;
        b=tgHBa/Dvpw6FHvngSwoxZXSX9MIN+zJV++xKBbPsKmOR59aqQDgeMalmHOFrJ1HiU3
         obcPDRZj+F8RdFRx24TvHeeq7VcdHAiJ9J7ApuZ58BMm43SGKBXeMbSusE3z312e86cf
         rCWu0S2ueZJNYNB8l8Vqfh/f3tHEVJG/6JN3aWGY+6iv5V9GGvS0XbkG/w4BdzCggYWS
         40K7v0w39Sng8Q49dNi6JLq1PMI5Fb3BB7K62i4668GPpuA8vS/3mranUqWDOKb7EUPv
         my+M+y9/PX3d9aJlWOq+y0PXwdgdQ2jJIVO9yKnfmuokH0za7FwYw2MIZ+IWUT+ObYLp
         IeqQ==
X-Gm-Message-State: AOJu0Yz/wv6AXuiETrZshlUexr5IE9Q6r0T9SCsB5NasGSe8fk+hxUuN
	gdB37rk3jqoHoNyQmTijyDANB9XejSmv6YRRDQ1KSNe/0BbTP9hBpXRiG37nKLXMZ6DMLfYghg=
	=
X-Received: from wmlz11.prod.google.com ([2002:a05:600c:220b:b0:47d:8744:3dc3])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f8e:b0:45d:d97c:236c
 with SMTP id 5b1f17b1804b1-4805cf6699cmr52231985e9.21.1769419659870; Mon, 26
 Jan 2026 01:27:39 -0800 (PST)
Date: Mon, 26 Jan 2026 10:26:40 +0100
In-Reply-To: <20260126092630.1800589-12-ardb+git@google.com>
Mime-Version: 1.0
References: <20260126092630.1800589-12-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2789; i=ardb@kernel.org;
 h=from:subject; bh=jiHSf63B3FCpPY5LRg5zb9pMV7UOm8DsB0K5QVCNRaU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIbPc2PvMs/ffLc8t0UhLlfXbtjQx61Xhpd9aidZnP7BJe
 a3lidXtKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABN51MXwz0quV/X2CbNbF+fy
 zWmfb8/PosuzbKH55rsCnUf0XFObfRkZpuns+C7x8Nb8GRsO3Z0lduATA0vcHI4NP3wiZ77cf3R jExsA
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126092630.1800589-21-ardb+git@google.com>
Subject: [PATCH v2 09/10] arm64: mm: Map the kernel data/bss read-only in the
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
X-CRM114-CacheID: sfid-20260126_012742_111009_5306B341 
X-CRM114-Status: GOOD (  16.11  )
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
 arch/arm64/mm/mmu.c               | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

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
index 18415d4743bf..fdbbb018adc5 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1122,7 +1122,9 @@ static void __init map_mem(void)
 {
 	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
 	phys_addr_t kernel_start = __pa_symbol(_text);
-	phys_addr_t kernel_end = __pa_symbol(__init_begin);
+	phys_addr_t init_begin = __pa_symbol(__init_begin);
+	phys_addr_t init_end = __pa_symbol(__init_end);
+	phys_addr_t kernel_end = __pa_symbol(__pgdir_start);
 	phys_addr_t start, end;
 	phys_addr_t early_kfence_pool;
 	int flags = NO_EXEC_MAPPINGS;
@@ -1158,7 +1160,9 @@ static void __init map_mem(void)
 	 * Note that contiguous mappings cannot be remapped in this way,
 	 * so we should avoid them here.
 	 */
-	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL,
+	__map_memblock(kernel_start, init_begin, PAGE_KERNEL,
+		       flags | NO_CONT_MAPPINGS);
+	__map_memblock(init_end, kernel_end, PAGE_KERNEL,
 		       flags | NO_CONT_MAPPINGS);
 
 	/* map all the memory banks */
@@ -1172,6 +1176,8 @@ static void __init map_mem(void)
 			       flags);
 	}
 
+	__map_memblock(init_end, kernel_end, PAGE_KERNEL_RO,
+		       flags | NO_CONT_MAPPINGS);
 	arm64_kfence_map_pool(early_kfence_pool);
 }
 
-- 
2.52.0.457.g6b5491de43-goog


