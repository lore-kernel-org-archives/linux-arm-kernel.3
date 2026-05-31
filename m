Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4ECBCD6E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 09:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCcyCK7AkmgAFVYPsCQjJr2AQljQ2E/AGKpawKYklUI=; b=J3Eq/tl4F5tpsIu9TYCOVoSPYq
	m3h95YKFrzwlSfPcvmdFxSvOE+1+dBVyhpn9a/kN+aPKBXYo+F5tpFNuVjxCt/P1UFV5CIdBcpwnR
	GSERTMLssOKCL2RnEXZID43lZT3DxBY+bFwpFpXd8NKP8/tsoPNKwzuB6i2YgLgldtv9glm81Qy8N
	a20FRqqC2jo+2uvZ+dmfj/7VBOev16psBNEEkj324fqVovDW1zVMSydXP8SJ4Rxe/4xrz0YV35Vn3
	2cu8w4GhExx1XhCuQ+sWuMGHdk4Ujin2SbJatGS2t6A217emCA+AQ+Rd9I3LirZZLbyfZbCAmzKP7
	2U+ucpcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcbV-00000009R45-2yf2;
	Sun, 31 May 2026 09:37:09 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcbL-00000009Qx5-085u
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 09:37:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780220213; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=WCcyCK7AkmgAFVYPsCQjJr2AQljQ2E/AGKpawKYklUI=;
	b=F0dMAgT6MkjYz9l17kVw2rR0cliSnDiRLeN2U4kUEQ3FPhuK8v4nyEPo06/BunH2WLKpIAz7AU8misFCrhPYxkiSj9xUujlVPfdUI4B2lkiBrGFoBSDoSR9pLxht9xj+46hEoqE24uteq0KtmzAADYMOtq7EnPaNYJ8xeL5y4qM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0X3tRVog_1780220207;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X3tRVog_1780220207 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 31 May 2026 17:36:48 +0800
From: Guanghui Feng <guanghuifeng@linux.alibaba.com>
To: boris.brezillon@collabora.com,
	robh@kernel.org,
	steven.price@arm.com,
	adrian.larumbe@collabora.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	liviu.dudau@arm.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	alex@shazbot.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	baolu.lu@linux.intel.com,
	suravee.suthikulpanit@amd.com,
	dwmw2@infradead.org
Cc: xlpang@linux.alibaba.com,
	oliver.yang@linux.alibaba.com,
	shiyu.zsq@linux.alibaba.com,
	wei.guo.simon@linux.alibaba.com
Subject: [PATCH 2/9] iommu/io-pgtable: introduce iova_to_phys_length in io_pgtable_ops
Date: Sun, 31 May 2026 17:36:30 +0800
Message-ID: <20260531093637.3893199-3-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
References: <20260529115116.GR2487554@ziepe.ca>
 <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_023659_405210_3DF0040B 
X-CRM114-Status: GOOD (  15.32  )
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

Add iova_to_phys_length to struct io_pgtable_ops alongside iova_to_phys.
The new callback additionally returns the block/page size of the PTE
entry through the mapped_length parameter.

Implement in all three io-pgtable backends:
- ARM LPAE: returns ARM_LPAE_BLOCK_SIZE at the resolved level
- ARM v7s: returns block size derived from level mask
- DART: returns pgsize_bitmap (single fixed page size)

The old iova_to_phys is kept as a thin wrapper for backward compat.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
Acked-by: Shiqiang Zhang <shiyu.zsq@linux.alibaba.com>
Acked-by: Simon Guo <wei.guo.simon@linux.alibaba.com>
---
 drivers/iommu/io-pgtable-arm-v7s.c | 30 ++++++++++++++++++++++++------
 drivers/iommu/io-pgtable-arm.c     | 19 ++++++++++++++++++-
 drivers/iommu/io-pgtable-dart.c    | 26 +++++++++++++++++++++-----
 include/linux/io-pgtable.h         |  7 +++++++
 4 files changed, 70 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 40e33257d3c2..54e8cc673eb6 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -641,13 +641,25 @@ static size_t arm_v7s_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova
 	return unmapped;
 }
 
+static phys_addr_t arm_v7s_iova_to_phys_length(struct io_pgtable_ops *ops,
+						unsigned long iova,
+						size_t *mapped_length);
+
 static phys_addr_t arm_v7s_iova_to_phys(struct io_pgtable_ops *ops,
 					unsigned long iova)
