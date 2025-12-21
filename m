Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD839E67482
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 19:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=thbvw4jAc9qFXbQZxlasdweVQvzQ0G21GFKpTP76SAQ=; b=N1djmXwhmmn+IO
	6q8RWxk3q8nsCUfB3D+roKfY51Qp0xvbjVKwmbzzJgCR8GFJrGlJf0ZQaKXjzI99KJ8WI6JeHFn7D
	zwvWi8OBepW3cW8xeVbrq1eaZ5ZLod5QKnrDFj3Uz71Sy+h9CnZCmhkjLheRvkyAvKCyFinU1UFCw
	RNRBfw3U7rG9xuwwMe20cww92tNxwCfPEM+FwJhQo+TnSvdG2gwneqyCieEXlZ6FhPcHwIhZwuX/W
	HoN1k725+shflWSPQOhx9GQXDJBpDN1DHtIQzmQribti18kCvfLy/IpkEcYq1an5AiGxhxGtC9MN9
	tsweWYLrpj0g1oQeVkJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXP3J-0000000CgRH-2vCF;
	Sun, 21 Dec 2025 19:25:13 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXP3H-0000000CgQl-2AUA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 19:25:12 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a0bae9aca3so46615975ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 11:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766345110; x=1766949910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thbvw4jAc9qFXbQZxlasdweVQvzQ0G21GFKpTP76SAQ=;
        b=C/ZKBeSyx9NAAozgkiBFR7A8jTo5TFuv3hb/LH2QDr0C2ceY2r1GvqdwBNzRwib+1+
         0bwaSKqQpZyF1vmBrZtdJYM1wa+jpkHQ4SxfxwD4qNOPKYtmYMqhIN4odhA+W5GAVWSd
         QmAg+as9IdmSziff0dfkDAS+lCg7OFGpirn3j450VslhtZypaeI/Ee4Wl2lpuTa8sldq
         1oNvp9M4Nt0Am7ZmUP/p2NhjqDFTUA9Ld0KEkOdbOKPcdRJJOUqCeNghbTs8lFiXfNo+
         +Io1Q3p/LKZHLZFwlsn9phDC03hcPvoQnXHrK8SfPhO6Lgc/9IibTlkZ1hQf9LixhtMg
         KEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766345110; x=1766949910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=thbvw4jAc9qFXbQZxlasdweVQvzQ0G21GFKpTP76SAQ=;
        b=lLFjjLBlhgqqXIq8NAwhM6qwGjT3UsxSK5CfMGGlplYP1X0BxIl1BDU/2ryB6fNNnq
         ZKY274se1T6xRs9rmQc0hUQRashhVOEqJr1ph35c61F9EYeVXn4hx1J0sNp9SBo9bCvq
         FrsiU9gg29fzRg3ZI9rj7nyodD58O3SBtkRHnLdgcEKq0VkLsjnDtUgMCysL3QIDw5Ia
         c0ufYRQh8y2t+jQAsjsl6ij1Ep9xGgVQ3VM6xqmL9XzkjwWKqUjzGaTpBGDYjO02QXOD
         1kmFm45NK/XjouB1Z6L5kMwBtJJT155vZH3JvqoUDEcS90vOedi8yqp4amk4y6YesRDz
         hS7g==
X-Forwarded-Encrypted: i=1; AJvYcCWQpO6Lsa4VEYmmmqxjr6c+EA/jCe/0/iT4BH5lLh/xVN693oi7mZl5W1I9vYyMl8bPQEqfDLoP1SJbnE/VZwGm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+YGTENrgYsuqTKZFrUEfQy9rlcqLl/xVILzscDr0QV2ATJses
	+QmfBuEf0eW7gRRn8Cf/shWAmdhxxs/JB3Z95extcOkA7DEhwsiolDTQ
