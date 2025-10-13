Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7FBCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 06:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t+kQn+l8NiDpU6SXgOx9uxgsvDw/42sI1GnBIfHgYJM=; b=Knp9DdtB5MxlO7HXeIaG/uOyLT
	p8u+k8ld4P0tYJ91OFkvnvllZiYViHi7RTZnxQeZdtaC6ur7WgE0LDBGPy6VVEYpV7f2AI4SE65Jk
	hES7mEhLYsLrcPLrBry/a+AekNdbzCb3eTThbQooNEEHK/n3MhCcSpRgeDBv/iB3G4HSvp1Px15TC
	FimUOsCQJzsBkCO3mZYim6TBJF48b7a8GYMWppuA47sSF1hNz5He/yvXCdkC060kZQeIJg0edbWzv
	NCbGZ/dv7/TLY6T/TJJflA6uNpIoiJbpXVcYf8aIDLNCbs7q84Gjz8rwSyYDUD+bBQGz61ONTWeCt
	0s1RmyrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8CHG-0000000CQDK-1hvR;
	Mon, 13 Oct 2025 06:43:26 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8CHD-0000000CQBv-2HhF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 06:43:25 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=t+kQn+l8NiDpU6SXgOx9uxgsvDw/42sI1GnBIfHgYJM=;
	b=aDD8GUUOo7J4GGh/PfNuwch4LNYMaSdXOXUG5aoAR+1gaa2qiX1XEz8mlaFPTjr2FC0n+iLA8
	BAz1gD8BF70nCt6k4GcNjEsQ99SJ7uhSv6kKfrUvNe19APR3368XZ1+WX1QD/hm2AAaxeffIHaW
	ETsw4b0yuUOSU8QzlFWxdYY=
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4clSTQ3gMhz1cyQv;
	Mon, 13 Oct 2025 14:42:50 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 7B2C91A016C;
	Mon, 13 Oct 2025 14:43:09 +0800 (CST)
