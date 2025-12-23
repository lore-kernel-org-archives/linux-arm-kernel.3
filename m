Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA403E6B26E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 02:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EG2jom2nVm52M06JE+2UxZAwiHUkEaZ0dG9TF5/bVcM=; b=FAtOctiLoZ5xUA
	IOHlml0E8XOzVXZd89NQL1AAfFYZmNNxz15IuQn+eQ8RqFFN8sCHHzs35OgTrS3Zmpp3ANiEvveiW
	w2VwRQaE7HxOIlkJUwgPy/NDhAXDcvpC+Bjc0ENSwlzVUNv8jh7xw9rxMaL4hElAp3OC/VrD7ldLK
	e83WqKw6zMEiEdYX+njtvfTgbVZ90H5bn8+MsGwOjiwpGGme1+xTEbpq8rGLN+FOHhFUHPwUFtKH4
	+wSpcTqAosCbDkRgMvxY9yRXGSYC1NGEq7Rik+Mq1dsfqx4gfzx2uMH4DXLBrT+tzQM2/zvV6V/vh
	MLa4fKkQmvYg9MJZesHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXsGl-0000000ERIy-1mzE;
	Tue, 23 Dec 2025 02:37:03 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXsGi-0000000ERId-1ejY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 02:37:01 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7f651586be1so2096724b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 18:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766457419; x=1767062219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EG2jom2nVm52M06JE+2UxZAwiHUkEaZ0dG9TF5/bVcM=;
        b=Mj+xDq/nB4lNxn7qGPNFd2kmEHV31Q+oubg/sTDvHTaXNFlj66Gk+PquzyGGi+yDiC
         QMdI5JiCcDFRgO6hx3lCZTCgH/BA5d0Bu5v5S2BCFZ0R1KYBzDV+ueqK8KVPZtRBrXCc
         1cJkl4NZCho9jIpYQBD69o7eJfkI+T1RYC/rcionqPcZ9MFYgmSvUsr1OilDcc/bsd0a
         r2ZOSbeh+Q8wfy8pLS7fdoFqOEAr1o20ienBPrIb773a6XuFXKImjo/UoDse+qOPF4p5
         vFNJLn1K0bENh4DxsvGGNUlLQBhnW0dbaNvhJsun5GcVcPOMOmpxdWnz45w3Vw6aw1gf
         0Qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766457419; x=1767062219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EG2jom2nVm52M06JE+2UxZAwiHUkEaZ0dG9TF5/bVcM=;
        b=syvh1AUA/RiTaxhSIHOsWrD41nbBvvjCcXrvpmG2hYVb14jGNCgPK8dwHRGlV8ECjw
         rPuK89o25Gbp2aJSp0/ZLRK9R5I98z3pI6TFhjSW69JHftOfSwpwWvUq7Awdd2X/Tdff
         +3qvaC0y5hCdQh35nhl6hN6Q11tHrGE0oK8KGwYFKYOh2hbEkTyVMV9CwByQQhEi0jlm
         e1tuaC8QtUUFS5/DCEN8iq3o2hWByJmgAPH+MLomK6WMRVZ9GHtIbt5eSKpiBl7wZDF7
         l4ITFxLo6nHp8AliZcclqqVbvI9/CyOP1/knTLzrQCZIcmq5I4jEGm9jYxCKMGtZYiaz
         rsyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5tvZuJo9/oOKfyHRMKmgvKd0u5fRatKGiFbbkhqyPUeIN4zeWqWE9/K2Ip0cRUGblGsYc0oh3OBhJvVh8XWzE@lists.infradead.org
X-Gm-Message-State: AOJu0YzOjE9Yb8POPlViMFUNx9LrvzIjqOcq7rU772kdrlBrkKqFYqcn
	PrR/Zs0r+kidLgIj9NceVesdPpjL0FoDEX3KFz563wkodnn0+0+Nd1Un
