Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87E1C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 12:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghqsESCSlYDpPWVp7MysrBKDg3K0+nOb0GO49Q1Vkh8=; b=kFreTGnVaTAtyAnKy7bBklqI1Q
	ZbkCJmvWkel+stVjbjgzXisyzz9T4EoK5mYFddDJK80NmaasGau3VkNRIQmwFPC3YLxe28ogasU8O
	FNdiOoP4d5jMz+Y3fTHcHnuL+HeaxWgopl9mWSlEHbxkZqVv7U7Puvmj9MB4zb0fWdPFHfh5vw00O
	vRMTe3n1JZJRPMxHvdZoQhF//oDBFl71yS6mjENbm/4SjztnzHL9gUBJT9r51DU+F7S2FaVBYpWYy
	M7HvW8it1Xgkd47YNEXyMCb5FmBq2tr5KT6+mgf1WOu4q6WRsnnXmAXpo3MoI3036oIDni9JJc4OU
	O56Pg0UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9rQ-00000002cME-1ndq;
	Mon, 17 Mar 2025 12:46:28 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9o1-00000002bcD-2Qxx;
	Mon, 17 Mar 2025 12:42:59 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1742215365; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UtHINESV9YTxkr2/+vQCTAHdO++gSSJqmLPXPlChJocg7K4mPsmNo+YchOX0/sOv6tafgqypUTd85z8PaSrKJ2ZKqo85eUmD+dsjaB2jEQX6cZzO4LFb6cIwCJKssGeEW6trgH4JgsEaTTOnX7/Fg8wsJiOlIo5/G8t/t3IAocw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742215365; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ghqsESCSlYDpPWVp7MysrBKDg3K0+nOb0GO49Q1Vkh8=; 
	b=e8hbFK0BobAV181EI8/EYUCHTnPIcEXROL4Wweo/5RrY6yey2t92I1c2DeJrw4pL/6evsBlunxNsykHfa1KCpx5uaPob6D5rZQGxdere786IsWXvrxUNHK/H1iNE+4qiw0ff2Jgbmn6BY1R92bNVz5P1TKI2ByNYguaE2+8+gg0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742215365;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ghqsESCSlYDpPWVp7MysrBKDg3K0+nOb0GO49Q1Vkh8=;
	b=dacbRXwo2UICmQD7zrje2dDVP8xDaUYCZgquBXUUIRxpoOrbT0RCWx7jDWyD4jXz
	uXcARvBD1xL88K8qyAO4qYMLfSgAdTdrzdwoA4zSZMVgmVWqQfzHqjtg4cQusYBvIQD
	pI3t9IBDdPD2RPWZUGi6AuD8Hu1s0jsjZ/wyhZNA=
Received: by mx.zohomail.com with SMTPS id 1742215364198105.23374534580853;
	Mon, 17 Mar 2025 05:42:44 -0700 (PDT)
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
Subject: [PATCH v3 1/6] drm/panfrost: Set IOMMU_CACHE flag
Date: Mon, 17 Mar 2025 09:40:39 -0300
Message-ID: <20250317124044.16257-2-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317124044.16257-1-ariel.dalessandro@collabora.com>
References: <20250317124044.16257-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_054257_657083_59A0E9B6 
X-CRM114-Status: GOOD (  10.31  )
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


