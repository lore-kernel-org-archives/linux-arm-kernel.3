Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45EBFD0046
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 22:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DOMW7lLqJkPCgTyPACAEGaBRlsYC7CH2Bm6ysbwwZRI=; b=3SkoH15Xa4yVC9
	aKeVdnI1vsSeq3l7pvTaiJuHbqvzEp2uKSg9SZ7Q/aAeyDjl6fHMFzsueTEDFoziFqoAKf/A+ycI9
	CqNDd4xdwB7/2CWATOSvB5x3uTLeHYgcYGJp9Z8MSVn7LEJaPPmZR4xU+cnZxXO3SBA6De6zM7oDd
	UmO3G3gQVdpgUzLVTbFOXE0NhjgPm06l6qnNU6+Cw3WVZ9sZO4K2fpoiJfsw9EzB0UYTVe0B65ljw
	29keOhqVG/jUuANTVbeH2WCpWK06WR7ps7eIObq5VVU401/0d73AvITF8VG4ss0iiFSnP15XK0+DE
	K7fpgPdHNPOe7l+naX2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwSZN-0000000AK8j-0sgN;
	Sat, 28 Feb 2026 22:13:53 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwSZK-0000000AK7R-3jyF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 22:13:52 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-35928defcd0so1906464a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 14:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772316830; x=1772921630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DOMW7lLqJkPCgTyPACAEGaBRlsYC7CH2Bm6ysbwwZRI=;
        b=VI01gAxueTmQaMf/t7RRxl4LEOS7nnTJNkJczWsFyXeNbHcRm/KM9p/GxOkR3S2rEE
         6IN21thdFDF1NhlXb8uTo6A8v5Z6/EVqjwC2GRMWvA23LfB2Y5VegADrI5FVoDTuXLKf
         xpJajrbxeCrcXy9bnZ6jQimuDFGetXhVgjXAw3CtTzKR83+lC6L8wCBOS4nmvK/7gf2b
         wwxbbz0hshYrWN8K8VEPlU6W6xGwd/4IUbIDihEQ9zIAwIefpkart6Ny4OrtmnSM+9KU
         FeuybkXkQP0NaApf9zm878n89SUYwa3F8/jLPkpS1FeaXwpxHSQH9iMqZud+sAuhSxGy
         z9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772316830; x=1772921630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOMW7lLqJkPCgTyPACAEGaBRlsYC7CH2Bm6ysbwwZRI=;
        b=hvDUpBNrEvdzXD28evUvEaT9Wg4Khhc90+BtB/Nb3wrgc90HC+hWOvx2zIYSIxE9A9
         4vLVbc/h/wbzX2ORM7L1JuOKYB/E4yk939SJ07BntZTY0K1kX2kC08nmUHKtXFqE/a03
         gWHAEcEYNHwqzv0G/1GtPMlycPOMokCYfiqwqfTQcho4OUDNpUIlIqF7zuVExrv6YYac
         s4Q6XxSB97pou8CXj4p+QT/luCFLbVtLira/e4HxXZCGNxOsX9J+WcyUh7Epc72xJzR6
         klkNEviGmuVFS3lQFsHT6LBhVMtY+oamf5/7W1uePkcELvI7O7WF2eUh3UWZ7AQxbQlX
         QleQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp4Ey8nOKgXafAV0eW9tFyVsbp7R/gbaQBEfv5Hk9NZ41lzG6dLWuDT8WP8yZBl79FGOtGOjaGGGZa6NsH6ui8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5vEw/DeeeyHXoITLJdiGPsluaiBaqoBzAN6odPnaZF5SNdjIq
	FX05QsUXKnWLUiZS2Bow1MjHW4nrqaJ3Uxv6Hx2rQavWtAGp1C8LARZZ
