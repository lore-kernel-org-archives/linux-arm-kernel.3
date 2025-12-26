Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F93DE8FDBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 00:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/r7srQmiwZEhg1qAC5GzWj8afC3w1hmN+Jy3ezOc8f0=; b=WW/6V1lnup3lcg
	mu0UP7TDL4RJNzYQqRy0WAji9GblArK2OLWf2mMCtnaeKs5F1VP1BO/7EOj1xg24Nn2LEwcFTiD74
	UCa1Hb6lmNdj4dQ4ENy8FFHZnvOY+w7UZACLZ7couv8UOog5U50tGWr7ON3mg1M2qbdfFDhU/DdPy
	zWQihxsojiC3RSgaOJ9rVkltjKil+wgF48+xjEsxbIkLVr3+JV/KSe70HoWJUwAz6PS/VqwEvDe6O
	aO6SXqKF2Sd2umcAfUBfOR5lrDS8CAT/KTCSkG1mQD9fgUsU8Jya7eeRC0tXfkpfF9w38xSt4i7CU
	OLpy/0ELC8VpoGt4f/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZIXG-00000001bga-1cfZ;
	Sat, 27 Dec 2025 00:51:58 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZIXE-00000001bgD-0EaL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 00:51:57 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-8888a1c50e8so100309876d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 16:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766796714; x=1767401514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/r7srQmiwZEhg1qAC5GzWj8afC3w1hmN+Jy3ezOc8f0=;
        b=dtwYuFkjb2dp9Gf07vMBvjlkenV/bvisS8oDNL55wjWfg7xtM6wyLuZtEaYDtr03J0
         0HVUdBegmo9D2J4NmKO2uR6pWlXAEMe7eIqQhKAMfoSnEOSn4Q5s98X/G+l1gRbkbc1U
         w7fdNs8t/0P0ZK1yzjANVgzHTPuEjpzqM5HOnDGVaJ0HDfTHn6mCXEXiVbUaqUQtn9Ko
         MhC9761ycBDIX8cLWKEmg+3ZbBfUPPpZE1dGnwJqzbjvrc1DlQ4HsXQjpTavri+N7RUt
         pf9dIOWqTBA9qgjAYJON3gSDIuiQQXX3AlsdVqr1kuDOLnIfl2CYVW1nRYmFZzcS8Goj
         EhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766796714; x=1767401514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/r7srQmiwZEhg1qAC5GzWj8afC3w1hmN+Jy3ezOc8f0=;
        b=J0Zy6ZsVChyeJ4lSZl2iq3IbMr8uf29/vbxj7fhdTNZF4hj1cSDeEjFFlk3vhG2s7U
         7JvN/LrA27pvQdGVKDiQ0b6pioiMo+uDdgpmD7gJH2qbk0FecLYwU77or+wdGZDPu05d
         UMLLW5tCDU7ECOotlKtReUaEFfFm2xsDbdJCKM2HtMQFOi2UHdLFagwVEcsfMUaQrisY
         a8ySCTStHYNNXDrqdcIzSSRQydXz8es0ltqrvESftd67L7zkiDvkTnRZp8c5vVkcelxD
         7j6Dhj10NymxpWkQXzMkAQgDCcYBwtHwz/RQl1AxPWZXXufv78Rur4BvdLQA0ijZJ+IL
         bTkw==
X-Forwarded-Encrypted: i=1; AJvYcCUUHBLWq2RTRcslMiIQHCF/7TB61d4KYmz5XXwuiBpROvZYaZbMW1sL6LTJx/wYoFwZxX+vniSptzLv31bstLfw@lists.infradead.org
X-Gm-Message-State: AOJu0YwVaWKpV+LTD2Rac1mwXK1QWEIKwylmGkk7czhnR13BnLadeApM
	cN/N6rFoSYulU9bJ7oiTiA+QeATDHo2fH2gv9U40iWpzot9jHqPFtScV
X-Gm-Gg: AY/fxX7XWCbI5xy5NUou59xsJvVuL0Z+2p/QTocioNEAUoa8CMyWWFe27mbG4f5emVs
	3p0dn9h9VY6tv5IXOI721lqc5F2ySCqMm5JljcWIrVNICU6ItJtXid9d/5MoPSLehaB1JfSHG5E
	sPH0r+24hIMpm3jHeRr7RbrcS9QLFvKGj8qFH67hgICXYgllKnW1LApGk5PtH9rz0FGi+oduoQu
	/pZn7xJKSka4eXHK5Ge6FL6eixt6RziNJ5XfYKrbXKNs0TGpwN+WZ/+rlmkH6bl9YuyIY2fWH86
	knYOYMon1ONG+D7H/0CTpM/rssKqmarYeQiDcSDpby+ixpnXCYfaoreqHKfxZV9S22kiH0lWtTg
	6+HY8W+0POQ4sOVtj7jHO/5O3N4enKCCvjIXHghqPaGOeVHn/EnB5idjei0RmmJ+tKaSRv7XrbE
	1Igdt37oGc8K/c
