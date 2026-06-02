Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A002CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2FkFXQRJe1ip/Bfwjl6wzc4k8wooDcGScTFrXf8jIU=; b=SvdzwYdmWff82S4qUXClkcSvq3
	I2GiqIfC1ZotjhHHMBh9516aSzfckUIRk5Dx6k/bfCtWvHHRRxfIikRzxzmcRqGQoHUXyY56bPdSN
	eOkOrIUUtP+0VUGfDF/DwiAVtUZr0lgOLGfFk9n2b1rRCqcv5gJdkvKBqt98yQm5otiRYlLncRaYM
	8Nf/NYqPO6BqyJZ65Xe8KjW2ruCIiMjeZgxe9KuD/FgWARHowTjetem9WOxpg64HvZcFLwGLjCX0j
	lMUSnb2wVKMGs7KBfTMO5JOS4RNA1xclLXlbxhQggcaFklKs57Ol5PU0r/Y4DdOUPvvAsVfjeNU3i
	ousvNFBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMeK-0000000Co1g-3amD;
	Tue, 02 Jun 2026 10:47:08 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMeI-0000000CnuD-3MYJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 10:47:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780397224; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=U2FkFXQRJe1ip/Bfwjl6wzc4k8wooDcGScTFrXf8jIU=;
	b=R4sTV9GyUbUBKBBHLtVN3dZK2qR/lN5NwgKGofU2SrOczhneET2K3VoD8AUVhnGLWiZOSeQZSXLPk5b6tYBrKcjyCThp/m7nhjVxbsI5+M0tV6UVE2IKnh6YxHX04YK3luY2eO7osNM5GB9RYB2r4eHECtLwOGnxUTtRoQB/NTI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X44E94h_1780397218;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X44E94h_1780397218 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 18:46:58 +0800
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
Subject: [PATCH v2 11/30] iommu/mtk_iommu: implement iova_to_phys_length
Date: Tue,  2 Jun 2026 18:46:18 +0800
Message-ID: <20260602104637.1219810-12-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
References: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_034707_036041_6DAC66BC 
X-CRM114-Status: UNSURE (   9.41  )
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

Migrate MediaTek IOMMU to implement iova_to_phys_length, passing through
mapped_length from io-pgtable.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/mtk_iommu.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 2be990c108de..58125f029214 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -858,13 +858,19 @@ static int mtk_iommu_sync_map(struct iommu_domain *domain, unsigned long iova,
 	return 0;
 }
 
-static phys_addr_t mtk_iommu_iova_to_phys(struct iommu_domain *domain,
-					  dma_addr_t iova)
+static phys_addr_t mtk_iommu_iova_to_phys_length(struct iommu_domain *domain,
+					  dma_addr_t iova, size_t *mapped_length)
 {
 	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
 	phys_addr_t pa;
 
-	pa = dom->iop->iova_to_phys(dom->iop, iova);
+	if (mapped_length)
+		*mapped_length = 0;
+
+	pa = dom->iop->iova_to_phys_length(dom->iop, iova, mapped_length);
+	if (pa == PHYS_ADDR_MAX)
+		return PHYS_ADDR_MAX;
+
 	if (IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT) &&
 	    dom->bank->parent_data->enable_4GB &&
 	    pa >= MTK_IOMMU_4GB_MODE_REMAP_BASE)
@@ -1070,7 +1076,7 @@ static const struct iommu_ops mtk_iommu_ops = {
 		.flush_iotlb_all = mtk_iommu_flush_iotlb_all,
 		.iotlb_sync	= mtk_iommu_iotlb_sync,
 		.iotlb_sync_map	= mtk_iommu_sync_map,
-		.iova_to_phys	= mtk_iommu_iova_to_phys,
+		.iova_to_phys_length = mtk_iommu_iova_to_phys_length,
 		.free		= mtk_iommu_domain_free,
 	}
 };
-- 
2.43.7


