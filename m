Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D859ACD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4BjT23R8uSreRxsom16Fm8xCEovN+6PRTMHyPqG167s=; b=1YER4+3HUOW072Ah/5Yi6pcMMI
	k2vq4xT7Wn0TktrhN+erkUqLLzNVSlqKf4VnJoAOBcUIRN44Ous5jhrZRDasi3yzMS2hDt1hRh3YV
	yYeFkIYxmJbTRI/71OKP2e8nv2Tnh5FmUTbszNwNIgdr67yBsl0S/rpaU+HOBZGyvYEKr4Hs7Uug7
	Zy4+4Yh9XxMIktqKhhYA9IgPJ6/XBHYuflAjAXqoNj/+ywhUZMSniuD4ks2v7vT40av5i8Vae56KG
	YAswWOGshm+6abfhlfjXcGNAf5UiqvglPqV2a3aK25gD+P3arL+OOYrMi9aoOvxJ5MbTpmSrURZzb
	SOGMNkRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNK-0000000FN9e-1uJ6;
	Wed, 03 Jun 2026 15:19:22 +0000
Received: from out199-6.us.a.mail.aliyun.com ([47.90.199.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnN6-0000000FMrd-3ZAE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499945; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=4BjT23R8uSreRxsom16Fm8xCEovN+6PRTMHyPqG167s=;
	b=Q/xHi9VtpAOeWiQCNd6WUGDprjUaTGCg2YsjbgdYQCfc3x5kt8n2oK577LleGtZZ8e0FJff/MNx1yOF72o1WzTmbD1IelpK7Veqsa1T/U0AvKLOEAeiBAr3ZpC3EFx3qYmOdlrbuFe09VBUVDKEpylrFaVSFN6t0Cy38h+fBQFI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fR6t_1780499942;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fR6t_1780499942 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:19:02 +0800
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
Subject: [PATCH v3 24/32] iommufd: use iova_to_phys_length for efficient unmap
Date: Wed,  3 Jun 2026 23:17:56 +0800
Message-ID: <20260603151804.1963871-25-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_081909_181140_6B6ECEA2 
X-CRM114-Status: GOOD (  15.30  )
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

Use iommu_iova_to_phys_length() to get PTE page size in
batch_from_domain and raw_pages_from_domain, allowing traversal
by actual mapping granularity instead of PAGE_SIZE steps.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
Acked-by: Shiqiang Zhang <shiyu.zsq@linux.alibaba.com>
Acked-by: Simon Guo <wei.guo.simon@linux.alibaba.com>
---
 drivers/iommu/iommufd/pages.c | 74 +++++++++++++++++++++++++++++------
 1 file changed, 62 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 9bdb2945afe1..40a2fe9adf9c 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -417,17 +417,42 @@ static void batch_from_domain(struct pfn_batch *batch,
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
+		 * and the contiguous mapped length in a single page table
+		 * walk, allowing us to skip ahead by the contiguous region
+		 * size instead of walking page tables for every PAGE_SIZE.
+		 * Query at page-aligned iova so pgsize covers from page start.
 		 */
-		phys = iommu_iova_to_phys(domain, iova) - page_offset;
-		if (!batch_add_pfn(batch, PHYS_PFN(phys)))
-			return;
-		iova += PAGE_SIZE - page_offset;
+		phys = iommu_iova_to_phys_length(domain, iova - page_offset,
+						  &pgsize);
+		if (WARN_ON(phys == PHYS_ADDR_MAX))
+			break;
+		if (WARN_ON(!pgsize || pgsize < PAGE_SIZE))
+			pgsize = PAGE_SIZE;
+
+		/*
+		 * pgsize is the contiguous length from the page-aligned
+		 * iova, so npages is simply pgsize / PAGE_SIZE.
+		 */
+		npages = pgsize / PAGE_SIZE;
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
 
@@ -445,11 +470,36 @@ static struct page **raw_pages_from_domain(struct iommu_domain *domain,
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
+		 * Resolve the contiguous mapped length together with the
+		 * physical address so we can fill multiple struct page
+		 * pointers per page table walk when the IOMMU uses large
+		 * pages. Query at page-aligned iova so pgsize covers from
+		 * page start.
+		 */
+		phys = iommu_iova_to_phys_length(domain, iova - page_offset,
+						  &pgsize);
+		if (WARN_ON(phys == PHYS_ADDR_MAX))
+			break;
+		if (WARN_ON(!pgsize || pgsize < PAGE_SIZE))
+			pgsize = PAGE_SIZE;
+
+		npages = pgsize / PAGE_SIZE;
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
-- 
2.43.7


