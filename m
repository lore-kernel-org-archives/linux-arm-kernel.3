Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C324E8FDBA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 22:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pcGdIc/9DJZ3V/5WVf7vUUbl5wTlCyMzFQWvUiTQ7kw=; b=uc9RDmnacNsDy3
	pN9Cly4fZu2s/mEvoezfdo8oVZRrShLIujJgLc4O+D0RouEZYf97fd1PNCjpPfioLBwr0MwGxr6Ib
	nQEDX6ZKwYnqTnERMb4wxggVXdqxWUgmtCZSXO+OTWvI5uwdgS/mCIhI0KsN3X2eC3kaMJcY5Oovl
	bAR2HSxihusR0TQOoI/YZBf3kNFmbNNV1bfXQXnYvCEZZEVqC1lUcDzTBRqRzse8VUt5doNcXGHY2
	Udrw2ZAQ6CKG4Ps+zXLUcEX6D7mMwUYpgbsXwpkJtIuO8kRQlGajVx++62eUHEJ8CB5BFxxRUkXLw
	2TyYnFYcLBr/hZN/w64w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZGhE-00000001XIq-25LA;
	Fri, 26 Dec 2025 22:54:08 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZGhB-00000001XGT-2Xfk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 22:54:07 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-34c24f4dfb7so5727366a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 14:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766789645; x=1767394445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcGdIc/9DJZ3V/5WVf7vUUbl5wTlCyMzFQWvUiTQ7kw=;
        b=LqRvbGiDuZFaBEnm9fEbB0HejdAjgqDWwd5Y8Pj/F+YRlk9PWR2aUxNTp0hqO4L9T6
         LRlicRa/qOduGahk49GXSmSM35ADHetsX9yGLt+1q97JzdXIaCYawkgdjJ8PN5Ecacs8
         wdFzinuBfmpx8EiTyUUkFlm/CX578trmtTGUWiy+8AdfBiV0L+QcoIOxgjLtbe+CU84m
         OkUbM1ddZIHV15cxp+MUUGouPC7tkVUvYxdMKB8wyUpQa76zhis3DR/yRLPwoo01ip8I
         acMTDitO/WJiDiE2loFekX0dt/TGZLozGJ3L2ya7GsDjteJovVcKo/PjNONWKUz1TXvi
         DBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766789645; x=1767394445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pcGdIc/9DJZ3V/5WVf7vUUbl5wTlCyMzFQWvUiTQ7kw=;
        b=eJgKfO+KXnX6sh1h/U3jXzGRpX/UyTk1Qt+GSaaYSMz5siYHEA/TXv1ipkpR5Q/r6f
         Pn0rY9Rty+aeWk3VE/CA7pHTVplWgnfri2NmuSgsYZSF/QMG9OVhLvxON5xUSoUo4IE3
         pZaEBD7eHYpqEEiHWZO9g7o8Fqcsd+7bjcp+caeezOFp3Xy6OoR0AV3qGymxDpokMS6B
         G8AhLkorLAreUTMWvkUFATTFbILQ+Jao86vVN9Y66OF7a6ifF4kc8Au27/9UNDy9Xu7j
         jBw7jSRosPG4ngSPf7NYmVi3p/gU5OyQwnPdSy/QuPeUhxFU6S+5UDHVc/+i+y6sEvQD
         5NJA==
X-Forwarded-Encrypted: i=1; AJvYcCViQWkew7ha7ZgY0eUrS3GGKiyjr5WyOWhpQJsnfMLKbCDynmM+Mv9ZyjsjCzjttSZOB+XxD+yy+1H6EYcKWnlf@lists.infradead.org
X-Gm-Message-State: AOJu0YxnhrncrgSr3KjWKX9SGSvKB+jTs+47FkDdGPOKsuldNksp5aT5
	71/QEu9hpBAwol2UHTzeqhrVy58Rn5wH+NXCRjK22b2WOrdEfd/I1wG8
