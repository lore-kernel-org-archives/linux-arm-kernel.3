Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A688CD6E68
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4l5Y0trE0yKZKVwzh0g8Q2sXJKWMQOzssN47hgN7EY=; b=nn7/Sxv/cGsBnpERsfQZcZYPc+
	XGoNH6q3ugYH6IEd+qnb7UDUUmJcG/h4275olHzQ6KUKAXAm0Q+UxcWHSmiXV02aVGxqUJscLCAtY
	jj9umJQR17CRIqQVE7d+SuzO8Nwyd4J1VLYfX+aimi0jpzsJ73fd5F78oZLxujYUolOgKRyHEhW2x
	5HSg3UCLuShrQ5vQu86BkKfWX5nhaPZf5+8ArKGHo+jCpIesPF1XbVtmcw5g6g65zjieXPzc56Dbu
	4oGcrUnw5A4nzw+FLfVK8UkIWhuUxdqNiNEjfxuDnWrVja2MQP+SyS52TMjEnxum1KzOfZ9W4D/3p
	BMV0OLaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMeV-0000000CoQU-3m3b;
	Tue, 02 Jun 2026 10:47:19 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMeO-0000000Co5C-10vD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 10:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780397230; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=i4l5Y0trE0yKZKVwzh0g8Q2sXJKWMQOzssN47hgN7EY=;
	b=luRRR9q1uOBbZ5Kdku++wEQ99Zx6VVvL8obWvaJYfL2yDUfTEUqI0uokgfdNT+KFWWB3HMR7ylXfS7yumFvA3cUiL/cwq8ErRRBtQ9b7pNNpYUJxv9LT3IkMOWuUjUEavUETI70JV4H6yimOSQk3ARUI65VTnjY47BTq7Rkp7L4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R871e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X44E97Y_1780397227;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X44E97Y_1780397227 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 18:47:08 +0800
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
Subject: [PATCH v2 20/30] iommu/sun50i: implement iova_to_phys_length
Date: Tue,  2 Jun 2026 18:46:27 +0800
Message-ID: <20260602104637.1219810-21-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
References: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_034712_690416_738B0E39 
X-CRM114-Status: UNSURE (   9.44  )
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

Implement iova_to_phys_length for sun50i IOMMU driver,
returning the actual PTE mapping size.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/sun50i-iommu.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index be3f1ce696ba..dcd7d926886a 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -659,23 +659,30 @@ static size_t sun50i_iommu_unmap(struct iommu_domain *domain, unsigned long iova
 	return SZ_4K;
 }
 
-static phys_addr_t sun50i_iommu_iova_to_phys(struct iommu_domain *domain,
-					     dma_addr_t iova)
+static phys_addr_t sun50i_iommu_iova_to_phys_length(struct iommu_domain *domain,
+						    dma_addr_t iova,
+						    size_t *mapped_length)
 {
 	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
 	phys_addr_t pt_phys;
 	u32 *page_table;
 	u32 dte, pte;
 
+	if (mapped_length)
+		*mapped_length = 0;
+
 	dte = sun50i_domain->dt[sun50i_iova_get_dte_index(iova)];
 	if (!sun50i_dte_is_pt_valid(dte))
-		return 0;
+		return PHYS_ADDR_MAX;
 
 	pt_phys = sun50i_dte_get_pt_address(dte);
 	page_table = (u32 *)phys_to_virt(pt_phys);
 	pte = page_table[sun50i_iova_get_pte_index(iova)];
 	if (!sun50i_pte_is_page_valid(pte))
-		return 0;
+		return PHYS_ADDR_MAX;
+
+	if (mapped_length)
+		*mapped_length = SZ_4K;
 
 	return sun50i_pte_get_page_address(pte) +
 		sun50i_iova_get_page_offset(iova);
@@ -857,7 +864,7 @@ static const struct iommu_ops sun50i_iommu_ops = {
 		.flush_iotlb_all = sun50i_iommu_flush_iotlb_all,
 		.iotlb_sync_map = sun50i_iommu_iotlb_sync_map,
 		.iotlb_sync	= sun50i_iommu_iotlb_sync,
-		.iova_to_phys	= sun50i_iommu_iova_to_phys,
+		.iova_to_phys_length	= sun50i_iommu_iova_to_phys_length,
 		.map_pages	= sun50i_iommu_map,
 		.unmap_pages	= sun50i_iommu_unmap,
 		.free		= sun50i_iommu_domain_free,
-- 
2.43.7


