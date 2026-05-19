Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C25CCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=psqo5lxuXKrUhh3uDGGTtGkdaLsuRg1me0VLpzKluKY=; b=Z//2ikW1JDuFf9wtGev0gSHfNy
	4BCTnETqEu0l4VtrE/M8BN0XU+vUDIY8GJc42vJRtT7Dt+AYrvOdoU7FvdVjvX4vcjRG+xT07Dxw8
	UBe3d+ImwdvgAP1Co4bvO0KIWHdPa9tYIF/IXAVLJTZZ1LH1by2EDrHDMWnY7fM1kIdCH0Fj/v5/X
	quOVbtb1YBNe2zDq2d3APD3QcGOiE/A4xrbokUZj9hZUWSeGIbaJ/nVDUI2k6E1HyQo9KE0b73HYd
	N4dW8ZTKyD4mCo2HExqUnUVqgttSMLBFuBGwciUX++3LoByuiyOxoi8ftBDvAszWyXiA8BdQssWKS
	N6VjoHNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDB-00000001yUy-0JAk;
	Tue, 19 May 2026 15:18:25 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMD5-00000001yRP-1fxs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:18:20 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48ff0eb77b5so38407915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 08:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779203897; x=1779808697; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=psqo5lxuXKrUhh3uDGGTtGkdaLsuRg1me0VLpzKluKY=;
        b=XuyhniGlXuU4kYTyecr0hpMsuJdZvVCOewyRL0l/y7ctPYpTrTBr0rx1uVq/zE/W5w
         BHMqKeU4I/eHDgsedpH+13yV3rjK+BzkUqVnd5+z2XStpCAyvQxhfvi+5UxDEfBv1DXH
         0bKoyzSO/n8m1sx8UGxOwc/bH7J0JMYqZnta8LXhk9LACjVm5l9o34J9DkdaIwTyXOwS
         Q30+Gf56PR0CfKZ/0msMjbp7icIpea9uAYb0B/x1ROGRru/LAjvN1bi7+RbiI/5RenGX
         ZNMGgcyKgcaTbwDkkWph+F8hg9uu+xixoMaT0k8sPdWgRWWjWR6FHQufJ87CgPbtte2a
         da0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203897; x=1779808697;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=psqo5lxuXKrUhh3uDGGTtGkdaLsuRg1me0VLpzKluKY=;
        b=erOaa6EwWIFuyYJF3v0ItkufVJ94nvAmUteXLi0cdJcFP4/ZCzKMGI0i9luVhoC1H6
         w7trqLmayCwRa22uu5DnI9huKuw5QOfqf4GJ12mALkPkIwqTKjSb9NS7ur/b+Nj0x1Yy
         lEcZBzHhCG0pq3BC4I4rLg+avtCD7TEoPejzBXwjbhFQm0BjbFTpBSIgkaHuGr0uXpCv
         Dy7SDZf2VW+I7VFBJGwHljX2VyxBfus00dIxbDUjuF1Ii5bQnktGxkCGJAR4HyEYualp
         IdxOewQ20GLiN+WF+F+m1lsS7JID8kwnLYVhRv0FODsClnoOGoDsJl48H2wjGhlT10W/
         3URA==
X-Gm-Message-State: AOJu0Yy8fKuXSe8L55WS6XDdmfMIFe+0ZYkhGk463J5eU8B6TN0l7aB1
	laAgU6w0nNgLddSLf6naOHjDI89gjdkO8ZqRz5dTDQiEblStLZ9tLevCvoCVX+5ku61CkwuiXXt
	OdoDF05VbFDhKsIaijGIaI+6VwtqHz2qgq3qd/VbUpzTtfXGWt/iDZnjPbtqC2s7nNU0F8iK0cq
	0V1qy9Ny0AA+3jbxrBiByIAFKMXD3UfjVrRgBEFRoqbPfV
X-Received: from wmrc10.prod.google.com ([2002:a05:600c:aca:b0:488:7b85:acf0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e46:b0:488:bc6a:528d
 with SMTP id 5b1f17b1804b1-48fe632243cmr328900025e9.22.1779203896424; Tue, 19
 May 2026 08:18:16 -0700 (PDT)
Date: Tue, 19 May 2026 17:16:18 +0200
In-Reply-To: <20260519151616.2557018-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260519151616.2557018-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=911; i=ardb@kernel.org;
 h=from:subject; bh=uYqf26ha3K7mBUMG5pQkMvA1333YXFAF+bz49QK3I9c=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIYun7nCKotCqPVHbJlU/P5+WPXNtRp6U1LQXbxdfmBE1Y
 0raotU9HaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiOm8YGdZPT5zjozhLrdzq
 W9rh4yk/1SbP27vU5sihNukc80LNiGCGf9ocz6d5P87N5VjR8+WxStrSZ0/T/5+7djo9/dI6ySM 2HzkB
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519151616.2557018-16-ardb+git@google.com>
Subject: [PATCH v5 01/13] arm64: mm: Map the linear alias of text/rodata as tagged
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
X-CRM114-CacheID: sfid-20260519_081819_446410_997781A5 
X-CRM114-Status: GOOD (  12.84  )
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

Before moving the empty_zero_page into the .rodata section, make
sure its linear alias has the memory-tagged type. This is needed to
ensure that cpu_enable_mte() will be able to initialize the tags
correctly.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index dd85e093ffdb..0c3d97f120e1 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1195,7 +1195,7 @@ static void __init map_mem(pgd_t *pgdp)
 	 * so we should avoid them here.
 	 */
 	__map_memblock(pgdp, kernel_start, kernel_end,
-		       PAGE_KERNEL, NO_CONT_MAPPINGS);
+		       pgprot_tagged(PAGE_KERNEL), NO_CONT_MAPPINGS);
 	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
 	arm64_kfence_map_pool(early_kfence_pool, pgdp);
 }
-- 
2.54.0.563.g4f69b47b94-goog


