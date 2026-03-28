Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA42C10F3DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 10:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEfQ2xHD20u2SNJPKNUNUUMLTWyeWszA9wRDOE62vLc=; b=girFZRXsNpBkNgCPLg0/mgDyet
	hqn9cbhiS2/J/r8h0tG/VoOpfvfCa6a03dVm7MSg0y2QWG+ROJdoPd9szAUuQyzjvVOGmHoiE1KlS
	8LHZ7E/FXTryFw4zmWa4irAfECYU3aQaQyQsIOWUvGUG02IJ0TJJNE03p/HJfLIrP6xQHEpsjuing
	0zm6xHuN4JOq5xSrCFLqOr4+/+mmIMN+TfeDbLmvBxPylKkP2EU7sYLOjUVe7uu0oPMVLg+lG5lDf
	bdnddz8RTvK4gExYUiK7uTwYdAjm5g0g0r5eKzZhI4SjKw+ABEpMGe14eQ4ZT7RUy1E6eklfo2opz
	zPxqF0Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QjP-00000008paM-0KBK;
	Sat, 28 Mar 2026 10:17:27 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QjE-00000008pVZ-1QoF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 10:17:17 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zEfQ2xHD20u2SNJPKNUNUUMLTWyeWszA9wRDOE62vLc=;
	b=cWsDiIDox67v1VfnLwL3COzpfWl/zHQy+xzjtvGgkgF5nnzZ69dsU/MT5LgpVfsBbXbqEogm1
	yi+rkN5uJADT2kmyr5E3gdeQitAdEpzq/yul6Z0nefWUnNcLGzKaS+WKXKMof2ZS9LH0tZY1Bef
	liOWaPfDh1Tqhwehso/utHE=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fjYFr1Qwgz12LJ1;
	Sat, 28 Mar 2026 18:11:44 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id C2B2D40538;
	Sat, 28 Mar 2026 18:17:09 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 28 Mar 2026 18:17:09 +0800
From: Qinxin Xia <xiaqinxin@huawei.com>
To: <robin.murphy@arm.com>, <nicolinc@nvidia.com>, <will@kernel.org>,
	<jpb@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<xiaqinxin@huawei.com>, <wangzhou1@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>,
	<jonathan.cameron@huawei.com>, <wuyifan50@huawei.com>, <linuxarm@huawei.com>
Subject: [RFC PATCH v2 4/5] iommu/arm-smmu-v3: Add device symlink in stream table debugfs
Date: Sat, 28 Mar 2026 18:17:05 +0800
Message-ID: <20260328101706.3448655-5-xiaqinxin@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260328101706.3448655-1-xiaqinxin@huawei.com>
References: <20260328101706.3448655-1-xiaqinxin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_031716_723492_7CB45F30 
X-CRM114-Status: GOOD (  10.46  )
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
 .../arm/arm-smmu-v3/arm-smmu-v3-debugfs.c     | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
index 70623b480d64..dbcc8fce6d8e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
@@ -8,8 +8,9 @@
  *     ├── capabilities    # SMMU feature capabilities and configuration
  *     ├── registers	   # SMMU Key registers
  *     └── stream_table
- *	   └─── <sid>/                                # Stream ID 0
- *	       └── ste                                # Stream Table Entry
+ *	   └─── <sid>/                                # Stream ID
+ *	       ├─── ste                               # Stream Table Entry
+ *	       └── <dev_name>                         # Symlink to device sysfs directory
  *
  * The capabilities file provides detailed information about:
  * - translation stage support (Stage1/Stage2)
@@ -31,6 +32,7 @@
 
 #include <linux/cleanup.h>
 #include <linux/debugfs.h>
+#include <linux/kobject.h>
 #include <linux/slab.h>
 #include "arm-smmu-v3.h"
 
@@ -295,6 +297,7 @@ int arm_smmu_debugfs_create_stream_table(struct device *dev,
 	struct dentry *stream_dir, *dev_dir;
 	struct arm_smmu_master *master;
 	struct ste_context *ctx;
+	char *path, *full_path;
 	char name[64];
 	u32 sid;
 	int i;
@@ -333,6 +336,18 @@ int arm_smmu_debugfs_create_stream_table(struct device *dev,
 		debugfs_create_file("ste", 0444, dev_dir, ctx,
 				    &smmu_debugfs_ste_fops);
 
+		/* Create a symlink to the device's sysfs directory */
+		path = kobject_get_path(&dev->kobj, GFP_KERNEL);
+		if (!path)
+			continue;
+
+		full_path = kasprintf(GFP_KERNEL, "/sys%s", path);
+		if (full_path) {
+			debugfs_create_symlink(dev_name(dev), dev_dir, full_path);
+			kfree(full_path);
+		}
+
+		kfree(path);
 	}
 
 	return 0;
-- 
2.33.0


