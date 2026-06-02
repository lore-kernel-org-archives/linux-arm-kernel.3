Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A3BCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpeMbV0QJrpbG2MacgDJwfUmVXBgC25iS8NV+6E7fEk=; b=fD4GTSmfOyJgB7SGoy/xSC28fk
	Mn3dKoqzV/UzL3nOgnP6/NCbqErOteuEiQa8j6S+QRPXmgbkNALH0uJGRGdgmAp2DiTqwcnMmWnr+
	cvKTbSvhsXv5VqmMaoFUlO4doz9rRcguKhJ6JotK3MNowRXrK4S8+nGJg7j8+nhnYxDGys68dIIzP
	49M7dbG9R2/VFb7qiGaJBBdt481BJ1P62+iprMLe6UJjvYZ4ida5trPdk+FvHyU2KGdFeVE6YGpiY
	NGWtIIEgPv3J7BEj0C/DTHGBABVdBoiEjciJ3a22fsNJfjUVTroTNTYE0ojXMeMHfg1ZDWfX8Zzbw
	GLc+qQ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMeW-0000000CoR9-0fYY;
	Tue, 02 Jun 2026 10:47:20 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMeQ-0000000CoBw-3WrS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 10:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780397233; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=fpeMbV0QJrpbG2MacgDJwfUmVXBgC25iS8NV+6E7fEk=;
	b=A9TcC5lXde+2PQiSL5DHESwlMDNckGl3r/DnIOLNkbb0/cYvHhmTvVIukx7M9gtOOdTNCzKOYEGjDOz1xbfjgmwFv69aVcx/jUF2avme3wUY05bH34nwA2vJmRCKshZNkW3a/ly+4ysLvgRv9WIn/QXBgXn18fmbXbZHYEo/pGo=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X44E98G_1780397230;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X44E98G_1780397230 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 18:47:11 +0800
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
Subject: [PATCH v2 23/30] vfio/iommufd: use iova_to_phys_length for efficient unmap
Date: Tue,  2 Jun 2026 18:46:30 +0800
Message-ID: <20260602104637.1219810-24-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
References: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_034715_165310_1255B26A 
X-CRM114-Status: GOOD (  18.85  )
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