X-Gm-Gg: AY/fxX4WsLga0ei2nlvdxqagNqCtijnlLaXO5vfTtxPaDHzqamqV+8l07EPNYdQ5D2+
	rA0X7AxZOQZE54k+k+0Fb5YgxHbYhaXTvluK7k1Shn4k/Hq7GvOpnxQSzqZ39c4mXfQhm1GvP2Q
	Xmbk58TzRxw1nzkh+oJ0nS+7dCGDeMBTRt1tk9vTOC9BT4OLoMH5QS3HjX4+dyWaEQ8U2gm03lW
	mIG3MAVE4/cL8W3h/Pne8A++IWeoIZa2IMyS8lk+y3YkmzL0vIj4nI6syDa7c9B+qVyqdc6tfu9
	1G21T+73YmYPJ4lfQeogU4GagTErV706Gt78HGhcif9LtUguQBmrYDWwsG9kJAF8CtQqW4DiN3r
	hFg3Vs/7Dc+7TZAhJtVhDWjR0kXt9VoJCDVglvHI0kweoKnSYurhZRacyMvmepSdtlYrgdI13RS
	xw0t0+GYEtqkAEoQ2ATfLUmgEpwymifp+HZg==
X-Google-Smtp-Source: AGHT+IFpESelvsIvZ84qKN4f5qc9YV+VJzYgyjxTanTUZRfS+9fGdKninQTCQhz9sc2PNowSjWFdng==
X-Received: by 2002:aa7:9384:0:b0:7a9:acdf:e8f8 with SMTP id d2e1a72fcca58-7fe0b73a260mr10159988b3a.4.1766457419077;
        Mon, 22 Dec 2025 18:36:59 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b4234e2sm11791930b3a.27.2025.12.22.18.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 18:36:58 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: 21cnbao@gmail.com,
	leon@kernel.org
Subject: Re: [PATCH 5/6] dma-mapping: Allow batched DMA sync operations if supported by the arch
Date: Tue, 23 Dec 2025 15:36:46 +1300
Message-ID: <20251223023648.31614-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CAGsJ_4yuvHNqHDi8eN-8UoY2McoXUeCMmbjFAr=jSdv8GpGKeg@mail.gmail.com>
References: <CAGsJ_4yuvHNqHDi8eN-8UoY2McoXUeCMmbjFAr=jSdv8GpGKeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_183700_450941_24AB20D5 
X-CRM114-Status: GOOD (  21.46  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, will@kernel.org, anshuman.khandual@arm.com, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, surenb@google.com, iommu@lists.linux.dev, maz@kernel.org, robin.murphy@arm.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

>
> >
> > I would also rename arch_sync_dma_batch_flush() to arch_sync_dma_flush().
>
> Sure.
>
> >
> > You can also minimize changes in dma_direct_map_phys() too, by extending
> > it's signature to provide if flush is needed or not.
>
> Yes. I have
>
> static inline dma_addr_t __dma_direct_map_phys(struct device *dev,
>                 phys_addr_t phys, size_t size, enum dma_data_direction dir,
>                 unsigned long attrs, bool flush)
>
> and two wrappers:
> static inline dma_addr_t dma_direct_map_phys(struct device *dev,
>                 phys_addr_t phys, size_t size, enum dma_data_direction dir,
>                 unsigned long attrs)
> {
>         return __dma_direct_map_phys(dev, phys, size, dir, attrs, true);
> }
>
> static inline dma_addr_t dma_direct_map_phys_batch_add(struct device *dev,
>                 phys_addr_t phys, size_t size, enum dma_data_direction dir,
>                 unsigned long attrs)
> {
>         return __dma_direct_map_phys(dev, phys, size, dir, attrs, false);
> }
>
> If you prefer exposing "flush" directly in dma_direct_map_phys()
> and updating its callers with flush=true, I think that’s fine.
>
> It could be also true for dma_direct_sync_single_for_device().

sorry for typo. I meant dma_direct_sync_single_for_cpu().
With flush passed as an argument, the patch becomes the following.
Please feel free to comment before I send v2.


diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 50c3fe2a1d55..5c65d213eb37 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -403,9 +403,11 @@ void dma_direct_sync_sg_for_device(struct device *dev,
 		swiotlb_sync_single_for_device(dev, paddr, sg->length, dir);
 
 		if (!dev_is_dma_coherent(dev))
-			arch_sync_dma_for_device(paddr, sg->length,
+			arch_sync_dma_for_device_batch_add(paddr, sg->length,
 					dir);
 	}
+	if (!dev_is_dma_coherent(dev))
+		arch_sync_dma_flush();
 }
 #endif
 
@@ -422,7 +424,7 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 		phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
 
 		if (!dev_is_dma_coherent(dev))
-			arch_sync_dma_for_cpu(paddr, sg->length, dir);
+			arch_sync_dma_for_cpu_batch_add(paddr, sg->length, dir);
 
 		swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);
 
