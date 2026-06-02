Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14B4CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1pBWOp6KPk1xwyKTTozbXEjvmJOV/Yw7GM3gk1sgVc=; b=E5WmO3XKHH+wlIBzii17Vh7b0M
	JdM6FlHEmIO1z0qDZWdwXEqqv7BLn8owRWh2xsBo06MAMafk6EpHMqHV4RmP1qJQ4V5CX4rT83vfa
	c5OTwTir5K/Yn+S+BFhCI++Ha8hSXXs/kzqwt3leWYIud0v4E27pCJeT+NC17PgGTz8J9LQsilS5u
	8L10q1nK/bZ1FaFB3aso6Ekv81XjfMshXDBjMxwzm2uCRTdGXtAhirGTA7P8DgoxdV8G0/L2lJ9AY
	Stmpb22UawHS2DwVUX1vD9X8e6faFs6smvr3NHsNMN/wSDSYdKf99Jpm0wALmIZ257xCezmg6DCd+
	z0Wony+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMee-0000000Cokd-1Kwj;
	Tue, 02 Jun 2026 10:47:28 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMeZ-0000000CoRe-1sSM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 10:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780397240; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=o1pBWOp6KPk1xwyKTTozbXEjvmJOV/Yw7GM3gk1sgVc=;
	b=PQMta2nGwmoPnVfCtBqqwGXCXzc1w0zgxpfOZh7lluiTgaFuJTZMnD4KKitasWT6muM/GCpmtY8uydWowx1f1B2Ach0W7oMONULOMyOTQJEmjhU9gxwhFCoaFSjZixh+AH9uzzictRsuwlrBKcqh7+Ne1RQqwwCiT9snA0eS5Bo=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X44E9A._1780397236;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X44E9A._1780397236 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 18:47:17 +0800
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
Subject: [PATCH v2 29/30] iommu/io-pgtable-dart: remove deprecated iova_to_phys wrapper
Date: Tue,  2 Jun 2026 18:46:36 +0800
Message-ID: <20260602104637.1219810-30-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
References: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_034723_810033_E9648DDC 
X-CRM114-Status: UNSURE (   6.24  )
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

Remove the iova_to_phys wrapper function and .iova_to_phys assignment
from DART io-pgtable, as all callers now use iova_to_phys_length.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/io-pgtable-dart.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/iommu/io-pgtable-dart.c b/drivers/iommu/io-pgtable-dart.c
index 2dac21a578a7..01c4c022830b 100644
--- a/drivers/iommu/io-pgtable-dart.c
+++ b/drivers/iommu/io-pgtable-dart.c
@@ -333,18 +333,6 @@ static size_t dart_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
 	return i * pgsize;
 }
 
-static phys_addr_t dart_iova_to_phys_length(struct io_pgtable_ops *ops,
-					    unsigned long iova,
-					    size_t *mapped_length);
-
-static phys_addr_t dart_iova_to_phys(struct io_pgtable_ops *ops,
-				     unsigned long iova)
-{
-	phys_addr_t phys = dart_iova_to_phys_length(ops, iova, NULL);
-
-	return (phys == PHYS_ADDR_MAX) ? 0 : phys;
-}
-
 static phys_addr_t dart_iova_to_phys_length(struct io_pgtable_ops *ops,
 					    unsigned long iova,
 					    size_t *mapped_length)
@@ -416,7 +404,6 @@ dart_alloc_pgtable(struct io_pgtable_cfg *cfg)
 	data->iop.ops = (struct io_pgtable_ops) {
 		.map_pages		= dart_map_pages,
 		.unmap_pages		= dart_unmap_pages,
-		.iova_to_phys		= dart_iova_to_phys,
 		.iova_to_phys_length	= dart_iova_to_phys_length,
 	};
 
-- 
2.43.7


