Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9147C10F3DE5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 10:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4AaMlouoSdoLO09YMstibKmWb5wdcKm3CtKkeSW3Zrc=; b=BnbJ0iEZAQPl4Gr07R6eEVEOy/
	QnwyJ6BdUmpP7/sEXq8y3M3LWg/to3TfGQax16bUVENLmfduB6BUYQUVuaGF+EDR9OKC1BO8BrkeM
	UKvyTGOz61mVXHcd0lr5qsLp2lBGGV0u0G95HDvNocZACrCzwaEEIOtyGsS4IfS8h3ksiCBjXE+FP
	Sc3Jx/2ajtSXGxI8qrnJrNmEL/m4m7xt3uU8RQq5mGckRhhyGqvpGO8PkKULPxw76nr7VP5v5ENxJ
	6LJeBx84mkXgm07CX4IFnaAtXOFoyvc494RU97A1jXBUulUzOCM11qAo0Wc3oN+/wr4ZQvVQ2y1H4
	wg7V65WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QcW-00000008oUf-3fx8;
	Sat, 28 Mar 2026 10:10:20 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QcG-00000008oNO-2KQ4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 10:10:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4AaMlouoSdoLO09YMstibKmWb5wdcKm3CtKkeSW3Zrc=;
	b=Jf2prgtEKbtoy5HpZKi3npCtQBHN+jBA+Q09KK0A2nl6mNq/gJEIxHkm0Bwlex7M8Pz4TPj4Q
	OJ8NNoj5MokDNh9LgyqVksKwdbHNIRZ8NJzCrZmf5U7dcvpYrBJ9c1YKEU5zDMdwsfSHPl9G3qk
	hV0Sa4eKyGJu7dhToJt7IYo=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fjY4g5XMNzLlSS;
	Sat, 28 Mar 2026 18:03:47 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 6255A40562;
	Sat, 28 Mar 2026 18:09:54 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 28 Mar 2026 18:09:53 +0800
From: Qinxin Xia <xiaqinxin@huawei.com>
To: <robin.murphy@arm.com>, <nicolinc@nvidia.com>, <will@kernel.org>,
	<jpb@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<xiaqinxin@huawei.com>, <wangzhou1@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>,
	<jonathan.cameron@huawei.com>, <wuyifan50@huawei.com>, <linuxarm@huawei.com>
Subject: [RFC PATCH v2 0/5] Add debugfs support for ARM SMMUv3
Date: Sat, 28 Mar 2026 18:09:48 +0800
Message-ID: <20260328100953.3441915-1-xiaqinxin@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_031004_975268_6FF08797 
X-CRM114-Status: GOOD (  12.97  )
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

Add a comprehensive debugfs framework to the ARM SMMUv3 driver,                                                                                                                                                                                                                                                       
providing visibility into internal hardware state for debugging
and performance analysis. The debugfs entries are organized under
/sys/kernel/debug/iommu/arm_smmu_v3/, with per-SMMU instance directories
and per-device stream table entries.
                 
Each SMMU instance provides:
- capabilities – static SMMU features and queue sizes.
- registers – SMMU key registers.
- stream_table/ – a directory per device with subdirectories per Stream ID. 
                 
Each Stream ID subdirectory contains:
- ste – the Stream Table Entry in decoded and raw format.
- cd – all valid Context Descriptors (Stage 1 translation tables) associated with the device.
- a symlink named with the device’s BDF/name pointing to its sysfs directory for easy navigation.
                 
/sys/kernel/debug/iommu/arm_smmu_v3/smmu0/stream_table/
└── <sid>/       
    ├─── ste  
    ├─── cd   
    └─── <dev_name>

Changes since V1:
  Address the comments from Nicolin:
  1.Fixed the incorrect comments and replaced 'kzalloc' with 'kzalloc_obj'
  2.'stream_table_create/stream_table_remove' is called in probe_device/release_device
  3.Reused some functions in the driver

  Address the comments from Robin:
  1.Remove unnecessary CR0*EN extra strings
  2.Remove the limit on ssid

  Address the comments from Robin and Nicolin:
  1.The directory structure has been changed
  2.Added lock protection for the ste_show and cd_show

  Others:
  1.'arm_smmu_debugfs_remove' is added to remove the corresponding debugfs when SMMU device is removed
  2.'arm_smmu_debugfs_remove_stream_table' is added to remove the corresponding stream_dir when device is removed
  3.Use scoped_guard for locks that include return
  4.Added 'open' and 'release' operations to prevent the device from being released during dump
  5.Merged 'stream_table_create' and 'ste_show' into one patch
  6.Some other clean code

- Link: https://lore.kernel.org/all/20260313104351.3502293-1-xiaqinxin@huawei.com/

Qinxin Xia (5):
  iommu/arm-smmu-v3: Add basic debugfs framework
  iommu/arm-smmu-v3: Add register display to debugfs
  iommu/arm-smmu-v3: Add Stream Table Entry display to debugfs
  iommu/arm-smmu-v3: Add device symlink in stream table debugfs
  iommu/arm-smmu-v3: Add Context Descriptor display to debugfs

 drivers/iommu/Kconfig                         |  11 +
 drivers/iommu/arm/arm-smmu-v3/Makefile        |   1 +
 .../arm/arm-smmu-v3/arm-smmu-v3-debugfs.c     | 571 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  33 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  32 +
 5 files changed, 646 insertions(+), 2 deletions(-)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c

-- 
2.33.0


