Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2228CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGcwkTAP+0x56KFi5xH9yzo8Ys7TxU7DTYK9eKfTIZY=; b=Jh0wdO4SiObxY9bGIy0wWdpMxa
	mfQbHcmAUd6F7DPMRzW04cUSBrXMXZAaQETAy+veQdBwOiqX4TvEenqNlcrG8oIwkRMvxHjWUj8vu
	j7ovi8q/04PxosIawYEZ4YOBTxJy4YOi7gY/j4RsaUyp+FbbSqg7kJzdLs5R++0kJ8+LZw/rKkWfM
	5R183IpASXWBmXVYmL2e8+/5gmLOkGo8Dk070S/fN31nMU1Vi73JN05iDz7SJ7P6Oid22J0T7636y
	BHsi4dNXCmb7u4ZbgsEOqxkGZBxhTiFp3YXYA6oSnPMGCIrTs7oU6ndEiyJRjckQuUwJmXpAZDgWX
	2ioe+mLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjPk-0000000EsRH-2TU9;
	Wed, 03 Jun 2026 11:05:36 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjPh-0000000EsPU-0JmL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:05:34 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490ae4d89e2so24222825e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 04:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780484731; x=1781089531; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xGcwkTAP+0x56KFi5xH9yzo8Ys7TxU7DTYK9eKfTIZY=;
        b=ppv0yZz6azYvL8Zq1uFjG8LJkdxCxeLagbBQL3wVpQPyOB8827h4SHoyuqU0e7c6rC
         wFkto4/+6ekjeU0NnJMmu1iW0p+fMM4R7QuaJDEi6/GYOJ7mqoeSR8tKS7f2YOT2DaHB
         2Udtgra1b7MHZzJDSZtLcbu5Z81Gxo5oXGbz5uYrkMhL31wNzx0RTPd9IYUJ98/7eNNo
         tTkW91V+jEJIqfOHHH5oxMlFC6wLSVB9MK4PiPpYs1z/EFjGKq9AcvRZlw6w5YDYRQ1e
         9R1UFYQHoxTYZCNXjkOymJNgUqvsApzeLmSFDbzkV7GXIhFoBT5pL4VDRiv4cC5WohY1
         hG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780484731; x=1781089531;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xGcwkTAP+0x56KFi5xH9yzo8Ys7TxU7DTYK9eKfTIZY=;
        b=sRkfVr+AcL8uWvpFFKFZZt6Xigh4Y2jyVmxyFsJA/jQYxPMZiDcDGCxvm8fsuxB/8t
         fqksqofCOPp+wE57zzgdIJSgiFKl0UNIJdf0l4wV2E+6fJ86GAIBEU36RJaLZzWhpK2L
         6Jimj9TvEVeyyEdwD8MAIl/5uXg4K6G5LTTHk4Zt0Py58nrjvQVWznn5ao9OKSbgOU6N
         dajGm3D1f34h4k21URXtdlTBgQUf4G2wr/Y7mmvHRHZ3enGVLK4bfuYCV6en8gcXUM11
         eVZRh8Ouu7K9bXUZzlsKLLwJmmNgEylzte/LbcleUwPxghOp8xP03jgacXmOwU06Qpz6
         q2Aw==
X-Gm-Message-State: AOJu0YyQkwrV8ZTtYxdooHLtLn2VkOG7yrtnZORCorZVKwfXr9kxRlX1
	dYMKmajSalXgQha5YnAw819wk508mqLhW9tUv9K3tc6NkaeDkQ9h+U+318uH+EyFR8u3EYXFqeA
	VUxCTx9urjgWVNw1SzNc1XDButq4B1UM9+oSEXp1vgDu9nuQmrUeNazq/jrkY+ZOSrgNxt+quqa
	hwiOxX83Wwv1JgiLxmeEDTkt8maydQ1HG9FfO67mJc2cNhmsN8dBWWs5u36wYuOSxXGw==
X-Received: from wmbz27.prod.google.com ([2002:a05:600c:c09b:b0:490:b258:4672])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c1e:b0:490:5466:8591 with SMTP id 5b1f17b1804b1-490b5ecff9cmr47408085e9.12.1780484730594;
 Wed, 03 Jun 2026 04:05:30 -0700 (PDT)
Date: Wed,  3 Jun 2026 11:05:20 +0000
In-Reply-To: <20260603110522.3331819-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260603110522.3331819-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <20260603110522.3331819-2-smostafa@google.com>
Subject: [PATCH 1/3] arm64/mm: Simplify SWIOTLB setup in arch_mm_preinit()
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, will@kernel.org, 
	rppt@kernel.org, maz@kernel.org, aneesh.kumar@kernel.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_040533_122998_82F79FD2 
X-CRM114-Status: GOOD (  13.93  )
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

At the moment, arch_mm_preinit() checks if the system has limited
addressing or is running under CCA to enable SWIOTLB, only after to
be forced to true anyway if it was false due to
CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC being unconditionally true for
arm64.

Simplify this logic, by making it clear that SWIOTLB is always used
but its size depends on the address layout of the system.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/mm/init.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 97987f850a33..fcc9c05a8fe6 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -336,25 +336,22 @@ void __init arch_setup_zero_pages(void)
 void __init arch_mm_preinit(void)
 {
 	unsigned int flags = SWIOTLB_VERBOSE;
-	bool swiotlb = max_pfn > PFN_DOWN(arm64_dma_phys_limit);
+	bool limited_addressing = max_pfn > PFN_DOWN(arm64_dma_phys_limit);
 
 	if (is_realm_world()) {
-		swiotlb = true;
 		flags |= SWIOTLB_FORCE;
-	}
-
-	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb) {
+	} else if (!limited_addressing) {
 		/*
 		 * If no bouncing needed for ZONE_DMA, reduce the swiotlb
 		 * buffer for kmalloc() bouncing to 1MB per 1GB of RAM.
 		 */
 		unsigned long size =
 			DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
+
 		swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
-		swiotlb = true;
 	}
 
-	swiotlb_init(swiotlb, flags);
+	swiotlb_init(true, flags);
 
 	/*
 	 * Check boundaries twice: Some fundamental inconsistencies can be
-- 
2.54.0.1032.g2f8565e1d1-goog


