Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE73CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PeNX/sq3qAeE+0Jgb2gDcjXZ+vgfMIqyhOsW6MWEq5o=; b=hixvJ/5MHbFVx8lAgZPjtM+cdK
	p7ki50Fxyj0SRPKRGuZZOgVTtd0qbBU8E09r7/l/M43ZtwZGp2ZUhwqcB6tGxp32YUEs+crTYZbrE
	+VEAfhdCTsvF31y72RD67WNRhGBNyeLFRyJkgiumVRf40yy5IwpwuWNNucBHJzm95DNJiNVxek7Xz
	JPaAdmPzuZwW1djKJHjVL8hjV5AY58zlCxDXo+VkyNNNqBPipWX/XGLPXbVbEURV7vYMBx8VvXMxx
	LfMzyZ6RUONLxpz1/SpHYa2aYGdEC44DVmZHkWI+D2sj0ovqYrAzzwKHoCUIi342V4/x+XqVKZygT
	Dk8HOUBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDd-00000001yyp-1Bu4;
	Tue, 19 May 2026 15:18:53 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDQ-00000001yir-42hD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:18:46 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-44d9ace59efso2440700f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 08:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779203918; x=1779808718; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PeNX/sq3qAeE+0Jgb2gDcjXZ+vgfMIqyhOsW6MWEq5o=;
        b=GpsqG8+ZK1V64PaaLeOHUzqLKXJICVVkiXtoiggq/APg/dU3Mu+IPsVEVtjTSysPWi
         q/5sgKJSbDS0Webqga3vefSCeVTxrkv5T8PtGCxarm6PxRRChxIi8l6xurQJcbnPl3tY
         5uGtDdol88ApoQeVKsfXzqRuowM/m6Is1/R6JAVKDu7diHYBhIRAPdBbpKIW2P6U8tEI
         6UPhzP/3hXAFVI9aLezoXEQ9uCX02C4ZcBDMoGhqe+wvCLaJd1eqejL6E0laRjRa2AGG
         fVzLw0C9x3V9dXf1hCbmxY1TBhgPy8zURf3Lso6hDpMGKD+Lf0wEmywOezA0JDwaFZPN
         26Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203918; x=1779808718;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PeNX/sq3qAeE+0Jgb2gDcjXZ+vgfMIqyhOsW6MWEq5o=;
        b=gwUx1S3Ru+qcUbQTjOOTktzw9NcprxEyhPXnnjgMPvquEhyneZU4BOXsPRf8qTVp90
         CDM9447hE/8wkHrpa6aTmdL9DV2HPJuh5E6Fhj51wkG3vVuWCoq/G0jwkJOVldwaymiL
         0+S1q9WFMBD5DPDioeSBGKH6HroVF0jlED0oWtuyeau4XKEfL5Luua+lgZYFXLBQegkS
         xU777BR441l3ExgVZfRYoobDo/KsW53BtVGL2R9n+ometVnMgbZNqsP1EeF3lEeTjLUP
         Mry8CyOKinY3yEu9aQwDbGVFXZvxGZj08j+3GJd2ViCmacv0NGdQgVmdkr3I1NLU6bJr
         +zOQ==
X-Gm-Message-State: AOJu0YzpLJFTF9vG6dXmfpeJ+oEhquvJm8ZF4XO28sAPYzZcvs8MZjWu
	Y1FZ5G1yhnJ7URpQtHTtiEoPTEL5iSNNTJ7YtlpfwI46j8Trp/Ijvk5K6MJcp0R+1GKaF9m242N
	E8vTMsL9IDf4z3JydcCrRAKSrU2hnBXVe6/WKtA/NpVRFtf4NIlzSmhXy3hdwtB0dC8pMKn1o1W
	e7pt5u14VYpxRlT9d6FiyD80SaQuLKU39R0NEYwiuVsulc
X-Received: from wrvg5.prod.google.com ([2002:a5d:5405:0:b0:45e:75ad:a480])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2dc2:b0:43d:1c4a:37c
 with SMTP id ffacd0b85a97d-45e5c5b39admr32448104f8f.4.1779203918084; Tue, 19
 May 2026 08:18:38 -0700 (PDT)
Date: Tue, 19 May 2026 17:16:28 +0200
In-Reply-To: <20260519151616.2557018-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260519151616.2557018-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2478; i=ardb@kernel.org;
 h=from:subject; bh=MII6/zkHQg51STWxgZiHeZfac7n0lgddhJ/OqCE9V7w=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIYun7tKMjFO7jkszG8aGhd+QSjw303b/L077+SfKAjY8/
 6G1aQ5zRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjIzniG/0F3vjE8XuemeP5j
 peqFf91N8ZO/FNi7BhXKyu7ySV6pZM7I0CP+aGHaheKW3W4s3w4K31V9s2v3jofeLfIF7f9+95p 8ZAMA
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519151616.2557018-26-ardb+git@google.com>
Subject: [PATCH v5 11/13] arm64: mm: Don't abuse memblock NOMAP to check for overlaps
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
X-CRM114-CacheID: sfid-20260519_081841_626898_D8121A61 
X-CRM114-Status: GOOD (  15.21  )
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

Now that the DRAM mapping routines respect existing table mappings and
contiguous block and page mappings, it is no longer needed to fiddle
with the memblock tables to set and clear the NOMAP attribute in order
to omit text and rodata when creating the linear map.

Instead, map the kernel text and rodata alias first with the desired
attributes, so that they will not be remapped later with different
attributes when mapping the memblocks.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 24 +++++++-------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index d4ad9e4766a6..dcff1a538f20 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1148,12 +1148,15 @@ static void __init map_mem(void)
 		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 
 	/*
-	 * Take care not to create a writable alias for the
-	 * read-only text and rodata sections of the kernel image.
-	 * So temporarily mark them as NOMAP to skip mappings in
-	 * the following for-loop
+	 * Map the linear alias of the [_text, __init_begin) interval
+	 * as non-executable now, and remove the write permission in
+	 * mark_linear_text_alias_ro() above (which will be called after
+	 * alternative patching has completed). This makes the contents
+	 * of the region accessible to subsystems such as hibernate,
+	 * but protects it from inadvertent modification or execution.
 	 */
-	memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
+	__map_memblock(kernel_start, kernel_end, pgprot_tagged(PAGE_KERNEL),
+		       flags);
 
 	/* map all the memory banks */
 	for_each_mem_range(i, &start, &end) {
@@ -1165,17 +1168,6 @@ static void __init map_mem(void)
 		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
 			       flags);
 	}
-
-	/*
-	 * Map the linear alias of the [_text, __init_begin) interval
-	 * as non-executable now, and remove the write permission in
-	 * mark_linear_text_alias_ro() below (which will be called after
-	 * alternative patching has completed). This makes the contents
-	 * of the region accessible to subsystems such as hibernate,
-	 * but protects it from inadvertent modification or execution.
-	 */
-	__map_memblock(kernel_start, kernel_end, pgprot_tagged(PAGE_KERNEL), 0);
-	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
 }
 
 void mark_rodata_ro(void)
-- 
2.54.0.563.g4f69b47b94-goog