Received: from kwepemq200012.china.huawei.com (7.202.194.183) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 13 Oct 2025 14:43:09 +0800
Received: from huawei.com (10.175.112.208) by kwepemq200012.china.huawei.com
 (7.202.194.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 13 Oct
 2025 14:43:08 +0800
From: Wang Wensheng <wangwensheng4@huawei.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@ziepe.ca>, <nicolinc@nvidia.com>, <kevin.tian@intel.com>,
	<praan@google.com>, <baolu.lu@linux.intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
CC: <chenjun102@huawei.com>, <wangwensheng4@huawei.com>
Subject: [RFC PATCH] iommu/arm-smmu-v3: Defer shutdown to syscore_ops
Date: Mon, 13 Oct 2025 14:35:29 +0800
Message-ID: <20251013063529.108949-1-wangwensheng4@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200012.china.huawei.com (7.202.194.183)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_234324_222325_3A499001 
X-CRM114-Status: GOOD (  20.07  )
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

We meet several softlockup while shutdown or reboot the system. The
kernel log is here:

[  126.487508] arm-smmu-v3 a8000000.camera_smmu_controller0: CMD_SYNC timeout at 0x000001a3 [hwprod 0x000001a4, hwcons 0x00000016]
[  126.487675] (4375,3191)[drv_camera][hicam_buf] isp_smmu_cleanup_iova_dom cluster_id=0 unmap, key=0x0000000000000000, iova=0x0000000000000000, size=49152
[  127.300458] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[  127.300464] rcu: 	3-...0: (8 ticks this GP) idle=086/1/0x4000000000000000 softirq=25646/25646 fqs=2475
[  127.300466] rcu: 	(detected by 0, t=5252 jiffies, g=30897, q=752)
[  127.300470] Sending NMI from CPU 0 to CPUs 3:
[  127.556735] arm-smmu-v3 a8000000.camera_smmu_controller0: CMD_SYNC timeout at 0x000001b0 [hwprod 0x000001b1, hwcons 0x00000016]
[  127.556966] (4375,3191)[drv_camera][hicam_buf] isp_smmu_cleanup_iova_dom cluster_id=0 unmap, key=0x0000000000000000, iova=0x0000000000000000, size=49152
[  128.626066] arm-smmu-v3 a8000000.camera_smmu_controller0: CMD_SYNC timeout at 0x000001bd [hwprod 0x000001be, hwcons 0x00000016]
[  128.626232] (4375,3191)[drv_camera][hicam_buf] isp_smmu_cleanup_iova_dom cluster_id=0 unmap, key=0x0000000000000000, iova=0x0000000000000000, size=49152
...
[  132.903350] watchdog: BUG: soft lockup - CPU#7 stuck for 23s! [dds_discovery:3191]
...
[  132.903564] Call trace:
[  132.903566]  arm_smmu_cmdq_issue_cmdlist+0x560/0x6c8
[  132.903568]  __arm_smmu_tlb_inv_range.isra.41+0x160/0x20c
[  132.903570]  arm_smmu_tlb_inv_range_domain+0x90/0x164
[  132.903572]  arm_smmu_iotlb_sync+0x3c/0x50
[  132.903576]  iommu_unmap+0x88/0xc0
[  132.903589]  isp_smmu_do_iommu_unmap.isra.6+0x5c/0x128 [drv_hicam_buf]
[  132.903594]  isp_smmu_unmap_iova+0x128/0x2f4 [drv_hicam_buf]
[  132.903598]  isp_smmu_cleanup_iova_dom+0xf0/0x1c8 [drv_hicam_buf]
[  132.903602]  hicambuf_check_and_ummap_remain_buffer+0x90/0xa0 [drv_hicam_buf]
[  132.903609]  himdcisp_release+0x1d0/0x228 [drv_himdcisp]
[  132.903615]  __fput+0xa4/0x2cc
[  132.903617]  ____fput+0x20/0x30
[  132.903620]  task_work_run+0x120/0x198
[  132.903623]  do_exit+0x444/0xd20
[  132.903625]  do_group_exit+0x40/0x140
[  132.903628]  get_signal+0x21c/0xab0
[  132.903630]  do_notify_resume+0x380/0x4a8

The direct reason for this softlockup is that the driver want to access
the smmu device after it has been shutdown. Here the driver call the
iommu_unmap() a few times and get CMD_SYNC timeout, cost one second a
time, then the cpu where the driver runs on get stuck. There is another
case where a process that was bound to several smmu devices is exiting,
then the process would access the smmu devices through mmu_notifer
callbacks and get the similar stuck.

[   93.161307] Call trace:
[   93.161309]  arm_smmu_cmdq_issue_cmdlist+0x58c/0x948
[   93.161313]  __arm_smmu_cmdq_issue_cmd+0x60/0xb0
[   93.161316]  arm_smmu_tlb_inv_asid+0x6c/0x98
[   93.161321]  arm_smmu_mm_release+0x70/0xd4
[   93.161325]  __mmu_notifier_release+0x88/0x268
[   93.161332]  exit_mmap+0x374/0x4b4
[   93.161339]  mmput+0x7c/0x1c4
[   93.161346]  xsmem_release+0x6a8/0x91c [xsmem]
[   93.161364]  __fput+0x21c/0x340
[   93.161369]  ____fput+0x20/0x30
[   93.161371]  task_work_run+0x104/0x1a0
[   93.161377]  do_exit+0x4c0/0xe60
[   93.161382]  do_group_exit+0x38/0x138

Normally the reboot/shutdown command would kill all the process before
calling into kernel. But the user process may not exit in time, so the
process could run on the reboot_cpu while the reboot/shutdown command
running on another cpu run into kernel and shutdown smmu devices. Then
the process runs on the reboot_cpu would get stcuk and block the
reboot/shutdown command in migrate_to_reboot_cpu(). Move the shutdown
for smmu to syscore_ops to solve the issue. Because syscore_ops
would be called after migrate_to_reboot_cpu() and even another process
would access smmu device in other cpus after smmu shutdown, it cannot
block the reboot process.

Signed-off-by: Wang Wensheng <wangwensheng4@huawei.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 39 ++++++++++++++++-----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  2 ++
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 2a8b46b948f0..cf43ea249f22 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -29,6 +29,7 @@
 #include <linux/string_choices.h>
 #include <kunit/visibility.h>
 #include <uapi/linux/iommufd.h>
+#include <linux/syscore_ops.h>
 
 #include "arm-smmu-v3.h"
 #include "../../dma-iommu.h"
@@ -38,6 +39,9 @@ module_param(disable_msipolling, bool, 0444);
 MODULE_PARM_DESC(disable_msipolling,
 	"Disable MSI-based polling for CMD_SYNC completion.");
 
+static LIST_HEAD(smmu_device_list);
+static DEFINE_MUTEX(smmu_device_lock);
+
 static const struct iommu_ops arm_smmu_ops;
 static struct iommu_dirty_ops arm_smmu_dirty_ops;
 
@@ -4835,6 +4839,9 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 		goto err_free_sysfs;
 	}
 
