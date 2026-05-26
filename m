Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6ADCD6E42
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 18:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bg9HdLIrtfTsrLcuMDzN3Kt0yw7TgIGpz80e87aySNQ=; b=ZDupNnKxJGhniTB3p2RoiWnvS7
	of7ssO6ESjjkPPr6StbdQILT3pBKK3acr/j2cu3A4px8tajShejdakjEMgG+RNAnB7Cbv9SFlKDVg
	XfJyjbjs4eM+V0P5nflPlTsqUuCqSPCsrm3/DRHpEurTg4wCCV/caMN8+mLrR/dlbiraNa5uQPIzV
	fjXYBxm6L26x/A68GnrkVmZ+AOHURAAsLDFOnoK0bcY4fM9j0+KbGBNLUpI55XAM5gjdY/25TD1cO
	KKRuMvE4hSUKHVMck78+LKeyI2G11xAeP7h/XB7IG8jzWk6U/AeeP/JzckRy4okxycdvTRoNZcMYa
	X1UOtv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw4V-00000002nMa-2csq;
	Tue, 26 May 2026 18:00:07 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw45-00000002mwT-0GTq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:59:42 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-4518f777225so7724337f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779818379; x=1780423179; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bg9HdLIrtfTsrLcuMDzN3Kt0yw7TgIGpz80e87aySNQ=;
        b=h3zSh+kBOffKkTCGd1EKnwKX7NOpCGQTppCouNi+vynlWGLlYPJPm0rgxEjDpL+L/k
         LUmzqgvtj9CgYKoM1KQf+1CJOYHnSSggMWLRTqzS+bNGV0sBHP1KnDICuLcPAKN+hkaE
         ZJAt1XiAJtsjWyfqGYzCTrUSDjzQTctrTdxEDkG6VgyD0mKwW+64z00mUSxxKzzlv/V+
         rj5vhsgNTPs2fEqqzgiA5o+6e80Wev6/AkGrr4vLWx4oX1XEb2TG7cTYt1IrcGs6oTxV
         OF36ldGDASHFMATd4EVhWAhFt7oXBjFbDbSPa76ihGrUhRH/veNupoaPWPDFfiwaa1+P
         /ouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818379; x=1780423179;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bg9HdLIrtfTsrLcuMDzN3Kt0yw7TgIGpz80e87aySNQ=;
        b=k+2Oq0nnkQtR1wDDb6EdgfhtkOoN/opNivd67qHFwAMesm+dNtaLUknInszT4b/bby
         mJpPCTK8FD/BtteCVPSbOZC1MryiMRcAScBP74eegsei2BQ4dHrHFWyDwtzP5D/cGs5f
         l4jq4V8kNbkByjBdBSex4+SbFzsdmQhLq8G115a0PlsPu8XmT2coX0GeUHbAqWyZHpAv
         020jhYcj7WlC+33/ZE8I+Rqh5aC5hnyb0hGb2tF+T9K/HOsTXKmda94utH0BHZapt5/H
         FmI3HAtHw3BnZVJHBFZzqWLQ132Gjvxfpy+i4T3tEdPWnYbRL/GWgEMCyrzRAmv/pRVS
         bbow==
X-Gm-Message-State: AOJu0YzyLNu1Dk9bZUlOlbZwO9rvDAK2EOCUBi0qtitX1JjBhfUczUvw
	aNQWzFfwr5Z69OsvzlnyTe1YsYq3o0pi/Fzu6TEWZR9jg7wFC3Y4zCfRPjEsRf8iwHTEFQ1GB3K
	H666lAMO77enNxKCABmCqP2PNcJOdpUtfWfgbWTsd687QwzfuA/zPl3HvNm/H1pk07oFGo7ojTw
	sGnR0Same1RbEmfO0ZaT1DFWPmRJe/NbAddZ3Wb1RwD7T3
X-Received: from wmfv6.prod.google.com ([2002:a05:600c:15c6:b0:485:3f38:3dd2])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:35c8:b0:490:45bb:8dd9
 with SMTP id 5b1f17b1804b1-49045bb8efdmr348556125e9.8.1779818378710; Tue, 26
 May 2026 10:59:38 -0700 (PDT)
Date: Tue, 26 May 2026 19:59:01 +0200
In-Reply-To: <20260526175846.2694125-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260526175846.2694125-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898; i=ardb@kernel.org;
 h=from:subject; bh=mYtVYiSzRogY9cxOoJbyywYkU254ucBHoAXG9B3cPO8=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUv0fiZrSsLEz85Vxb/brc+ssGD6r5/EdCw1zi66VivRb
 5JYlGdHKQuDGBeDrJgii8Dsv+92np4oVes8SxZmDisTyBAGLk4BmEhzByPD0ky+XTe7StYuXrtA
 se7PPWVX9mMHpG+dm3iu/EHwtpNeExj+Cv4Q0JnTu+ZI3cG3t5OPxTdavzl3yvBbYsCGnriEHY2 z2AE=
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260526175846.2694125-31-ardb+git@google.com>
Subject: [PATCH v6 14/15] mm: Make empty_zero_page[] const
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Feng Tang <feng.tang@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_105941_122257_55779542 
X-CRM114-Status: GOOD (  15.41  )
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

The empty zero page is used to back any kernel or user space mapping
that is supposed to remain cleared, and so the page itself is never
supposed to be modified.

So mark it as const, which moves it into .rodata rather than .bss: on
most architectures, this ensures that both the kernel's mapping of it
and any aliases that are accessible via the kernel direct (linear) map
are mapped read-only, and cannot be used (inadvertently or maliciously)
to corrupt the contents of the zero page.

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Jann Horn <jannh@google.com>
Reviewed-by: Feng Tang <feng.tang@linux.alibaba.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 include/linux/pgtable.h | 2 +-
 mm/mm_init.c            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index cdd68ed3ae1a..67aa23814010 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1993,7 +1993,7 @@ static inline unsigned long zero_pfn(unsigned long addr)
 	return zero_page_pfn;
 }
 
-extern uint8_t empty_zero_page[PAGE_SIZE];
+extern const uint8_t empty_zero_page[PAGE_SIZE];
 extern struct page *__zero_page;
 
 static inline struct page *_zero_page(unsigned long addr)
diff --git a/mm/mm_init.c b/mm/mm_init.c
index f9f8e1af921c..46cf001238c5 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -57,7 +57,7 @@ unsigned long zero_page_pfn __ro_after_init;
 EXPORT_SYMBOL(zero_page_pfn);
 
 #ifndef __HAVE_COLOR_ZERO_PAGE
-uint8_t empty_zero_page[PAGE_SIZE] __page_aligned_bss;
+const uint8_t empty_zero_page[PAGE_SIZE] __aligned(PAGE_SIZE);
 EXPORT_SYMBOL(empty_zero_page);
 
 struct page *__zero_page __ro_after_init;
-- 
2.54.0.794.g4f17f83d09-goog