X-Gm-Gg: ATEYQzzZBbk0OznuXUNJF7yzQrM1JEtigkMFr48XfI6DZhdL3TI/uehaVEz1WlgyIJx
	FuA9wWREgBTy9+X98eXl2sqmIrdru6lFAmKgbfHiM4rze1ThTdZWyEM00VczbX44muwUpCzNiQK
	2DCntzQC5Y42soUbrn/ztUqg1q3c+QlP9SKWCcunz951dBkggiMDUHFTZXTFcuIoXOY5wI3Y0LA
	prjNMM+PIlM6vDt7ng24U32sOc8mX3bJDUbQcslaF50oWZ090CksabPy5UryLRfQjVGohCtQwgh
	EmNZzdshhk+bSjPscI74SS3e2B3bvJdGDWpU6cTBZC0M5Sg0qUwO78Wvlce5d/DhWz5MLVWL9Kf
	jkiO5SfshwSONf+UfL92SUReadDv4gYTorUd80OzoLkpNpU1LvnK3Mbk8Sec97PITBb1ZWGmE35
	frvzIGLvtlD6ODcOdkwpg3R3qHvglFCMrZIv2z1u29eKXmnMs=
X-Received: by 2002:a17:90b:1ccc:b0:340:b912:536 with SMTP id 98e67ed59e1d1-35965cec355mr6169958a91.31.1772316829957;
        Sat, 28 Feb 2026 14:13:49 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912f87d0csm8275940a91.1.2026.02.28.14.13.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Feb 2026 14:13:49 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 5/5] dma-mapping: Support batch mode for dma_direct_{map,unmap}_sg
Date: Sun,  1 Mar 2026 06:13:37 +0800
Message-Id: <20260228221337.59951-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_141350_938860_997C24CA 
X-CRM114-Status: GOOD (  14.72  )
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
Cc: Barry Song <baohua@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Tangquan Zheng <zhengtangquan@oppo.com>, Xueyuan Chen <xueyuan.chen21@gmail.com>, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <baohua@kernel.org>

Extending these APIs with a flush argument:
dma_direct_unmap_phys(), dma_direct_map_phys(), and
dma_direct_sync_single_for_cpu(). For single-buffer cases, flush=true
would be used, while for SG cases flush=false would be used, followed
by a single flush after all cache operations are issued in
dma_direct_{map,unmap}_sg().

This ultimately benefits dma_map_sg() and dma_unmap_sg().

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
Reviewed-by: Leon Romanovsky <leon@kernel.org>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Signed-off-by: Barry Song <baohua@kernel.org>
---
 kernel/dma/direct.c  | 17 +++++++++++++----
 kernel/dma/direct.h  | 16 ++++++++++------
 kernel/dma/mapping.c |  6 +++---
 3 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index c7666e5d5e7c..ec887f443741 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -444,14 +444,19 @@ void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
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
 
@@ -461,6 +466,7 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 	struct pci_p2pdma_map_state p2pdma_state = {};
 	struct scatterlist *sg;
 	int i, ret;
+	bool need_sync = false;
 
 	for_each_sg(sgl, sg, nents, i) {
 		switch (pci_p2pdma_state(&p2pdma_state, dev, sg_page(sg))) {
@@ -472,8 +478,9 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
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
@@ -492,6 +499,8 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 		sg_dma_len(sg) = sg->length;
 	}
 
+	if (need_sync && !dev_is_dma_coherent(dev))
+		arch_sync_dma_flush();
 	return nents;
 
 out_unmap:
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index cbdbf9ddc8cc..ac8ff3feff51 100644
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
 
@@ -82,7 +84,7 @@ static inline void dma_direct_sync_single_for_cpu(struct device *dev,
 
 static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 		phys_addr_t phys, size_t size, enum dma_data_direction dir,
-		unsigned long attrs)
+		unsigned long attrs, bool flush)
 {
 	dma_addr_t dma_addr;
 
@@ -111,7 +113,8 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 	if (!dev_is_dma_coherent(dev) &&
 	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
 		arch_sync_dma_for_device(phys, size, dir);
-		arch_sync_dma_flush();
+		if (flush)
+			arch_sync_dma_flush();
 	}
 	return dma_addr;
 
@@ -124,7 +127,8 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 }
 
 static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
-		size_t size, enum dma_data_direction dir, unsigned long attrs)
+		size_t size, enum dma_data_direction dir, unsigned long attrs,
+		bool flush)
 {
 	phys_addr_t phys;
 
@@ -134,7 +138,7 @@ static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
 
 	phys = dma_to_phys(dev, addr);
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
+		dma_direct_sync_single_for_cpu(dev, addr, size, dir, flush);
 
 	swiotlb_tbl_unmap_single(dev, phys, size, dir,
 					 attrs | DMA_ATTR_SKIP_CPU_SYNC);
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 3928a509c44c..78d8b4039c3e 100644
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
2.39.3 (Apple Git-146)