@@ -430,8 +432,10 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 			arch_dma_mark_clean(paddr, sg->length);
 	}
 
-	if (!dev_is_dma_coherent(dev))
+	if (!dev_is_dma_coherent(dev)) {
 		arch_sync_dma_for_cpu_all();
+		arch_sync_dma_flush();
+	}
 }
 
 /*
@@ -443,14 +447,19 @@ void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
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
 
@@ -460,6 +469,7 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 	struct pci_p2pdma_map_state p2pdma_state = {};
 	struct scatterlist *sg;
 	int i, ret;
+	bool need_sync = false;
 
 	for_each_sg(sgl, sg, nents, i) {
 		switch (pci_p2pdma_state(&p2pdma_state, dev, sg_page(sg))) {
@@ -471,8 +481,9 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
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
@@ -491,6 +502,8 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 		sg_dma_len(sg) = sg->length;
 	}
 
+	if (need_sync && !dev_is_dma_coherent(dev))
+		arch_sync_dma_flush();
 	return nents;
 
 out_unmap:
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index da2fadf45bcd..b13eb5bfd051 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -65,12 +65,15 @@ static inline void dma_direct_sync_single_for_device(struct device *dev,
 }
 
 static inline void dma_direct_sync_single_for_cpu(struct device *dev,
-		dma_addr_t addr, size_t size, enum dma_data_direction dir)
+		dma_addr_t addr, size_t size, enum dma_data_direction dir,
+		bool flush)
 {
 	phys_addr_t paddr = dma_to_phys(dev, addr);
 
 	if (!dev_is_dma_coherent(dev)) {
-		arch_sync_dma_for_cpu(paddr, size, dir);
+		arch_sync_dma_for_cpu_batch_add(paddr, size, dir);
+		if (flush)
+			arch_sync_dma_flush();
 		arch_sync_dma_for_cpu_all();
 	}
 
@@ -82,7 +85,7 @@ static inline void dma_direct_sync_single_for_cpu(struct device *dev,
 
 static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 		phys_addr_t phys, size_t size, enum dma_data_direction dir,
-		unsigned long attrs)
+		unsigned long attrs, bool flush)
 {
 	dma_addr_t dma_addr;
 
@@ -109,8 +112,11 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 	}
 
 	if (!dev_is_dma_coherent(dev) &&
-	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
-		arch_sync_dma_for_device(phys, size, dir);
+	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
+		arch_sync_dma_for_device_batch_add(phys, size, dir);
+		if (flush)
+			arch_sync_dma_flush();
+	}
 	return dma_addr;
 
 err_overflow:
@@ -122,7 +128,8 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 }
 
 static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
-		size_t size, enum dma_data_direction dir, unsigned long attrs)
+		size_t size, enum dma_data_direction dir, unsigned long attrs,
+		bool flush)
 {
 	phys_addr_t phys;
 
@@ -132,9 +139,10 @@ static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
 
 	phys = dma_to_phys(dev, addr);
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
+		dma_direct_sync_single_for_cpu(dev, addr, size, dir, flush);
 
 	swiotlb_tbl_unmap_single(dev, phys, size, dir,
 					 attrs | DMA_ATTR_SKIP_CPU_SYNC);
 }
+
 #endif /* _KERNEL_DMA_DIRECT_H */
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

