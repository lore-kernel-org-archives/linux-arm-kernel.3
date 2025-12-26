Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4481AE8FDB8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 22:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9mp0y7L70LQWZn3MNrpl8AtI1agZhiyYjI11ja2HdtI=; b=GmBtxbfWpnFH73
	Uk6uUMcdbUE4Y8lrQLLPx19Kp5iKrR+SqJgr/dVtYXdTlcRHmTuWaL/rn6happDfupGpaciIr3JvO
	/z7R/HsWWWMBPJK43ghRx312F3bzZ0Ydt0n5e6mHm6NgP+31vjGJuUCAD8kuauqNC18panKsRQb0+
	MCMx8eKIgIf8jsfgTxXvA9QxZwZbbXDDvmYoZ3w+099iopizp+Z6uxVRqQgdJwOntfH4d5cjh4QoT
	Tn9fncNb5ozBm9QIlZu3PeXM0oJBBMcEIlYtGGIVgSBy4jk2pQwcHvGuOHr9lmGwBUqZWoZ/ZGup9
	NSWrmYZkzp523yW+fpIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZGhW-00000001XSH-0t5J;
	Fri, 26 Dec 2025 22:54:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZGhU-00000001XQs-3Enf
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 26 Dec 2025 22:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9mp0y7L70LQWZn3MNrpl8AtI1agZhiyYjI11ja2HdtI=; b=cqGXvqaZWfHHM3pK+cayHrOg7L
	dy5dB6I/yvTSSJRjVBUvSjNbTbnCsWudgha1ZV7+u/lWDapPHyeSBS5OWj4cVK/5rOgSO5uIsw4Wf
	L56dmI3A5P2aw0FFcKcIcAl+2u7CLcDVfMb+iQl39Wd4t0vIVusRC+/TqnktxeXkJRkymsmxiu6VX
	kySnYX65T9Vp316kYAkstFZ929YsDWZObIhG0/CZBgbwkuHu0oagQSL0OUtIJGyf866Htm9H48c+p
	eynRZ2UYjGH+ow1AU0KsM9kiA57bz/dz9BNXm//7BnBjcFpoIg40jaAcLsemNrFw+jpWEJ0cuL+0G
	2O6U3ISg==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZGhN-00000001AIz-3DvA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 22:54:23 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a09757004cso96804145ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 14:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766789652; x=1767394452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mp0y7L70LQWZn3MNrpl8AtI1agZhiyYjI11ja2HdtI=;
        b=epBkzEb5UmXYCwYPKqRPTr3mOEXS5/L0pNBxwBuJdvks3nv2KK4KCrz3UYKM4hUbFc
         bV6U6pghV0Izf3k+AfjIPpZ/jr446U1pAEEJQ1UHvMi67UUqbe6lvm6P6P14iUKS5UZB
         B5InwstUlpmRrkHA7Di3W9ZEp96yUZ7PX3oBvx3rK5rgQao14heShwvlnZR+S/qKgdUP
         xb/Yo451Xq3OTdElV/jBv2oywQSrWsvJ1YooG8TDqUytjY6WttjeLXStxgQzQ2NStIQx
         irKIvf8deoAWQNP9F05Yx4CQLz+Uqci/66NsEgXUoGxSRhqR65J3iTbaQDAGFf+VDMfA
         nTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766789652; x=1767394452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9mp0y7L70LQWZn3MNrpl8AtI1agZhiyYjI11ja2HdtI=;
        b=RVmyTbL8po89edMKXQ9lS7Rj9Ub33fknJX7qmvw2dXiwtnKAML/f2lD3H6hr8Yw/DO
         6WYDkhdhXdEOy9yq57B+7cLv1ymjnU752LqxR8VbA9qh9epm2KMw/xmaf8s6vIqgTeug
         eu2ZFRrTbXCOxOBwunbM4Vw3falx6+Hz1+upULmbOkx+0wXJfa6gcXM/jSKnl7yJ4+Ch
         WgYub4f5T/lZbijkuK2bZ116Z+IZaGQ5TiZms+S++v1k97n2xYH4crkjvwWUvZLykxMl
         IY0tmorLdZJGwAnhte/n+xxA63I/STM2IfsKAy38tjrOB/S6nktYIlGEDcFYkzz4XQ6Z
         fXJA==
X-Forwarded-Encrypted: i=1; AJvYcCX2mxluWLUVEFEWERjlyDM9AAk7hEtqTWzK0rdA/ngsOUt5clT6YiBLGEllYruPQEQ7dyX1zpJjHcFoTZEFPePN@lists.infradead.org
X-Gm-Message-State: AOJu0YypU4X2ycLZLEl6Keae/oCiS51AXhHfMTwZrb0crYs6zhGvLV4P
	VffGA5NXGHOYazKjAje+Ygc6wvP7syQ1AV50ymZzjo9R4v4ZD6n6Egfl
