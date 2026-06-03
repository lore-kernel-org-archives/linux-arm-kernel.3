Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E68ACD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5K9kQ+7O2to9AMrCCxHb12XQWSw4xjjz1YrQKtCPM08=; b=AReFBSscRXQwSwrK0q28u/M8SA
	MB7QuH3yABww9eIBM4F/DdZ2R/a+eq8l0nHyrTaNV4ooCHmVVNn6YqpE7S3uoMdfRj6LhXEG6OQKC
	SjO7ssuy8rZuKvujznmwFmFC6icddX51zCNnTITccGXcXXhaQzkeT+cIj4FFULDJAqyVc0Uq3OGA0
	rN9OUtKcPUxrjHKzjkd68Hqlw8RdYld67VHOvHC5lOV6qmvXEsQ5hhw6D7S/A8sJTaQrs5vqqGQGd
	Q/x42uTUksa1UGUcIL/lxIhF//CL7L6319mF9Bx1iRjhZYubvapobrOtqhfB15rL20IwLzybyIb6O
	xlXwrkBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnN3-0000000FMpW-1TLp;
	Wed, 03 Jun 2026 15:19:05 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnN1-0000000FMlt-3dn7
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 15:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5K9kQ+7O2to9AMrCCxHb12XQWSw4xjjz1YrQKtCPM08=; b=jG3WFp7dEP6z2STsmqBuJzmE4q
	+Bwq389K5aROggho96JKkP1fqtcqXTeNpWOHQhuvsnCr3LFd0ls1k2rqTPSmljSlILGHsjQKrmQHI
	mO87p3L7ha5s+kgdkgINLmW18yKsBSu44W8njHPodGSet3Eirz9HHaTdicKQAADYe9zyIo6y38ldX
	slPabSJBFK+d/z5D5N77MmVbMqeJ8J75nAOu3EYyRDY15VBtNivl/xGHLABK8IU1Y7JL1iYj3SVjC
	VN53C/hW70/7/ZQbveYs/lbmIhBmV5J86qLJBpvZ9kwNe7O99X5VuIxJLz9aNhs+LZ1XYHwIqnSrr
	Zl3OCrFA==;
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUnMy-0000000CXaX-1zDj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499924; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=5K9kQ+7O2to9AMrCCxHb12XQWSw4xjjz1YrQKtCPM08=;
	b=c9wDNKVyh6CUp50BD1q43dV2vGm9+vjuQod3i5xEQ7UuVXL+7fVS787uSqpSpXjWfUGO0GyHXPuozT300VndBfxM2oh6AY+SauiX/jPVya6YXR/aHjdByi1Za46iXWPyyVnGZ9BhvxSwMU3hUjgUA59OO7IShh0KbLSzcFtwNAQ=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fR1m_1780499922;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fR1m_1780499922 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:18:42 +0800
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
Subject: [PATCH v3 04/32] iommu/io-pgtable-dart: introduce iova_to_phys_length in io_pgtable_ops
Date: Wed,  3 Jun 2026 23:17:36 +0800
Message-ID: <20260603151804.1963871-5-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_161900_855464_9DED9A26 
X-CRM114-Status: UNSURE (   9.19  )
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

Implement iova_to_phys_length in DART backend: returns pgsize from
cfg.pgsize_bitmap (single fixed page size). The old iova_to_phys is kept
as a thin wrapper.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/io-pgtable-dart.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/io-pgtable-dart.c b/drivers/iommu/io-pgtable-dart.c
index cbc5d6aa2daa..2dac21a578a7 100644
--- a/drivers/iommu/io-pgtable-dart.c
+++ b/drivers/iommu/io-pgtable-dart.c
@@ -333,29 +333,46 @@ static size_t dart_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
 	return i * pgsize;
 }
 
+static phys_addr_t dart_iova_to_phys_length(struct io_pgtable_ops *ops,
+					    unsigned long iova,
+					    size_t *mapped_length);
+
 static phys_addr_t dart_iova_to_phys(struct io_pgtable_ops *ops,
-					 unsigned long iova)
+				     unsigned long iova)
+{
+	phys_addr_t phys = dart_iova_to_phys_length(ops, iova, NULL);
+
+	return (phys == PHYS_ADDR_MAX) ? 0 : phys;
+}
+
+static phys_addr_t dart_iova_to_phys_length(struct io_pgtable_ops *ops,
+					    unsigned long iova,
+					    size_t *mapped_length)
 {
 	struct dart_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	dart_iopte pte, *ptep;
+	size_t pgsize;
 
 	ptep = dart_get_last(data, iova);
 
 	/* Valid L2 IOPTE pointer? */
 	if (!ptep)
-		return 0;
+		return PHYS_ADDR_MAX;
 
 	ptep += dart_get_last_index(data, iova);
 
 	pte = READ_ONCE(*ptep);
 	/* Found translation */
 	if (pte) {
-		iova &= (data->iop.cfg.pgsize_bitmap - 1);
+		pgsize = data->iop.cfg.pgsize_bitmap;
+		if (mapped_length)
+			*mapped_length = pgsize;
+		iova &= (pgsize - 1);
 		return iopte_to_paddr(pte, data) | iova;
 	}
 
 	/* Ran out of page tables to walk */
-	return 0;
+	return PHYS_ADDR_MAX;
 }
 
 static struct dart_io_pgtable *
@@ -397,9 +414,10 @@ dart_alloc_pgtable(struct io_pgtable_cfg *cfg)
 	data->bits_per_level = bits_per_level;
 
 	data->iop.ops = (struct io_pgtable_ops) {
-		.map_pages	= dart_map_pages,
-		.unmap_pages	= dart_unmap_pages,
-		.iova_to_phys	= dart_iova_to_phys,
+		.map_pages		= dart_map_pages,
+		.unmap_pages		= dart_unmap_pages,
+		.iova_to_phys		= dart_iova_to_phys,
+		.iova_to_phys_length	= dart_iova_to_phys_length,
 	};
 
 	return data;
-- 
2.43.7


