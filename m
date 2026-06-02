Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930AACD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C15FwabaXicb3m5vf4ClTn8uJ1VB2DMgTV11Lw9ohJo=; b=0ETR1AA828xAdWURNS8jHWwN64
	+PaKG3F2DtvoaWfOe2H00360SXfcBjiaMQnt3r/00Z1HtV6DQAhck/XPIs8lobNLMLrARMoYccC2P
	A8cgVnMpr0ftTky0uzZSHinxGIXRRPLcZcTK59Woykba8is+2Lpkjk4e7X5KmsWXOoq8uzovpw6v4
	KwqPhPJlbj9dEsDvdplDodubw02pekTn4y27ZeM9vpNjhXDlPOgY4fns5K4u66+dXp8dPZMSmpXzo
	07QNCmRG/ae56lxOZyZsuDUdh5BPVy2BxP2MIQwA9AIGYm+dRsCy/ykfU9BMHG2g3xUSqGByYInpr
	P/BVWLjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMeg-0000000CoqE-19yY;
	Tue, 02 Jun 2026 10:47:30 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMea-0000000CoWW-0NpV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 10:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780397242; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=C15FwabaXicb3m5vf4ClTn8uJ1VB2DMgTV11Lw9ohJo=;
	b=ihGLi8gIiW1yBmCCnFiA546N2d5LHtMsAHblI3+5TirKzUHd3xcj/2ykZtkIMUvQe7qxD71xjiSh21s9+In9XPMJ1UxNkfsAhwMy2IilEMjzuSjPeFCQodoMFa/vF00lR2HIbIinPGc8k1xfD6UpPDWJZKNc7SbYxOMO/lVpmOw=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X44E9AA_1780397237;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X44E9AA_1780397237 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 18:47:18 +0800
From: Guanghui Feng <guanghuifeng@linux.alibaba.com>
To: adrian.larumbe@collabora.com,
	airlied@gmail.com,
	alex@shazbot.org,
	baolu.lu@linux.intel.com,
	boris.brezillon@collabora.com,
	dri-devel@lists.freedesktop.org,
	dwmw2@infradead.org,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	joro@8bytes.org,
	kevin.tian@intel.com,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liviu.dudau@arm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	oliver.yang@linux.alibaba.com,
	robh@kernel.org,
	robin.murphy@arm.com,
	shiyu.zsq@linux.alibaba.com,
	steven.price@arm.com,
	suravee.suthikulpanit@amd.com,
	tzimmermann@suse.de,
	wei.guo.simon@linux.alibaba.com,
	will@kernel.org,
	xlpang@linux.alibaba.com
Cc: alikernel-developer@linux.alibaba.com
Subject: [PATCH v2 30/30] iommu: remove iova_to_phys from domain_ops and io_pgtable_ops
Date: Tue,  2 Jun 2026 18:46:37 +0800
Message-ID: <20260602104637.1219810-31-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
References: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_034724_422074_3B858579 
X-CRM114-Status: GOOD (  13.12  )
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

Now that all drivers implement iova_to_phys_length and all callers
have migrated, remove the deprecated interfaces:

- Remove .iova_to_phys from struct iommu_domain_ops
- Remove .iova_to_phys from struct io_pgtable_ops
- Remove fallback path in iommu_iova_to_phys_length()
- iommu_iova_to_phys() remains as a thin wrapper calling _length with NULL

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/iommu.c      | 12 ++----------
 include/linux/io-pgtable.h |  3 ---
 include/linux/iommu.h      |  3 ---
 3 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 1b1aaa53dd16..84893d4c7c60 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2554,7 +2554,7 @@ EXPORT_SYMBOL_GPL(iommu_detach_group);
  * Like iommu_iova_to_phys() but additionally returns the page size of the
  * PTE mapping at @iova through @mapped_length.
  *
- * Return: The physical address for the given IOVA, or PHYS_ADDR_MAX if no translation.
+ * Return: The physical address for the given IOVA, or 0 if no translation.
  */
 phys_addr_t iommu_iova_to_phys_length(struct iommu_domain *domain,
 				       dma_addr_t iova,
@@ -2566,16 +2566,8 @@ phys_addr_t iommu_iova_to_phys_length(struct iommu_domain *domain,
 	if (domain->type == IOMMU_DOMAIN_IDENTITY)
 		return iova;
 
-	if (!domain->ops->iova_to_phys_length) {
-		/* Fallback to legacy iova_to_phys without length info */
-		if (domain->ops->iova_to_phys) {
-			phys_addr_t phys = domain->ops->iova_to_phys(domain, iova);
-			if (phys && mapped_length)
-				*mapped_length = PAGE_SIZE;
-			return phys ? phys : PHYS_ADDR_MAX;
-		}
+	if (!domain->ops->iova_to_phys_length)
 		return PHYS_ADDR_MAX;
-	}
 
 	return domain->ops->iova_to_phys_length(domain, iova, mapped_length);
 }
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 42bcdd309b88..c595f5b51e61 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -202,7 +202,6 @@ struct arm_lpae_io_pgtable_walk_data {
  *
  * @map_pages:    Map a physically contiguous range of pages of the same size.
  * @unmap_pages:  Unmap a range of virtually contiguous pages of the same size.
- * @iova_to_phys: Translate iova to physical address.
  * @iova_to_phys_length: Translate iova to physical address and return the
  *			  remaining mapped length from iova to the end of the
  *			  mapping entry via @mapped_length. If @mapped_length is
@@ -222,8 +221,6 @@ struct io_pgtable_ops {
 	size_t (*unmap_pages)(struct io_pgtable_ops *ops, unsigned long iova,
 			      size_t pgsize, size_t pgcount,
 			      struct iommu_iotlb_gather *gather);
-	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
-				    unsigned long iova);
 	phys_addr_t (*iova_to_phys_length)(struct io_pgtable_ops *ops,
 					   unsigned long iova,
 					   size_t *mapped_length);
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 19da84c2922c..ca585647180b 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -746,7 +746,6 @@ struct iommu_ops {
  *                         array->entry_num to report the number of handled
  *                         invalidation requests. The driver data structure
  *                         must be defined in include/uapi/linux/iommufd.h
- * @iova_to_phys: translate iova to physical address
  * @iova_to_phys_length: translate iova to physical address and additionally
  *                       return the page size of the PTE mapping at @iova
  *                       through @mapped_length.
@@ -777,8 +776,6 @@ struct iommu_domain_ops {
 	int (*cache_invalidate_user)(struct iommu_domain *domain,
 				     struct iommu_user_data_array *array);
 
-	phys_addr_t (*iova_to_phys)(struct iommu_domain *domain,
-				    dma_addr_t iova);
 	phys_addr_t (*iova_to_phys_length)(struct iommu_domain *domain,
 					    dma_addr_t iova,
 					    size_t *mapped_length);
-- 
2.43.7


