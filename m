Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CF2CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 18:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/YEs+3ha0YZ0GL65qiPfv2bavm0rO2bwvFUt4jkd+Vg=; b=oEq75PpCCT7R5L9eUGUeOuMdzD
	KwyT//R3jqlWqDAPSJNS2tZEO+2weCdDwUlvRPyJWkv8DrwIzCxSI07cAKPkqO6rm0wg+aQn0U6ni
	L0Izrnn7NI5CwpbPRhbV2TG71ZsCSJj7BZTXp8H86buJGjSC15Tq+b8CrPXFrdev3D4t1iYlrH9Fh
	KLQkflzIsBJcX6YB48v5Gws7hPj3kxrwZ4wiYFfZ5HCushYDnaYNHtC7TuGueT55aSFSkx+Lng905
	b82vIL55x8rHogZq3a47sLrlFrAW7NeSzUwHSFSf525YrKMT5FH5wvcoGsK9BDd70XOyGEms5tlAj
	e6kLCfLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw4T-00000002nJk-3uHg;
	Tue, 26 May 2026 18:00:05 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw3z-00000002mp3-3yGt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:59:37 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4905428aad6so30182135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779818374; x=1780423174; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/YEs+3ha0YZ0GL65qiPfv2bavm0rO2bwvFUt4jkd+Vg=;
        b=Xca96ZBWxUgQ7vhwDO2EpbGbna9RJxbdwMLB7i/8jMsLzZg8Ia8xKsdF9xEXDMOiW6
         sLWPaYvNOVLZoMOD4tnqFhZpmACN1eVO64AZLmSxsUQzC4etTvmmCAOGC0VaXOVwbFlv
         eb9V/aKega38iQPeOBNB0wSe7FfQkEkFnhE98+2dUeDfCSJpYuqkdDul+o+yfjzqsQJG
         rD7xjl+Wa7dgyQ28Ot+pIOCt6r+OQQ7+h7S93sS/a21kBav1k9rghUf7oMxh4Owos/HK
         VuGcLVsVJbuwAPFar4GqVQQzOy3D5faa5pKZ0EZfSXOs9esvbInq1LP5CawjT6Dn9Myc
         5+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818374; x=1780423174;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/YEs+3ha0YZ0GL65qiPfv2bavm0rO2bwvFUt4jkd+Vg=;
        b=rNg2IgJpaqX3Y0eBetzQ3x5ZwGx2gqh154BEVwy03PJYadT26QPmRi/EyQvN/KDJxr
         jUdVWjfubit7oFgq5Gfrl2ouqXAgxstT6GqRNO4lzLkIdP9VJ4Avf+gPaijZk/jtjP9o
         6bUQPmVgWFz8FnH0X7f79y4KG0AJtLK4gtu4thNhswYc3eokTvKI6okvkqSFqjwAH41p
         c4eEdYYZubcZuNuCs1i8oCRNgnxBE8063V4z6/Kp4o8q/6hRkghuZ/pRtO+sebqK2oIt
         IR0iGZM8gEpBbae+kEECM5KrBGMLqNC78Pmg5vSWLtM6+/O/Imc3TJmZf8zpMCEpj4b0
         amlQ==
X-Gm-Message-State: AOJu0YwOpC3gc99VNJf2OzjIzg9TQG2FpyCKFBtKkR6spqo509n3fSE6
	t0CI3uoCx2f8GvVDJRfWgBgamMV4aLhuU7Ksgc334/leh8VkVRnBgQowc5LZwBh9pAfuFFXhQ37
	6/rTpvMlZ4HgTaBhP2YsRmfHLg54Qpzqk6d/DKUbLF7U8q/HpLkXdpuRth6yteB0Yp5LhXFsUuf
	7/+KGfH+q+Qlb9Swd8YZaR6JXM4JqbxnnrQzeAaOjBIb0P
X-Received: from wmri26-n1.prod.google.com ([2002:a05:600c:8a1a:10b0:490:49db:2263])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5298:b0:48f:e230:1d12
 with SMTP id 5b1f17b1804b1-490428dd63emr346556585e9.31.1779818373602; Tue, 26
 May 2026 10:59:33 -0700 (PDT)
Date: Tue, 26 May 2026 19:58:57 +0200
In-Reply-To: <20260526175846.2694125-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260526175846.2694125-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2521; i=ardb@kernel.org;
 h=from:subject; bh=IVFHANRX1Y5B7sO2czLQgDyXUEkQiTSy8G1FQDCgg/E=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUv0fsoLbrWLu7gSw7a4He9yccnfFaz2Zfnzl9euX9kmw
 5F4//u9jlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCR2HhGhum3KqfUzpnosfjs
 O4PZz65tu/Cten/afJ4dmhfPiNRN+BDP8D8myOOB5p+Lm9QF963bJLbl3IvwqSc/fj98Oa1ZZH3 U5m2sAA==
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260526175846.2694125-27-ardb+git@google.com>
Subject: [PATCH v6 10/15] arm64: mm: Don't abuse memblock NOMAP to check for overlaps
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
X-CRM114-CacheID: sfid-20260526_105936_029897_5D2FD611 
X-CRM114-Status: GOOD (  14.89  )
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

Now that the linear region mapping routines respect existing table
mappings and contiguous block and page mappings, it is no longer needed
to fiddle with the memblock tables to set and clear the NOMAP attribute
in order to omit text and rodata when creating the linear map.

Instead, map the kernel text and rodata alias first with the desired
initial attributes and granularity, so that the loop iterating over the
memblocks will not remap it in a manner that prevents it from being
remapped with updated attributes later.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 23 ++++++--------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 04cc579c7a15..b20c76b8381d 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1164,12 +1164,14 @@ static void __init map_mem(void)
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
+	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, flags);
 
 	/* map all the memory banks */
 	for_each_mem_range(i, &start, &end) {
@@ -1181,17 +1183,6 @@ static void __init map_mem(void)
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
2.54.0.794.g4f17f83d09-goog


