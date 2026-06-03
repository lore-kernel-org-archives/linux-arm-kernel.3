Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7F8CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHcwXEJnumwKc2zUUog9MdRhUiRkhNb+QkY/zlqMCrg=; b=MzP6EGBdYgizJ6oxtNq9ftIS++
	lPR9gTmQKJhGAosdUybCK0TWzcYTl91xl7WWn3f5iBIFAfSm/gBh0sn7OJSyPgiM2jZ+iV/9AHTfE
	pVqbygBOAoDmDwCNrB5ogoBZRxydodECZfzzA3VY6lIS/bVqDQ1iJCdn30LmSavxNZLBlizFBZk7i
	Q/Hs/EcPnV/v1bCC+B8rpjJUX0FgcvoSFILjiuzKmHnIYw4e8WL5BMbrPGjY7+ZbWCzndoYsDpdLf
	oXHMTCSasPZbSn4VOLeO0VOYAU3AhKqpAAcDa4/iYWjJLZ+7bS+8pGHN4a9mbujA1ptgJC9zBjHVA
	8nwA0fKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNT-0000000FNSZ-2pE9;
	Wed, 03 Jun 2026 15:19:31 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNH-0000000FN5p-3KAO
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 15:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HHcwXEJnumwKc2zUUog9MdRhUiRkhNb+QkY/zlqMCrg=; b=qAaIYYWvSOhXhTzdAmFv/T6mcw
	rGNgemFNK50fUF6zqbOAtQ4KcEXMuew3YbZZ4peiAbR83sKcm3eAhdR0onSL2X6XvgKCEJkNUfdFV
	n+tSH1tmt0FAb86tWuavipZKXEJByI9rHJAy91alrkSd3eVvOyQdFvgnt9LBBRaPNECz7v9SeSYEg
	RbG6XJJ4t4vwJE393LgWFyi5hmHOgkrKowq/vQLSsBz2CiBt5Zga1yV/aNoKuODj54FgpkphjNmEF
	Cf6RQwRu5wPG1Kqf2yPRB+JptoxzhtGvU4fbdCeWqleskQ9/zKTCh8xqJcYihTW0787MsTdcF454h
	mI146EIA==;
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUnNE-0000000CXry-1aAo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499951; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=HHcwXEJnumwKc2zUUog9MdRhUiRkhNb+QkY/zlqMCrg=;
	b=rPnvpYgqqdOdj8qphgqovqmNrOZ/zqZD3PkQL4ymax0zS/kk4gjubLENRjdWzLVQRusppsWDFPibHFkT16DFKTheo+EekjUzWOM0uWpbXrZognczVtIkYvXP3qGaXm3SBghc5dXblELGOTctNnrkcEUgBGOXk0mGS0co/nyjEGg=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R471e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fR8Q_1780499948;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fR8Q_1780499948 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:19:08 +0800
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
Subject: [PATCH v3 30/32] iommu/io-pgtable-arm-v7s: remove deprecated iova_to_phys wrapper
Date: Wed,  3 Jun 2026 23:18:02 +0800
Message-ID: <20260603151804.1963871-31-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_161916_992211_59F3714F 
X-CRM114-Status: UNSURE (   6.32  )
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
from ARM v7s io-pgtable, as all callers now use iova_to_phys_length.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/io-pgtable-arm-v7s.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 62198e31a393..da065747e37c 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -641,18 +641,6 @@ static size_t arm_v7s_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova
 	return unmapped;
 }
 
-static phys_addr_t arm_v7s_iova_to_phys_length(struct io_pgtable_ops *ops,
-						unsigned long iova,
-						size_t *mapped_length);
-
-static phys_addr_t arm_v7s_iova_to_phys(struct io_pgtable_ops *ops,
-					unsigned long iova)
-{
-	phys_addr_t phys = arm_v7s_iova_to_phys_length(ops, iova, NULL);
-
-	return (phys == PHYS_ADDR_MAX) ? 0 : phys;
-}
-
 static phys_addr_t arm_v7s_iova_to_phys_length(struct io_pgtable_ops *ops,
 						unsigned long iova,
 						size_t *mapped_length)
@@ -730,7 +718,6 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 	data->iop.ops = (struct io_pgtable_ops) {
 		.map_pages	= arm_v7s_map_pages,
 		.unmap_pages	= arm_v7s_unmap_pages,
-		.iova_to_phys	= arm_v7s_iova_to_phys,
 		.iova_to_phys_length	= arm_v7s_iova_to_phys_length,
 	};
 
-- 
2.43.7


