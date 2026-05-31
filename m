Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870D3CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 09:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMFLtmgtJGc7Xa/wXUQPOkhxPbCISpIgLbRDfLPPgtk=; b=pTWHVQKSAcrMSOwIIwZRyrE7t5
	ITY76OUww4NiQIRux8pSMseAA/r0a3aY8x/A1D7Aec6caKVYGNgkO5S59o8Dxyr888fHon9d9jLMY
	io38QiUNPM/WpLziIAD4ry7lyIiYLsBpi+KGpiNpk9Ym/YuobQz5ccdJnqWKvnTrQoKYelK1wJw76
	1gqLDcLyvVHV0ttF63T9fqmVhNln3yngVsZK1oBzvEIE/wvqhfT+q6tJN0VrWFky8yrjCAuNIYgS1
	l5oZZ5aHgvccmp8yZtBNnZv87gT4EPM3trcQkBD/8auCplrYmu+FTFvivfzeL73ma8PQ4gXb43sPK
	SsU701Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcbV-00000009R4A-3MtI;
	Sun, 31 May 2026 09:37:09 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcbL-00000009Qx6-16EP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 09:37:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780220213; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=fMFLtmgtJGc7Xa/wXUQPOkhxPbCISpIgLbRDfLPPgtk=;
	b=enwilelAIzJLmS5N3NWg548ZJFOiDHUNFbGWTJ1auiaskZBSeVTJAdUtzHI1RjKFb77Oh7qBdo+xqVRORaaFy+0NP6IVfTTfgbuaY9u9ILOYdPARHOWDY+tCs3YrcO9JgPCGLNHMDULi682PUgxi92a+3r4SDyPciLGDaSHhDLE=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0X3tRVpg_1780220210;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X3tRVpg_1780220210 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 31 May 2026 17:36:50 +0800
From: Guanghui Feng <guanghuifeng@linux.alibaba.com>
To: boris.brezillon@collabora.com,
	robh@kernel.org,
	steven.price@arm.com,
	adrian.larumbe@collabora.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	liviu.dudau@arm.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	alex@shazbot.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	baolu.lu@linux.intel.com,
	suravee.suthikulpanit@amd.com,
	dwmw2@infradead.org
Cc: xlpang@linux.alibaba.com,
	oliver.yang@linux.alibaba.com,
	shiyu.zsq@linux.alibaba.com,
	wei.guo.simon@linux.alibaba.com
Subject: [PATCH 4/9] iommu/arm-smmu: implement iova_to_phys_length
Date: Sun, 31 May 2026 17:36:32 +0800
Message-ID: <20260531093637.3893199-5-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
References: <20260529115116.GR2487554@ziepe.ca>
 <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_023659_640889_FD137399 
X-CRM114-Status: GOOD (  10.82  )
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

Migrate ARM SMMU drivers to implement iova_to_phys_length, calling
ops->iova_to_phys_length on the io-pgtable layer to get both phys
and PTE page size.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
Acked-by: Shiqiang Zhang <shiyu.zsq@linux.alibaba.com>
Acked-by: Simon Guo <wei.guo.simon@linux.alibaba.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c      | 10 +++++++---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c            | 13 ++++++++-----
 drivers/iommu/arm/arm-smmu/qcom_iommu.c          | 11 +++++++----
 4 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index e8d7dbe495f0..c9f356c75bc5 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4069,14 +4069,18 @@ static void arm_smmu_iotlb_sync(struct iommu_domain *domain,
 }
 
 static phys_addr_t
-arm_smmu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
+arm_smmu_iova_to_phys_length(struct iommu_domain *domain, dma_addr_t iova,
+			     size_t *mapped_length)
 {
 	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
 
+	if (mapped_length)
+		*mapped_length = 0;
+
 	if (!ops)
 		return 0;
 
-	return ops->iova_to_phys(ops, iova);
+	return ops->iova_to_phys_length(ops, iova, mapped_length);
 }
 
 static struct platform_driver arm_smmu_driver;
