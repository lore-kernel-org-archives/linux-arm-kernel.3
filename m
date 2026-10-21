Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6778960A3820
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 11:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HcuAjXll;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YdhnBWYe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UY0BY5YZcT9xFUcwEXXKGABgtDytV9atXMOzM0KH+wY=; b=HcuAjXllj9IMNDeVFyujzoNiox
	MU7DgYwKdyNCQJe+rCUttcNf7UbdaEZhRshFDr/b2Gg/7OjC6S0bM5fW3mLWDGZrAW6QMCyFmvobE
	XQuNwgENlV+ZSL9vPJOtQwrH1wkZfMGUpUbqC2Yhh1LGkLvQ+4RwTD8ekEM7RSUvuENuV283YRyIA
	5ck0CDnyJHgtPVcKQqTektTTR65LJSo2nEfscoRLN0CHQ4U2wtW+aO9KrMvwcNZszGeEihYai2Co9
	p163EBHUmdF1TBK4TzUHtD2CYCdGh7WH0MRCYugnMyAR14dkwHvcLfabNryFe8g++ngCqh6Q4m3jS
	i0Xprkpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUnZ-0000000BkAD-2DZ5;
	Wed, 21 Oct 2026 11:48:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUnX-0000000Bk9k-2owb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 11:47:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A664414D6;
	Wed, 21 Oct 2026 11:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 992091F000C4;
	Wed, 21 Oct 2026 11:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792583279;
	bh=UY0BY5YZcT9xFUcwEXXKGABgtDytV9atXMOzM0KH+wY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YdhnBWYe3LLCjDlSmUmc7fbfmRbuuqfaySN5me/ny51WQDoQFdlIh2+8UL9tQ3WUI
	 QLOQEHpo/RasEj1yUxSmp5WVnLLlhN48g3Gdgpk8Da3uyBRRa/yvGrSoekpmLLSlo3
	 Ts4DDL/G29GuMseX9g/VaL9o4FJSAxHJ6wNXwITPioc8BGogc9r1dMo6sF1/O+WW1/
	 VrMkruz4tjRP7Siphpg2GtlCcBNpsGrYoZv7ztN3r8kNPqI9BXcYNIDVCR05R9IvcU
	 jSpGR3PcurvE7W+458ZtaW8m9gmkJWIuysihjESrJLVgPldaTk6EQv6K6Wkr+5B2IS
	 Xf8YIIoHyE0tw==
From: "Harry Yoo (Meta)" <harry@kernel.org>
Date: Wed, 21 Oct 2026 12:46:50 +0100
Subject: [PATCH slab/for-next 09/14] iommu: specify SLAB_MAY_ACCOUNT for
 slab-backed page table caches
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-9-096800aa3330@kernel.org>
References: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-0-096800aa3330@kernel.org>
In-Reply-To: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-0-096800aa3330@kernel.org>
To: Vlastimil Babka <vbabka@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Roman Gushchin <roman.gushchin@linux.dev>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, Muchun Song <muchun.song@linux.dev>, 
 Hao Ge <hao.ge@linux.dev>, Pedro Falcato <pfalcato@suse.de>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 "Harry Yoo (Meta)" <harry@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Niklas Schnelle <schnelle@linux.ibm.com>, 
 Matthew Rosato <mjrosato@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

vfio, iommufd and vhost-vdpa call iommu_map() with GFP_KERNEL_ACCOUNT
and the gfp is passed down to the drivers' page table allocations.
Specify SLAB_MAY_ACCOUNT when the object may be charged to a memcg.
__GFP_ACCOUNT without SLAB_MAY_ACCOUNT will not be allowed.

Paths:
  VFIO_IOMMU_MAP_DMA -> iommu_map(GFP_KERNEL_ACCOUNT)
    -> s390_iommu_map_pages() -> dma_walk_cpu_trans()
    -> kmem_cache_alloc(dma_{region,page}_table_cache)
  iommu_map(GFP_KERNEL_ACCOUNT) -> arm_v7s_map_pages()
    -> __arm_v7s_alloc_table() -> kmem_cache_zalloc(data->l2_tables)
  iommu_map(GFP_KERNEL_ACCOUNT) -> sun50i_iommu_map()
    -> sun50i_dte_get_page_table() -> kmem_cache_zalloc(iommu->pt_pool)

Assisted-by: LLM
Cc: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Matthew Rosato <mjrosato@linux.ibm.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: iommu@lists.linux.dev
Cc: linux-s390@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev
Signed-off-by: Harry Yoo (Meta) <harry@kernel.org>
---
 drivers/iommu/io-pgtable-arm-v7s.c | 2 +-
 drivers/iommu/s390-iommu.c         | 4 ++--
 drivers/iommu/sun50i-iommu.c       | 3 ++-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 1dbef8c55007..b544e5da237a 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -706,7 +706,7 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 	data->l2_tables = kmem_cache_create("io-pgtable_armv7s_l2",
 					    ARM_V7S_TABLE_SIZE(2, cfg),
 					    ARM_V7S_TABLE_SIZE(2, cfg),
-					    slab_flag, NULL);
+					    slab_flag | SLAB_MAY_ACCOUNT, NULL);
 	if (!data->l2_tables)
 		goto out_free_data;
 
diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index f148f559ac56..f308efadc87b 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -198,14 +198,14 @@ static int __init dma_alloc_cpu_table_caches(void)
 	dma_region_table_cache = kmem_cache_create("PCI_DMA_region_tables",
 						   ZPCI_TABLE_SIZE,
 						   ZPCI_TABLE_ALIGN,
-						   0, NULL);
+						   SLAB_MAY_ACCOUNT, NULL);
 	if (!dma_region_table_cache)
 		return -ENOMEM;
 
 	dma_page_table_cache = kmem_cache_create("PCI_DMA_page_tables",
 						 ZPCI_PT_SIZE,
 						 ZPCI_PT_ALIGN,
-						 0, NULL);
+						 SLAB_MAY_ACCOUNT, NULL);
 	if (!dma_page_table_cache) {
 		kmem_cache_destroy(dma_region_table_cache);
 		return -ENOMEM;
diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index be3f1ce696ba..51a30969dde4 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -1011,7 +1011,8 @@ static int sun50i_iommu_probe(struct platform_device *pdev)
 
 	iommu->pt_pool = kmem_cache_create(dev_name(&pdev->dev),
 					   PT_SIZE, PT_SIZE,
-					   SLAB_HWCACHE_ALIGN | SLAB_CACHE_DMA32,
+					   SLAB_HWCACHE_ALIGN | SLAB_CACHE_DMA32 |
+					   SLAB_MAY_ACCOUNT,
 					   NULL);
 	if (!iommu->pt_pool)
 		return -ENOMEM;

-- 
2.54.0


