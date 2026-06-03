Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF940CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJzhUSXQOrQUE0UGHOvEP1KaaarZmdkx5L7WKtuiYsw=; b=I6gM/ppR8XJqLewbZyMYhJUFzU
	BWLFG8eAwQ4fWL17AzfvQZdtrkKEl1nEMtJZMvdropMicEeaPkxbbXQ6tGugrlm9UZdjh1v4RSXNJ
	5A9b+kNv6QaVYl/I3BcShXXtFAmRO1ppR5yBjwoAqrMoYmy7SITPKzApkvIbI3/e4TMKa8Oeb1vt4
	p0hdhFO2eYNWmc0i0uBbO3j+wA3xQ2EYVB2gJ95WNzztHBw7qDrZm+Rwui8aW+hmfo/CmU924lSPk
	1YHZ47G3VWkaqNuhO1viT1/4G3d8LI31IL4PFtGqqQFix+4dVl4aGc/e9+A459AHiC/iqedRGp0S2
	cEmVgRxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnMt-0000000FMdS-1ynJ;
	Wed, 03 Jun 2026 15:18:55 +0000
Received: from out199-11.us.a.mail.aliyun.com ([47.90.199.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnMp-0000000FMXW-1WyF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499926; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=IJzhUSXQOrQUE0UGHOvEP1KaaarZmdkx5L7WKtuiYsw=;
	b=LtJh5lGjrD8ZKTIce8lBbWmibZkB3KCokZuabKs/dib3WidEnN+iuOx59e5piFD+B2CtLy2xlvMdhEvJgwuxCd24tsKM66qjiD0xrCmvPWMedCNVAmh3Kh/YIULyzJblPSe0hZ6X4R2sdL/C51iIkEaLz8ObmrChodZBJ7yGlH4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R321e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fR0u_1780499919;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fR0u_1780499919 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:18:39 +0800
From: Guanghui Feng <guanghuifeng@linux.alibaba.com>
To: jgg@ziepe.ca
Cc: adrian.larumbe@collabora.com,
	airlied@gmail.com,
	alex@shazbot.org,
	alikernel-developer@linux.alibaba.com,
	baolu.lu@linux.intel.com,
	boris.brezillon@collabora.com,
	dri-devel@lists.freedesktop.org,
	dwmw2@infradead.org,
	iommu@lists.linux.dev,
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
Subject: [PATCH v3 01/32] iommu: introduce iova_to_phys_length in iommu_domain_ops
Date: Wed,  3 Jun 2026 23:17:33 +0800
Message-ID: <20260603151804.1963871-2-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_081851_772686_F08AAB2D 
X-CRM114-Status: GOOD (  14.47  )
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
 drivers/iommu/iommu.c | 50 ++++++++++++++++++++++++++++++++++++++-----
 include/linux/iommu.h |  9 ++++++++
 2 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index d1a9e713d3a0..320ea13488e7 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2545,15 +2545,55 @@ void iommu_detach_group(struct iommu_domain *domain, struct iommu_group *group)
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
+ * Return: The physical address for the given IOVA, or PHYS_ADDR_MAX if no
+ *         translation exists.
+ */
+phys_addr_t iommu_iova_to_phys_length(struct iommu_domain *domain,
+				       dma_addr_t iova,
+				       size_t *mapped_length)
 {
-	if (domain->type == IOMMU_DOMAIN_IDENTITY)
+	phys_addr_t phys;
+
+	if (domain->type == IOMMU_DOMAIN_IDENTITY) {
+		if (mapped_length)
+			*mapped_length = PAGE_SIZE;
 		return iova;
+	}
 
-	if (domain->type == IOMMU_DOMAIN_BLOCKED)
-		return 0;
+	if (mapped_length)
+		*mapped_length = 0;
+
+	if (domain->ops->iova_to_phys_length)
+		return domain->ops->iova_to_phys_length(domain, iova, mapped_length);
+
+	/* Fallback to legacy iova_to_phys without length info */
+	if (!domain->ops->iova_to_phys)
+		return PHYS_ADDR_MAX;
+
+	phys = domain->ops->iova_to_phys(domain, iova);
+	if (!phys)
+		return PHYS_ADDR_MAX;
+
+	if (mapped_length)
+		*mapped_length = PAGE_SIZE;
+	return phys;
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


