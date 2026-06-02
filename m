Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EDBCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1rU2c2uZHdN1cWrbtG6K1kwKPcxqttXAzthewRnRpY=; b=iyPqgas3xYHsMFADaCc/QnKgox
	eX/Zg+q0CJmRgKtv2NhvPSV5d1e2chGfWbaThS5GdOabl57BS2+lr5mikm+z8yc6wo2c31HnuIIAe
	QlGyVtHC3z7N7impKOkiLOWggGDHAXgBJSKJW3ESkSlVp7EqA3umbYhXSvdS8o9sw+AqeEtPcDuUo
	gsRbmL4V9xi/s5gm71YdGJJLFna8BQ5bo1mOWBaicU40HEw/pN29uhbvzXVsE9HUJbLKnIdc59f5Y
	vSQV2Sf/wWxx0+zHg4l25Y0fK+dq3+LL1E0chn62q9z1UVjqYRSaOhhlWJOi3ojgSGnTXR7yzNyWb
	KqhpEJcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMeX-0000000CoV3-3Prm;
	Tue, 02 Jun 2026 10:47:21 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMeS-0000000CoE8-2SQk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 10:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780397234; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=E1rU2c2uZHdN1cWrbtG6K1kwKPcxqttXAzthewRnRpY=;
	b=nFshXLtEXVmdorDGbqqxR4/iQEuot3SGIEEnxXgxCMZ/Jj55IOL5Fv7dk3XYH0QGQRXBJbM41W5eCvvCrt+dTQTc1Rdg0LSNWLKj/YATiGRFsQEMt2X8YFkiCl22Yw2wTt8ZjJvxpZ499h1rnXX9knCcIqiaEC13fdqQ5eUsWwg=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X44E97k_1780397228;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X44E97k_1780397228 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 18:47:09 +0800
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
Subject: [PATCH v2 21/30] iommu/tegra-smmu: implement iova_to_phys_length
Date: Tue,  2 Jun 2026 18:46:28 +0800
Message-ID: <20260602104637.1219810-22-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
References: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_034716_816609_F64B6E82 
X-CRM114-Status: UNSURE (   8.80  )
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

Implement iova_to_phys_length for Tegra SMMU IOMMU driver,
returning the actual PTE mapping size.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/tegra-smmu.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 67e7a7b925f0..fbe28fb9385f 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -803,20 +803,26 @@ static size_t tegra_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
 	return size;
 }
 
-static phys_addr_t tegra_smmu_iova_to_phys(struct iommu_domain *domain,
-					   dma_addr_t iova)
+static phys_addr_t tegra_smmu_iova_to_phys_length(struct iommu_domain *domain,
+					   dma_addr_t iova, size_t *mapped_length)
 {
 	struct tegra_smmu_as *as = to_smmu_as(domain);
 	unsigned long pfn;
 	dma_addr_t pte_dma;
 	u32 *pte;
 
+	if (mapped_length)
+		*mapped_length = 0;
+
 	pte = tegra_smmu_pte_lookup(as, iova, &pte_dma);
 	if (!pte || !*pte)
-		return 0;
+		return PHYS_ADDR_MAX;
 
 	pfn = *pte & as->smmu->pfn_mask;
 
+	if (mapped_length)
+		*mapped_length = SZ_4K;
+
 	return SMMU_PFN_PHYS(pfn) + SMMU_OFFSET_IN_PAGE(iova);
 }
 
@@ -1007,7 +1013,7 @@ static const struct iommu_ops tegra_smmu_ops = {
 		.attach_dev	= tegra_smmu_attach_dev,
 		.map_pages	= tegra_smmu_map,
 		.unmap_pages	= tegra_smmu_unmap,
-		.iova_to_phys	= tegra_smmu_iova_to_phys,
+		.iova_to_phys_length = tegra_smmu_iova_to_phys_length,
 		.free		= tegra_smmu_domain_free,
 	}
 };
-- 
2.43.7