X-Gm-Gg: AY/fxX5PYqicWlyTfk1Q/Qzz1YFhRaRJAd2G4/MPfkdR1mikS2i00Vexzm+Faj+nbWt
	1DxuY9aUOSsHU5AB4I4xl6qhQCyDOllu9YlHyk20+tI7PFdI2sLyKlGfvKxG+A0cyU1LijCCKTp
	uuht/7/BIgJti2mv4VPoSsJN6swGluWlnQGp/z/M66cCGUg++HKrTEny4ivOierFwvQC4Syq0Di
	iNiqCEh2a0gf/eXUaa+VAc6h638zyOc2DfKm35/BeEIhBuSz6WTbgB/uT+zl56EcnSWLJ0nxChw
	21Gl1N1DmvGp7++Em4YzmD4paOODG3xFeQ2zoHngAU7M+Rzu+GCSyJ/ILNEHvk4RfTwlDocZ394
	moLg6ym9By9ihXzznz5BvjyZD039aT8Mj+n96ySAC84FjPTglVhOcf0SVxJWfcSe197UqOs/Vp4
	MvyxFshpI4sL17
X-Google-Smtp-Source: AGHT+IE+oJ1Ft1XOQ1XU6OeA4rerw4thrh1Pz4yYg+rxMS7HW6pD48/QipbV6W5OVknyxXIG+nvg1w==
X-Received: by 2002:a17:90b:5804:b0:34a:b459:bd10 with SMTP id 98e67ed59e1d1-34e921bf172mr21139744a91.24.1766789644533;
        Fri, 26 Dec 2025 14:54:04 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e772ac1acsm9981428a91.9.2025.12.26.14.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 14:54:03 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 6/8] dma-mapping: Support batch mode for dma_direct_{map,unmap}_sg
Date: Sat, 27 Dec 2025 11:52:46 +1300
Message-ID: <20251226225254.46197-7-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251226225254.46197-1-21cnbao@gmail.com>
References: <20251226225254.46197-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_145405_667241_21F8DEA9 
X-CRM114-Status: GOOD (  14.92  )
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
Cc: Barry Song <baohua@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Tangquan Zheng <zhengtangquan@oppo.com>, xen-devel@lists.xenproject.org, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <baohua@kernel.org>

Leon suggested extending a flush argument to
dma_direct_unmap_phys(), dma_direct_map_phys(), and
dma_direct_sync_single_for_cpu(). For single-buffer cases, this
would use flush=true, while for SG cases flush=false would be
used, followed by a single flush after all cache operations are
issued in dma_direct_{map,unmap}_sg().

This ultimately benefits dma_map_sg() and dma_unmap_sg().

Cc: Leon Romanovsky <leon@kernel.org>
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
Signed-off-by: Barry Song <baohua@kernel.org>
---
 kernel/dma/direct.c  | 17 +++++++++++++----
 kernel/dma/direct.h  | 16 ++++++++++------
 kernel/dma/mapping.c |  6 +++---
 3 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 98bacf562ca1..550a1a13148d 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -447,14 +447,19 @@ void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
 {
 	struct scatterlist *sg;
 	int i;
+	bool need_sync = false;
 
 	for_each_sg(sgl,  sg, nents, i) {
-		if (sg_dma_is_bus_address(sg))
+		if (sg_dma_is_bus_address(sg)) {
 			sg_dma_unmark_bus_address(sg);
-		else
+		} else {
+			need_sync = true;
 			dma_direct_unmap_phys(dev, sg->dma_address,
-					      sg_dma_len(sg), dir, attrs);
+					      sg_dma_len(sg), dir, attrs, false);
+		}
 	}
+	if (need_sync && !dev_is_dma_coherent(dev))
+		arch_sync_dma_flush();
 }
 #endif
 
@@ -464,6 +469,7 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 	struct pci_p2pdma_map_state p2pdma_state = {};
 	struct scatterlist *sg;
 	int i, ret;
