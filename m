Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBE8FF8869
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8F3kASMqf5BHYl2gzcA0DgWEOwzoo2uBq3thfdXqJMo=; b=0EwiV0ErcWB1DG8zX3tGwzlE8g
	qFNgNJjDxcnqydxNH7uYxtAga8QjxrQEAqkj5p1g+U75gcFrRQ0yhKcr2eRn6yJCg1fo3t6gbYrPC
	o/KYRJ+QFDnbGe49jXRdrxHYFW1SF0sre/tcyEn7qAV0COWshp95Maq54uuYeLqef4wFJ9yXkkWTm
	wLwSYhdK5KOodCsnJLyEsM+Zz2Cr/x8OTX58BNUd3ilJX8bSb04xk3bKEtkX/VRtXxMICuQIVy5aW
	1czuWLD7w2irXJgSWnps1vE5arb5XOg3fIBC6wyjcpNEBUzVUf1/B1cXH2VyKCtlAuXNV+qiz2Bqq
	MFQ+0Kmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzn-0000000HCRL-3CVN;
	Mon, 27 Apr 2026 15:35:39 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzl-0000000HCPi-2j4t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:35:38 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-488d9e1e61aso88994335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777304135; x=1777908935; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8F3kASMqf5BHYl2gzcA0DgWEOwzoo2uBq3thfdXqJMo=;
        b=gqo+kBvfc5qNI8sDN9qURldq2UWfJPjxFeY/fqH3AADn8duB5HYZaM7qackojGzaOd
         P+TWi4E9xV0W4kOf3/uDNnebdWpHQnXTA6VlPrdZ5BXY7YyTJNNGFPBXeOHPiN3qDBG7
         oIYaxMOPASC/viJHO2FBrqBhv00SVczcSesIa9/q3u/grGPmOGdpIw2bWl+enpr/5ATL
         Mw/RsN9iwiGd+rHJvkhNPffZiapeZRmjdojNHM74tfxmyZJMN78N8hVqpeuobYWNqwkV
         WXyrY958gFiaNZ/yByyWB0xqfaam7HfH9feUCrrvqh+/c+mOLaw51diABcJWmgKDJ0Np
         OAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304135; x=1777908935;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8F3kASMqf5BHYl2gzcA0DgWEOwzoo2uBq3thfdXqJMo=;
        b=HwUkZDvbU2yYl5Gijl1R1rCS7agDM+R1TMMvSehFfJ2G00rwP3pgOr2BZ9KR1MVNKR
         cZ4UyrcTSw4Xfrka/TBYDRekHOKJ/Ily4/g8QRzrgZM91oxkA1X0QyHJrGQ3QQ57gPyk
         FK2xCn1PbN0uRE/FLV8hepdUbF5pEGnYESZ3W0Dy1wODupy0MBZoGW0Jc5U+Ztip/RCn
         WxwjeQNEYRmzX4T8ozuKIXJ7qyxZ+jgbBlMKsib7VnOEaGcwhT8MKzUKU5XWKdtdXjJd
         HSfP+ZVItg8qUtnwRh4fUgLFJvXBhhThUbg/zl7c/hzwilWVT6VK1Rbs+M1s1i/BUw+g
         Jh2w==
X-Gm-Message-State: AOJu0Yw4pCyqZo0SO+KcwQ9Wg/fzDmKFgp5wby7XA+SrbuD71AuU50v3
	ZihICvRa3pkwBP0DBnWFurbVBQ4jCQ8MN7Qyjrsgi+qwjsOXUwNrC2+h3WCCWGmXlipvW/Vb/Bp
	ksfx41J0sbRA3hszkqF4EcwfsdbnrWXdJ70R9OajUV8b3SRkn4k087wrE4arhenLf4iwUHjRY96
	VvHgxeutelzpGuv708DO1Y+lzUdeZqXq9owC9y7sxGufb3
X-Received: from wmbh12.prod.google.com ([2002:a05:600c:a10c:b0:489:1946:b592])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1e28:b0:483:7903:c3b1
 with SMTP id 5b1f17b1804b1-488fb77fbf3mr626097515e9.20.1777304135240; Mon, 27
 Apr 2026 08:35:35 -0700 (PDT)
Date: Mon, 27 Apr 2026 17:34:18 +0200
In-Reply-To: <20260427153416.2103979-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260427153416.2103979-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=837; i=ardb@kernel.org;
 h=from:subject; bh=FjvXC4Bvv/morAQPM0ElYAlwegkzMza4j/YwiIL/yF4=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfN94++NX3ll/ZiXVZap93TO00rsSY3MY/ndJRGotvX3m
 Y9v23Q6SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwEQu/mX4xXRjUvDxfwUKzSeC
 Qp+sfOS5rfhfFteH21tOH9i1KfXn+g6G/9lLOeQeqzgJu68KXXDhuUvujolfrnt0PsxjVi7vjpH 14gcA
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260427153416.2103979-18-ardb+git@google.com>
Subject: [PATCH v4 01/15] arm64: mm: Map the linear alias of text/rodata as tagged
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_083537_693326_16C79B5F 
X-CRM114-Status: GOOD (  11.68  )
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

Before moving the empty_zero_page into the __ro_after_init section, make
sure it has the memory-tagged type. This is needed to ensure that
cpu_enable_mte() will be able to initialize the tags correctly.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index dd85e093ffdb..f084993024ab 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1049,7 +1049,7 @@ void __init mark_linear_text_alias_ro(void)
 	 */
 	update_mapping_prot(__pa_symbol(_text), (unsigned long)lm_alias(_text),
 			    (unsigned long)__init_begin - (unsigned long)_text,
-			    PAGE_KERNEL_RO);
+			    pgprot_tagged(PAGE_KERNEL_RO));
 }
 
 #ifdef CONFIG_KFENCE
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


