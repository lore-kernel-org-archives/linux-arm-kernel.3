Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30745E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXAdVcyIvzlz7i7WSO159EYvNqEybHFoFsFwP8+bSos=; b=dPTDJntgYu/+mRYCSAL1fr4hf8
	5GNLX8QBMz25wR5ihPWm2bislg2EvArEHTZ9oxjCdXMYlueKreqRVG2tm+cpMMTxqFh38b+A/A7Yi
	3l++mAbCxHs2q+L5YsasxoWuwp+3WDGJuDw0pxAzBsUKRHf4LEoHIPmJ903muAzv+2wIvx9BX3OLe
	0YERAePuhZuFQmWz7nF0ONfhNF2GHk6A2FkCngNlhOdSV6BYhG4+vJSP2WNHPv48Z6RUasonRNl6j
	AVL/vy/ZPdtonoRP/imKp/BsLK0QuGxDYIGqcB0Twmmw2/XX2sRWuWQQ8nrjWicpP4AdhKyQLTmuD
	0nGWBR3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLoCI-00000001U38-0e9g;
	Thu, 12 Dec 2024 18:46:02 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZb-00000001JxR-0mxl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:04 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3862f3ccf4fso358826f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026761; x=1734631561; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iXAdVcyIvzlz7i7WSO159EYvNqEybHFoFsFwP8+bSos=;
        b=38khodpz7ZHp3LBmXP6e72GEW2U/o2asF+I7b5ORCqV2DsZXoC+94iQZD+aqfHq3Aj
         CDYlForzZj5ym2BspRlXvI2S1RYLMaWfLyhpoDhj/VF+Cerf/0e3yFflVaeP5VonCmRR
         K61es7bGrAIFbiLvxgk+u37zG9bxkWxVqCZDIIVIuHffBUJfn0EUHLERZAi3d8pbkf9h
         zxvUgTjhWQ6rvkJkNsgMRLrE9RQcswN5m8L+zWQHwW/PBvXN+RHCgkWGmva7QK7lbmAK
         CHIb9HE5qRysnSOqJoMy2hHHv4uDt8i3u+Ljf/EUHp4ClMWQUSHR2gD02ROACV7lw2yh
         ZTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026761; x=1734631561;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iXAdVcyIvzlz7i7WSO159EYvNqEybHFoFsFwP8+bSos=;
        b=Ih8BYVS0vOlbjeeju3zZ04dhQK9N326vjVBfJfQMfQwCC2hGTD/N8C3ILRVMnLjwwm
         dCj8i9JvklndkTOZ6nUDLHv7/vzKWZ8GiVcXoIIVIL8GxhCWtqggCoReB6tu3hazBNkA
         +pEFa8fl3+Xn5GAPWvxL2UwPVnyMJWY60dLryAazSQxrJitq2oVnJYoWiwGuSjNnnmgO
         10ebOJHJo4/yS8XEAzk5+ZAtvoz0t1YCwzAWFh5F+Q3IeA4pzJRUbHmdsEc2iUxpKzF9
         30LqcX7FHIDvERJTPMMw875Lr7a3Vwx7ET8BT4Y2S/JFoEuTEHtsP4+GDHwmWZJgb60/
         712Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzUkh1qHBBIofEjnYOkfX20egzo40j1Il1Nm4WwfVqPdW5m/QWhrD/JB+YDzDRcUPWHUB3TddWdPr8dCtG7KUg@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj7iYH89Mo1MQ6S34T3VqiDm+MPSSPB6cpzME/yWCz9OCkt/Vr
	enyvCJJaHBvtybxMHIAn2OnqLBBi8w2svuAUALc9zO8wAKVkWc6vbu7MlFd/EexyHrTQdO3PHxX
	L8fPv4Thytg==
X-Google-Smtp-Source: AGHT+IEv9trywyRhFNpKLmyQCHa1KXy/laHIVh8Z4rtcW7mSbOGhZQtW8954nUj91xsudPP8/kvhlE70Laak2A==
X-Received: from wmsn8.prod.google.com ([2002:a05:600c:3b88:b0:434:f018:dd30])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2c5:b0:385:f417:ee3d with SMTP id ffacd0b85a97d-3878769a01fmr3792369f8f.35.1734026761231;
 Thu, 12 Dec 2024 10:06:01 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:01 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-38-smostafa@google.com>
