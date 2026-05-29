Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA4FCD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9tlxHwsxA6eqo2SKmJcmasVfNUkIRzlQyYjktT989Y=; b=2Kb/1rAAHEkBh9eyS4Rzylj1kP
	M6xbPW7ln+7J8TX2mN2gOdKBiZA3gkyH+vzjeEoia1vEO0e1Fb+cx7BnZTHXiEOkwbb7j8WhhKbJj
	esnRZZMrnrVE+1YRkGLHfbI+exvDGY3ns0UHAZfG7TBEOURa9kLay7e7HyWPWUpcVpIHWMy9FEOMR
	KvDHhQncNEKAJsQurD08evzlC5GClL1G2rXqNJTqO89FQyfP0PKXznKkl5fSMu+Yxn64SvYzqj8Cy
	5HW2NpKDHdPIKUmmQw/GXyc46YTp2quj7NjVSOPr/dUzkbD5rB2gY8sp7iC9S0OA3WKaN23+ykWsi
	HCGCFohA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyjP-00000007bqk-4449;
	Fri, 29 May 2026 15:02:39 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyjF-00000007biF-1iMc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:02:30 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4905428aad6so54769725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 08:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780066947; x=1780671747; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i9tlxHwsxA6eqo2SKmJcmasVfNUkIRzlQyYjktT989Y=;
        b=A986GVzR9I+PTiYjCNwUSooU5I3FX9vxnVwB7ituZ4PZu/BgN//6FHeqzURP2UKVIr
         Bo28bhGYLrDJTDRDROMqi+4JzSGHMnSXdeaL3QfSOvVCacJyoikqXG4OiuAO1GDjoAIV
         I5HLQAUm3R8w5C3RUlPqUHiCqZ/nFepRc+ClFX436ESrTvQBvKqiVk2heVvOkSW/omgK
         +E1wan72CGeti+FbYo55SsWB4fGziOxDe3Hja+fORQJLRFWWoJgn6r0MkCn8jMCP2esC
         0NZzrae0ZLqsQXwlfREAw5sma1jZY3hoOo4WYxMnhOchAIuKjuKUw+qf/iXMqFVYbTsK
         ca7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066947; x=1780671747;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i9tlxHwsxA6eqo2SKmJcmasVfNUkIRzlQyYjktT989Y=;
        b=SMPLCQBy1g7zIH/6DtxfSkj95iXSl3PFZIgvNwNICse8VPCieFkhOxcgm+bh1CCapO
         AiRN23DPlaYDQYvUPeKM9Qrs2LyfxhVscPMWW/yT/UtGYU+UKjMnrTbvk6Xe2VmveD4h
         F3iZWMeDvqEwp+0PHPQEK7x9ZabMWUq1hRzICjoGHnKpXpSQ4gpbVNcE7r6uwY+UCJTC
         I6y/cC7sUxUPP4JavMahjaQYRtRV8F31S6D3g1kN1SiQdsnHF+EfDAV1l217PzT9I0+B
         3wet2M14wzTyr6MgyemntBWwEl3FNTB2aA/mUhhRM3fiMNnBDvjJ2yFDMI9jWKShPmTP
         t8RA==
X-Gm-Message-State: AOJu0YzPwrEQkspAeZMGbL0XWuVhNKc6WUhwLbQCZoUlmuXmdO5me/6t
	lW7W5smr0LAWHipV7S/aiFzhZX6mJIIZ0ytbOz826V/To5yeS2KKxfjqDFgaAGSWTUsfEF6EPXh
	hd1YG56OTwkO7OYnUtiVLqP3u2/+cnMHchWhs0hcE1hPI4DU1wuk6p1HTZWIF6Bgejsijx9ouTP
	hBfuXK20SaObjS041b9p6qXvdh7IjiuRZV4DJRod2tVMuw
X-Received: from wmaq22.prod.google.com ([2002:a05:600c:6c96:b0:48f:dc9f:6f14])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b14:b0:490:4b89:5361
 with SMTP id 5b1f17b1804b1-490a2904d7fmr303015e9.7.1780066946805; Fri, 29 May
 2026 08:02:26 -0700 (PDT)
Date: Fri, 29 May 2026 17:01:59 +0200
In-Reply-To: <20260529150150.1670604-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260529150150.1670604-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2952; i=ardb@kernel.org;
 h=from:subject; bh=TyyULer9eaKHyQ1BOINcFoCv1vvnMukGL48REtJhPzs=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUtyVUboiS16Xkfr8iLbWErOKcytU4vuVJk0+76BcO5Hz
 rb1+sUdpSwMYlwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCKqGxgZNjU07DG6GaTpezdh
 zbZrEwzidjxa865atLfK9/GeO2emyzH8d7MLuK/p3ZH8ib3z+D7vti6R81b7wgsSZrk1v7x+zKK WEQA=
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150150.1670604-25-ardb+git@google.com>
Subject: [PATCH v7 08/15] arm64: mm: Permit contiguous attribute for
 preliminary mappings
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
X-CRM114-CacheID: sfid-20260529_080229_463871_A6AF99ED 
X-CRM114-Status: GOOD (  17.00  )
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
remapped in their entirety, retaining the contiguous bit on all entries,
can use the contiguous hint both in the initial mapping as well as the
one that replaces it. Note that this requires that the logic that may be
called to remap overlapping regions respects existing valid descriptors
that have the contiguous bit cleared.

So omit the NO_CONT_MAPPINGS flag in places where it is unneeded.

[0] RJQQTC

For a TLB lookup in a contiguous region mapped by translation table entries that
have consistent values for the Contiguous bit, but have the OA, attributes, or
permissions misprogrammed, that TLB lookup is permitted to produce an OA, access
permissions, and memory attributes that are consistent with any one of the
programmed translation table values.

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index cdf8b3510229..971996e46fd1 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1016,8 +1016,7 @@ void __init create_mapping_noalloc(phys_addr_t phys, unsigned long virt,
 			&phys, virt);
 		return;
 	}
-	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
-				 NO_CONT_MAPPINGS);
+	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL, 0);
 }
 
 void __init create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
@@ -1044,8 +1043,7 @@ static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
 		return;
 	}
 
-	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
-				 NO_CONT_MAPPINGS);
+	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL, 0);
 
 	/* flush the TLBs after updating live kernel mappings */
 	flush_tlb_kernel_range(virt, virt + size);
@@ -1191,10 +1189,8 @@ static void __init map_mem(void)
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
2.54.0.823.g6e5bcc1fc9-goog