+	bool need_sync = false;
 
 	for_each_sg(sgl, sg, nents, i) {
 		switch (pci_p2pdma_state(&p2pdma_state, dev, sg_page(sg))) {
@@ -475,8 +481,9 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 			 */
 			break;
 		case PCI_P2PDMA_MAP_NONE:
+			need_sync = true;
 			sg->dma_address = dma_direct_map_phys(dev, sg_phys(sg),
-					sg->length, dir, attrs);
+					sg->length, dir, attrs, false);
 			if (sg->dma_address == DMA_MAPPING_ERROR) {
 				ret = -EIO;
 				goto out_unmap;
@@ -495,6 +502,8 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 		sg_dma_len(sg) = sg->length;
 	}
 
+	if (need_sync && !dev_is_dma_coherent(dev))
+		arch_sync_dma_flush();
 	return nents;
 
 out_unmap:
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index a69326eed266..d4ad79828090 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -67,13 +67,15 @@ static inline void dma_direct_sync_single_for_device(struct device *dev,
 }
 
 static inline void dma_direct_sync_single_for_cpu(struct device *dev,
-		dma_addr_t addr, size_t size, enum dma_data_direction dir)
+		dma_addr_t addr, size_t size, enum dma_data_direction dir,
+		bool flush)
 {
 	phys_addr_t paddr = dma_to_phys(dev, addr);
 
 	if (!dev_is_dma_coherent(dev)) {
 		arch_sync_dma_for_cpu(paddr, size, dir);
-		arch_sync_dma_flush();
+		if (flush)
+			arch_sync_dma_flush();
 		arch_sync_dma_for_cpu_all();
 	}
 
@@ -85,7 +87,7 @@ static inline void dma_direct_sync_single_for_cpu(struct device *dev,
 
 static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 		phys_addr_t phys, size_t size, enum dma_data_direction dir,
-		unsigned long attrs)
+		unsigned long attrs, bool flush)
 {
 	dma_addr_t dma_addr;
 
@@ -114,7 +116,8 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 	if (!dev_is_dma_coherent(dev) &&
 	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
 		arch_sync_dma_for_device(phys, size, dir);
-		arch_sync_dma_flush();
+		if (flush)
+			arch_sync_dma_flush();
 	}
 	return dma_addr;
 
@@ -127,7 +130,8 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 }
 
 static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
-		size_t size, enum dma_data_direction dir, unsigned long attrs)
+		size_t size, enum dma_data_direction dir, unsigned long attrs,
+		bool flush)
 {
 	phys_addr_t phys;
 
@@ -137,7 +141,7 @@ static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
 
 	phys = dma_to_phys(dev, addr);
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
+		dma_direct_sync_single_for_cpu(dev, addr, size, dir, flush);
 
 	swiotlb_tbl_unmap_single(dev, phys, size, dir,
 					 attrs | DMA_ATTR_SKIP_CPU_SYNC);
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 37163eb49f9f..d8cfa56a3cbb 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -166,7 +166,7 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 
 	if (dma_map_direct(dev, ops) ||
 	    (!is_mmio && arch_dma_map_phys_direct(dev, phys + size)))
-		addr = dma_direct_map_phys(dev, phys, size, dir, attrs);
+		addr = dma_direct_map_phys(dev, phys, size, dir, attrs, true);
 	else if (use_dma_iommu(dev))
 		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
 	else if (ops->map_phys)
@@ -207,7 +207,7 @@ void dma_unmap_phys(struct device *dev, dma_addr_t addr, size_t size,
 	BUG_ON(!valid_dma_direction(dir));
 	if (dma_map_direct(dev, ops) ||
 	    (!is_mmio && arch_dma_unmap_phys_direct(dev, addr + size)))
-		dma_direct_unmap_phys(dev, addr, size, dir, attrs);
+		dma_direct_unmap_phys(dev, addr, size, dir, attrs, true);
 	else if (use_dma_iommu(dev))
 		iommu_dma_unmap_phys(dev, addr, size, dir, attrs);
 	else if (ops->unmap_phys)
@@ -373,7 +373,7 @@ void __dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr, size_t size,
 
 	BUG_ON(!valid_dma_direction(dir));
 	if (dma_map_direct(dev, ops))
-		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
+		dma_direct_sync_single_for_cpu(dev, addr, size, dir, true);
 	else if (use_dma_iommu(dev))
 		iommu_dma_sync_single_for_cpu(dev, addr, size, dir);
 	else if (ops->sync_single_for_cpu)
-- 
2.43.0


