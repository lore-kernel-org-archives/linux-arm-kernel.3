Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DA4CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1W+5Ep21JWFXb6Ndt1YmG74jhLb+YQ1K8PBTluefHNE=; b=1SCBXAL2wsZyc7XTdW1m8O9uG6
	oQ0MiiQpcmP6I9wFUuuH0OoWbs49VcvgjvjsLqCxY9X3px3TyV3AgnmN6hKgxmvMCqGvlMSeySgNC
	ERSZUUYSWD3jUHi6HfzkOOu6+M9rb+TFJKw4EWhFP8WtNyuGuPdpgJyx+H0sdA62QRUEsrUYBsI1E
	OOuDKiM5ccnelo98HlioKNC25ddBM4rt03oBFSRn8hpfIFWdQSWJw/wXMK8dTyVqX3gNZcJ0SgFhX
	FPPNdj53Oz1INGN1hswZS935V0FwBCk5DeyL7VYTcPIyDFB5YnP5g+1urNs6/8kd7fKu8uGK8LzMw
	IrVSVp3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMeO-0000000CoAd-3e57;
	Tue, 02 Jun 2026 10:47:12 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMeK-0000000CnxM-23Kh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 10:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780397226; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=1W+5Ep21JWFXb6Ndt1YmG74jhLb+YQ1K8PBTluefHNE=;
	b=DZgFlnbTVUdtuGeuyeZsIVI8dGzkpudPP1Tz2ahWLxTwcUq0ILnPGtRSIQqic3RGaNdfmm6AeA9tOf/8+/6ZYmk28PtzhBN+SPZpBUvK987fMuESoAOWWwIwwi9sc/ECSDNG77+zJjEAf0mtokfNGi3iK6P1Y1RyUjFYfmSXgJE=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X44E96b_1780397224;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X44E96b_1780397224 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 18:47:04 +0800
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
Subject: [PATCH v2 17/30] iommu/rockchip: implement iova_to_phys_length
Date: Tue,  2 Jun 2026 18:46:24 +0800
Message-ID: <20260602104637.1219810-18-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
References: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_034708_703825_0CBF1B2C 
X-CRM114-Status: UNSURE (   9.82  )
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

Implement iova_to_phys_length for Rockchip IOMMU driver,
returning the actual PTE mapping size.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/rockchip-iommu.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 0013cf196c57..5bae28a123c1 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -648,15 +648,18 @@ static irqreturn_t rk_iommu_irq(int irq, void *dev_id)
 	return ret;
 }
 
-static phys_addr_t rk_iommu_iova_to_phys(struct iommu_domain *domain,
-					 dma_addr_t iova)
+static phys_addr_t rk_iommu_iova_to_phys_length(struct iommu_domain *domain,
+					 dma_addr_t iova, size_t *mapped_length)
 {
 	struct rk_iommu_domain *rk_domain = to_rk_domain(domain);
 	unsigned long flags;
-	phys_addr_t pt_phys, phys = 0;
+	phys_addr_t pt_phys, phys = PHYS_ADDR_MAX;
 	u32 dte, pte;
 	u32 *page_table;
 
+	if (mapped_length)
+		*mapped_length = 0;
+
 	spin_lock_irqsave(&rk_domain->dt_lock, flags);
 
 	dte = rk_domain->dt[rk_iova_dte_index(iova)];
@@ -670,6 +673,8 @@ static phys_addr_t rk_iommu_iova_to_phys(struct iommu_domain *domain,
 		goto out;
 
 	phys = rk_ops->pt_address(pte) + rk_iova_page_offset(iova);
+	if (mapped_length)
+		*mapped_length = SPAGE_SIZE;
 out:
 	spin_unlock_irqrestore(&rk_domain->dt_lock, flags);
 
@@ -1187,7 +1192,7 @@ static const struct iommu_ops rk_iommu_ops = {
 		.attach_dev	= rk_iommu_attach_device,
 		.map_pages	= rk_iommu_map,
 		.unmap_pages	= rk_iommu_unmap,
-		.iova_to_phys	= rk_iommu_iova_to_phys,
+		.iova_to_phys_length = rk_iommu_iova_to_phys_length,
 		.free		= rk_iommu_domain_free,
 	}
 };
-- 
2.43.7


