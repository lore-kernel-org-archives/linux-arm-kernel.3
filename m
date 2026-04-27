Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B9BFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wb69xevabgQmFZqaaKZbB6ba2WMM/rgvKxL0qThMEZ4=; b=sulwGGaI1hg2j5K00R2DNIZikr
	OAhm8t/JhR/BH8/a3VZ05zmhQRy/RBuqU6cJEI0obnqtyXs9D9hlThPel8WNwG5IBtq6hsryjgST4
	WN/X1T95Yso5kipMv6YcG6/kEzhT4HoRPAL0AWK7THf9eQDS7tT9eTqTbsNpEMUTd1BiQrYs3JbUg
	bmUsUid4OT6Bd/THqkDXkuMpBrR9+BF4BOR+QeKzZxL5dr65TgPwCT6wCE44jtJgApVB0tBCdpNj9
	nKrpbpgMHKigLsWAs0IXs0aKfAOIakepekJBKvjFvU25U+49R9QFkCQNta8KI3KuURWDobxpbfQXA
	z2ParDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHO0I-0000000HCpU-2Ajp;
	Mon, 27 Apr 2026 15:36:10 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzw-0000000HCUY-1Ntz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:35:49 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48a5adc141cso37668595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777304146; x=1777908946; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wb69xevabgQmFZqaaKZbB6ba2WMM/rgvKxL0qThMEZ4=;
        b=FI7sY9u9fxc9yH6vq7tGjCoPV0P2CEBfbYIgLDRniGnauQblkMxWuO6nZbGdwALgEz
         E76/kPt1Nj88BFZ3mA1xLa8wqWbJHfpYGpPGii0mDP8bwjJp1oWdG/CkNcctwJgei+jB
         8mdHKdQhM2M4FK7WbfRtUDgeoFduF8lohwgPzaWP3w0qN81yRYaJLbzvzkLzpHbbQzeC
         wHgtJhsC0uRbr+55PkuRq+KQNlJuvJOEIgeE7+5zZsWX5ND0IAcywETfcNSuAZsQGJS7
         vSpIDLxN7OQTOtXAo1x8N19D4qWKXueallaBumnjyVzFk9rJt242lfFsT8PteQvO3En0
         Q1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304146; x=1777908946;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wb69xevabgQmFZqaaKZbB6ba2WMM/rgvKxL0qThMEZ4=;
        b=WOcd776LmgC5s7cyeFedrEB9Z6v+jp1G4yLNnXPPIGxlKHc41CvOEo2eVdSKvSIgvu
         ivETlP5e7ql/eS2Og22Idgs9KniLz4vxb9T63vqxxe2ZIM4S3RXD8CnfpuN+9HsxVq4t
         P3nf+UEgmFXxDgXIRhHtOd52aw7bv8gRRBxNQ8ZGjulLazC2ATeIix+dShIA0WLtjcb1
         Ylg/NU6oXOslHkLEV3eKgL00iKB1aAg2kNYRtNbPDqDdLHtOz34Bzy5GlKrYJKhoviiO
         kVtc8iwdoRlz3pL1CYmz+H1Qkq67VGcru+CGPQ0wXXPDAoDlll+xd5zRFgwo7UsTXIjO
         FgKA==
X-Gm-Message-State: AOJu0YwQHp/PRVLI+7ACjegzzD2t/2OG73dfYs8/U+FyHkvwrftJDJO1
	uQ3gptcZCgI0xGvBltQOnblgkJlqKD+5fVn+kqy91FY1RhOi1XxQqAbU5TMsdq29VYePUhYwgg6
	b8gAk6RGrMxp5Wqc+9g0XzegTN68K3vB2fAwQcgq8SU78zAnxqKk9EyM2k5+2AiSy1XCYk2ZnXG
	9y8cSWBTE8mNaqmlbKQ1Hx6RZ9MAzeFzBdRIycUOA4MZ1V
X-Received: from wmbd5.prod.google.com ([2002:a05:600c:58c5:b0:487:38f4:9550])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:870e:b0:488:aa33:dc8f
 with SMTP id 5b1f17b1804b1-488fb84ffb8mr585875005e9.0.1777304146208; Mon, 27
 Apr 2026 08:35:46 -0700 (PDT)
Date: Mon, 27 Apr 2026 17:34:28 +0200
In-Reply-To: <20260427153416.2103979-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260427153416.2103979-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467; i=ardb@kernel.org;
 h=from:subject; bh=TVDzWXCizjusDiJt30HNr7P0mL2kBIblXPS9xGhGOSo=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfN9E+ehGfdF/QRq/FmuJKZkGvWc/iT0g6Gl2I5tubnAy
 Y9CG793lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIlEqjAyvDcKPHlm+gTZr9FO
 zowHGPXW3UnPWRRZvm1iz+ZPz5uFVjMyPDzwccZLZ47pM1nk2/aq55zdOYtBz/fIlbs/+xIOXNz +mgUA
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260427153416.2103979-28-ardb+git@google.com>
Subject: [PATCH v4 11/15] arm64: mm: Don't abuse memblock NOMAP to check for overlaps
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
X-CRM114-CacheID: sfid-20260427_083548_390749_E50C3C47 
X-CRM114-Status: GOOD (  14.61  )
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
index 5e2348b15783..1a4b4337d29a 100644
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
-	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, 0);
-	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
 }
 
 void mark_rodata_ro(void)
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


