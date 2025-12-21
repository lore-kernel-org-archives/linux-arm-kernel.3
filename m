Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7561D68BD5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 05:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zrm+sCPHTPnZ3R2lUhrTFOXrDyXAJEp9c+N8RivifRI=; b=VaTa9iMwa+jRcZ
	rNnzfr83lmE6d2wm7lKRGJvxCSStO7SMbtP8H3lxI/Su29MtvjAKF04CXA4z+La5T2sQNCei25gtY
	3yNtXufG84VqquBYfaFqUJb8xjHRd/cSjsvdAdFY4i/TXN2whZEFyZvTUEORjZE7jTg1qmN5vnijA
	iTV72QnmV9BZIyx/aNa9bjSlQBJtjuxc1b1Nls6lsC2XJrL7oISzg8VIU8IrLZcsi438X+ob9hX39
	BwuX/tLO07JrMLJpkU/yx1xp2+ixQombfexMcSo1FRMVFQHomVLODwjNfWCRhTg1CJO6N01/AdkVD
	VNGfVV+ur/3WyUeIoaNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXBnB-0000000C9Ei-3xj4;
	Sun, 21 Dec 2025 05:15:41 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXBn8-0000000C9EJ-2b67
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 05:15:40 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-34c213f7690so2406062a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Dec 2025 21:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766294135; x=1766898935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zrm+sCPHTPnZ3R2lUhrTFOXrDyXAJEp9c+N8RivifRI=;
        b=YYYRVyRPKJ6pq2WXeqVB/lN+gQZehMH3IXwgstofGvCvoHvq8OTaOim/ZcBiQRCNF2
         Vs+iRnPaHYoyw/HutmMT4d4g4trZg0i7d2HjoJIWoOI0ll468c/tj8g1O5jn2hIrqMA1
         3r1lM7M5Hh79TRWvCNIw6LQSS2j9THXlhClbPgP+KR88p2H1rqxu2nnK7Rii7Mef99Uf
         ZU0H8Sy2S5adpMfFP53mc4k0EBqPKgXC1HwW/GaNPC/YOOY0EUeNzuaz08jDwk8okV82
         DsUrqwAlDwDEh4w4rOXGVTDYBxKzy0R32JgVOjVJ2LxIK8bzaTu9hqdtlWdQipgXxgSq
         /GiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766294135; x=1766898935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zrm+sCPHTPnZ3R2lUhrTFOXrDyXAJEp9c+N8RivifRI=;
        b=IO4Y39hHxq3YIGx9X0B2AVbOzSCQ4z+xQmre74jjtqDT0vqg5AabwMnY+8U2Dpdi5y
         1t3Temhp44JH2+mtSyo3tmcEQZC2g5YjDQTFC6ykqZkFrTxI+WPvC4j2vzts5Wuk+NTN
         ubX/dmqgCsCqy0kcYAAssSpJsbYK4v4tiyI45S7AsY3ur3A+E7rMU3QkqccK0DTM6k6K
         j7kadOxUpVHjLC0AObPHI+EX5gWR61FilFL3o4lI97J3F7jMXAPcgnHwr/cdh2oBxnhB
         n4+LOiBoOK0k6fvvJSDqGCwuk5nwWkvr5mDb3Ez0gjFeg1E0uR5aX84cD9jwYuXkIcoG
         NIww==
X-Forwarded-Encrypted: i=1; AJvYcCX3XL2Qjz0spq6ybNyJKSq7pAQC9C6eQ/DHyoTFVUQbFQTpDJjg8JT7Cg5fVnr5RyvtmTNrAQcKaKRu8aJVscxj@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6cCDbrZBCg8ml406q8RBmMxWfZvdtIQtxEyBG4O3UCPXLuvma
	ILksPFsLhswt1zcNqYZ8vGnSkRxQOQYHqlzf4AS+5HL+kmkWsDuL+Nii
X-Gm-Gg: AY/fxX6OxNQsSl8G/Q7jYxybX7JGzuicMuPZcpKfGxSHqMTLrBeUuWKjQJI3tGv9mj0
	Cd4PYTXfJ2lO1b2haLerPrnbBSe5IeezhCNO7T7mzSlAY/c3yQhXgJ+ztWnW95opDL3AMdvYdoU
	dLXJwR8THlANxaadP8vImQb3C1j0KuPCtTnzf19J3eYTgol4TstTHUph6Rv7nk0/mduVJhhVBpo
	yjIJx1EN7l7TAFZggZ1ukmGqFUOchVRJRZYseC4+z0seLLgAmcCjTaC/R7jwPFnbk1ggoN67Iqe
	soPpStsCHZ0cLI7U3WPRrW9drsjjVgICmhiHi4uL8EuqH/YKHbWiT+jqql/jcj/OjsHVu9hTexX
	Pdn6PGz6fKyUYgWcYMr2BKyyrSOlNzv4dAyr37ucV3SOgR2lVHb1GG/RNMgA3IVvOzeL77RJFak
	GSRe5sjM2mS+MGkLSRU5geuQ2e
X-Google-Smtp-Source: AGHT+IG8fgdP5DyvYQfIsi79vPvO3rvDS48h/0TZoR1EsxLyaeNxkQLWaGjIbOP2x9FZnMrWOAqXpQ==
X-Received: by 2002:a17:90b:33c9:b0:32e:6fae:ba52 with SMTP id 98e67ed59e1d1-34e9211d59dmr6149016a91.6.1766294135006;
        Sat, 20 Dec 2025 21:15:35 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e9223adf5sm6402226a91.14.2025.12.20.21.15.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 20 Dec 2025 21:15:34 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: lkp@intel.com
