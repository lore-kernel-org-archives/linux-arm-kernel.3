Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F22CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVwVNe3cqI0RCHG1xJv3LRo5BwxDkOUdlieXkffr7Nw=; b=PWg+ZvTOKAanKm6o8zsMUnMyW/
	AQUIUrtEU8Ctvc/5AbaOGUtSnG2oyYBCJD/wnJfPWyZR06j0XbZ9pOJ0gcWI3SnyXN1HHrvDQj9Tp
	wr2UxTaiD04yNJKwfRbwfgHH9kCAl5oYW/twXwPcKNMrtWgeaqWwfmGu47d3k2ItQbXh2NsYjDl/C
	qPHpWar3Ni+o0qJQjpNPQQqjDJ1lsLbiqxb/cFmyF3vZNoo88r+KgjOM7vC6OrgmXEvZOQe3IOW98
	Ud70+gUA6GwGpSFSlzaAcget3lIbezpBJw+avahYt11doY20XRFVa3sYW2cIzuT2BM5wplhJPL6zk
	SmKhKckA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw40-00000002msh-3r0G;
	Tue, 26 May 2026 17:59:37 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw3w-00000002mmd-1KRQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:59:34 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-45ea38c03a1so4729284f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779818370; x=1780423170; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uVwVNe3cqI0RCHG1xJv3LRo5BwxDkOUdlieXkffr7Nw=;
        b=r2SeIiQ26lraEwoN0f7k+nwqO+Wx/D7wfwxdJMqQBYXm1v6fNWGIgxxKcYkyU+KkW8
         LBoxjFBlhUdxNkAA/3e5C4lvCRnCrK7qNlX5g9YqzKozNLfysKh1/IXm37FZxuYPCf3y
         VSORxA2CiMFbLAFWKzdTig68904gGXmg15Ji1z/EPTEiPo9XbbMrFIqlPnfTsxNydhKM
         5vaw+gQh7VMq587SfzI6PwAjMb/z/lhvEOPNkViHQDLuBfcWDsxV/4Uj6egzVRbeRbeT
         iup3uG7pleKjIHhWws1TR+q9O++mcmztMukrgYZRwIxlzf5u+QsY4uVz6mTLF46Kt3Xj
         tMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818370; x=1780423170;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uVwVNe3cqI0RCHG1xJv3LRo5BwxDkOUdlieXkffr7Nw=;
        b=PrsX45Ahk9L7kdqtymKYEtBlDyQ1mvBvWQqBKQPQdEhXu7p+E39OdiUXglFEaJPvIZ
         FIQM1KonFaAlQfLo+1SISJQvu7FiR+TcutGv6GrVnydGbHfCtay0S1EG5yG2o5t2yqi7
         2eiz0mFo/S9J8CN6CHzQUPY6Ad3lx4w/AvjIFfs8zrzgqOtJdXEzAGT24iBGgrObbgAe
         n4mbYgUHHrBbwzwymiEca1MfXNi5TYQazcD/1lapH+ewtYGLpqueJjavLg9Yzk5r/mU0
         K7stVfHpKSaUTDgXfIgYdBC/l20CkJe0oHpEo7Vi2fqNY2R48EbHaXD950K2FwzaWtVh
         fZYg==
X-Gm-Message-State: AOJu0YyRUFGHVMgJR3y4fKBSSvs/XoYzisPVQ9K93L7wSec8LK4saPZf
	ZfCxBP76jG0grYCl8FAQDmEnR3NMW4XjvyicrExGoHFBPoUohQCUvtoOPQDvueHPDfA6etm/fdx
	NTw9QdbwJK1abnwWDk1q6nOKOGmBxb6ngcHpeKeyCDR88wX+P6N+8yU84zF3sKW4xPUFXl/7+kz
	HWBm2Zsh7G4WmsxF8FSeqikXVlEno5sYpjZPayu57BbSjC