Subject: [RFC PATCH v2 37/58] iommu/io-pgtable: Generalize walker interface
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100603_225882_AF4DD0FF 
X-CRM114-Status: GOOD (  18.24  )
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

Add a common struct for walker, which has a callback visitor
with HW agnostic info (phys addr + size).

Add size to walker so it can walk a range of IOVAs.

Also, add a cookie for the arm walker.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/gpu/drm/msm/msm_iommu.c       |  5 +++-
 drivers/iommu/io-pgtable-arm-common.c | 35 ++++++++++++++++++---------
 include/linux/io-pgtable-arm.h        |  2 +-
 include/linux/io-pgtable.h            | 18 ++++++++++++--
 4 files changed, 45 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 3e692818ba1f..8516861dd626 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -200,6 +200,9 @@ msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova, uint64_t ptes[
 {
 	struct msm_iommu_pagetable *pagetable;
 	struct arm_lpae_io_pgtable_walk_data wd = {};
+	struct io_pgtable_walk_common walker = {
+		.data = &wd,
+	};
 
 	if (mmu->type != MSM_MMU_IOMMU_PAGETABLE)
 		return -EINVAL;
@@ -209,7 +212,7 @@ msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova, uint64_t ptes[
 	if (!pagetable->pgtbl_ops->pgtable_walk)
 		return -EINVAL;
 
-	pagetable->pgtbl_ops->pgtable_walk(pagetable->pgtbl_ops, iova, &wd);
+	pagetable->pgtbl_ops->pgtable_walk(pagetable->pgtbl_ops, iova, 1, &walker);
 
 	for (int i = 0; i < ARRAY_SIZE(wd.ptes); i++)
 		ptes[i] = wd.ptes[i];
diff --git a/drivers/iommu/io-pgtable-arm-common.c b/drivers/iommu/io-pgtable-arm-common.c
index 21ee8ff7c881..4fc0b03494e3 100644
--- a/drivers/iommu/io-pgtable-arm-common.c
+++ b/drivers/iommu/io-pgtable-arm-common.c
@@ -481,7 +481,8 @@ struct iova_to_phys_data {
 static int visit_iova_to_phys(struct io_pgtable_walk_data *walk_data, int lvl,
 			      arm_lpae_iopte *ptep, size_t size)
 {
-	struct iova_to_phys_data *data = walk_data->data;
+	struct io_pgtable_walk_common *walker = walk_data->data;
+	struct iova_to_phys_data *data = walker->data;
 	data->pte = *ptep;
 	data->lvl = lvl;
 	return 0;
@@ -492,8 +493,11 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 {
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	struct iova_to_phys_data d;
-	struct io_pgtable_walk_data walk_data = {
+	struct io_pgtable_walk_common walker = {
 		.data = &d,
+	};
+	struct io_pgtable_walk_data walk_data = {
+		.data = &walker,
 		.visit = visit_iova_to_phys,
 		.addr = iova,
 		.end = iova + 1,
@@ -511,23 +515,25 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 static int visit_pgtable_walk(struct io_pgtable_walk_data *walk_data, int lvl,
 			      arm_lpae_iopte *ptep, size_t size)
 {
-	struct arm_lpae_io_pgtable_walk_data *data = walk_data->data;
-	data->ptes[data->level++] = *ptep;
+	struct io_pgtable_walk_common *walker = walk_data->data;
+	struct arm_lpae_io_pgtable_walk_data *data = walker->data;
+
+	data->ptes[lvl] = *ptep;
+	data->level = lvl + 1;
 	return 0;
 }
 
-static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova, void *wd)
+static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
+				 size_t size, struct io_pgtable_walk_common *walker)
 {
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	struct io_pgtable_walk_data walk_data = {
-		.data = wd,
+		.data = walker,
 		.visit = visit_pgtable_walk,
 		.addr = iova,
-		.end = iova + 1,
+		.end = iova + size,
 	};
 
-	((struct arm_lpae_io_pgtable_walk_data *)wd)->level = 0;
-
 	return __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
 }
 
@@ -537,6 +543,7 @@ static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
 {
 	struct io_pgtable *iop = &data->iop;
 	arm_lpae_iopte pte = READ_ONCE(*ptep);
+	struct io_pgtable_walk_common *walker = walk_data->data;
 
 	size_t size = ARM_LPAE_BLOCK_SIZE(lvl, data);
 	int ret = walk_data->visit(walk_data, lvl, ptep, size);
@@ -544,6 +551,8 @@ static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
 		return ret;
 
 	if (iopte_leaf(pte, lvl, iop->fmt)) {
+		if (walker->visit_leaf)
+			walker->visit_leaf(iopte_to_paddr(pte, data), size, walker, ptep);
 		walk_data->addr += size;
 		return 0;
 	}
@@ -585,7 +594,8 @@ static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
 static int visit_dirty(struct io_pgtable_walk_data *walk_data, int lvl,
 		       arm_lpae_iopte *ptep, size_t size)
 {
-	struct iommu_dirty_bitmap *dirty = walk_data->data;
+	struct io_pgtable_walk_common *walker = walk_data->data;
+	struct iommu_dirty_bitmap *dirty = walker->data;
 
 	if (!iopte_leaf(*ptep, lvl, walk_data->iop->fmt))
 		return 0;
@@ -606,9 +616,12 @@ static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
 {
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	struct io_pgtable_cfg *cfg = &data->iop.cfg;
+	struct io_pgtable_walk_common walker = {
+		.data = dirty,
+	};
 	struct io_pgtable_walk_data walk_data = {
 		.iop = &data->iop,
-		.data = dirty,
+		.data = &walker,
 		.visit = visit_dirty,
 		.flags = flags,
 		.addr = iova,
diff --git a/include/linux/io-pgtable-arm.h b/include/linux/io-pgtable-arm.h
index 88922314157d..9e5878c37d78 100644
--- a/include/linux/io-pgtable-arm.h
+++ b/include/linux/io-pgtable-arm.h
@@ -18,7 +18,7 @@ struct arm_lpae_io_pgtable {
 
 struct io_pgtable_walk_data {
 	struct io_pgtable		*iop;
-	void				*data;
+	struct io_pgtable_walk_common	*data;
 	int (*visit)(struct io_pgtable_walk_data *walk_data, int lvl,
 		     arm_lpae_iopte *ptep, size_t size);
 	unsigned long			flags;
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index f789234c703b..da50e17b0177 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -185,12 +185,25 @@ struct io_pgtable_cfg {
  *
  * @ptes:     The recorded PTE values from the walk
  * @level:    The level of the last PTE
+ * @cookie:   Cookie set by caller to identify it
  *
  * @level also specifies the last valid index in @ptes
  */
 struct arm_lpae_io_pgtable_walk_data {
 	u64 ptes[4];
 	int level;
+	void *cookie;
+};
+
+/**
+ * struct io_pgtable_walk_common - common information from a pgtable walk
+ * @visit_leaf: callback for each leaf providing it's physical address and size
+ */
+struct io_pgtable_walk_common {
+	void (*visit_leaf)(phys_addr_t paddr, size_t size,
+			   struct io_pgtable_walk_common *data,
+			   void *wd);
+	void *data; /* pointer to walk data as arm_lpae_io_pgtable_walk_data*/
 };
 
 /**
@@ -199,7 +212,7 @@ struct arm_lpae_io_pgtable_walk_data {
  * @map_pages:    Map a physically contiguous range of pages of the same size.
  * @unmap_pages:  Unmap a range of virtually contiguous pages of the same size.
  * @iova_to_phys: Translate iova to physical address.
- * @pgtable_walk: (optional) Perform a page table walk for a given iova.
+ * @pgtable_walk: (optional) Perform a page table walk for a given iova and size.
  *
  * These functions map directly onto the iommu_ops member functions with
  * the same names.
@@ -213,7 +226,8 @@ struct io_pgtable_ops {
 			      struct iommu_iotlb_gather *gather);
 	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
 				    unsigned long iova);
-	int (*pgtable_walk)(struct io_pgtable_ops *ops, unsigned long iova, void *wd);
+	int (*pgtable_walk)(struct io_pgtable_ops *ops, unsigned long iova,
+			    size_t size, struct io_pgtable_walk_common *walker);
 	int (*read_and_clear_dirty)(struct io_pgtable_ops *ops,
 				    unsigned long iova, size_t size,
 				    unsigned long flags,
-- 
2.47.0.338.g60cca15819-goog


