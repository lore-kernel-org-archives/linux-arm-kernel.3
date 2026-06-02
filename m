Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E55BCD6E6A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6uvMZHAmHwSUWc23cUrxXysIDcjk6iA/ZFsUBabgTo=; b=Z/V1fPtjxM7NTdCdPAKUQVXmGf
	BYPxo8nF3Yjwh/kPPlnOTk+yCCTSVkSSdX3DyNBeoC0lWP0ENSkObSbB00Ko9Ple3GBdhviE+7VF+
	EhRCgBgUEI27VgUIbJb0ELXCqkvWXxFbswBvE09qxxBLptKOaatALhQyjSjpwIgvYGkcZO2wXtagu
	+DzuZa+h8M0lV+UjLMg6ZHvEX3ffd+XH3EB/z4Q6/QE6+WxzPJ8YlRUUzJ81U32cV4LkGG+sxzrNQ
	aDc11y5XqqVP8yFT3VulV7WNShglGstZjNzTvoWH9QrmEETkXnOHXUQvbvJqc5MI0013CIzMARai9
	v0E6c9IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMeO-0000000Co8r-15Wm;
	Tue, 02 Jun 2026 10:47:12 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMeJ-0000000Cnvl-3lGm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 10:47:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780397225; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Z6uvMZHAmHwSUWc23cUrxXysIDcjk6iA/ZFsUBabgTo=;
	b=uU/UwPX+OqIT/ZJZcHd0yyCL2I8b4siMCDF7NjS2939BP43ifjsFd1vzLMy5wzgqQccOoerHBTLTq+QgBeLeX97C04rfVVY7kf2sgDs5HCAoYGmBYIbeq7qm3jQHynoTiZfKOOelBdZyQfB2ZHQJrB1DL2tJFBnJRfZ+OFPUs/Q=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R411e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X44E95v_1780397222;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X44E95v_1780397222 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 18:47:02 +0800
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
Subject: [PATCH v2 15/30] iommu/mtk_v1: implement iova_to_phys_length
Date: Tue,  2 Jun 2026 18:46:22 +0800
Message-ID: <20260602104637.1219810-16-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
References: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_034708_110703_EB92FA90 
X-CRM114-Status: UNSURE (   9.27  )
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

Implement iova_to_phys_length for MediaTek v1 IOMMU driver,
returning the actual PTE mapping size.
Also fix pre-existing bug: add page offset to physical address.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/mtk_iommu_v1.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index ac97dd2868d4..8733b87c9b94 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -393,17 +393,29 @@ static size_t mtk_iommu_v1_unmap(struct iommu_domain *domain, unsigned long iova
 	return size;
 }
 
-static phys_addr_t mtk_iommu_v1_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
+static phys_addr_t mtk_iommu_v1_iova_to_phys_length(struct iommu_domain *domain,
+						    dma_addr_t iova,
+						    size_t *mapped_length)
 {
 	struct mtk_iommu_v1_domain *dom = to_mtk_domain(domain);
 	unsigned long flags;
 	phys_addr_t pa;
 
+	if (mapped_length)
+		*mapped_length = 0;
+
 	spin_lock_irqsave(&dom->pgtlock, flags);
 	pa = *(dom->pgt_va + (iova >> MT2701_IOMMU_PAGE_SHIFT));
 	pa = pa & (~(MT2701_IOMMU_PAGE_SIZE - 1));
 	spin_unlock_irqrestore(&dom->pgtlock, flags);
 
+	if (!pa)
+		return PHYS_ADDR_MAX;
+
+	pa |= (iova & (MT2701_IOMMU_PAGE_SIZE - 1));
+	if (mapped_length)
+		*mapped_length = MT2701_IOMMU_PAGE_SIZE;
+
 	return pa;
 }
 
@@ -590,7 +602,7 @@ static const struct iommu_ops mtk_iommu_v1_ops = {
 		.attach_dev	= mtk_iommu_v1_attach_device,
 		.map_pages	= mtk_iommu_v1_map,
 		.unmap_pages	= mtk_iommu_v1_unmap,
-		.iova_to_phys	= mtk_iommu_v1_iova_to_phys,
+		.iova_to_phys_length = mtk_iommu_v1_iova_to_phys_length,
 		.free		= mtk_iommu_v1_domain_free,
 	}
 };
-- 
2.43.7


