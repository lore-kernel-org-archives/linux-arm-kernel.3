Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF83CD6E41
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 18:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hN7dKQgvYd9nbZsuBceB/G3FfRSci9s4lIdLcy6NsRQ=; b=BLv3MbcWCMFKQYRbTjYgHe2e4j
	ULiGPfGF5AMeO0vC7DVMieYEDHGeT04Osfaa6CcN2OZZmM9aOaeOeA2ZoXxyjZg0l7+bftr9wKbyA
	Q/ZQAOpbBOkYeGfgIdfs9nDl41hUyAVT9BaDqj8mJ10KwbtlUE40eskgIS/Mxef/37H54PK03KS/j
	Ns/jxiYHKiEec/C7ix1u3KB8p62ZB80xLWlggJ4eGi/25kfUV/fiPx7Y4RHpd/AgPDNriGzkOGTIo
	8NDANrIFLqFUD7wQZbclVOeGiDYw2ZaEzCIsOlt60QlmhUhB/5zctNZhphjHcZKq5s2JsHMSH4+b+
	eS8cU27Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw4U-00000002nKN-0pGk;
	Tue, 26 May 2026 18:00:06 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw41-00000002mqG-3Gd4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:59:38 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48fd396daedso60330155e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779818375; x=1780423175; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hN7dKQgvYd9nbZsuBceB/G3FfRSci9s4lIdLcy6NsRQ=;
        b=SBI8L9MkELhmAetgRfxsOQpfrAppKlMV3JRUjRX301CDeGaOcpYqsEZe8Wpbu8BTWx
         corhlou6vvR751bwjgTrMQXB+Vgsovno6Ez+ES4eWK11s0cAxl/5pygATTqxpSWs2ivd
         sJwjJd6pgiIZ6B/48wexh58ZrQkBofr+JcNm5BTL7vAcQN6AVmDvfDm7LeSWRmUn7kLr
         uIOz9BrRnFhQNfFysXYMesuDAGhAnisXjT3gS2SI6PZXzh34e+fQ7rC4veMTct2pyz8y
         eVSsEBjKCJhEi44IVtXpWEOaXsTfEd9nOwVILmlfaGg7R1uibkB72u2NZxAnIjLc0Gep
         Ehog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818375; x=1780423175;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hN7dKQgvYd9nbZsuBceB/G3FfRSci9s4lIdLcy6NsRQ=;
        b=N6beWkNg4RKVQF/rorM6w7IbmNfwuFrb20jeYKTASnZ9xiWVdM1nZ+HLknwVdVOoxR
         DPwo6WujkYKHC0yE2DBp7vvCP7XKEvluKZqoFioSVUdGUvoHyluz2KfeQJXRX7Olauj6
         Dbt3YkTpy/u2GMh1Pq/0RmqlE++L1d2iiWEMEdaA0j9jhLO/iehBaavVpHWMtHIzf829
         XpuA8KgvMmVaOF2bvh0ftgoGEjzZgR3LjvJqXOCaKxET38BcwlOnvvTxo6j7SGNJA/ba
         UH+u482pBa6hhsZBXt/MBxHhQ/lr9Lury9onwS8G8gIELL37l2i7nS2ImNgjA4oI60Ye
         hZBQ==
X-Gm-Message-State: AOJu0YyWKUBMYpwUaxBqRuJbnK4Rng9XCwV366xNR7l0GICz+/JKCGVp
	/DDxqJsgHKD9C6z2FOXwW7QRFrHOe1na/jtxV8pwOkDqgcRoxuiNSiXs8Cpo0E6hwCfVpMQOYjy
	heqnGFUwIn8dIjJx3TZe55ipCpZmgl7Hw+phPZ/jkBhKWUgNSluJ0QFMqy+4b2GLbauDgRZ3qHL
	pBCvw4GoI/lbmYNww+ott1AINYq7AB9Co4r0zbTLfjYG3m
X-Received: from wmrk9.prod.google.com ([2002:a05:600c:b49:b0:490:7e29:9cea])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a402:b0:490:3f7a:108b
 with SMTP id 5b1f17b1804b1-490426c5be8mr278139655e9.16.1779818375139; Tue, 26
 May 2026 10:59:35 -0700 (PDT)
Date: Tue, 26 May 2026 19:58:58 +0200
In-Reply-To: <20260526175846.2694125-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260526175846.2694125-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2428; i=ardb@kernel.org;
 h=from:subject; bh=bcrl0Dq8YQBZ2y6oSLTxv/uZS/MgfYTkD9gOirfShVU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUv0fppn5XvTONsranx8M7mVQs+XJQdo2RuuSWq7JaMf9
 7fh7PqOUhYGMS4GWTFFFoHZf9/tPD1RqtZ5lizMHFYmkCEMXJwCMJEXcowMtw6WZR/exrN7YplZ
 UMhusfI9n1W/fnxWF5Br8bb/o5j6XUaG9kh5ycXzfXi7yhR03u2bYfF33raUQN5POWLfbh9Jdln ECgA=
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260526175846.2694125-28-ardb+git@google.com>
Subject: [PATCH v6 11/15] arm64: mm: Map the kernel data/bss read-only in the
 linear map
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_105937_848237_1B574591 
X-CRM114-Status: GOOD (  16.16  )
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
index b20c76b8381d..e7ca53d20b87 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1138,7 +1138,9 @@ static void __init map_mem(void)
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
@@ -1171,7 +1173,11 @@ static void __init map_mem(void)
 	 * of the region accessible to subsystems such as hibernate,
 	 * but protects it from inadvertent modification or execution.
 	 */
-	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, flags);
+	__map_memblock(kernel_start, init_begin, PAGE_KERNEL, flags);
+
+	/* Map the kernel data/bss so it can be remapped later */
+	__map_memblock(init_end, kernel_end, pgprot_tagged(PAGE_KERNEL),
+		       flags);
 
 	/* map all the memory banks */
 	for_each_mem_range(i, &start, &end) {
@@ -1183,6 +1189,11 @@ static void __init map_mem(void)
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
2.54.0.794.g4f17f83d09-goog