X-Gm-Gg: AY/fxX4n/YoKLrx5kmDnC5xd4roeyDmskXgXmvJPbNTdQ4KXQBC41gjZCbg80aZEjh6
	bs8KrfyJCeE8Uwclku2WsuW8vxhPUmiIoScS2zafOw+lDYNnrMyYHE4OPg+eRXnxsrITe/bebn+
	2OFtluiSVGQCcPXQ/1x60LE8OkErCYVE+iBBvEd7ZAlQu875TXeVHAQvZjx9JHNrMUDB8m+Yco+
	lJvsIZ7/ZKE9LK+5+B3Bt3ZaYpxUkWNf2rB8QnOipu/alOyqnF3IMGIgaVvLCYK+w0PrMqCFgU+
	dQ+qmUIBh+JmGjA/Z1B4QH1kKmOBlM0Th+X/RKlfmxR5Tn/WBqMygETWn7O4mAHN9R2zH97oDH2
	sYr4pB0lkrPCUTDLpAT8kHWkP5uMcL2Mc3NAs6dC1a7PfDPQQUk0Rjcz06eRv3/ZAy8ZmDaBU0D
	bx45odcDzJ68qAQYoD00GN7NVk
X-Google-Smtp-Source: AGHT+IGh+u8/09esmdKFv5uzl2lfPsJMPaLvSL5Po3+aPCp1tGS+/be/qQac7D60igIrYPvPxPgfqA==
X-Received: by 2002:a17:903:2285:b0:29b:e512:752e with SMTP id d9443c01a7336-2a2f293b6c1mr88369015ad.47.1766345110324;
        Sun, 21 Dec 2025 11:25:10 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82aa8sm76559155ad.31.2025.12.21.11.25.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 21 Dec 2025 11:25:09 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: leon@kernel.org