X-Received: from wmxb15-n2.prod.google.com ([2002:a05:600d:844f:20b0:48f:d328:60c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e14:b0:490:5cb3:e936
 with SMTP id 5b1f17b1804b1-4905cb3eb00mr223400195e9.4.1779818369475; Tue, 26
 May 2026 10:59:29 -0700 (PDT)
Date: Tue, 26 May 2026 19:58:54 +0200
In-Reply-To: <20260526175846.2694125-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260526175846.2694125-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3123; i=ardb@kernel.org;
 h=from:subject; bh=p/GjcIFRscd8SARDtYvyFpPt1lS/DKkRLXn2dxWNXF4=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUv0fsKpx8vWnXp9PDbK7d7pQ5f7tV6IZt198fXxgbl3+
 RdMT7Zr6ShlYRDjYpAVU2QRmP333c7TE6VqnWfJwsxhZQIZwsDFKQAT0bvEyHDiTj+j5qWAr0Y/
 aoUNp/5XU7S1WV4v/ue8Dkfu9tf7llszMqzS+fykyFm2qtwylU02r291afDEKR3P9d4q/j84eW/ EbjYA
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260526175846.2694125-24-ardb+git@google.com>
Subject: [PATCH v6 07/15] arm64: kfence: Avoid NOMAP tricks when mapping the
 early pool
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
X-CRM114-CacheID: sfid-20260526_105932_373275_7BCBFCFB 
X-CRM114-Status: GOOD (  16.17  )
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

Now that the map_mem() routines respect existing page mappings and
contiguous granule sized blocks with the contiguous bit cleared, there
is no longer a reason to play tricks with the memblock NOMAP attribute.

Instead, the kfence pool can be allocated and mapped with page
granularity first, and this granularity will be respected when the rest
of DRAM is mapped later, even if block and contiguous mappings are
allowed for the remainder of those mappings.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 25 ++++----------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index d7a6991e1844..55bb40348a47 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1083,36 +1083,24 @@ static int __init parse_kfence_early_init(char *arg)
 }
 early_param("kfence.sample_interval", parse_kfence_early_init);
 
-static phys_addr_t __init arm64_kfence_alloc_pool(void)
+static void __init arm64_kfence_map_pool(void)
 {
 	phys_addr_t kfence_pool;
 
 	if (!kfence_early_init)
-		return 0;
+		return;
 
 	kfence_pool = memblock_phys_alloc(KFENCE_POOL_SIZE, PAGE_SIZE);
 	if (!kfence_pool) {
 		pr_err("failed to allocate kfence pool\n");
 		kfence_early_init = false;
-		return 0;
-	}
-
-	/* Temporarily mark as NOMAP. */
-	memblock_mark_nomap(kfence_pool, KFENCE_POOL_SIZE);
-
-	return kfence_pool;
-}
-
-static void __init arm64_kfence_map_pool(phys_addr_t kfence_pool)
-{
-	if (!kfence_pool)
 		return;
+	}
 
 	/* KFENCE pool needs page-level mapping. */
 	__map_memblock(kfence_pool, kfence_pool + KFENCE_POOL_SIZE,
 			pgprot_tagged(PAGE_KERNEL),
 			NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS);
-	memblock_clear_nomap(kfence_pool, KFENCE_POOL_SIZE);
 	__kfence_pool = phys_to_virt(kfence_pool);
 }
 
@@ -1144,8 +1132,7 @@ bool arch_kfence_init_pool(void)
 }
 #else /* CONFIG_KFENCE */
 
-static inline phys_addr_t arm64_kfence_alloc_pool(void) { return 0; }
-static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool) { }
+static inline void arm64_kfence_map_pool(void) { }
 
 #endif /* CONFIG_KFENCE */
 
@@ -1155,7 +1142,6 @@ static void __init map_mem(void)
 	phys_addr_t kernel_start = __pa_symbol(_text);
 	phys_addr_t kernel_end = __pa_symbol(__init_begin);
 	phys_addr_t start, end;
-	phys_addr_t early_kfence_pool;
 	int flags = NO_EXEC_MAPPINGS;
 	u64 i;
 
@@ -1172,7 +1158,7 @@ static void __init map_mem(void)
 	BUILD_BUG_ON(pgd_index(direct_map_end - 1) == pgd_index(direct_map_end) &&
 		     pgd_index(_PAGE_OFFSET(VA_BITS_MIN)) != PTRS_PER_PGD - 1);
 
-	early_kfence_pool = arm64_kfence_alloc_pool();
+	arm64_kfence_map_pool();
 
 	linear_map_requires_bbml2 = !force_pte_mapping() && can_set_direct_map();
 
@@ -1210,7 +1196,6 @@ static void __init map_mem(void)
 	 */
 	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, NO_CONT_MAPPINGS);
 	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
-	arm64_kfence_map_pool(early_kfence_pool);
 }
 
 void mark_rodata_ro(void)
-- 
2.54.0.794.g4f17f83d09-goog


