Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15ABD74956
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 05:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eenPutgBr0kvR5xknWuBlG56Mzp4JXW/11o/+DFN/Mk=; b=AUmkGZE4kpo7yk
	4wPGzPLhI3I6H2MredRKyVrTJI4ub+0O5EW8RkbaJJslwA6YWHvcThbyn4mbz2MaED2+4yo+m9bgz
	KBZNAQOGuWS1XY44g5xiBmBqDZBFjpS53X2/Bv8tU4QS9XvLIkHCj5ELX28694q4ufYkyu7moautl
	vFofwP381v2Iu8AlxVcfSJisowtdCSoBYuIogInkKaO9ioleENusrCGA7mcz4ns/l+1jxb88K1Y6c
	glokbHGKwIFTXWOGFfpEm+Qoj/w8MpKCYNp3HhYk5UIO35yg6LUBO357eNtM1IlTCgF1Ub8830vpQ
	zq5MirE4aMmH8isNCyJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTBQ-00000009eju-2zs9;
	Fri, 19 Dec 2025 05:37:44 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTBN-00000009ehk-45JV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 05:37:43 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a099233e8dso12967695ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 21:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766122661; x=1766727461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eenPutgBr0kvR5xknWuBlG56Mzp4JXW/11o/+DFN/Mk=;
        b=jS9LKa4ncexGHFY7oGGI5NTl9Kd67EuH11Mslar8xeMjNL4E869Az9ZwO5+5uTzAXm
         fh5A1wqemBRkNPhpp31q5b3zeXKaBfSGK36rsjCyYoI5w7sz7gy6xlR5fZuhLUXBLI+r
         mIFsCOuj7waNejfQmkkUT4MmxNejxOKrAknL7tm0S+aUW+SJbxt91v/rJ9WNQneHQ49y
         Uea27OE7EIn1DxTCq+E/y7ZpcwzhKCjcFfaI56LV7W1yGyligpbFgWrPM7J58YddQAid
         AaSEiHohp4kWDkpYijX5F4BfoaIPcPjXG2HdbLc7kh+R+ZVPLawoOSvszrOkIK+hXrox
         PFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766122661; x=1766727461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eenPutgBr0kvR5xknWuBlG56Mzp4JXW/11o/+DFN/Mk=;
        b=aHFY1pNR2LkFjYbSfiKYHlTjmcs77E2QoUcu44B4zbZKg3raGFFXGMO0VF4uTqAtF3
         3EHy1b+fiUJ/StPIrfuo8z1QcIP0n5Xk0GFuAUlxIOdbIA1pIgRvPmq9SWEheI2Oc2MH
         I1Ay04Sjsg10if+smex//on3vbmAtqfc4xM2CJ/U6W/PSM52IdgsDgnqh+uMnYoBfHtu
         zfsiilA0o8FrEQC9UbkOEAx397/MurWP+kakHG7sHKp6/oKlSsAj8UoH3GjwzV3m9CM/
         3EX2WRQ+MJwZYAMDGPdGTiU0H0WsB39bDdk1JxAgGaxiaP8AlWYV9bSeKDLPZ3dpSXic
         2Ymw==
X-Forwarded-Encrypted: i=1; AJvYcCUxwI40Mi9pMs9swUxY6VIPrZksBDSNPCOSCFwqHIUVP5tA7Y42RbkjXpKQkapIbK1IEUMbSrK9rKNKAgjUoRVX@lists.infradead.org
X-Gm-Message-State: AOJu0YyZaG32KksaQQZB9bpBqIBgUmBQhgMfYD6PQD6he2kD7vDEQfU9
	xUopbaXMoDk6u7MLWMYkquVaT/d2BELMIGk8sriE75enfHFhW2DmEipb
X-Gm-Gg: AY/fxX5TkGOVae89dh2I/jUEpNwBDHJWuxsBNvl4oiDltGjQlFmorX/ZA3TKCyrK8fF
	mEAEcDhb95wUxoMMCJl0aTAqtVFowEds85yob0chsgdqV05uYnNUQTRxaTDyqA3Hl1uPUtjZqbk
	B0em/Nn/QIrhzBWziLLMFSeVpMjbaqE+0qt4dv7ReltNgQcyieo1CJrOwSXf9JBEVRIA9aKv5VZ
	3fhjiWRXTVFfmCB2sfz64T4z4F8l/zprLkQFHd1P7gu0Psi22VDpiCUA6qd16duLLpfIz8KEH1I
	68S5cEqwdkoYKJxAWw0tnAjOLEDGE8A27id+FPT9/ZQtCzU22kAx0synuBkptAkGR1Wifak7hBD
	/clgK9EFMW10iKew8M1J2uWtS+JN2swZ5/7a+DzvRKaZLUPmscWXCFUKa5xOXOY8Y4rbFF422Tb
	gmmgXXM3jSzJV25E4qwpE=
X-Google-Smtp-Source: AGHT+IHOj/tomowDEiB20GWpwm1Eafm2xs2aEyUzFu0xX3zTdDmt2EBoWVTLaYigoPnj18tyH/xwXQ==
X-Received: by 2002:a17:902:d548:b0:2a1:325d:821a with SMTP id d9443c01a7336-2a2f2a4f0c5mr13846805ad.60.1766122660716;
        Thu, 18 Dec 2025 21:37:40 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d895sm9930215ad.54.2025.12.18.21.37.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Dec 2025 21:37:40 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org