Subject: Re: [PATCH 5/6] dma-mapping: Allow batched DMA sync operations if supported by the arch
Date: Sun, 21 Dec 2025 13:15:23 +0800
Message-Id: <20251221051523.18557-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <202512201836.f6KX6WMH-lkp@intel.com>
References: <202512201836.f6KX6WMH-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_211538_686085_97BE0428 
X-CRM114-Status: GOOD (  16.73  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, oe-kbuild-all@lists.linux.dev, anshuman.khandual@arm.com, will@kernel.org, catalin.marinas@arm.com, llvm@lists.linux.dev, 21cnbao@gmail.com, linux-kernel@vger.kernel.org, surenb@google.com, iommu@lists.linux.dev, maz@kernel.org, robin.murphy@arm.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

>
> All errors (new ones prefixed by >>):
>
> >> kernel/dma/direct.c:456:4: error: call to undeclared function 'dma_direct_unmap_phys_batch_add'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      456 |                         dma_direct_unmap_phys_batch_add(dev, sg->dma_address,
>          |                         ^
>    kernel/dma/direct.c:456:4: note: did you mean 'dma_direct_unmap_phys'?
>    kernel/dma/direct.h:188:20: note: 'dma_direct_unmap_phys' declared here
>      188 | static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
>          |                    ^
> >> kernel/dma/direct.c:484:22: error: call to undeclared function 'dma_direct_map_phys_batch_add'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      484 |                         sg->dma_address = dma_direct_map_phys_batch_add(dev, sg_phys(sg),
>          |                                           ^
>    2 errors generated.
>
>

Thanks very much for the report.
Can you please check if the below diff fix the build issue?

From 5541aa1efa19777e435c9f3cca7cd2c6a490d9f1 Mon Sep 17 00:00:00 2001
From: Barry Song <v-songbaohua@oppo.com>
Date: Sun, 21 Dec 2025 13:09:36 +0800
Subject: [PATCH] kernel/dma: Fix build errors for dma_direct_map_phys

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512201836.f6KX6WMH-lkp@intel.com/
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 kernel/dma/direct.h | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index a211bab26478..bcc398b5aa6b 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -138,8 +138,7 @@ static inline dma_addr_t __dma_direct_map_phys(struct device *dev,
 	return DMA_MAPPING_ERROR;
 }
 
-#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
-static inline dma_addr_t dma_direct_map_phys_batch_add(struct device *dev,
+static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 		phys_addr_t phys, size_t size, enum dma_data_direction dir,
 		unsigned long attrs)
 {
@@ -147,13 +146,13 @@ static inline dma_addr_t dma_direct_map_phys_batch_add(struct device *dev,
 
 	if (dma_addr != DMA_MAPPING_ERROR && !dev_is_dma_coherent(dev) &&
 	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
-		arch_sync_dma_for_device_batch_add(phys, size, dir);
+		arch_sync_dma_for_device(phys, size, dir);
 
 	return dma_addr;
 }
-#endif
 
-static inline dma_addr_t dma_direct_map_phys(struct device *dev,
+#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
+static inline dma_addr_t dma_direct_map_phys_batch_add(struct device *dev,
 		phys_addr_t phys, size_t size, enum dma_data_direction dir,
 		unsigned long attrs)
 {
@@ -161,13 +160,20 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 
 	if (dma_addr != DMA_MAPPING_ERROR && !dev_is_dma_coherent(dev) &&
 	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
-		arch_sync_dma_for_device(phys, size, dir);
+		arch_sync_dma_for_device_batch_add(phys, size, dir);
 
 	return dma_addr;
 }
+#else
+static inline dma_addr_t dma_direct_map_phys_batch_add(struct device *dev,
+		phys_addr_t phys, size_t size, enum dma_data_direction dir,
+		unsigned long attrs)
+{
+	return dma_direct_map_phys(dev, phys, size, dir, attrs);
+}
+#endif
 
-#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
-static inline void dma_direct_unmap_phys_batch_add(struct device *dev, dma_addr_t addr,
+static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	phys_addr_t phys;
@@ -178,14 +184,14 @@ static inline void dma_direct_unmap_phys_batch_add(struct device *dev, dma_addr_
 
 	phys = dma_to_phys(dev, addr);
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		dma_direct_sync_single_for_cpu_batch_add(dev, addr, size, dir);
+		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
 
 	swiotlb_tbl_unmap_single(dev, phys, size, dir,
 					 attrs | DMA_ATTR_SKIP_CPU_SYNC);
 }
-#endif
 
-static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
+#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
+static inline void dma_direct_unmap_phys_batch_add(struct device *dev, dma_addr_t addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	phys_addr_t phys;
@@ -196,9 +202,17 @@ static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
 
 	phys = dma_to_phys(dev, addr);
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
+		dma_direct_sync_single_for_cpu_batch_add(dev, addr, size, dir);
 
 	swiotlb_tbl_unmap_single(dev, phys, size, dir,
 					 attrs | DMA_ATTR_SKIP_CPU_SYNC);
 }
+#else
+static inline void dma_direct_unmap_phys_batch_add(struct device *dev, dma_addr_t addr,
+		size_t size, enum dma_data_direction dir, unsigned long attrs)
+{
+	dma_direct_unmap_phys(dev, addr, size, dir, attrs);
+}
+#endif
+
 #endif /* _KERNEL_DMA_DIRECT_H */
-- 
2.39.3 (Apple Git-146)

Thanks
Barry


