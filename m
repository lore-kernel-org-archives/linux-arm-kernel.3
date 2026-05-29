Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CDFCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SMbp+4SpJBPuSW3tE55txpooI4fjODhC3THY1otv5g=; b=qke4olp6gyvEO6QJeNv77vvb7I
	CStcmN4ojMlpdcTIXmT9FZNLkd9FTDamRSfLvVJqOlvE3aRiUkQfsPUfZL2kA0bJiQvQMClrykC1+
	+r93lXRTfeRwVs79jhFsjjHxhE+Yj8jpef9FRoqcKjVtUXObX4TnWRIyJ8hQ2ehKWLc8ZBnGuYbBg
	r2Du5hrUHpa/yiXa2PgRbHCHXg5P3UiXlSRizQ3V0jieIZSBbtZLX34L2FDX9XBjzEEV8hr3Acoa5
	DZSLkgW+Gfo8iL0r3z6QeSxGGhUbUzwxV+xaCfmAG/Z/XXQ+v5y+Wr9O0K4BCpmXiKGXvzjgctH+H
	8prgaD9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyjP-00000007bpN-1CGi;
	Fri, 29 May 2026 15:02:39 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyjB-00000007bey-0uiv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:02:28 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-45ef66cc579so84076f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 08:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780066942; x=1780671742; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9SMbp+4SpJBPuSW3tE55txpooI4fjODhC3THY1otv5g=;
        b=hlz4jY414Rd5mLIBS995eRXYnSSRQucznrbp6MMPC8x6vAQYFUZUo7QEWuei7pV7vM
         WZdfkPT7XNreBcqRwT/fCq4mLMvyzRxxEZud086vPnJ7c4VaOa/bzLBnmhnuem2heWld
         0/j16Pp2eSDvX0wUi/MgcZIU3BZfdeSLvdpm0W9CaCvkGh3YMva+3/Im0fYj5XrGy6Xc
         IUmyJac2s4s8j6OR8gsXdNyhEaVzTaPGsnVbjSJrQeiExYYwo4AyBa5pQ1R6in9GYHYl
         WEgTGnnQCyEz+BVHhDrj7MlyTtEttqtULVVsN3PnzJ2uTSOqGPN/nqIS8eAO/015YoJL
         3pdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066942; x=1780671742;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9SMbp+4SpJBPuSW3tE55txpooI4fjODhC3THY1otv5g=;
        b=cT73dI9KXkizNmb774czpx7zFJKBqGJly5wQZn/XAbu88OErcrKLUbYze0OMz4naj1
         7nouNuJg5F4DnSU/Gq3lRoj6S9hczGy1DEvfKOt1iNqIA25uRiJhrkgAZJKlym12eAHS
         g0RycoGW6xHA1cDeMm75S189yir8hlMZkKLCnODpfIg3oMgIoteeFoHndO15RXDVfQ8W
         c5eddCedtHTOJ7goPQmvM/dNEGLXRQmIE0UW7z1uAH12o2dnov5ARy4JqhdOIZCxIfEq
         sj1G1TcfWlx9Uroasud15zuRejbeqNptF23aJZNWYj9yD3P10DOqVSGKonMp7QzNTqdw
         B7IQ==
X-Gm-Message-State: AOJu0YxdXbw411PEPkcILsON/mNtmQYi1kLukob3zN6CtKZZaRxRsLqf
	LDnIGjFCk/IX6Rj7UdWec5tMjLdt6YjAfX4E4i/LwFrPS4rYerPNVSrIQxac15Ml+uck55ucbu9
	JycbrCaTBmyLSpe500luFB2Mpo1Iyqm5Kv7VklD8QxbbXKCS1NMan7icb6j6rVSsy40ObFopIgc
	gfclD6dgE8Wo6Ax7VdYM6Pl9vPhPeq43u0INgV4PwKKHt3
X-Received: from wrna16.prod.google.com ([2002:adf:e5d0:0:b0:43f:df99:cb43])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:b05:b0:45e:e3ea:1101
 with SMTP id ffacd0b85a97d-45ef6b3a9d3mr250438f8f.17.1780066942102; Fri, 29
 May 2026 08:02:22 -0700 (PDT)
Date: Fri, 29 May 2026 17:01:55 +0200
In-Reply-To: <20260529150150.1670604-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260529150150.1670604-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360; i=ardb@kernel.org;
 h=from:subject; bh=zgVblspip5ZINNAWS3J63kCjniwJXU0OYP5r0DXGxEI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUtyVfJJkczPYfGm/hd8+FL02y7q1vnc3l5lLz2B/bWeR
 ZyU8q+OUhYGMS4GWTFFFoHZf9/tPD1RqtZ5lizMHFYmkCEMXJwCMJGrFxn+e55rMk6KmS+o8qjx
 TFPydss+tp/hHKtbs3vkHc/PO8RoyvA/WrE+UfB50QXpS/Hr3nSqW/oxK2XsCGS8dSmZxXNHTQs /AA==
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150150.1670604-21-ardb+git@google.com>
Subject: [PATCH v7 04/15] arm64: mm: Preserve existing table mappings when
 mapping DRAM
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_080227_018144_16DDA741 
X-CRM114-Status: GOOD (  11.51  )
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

Instead of blindly overwriting an existing table entry when mapping DRAM
regions, take care not to replace a pre-existing table entry with a
block entry. This permits the logic of mapping the kernel's linear alias
to be simplified in a subsequent patch.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index b2ba5b35c35f..5c827fa3cd38 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -256,7 +256,8 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 
 		/* try section mapping first */
 		if (((addr | next | phys) & ~PMD_MASK) == 0 &&
-		    (flags & NO_BLOCK_MAPPINGS) == 0) {
+		    (flags & NO_BLOCK_MAPPINGS) == 0 &&
+		    !pmd_table(old_pmd)) {
 			WARN_ON(!pmd_set_huge(pmdp, phys, prot));
 
 			/*
@@ -379,7 +380,8 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 		 */
 		if (pud_sect_supported() &&
 		   ((addr | next | phys) & ~PUD_MASK) == 0 &&
-		    (flags & NO_BLOCK_MAPPINGS) == 0) {
+		    (flags & NO_BLOCK_MAPPINGS) == 0 &&
+		    !pud_table(old_pud)) {
 			WARN_ON(!pud_set_huge(pudp, phys, prot));
 
 			/*
-- 
2.54.0.823.g6e5bcc1fc9-goog


