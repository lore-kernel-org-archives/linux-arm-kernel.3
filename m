Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F41CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OI2PiSwVSqs1DMfWl+ZXR2POFOtjIsRCGzcVsnmPBAE=; b=30u9MdYbu3s97jjK64pVO8kUQS
	gPXcANcYqLdut1YO5HO5SMO0jC5YFag0wxF5RxxE43UOqysKlr54Yw8Rf+8RDE5FJtHD7sCQj8k2N
	vOZh8ASfR0e1d4u+zgHBR3UkIO1XTtkYLZTEI1Kmg17YVNPI3wX7eBet9YSezBoZ2hfKxq9aweeF1
	H/FsYVvIGRtb6zHXQ3j+q6dbsgWstT72H8UjUsmVKoVMOToQwNIpgSIr5DzDjYBPJF/72DX8+XlEA
	vuWOh9QgqtaAjx/njx5DrNOdPuJBnsAHeXPM7xP18pWtxqN+29CSrWRDI9AriQfM2sSewDi9K/AJs
	MGAgl16w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyjQ-00000007brL-0xO1;
	Fri, 29 May 2026 15:02:40 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyjL-00000007bk7-0xwh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:02:37 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-bd2a8eb9281so218491766b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 08:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780066950; x=1780671750; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OI2PiSwVSqs1DMfWl+ZXR2POFOtjIsRCGzcVsnmPBAE=;
        b=JMH/E9R4I2odNUwGUQdoM0+zfbqFSSoeAGDNPmLEH970A+C8MmlP81vdY8l02cCURt
         +uzCwS4DrxyrCgGqZ2zOjHdnC9YpDd9UN15IMfT8QpS+1QXFK1fuMsdmnw/0W20twGwY
         sCTDM4LpK3YK6eEqPwfrKBU6sDAnXhB/RjwbFDbtcRY54XVVfRn208vUOGSHtpHsmF2e
         VOKuLoG9TXMFJXFmbkBtMfZ4DKkyUeD8XvIYRwonuzOwDjp7VUjCAvKMmPq9dOq4Ot9r
         8jSUQfJJDsp5qp3ruWJv23FV20OuS3kBM6cpIOEA9sC+sNOpp6mmJUKGBM64zRe6c19w
         6yZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066950; x=1780671750;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OI2PiSwVSqs1DMfWl+ZXR2POFOtjIsRCGzcVsnmPBAE=;
        b=oEX02C67+Ep/t25ztdD9Bg5T/Cv5GLlahMOPqnuttSQS6hi/veKaxxEr/tgYx5GrPt
         FchNtwu4liYHl58r913mc3jIToi50DGsLjEML06oASdfKsDvxPepIs8G5/wG+7CUZkeg
         YTMJABcHolQ6UbaHBfGekYtw8lw/yh3DIjnvAPOG5XZbf2hi/xbtezPKfJ601bBdPfZy
         vu9VU/TUqmMOSU7mFxyX0G+UcDcBu7jGzlCHcQbp4MG8X+9aUl1HiqMhLb5UwDudZrs9
         Lyp8X2t7fwvNsvZmJ01GLOujJNYlGdh5+PUsajVWOiq6fDmRzi6EHNLkKv9nMe3xrt35
         lmdg==
X-Gm-Message-State: AOJu0YziP2nLMCBvwXijiIBgcNYuDkZC38d0971SfPQuhce5fRXMHsiL
	fhTTEWo/Bll2aZZXWwP6SA+peVpLKTCx2ty54Xat7GNHMIU1FF5mi42SL5sJqkdS2gEz7tvLn0V
	iNfS5S9KYt/HHo2j1Z4+CcVZ4Dl/epFL110ou+WdibcRfSDREj47Qhh8WU3VmS/Gwu4En08o3rN
	OFRdykak00N8ajXMwGVv/HfKvYJMajhpYarDZtfxGc8AZN
X-Received: from wrmg9.prod.google.com ([2002:adf:e409:0:b0:45e:f392:2777])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:a07:b0:bd5:2e64:aef0
 with SMTP id a640c23a62f3a-be9cbdc6f6fmr179513966b.24.1780066949175; Fri, 29
 May 2026 08:02:29 -0700 (PDT)
Date: Fri, 29 May 2026 17:02:01 +0200
In-Reply-To: <20260529150150.1670604-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260529150150.1670604-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2652; i=ardb@kernel.org;
 h=from:subject; bh=LBsPwtXISC3cDlPuViRIHN1SKeCiNO3w0g/LYP90bWk=;
 b=kA0DAAoWMG4JVi59LVwByyZiAGoZqmug957hRslXLEFSHUmrg+wMpqdQu/ZaCQ6ZVNlpR/e6R
 Yh1BAAWCgAdFiEEEJv97rnLkRp9Q5odMG4JVi59LVwFAmoZqmsACgkQMG4JVi59LVw9CgD+Kz5r
 yC92Fjmy2/vY5E6VGL4/Nm1StvBfLlgn5WtMnkABAJz+h8RdmiKW2M9JyTSGnfE2SIklxmyurX5 hqMMXobkC
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150150.1670604-27-ardb+git@google.com>
Subject: [PATCH v7 10/15] arm64: mm: Don't abuse memblock NOMAP to check for overlaps
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
X-CRM114-CacheID: sfid-20260529_080235_290628_11F22521 
X-CRM114-Status: GOOD (  14.99  )
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
 arch/arm64/mm/mmu.c | 26 ++++++++------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 971996e46fd1..dcfca5667e5c 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1164,12 +1164,17 @@ static void __init map_mem(void)
 		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 
 	/*
-	 * Take care not to create a writable alias for the
-	 * read-only text and rodata sections of the kernel image.
-	 * So temporarily mark them as NOMAP to skip mappings in
-	 * the following for-loop
+	 * Map the linear alias of the [_text, __init_begin) interval first
+	 * so that its write permissions can be removed later without the need
+	 * to split any block mappings created by the loop below.
+	 *
+	 * Write permissions are needed for alternatives patching, and will be
+	 * removed later by mark_linear_text_alias_ro() above. This makes the
+	 * contents of the region accessible to subsystems such as hibernate,
+	 * but protects it from inadvertent modification or execution.
 	 */
-	memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
+	__map_memblock(kernel_start, kernel_end, pgprot_tagged(PAGE_KERNEL),
+		       flags);
 
 	/* map all the memory banks */
 	for_each_mem_range(i, &start, &end) {
@@ -1181,17 +1186,6 @@ static void __init map_mem(void)
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
2.54.0.823.g6e5bcc1fc9-goog