+{
+	return arm_v7s_iova_to_phys_length(ops, iova, NULL);
+}
+
+static phys_addr_t arm_v7s_iova_to_phys_length(struct io_pgtable_ops *ops,
+						unsigned long iova,
+						size_t *mapped_length)
 {
 	struct arm_v7s_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	arm_v7s_iopte *ptep = data->pgd, pte;
 	int lvl = 0;
 	u32 mask;
+	size_t blk_size;
 
 	do {
 		ptep += ARM_V7S_LVL_IDX(iova, ++lvl, &data->iop.cfg);
@@ -661,6 +673,11 @@ static phys_addr_t arm_v7s_iova_to_phys(struct io_pgtable_ops *ops,
 	mask = ARM_V7S_LVL_MASK(lvl);
 	if (arm_v7s_pte_is_cont(pte, lvl))
 		mask *= ARM_V7S_CONT_PAGES;
+
+	blk_size = ~mask + 1U;
+	if (mapped_length)
+		*mapped_length = blk_size;
+
 	return iopte_to_paddr(pte, lvl, &data->iop.cfg) | (iova & ~mask);
 }
 
@@ -714,6 +731,7 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 		.map_pages	= arm_v7s_map_pages,
 		.unmap_pages	= arm_v7s_unmap_pages,
 		.iova_to_phys	= arm_v7s_iova_to_phys,
+		.iova_to_phys_length	= arm_v7s_iova_to_phys_length,
 	};
 
 	/* We have to do this early for __arm_v7s_alloc_table to work... */
@@ -837,13 +855,13 @@ static int __init arm_v7s_do_selftests(void)
 	 * Initial sanity checks.
 	 * Empty page tables shouldn't provide any translations.
 	 */
-	if (ops->iova_to_phys(ops, 42))
+	if (ops->iova_to_phys_length(ops, 42, NULL))
 		return __FAIL(ops);
 
-	if (ops->iova_to_phys(ops, SZ_1G + 42))
+	if (ops->iova_to_phys_length(ops, SZ_1G + 42, NULL))
 		return __FAIL(ops);
 
-	if (ops->iova_to_phys(ops, SZ_2G + 42))
+	if (ops->iova_to_phys_length(ops, SZ_2G + 42, NULL))
 		return __FAIL(ops);
 
 	/*
@@ -864,7 +882,7 @@ static int __init arm_v7s_do_selftests(void)
 				    &mapped))
 			return __FAIL(ops);
 
-		if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
+		if (ops->iova_to_phys_length(ops, iova + 42, NULL) != (iova + 42))
 			return __FAIL(ops);
 
 		iova += SZ_16M;
@@ -878,7 +896,7 @@ static int __init arm_v7s_do_selftests(void)
 		if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
 			return __FAIL(ops);
 
-		if (ops->iova_to_phys(ops, iova + 42))
+		if (ops->iova_to_phys_length(ops, iova + 42, NULL))
 			return __FAIL(ops);
 
 		/* Remap full block */
@@ -886,7 +904,7 @@ static int __init arm_v7s_do_selftests(void)
 				   GFP_KERNEL, &mapped))
 			return __FAIL(ops);
 
-		if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
+		if (ops->iova_to_phys_length(ops, iova + 42, NULL) != (iova + 42))
 			return __FAIL(ops);
 
 		iova += SZ_16M;
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 0208e5897c29..e2ea84669fbf 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -731,8 +731,19 @@ static int visit_iova_to_phys(struct io_pgtable_walk_data *walk_data, int lvl,
 	return 0;
 }
 
+static phys_addr_t arm_lpae_iova_to_phys_length(struct io_pgtable_ops *ops,
+						 unsigned long iova,
+						 size_t *mapped_length);
+
 static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 					 unsigned long iova)
+{
+	return arm_lpae_iova_to_phys_length(ops, iova, NULL);
+}
+
+static phys_addr_t arm_lpae_iova_to_phys_length(struct io_pgtable_ops *ops,
+						 unsigned long iova,
+						 size_t *mapped_length)
 {
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	struct iova_to_phys_data d;
@@ -742,13 +753,18 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 		.addr = iova,
 		.end = iova + 1,
 	};
+	size_t block_size;
 	int ret;
 
 	ret = __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
 	if (ret)
 		return 0;
 
