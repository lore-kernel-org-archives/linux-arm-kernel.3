Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5D8CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 14:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NxAn67EllZLJlW9mqBx7c+aiyuMdE0tLJsEwrVt4YI=; b=CiyOgiK9ynZeVh5hr+ZPFLNkVN
	XLugZcND7kyWKEgbmB0HbCGAyiUPyfEOgb7ulqAxD24ReVhzCe+rxAcRIPOBrYWG8sAfGNFfHhoFY
	Wof4JwMbrKQmKRpMqs52yCoUlN4d9WRrPeIAzIZV+tpxkKsxfYwzvi/1sSmJb92wUdIlu5jGzhaI4
	E8EmURNGkQmKeiL8HqrsgDAR7+fxPZcoJponZV0USl4xSWPBkZLIEJwydgUlSTLG6uETVmcO0TBrd
	cr9Sb81OatEKT49aO8O26u7i9h42aO9F/Ssuy+rqjcHul4j3K+vuNBNRe6g2sFDtmlxtecFdnfyto
	4wa9caGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJe4-000000040hj-3jFy;
	Sun, 21 Jun 2026 14:59:36 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJe2-000000040gY-0a4B
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 14:59:35 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-37ce68a54f8so2099863a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 07:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782053973; x=1782658773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NxAn67EllZLJlW9mqBx7c+aiyuMdE0tLJsEwrVt4YI=;
        b=VMtlseO2cjFQrLcOG2lDu2prNbmI24Z686+fgao7LNQwIdOCki3n1PLPvN6V23GI1T
         vN8vPhy26o0c2rYDRxHpsx2kYeEKnTI8hTszs+rL3kf3EronaWe7peRMP62kcjGxPjDM
         xgGWKiNC963XY1QeLN+3C0Cr4snAumi95JOje5o6b+Bv4IRVp/ppUEoFiuSt9M9p+psN
         +swGZ0BbyNfLGMj+3zFqHTOxaFIzk4OMs1LbrxGX+oSAnqikDuU8yBQNhrZfZI1z8pPn
         6z+jqi9eU4YNpAbXdt2UZPeDnbKpfCrhcy6P47kXJ4NeYbBYSCjRUxPOTFR8OrQEOIEX
         nj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782053973; x=1782658773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4NxAn67EllZLJlW9mqBx7c+aiyuMdE0tLJsEwrVt4YI=;
        b=YsZiV7bt1pxh51wvfiTY5KtkeNv5ZBJ5xIIDPbuUb7rdKig3CyV5F9BVUzJaGME4cT
         jfnuYai2POJxs8P3DpgayogOvCwb8kLK9QEEDvRvQ72QvZ+t+1rjLm1wfjjl6CY0+wN7
         4up/+1kxofEhRRKrLGfD6hsGedWyEHnGZZq1zZwCZf2CZO/7+v5rDRSl3Pit3lWo81iU
         +78I5l8sWkEffdEGyRBK+Bv2mOyTsn1U+y/5tND6Xf57zQfYVnAhCxhJXq24y/nsnDcD
         kQwsRMmOYpdIZ+cuiG0i3YPtAGfiTtU6Ta542zVt+rogF/7Z1ZSwpx2euj5I/OZufosa
         sHTw==
X-Forwarded-Encrypted: i=1; AHgh+Rrh6Y/7cFEQ4h4eIxyr7HnmyjZY+2s7wjgx7YQUhYqDSBhgAmnzQxWaDsXW6Fds4p3ldJiFGVjNBGuSbtZ+Il0m@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4DNjtp+bEOZKMkMg5LkjFNgnqXqmZLP+R/7fmKvrHKc3qNFGI
	UGLRafH5qZVT9QLTz/OoF3A/jYh+WtpPFt8oNFD5FvSLby76wMnhxhwq5J/gMv0M
X-Gm-Gg: AfdE7cmC9MtNkRlgi1C3pDKK9/fedNCbuy+g+Bv4+70EeC66beRU1VOJnYt8wIiu1MX
	+Qx3rtygBDTUcHLUHWu8yFuh8uKrbCQfTybaAkK7eboM7nuFUFuWu8l+HPdJxfcTefksrOAdq+Z
	A4rSYu2q6G/d3QuOreZe3t+sJQTh9a6bVWmrYIMW16cVAVPelhRaYN3lyPNFaeoR/pSIfikJ42+
	QUvBWnccc4rb4FVu9XP+41uE6HG62nZFhZTlf/BSKE6OGuolOsIIREGPY5ovh1hJ3tdI9H/WzF3
	liE1mu+3Afyi95eir24jb321ulef8gtgs3J+49SnUUlvmwAZHrWpravjDeTh7wfqZW2y138uZug
	I99CW0Y2is4HmO5+b7ecgwLSAARo2dfNG9NZxAIHYft9tG8o7n5GIJHY4iqCBXZqEmBByn/aEJJ
	pkgsQqPh8=
X-Received: by 2002:a17:90b:4f8b:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-37d1e5a3889mr10118559a91.0.1782053973142;
        Sun, 21 Jun 2026 07:59:33 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f225870sm4544896a91.8.2026.06.21.07.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 07:59:32 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: [PATCH 1/6] arm64: mm: remove unreachable invalid range check in kasan_init_shadow()
Date: Sun, 21 Jun 2026 23:59:11 +0900
Message-ID: <20260621145919.1453-2-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260621145919.1453-1-ekffu200098@gmail.com>
References: <20260621145919.1453-1-ekffu200098@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_075934_197180_D1D57206 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

kasan_init_shadow() maps each memblock region with for_each_mem_range()
and breaks the loop when start >= end. for_each_mem_range() never returns
an invalid range, so start < end always.

Therefore the start >= end check is unreachable, so remove it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/arm64/mm/kasan_init.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index 3fcad956fdf7..45fbdce684c8 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -353,9 +353,6 @@ static void __init kasan_init_shadow(void)
 		void *start = (void *)__phys_to_virt(pa_start);
 		void *end = (void *)__phys_to_virt(pa_end);
 
-		if (start >= end)
-			break;
-
 		kasan_map_populate((unsigned long)kasan_mem_to_shadow(start),
 				   (unsigned long)kasan_mem_to_shadow(end),
 				   early_pfn_to_nid(virt_to_pfn(start)));
-- 
2.43.0


