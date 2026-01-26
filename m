Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A47C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 09:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8bN9+0hC3i3UFjsrkDr4IprbTkXXnydf0YR/5ee3vw=; b=mvh62+kwYeFqvT682oHyFOrWaL
	BI37+TDboiFrS/B2L4xkA2tjUb9QSCowksbBY4iEBr0ZPqmdkNd3PW37hPWjqxwubBTuELtVmrB4/
	Xy/sghozQPprnkmhHJE0aXwtYjjhm0fw+YZ2X0rR2uz7tzPkPXxv5cb/44gC+Tf60/FhCE0CsXUtc
	FDsY3g84K+iHzuirZ1RwubgeMBC+lyjJBWgoU82+x3JBM9L04HbEqskMN6Rng2PA6OZmn7m8FY9dt
	QCGfuyIfpegL9pQTex969vp3bIQNtrnUwiqIejB0facpB21qOHJ0XZzE22HaQXPkzNQiLZwpoRAvp
	UW3xgvkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIss-0000000CC7K-2cBa;
	Mon, 26 Jan 2026 09:27:46 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIsm-0000000CC1r-2dyQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 09:27:42 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-43591aacca2so3425786f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 01:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769419659; x=1770024459; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b8bN9+0hC3i3UFjsrkDr4IprbTkXXnydf0YR/5ee3vw=;
        b=ViHeDufGziVjahglN5yxDPXMt5pd6Uve6KjZkZ24ze1vp1VWHr6jiX4qUf0Y8JEXoF
         PSfPq2bA2Xw6KXiuVzzuk+6O9PJqBxuKMJj7bCje/XfeFJlCNHKrc1o1xG5bug43MXio
         wMvuDu+MXR+B/imuqzss82Nhl7U5xBc37fnGBWKfXHEZhNDDUoqIy1KH+HsZlFHtXi7p
         3IoFFiDWIojPjAt+egkFuZ3BqR09zKpH/lnI1qwbWu1W1SUa/EBOfKsvE9NcR9UNedAP
         VhTsfSCvfXX6ba6qfpOS0xj+N/CMjdb6cY7YPliedy27e8vL+yun4h9p5cAwSdFZMq/Z
         mIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769419659; x=1770024459;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b8bN9+0hC3i3UFjsrkDr4IprbTkXXnydf0YR/5ee3vw=;
        b=OQUAuPlG83k1xF2bZj8EqDSmpj79BModmDazmQCJuoyt4k4V4W1odxcQ1sElynKvVb
         6VjvfU6oG6auilZYnExtsKH9Xp/p6fkcjwB14c51wDPV7ne+aD+t0N3hMePz5rQv5yD4
         4WpL/3cus4lNhbdwkgsPYtaoZYUQxqMaaydx+KFAiskQNNYW5odBM89VJ11bXShPIP3T
         Li6M1nSnj5eZd4ldxW8AHnvaNaKWAsQ8toZRB4uHzdf7x8DQ95SzWt9ILOyFiZy5dglW
         0f+lgq0Yqg6AbUrMZn3HtcUAcYYEFe+yInXpNFaFbCaLsaIRVgK/wBoYbaFJ+4x6aq4f
         Iw9Q==
X-Gm-Message-State: AOJu0Yx11NKoRvrk9BT1mOGUcXJvec52T3b9wHYN6Vpwp0PwSCsRQMeh
	gpJIE9QFTLT/m7rpG9bxMZnI7UHLVVZB7cSNkfQ2PHjM/MFE1rGciTDB7bREepn0+f7SgX6zGQ=
	=
X-Received: from wrbdr5.prod.google.com ([2002:a5d:5f85:0:b0:432:88c1:541b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5d13:0:b0:431:3a5:d9b2
 with SMTP id ffacd0b85a97d-435ca118f36mr6760253f8f.39.1769419658842; Mon, 26
 Jan 2026 01:27:38 -0800 (PST)
Date: Mon, 26 Jan 2026 10:26:39 +0100
In-Reply-To: <20260126092630.1800589-12-ardb+git@google.com>
Mime-Version: 1.0
References: <20260126092630.1800589-12-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2557; i=ardb@kernel.org;
 h=from:subject; bh=rmNx3d+lMCnRD7RyRmlDmsqGvXRKVebRVRFOk/lmgBM=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIbPc2Ht90uP/C7a8ZzjyqPW2xDP/95rlGYwt6qU+phEnL
 px4eD6lo5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEwk6BMjw5GoSb/fmtytkImd
 eHq7FbuE3cT6f/frWTyZ3XeefH+Wcw0jw/nZt/eXOC9L5jR185u4va11Jwd33uYWuSBv5xkpTtp /WAA=
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126092630.1800589-20-ardb+git@google.com>
Subject: [PATCH v2 08/10] arm64: mm: Don't abuse memblock NOMAP to check for overlaps
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
X-CRM114-CacheID: sfid-20260126_012740_709838_9A8B7B0E 
X-CRM114-Status: GOOD (  15.59  )
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
with the memblock tables to set and clear the NOMAP attribute. Instead,
map the kernel text and rodata alias first, avoiding contiguous
mappings, so that they will not be added later when mapping the
memblocks.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 27 ++++++++------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 80587cd47ce7..18415d4743bf 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1149,12 +1149,17 @@ static void __init map_mem(void)
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
+	 * Note that contiguous mappings cannot be remapped in this way,
+	 * so we should avoid them here.
 	 */
-	memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
+	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL,
+		       flags | NO_CONT_MAPPINGS);
 
 	/* map all the memory banks */
 	for_each_mem_range(i, &start, &end) {
@@ -1167,18 +1172,6 @@ static void __init map_mem(void)
 			       flags);
 	}
 
-	/*
-	 * Map the linear alias of the [_text, __init_begin) interval
-	 * as non-executable now, and remove the write permission in
-	 * mark_linear_text_alias_ro() below (which will be called after
-	 * alternative patching has completed). This makes the contents
-	 * of the region accessible to subsystems such as hibernate,
-	 * but protects it from inadvertent modification or execution.
-	 * Note that contiguous mappings cannot be remapped in this way,
-	 * so we should avoid them here.
-	 */
-	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, NO_CONT_MAPPINGS);
-	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
 	arm64_kfence_map_pool(early_kfence_pool);
 }
 
-- 
2.52.0.457.g6b5491de43-goog


