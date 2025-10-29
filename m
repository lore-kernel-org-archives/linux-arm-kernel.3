Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC43CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 02:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JXLeKP/DtOqQuL8m7vYar3R6RP6+fCAYk9I78/ihr2U=; b=e29kWIofjmVVLt
	czmmJQ5FsFehQW7v7S9+nkScyf3opJqvozZKJsXcd/M1g3LKGqUE3HsP1Ex4MU9b6v1RHI68su1dk
	6JF7KGhkYe2Cy770pRsjPA/NwnElWSgg/apgCVXIpDenPn9KWSGGrNXMUHXJOw76qLfK3nHVi+sRg
	gW1BDpQ+dagzlbYJrOgoQ936WqWvav9Ax5W/FFPqOuIZJjCaeI7nj7Y06k+stD/GHdhei2tyz/2JR
	iygug/S6CmNVV0S5JFsadusToQwSTr3rFVrpIc7GUBVIDh0HFakwHONC8yiFfZgyylZTZtPLtt8F4
	gZaucuuC4KGVwdaP0JUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvzP-0000000GzCg-0kmx;
	Wed, 29 Oct 2025 02:32:43 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvzM-0000000GzAx-19z7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 02:32:42 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3401314d845so3324922a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 19:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761705159; x=1762309959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXLeKP/DtOqQuL8m7vYar3R6RP6+fCAYk9I78/ihr2U=;
        b=gIoivJ1E1eihIftUyQw4flAV02Ed2wEn3VN4Mz6kFHVXuDxK3r1u7eQSgVof8TNaxR
         A7e/m21mXkWmoeHAVCh/3q97HhixeyfkLTgEAOq9k9177W3dn69/kjsa9PiQgjstvslr
         FnV/xc1LJhfH3kYgHNbi/Nm11165gBPAXQsQ/t9RcKSmZz1IBS1L5apvMFu0k7gXjkDW
         L3mxg9JftZY3G1Rkw5Yujg5SLIqFfrKNPe1uCSmRWXP+kJWavsbQmh2WVxzZDZWUy1tR
         znX3KtQ1Ao5+JMK3vBGdgOJSFMp9uP/yt1+Cj1sXIiMG7J7Xa0FHs9DUinDRjU+2kMC3
         sojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761705159; x=1762309959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXLeKP/DtOqQuL8m7vYar3R6RP6+fCAYk9I78/ihr2U=;
        b=fj1sYBN5bfgfeQR7AlxYH6ua5J6VFolNGWkPKucH/j0u7ABeSJubvBoeijwyPzWwL8
         dfxz6Nc35iGR1Iuda4+FuLH1CsCfGK3hPeOoMtzaAf5INEY/x0vyB7hoo3wv0UqTtzrk
         lhFCsFzfge93FouzbBjl2dlyggleQ1dbVktpR7Nhrpw1xYJtaNXQrAOG3b5anZePufhV
         sBWoIGh7yYo0+wXjMBbUt7LEKSEZi6UOAS87v4YcdXs1uwOlbB8PVbiM6ICQyAcoGNgL
         hS/+Rm2vEaDYo49Jz23vjZMwrVRB1LF7RcAx8oe8iGu6s8j17dGRBpeFeckirCETeG+R
         eKFA==
X-Forwarded-Encrypted: i=1; AJvYcCXrwYxAxzkYi7xC0mrN/pYBwf7CnY3GraoVVvuCD8fRfd0w2BXIygWZPdlaZkVpJqAX681Mr+nyIFDbO6J2Qaf9@lists.infradead.org
X-Gm-Message-State: AOJu0YzGHKgi7eSt7eGCFiR4nrKx65EhW8w5ZlkHsXZcOlgBrh2akkTC
	GZEt0uFAJwlPjxA8og6grOycoiWCedm1nPrdufkPVLm7nmJfAgw7aUct
X-Gm-Gg: ASbGncudLP0ToN70IbHv+Xd7q9eeKUm4hWrDbp1egklqKGkGuMCrlgf7PMmrPJeHqys
	eDemWTmAuafAdPWaDnWvSRSXXZ3GmAMuAxGEqeCQIWcBSdvnjd0w0SP0aIN3/S2RFLOQhrGbT5p
	IzeqyCusf2IqDFDCeBSOYRsEIVt7X8lfVgIWiXkDTPogHqydf4XuHVNiFz+cQjc6wrtYA9lfeJv
	pC78XiZZ/tP/ISMZ+Pr1qysrDyEHWNVvCttjKGL9vfL7IRfkQm6p580ogJgybOVPUzm4TZDLWSV
	j9G/T0aZpiVksyWTPsZJTtg9SoI1imNhsH84IuOTEGML4MRT7ap7yBv4EM47JnHKn+YaBh2+gtL
	2V5dm7l5Rt7iwUq1r6URYoz27g+rrM45Jhg87k8lsMunkBFiey6UxGJomIXrIRjijVQvT67zFvh
	0kin6+AbtNDLwA/q+aIYYM4rHCjoIBli4RdCni0CS/5Pte0tIys6kzOWJoxw==
