Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13141CD6E6C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zkn8atwigb0RDyBkQZl4U8k5iUnpgoKnP+BxdtigQbU=; b=bRNqY833ggGjl5r+pffqYjSzQq
	gVplHoexIignXmSktACsKJHheIfwJPZxiFN/ifDDciapV5a4QcSFNonklaWrAenyxc3C0qTE+F9Wi
	pMVuBLX/KLMD/RW3Jp1wtUKJKFZ+Rt7AnviL/iuGkdlWT3ds10VjRKVIIpn+qSo9LVg4jZtpQm/my
	8ZyCRYcxEidDbLvKBw9a0EzgklQurxRndKABaZaBHbs5I3aqsoNcZH534mexw8PjwtUE85A5Q/G5i
	5zKWI6GHI8erHV83UHtK1QHhe3m481HejuCUCus53SfRsrz5a7xEPN+JQMiH31178F0u+zFSk8rSf
	hanitFDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNK-0000000FN9D-1FnT;
	Wed, 03 Jun 2026 15:19:22 +0000
Received: from out199-6.us.a.mail.aliyun.com ([47.90.199.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnN3-0000000FMlu-3f3Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:19:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499942; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Zkn8atwigb0RDyBkQZl4U8k5iUnpgoKnP+BxdtigQbU=;
	b=tPNIvZocCmGgTPirhfZyAaDCqo65mWvGZoXWW5oZahDv8iDPKz+ERFwz0+dxtvzopOh7PzBCOqogc4RH3lo0bKyBMDlT24fqZOH+gBVM/BcycmsNSZCW83sXQGVvh28sro6TUrpIN7k36qQwmGFbS5pAEE9oUEr+CU3FVFXZm5s=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fR6P_1780499940;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fR6P_1780499940 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:19:00 +0800
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
Subject: [PATCH v3 22/32] iommu/virtio: implement iova_to_phys_length
Date: Wed,  3 Jun 2026 23:17:54 +0800
Message-ID: <20260603151804.1963871-23-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_081906_212041_B09EBB6D 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

Implement iova_to_phys_length for virtio IOMMU driver,
returning the actual PTE mapping size.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/virtio-iommu.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 587fc13197f1..b92316257e42 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -912,10 +912,11 @@ static size_t viommu_unmap_pages(struct iommu_domain *domain, unsigned long iova
 	return ret ? 0 : unmapped;
 }
 
-static phys_addr_t viommu_iova_to_phys(struct iommu_domain *domain,
-				       dma_addr_t iova)
+static phys_addr_t viommu_iova_to_phys_length(struct iommu_domain *domain,
+					      dma_addr_t iova,
+					      size_t *mapped_length)
 {
-	u64 paddr = 0;
+	u64 paddr = PHYS_ADDR_MAX;
 	unsigned long flags;
 	struct viommu_mapping *mapping;
 	struct interval_tree_node *node;
@@ -926,6 +927,9 @@ static phys_addr_t viommu_iova_to_phys(struct iommu_domain *domain,
 	if (node) {
 		mapping = container_of(node, struct viommu_mapping, iova);
 		paddr = mapping->paddr + (iova - mapping->iova.start);
+		if (mapped_length)
+			*mapped_length = mapping->iova.last -
+					 mapping->iova.start + 1;
 	}
 	spin_unlock_irqrestore(&vdomain->mappings_lock, flags);
 
@@ -1102,7 +1106,7 @@ static const struct iommu_ops viommu_ops = {
 		.attach_dev		= viommu_attach_dev,
 		.map_pages		= viommu_map_pages,
 		.unmap_pages		= viommu_unmap_pages,
-		.iova_to_phys		= viommu_iova_to_phys,
+		.iova_to_phys_length	= viommu_iova_to_phys_length,
 		.flush_iotlb_all	= viommu_flush_iotlb_all,
 		.iotlb_sync		= viommu_iotlb_sync,
 		.iotlb_sync_map		= viommu_iotlb_sync_map,
-- 
2.43.7


