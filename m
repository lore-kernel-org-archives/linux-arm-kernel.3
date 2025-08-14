Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D76CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 10:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hmKvD1NfFlItzRVod0eCXqc8ZsIbun402i31KH8WSpc=; b=CU1wlhfkjnwMpgRJezDF83XQ+R
	1Ek4R4gFy6uGl6/hqVevr0vI9NkwmRuGqc5RCL+VqzkSvnndLRnv+ennb9OZwN6i4PUa222Edoe7K
	kSJguApvqlvKSjhj23p5NCDxSCc/8w4QtJW14awlnNJnug9g6l5TfcJc5tVTDp7Q2gumYEXL0gwK8
	hoWSs0J1ecpGB8OzgxkAFY+U34v2yQZyI9oi9BMtTbB5ms99m5fqOnwTi7jO2qWdMTU6yyJu1/EdS
	bcwvhi7N3d2jjygttaHU+uwpLFCCwetBgw1ov2oqSAXS0WBrG+RZgy8QSOSSEONTG43jM5w7U4JaE
	m47H4qyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVGm-0000000GbTz-43Oi;
	Thu, 14 Aug 2025 10:33:16 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUHr-0000000GPUe-3tQF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:30:21 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4c2fx85YMwzdcFF;
	Thu, 14 Aug 2025 17:25:48 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 12ED1140136;
	Thu, 14 Aug 2025 17:30:09 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 14 Aug 2025 17:30:08 +0800
From: Qinxin Xia <xiaqinxin@huawei.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <linux-kernel@vger.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<xiaqinxin@huawei.com>, <yangyicong@huawei.com>, <wangzhou1@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<jonathan.cameron@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH 0/2] iommu: Add io_ptdump debug interface for iommu
Date: Thu, 14 Aug 2025 17:30:03 +0800
Message-ID: <20250814093005.2040511-1-xiaqinxin@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_023020_129334_0BB87D56 
X-CRM114-Status: GOOD (  10.23  )
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

This patch supports the iopgtable_dump function (similar to kernel_page_dump).
The IOMMU page table dump debugging function is added to the framework layer.
Different architectures only need to provide the implemented dump ops.
It also provides the implementation of ARM SMMUv3 and io-pgtable-arm.

Qinxin Xia (2):
  iommu/debug: Add IOMMU page table dump debug facility
  iommu/io-pgtable: Add ARM SMMUv3 page table dump support

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  13 ++
 drivers/iommu/dma-iommu.c                   |  15 ++
 drivers/iommu/dma-iommu.h                   |   4 +
 drivers/iommu/io-pgtable-arm.c              | 169 +++++++++++++++++++
 drivers/iommu/iommu.c                       | 175 ++++++++++++++++++++
 include/linux/io-pgtable.h                  |   4 +
 include/linux/io_ptdump.h                   |  16 ++
 include/linux/iommu.h                       |  10 +-
 mm/Kconfig.debug                            |  19 +++
 mm/Makefile                                 |   2 +
 mm/io_ptdump.c                              |  24 +++
 mm/io_ptdump_debugfs.c                      |  17 ++
 12 files changed, 467 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/io_ptdump.h
 create mode 100644 mm/io_ptdump.c
 create mode 100644 mm/io_ptdump_debugfs.c

-- 
2.33.0


