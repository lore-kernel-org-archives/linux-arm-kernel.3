Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEED6CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCvFh85B/tqBQu5u458IIKCnRVt7lt/6UxJszvT0Ehg=; b=dKBPjlTzC0J6r+qqzkx/gP0yHw
	j3Yd+/dR4HHgMbk/xDygomvWovaCU7i+xxFQBjY67jPtcPyE5/94rlYQAOnc231JNSPxPT+5hz0WL
	CDlGFhlEfBHr9B8dWaXhsym25Zv624Ss0LhQjovk2tvJEj7yZNICqbRLUR4PbX7r0tEDGvv/EOS20
	fMxBq8TmHbosPwrlwdjbaq97vx4oLhW79yhB+sVrW7vUDWIa5jmsvP/8NK7Y6CEirupudveKeRPIn
	vfXUu0/E07I/Pj4gLq3h1cKbFdIU7z5xIkokmVJIZcTtJsXDkpSKkVWd6ws/LdUW49Slx4aSczspr
	+wggcbww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMeS-0000000CoI8-06wL;
	Tue, 02 Jun 2026 10:47:16 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMeN-0000000Co5D-3E83
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 10:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780397230; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=RCvFh85B/tqBQu5u458IIKCnRVt7lt/6UxJszvT0Ehg=;
	b=UD9KCkkMrik8CA2UwL7PC/jb6zL070i8vlIvgatrFU2k+I2d4XPpBPuDx6Q55Yn87aT4bVDN6JcrA0uT5FW1tQ71OmcazOOmKZInMBmTjJi/6Obb+iaNp6LPz8O9fn/sh2s+HBTqABe06J2ZJYwy13CEV5D5aZT5p0/ndRPXl2w=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R811e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X44E972_1780397225;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X44E972_1780397225 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 18:47:05 +0800
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
Subject: [PATCH v2 18/30] iommu/s390: implement iova_to_phys_length
Date: Tue,  2 Jun 2026 18:46:25 +0800
Message-ID: <20260602104637.1219810-19-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
References: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_034712_007689_55232B16 
X-CRM114-Status: GOOD (  10.24  )
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

Implement iova_to_phys_length for s390 IOMMU driver,
returning the actual PTE mapping size.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/s390-iommu.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index f148f559ac56..b12ed389e1bd 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -986,22 +986,26 @@ static unsigned long *get_rto_from_iova(struct s390_domain *domain,
 	}
 }
 
-static phys_addr_t s390_iommu_iova_to_phys(struct iommu_domain *domain,
-					   dma_addr_t iova)
+static phys_addr_t s390_iommu_iova_to_phys_length(struct iommu_domain *domain,
+						  dma_addr_t iova,
+						  size_t *mapped_length)
 {
 	struct s390_domain *s390_domain = to_s390_domain(domain);
 	unsigned long *rto, *sto, *pto;
 	unsigned long ste, pte, rte;
 	unsigned int rtx, sx, px;
-	phys_addr_t phys = 0;
+	phys_addr_t phys = PHYS_ADDR_MAX;
+
+	if (mapped_length)
+		*mapped_length = 0;
 
 	if (iova < domain->geometry.aperture_start ||
 	    iova > domain->geometry.aperture_end)
-		return 0;
+		return PHYS_ADDR_MAX;
 
 	rto = get_rto_from_iova(s390_domain, iova);
 	if (!rto)
-		return 0;
+		return PHYS_ADDR_MAX;
 
 	rtx = calc_rtx(iova);
 	sx = calc_sx(iova);
@@ -1014,8 +1018,11 @@ static phys_addr_t s390_iommu_iova_to_phys(struct iommu_domain *domain,
 		if (reg_entry_isvalid(ste)) {
 			pto = get_st_pto(ste);
 			pte = READ_ONCE(pto[px]);
-			if (pt_entry_isvalid(pte))
+			if (pt_entry_isvalid(pte)) {
 				phys = pte & ZPCI_PTE_ADDR_MASK;
+				if (mapped_length)
+					*mapped_length = SZ_4K;
+			}
 		}
 	}
 
@@ -1183,7 +1190,7 @@ static struct iommu_domain blocking_domain = {
 		.flush_iotlb_all = s390_iommu_flush_iotlb_all, \
 		.iotlb_sync      = s390_iommu_iotlb_sync, \
 		.iotlb_sync_map  = s390_iommu_iotlb_sync_map, \
-		.iova_to_phys	= s390_iommu_iova_to_phys, \
+		.iova_to_phys_length	= s390_iommu_iova_to_phys_length, \
 		.free		= s390_domain_free, \
 	}
 
-- 
2.43.7