@@ -4396,7 +4400,7 @@ static const struct iommu_ops arm_smmu_ops = {
 		.unmap_pages		= arm_smmu_unmap_pages,
 		.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
 		.iotlb_sync		= arm_smmu_iotlb_sync,
-		.iova_to_phys		= arm_smmu_iova_to_phys,
+		.iova_to_phys_length	= arm_smmu_iova_to_phys_length,
 		.free			= arm_smmu_domain_free_paging,
 	}
 };
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
index 65e0ef6539fe..4fd01341157f 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
@@ -415,7 +415,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 		return IRQ_HANDLED;
 	}
 
-	phys_soft = ops->iova_to_phys(ops, cfi.iova);
+	phys_soft = ops->iova_to_phys_length(ops, cfi.iova, NULL);
 
 	tmp = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
 				 cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 0bd21d206eb3..e29e0ea12f24 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1366,7 +1366,7 @@ static phys_addr_t arm_smmu_iova_to_phys_hard(struct iommu_domain *domain,
 			"iova to phys timed out on %pad. Falling back to software table walk.\n",
 			&iova);
 		arm_smmu_rpm_put(smmu);
-		return ops->iova_to_phys(ops, iova);
+		return ops->iova_to_phys_length(ops, iova, NULL);
 	}
 
 	phys = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_PAR);
@@ -1384,12 +1384,15 @@ static phys_addr_t arm_smmu_iova_to_phys_hard(struct iommu_domain *domain,
 	return addr;
 }
 
-static phys_addr_t arm_smmu_iova_to_phys(struct iommu_domain *domain,
-					dma_addr_t iova)
+static phys_addr_t arm_smmu_iova_to_phys_length(struct iommu_domain *domain,
+					dma_addr_t iova, size_t *mapped_length)
 {
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct io_pgtable_ops *ops = smmu_domain->pgtbl_ops;
 
+	if (mapped_length)
+		*mapped_length = 0;
+
 	if (!ops)
 		return 0;
 
@@ -1397,7 +1400,7 @@ static phys_addr_t arm_smmu_iova_to_phys(struct iommu_domain *domain,
 			smmu_domain->stage == ARM_SMMU_DOMAIN_S1)
 		return arm_smmu_iova_to_phys_hard(domain, iova);
 
-	return ops->iova_to_phys(ops, iova);
+	return ops->iova_to_phys_length(ops, iova, mapped_length);
 }
 
 static bool arm_smmu_capable(struct device *dev, enum iommu_cap cap)
@@ -1652,7 +1655,7 @@ static const struct iommu_ops arm_smmu_ops = {
 		.unmap_pages		= arm_smmu_unmap_pages,
 		.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
 		.iotlb_sync		= arm_smmu_iotlb_sync,
-		.iova_to_phys		= arm_smmu_iova_to_phys,
+		.iova_to_phys_length	= arm_smmu_iova_to_phys_length,
 		.set_pgtable_quirks	= arm_smmu_set_pgtable_quirks,
 		.free			= arm_smmu_domain_free,
 	}
diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index a1e8cf29f594..08bb6fce992f 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -489,19 +489,22 @@ static void qcom_iommu_iotlb_sync(struct iommu_domain *domain,
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
 
+	if (mapped_length)
+		*mapped_length = 0;
+
 	if (!ops)
 		return 0;
 
 	spin_lock_irqsave(&qcom_domain->pgtbl_lock, flags);
-	ret = ops->iova_to_phys(ops, iova);
+	ret = ops->iova_to_phys_length(ops, iova, mapped_length);
 	spin_unlock_irqrestore(&qcom_domain->pgtbl_lock, flags);
 
 	return ret;
@@ -602,7 +605,7 @@ static const struct iommu_ops qcom_iommu_ops = {
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


