Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480AACD6E6F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjZ8f27cqLiBL9quajEXvEuD5izxdrCDst1w3hORFvo=; b=jAEe1Ivrv6HE+UFcQfMxHEMmu7
	WL2fOPYrMXffuNDDHCnol7isYOwFPGtHGNc6o5a3wH/pj9kI2EMsa/Z9w+u2ljmOr5WmueF+JvKNX
	jOAPSR3VwmdbgCfN3e9QL9ZB/s0gsKqkoA2th6b0mDgLRnKIH39eAKJPbeBqWGWz/iWDHalHIydB/
	T2MCKL0E+EDjEDVI1ijJ1teZm3R2eefFfBJSOcug4JaLCrY3mt6ki4lCYLeZ3xZSzb86Rq7MGjWVE
	CRyJTcVoT8z2Yt2+U4mUQf5biaTgC8GoPjrtpPj1dARA9qMplJIykWKC09BDYcWEqFn1Y2susXdPg
	nqu1km1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNK-0000000FNAC-38MF;
	Wed, 03 Jun 2026 15:19:22 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnN8-0000000FMwI-41vf
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 15:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QjZ8f27cqLiBL9quajEXvEuD5izxdrCDst1w3hORFvo=; b=XJ2bfgGZVEyLYYgEpKM8mRE539
	I4kEIbcaVzCfcOuhrIhRebvPm4bkjS7hYKw2sbQJEIfmkwwpd83PV7lBSgMbo8URhTR3HObjb9get
	8AvDD+dxA66mY8KWvuIJWPQuZ/kBo5uY7E9b+lMFxEVIZvoon71LRRxlc+IFN3Oqotiw1RR9pcHj6
	FrdmNghJx2ugvVO59F+ifs2LOkInJPEY5YRAN9zvnBSLv+NryGvZjhzoHWR8e7KxjO7/CO6Gzby2l
	XqxMMhVlduv8J2ZEBxCucm1wZ+h+o/mB5kA60HZeLrZwHJwMKI1M7l40O80GASMyR8bx3I7BZzngY
	W8pyiaZA==;
Received: from out199-5.us.a.mail.aliyun.com ([47.90.199.5])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUnN4-0000000CXip-1dpQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:19:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499940; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=QjZ8f27cqLiBL9quajEXvEuD5izxdrCDst1w3hORFvo=;
	b=hV9Koh2cxRoTfjnu9bgWdNIEROapxFIrFH7s2DA6Wf5GwVom6NfWlhUMgWczfQQpvgMpZgqXbYLbfEQrJVp3eZtJHPlkteFXfw3Jt8NqJ96sXRMgmPjQGRZn7LsLPcC3t4OE8LRXsw1luzi9R7wak5RZocgaNyzzbzoa+OtUJd8=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R531e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fR5b_1780499938;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fR5b_1780499938 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:18:58 +0800
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
Subject: [PATCH v3 20/32] iommu/sun50i: implement iova_to_phys_length
Date: Wed,  3 Jun 2026 23:17:52 +0800
Message-ID: <20260603151804.1963871-21-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_161906_771503_4FE5CC9A 
X-CRM114-Status: UNSURE (   9.31  )
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
 drivers/iommu/sun50i-iommu.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index be3f1ce696ba..9f39fe4a9d4f 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -659,8 +659,9 @@ static size_t sun50i_iommu_unmap(struct iommu_domain *domain, unsigned long iova
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
@@ -669,13 +670,16 @@ static phys_addr_t sun50i_iommu_iova_to_phys(struct iommu_domain *domain,
 
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
@@ -857,7 +861,7 @@ static const struct iommu_ops sun50i_iommu_ops = {
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