-	iova &= (ARM_LPAE_BLOCK_SIZE(d.lvl, data) - 1);
+	block_size = ARM_LPAE_BLOCK_SIZE(d.lvl, data);
+	if (mapped_length)
+		*mapped_length = block_size;
+
+	iova &= (block_size - 1);
 	return iopte_to_paddr(d.pte, data) | iova;
 }
 
@@ -948,6 +964,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 		.map_pages	= arm_lpae_map_pages,
 		.unmap_pages	= arm_lpae_unmap_pages,
 		.iova_to_phys	= arm_lpae_iova_to_phys,
+		.iova_to_phys_length	= arm_lpae_iova_to_phys_length,
 		.read_and_clear_dirty = arm_lpae_read_and_clear_dirty,
 		.pgtable_walk	= arm_lpae_pgtable_walk,
 	};
diff --git a/drivers/iommu/io-pgtable-dart.c b/drivers/iommu/io-pgtable-dart.c
index cbc5d6aa2daa..fa250f5d16ed 100644
--- a/drivers/iommu/io-pgtable-dart.c
+++ b/drivers/iommu/io-pgtable-dart.c
@@ -333,11 +333,23 @@ static size_t dart_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
 	return i * pgsize;
 }
 
+static phys_addr_t dart_iova_to_phys_length(struct io_pgtable_ops *ops,
+					    unsigned long iova,
+					    size_t *mapped_length);
+
 static phys_addr_t dart_iova_to_phys(struct io_pgtable_ops *ops,
-					 unsigned long iova)
+				     unsigned long iova)
+{
+	return dart_iova_to_phys_length(ops, iova, NULL);
+}
+
+static phys_addr_t dart_iova_to_phys_length(struct io_pgtable_ops *ops,
+					    unsigned long iova,
+					    size_t *mapped_length)
 {
 	struct dart_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	dart_iopte pte, *ptep;
+	size_t pgsize;
 
 	ptep = dart_get_last(data, iova);
 
@@ -350,7 +362,10 @@ static phys_addr_t dart_iova_to_phys(struct io_pgtable_ops *ops,
 	pte = READ_ONCE(*ptep);
 	/* Found translation */
 	if (pte) {
-		iova &= (data->iop.cfg.pgsize_bitmap - 1);
+		pgsize = data->iop.cfg.pgsize_bitmap;
+		if (mapped_length)
+			*mapped_length = pgsize;
+		iova &= (pgsize - 1);
 		return iopte_to_paddr(pte, data) | iova;
 	}
 
@@ -397,9 +412,10 @@ dart_alloc_pgtable(struct io_pgtable_cfg *cfg)
 	data->bits_per_level = bits_per_level;
 
 	data->iop.ops = (struct io_pgtable_ops) {
-		.map_pages	= dart_map_pages,
-		.unmap_pages	= dart_unmap_pages,
-		.iova_to_phys	= dart_iova_to_phys,
+		.map_pages		= dart_map_pages,
+		.unmap_pages		= dart_unmap_pages,
+		.iova_to_phys		= dart_iova_to_phys,
+		.iova_to_phys_length	= dart_iova_to_phys_length,
 	};
 
 	return data;
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index e19872e37e06..42bcdd309b88 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -203,6 +203,10 @@ struct arm_lpae_io_pgtable_walk_data {
  * @map_pages:    Map a physically contiguous range of pages of the same size.
  * @unmap_pages:  Unmap a range of virtually contiguous pages of the same size.
  * @iova_to_phys: Translate iova to physical address.
+ * @iova_to_phys_length: Translate iova to physical address and return the
+ *			  remaining mapped length from iova to the end of the
+ *			  mapping entry via @mapped_length. If @mapped_length is
+ *			  NULL, only the physical address is returned.
  * @pgtable_walk: (optional) Perform a page table walk for a given iova.
  * @read_and_clear_dirty: Record dirty info per IOVA. If an IOVA is dirty,
  *			  clear its dirty state from the PTE unless the
@@ -220,6 +224,9 @@ struct io_pgtable_ops {
 			      struct iommu_iotlb_gather *gather);
 	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
 				    unsigned long iova);
+	phys_addr_t (*iova_to_phys_length)(struct io_pgtable_ops *ops,
+					   unsigned long iova,
+					   size_t *mapped_length);
 	int (*pgtable_walk)(struct io_pgtable_ops *ops, unsigned long iova, void *wd);
 	int (*read_and_clear_dirty)(struct io_pgtable_ops *ops,
 				    unsigned long iova, size_t size,
-- 
2.43.7