X-Google-Smtp-Source: AGHT+IGRk72ichKRcHInGwm03WbYMZHXhydzrv/dBjOlD3Ki0dbJk2IiVKSqfCl2HL9XczgL6zklJg==
X-Received: by 2002:a17:90a:e7c9:b0:32e:7340:a7f7 with SMTP id 98e67ed59e1d1-34e921131admr17034959a91.2.1766789597799;
        Fri, 26 Dec 2025 14:53:17 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e772ac1acsm9981428a91.9.2025.12.26.14.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 14:53:16 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/8] dma-mapping: arm64: support batched cache sync
Date: Sat, 27 Dec 2025 11:52:40 +1300
Message-ID: <20251226225254.46197-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_165156_134201_DF2CA7BA 
X-CRM114-Status: GOOD (  13.41  )
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
Cc: Juergen Gross <jgross@suse.com>, Barry Song <baohua@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Tangquan Zheng <zhengtangquan@oppo.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, xen-devel@lists.xenproject.org, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>, Huacai Zhou <zhouhuacai@oppo.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <baohua@kernel.org>

Many embedded ARM64 SoCs still lack hardware cache coherency support, which
causes DMA mapping operations to appear as hotspots in on-CPU flame graphs.

For an SG list with *nents* entries, the current dma_map/unmap_sg() and DMA
sync APIs perform cache maintenance one entry at a time. After each entry,
the implementation synchronously waits for the corresponding region’s
D-cache operations to complete. On architectures like arm64, efficiency can
be improved by issuing all entries’ operations first and then performing a
single batched wait for completion.

Tangquan's results show that batched synchronization can reduce
dma_map_sg() time by 64.61% and dma_unmap_sg() time by 66.60% on an MTK
phone platform (MediaTek Dimensity 9500). The tests were performed by
pinning the task to CPU7 and fixing the CPU frequency at 2.6 GHz,
running dma_map_sg() and dma_unmap_sg() on 10 MB buffers (10 MB / 4 KB
sg entries per buffer) for 200 iterations and then averaging the
results.

I also ran this patch set on an RK3588 Rock5B+ board and
observed that millions of DMA sync operations were batched.

v2:
 * Refine a large amount of arm64 asm code based on feedback from
   Robin, thanks!
 * Drop batch_add APIs and always use arch_sync_dma_for_* + flush,
   even for a single buffer, based on Leon’s suggestion, thanks!
 * Refine a large amount of code based on feedback from Leon, thanks!
 * Also add batch support for iommu_dma_sync_sg_for_{cpu,device}
v1 link:
 https://lore.kernel.org/lkml/20251219053658.84978-1-21cnbao@gmail.com/

v1, diff with RFC:
 * Drop a large number of #ifdef/#else/#endif blocks based on feedback
   from Catalin and Marek, thanks!
 * Also add batched iova link/unlink support, marked as RFC since I lack
   the required hardware. This was suggested by Marek, thanks!
RFC link:
 https://lore.kernel.org/lkml/20251029023115.22809-1-21cnbao@gmail.com/

Barry Song (8):
  arm64: Provide dcache_by_myline_op_nosync helper
  arm64: Provide dcache_clean_poc_nosync helper
  arm64: Provide dcache_inval_poc_nosync helper
  dma-mapping: Separate DMA sync issuing and completion waiting
  dma-mapping: Support batch mode for dma_direct_sync_sg_for_*
  dma-mapping: Support batch mode for dma_direct_{map,unmap}_sg
  dma-iommu: Support DMA sync batch mode for IOVA link and unlink
  dma-iommu: Support DMA sync batch mode for iommu_dma_sync_sg_for_{cpu,
    device}

 arch/arm64/include/asm/assembler.h  | 24 +++++++++---
 arch/arm64/include/asm/cache.h      |  6 +++
 arch/arm64/include/asm/cacheflush.h |  2 +
 arch/arm64/kernel/relocate_kernel.S |  3 +-
 arch/arm64/mm/cache.S               | 57 +++++++++++++++++++++++------
 arch/arm64/mm/dma-mapping.c         |  4 +-
 drivers/iommu/dma-iommu.c           | 35 ++++++++++++++----
 drivers/xen/swiotlb-xen.c           | 24 ++++++++----
 include/linux/dma-map-ops.h         |  6 +++
 kernel/dma/direct.c                 | 23 +++++++++---
 kernel/dma/direct.h                 | 21 ++++++++---
 kernel/dma/mapping.c                |  6 +--
 kernel/dma/swiotlb.c                |  4 +-
 13 files changed, 165 insertions(+), 50 deletions(-)

Cc: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Cc: Huacai Zhou <zhouhuacai@oppo.com>
--
2.43.0


