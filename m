Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A95CD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqg8jVUeg5vulwkVyAexMfFQNB/RSusVVmcIuPE1fjY=; b=vN66UL+97G3vZgqYSLr8Smw3dm
	Mn+fjH0YYX/8qK9yNqsY2J9xQgG1oAbtS63QVI0P32fTApugTNo4WylP4LZTdLGI6jKIB8nmGRWAo
	arebCQRlKICW6/5cuyZ/A8mfERJ97E5Yt7f3ERBXk3U0uHxYhyMuF7Nfw0CVSj3nsZDd4RUtK02TC
	qzk6o9AMgiLClSSVQ9KzntZ3Pus2CgCxBwEkvpuuyFydVVLJThHHgDnFxUnk0oENCUiSH1I3WErej
	2CuAyBEgwCjWbug5gRC/yxn6vIDWUqp1ZF/ukka0IP36ek9kgsFX+ZQfZ6sB3yZndr71bWEcvhti/
	czyecvkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnMt-0000000FMeA-3TtB;
	Wed, 03 Jun 2026 15:18:55 +0000
Received: from out199-7.us.a.mail.aliyun.com ([47.90.199.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnMq-0000000FMZD-3fWd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:18:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499929; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=iqg8jVUeg5vulwkVyAexMfFQNB/RSusVVmcIuPE1fjY=;
	b=wlrj/QCl4uqYTmkmTP/HFsqX20vKedbg8j90oHKDjmfdoN0+qV2WNDTfapCLF2xMpLMcsKsrHvCE7HNFdjVbjSewIViVC+Ps1UsQ39a9v1VqUfcjRg/hnG9oE7JLPUxkeil6r/nyQIwYarDBcnHw5yMCUUxaocCfg6BkYvpFKAU=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R851e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fR2c_1780499926;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fR2c_1780499926 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:18:46 +0800
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
Subject: [PATCH v3 08/32] iommu/qcom_iommu: implement iova_to_phys_length
Date: Wed,  3 Jun 2026 23:17:40 +0800
Message-ID: <20260603151804.1963871-9-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_081853_200086_F346A8C6 
X-CRM114-Status: UNSURE (   9.09  )
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

Migrate Qualcomm IOMMU to implement iova_to_phys_length, calling
ops->iova_to_phys_length on the io-pgtable layer.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index a1e8cf29f594..9e0e8b5caec1 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -489,19 +489,20 @@ static void qcom_iommu_iotlb_sync(struct iommu_domain *domain,
 	qcom_iommu_flush_iotlb_all(domain);
 }
 
-static phys_addr_t qcom_iommu_iova_to_phys(struct iommu_domain *domain,
-					   dma_addr_t iova)
+static phys_addr_t qcom_iommu_iova_to_phys_length(struct iommu_domain *domain,
+					   dma_addr_t iova, size_t *mapped_length)
 {
 	phys_addr_t ret;
 	unsigned long flags;
 	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
 	struct io_pgtable_ops *ops = qcom_domain->pgtbl_ops;
 
+
 	if (!ops)
-		return 0;
+		return PHYS_ADDR_MAX;
 
 	spin_lock_irqsave(&qcom_domain->pgtbl_lock, flags);
-	ret = ops->iova_to_phys(ops, iova);
+	ret = ops->iova_to_phys_length(ops, iova, mapped_length);
 	spin_unlock_irqrestore(&qcom_domain->pgtbl_lock, flags);
 
 	return ret;
@@ -602,7 +603,7 @@ static const struct iommu_ops qcom_iommu_ops = {
 		.unmap_pages	= qcom_iommu_unmap,
 		.flush_iotlb_all = qcom_iommu_flush_iotlb_all,
 		.iotlb_sync	= qcom_iommu_iotlb_sync,
-		.iova_to_phys	= qcom_iommu_iova_to_phys,
+		.iova_to_phys_length = qcom_iommu_iova_to_phys_length,
 		.free		= qcom_iommu_domain_free,
 	}
 };
-- 
2.43.7


