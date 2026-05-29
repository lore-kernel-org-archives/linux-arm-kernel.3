Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C557DCD6E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kuldBekegH9n0W4LLX2RtMOFJe4Z/6YrXjIgxtYQaL8=; b=Y2fypbIF38Kcy5R6IvnJcUrOYG
	BbrhT9q7vxWwZCxWG7CEerfdfpsR192m1vZNQyW054mCZ0J2wbnY2Z8cn6fPMaAgV0YVQOJYGXM11
	VG+Lmb8wlYThzWfSZCkVEnFjkwSk+joHDT033rzaVXKSKr5uS4zFTV4kpaLXyFFsBgqJ+UzM/c6j/
	CN3576utzf252feM7K/orDGHUOVqc/ruCalbRUOstBiRCXQlwukAiZB3VntnB00q6JkVY/HlTyHFs
	QyMzOpV6JCUJdQaNhPNNhZk2xsxQEI6S3rxEfX4FwbzCNtn0lYkCraL95kCzg5Uto4bpTp5mL1j+2
	3V4E8e0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyjR-00000007btS-0Slo;
	Fri, 29 May 2026 15:02:41 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyjM-00000007bl2-17FP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:02:38 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48e79219704so94886705e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 08:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780066954; x=1780671754; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kuldBekegH9n0W4LLX2RtMOFJe4Z/6YrXjIgxtYQaL8=;
        b=JF7el1LXSmCgcWbXzw2LRR4PriSMqONi8l82vIY2qK/wR2GQ1Memd/4tRNqfBF9rlw
         TMd2lZiU6QHdUt7d/Z1ABvfF1nprAgqaWAf44034TwDQ+eDFRjDzm1A0qZwsP85oFvbu
         gy92YfPOHDLgNawb5gtiSoMRmr3a9jb1ut7Rt5Lq04C3UzqQq0F8VdxLsvvopSfHkaI0
         PUFqn3EszI9Abz5p3iwwbZzj5Fourum3WZU8q/V7u0h4LujxOUDPmJGBNr3lHWXFH18Q
         g/8IOKeBfR1YIgx5zxwMolInUT25S75D7q2LTQgGFaHl/PZZVKJVbGDPGsTq/UPVYWzz
         Bnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066954; x=1780671754;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kuldBekegH9n0W4LLX2RtMOFJe4Z/6YrXjIgxtYQaL8=;
        b=VJao1ieKnbALdrcBw15TzaZK3TaypNMfN3ryCExVCXuYOf6P9dd5GNRTRv5tPmM975
         uh152rs4xheuiqOSYlT24a2VXXB2T7qh6nmKrqHSK+3eCT4wDiEkmiUF3C4RHRzaIly+
         98+v1G3H6bPPHmdd5EQ37r6S9w38855E47bV3aSk7Sh1ouxOkDHEOlHo+ICLbscpTpyO
         eMmnR9IY7JAHPSAWFTF4cAWeR1SVEOqRBOrHQ0JUK7eUHoD689F1gDfD+/FDSMXa9pgv
         imb5yimhpavRZog/qlhH/k1/nr7jWB780WXhgw5FmJY18+mW2aywK/aFYIEPKHSNx4Lb
         GnmA==
X-Gm-Message-State: AOJu0YyGnFWJjIBNdY+cXXXC3NaMnEA4OUymu5RZu/ZxBeeGqxhosDyb
	NZW7W/F+//97TVu3kkJlOMHu4/ICzgbgyr20pOZqNCFd8/E2dCsUUvRvuZw4KdWt6a9ENbagBCt
	kNIPaZ3cF3GJidWfDJIiVUGh9OfJ2LA6C+n0t8OsQieQLauOV+bHpRjIYiZgv0YI8/nGqjOmHEm
	/3LJKYZVkZBbrkG+TP7HTo4jfXLoIfWwEd5xY56T69iMBA
X-Received: from wmbds9.prod.google.com ([2002:a05:600c:6289:b0:488:c686:2b56])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3552:b0:490:58f4:ba23
 with SMTP id 5b1f17b1804b1-4909c0ea669mr54166795e9.30.1780066953743; Fri, 29
 May 2026 08:02:33 -0700 (PDT)
Date: Fri, 29 May 2026 17:02:04 +0200
In-Reply-To: <20260529150150.1670604-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260529150150.1670604-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898; i=ardb@kernel.org;
 h=from:subject; bh=dIgftrvtjy9n7J++AHRmcZhewFAl9rYaD0F4euqeHS8=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUtyVd47S5EVE1yUzEILxG4o87+S6v8hxD9hp5NyQ8ruu
 0eqhL90lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIkcVGP4X3vEZYrpXP0XPhoq
 LB8n7Xn7w1MyccZGAxbjdtX1WbwLNjL89511yu9VgsV9/ZkbXeb/7X59yD7RKOaQzExH3lUBFrd CeQA=
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150150.1670604-30-ardb+git@google.com>
Subject: [PATCH v7 13/15] mm: Make empty_zero_page[] const
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, Feng Tang <feng.tang@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_080236_331778_7FD16B37 
X-CRM114-Status: GOOD (  14.95  )
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
2.54.0.823.g6e5bcc1fc9-goog