+	scoped_guard(mutex, &smmu_device_lock)
+		list_add(&smmu->list_node, &smmu_device_list);
+
 	return 0;
 
 err_free_sysfs:
@@ -4850,6 +4857,8 @@ static void arm_smmu_device_remove(struct platform_device *pdev)
 {
 	struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
 
+	scoped_guard(mutex, &smmu_device_lock)
+		list_del(&smmu->list_node);
 	iommu_device_unregister(&smmu->iommu);
 	iommu_device_sysfs_remove(&smmu->iommu);
 	arm_smmu_device_disable(smmu);
@@ -4857,23 +4866,36 @@ static void arm_smmu_device_remove(struct platform_device *pdev)
 	ida_destroy(&smmu->vmid_map);
 }
 
-static void arm_smmu_device_shutdown(struct platform_device *pdev)
-{
-	struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
-
-	arm_smmu_device_disable(smmu);
-}
-
 static const struct of_device_id arm_smmu_of_match[] = {
 	{ .compatible = "arm,smmu-v3", },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, arm_smmu_of_match);
 
+static void arm_smmu_shutdown(void)
+{
+	struct arm_smmu_device *smmu;
+
+	guard(mutex)(&smmu_device_lock);
+	list_for_each_entry(smmu, &smmu_device_list, list_node)
+		arm_smmu_device_disable(smmu);
+}
+
+static struct syscore_ops arm_smmu_syscore_ops = {
+	.shutdown = arm_smmu_shutdown,
+};
+
 static void arm_smmu_driver_unregister(struct platform_driver *drv)
 {
 	arm_smmu_sva_notifier_synchronize();
 	platform_driver_unregister(drv);
+	unregister_syscore_ops(&arm_smmu_syscore_ops);
+}
+
+static int arm_smmu_driver_register(struct platform_driver *drv)
+{
+	register_syscore_ops(&arm_smmu_syscore_ops);
+	return platform_driver_register(drv);
 }
 
 static struct platform_driver arm_smmu_driver = {
@@ -4884,9 +4906,8 @@ static struct platform_driver arm_smmu_driver = {
 	},
 	.probe	= arm_smmu_device_probe,
 	.remove = arm_smmu_device_remove,
-	.shutdown = arm_smmu_device_shutdown,
 };
-module_driver(arm_smmu_driver, platform_driver_register,
+module_driver(arm_smmu_driver, arm_smmu_driver_register,
 	      arm_smmu_driver_unregister);
 
 MODULE_DESCRIPTION("IOMMU API for ARM architected SMMUv3 implementations");
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index ae23aacc3840..1bb952e99676 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -805,6 +805,8 @@ struct arm_smmu_device {
 
 	struct rb_root			streams;
 	struct mutex			streams_mutex;
+
+	struct list_head		list_node;
 };
 
 struct arm_smmu_stream {
-- 
2.22.0


