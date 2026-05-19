Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0917ACD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5i5xhw6twfeNJpf3X2JDAmvPKwL/v73NW4xnl1R+ac=; b=4VDZKkbGOQOkmNUnUPbK/s3zxG
	rbUpvJxWHOmBiHXlINMqDRHAUnHtWSOyPnCCvxEU9hXDOee1aO95g8tYiyHjRWOm1MfFxAzcT1CtP
	p1F4DZW9Xlsu9ifYnla+1i46zD9g++abaedNFsA/fz2BF4zUXQYI0N5CMh5h6fbz8uFP9FW/FW4Zs
	ktlCtg6Gd3/prmkFi1dLH/ZI6nG+goth58CTkhwRbBxNp1QiKHbyPT1bs15d9CG6MvJuYpvg90l93
	E3D/Uf4cILu6mdsuuGQeCq/OCbihUOdh72qU5L2whp/eWLxKalfx5JtrumHLHgphX1iXgNp7dRHLO
	ErVdQTcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDB-00000001yVN-0jy8;
	Tue, 19 May 2026 15:18:25 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMD6-00000001yRk-1x2Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:18:21 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-44ffa15dc8cso2183135f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 08:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779203898; x=1779808698; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+5i5xhw6twfeNJpf3X2JDAmvPKwL/v73NW4xnl1R+ac=;
        b=HpvirIopCvDmZNIshQpqpiMf7JylvPcX56bvmcl/PepiVwngmlgH2c5TDt/CsYFs8B
         E9ZDy+rr3Vm3MAI2diITk+jfTZ3Jr2tkRxOlYxvXSazGtdOAz23FZIhXQ6/yebq7yGXX
         3Kh++sMHa9CthKu6aVgLru9LHtKoIkttk71AM0sPyn953K+FFGY2lR9ME1DwTPiorzC8
         TbeZcV97M/9RwxqapBTgdRHKReSGSIa4HdlIAOwGua69IHnwwPdUNx/OnMysf4NKQlBI
         9Lrr7fqpt52qUe0s9F8jRIjR92GLXsz52EUWlES8d2JSU8yNUhVNaghac9RMX9LWnGYA
         m8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203898; x=1779808698;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+5i5xhw6twfeNJpf3X2JDAmvPKwL/v73NW4xnl1R+ac=;
        b=QKGmUxjqEMToSZiRIHer46RWxHg4YP0i+pJFV60VATwOmQVjz/bAd3xF7QZjqlADnS
         o/HWRtOE+/xyXqhm8n8HX7B1fXn+jjPnCeui/swTqeO/sUnF5OI6RZUrv5n/R3YhtO+S
         4FaLT3Qlx+o6sqDAJ5IT9FiNGdqcW3LNkobxE5/VBxJQ1MrnLLbvvNa0yB1suGTTxT0Z
         CB8LUMHQWd0Z/EeYx/a8VOsHRvPrqFUqJB78JxmyCVhe2aIfFmCh76k0Bb82fxpJdHRU
         ONqYcVHgqRo74lSl8Yqv3qM/WwhKdcN12s3EExhGlVJdxGBuWDGgHVctYwX2zpdelaFY
         Balg==
X-Gm-Message-State: AOJu0YxAuN90NxTjemJHeNLIeP6aVhjRqBlJqSxf3TaGeDH0GwOMfEai
	GZSYuNdcuVOLQQdasN/9G5cSqWZJWdYQR3gSkIckA7LvtFn/k9TodOuiREzh1WWXtCoKaG9cYJo
	735beXVIOHuLdq3j1hyebSvJFykpcvIJDTrU07LTGJiNEeayqesNDB8xkt4wQJmnqnQTfoNb/4c
	4z2KnerbighQeIWMMj3JqI34JeDp/9mo1P1EWfK/dg28YA
X-Received: from wmbh13.prod.google.com ([2002:a05:600c:a10d:b0:48f:de63:8504])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:314f:b0:490:389:7644
 with SMTP id 5b1f17b1804b1-49006db5bc0mr175687615e9.17.1779203897655; Tue, 19
 May 2026 08:18:17 -0700 (PDT)
Date: Tue, 19 May 2026 17:16:19 +0200
In-Reply-To: <20260519151616.2557018-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260519151616.2557018-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898; i=ardb@kernel.org;
 h=from:subject; bh=Q2W2jspPsv5GaJ5WLwu7DWsztQb/bK6wx+1BuMiTXuk=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIYun7sieu88v/5i8jruVR773wtIjbld/Wm40nSSe+cjgw
 YcLqYJ8HaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiGZMZ/nBZtdgr2B5a5Wj+
 iUmAZ231tSsO7SFntz3bed73yPGbq/8yMpwpsb8stmR1T9S10AhOGdXn+2LnfX0psDCo8O08yUs 6T7kA
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519151616.2557018-17-ardb+git@google.com>
Subject: [PATCH v5 02/13] mm: Make empty_zero_page[] const
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Feng Tang <feng.tang@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_081820_530639_6113E2E5 
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
2.54.0.563.g4f69b47b94-goog