X-Gm-Gg: AY/fxX6DxOZBf6hj16VgXs21SxyjuJbA1j46PtnADF2XUUfIQLx1Xej4KN0egJjDZfc
	yw5XRAv1Hv5fo7szOdarWbDGzJkP0gXeO0Oy2dxKTnBCnCBJi9zoh2CsC9QYa0mlf0ngCump1an
	0Dva3jLsxX0FWVKcI/SJdkBqEEqUo4lBL0EkOOJ3iXVYHq1+WuTxvyOsVVXvmJ0d2V0yZ9Opuh1
	/rbHItKF5HuV4tehnKHzfsDTOXPIVHr0NzrBS2nddoX6kdV0nRAgIrzERZO7p56JVyKGpEBcuu+
	eG3rU9I40Syf0h0dvXHM3KNi3qD0zpPthMLbOXCmr5rPg9ElKRqIKcoGazrXWw+Ayv48hCGHBZK
	kerw8jG3fEmjDApEPGZR32PvmM+0aFqCkt2JUheePcX0JoGWEyaQmC5IrIwDSrDT3b3UYWewrRx
	zN7oHYm6ulO34b
X-Google-Smtp-Source: AGHT+IH3Qyivahvz1Re89nhjkOGapFSbuTfRVGKZtZJZOQKn2pFT9vJfuh0AHXHFbf1hI+2p00nHuQ==
X-Received: by 2002:a17:902:f607:b0:2a1:4c31:335 with SMTP id d9443c01a7336-2a2f2717b88mr227808145ad.26.1766789652012;
        Fri, 26 Dec 2025 14:54:12 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e772ac1acsm9981428a91.9.2025.12.26.14.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 14:54:11 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RFC v2 7/8] dma-iommu: Support DMA sync batch mode for IOVA link and unlink
Date: Sat, 27 Dec 2025 11:52:47 +1300
Message-ID: <20251226225254.46197-8-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251226225254.46197-1-21cnbao@gmail.com>
References: <20251226225254.46197-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_225419_294666_E9EEC44E 
X-CRM114-Status: GOOD (  13.90  )
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
Cc: Barry Song <baohua@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Tangquan Zheng <zhengtangquan@oppo.com>, xen-devel@lists.xenproject.org, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <baohua@kernel.org>

Apply batched DMA synchronization to __dma_iova_link() and
iommu_dma_iova_unlink_range_slow(). For multiple
sync_dma_for_device() and sync_dma_for_cpu() calls, we only
need to wait once for the completion of all sync operations,
rather than waiting for each one individually.

I do not have the hardware to test this, so it is marked as
RFC. I would greatly appreciate it if someone could test it.

Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Signed-off-by: Barry Song <baohua@kernel.org>
---
 drivers/iommu/dma-iommu.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 6827763a3877..ffa940bdbbaf 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1849,10 +1849,8 @@ static int __dma_iova_link(struct device *dev, dma_addr_t addr,
 	bool coherent = dev_is_dma_coherent(dev);
 	int prot = dma_info_to_prot(dir, coherent, attrs);
 
-	if (!coherent && !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
+	if (!coherent && !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
 		arch_sync_dma_for_device(phys, size, dir);
-		arch_sync_dma_flush();
-	}
 
 	return iommu_map_nosync(iommu_get_dma_domain(dev), addr, phys, size,
 			prot, GFP_ATOMIC);
@@ -1995,6 +1993,8 @@ int dma_iova_sync(struct device *dev, struct dma_iova_state *state,
 	dma_addr_t addr = state->addr + offset;
 	size_t iova_start_pad = iova_offset(iovad, addr);
 
+	if (!dev_is_dma_coherent(dev))
+		arch_sync_dma_flush();
 	return iommu_sync_map(domain, addr - iova_start_pad,
 		      iova_align(iovad, size + iova_start_pad));
 }
@@ -2008,6 +2008,8 @@ static void iommu_dma_iova_unlink_range_slow(struct device *dev,
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iova_domain *iovad = &cookie->iovad;
 	size_t iova_start_pad = iova_offset(iovad, addr);
+	bool need_sync_dma = !dev_is_dma_coherent(dev) &&
+			!(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO));
 	dma_addr_t end = addr + size;
 
 	do {
@@ -2023,16 +2025,17 @@ static void iommu_dma_iova_unlink_range_slow(struct device *dev,
 			end - addr, iovad->granule - iova_start_pad);
 
 		if (!dev_is_dma_coherent(dev) &&
-		    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
+		    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
 			arch_sync_dma_for_cpu(phys, len, dir);
-			arch_sync_dma_flush();
-		}
 
 		swiotlb_tbl_unmap_single(dev, phys, len, dir, attrs);
 
 		addr += len;
 		iova_start_pad = 0;
 	} while (addr < end);
+
+	if (need_sync_dma)
+		arch_sync_dma_flush();
 }
 
 static void __iommu_dma_iova_unlink(struct device *dev,
-- 
2.43.0