Subject: Re: [PATCH 5/6] dma-mapping: Allow batched DMA sync operations if supported by the arch
Date: Mon, 22 Dec 2025 03:24:58 +0800
Message-Id: <20251221192458.1320-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20251221115523.GI13030@unreal>
References: <20251221115523.GI13030@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_112511_596836_8FA85973 
X-CRM114-Status: GOOD (  21.70  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, will@kernel.org, anshuman.khandual@arm.com, catalin.marinas@arm.com, 21cnbao@gmail.com, linux-kernel@vger.kernel.org, surenb@google.com, iommu@lists.linux.dev, maz@kernel.org, robin.murphy@arm.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Dec 21, 2025 at 7:55 PM Leon Romanovsky <leon@kernel.org> wrote:
[...]
> > +
>
> I'm wondering why you don't implement this batch‑sync support inside the
> arch_sync_dma_*() functions. Doing so would minimize changes to the generic
> kernel/dma/* code and reduce the amount of #ifdef‑based spaghetti.
>

There are two cases: mapping an sg list and mapping a single
buffer. The former can be batched with
arch_sync_dma_*_batch_add() and flushed via
arch_sync_dma_batch_flush(), while the latter requires all work to
be done inside arch_sync_dma_*(). Therefore,
arch_sync_dma_*() cannot always batch and flush.

But yes, I can drop the ifdef in this patch. I have rewritten the entire
patch as shown below, and it will be tested today prior to
resending v2. Before I send v2, you are very welcome to comment.


From c03aae12c608b25fc1a84931ce78dbe3ef0f1ebe Mon Sep 17 00:00:00 2001
From: Barry Song <v-songbaohua@oppo.com>
Date: Wed, 29 Oct 2025 10:31:15 +0800
Subject: [PATCH v2 FOR DISCUSION 5/6] dma-mapping: Allow batched DMA sync operations

This enables dma_direct_sync_sg_for_device, dma_direct_sync_sg_for_cpu,
dma_direct_map_sg, and dma_direct_unmap_sg to use batched DMA sync
operations when possible. This significantly improves performance on
devices without hardware cache coherence.

Tangquan's initial results show that batched synchronization can reduce
dma_map_sg() time by 64.61% and dma_unmap_sg() time by 66.60% on an MTK
phone platform (MediaTek Dimensity 9500). The tests were performed by
pinning the task to CPU7 and fixing the CPU frequency at 2.6 GHz,
running dma_map_sg() and dma_unmap_sg() on 10 MB buffers (10 MB / 4 KB
sg entries per buffer) for 200 iterations and then averaging the
results.

Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 kernel/dma/direct.c | 28 +++++++++++++++------
 kernel/dma/direct.h | 59 +++++++++++++++++++++++++++++++++++++--------
 2 files changed, 69 insertions(+), 18 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 50c3fe2a1d55..ed2339b0c5e7 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -403,9 +403,10 @@ void dma_direct_sync_sg_for_device(struct device *dev,
 		swiotlb_sync_single_for_device(dev, paddr, sg->length, dir);
 
 		if (!dev_is_dma_coherent(dev))
-			arch_sync_dma_for_device(paddr, sg->length,
-					dir);
+			arch_sync_dma_for_device_batch_add(paddr, sg->length, dir);
 	}
+	if (!dev_is_dma_coherent(dev))
+		arch_sync_dma_batch_flush();
 }
 #endif
 
@@ -422,7 +423,7 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 		phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
 
 		if (!dev_is_dma_coherent(dev))
-			arch_sync_dma_for_cpu(paddr, sg->length, dir);
+			arch_sync_dma_for_cpu_batch_add(paddr, sg->length, dir);
 
 		swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);
 
@@ -430,8 +431,10 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 			arch_dma_mark_clean(paddr, sg->length);
 	}
 
-	if (!dev_is_dma_coherent(dev))
+	if (!dev_is_dma_coherent(dev)) {
 		arch_sync_dma_for_cpu_all();
+		arch_sync_dma_batch_flush();
+	}
 }
 
 /*
@@ -443,14 +446,19 @@ void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
 {
 	struct scatterlist *sg;
 	int i;
+	bool need_sync = false;
 
 	for_each_sg(sgl,  sg, nents, i) {
-		if (sg_dma_is_bus_address(sg))
+		if (sg_dma_is_bus_address(sg)) {
 			sg_dma_unmark_bus_address(sg);
-		else
-			dma_direct_unmap_phys(dev, sg->dma_address,
+		} else {
+			need_sync = true;
+			dma_direct_unmap_phys_batch_add(dev, sg->dma_address,
 					      sg_dma_len(sg), dir, attrs);
+		}
 	}
+	if (need_sync && !dev_is_dma_coherent(dev))
+		arch_sync_dma_batch_flush();
 }
 #endif
 
@@ -460,6 +468,7 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 	struct pci_p2pdma_map_state p2pdma_state = {};
 	struct scatterlist *sg;
 	int i, ret;
+	bool need_sync = false;
 
 	for_each_sg(sgl, sg, nents, i) {
 		switch (pci_p2pdma_state(&p2pdma_state, dev, sg_page(sg))) {
@@ -471,7 +480,8 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 			 */
 			break;
 		case PCI_P2PDMA_MAP_NONE:
-			sg->dma_address = dma_direct_map_phys(dev, sg_phys(sg),
+			need_sync = true;
+			sg->dma_address = dma_direct_map_phys_batch_add(dev, sg_phys(sg),
 					sg->length, dir, attrs);
 			if (sg->dma_address == DMA_MAPPING_ERROR) {
 				ret = -EIO;
@@ -491,6 +501,8 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 		sg_dma_len(sg) = sg->length;
 	}
 
+	if (need_sync && !dev_is_dma_coherent(dev))
+		arch_sync_dma_batch_flush();
 	return nents;
 
 out_unmap:
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index da2fadf45bcd..2e25af887204 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -64,13 +64,16 @@ static inline void dma_direct_sync_single_for_device(struct device *dev,
 		arch_sync_dma_for_device(paddr, size, dir);
 }
 
-static inline void dma_direct_sync_single_for_cpu(struct device *dev,
-		dma_addr_t addr, size_t size, enum dma_data_direction dir)
+static inline void __dma_direct_sync_single_for_cpu(struct device *dev,
+		dma_addr_t addr, size_t size, enum dma_data_direction dir,
+		bool flush)
 {
 	phys_addr_t paddr = dma_to_phys(dev, addr);
 
 	if (!dev_is_dma_coherent(dev)) {
-		arch_sync_dma_for_cpu(paddr, size, dir);
+		arch_sync_dma_for_cpu_batch_add(paddr, size, dir);
+		if (flush)
+			arch_sync_dma_batch_flush();
 		arch_sync_dma_for_cpu_all();
 	}
 
@@ -80,9 +83,15 @@ static inline void dma_direct_sync_single_for_cpu(struct device *dev,
 		arch_dma_mark_clean(paddr, size);
 }
 
-static inline dma_addr_t dma_direct_map_phys(struct device *dev,
+static inline void dma_direct_sync_single_for_cpu(struct device *dev,
+		dma_addr_t addr, size_t size, enum dma_data_direction dir)
+{
+	__dma_direct_sync_single_for_cpu(dev, addr, size, dir, true);
+}
+
+static inline dma_addr_t __dma_direct_map_phys(struct device *dev,
 		phys_addr_t phys, size_t size, enum dma_data_direction dir,
-		unsigned long attrs)
+		unsigned long attrs, bool flush)
 {
 	dma_addr_t dma_addr;
 
@@ -109,8 +118,11 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 	}
 
 	if (!dev_is_dma_coherent(dev) &&
-	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
-		arch_sync_dma_for_device(phys, size, dir);
+	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
+		arch_sync_dma_for_device_batch_add(phys, size, dir);
+		if (flush)
+			arch_sync_dma_batch_flush();
+	}
 	return dma_addr;
 
 err_overflow:
@@ -121,8 +133,23 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 	return DMA_MAPPING_ERROR;
 }
 
-static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
-		size_t size, enum dma_data_direction dir, unsigned long attrs)
+static inline dma_addr_t dma_direct_map_phys(struct device *dev,
+		phys_addr_t phys, size_t size, enum dma_data_direction dir,
+		unsigned long attrs)
+{
+	return __dma_direct_map_phys(dev, phys, size, dir, attrs, true);
+}
+
+static inline dma_addr_t dma_direct_map_phys_batch_add(struct device *dev,
+		phys_addr_t phys, size_t size, enum dma_data_direction dir,
+		unsigned long attrs)
+{
+	return __dma_direct_map_phys(dev, phys, size, dir, attrs, false);
+}
+
+static inline void __dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
+		size_t size, enum dma_data_direction dir, unsigned long attrs,
+		bool flush)
 {
 	phys_addr_t phys;
 
@@ -132,9 +159,21 @@ static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
 
 	phys = dma_to_phys(dev, addr);
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
+		__dma_direct_sync_single_for_cpu(dev, addr, size, dir, flush);
 
 	swiotlb_tbl_unmap_single(dev, phys, size, dir,
 					 attrs | DMA_ATTR_SKIP_CPU_SYNC);
 }
+
+static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
+		size_t size, enum dma_data_direction dir, unsigned long attrs)
+{
+	__dma_direct_unmap_phys(dev, addr, size, dir, attrs, true);
+}
+
+static inline void dma_direct_unmap_phys_batch_add(struct device *dev, dma_addr_t addr,
+		size_t size, enum dma_data_direction dir, unsigned long attrs)
+{
+	__dma_direct_unmap_phys(dev, addr, size, dir, attrs, false);
+}
 #endif /* _KERNEL_DMA_DIRECT_H */
-- 
2.39.3 (Apple Git-146)

