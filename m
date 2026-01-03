Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32DCFC6174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 08:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XqmOWnbBqbw0qz0iwR261elwKrPwnP+8eo7jB++6bUk=; b=Jtc2gYyMfgnfcwpPChrueYrP9V
	Ab3l0YKck8fJ5Tyd8eAN38mii1m6cH+Pw6r6L6FlpNB4oSXB0jP2F6V2+IpppgV8NET7kVEM+Ienx
	BEag8qnyz6X+YN+ScITY9PSvLtJprJKTJ+lNpPIgn8SRtrPVXbQMA0eITLmwUgKKlnSNOQkgSqlrO
	0lBtKjDl8dlmEFEjt0/xpy6TA2FCDRNKojxcs+jJSbdPMgbkbzdJWuq3ml5C98zqqmudjPuzJWZwG
	+zvibv2LuWvQuvrwxp28FBaRSkGmZ13gU75zNP+K/ON6WKxPf4TceLcvFLGhXMEdzuQzQmWSNz+UL
	rt0FIXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxIm-000000097EJ-1Vp0;
	Sat, 03 Jan 2026 08:48:00 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxIk-000000097Cw-0g7t
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 08:47:59 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-34c1d98ba11so13585153a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Jan 2026 00:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430077; x=1768034877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqmOWnbBqbw0qz0iwR261elwKrPwnP+8eo7jB++6bUk=;
        b=JajogVTsE7MFPgpZ+tNUZH6Gz3IUjCua4epYqaO7hGxfZ1WRaPHmtZg5JzEtURfAKx
         xv/fnaBga4T1BgyCzJihFo27L3MF5xCNldn+hD7Ja6NZJW0i0s9pZ5TtPNcfiR9kPIhQ
         6HY8fO7b//rVYVBsQPoswyzyPqSkaPcaXA+bIKaqyzT9qYeXgfwIloWgrn3roxQFPMLL
         p0pb3QXltICxPKhNxz5MGry0dE4ZCpG0INhbTeCsd+O52s8aTY0eaa2jYeqFOiOYDFKu
         NEfCwoeq4FqyWS5FGzIjKSMY6OuCj2M8K238U+XXRXwqveOIu0+CQ/Vb3qxRgoHh69J7
         bM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430077; x=1768034877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XqmOWnbBqbw0qz0iwR261elwKrPwnP+8eo7jB++6bUk=;
        b=aptkab4qWgEPX9tUyQh1yeVzl5RYGeHtrbimmnSqzUXwBZNONrKvY5Y/Hpjg05cTui
         myVeiA+zRNnI24gpmWucOyX1tIV1YFhn2r+tUqJwxtNUV03JHccMBtNdN3NL/RdpyaCU
         BIvhEOk5MMKT+me6jtT7JFWoJS0EbyV+aWuXhz8dtAR6OLqWr23ugsxs7xaKeRfoEI/K
         +bgK/Le/Idvh9ePcnbd9tn2rnpRnSTzjdJF57CGV2+GZcZRvCt+xoLuOA5EWqPGFAnhl
         rY3WXMvFn07OLGXptZyUkHIVYO+Ivl6H2tNYul9yIgZdopW69itQyRr4Ugcge/LIuVv+
         AABg==
X-Forwarded-Encrypted: i=1; AJvYcCUGKI9e60dg2QuBc5vv3Rogyl4hB4BFjdPDAz8h8bEbRhgCj7E8Vs+GH/dlfbqp0VuXNabdv6bIqLFYBmfjxGqX@lists.infradead.org
X-Gm-Message-State: AOJu0YzeyetHb6ll2ao1y7fxXOYqkfAO61kAHMvGlbuNiZGMThceoTHQ
	lQnWF1VLzZt+8qw+rkG480Du0Cz64+XTe3nHsumcLfi9YP8nB71349TV
X-Gm-Gg: AY/fxX6k4AoXsKn/pKiNNIa7QR/Rc6uyl3DVFc5IvQxp+plDLEzmOYehicrz5Ytke7+
	LdtISjS0tnl5X7ZRZqXiaOC7j7NZijh/KpC5NHsZoSfIVQ1/hwJuGOeIBLoRlpXfgJ2XoLCHE9R
	1DIxpe27MN7W6URHlahlQA/TOmAjnOE4768qEFj5RGApjQFLQV0nZHPK1dt+XGKyh45o9zPFXty
	YVQFUcobSOzpxkWWBp4WQte3ZIuDviZsEbfNXinu+fmwzPjkQ76rFzMtfdqrnlJMgftPfEnVf87
	pCcdonJUxXu/gU1Bo3L//o2VRmnEmlt5bud9AJ8dRvPuAyjAgo6GRMcOmWSwyjQtalm+wNc2jpC
	/2v9afBZsdS7+xF0/M5BDmTa8i6wbh3X+1u54JK8yV5QOXJ8p0FHhtELty6KMwAAChjdY2WDSlJ
	zJrohZug8p2PlQKFFBhKWqKmDSXu9m3ESqETI=
X-Google-Smtp-Source: AGHT+IH4FDI6MNb+jt4Z9VqoK4GzC1dQlMhMQECNsnvlTczu/ydbQzhhClMmRjiO1aySaBttAjLuTQ==
X-Received: by 2002:a17:90b:548c:b0:330:a454:c31a with SMTP id 98e67ed59e1d1-34e921e90e0mr31635393a91.32.1767430077312;
        Sat, 03 Jan 2026 00:47:57 -0800 (PST)
Received: from jvle-ThinkPad-X1-Carbon-Gen-8.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197983sm42704939b3a.33.2026.01.03.00.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:47:56 -0800 (PST)
From: Keke Ming <ming.jvle@gmail.com>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org
Cc: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	tsbogend@alpha.franken.de,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Keke Ming <ming.jvle@gmail.com>
Subject: [PATCH 2/5] arm64/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
Date: Sat,  3 Jan 2026 16:42:40 +0800
Message-ID: <20260103084243.195125-3-ming.jvle@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260103084243.195125-1-ming.jvle@gmail.com>
References: <20260103084243.195125-1-ming.jvle@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_004758_251696_0193D43D 
X-CRM114-Status: GOOD (  10.73  )
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

Replace deprecated kmap_atomic() with kmap_local_page().

Signed-off-by: Keke Ming <ming.jvle@gmail.com>
---
 arch/arm64/kernel/probes/uprobes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/probes/uprobes.c b/arch/arm64/kernel/probes/uprobes.c
index 941668800aea..4c55bf832ec3 100644
--- a/arch/arm64/kernel/probes/uprobes.c
+++ b/arch/arm64/kernel/probes/uprobes.c
@@ -15,7 +15,7 @@
 void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 		void *src, unsigned long len)
 {
-	void *xol_page_kaddr = kmap_atomic(page);
+	void *xol_page_kaddr = kmap_local_page(page);
 	void *dst = xol_page_kaddr + (vaddr & ~PAGE_MASK);
 
 	/*
@@ -32,7 +32,7 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 	sync_icache_aliases((unsigned long)dst, (unsigned long)dst + len);
 
 done:
-	kunmap_atomic(xol_page_kaddr);
+	kunmap_local(xol_page_kaddr);
 }
 
 unsigned long uprobe_get_swbp_addr(struct pt_regs *regs)
-- 
2.43.0


