Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C1FCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNZF/SaFZFt3zbn7FrmeyBMohohJiu4c3VZtwUCcXEg=; b=WmP2dE2jDRDa39aK7DPntgvvXZ
	5HQwLDvkvRZuiIwtIqvRXx6x5Y2KFkr52KDO+SoQIiuJeHJrAnj8BVhfEJRrd+ULuRyunDgurkNCi
	awJilh/oQTU0XFpeS0w/pSh3IyezkrngMeteJ5ojF3DbC9KBpPjD0t7Qjbe2v7rJqrrs7CdKFmF01
	gNPCFH3kulBcSlZUH+G4oce87vUbVK4+bUaOvQmIVI4HDuelne/pDXZjWybJ5sGRSeohYMCGCzLcm
	TaQTuS7tQNGRTa96hJ5zoRPVATt0Yv3rkF7jcdojfvJBl5mJkqnNWxTF4zJwj4noCOmyfSm9BlPMP
	DZkdnJOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNL-0000000FNAr-09xK;
	Wed, 03 Jun 2026 15:19:23 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnN9-0000000FMwe-0wMl
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 15:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BNZF/SaFZFt3zbn7FrmeyBMohohJiu4c3VZtwUCcXEg=; b=mkgZzBWk4UPNajWBdsme53P4Ia
	/aEaKhrFKex/BcAIUrjlKT09PjJAl45FQFXP9lfO0RMVZuNyd9wk8x4JbUi6LuTGD9GUPycsj2ei/
	dlmtmDbsg/UM0THsj21Tfv2Zt3VxqDhJCXC8KYFzex54DIotoC3tVv7SUZU9lki09aP9asVA3xFi2
	eEE5TSQHSQmo83SDOh8NMlWPEB1IUN3bbh9adXTTNDvh5ZGGvygo9AcmAgbKGgmiFReb+6uqIt1EO
	WutIqfGqlzN6SN6JICL9wz5qU+7n1slMp+icX91BCpmCW7tQ2jHoVfm7mao/QcbH3fAiDSZX3miy4
	UzblsuPg==;
Received: from out199-10.us.a.mail.aliyun.com ([47.90.199.10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUnN4-0000000CXjq-2YsK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499939; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=BNZF/SaFZFt3zbn7FrmeyBMohohJiu4c3VZtwUCcXEg=;
	b=awewpfscssXT+IGRO/8VdG7D6VvIjJuM7DJdOFRI4rJV5+ESk4E6W1ZRFzsDsFRhGvfOG45zsu/53qcU6MlUtSK/aUIMHvf0NksCEyk9xMRuEJVSYuwEDpCUSTij6ha5Hp3rVhw9QCal1K+Zi89XkYIU0qfjKlm4GtLqlglgRNw=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fR51_1780499936;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fR51_1780499936 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:18:56 +0800
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
Subject: [PATCH v3 18/32] iommu/s390: implement iova_to_phys_length
Date: Wed,  3 Jun 2026 23:17:50 +0800
Message-ID: <20260603151804.1963871-19-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_161907_011703_B28FFBBA 
X-CRM114-Status: GOOD (  10.41  )
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
 drivers/iommu/s390-iommu.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index f148f559ac56..6cfcc55ef59f 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -986,22 +986,23 @@ static unsigned long *get_rto_from_iova(struct s390_domain *domain,
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
@@ -1014,8 +1015,11 @@ static phys_addr_t s390_iommu_iova_to_phys(struct iommu_domain *domain,
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
 
@@ -1183,7 +1187,7 @@ static struct iommu_domain blocking_domain = {
 		.flush_iotlb_all = s390_iommu_flush_iotlb_all, \
 		.iotlb_sync      = s390_iommu_iotlb_sync, \
 		.iotlb_sync_map  = s390_iommu_iotlb_sync_map, \
-		.iova_to_phys	= s390_iommu_iova_to_phys, \
+		.iova_to_phys_length	= s390_iommu_iova_to_phys_length, \
 		.free		= s390_domain_free, \
 	}
 
-- 
2.43.7


