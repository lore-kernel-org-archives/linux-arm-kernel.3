Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2492FFF886A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BA/E6WicDwezK3gyiAo3eqUE5pDQu9c0JrSuIiaUTE=; b=qVo1Iy6O+zKmCjBEQxAHlqSELf
	f7XpvbeTvrwM6tfaxmu37x/5CmUq1WO/I4I9Hp/c+0lW1VjaPsfVwnyIKCAzu9XM4D5X6A3wTI4bJ
	G7cv4/C657wr38GlSkAIgH74bcY4PUZCQCJYLVMrdWEbVmebJt3jqyohcyaraF8OGDLW35BMaXFXl
	J5U5lmKdXPY7FHbwS+glVDqr2KNGxyjp+UEWL6AwdAShkpzdZw4OcqWEFXQW6JS0IRDwU3UKvSv02
	gJFbs1XcpOcO5+d6r0G/AQlfQDbhraRGCBjfXpEa7xkKjtiG5MD9neN8dBKwTnSlhimJqFpCbDKve
	0J9lDq1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHO0G-0000000HCnO-4Bq0;
	Mon, 27 Apr 2026 15:36:09 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzu-0000000HCTe-0CVr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:35:47 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-488dcaf2f2fso91347755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777304144; x=1777908944; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1BA/E6WicDwezK3gyiAo3eqUE5pDQu9c0JrSuIiaUTE=;
        b=av5/+O/X7Vu/PgI6ikvqlLFV7H95lZKv6Jwt0ozDnDaT0ffnOmfTw7fXL+pSbTuKRW
         VLDG+0JiZKDnas8tOzGs57uAYIycPxNfIJ8tf36LuviqVUscYOPGljU6jBrcuSUL8rkY
         a0t6UFlnJr5lbkVw4h0CCCANenXUWtghxUSRw91E6LpPgSOm+zJLms5Nc1dwC41invca
         k8LB8WIp4F31y0Ocueb5BVRvjKi+d89nTP9LTAZnveRKPWF6TEjrUDAgSEhtiKJtKuEi
         gD0oPAVkmGuLyLnIXUd21Xg6jYke7mNzMvqeir0FIn2UjNznpEfWXdChBv6MXYU6Sr1b
         x9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304144; x=1777908944;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1BA/E6WicDwezK3gyiAo3eqUE5pDQu9c0JrSuIiaUTE=;
        b=UQFw1QB0VV+WgtT/VEn6d1uSVLeeYUDQN5kRcNaWffClAjNHPnSzaOJC6UtkZIGTP8
         snvHxl6xzFRZ0F30bW857auCf29RCrOU8gy3n8jMGngV3fvcmKKv153oLEt4KTyc4UvT
         /W9Cu4l9/D6m8M/RqMkDEv2Lt5XqJtoxKUQRBT3gs4lfGRpvuGSIm8CsrTl+/x1iw5Oj
         fZPly60D7L2dSaeJMeJs2+B+kmSdqeMX8ukXc9beL0fszvbAeUyzd8TxrH+gSrD+qvRl
         O1Pxq1fjdRN77Ww7gYgGWusCH+rneKnRPy16Is6dj2hNSP5aQHaUvVRuEBp5QfuC1qum
         HFsA==
X-Gm-Message-State: AOJu0YyCcJlIG4RHH9ZCALiPm8EZ/qwfelkU4//fORTMXO1VvSzqoj7A
	GAYx+LZTbiPXYRGqw7CFIcQJ+Y5nr9iIVAVx1RaKHbJIqSo1qW8eh69xx7DKatvfmzNixZfu2cP
	s373z8I9uLVUiSENo12/KPMC5gOoXhKsi/qVkZHpydJzib7DA/YyiIR736G1mbX6TE1BoVxEbi7
	9DX+0umqHu7VEw6451Yd3KVxjJ7WacFtmDEzsK4scQrUaV
X-Received: from wmsl15.prod.google.com ([2002:a05:600c:1d0f:b0:488:7f4d:30f4])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8115:b0:488:8577:d9cc
 with SMTP id 5b1f17b1804b1-488fb77faacmr552964815e9.20.1777304143994; Mon, 27
 Apr 2026 08:35:43 -0700 (PDT)
Date: Mon, 27 Apr 2026 17:34:26 +0200
In-Reply-To: <20260427153416.2103979-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260427153416.2103979-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2895; i=ardb@kernel.org;
 h=from:subject; bh=KZuPOnzhvCTYIkGg+7u5wsbMT7w/fODSH3EL/0/zagg=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfN9E5vLgafBpVHCxz1SUmelxP6Kd3qkdfpFsMXLg9sPF
 WoserK1o5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEykTJOR4TUXe41Hw4vaRzxT
 mGLXWVx6se1hW1uOb3v81vdLAn5m5jP84ZJm0rae256UuMVmRe7sInHmbY93p/Jwyz966BT+h1O dCQA=
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260427153416.2103979-26-ardb+git@google.com>
Subject: [PATCH v4 09/15] arm64: mm: Permit contiguous attribute for
 preliminary mappings
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
X-CRM114-CacheID: sfid-20260427_083546_113676_C9E83290 
X-CRM114-Status: GOOD (  17.26  )
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

There are a few cases where we omit the contiguous hint for mappings
that start out as read-write and are remapped read-only later, on the
basis that manipulating live descriptors with the PTE_CONT attribute set
is unsafe. When support for the contiguous hint was added to the code,
the ARM ARM was ambiguous about this, and so we erred on the side of
caution.

In the meantime, this has been clarified [0], and regions that will be
remapped in their entirety can use the contiguous hint both in the
initial mapping as well as the one that replaces it. Note that this
requires that the logic that may be called to remap overlapping regions
respects existing valid descriptors that have the contiguous bit
cleared.

So omit the NO_CONT_MAPPINGS flag in places where it is unneeded.

Thanks to Ryan for the reference.

[0] RJQQTC

For a TLB lookup in a contiguous region mapped by translation table entries that
have consistent values for the Contiguous bit, but have the OA, attributes, or
permissions misprogrammed, that TLB lookup is permitted to produce an OA, access
permissions, and memory attributes that are consistent with any one of the
programmed translation table values.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 4eab40f4aa6f..5e2348b15783 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1000,8 +1000,7 @@ void __init create_mapping_noalloc(phys_addr_t phys, unsigned long virt,
 			&phys, virt);
 		return;
 	}
-	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
-				 NO_CONT_MAPPINGS);
+	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL, 0);
 }
 
 void __init create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
@@ -1028,8 +1027,7 @@ static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
 		return;
 	}
 
-	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
-				 NO_CONT_MAPPINGS);
+	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL, 0);
 
 	/* flush the TLBs after updating live kernel mappings */
 	flush_tlb_kernel_range(virt, virt + size);
@@ -1175,10 +1173,8 @@ static void __init map_mem(void)
 	 * alternative patching has completed). This makes the contents
 	 * of the region accessible to subsystems such as hibernate,
 	 * but protects it from inadvertent modification or execution.
-	 * Note that contiguous mappings cannot be remapped in this way,
-	 * so we should avoid them here.
 	 */
-	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, NO_CONT_MAPPINGS);
+	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, 0);
 	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
 }
 
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