Subject: [PATCH 5/6] dma-mapping: Allow batched DMA sync operations if supported by the arch
Date: Fri, 19 Dec 2025 13:36:57 +0800
Message-Id: <20251219053658.84978-6-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20251219053658.84978-1-21cnbao@gmail.com>
References: <20251219053658.84978-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_213742_029547_A9240F29 
X-CRM114-Status: GOOD (  15.90  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, maz@kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, surenb@google.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <v-songbaohua@oppo.com>

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

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 kernel/dma/direct.c | 28 ++++++++++-----
 kernel/dma/direct.h | 86 +++++++++++++++++++++++++++++++++++++++------
 2 files changed, 95 insertions(+), 19 deletions(-)

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
index da2fadf45bcd..a211bab26478 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -64,15 +64,11 @@ static inline void dma_direct_sync_single_for_device(struct device *dev,
 		arch_sync_dma_for_device(paddr, size, dir);
 }
 
-static inline void dma_direct_sync_single_for_cpu(struct device *dev,
-		dma_addr_t addr, size_t size, enum dma_data_direction dir)
+static inline void __dma_direct_sync_single_for_cpu(struct device *dev,
+		phys_addr_t paddr, size_t size, enum dma_data_direction dir)
 {
-	phys_addr_t paddr = dma_to_phys(dev, addr);
-
-	if (!dev_is_dma_coherent(dev)) {
-		arch_sync_dma_for_cpu(paddr, size, dir);
+	if (!dev_is_dma_coherent(dev))
 		arch_sync_dma_for_cpu_all();
-	}
 
 	swiotlb_sync_single_for_cpu(dev, paddr, size, dir);
 
@@ -80,7 +76,31 @@ static inline void dma_direct_sync_single_for_cpu(struct device *dev,
 		arch_dma_mark_clean(paddr, size);
 }
 
-static inline dma_addr_t dma_direct_map_phys(struct device *dev,
+#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
+static inline void dma_direct_sync_single_for_cpu_batch_add(struct device *dev,
+		dma_addr_t addr, size_t size, enum dma_data_direction dir)
+{
+	phys_addr_t paddr = dma_to_phys(dev, addr);
+
+	if (!dev_is_dma_coherent(dev))
+		arch_sync_dma_for_cpu_batch_add(paddr, size, dir);
+
+	__dma_direct_sync_single_for_cpu(dev, paddr, size, dir);
+}
+#endif
+
+static inline void dma_direct_sync_single_for_cpu(struct device *dev,
+		dma_addr_t addr, size_t size, enum dma_data_direction dir)
+{
+	phys_addr_t paddr = dma_to_phys(dev, addr);
+
+	if (!dev_is_dma_coherent(dev))
+		arch_sync_dma_for_cpu(paddr, size, dir);
+
+	__dma_direct_sync_single_for_cpu(dev, paddr, size, dir);
+}
+
+static inline dma_addr_t __dma_direct_map_phys(struct device *dev,
 		phys_addr_t phys, size_t size, enum dma_data_direction dir,
 		unsigned long attrs)
 {
@@ -108,9 +128,6 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 		}
 	}
 
-	if (!dev_is_dma_coherent(dev) &&
-	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
-		arch_sync_dma_for_device(phys, size, dir);
 	return dma_addr;
 
 err_overflow:
@@ -121,6 +138,53 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 	return DMA_MAPPING_ERROR;
 }
 
+#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
+static inline dma_addr_t dma_direct_map_phys_batch_add(struct device *dev,
+		phys_addr_t phys, size_t size, enum dma_data_direction dir,
+		unsigned long attrs)
+{
+	dma_addr_t dma_addr = __dma_direct_map_phys(dev, phys, size, dir, attrs);
+
+	if (dma_addr != DMA_MAPPING_ERROR && !dev_is_dma_coherent(dev) &&
+	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
+		arch_sync_dma_for_device_batch_add(phys, size, dir);
+
+	return dma_addr;
+}
+#endif
+
+static inline dma_addr_t dma_direct_map_phys(struct device *dev,
+		phys_addr_t phys, size_t size, enum dma_data_direction dir,
+		unsigned long attrs)
+{
+	dma_addr_t dma_addr = __dma_direct_map_phys(dev, phys, size, dir, attrs);
+
+	if (dma_addr != DMA_MAPPING_ERROR && !dev_is_dma_coherent(dev) &&
+	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
+		arch_sync_dma_for_device(phys, size, dir);
+
+	return dma_addr;
+}
+
+#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
+static inline void dma_direct_unmap_phys_batch_add(struct device *dev, dma_addr_t addr,
+		size_t size, enum dma_data_direction dir, unsigned long attrs)
+{
+	phys_addr_t phys;
+
+	if (attrs & DMA_ATTR_MMIO)
+		/* nothing to do: uncached and no swiotlb */
+		return;
+
+	phys = dma_to_phys(dev, addr);
+	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+		dma_direct_sync_single_for_cpu_batch_add(dev, addr, size, dir);
+
+	swiotlb_tbl_unmap_single(dev, phys, size, dir,
+					 attrs | DMA_ATTR_SKIP_CPU_SYNC);
+}
+#endif
+
 static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
-- 
2.39.3 (Apple Git-146)


