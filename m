Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBD2CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 06:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vu3EZBeWinYUHPBmY/X090V8/6NEcv7XCtOXv6H294Q=; b=3GEFDRkfcb/N4VzcsorL/LxYsr
	j4C+khbMmiNozRFGW6ZbEgAPv14Mv04wxJjeziX39yJMPlsel+FcBweuB6J9UNeifPEXoaB9BWRf8
	ZhlyuhCKL8Q2cGxJ9EalIHq/JTjsMbB+jir7m862N8DsFgnBMZFZ1P/XFPKZ00ViF7NjA5qUviVYe
	9Zk0lDAeA1Ez1X5NjeF8duIoHMcgLFcVb0IBVz+mvbTd65xjNO51AjRKj4VydrpZ6sJvMZJGBiGQc
	laFMkACOczkxzpGMUp+AIq3yKe5trem5zHhsOv8Y4YwySd5MJqFmWRFtyvCkcrrEBctInTiuoVdCA
	kYcDg8Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPaYm-00000003fya-1au3;
	Wed, 20 May 2026 06:37:40 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPaYd-00000003fu3-0DxN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 06:37:32 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Vu3EZBeWinYUHPBmY/X090V8/6NEcv7XCtOXv6H294Q=;
	b=DTUgcXX0QCOxzf8m0FRgEYq6mHvJ8fm5/LaunYVYwK8xC/eRMYpl+bJhsuFUryDpThYXxX4SD
	zD5E2giVkd242GleR1g//3guxL955J3f6aBVzlkV2nSgD1kadg92DnjwG042X0ideouW+DMHrsE
	PjSrMIPTDI/RKohWj9cLQ1I=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gL1qt6q77z12LDX;
	Wed, 20 May 2026 14:30:18 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 307AB40537;
	Wed, 20 May 2026 14:37:20 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 20 May 2026 14:37:19 +0800
From: Qinxin Xia <xiaqinxin@huawei.com>
To: <robin.murphy@arm.com>, <nicolinc@nvidia.com>, <will@kernel.org>,
	<jpb@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<xiaqinxin@huawei.com>, <wangzhou1@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>,
	<jonathan.cameron@huawei.com>, <wuyifan50@huawei.com>, <linuxarm@huawei.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 4/5] iommu/arm-smmu-v3: Add device symlink in stream table debugfs
Date: Wed, 20 May 2026 14:37:10 +0800
Message-ID: <20260520063714.2440584-4-xiaqinxin@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260328101706.3448655-1-xiaqinxin@huawei.com>
References: <20260328101706.3448655-1-xiaqinxin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_233731_412663_47C8E25C 
X-CRM114-Status: GOOD (  12.73  )
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

Add a symlink named  under each stream table entry directory pointing to
the sysfs directory of the actual device. This aids debugging
by providing direct access to device attributes.

/sys/kernel/debug/iommu/arm_smmu_v3/smmu0/stream_table/
└── <sid>/
    ├─── ste
    └─── <dev_name>

Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
index a5866f34264f..9babc7d640fd 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
@@ -10,6 +10,7 @@
  *     ├── stream_table
  *         ├── <sid>/                                # Stream ID
  *             ├── ste                               # Stream Table Entry
+ *             ├── <dev_name>                         # Symlink to device sysfs directory
  *
  * The capabilities file provides detailed information about:
  * - translation stage support (Stage1/Stage2)
@@ -31,6 +32,7 @@
 
 #include <linux/cleanup.h>
 #include <linux/debugfs.h>
+#include <linux/kobject.h>
 #include <linux/slab.h>
 #include "arm-smmu-v3.h"
 
@@ -314,6 +316,7 @@ int arm_smmu_debugfs_create_stream_table(struct arm_smmu_device *smmu,
 	struct dentry *stream_dir, *dev_dir;
 	struct arm_smmu_master *master;
 	struct ste_context *ctx;
+	char *path = NULL, *full_path;
 	char name[64];
 	u32 sid;
 	int i;
@@ -338,6 +341,9 @@ int arm_smmu_debugfs_create_stream_table(struct arm_smmu_device *smmu,
 	if (!master || !master->num_streams)
 		return -ENODEV;
 
+	/* Get device sysfs path once, reuse for all streams */
+	path = kobject_get_path(&dev->kobj, GFP_KERNEL);
+
 	for (i = 0; i < master->num_streams; i++) {
 		sid = master->streams[i].id;
 		snprintf(name, sizeof(name), "%u", sid);
@@ -357,8 +363,19 @@ int arm_smmu_debugfs_create_stream_table(struct arm_smmu_device *smmu,
 		spin_unlock(&smmu->debugfs->stream_lock);
 		debugfs_create_file("ste", 0444, dev_dir, ctx,
 				    &smmu_debugfs_ste_fops);
+
+		/* Create a symlink to the device's sysfs directory */
+		if (path) {
+			full_path = kasprintf(GFP_KERNEL, "/sys%s", path);
+			if (full_path) {
+				debugfs_create_symlink(dev_name(dev), dev_dir,
+						       full_path);
+				kfree(full_path);
+			}
+		}
 	}
 
+	kfree(path);
 	return 0;
 }
 
-- 
2.33.0


