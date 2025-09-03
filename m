Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54EACA1010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 22:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cg3vWTOesz5aa5s3lECf1v2j8z5ZoWgWQOpdmwDONGE=; b=GRJ0PDFBnOFMLGp5p3Q57OmJnA
	2RkkChwj6Q+PVhNDNrDmWP0Z0CagGKIbE1ZCMs8xyaaKyRK9UI9P/V+9iFpp0AlTXj5qCD0okgNSN
	9UjI8GhxK4bxveZ0ds/ZfHg9SUTJdCJsi94drgYTez5rJ2JcOVqv2dk2fPlQOedCmzoRC+/P9W2CC
	AGpYwOb+JQ9k9h9FTNmEI2w5JLL0OnOxb8Ar93di4wL93utbu7uOYwCrvK7CdbkVm1sy88qxFRClX
	wI2xKfvHpLCWkqtZAqLy2QMt95Tew0W1W+P0i55YKDayLeZflFsQ+lUmUWL9tR3fmVu8P/AVg6vnc
	RMBBerqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwLF-00000007q8d-0VTp;
	Wed, 03 Sep 2025 22:52:37 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utshk-00000007NUk-1AMs;
	Wed, 03 Sep 2025 18:59:37 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2445805aa2eso2981995ad.1;
        Wed, 03 Sep 2025 11:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756925976; x=1757530776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cg3vWTOesz5aa5s3lECf1v2j8z5ZoWgWQOpdmwDONGE=;
        b=Rs6Ss5GaQs/Z/VuCWIzaFIvsqp9wtpzlKexwTmHCum+iioJM6Shvszf/2F2QT5+YaM
         +A8r0KMLMYKVnPww6A8re0WnHsVo5h10rDJwH4xt46+Q+LxloWBEwYaux+u/giGzWUcp
         bgPC8U0F2Sx1mZ3PpMbm86W64oQd/ghEA2owsjE91/8kAV9qfMEkhp0Jfurqr+W1Ku0D
         nmMig57sq0jEOH7cZPqusV1XGbm6ShT2/dirBYYP2eBHjwbPXVIa5VSk1KPPXUypsG3k
         PcPJ+y7itRPns6cudO4URNbGLrm0KDXOvpMmwGiCSjJSFdYeQeHjV5Dx/7QPxdiVNpBg
         22bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756925976; x=1757530776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cg3vWTOesz5aa5s3lECf1v2j8z5ZoWgWQOpdmwDONGE=;
        b=cG65MUJ7rdpcYsedgpvSRqI/fmnTVXLERHbdn4+UqppsQdFg4mP3/cQt5i7C8aO6Dh
         DeyWF9X+t1tfmP6Du3vME8uwgcPSWNu9JKx1ucnV8/pvNjwJ728nHZb/urTHOsLtfic7
         y0D/fAoswuI8kz7fWIBpj13QLBZCh/zm7kuH0ZAOlvrMPbq5IcwIum2H8+SfAKSQhXIm
         5+baTHW8VsDN3/ZJhj733/cxG16ERPDZBzgl7TM/UkrZqmWcjLnP/wA/Cc9TuvQ5BusO
         CJeSbZmus59itqXJVMwslmZcyWjCjzyASaaZ4T/rElmKx2u1rpmXvEd70dip4MgmgMdo
         bYVw==
X-Forwarded-Encrypted: i=1; AJvYcCV51AiZ+0rGT6suI6HOkfXRB2d2ngg9bDDQ5E64HoBdyXfDobfsgQceHn9FKdfZXsnGnXcTKEFP5abzcS1ZRtel@lists.infradead.org, AJvYcCXGpGohwb32ngE2F5/2JMbDSmPywKbQQ/ANY0w+/T2TgYMmjoyFVk6boXSPvV4YuitKThxXnXeCfYoUpzg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPxsu72YQYACetLGT23VWId37Xupg4Ol2cFQ6npi1mtm8dMzta
	jVeeq2sBgOPwJKcRZ1/sc6C+F2OMZl+9nM7V/p/qksu5ySHpbjMm1w8+
X-Gm-Gg: ASbGncuMyTEbMyCeKmnvzSRnUnz7ymGvFSbuMHIt8nrgHzs0MmLR2KdZHb1j1D3IoZd
	e2oZh7ndNpmwtSEgwJy3hr7Zy7fZsizyJJDBeMhdc/j9HLx1qMFFx7OaARSxZnEbL7hxXjrnGtw
	tbZovdUvQGsAvNBzUMTnwOswtQKXuTyw5c8ClGxoGk11rwSp2Lrlj0EU+az4Nuhyp1e6mnJoPpJ
	zsU02QHvKx8XJPH0rBlXcK5w8umxRESNWgIXq6wtYy42gkD2qKhRGc6oreM/m6CiVqmpxDdFbj5
	mdOjJRzmE0l383GFyPaBgZJjJVu3cjTOvwlpB6GNK/0PBBO0STf/4CLGZtNaJ8yE7n3ARdLWyeN
	Ao+bdRlH5Tiuvl6Nb8AtNI8w1PiO5bvtl3wBjftvdG2oEyuAkiTc56A==
X-Google-Smtp-Source: AGHT+IEDGbdRM9mEhaV+2ag53MUmou+Up6hgUY2vpYZIptsrNmf4dFU9V5zvfqRBlRBpWDsd4n9KQA==
X-Received: by 2002:a17:902:d552:b0:248:fbc1:daf6 with SMTP id d9443c01a7336-24944ad55a3mr207897875ad.43.1756925975667;
        Wed, 03 Sep 2025 11:59:35 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249065ab343sm169403475ad.126.2025.09.03.11.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 11:59:35 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	virtualization@lists.linux.dev,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	SeongJae Park <sj@kernel.org>
Subject: [PATCH v3 1/7] mm/page_alloc: Add kernel-docs for free_pages()
Date: Wed,  3 Sep 2025 11:59:15 -0700
Message-ID: <20250903185921.1785167-2-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903185921.1785167-1-vishal.moola@gmail.com>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_115936_317157_5032CC95 
X-CRM114-Status: GOOD (  12.16  )
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

Add kernel-docs to free_pages(). This will help callers understand when
to use it instead of __free_pages().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Acked-by: SeongJae Park <sj@kernel.org>
---
 mm/page_alloc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index c2a254d877f8..0277b86b62ac 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5269,6 +5269,15 @@ void free_pages_nolock(struct page *page, unsigned int order)
 	___free_pages(page, order, FPI_TRYLOCK);
 }
 
+/**
+ * free_pages - Free pages allocated with __get_free_pages().
+ * @addr: The virtual address tied to a page returned from __get_free_pages().
+ * @order: The order of the allocation.
+ *
+ * This function behaves the same as __free_pages(). Use this function
+ * to free pages when you only have a valid virtual address. If you have
+ * the page, call __free_pages() instead.
+ */
 void free_pages(unsigned long addr, unsigned int order)
 {
 	if (addr != 0) {
-- 
2.51.0


