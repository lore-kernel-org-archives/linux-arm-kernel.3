Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92998CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0BYo1PwdAu529FAIoCuH5ns8iq006AC645sJYA70ZFs=; b=SYzktouSF/ZZfHPKMQcXsdQlZb
	AgZGoZkX/j07jb1G/RI9cLHngMAdL6YvHfrJSSJxoUjM9fb5yrYBUti09Pt4ZgU/efPdHRi0dbidd
	SN2WnTiyW0dEAqoHup3dYp6iNMptNejZP/7IaIFccaKAaDZn95y3L9OXZ1RasCezxgEu0nQiDsW9v
	boC/tKER+420A+GvFvMJEl92GH8QDfzrbv0gcfA5ZWmGwxBVh0zt7FKh/FOm/Z9nPkMINWUzB9UJN
	PgjxVrU2YBsWK9jInqg0zWKiEyNdrRLR8Lnc3J1Ze2kC6awAN/2+LoachgALyvalo89kerhOOClrt
	NJ6Zc5NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnMr-0000000FMbP-0xua;
	Wed, 03 Jun 2026 15:18:53 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnMm-0000000FMUy-2zDH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:18:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499923; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=0BYo1PwdAu529FAIoCuH5ns8iq006AC645sJYA70ZFs=;
	b=tWLtEYUIvx69g3g4qdfSmEj1XeDhaSVyhmadnEM9O7lCwPxKGF3udPrZlyt+/+1uEdYK6ma+74P0PWI9TeQ3tz7NSi6LF9+C2RsHtCySQ0mNBxx1wTE/YN3Pu5iVkivLR5imQTxUhH6kc1mBIC6Im4wVlzePyTPqlrm6a7vGhLs=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fR1Y_1780499921;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fR1Y_1780499921 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:18:41 +0800
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
Subject: [PATCH v3 03/32] iommu/io-pgtable-arm-v7s: introduce iova_to_phys_length in io_pgtable_ops
Date: Wed,  3 Jun 2026 23:17:35 +0800
Message-ID: <20260603151804.1963871-4-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_081848_924834_0F4267A4 
X-CRM114-Status: GOOD (  10.92  )
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

Implement iova_to_phys_length in ARM v7s backend: returns block size
derived from level mask. The old iova_to_phys is kept as a thin wrapper.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/io-pgtable-arm-v7s.c | 32 +++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 1dbef8c55007..62198e31a393 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -641,8 +641,21 @@ static size_t arm_v7s_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova
 	return unmapped;
 }
 
+static phys_addr_t arm_v7s_iova_to_phys_length(struct io_pgtable_ops *ops,
+						unsigned long iova,
+						size_t *mapped_length);
+
 static phys_addr_t arm_v7s_iova_to_phys(struct io_pgtable_ops *ops,
 					unsigned long iova)
+{
+	phys_addr_t phys = arm_v7s_iova_to_phys_length(ops, iova, NULL);
+
+	return (phys == PHYS_ADDR_MAX) ? 0 : phys;
+}
+
+static phys_addr_t arm_v7s_iova_to_phys_length(struct io_pgtable_ops *ops,
+						unsigned long iova,
+						size_t *mapped_length)
 {
 	struct arm_v7s_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	arm_v7s_iopte *ptep = data->pgd, pte;
@@ -656,11 +669,15 @@ static phys_addr_t arm_v7s_iova_to_phys(struct io_pgtable_ops *ops,
 	} while (ARM_V7S_PTE_IS_TABLE(pte, lvl));
 
 	if (!ARM_V7S_PTE_IS_VALID(pte))
-		return 0;
+		return PHYS_ADDR_MAX;
 
 	mask = ARM_V7S_LVL_MASK(lvl);
 	if (arm_v7s_pte_is_cont(pte, lvl))
 		mask *= ARM_V7S_CONT_PAGES;
+
+	if (mapped_length)
+		*mapped_length = ~mask + 1U;
+
 	return iopte_to_paddr(pte, lvl, &data->iop.cfg) | (iova & ~mask);
 }
 
@@ -714,6 +731,7 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 		.map_pages	= arm_v7s_map_pages,
 		.unmap_pages	= arm_v7s_unmap_pages,
 		.iova_to_phys	= arm_v7s_iova_to_phys,
+		.iova_to_phys_length	= arm_v7s_iova_to_phys_length,
 	};
 
 	/* We have to do this early for __arm_v7s_alloc_table to work... */
@@ -843,13 +861,13 @@ static int __init arm_v7s_do_selftests(void)
 	 * Initial sanity checks.
 	 * Empty page tables shouldn't provide any translations.
 	 */
-	if (ops->iova_to_phys(ops, 42))
+	if (ops->iova_to_phys_length(ops, 42, NULL) != PHYS_ADDR_MAX)
 		return __FAIL(ops);
 
-	if (ops->iova_to_phys(ops, SZ_1G + 42))
+	if (ops->iova_to_phys_length(ops, SZ_1G + 42, NULL) != PHYS_ADDR_MAX)
 		return __FAIL(ops);
 
-	if (ops->iova_to_phys(ops, SZ_2G + 42))
+	if (ops->iova_to_phys_length(ops, SZ_2G + 42, NULL) != PHYS_ADDR_MAX)
 		return __FAIL(ops);
 
 	/*
@@ -870,7 +888,7 @@ static int __init arm_v7s_do_selftests(void)
 				    &mapped))
 			return __FAIL(ops);
 
-		if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
+		if (ops->iova_to_phys_length(ops, iova + 42, NULL) != (iova + 42))
 			return __FAIL(ops);
 
 		iova += SZ_16M;
@@ -884,7 +902,7 @@ static int __init arm_v7s_do_selftests(void)
 		if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
 			return __FAIL(ops);
 
-		if (ops->iova_to_phys(ops, iova + 42))
+		if (ops->iova_to_phys_length(ops, iova + 42, NULL) != PHYS_ADDR_MAX)
 			return __FAIL(ops);
 
 		/* Remap full block */
@@ -892,7 +910,7 @@ static int __init arm_v7s_do_selftests(void)
 				   GFP_KERNEL, &mapped))
 			return __FAIL(ops);
 
-		if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
+		if (ops->iova_to_phys_length(ops, iova + 42, NULL) != (iova + 42))
 			return __FAIL(ops);
 
 		iova += SZ_16M;
-- 
2.43.7


