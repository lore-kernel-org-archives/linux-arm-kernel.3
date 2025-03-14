Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46680C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 17:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghqsESCSlYDpPWVp7MysrBKDg3K0+nOb0GO49Q1Vkh8=; b=I4rYt+Ahin0BBMD/fTn6f892M9
	6pVEJJbFy8z/PJx/fovUCnzW0CdyaCfpgHwrTWTkbsn2YffxkCI5VXQ7eqVHkdOTbTZ8ll/u9cnt0
	6YLZzSHOwBGU7flgMwD7VY07q7gCWM8myLkQU/PnFtOoK3kuf8axcAzuCkr73Z+bFnxf95RJh59Br
	EFAb1rOcJhXFEgi62xdbPqbEP88KEZ8OBHApI/Jk9NRMKzR7hREyWd23yUTtiMjAk9ZtskSk36CUM
	ug0dHepLpRGHswwkHUEL9fpJGVThZmk51yKljoqUL7XqmuKhIvvmm9l9Wo4vI+RxVFntmp2Ej9D+j
	IoSu1XsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9HJ-0000000Ex8Y-1RPa;
	Fri, 14 Mar 2025 17:57:01 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt914-0000000EuSs-3s3p;
	Fri, 14 Mar 2025 17:40:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741974001; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZCkG7Az+Ny0TDQTThm2KSY658Yw0UhGBTaHip7knOva8Lf7dJfNoepNPQtE+NZMoRG4XwU3lpsLZIuhblJ3SHzwaxttdE/qaSi8Fp2K0W8Gu/ChNEyV648raEfLGZe/9yviYWb4/VdQSfPiNDubq2UgdYZQT77qVdlBP9+X925E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741974001; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ghqsESCSlYDpPWVp7MysrBKDg3K0+nOb0GO49Q1Vkh8=; 
	b=a8o2pkyrf+OOmozU3zWIN3kOGW00HreHdVHlLtuxMaLx6f+7UMQJuDladIDtMmivcCupJuW9gWdEHh2wvcE8xc5mfnHGdWErHJYpA7oiiCKZAVWixCgInpELw2pv8kslAiGAId3PCnqiFpCEMdqRJK4vmCxmEsYKVxTKGUBsXqU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741974001;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ghqsESCSlYDpPWVp7MysrBKDg3K0+nOb0GO49Q1Vkh8=;
	b=dIdUMG9czft3lYTgdhVH62QHefFWoI8PFRxt6BzyTd6/5J0mU775O123d/KGbsO6
	xNWkpjFKRKftz33ip1akzwfc5GO+ivGlcQrvCZVk6Qdg1sBZxHc8htF34sxXknkMmPa
	XfqLhPOO1JwjCQ4T4A1mDH1WSBYaBXyPEDsc9IP0=
Received: by mx.zohomail.com with SMTPS id 1741973998131839.7415151177113;
	Fri, 14 Mar 2025 10:39:58 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com,
	robh@kernel.org,
	steven.price@arm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	kernel@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sjoerd@collabora.com,
	angelogioacchino.delregno@collabora.com,
	Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [PATCH v2 1/6] drm/panfrost: Set IOMMU_CACHE flag
Date: Fri, 14 Mar 2025 14:38:53 -0300
Message-ID: <20250314173858.212264-2-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250314173858.212264-1-ariel.dalessandro@collabora.com>
References: <20250314173858.212264-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_104015_019186_AF72F0D8 
X-CRM114-Status: GOOD (  10.28  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Panfrost does not support uncached mappings, so flag them properly. Also
flag the pages that are mapped as response to a page fault as cached.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index b91019cd5acb1..9e6f198ef5c1b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -327,7 +327,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 	struct drm_gem_object *obj = &shmem->base;
 	struct panfrost_device *pfdev = to_panfrost_device(obj->dev);
 	struct sg_table *sgt;
-	int prot = IOMMU_READ | IOMMU_WRITE;
+	int prot = IOMMU_READ | IOMMU_WRITE | IOMMU_CACHE;
 
 	if (WARN_ON(mapping->active))
 		return 0;
@@ -528,7 +528,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 		goto err_map;
 
 	mmu_map_sg(pfdev, bomapping->mmu, addr,
-		   IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC, sgt);
+		   IOMMU_WRITE | IOMMU_READ | IOMMU_CACHE | IOMMU_NOEXEC, sgt);
 
 	bomapping->active = true;
 	bo->heap_rss_size += SZ_2M;
-- 
2.47.2