X-Google-Smtp-Source: AGHT+IFhBNLyIOct1mE9x8NjCrvkWR0gN9M9H3c4aZoq5oEbAmNrnFsNADSTOspd44npw8jvwAKgSg==
X-Received: by 2002:a17:90b:2549:b0:33f:ee05:56e1 with SMTP id 98e67ed59e1d1-3403a143527mr1244236a91.2.1761705159331;
        Tue, 28 Oct 2025 19:32:39 -0700 (PDT)
Received: from localhost.localdomain ([47.72.128.212])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed81a4afsm13649518a91.19.2025.10.28.19.32.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Oct 2025 19:32:38 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [RFC PATCH 5/5] dma-mapping: Allow batched DMA sync operations if supported by the arch
Date: Wed, 29 Oct 2025 10:31:15 +0800
Message-Id: <20251029023115.22809-6-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20251029023115.22809-1-21cnbao@gmail.com>
References: <20251029023115.22809-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_193240_334614_FFAA43D8 
X-CRM114-Status: GOOD (  18.09  )
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
Cc: Ryan Roberts <ryan.roberts@arm.com>, iommu@lists.linux.dev, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, Tangquan Zheng <zhengtangquan@oppo.com>, linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
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
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: iommu@lists.linux.dev
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 kernel/dma/direct.c | 53 +++++++++++++++++++++++++---
 kernel/dma/direct.h | 86 +++++++++++++++++++++++++++++++++++++++------
 2 files changed, 123 insertions(+), 16 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 1f9ee9759426..a0b45f84a91f 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -403,9 +403,16 @@ void dma_direct_sync_sg_for_device(struct device *dev,
 		swiotlb_sync_single_for_device(dev, paddr, sg->length, dir);
 
 		if (!dev_is_dma_coherent(dev))
-			arch_sync_dma_for_device(paddr, sg->length,
-					dir);
+#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
+			arch_sync_dma_for_device_batch_add(paddr, sg->length, dir);
+#else
+			arch_sync_dma_for_device(paddr, sg->length, dir);
+#endif
 	}
+#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
+	if (!dev_is_dma_coherent(dev))
+		arch_sync_dma_batch_flush();
+#endif
 }
 #endif
 
@@ -422,7 +429,11 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 		phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
 
 		if (!dev_is_dma_coherent(dev))
+#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
+			arch_sync_dma_for_cpu_batch_add(paddr, sg->length, dir);
+#else
 			arch_sync_dma_for_cpu(paddr, sg->length, dir);
+#endif
 
 		swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);
 
@@ -430,8 +441,12 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 			arch_dma_mark_clean(paddr, sg->length);
 	}
 
-	if (!dev_is_dma_coherent(dev))
+	if (!dev_is_dma_coherent(dev)) {
 		arch_sync_dma_for_cpu_all();
+#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
+		arch_sync_dma_batch_flush();
+#endif
+	}
 }
 
 /*
@@ -443,14 +458,29 @@ void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
 {
 	struct scatterlist *sg;
 	int i;
+#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
+	bool need_sync = false;
+#endif
 
 	for_each_sg(sgl,  sg, nents, i) {
-		if (sg_dma_is_bus_address(sg))
+		if (sg_dma_is_bus_address(sg)) {
 			sg_dma_unmark_bus_address(sg);
-		else
+		} else {
+#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
+			need_sync = true;
+			dma_direct_unmap_phys_batch_add(dev, sg->dma_address,
+					      sg_dma_len(sg), dir, attrs);
+
+#else
 			dma_direct_unmap_phys(dev, sg->dma_address,
 					      sg_dma_len(sg), dir, attrs);
+#endif
+		}
 	}
+#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
+	if (need_sync && !dev_is_dma_coherent(dev))
+		arch_sync_dma_batch_flush();
+#endif
 }
 #endif
 
@@ -460,6 +490,9 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 	struct pci_p2pdma_map_state p2pdma_state = {};
 	struct scatterlist *sg;
 	int i, ret;
+#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
+	bool need_sync = false;
+#endif
 
 	for_each_sg(sgl, sg, nents, i) {
 		switch (pci_p2pdma_state(&p2pdma_state, dev, sg_page(sg))) {
@@ -471,8 +504,14 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 			 */
 			break;
 		case PCI_P2PDMA_MAP_NONE:
+#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
+			need_sync = true;
+			sg->dma_address = dma_direct_map_phys_batch_add(dev, sg_phys(sg),
+					sg->length, dir, attrs);
+#else
 			sg->dma_address = dma_direct_map_phys(dev, sg_phys(sg),
 					sg->length, dir, attrs);
+#endif
 			if (sg->dma_address == DMA_MAPPING_ERROR) {
 				ret = -EIO;
 				goto out_unmap;
@@ -490,6 +529,10 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 		sg_dma_len(sg) = sg->length;
 	}
 
+#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
+	if (need_sync && !dev_is_dma_coherent(dev))
+		arch_sync_dma_batch_flush();
+#endif
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


