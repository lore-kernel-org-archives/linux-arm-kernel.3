Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C727DCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfeUzwK3Vykd8PqKTRs5NqT5hfv04UcKedfq7xRHrho=; b=2KB7IgFQPDrg71D+7Xd6f7W+Y7
	dZZBMvR9exC4nJGx7sy5mvno40KwBofOkLSrpW25IJh8WMxtPT/O9Esiu/F0f35p08yMRzmjtvwGJ
	kPDZdguSW2cY5T+6musadeTHBfvabaTDE/vgDEo1BjTKl3aJhLiUdJdJeu6Ddwdvv2JJOa++/NKda
	EC4jRxYsvSnlc1/PuzEIyJBYI/kpT5JT5yPbklVkkaelXw38G4IRKSvstdBhBb8YNQCVKT270P9+t
	kJBUqn3pe8UoRhGKqI16ZXekXVVVFWpbn0QsuPzNVkZwU5z3BFqXlAUEfD26bAR6hTkjRSyn+0sfL
	MS86jtGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMe7-0000000Cnjp-1Q8q;
	Tue, 02 Jun 2026 10:46:55 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMe4-0000000Cnhl-0Qku
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 10:46:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780397210; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=dfeUzwK3Vykd8PqKTRs5NqT5hfv04UcKedfq7xRHrho=;
	b=Zhc3I6k1G1qYUubrjaXnRwc2ccnHu74wNNoHbxHVQaLLSlq4y00GSJlnvzhlJG/zyu0MWZAnefOH+qWnpOn8SY5a/XNzw88HmpaxKf7u4Xq/PCxoxaBV1S1kmJ1hBksVAfzkdKuPPvSHLE81Wt8Xajt4C+IcKkn98j2hHouXVBs=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X44E923_1780397207;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X44E923_1780397207 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 18:46:48 +0800
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
Subject: [PATCH v2 01/30] iommu: introduce iova_to_phys_length in iommu_domain_ops
Date: Tue,  2 Jun 2026 18:46:08 +0800
Message-ID: <20260602104637.1219810-2-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
References: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_034652_641844_646686BE 
X-CRM114-Status: GOOD (  14.32  )
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

Add iova_to_phys_length callback to struct iommu_domain_ops alongside
the existing iova_to_phys. The new callback returns both the physical
address and the PTE mapping page size in a single page table walk.

Add iommu_iova_to_phys_length() core function that:
- Checks ops->iova_to_phys_length first (preferred path)
- Falls back to ops->iova_to_phys for unmigrated drivers

This enables callers like VFIO to efficiently traverse IOVA space
by actual mapping granularity instead of fixed PAGE_SIZE steps.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
Acked-by: Shiqiang Zhang <shiyu.zsq@linux.alibaba.com>
Acked-by: Simon Guo <wei.guo.simon@linux.alibaba.com>
---
 drivers/iommu/iommu.c | 40 ++++++++++++++++++++++++++++++++++++----
 include/linux/iommu.h |  9 +++++++++
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index d1a9e713d3a0..1b1aaa53dd16 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2545,15 +2545,47 @@ void iommu_detach_group(struct iommu_domain *domain, struct iommu_group *group)
 }
 EXPORT_SYMBOL_GPL(iommu_detach_group);
 
-phys_addr_t iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
+/**
+ * iommu_iova_to_phys_length - Translate IOVA and return mapping page size
+ * @domain: IOMMU domain to query
+ * @iova: IO virtual address to translate
+ * @mapped_length: Output parameter for the PTE page size (e.g. 4KB/2MB/1GB)
+ *
+ * Like iommu_iova_to_phys() but additionally returns the page size of the
+ * PTE mapping at @iova through @mapped_length.
+ *
+ * Return: The physical address for the given IOVA, or PHYS_ADDR_MAX if no translation.
+ */
+phys_addr_t iommu_iova_to_phys_length(struct iommu_domain *domain,
+				       dma_addr_t iova,
+				       size_t *mapped_length)
 {
+	if (mapped_length)
+		*mapped_length = 0;
+
 	if (domain->type == IOMMU_DOMAIN_IDENTITY)
 		return iova;
 
-	if (domain->type == IOMMU_DOMAIN_BLOCKED)
-		return 0;
+	if (!domain->ops->iova_to_phys_length) {
+		/* Fallback to legacy iova_to_phys without length info */
+		if (domain->ops->iova_to_phys) {
+			phys_addr_t phys = domain->ops->iova_to_phys(domain, iova);
+			if (phys && mapped_length)
+				*mapped_length = PAGE_SIZE;
+			return phys ? phys : PHYS_ADDR_MAX;
+		}
+		return PHYS_ADDR_MAX;
+	}
+
+	return domain->ops->iova_to_phys_length(domain, iova, mapped_length);
+}
+EXPORT_SYMBOL_GPL(iommu_iova_to_phys_length);
+
+phys_addr_t iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
+{
+	phys_addr_t phys = iommu_iova_to_phys_length(domain, iova, NULL);
 
-	return domain->ops->iova_to_phys(domain, iova);
+	return (phys == PHYS_ADDR_MAX) ? 0 : phys;
 }
 EXPORT_SYMBOL_GPL(iommu_iova_to_phys);
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index e587d4ac4d33..19da84c2922c 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -747,6 +747,9 @@ struct iommu_ops {
  *                         invalidation requests. The driver data structure
  *                         must be defined in include/uapi/linux/iommufd.h
  * @iova_to_phys: translate iova to physical address
+ * @iova_to_phys_length: translate iova to physical address and additionally
+ *                       return the page size of the PTE mapping at @iova
+ *                       through @mapped_length.
  * @enforce_cache_coherency: Prevent any kind of DMA from bypassing IOMMU_CACHE,
  *                           including no-snoop TLPs on PCIe or other platform
  *                           specific mechanisms.
@@ -776,6 +779,9 @@ struct iommu_domain_ops {
 
 	phys_addr_t (*iova_to_phys)(struct iommu_domain *domain,
 				    dma_addr_t iova);
+	phys_addr_t (*iova_to_phys_length)(struct iommu_domain *domain,
+					    dma_addr_t iova,
+					    size_t *mapped_length);
 
 	bool (*enforce_cache_coherency)(struct iommu_domain *domain);
 	int (*set_pgtable_quirks)(struct iommu_domain *domain,
@@ -930,6 +936,9 @@ extern ssize_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
 			    struct scatterlist *sg, unsigned int nents,
 			    int prot, gfp_t gfp);
 extern phys_addr_t iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova);
+extern phys_addr_t iommu_iova_to_phys_length(struct iommu_domain *domain,
+					      dma_addr_t iova,
+					      size_t *mapped_length);
 extern void iommu_set_fault_handler(struct iommu_domain *domain,
 			iommu_fault_handler_t handler, void *token);
 
-- 
2.43.7