Use iommu_iova_to_phys_length() to get PTE page size, allowing
traversal by actual mapping granularity instead of PAGE_SIZE steps.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
Acked-by: Shiqiang Zhang <shiyu.zsq@linux.alibaba.com>
Acked-by: Simon Guo <wei.guo.simon@linux.alibaba.com>
---
 drivers/iommu/iommufd/pages.c    | 75 +++++++++++++++++++++++++++-----
 drivers/iommu/iommufd/selftest.c |  2 +-
 drivers/vfio/vfio_iommu_type1.c  | 26 ++++++++---
 3 files changed, 85 insertions(+), 18 deletions(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 9bdb2945afe1..aed05bd0b01c 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -417,17 +417,44 @@ static void batch_from_domain(struct pfn_batch *batch,
 	if (start_index == iopt_area_index(area))
 		page_offset = area->page_offset;
 	while (start_index <= last_index) {
+		size_t pgsize;
+		unsigned long npages;
+		unsigned long i;
+
 		/*
-		 * This is pretty slow, it would be nice to get the page size
-		 * back from the driver, or have the driver directly fill the
-		 * batch.
+		 * Use iova_to_phys_length to get both the physical address
+		 * and the PTE page size in a single page table walk, allowing
+		 * us to skip ahead by the contiguous region size instead of
+		 * walking the page tables for every PAGE_SIZE step.
 		 */
-		phys = iommu_iova_to_phys(domain, iova) - page_offset;
-		if (!batch_add_pfn(batch, PHYS_PFN(phys)))
-			return;
-		iova += PAGE_SIZE - page_offset;
+		phys = iommu_iova_to_phys_length(domain, iova, &pgsize);
+		if (WARN_ON(phys == PHYS_ADDR_MAX))
+			break;
+		phys -= page_offset;
+		if (WARN_ON(!pgsize || pgsize < PAGE_SIZE))
+			pgsize = PAGE_SIZE;
+
+		/*
+		 * Calculate contiguous pages within this PTE from our
+		 * position. phys points to the page-aligned start (backed
+		 * up by page_offset), so pages available = bytes from phys
+		 * to PTE end divided by PAGE_SIZE.
+		 */
+		npages = (pgsize - (iova & (pgsize - 1)) + page_offset) /
+			 PAGE_SIZE;
+		npages = min_t(unsigned long, npages,
+			       last_index - start_index + 1);
+		if (!npages)
+			npages = 1;
+
+		for (i = 0; i < npages; i++) {
+			if (!batch_add_pfn(batch, PHYS_PFN(phys) + i))
+				return;
+		}
+
+		iova += npages * PAGE_SIZE - page_offset;
 		page_offset = 0;
-		start_index++;
+		start_index += npages;
 	}
 }
 
@@ -445,11 +472,35 @@ static struct page **raw_pages_from_domain(struct iommu_domain *domain,
 	if (start_index == iopt_area_index(area))
 		page_offset = area->page_offset;
 	while (start_index <= last_index) {
-		phys = iommu_iova_to_phys(domain, iova) - page_offset;
-		*(out_pages++) = pfn_to_page(PHYS_PFN(phys));
-		iova += PAGE_SIZE - page_offset;
+		size_t pgsize;
+		unsigned long npages;
+		unsigned long i;
+
+		/*
+		 * Resolve the PTE page size together with the physical
+		 * address so we can fill multiple struct page pointers per
+		 * page table walk when the IOMMU uses large pages.
+		 */
+		phys = iommu_iova_to_phys_length(domain, iova, &pgsize);
+		if (WARN_ON(phys == PHYS_ADDR_MAX))
+			break;
+		phys -= page_offset;
+		if (WARN_ON(!pgsize || pgsize < PAGE_SIZE))
+			pgsize = PAGE_SIZE;
+
+		npages = (pgsize - (iova & (pgsize - 1)) + page_offset) /
+			 PAGE_SIZE;
+		npages = min_t(unsigned long, npages,
+			       last_index - start_index + 1);
+		if (!npages)
+			npages = 1;
+
+		for (i = 0; i < npages; i++)
+			*(out_pages++) = pfn_to_page(PHYS_PFN(phys) + i);
+
+		iova += npages * PAGE_SIZE - page_offset;
 		page_offset = 0;
-		start_index++;
+		start_index += npages;
 	}
 	return out_pages;
 }
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index af07c642a526..4b9c3ffc9523 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -1214,7 +1214,7 @@ static int iommufd_test_md_check_pa(struct iommufd_ucmd *ucmd,
 		pfn = page_to_pfn(pages[0]);
 		put_page(pages[0]);
 
-		io_phys = mock->domain.ops->iova_to_phys(&mock->domain, iova);
+		io_phys = iommu_iova_to_phys(&mock->domain, iova);
 		if (io_phys !=
 		    pfn * PAGE_SIZE + ((uintptr_t)uptr % PAGE_SIZE)) {
 			rc = -EINVAL;
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index c8151ba54de3..c86315b1fcda 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -1177,25 +1177,41 @@ static long vfio_unmap_unpin(struct vfio_iommu *iommu, struct vfio_dma *dma,
 
 	iommu_iotlb_gather_init(&iotlb_gather);
 	while (pos < dma->size) {
-		size_t unmapped, len;
+		size_t unmapped, len, pgsize;
 		phys_addr_t phys, next;
 		dma_addr_t iova = dma->iova + pos;
 
-		phys = iommu_iova_to_phys(domain->domain, iova);
-		if (WARN_ON(!phys)) {
+		/* Single page table walk returns both phys and PTE size */
+		phys = iommu_iova_to_phys_length(domain->domain, iova,
+						  &pgsize);
+		if (WARN_ON(phys == PHYS_ADDR_MAX)) {
 			pos += PAGE_SIZE;
 			continue;
 		}
+		if (WARN_ON(!pgsize || pgsize < PAGE_SIZE))
+			pgsize = PAGE_SIZE;
 
 		/*
 		 * To optimize for fewer iommu_unmap() calls, each of which
 		 * may require hardware cache flushing, try to find the
 		 * largest contiguous physical memory chunk to unmap.
+		 *
+		 * Calculate remaining contiguous bytes within this PTE from
+		 * our position, then try to join following physically
+		 * contiguous PTEs.
 		 */
-		for (len = PAGE_SIZE; pos + len < dma->size; len += PAGE_SIZE) {
-			next = iommu_iova_to_phys(domain->domain, iova + len);
+		len = pgsize - (iova & (pgsize - 1));
+		for (; pos + len < dma->size; ) {
+			size_t next_pgsize;
+
+			next = iommu_iova_to_phys_length(domain->domain,
+							  iova + len,
+							  &next_pgsize);
 			if (next != phys + len)
 				break;
+			if (WARN_ON(!next_pgsize || next_pgsize < PAGE_SIZE))
+				next_pgsize = PAGE_SIZE;
+			len += next_pgsize;
 		}
 
 		/*
-- 
2.43.7


