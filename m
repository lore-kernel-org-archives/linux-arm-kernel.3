Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10027CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 08:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgSbNB86hBr0nIiuK7Gc2NNQab6zMNQMrwO427lrOcs=; b=GhZk8SOGh3KfQFKtUKve6QczqN
	gekKrr6zJT1/RyniynSKGBCVRy5pJp1sQSoASoOsSo1tcoue1sLNBAxpM190Qr6mUOJXT4PPAVFrT
	NkHsKvqcuJ/X62geRUTlHL8PkrlJW5MxarSYR/WPqE8gViNmf63XDWlSakbV5sOFS1PCOUKLaubJO
	YGz4b9cobnHgWeALxKY/waS9V4dZN++8xNBxChNp29BW5pEF+AM3hfloZAP68HhWybDGr4gMmg5n2
	DETu/LX5iD0iGGjMt5oOhQy61GLqU61SLKpsQegmcTqi4Wn3bmTFmZUNrDQGzQ/8caWBxU5V7tUQk
	neVO0dMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHI4f-0000000Gu8A-27Lc;
	Fri, 07 Nov 2025 08:44:01 +0000
Received: from mail-m49210.qiye.163.com ([45.254.49.210])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHI4d-0000000Gu48-08qE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:44:00 +0000
Received: from localhost.localdomain (unknown [122.224.147.158])
	by smtp.qiye.163.com (Hmail) with ESMTP id 28c500970;
	Fri, 7 Nov 2025 16:43:35 +0800 (GMT+08:00)
From: Shouping Wang <allen.wang@hj-micro.com>
To: will@kernel.org,
	robin.murphy@arm.com
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	allen.wang@hj-micro.com,
	andy.xu@hj-micro.com,
	peter.du@hj-micro.com
Subject: [PATCH 2/2] perf: arm-ni: add topology debug info for the clock domain
Date: Fri,  7 Nov 2025 16:43:19 +0800
Message-ID: <20251107084320.555979-3-allen.wang@hj-micro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107084320.555979-1-allen.wang@hj-micro.com>
References: <20251107084320.555979-1-allen.wang@hj-micro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a5d7c3fe709d9kunm533ae5d212b2e0c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSUhKVk1MGUkZGk9DSh9MQ1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUpPTFVKTkNZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_004359_240069_8317EF45 
X-CRM114-Status: GOOD (  16.60  )
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

When capturing PMU info with perf, it is necessary to know the nodeid of 
the interface. Here, we add topology debug info for the clock domain to 
display the nodeid of the interfaces.

$ cat /sys/kernel/debug/arm-ni/map_1f3c06
as shown below:
| HSNI #5 || PMNI #6 || PMU  #14 |

Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
---
 drivers/perf/arm-ni.c | 63 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
index 32eabdbe877a..e0f0e18d0120 100644
--- a/drivers/perf/arm-ni.c
+++ b/drivers/perf/arm-ni.c
@@ -13,6 +13,7 @@
 #include <linux/perf_event.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/debugfs.h>
 
 /* Common registers */
 #define NI_NODE_TYPE		0x000
@@ -110,6 +111,7 @@ struct arm_ni_cd {
 	struct arm_ni_unit *units;
 	struct perf_event *evcnt[NI_NUM_COUNTERS];
 	struct perf_event *ccnt;
+	struct dentry *debug;
 };
 
 struct arm_ni {
@@ -476,6 +478,59 @@ static irqreturn_t arm_ni_handle_irq(int irq, void *dev_id)
 	}
 }
 
+static struct dentry *arm_ni_cd_debugfs;
+
+#ifdef CONFIG_DEBUG_FS
+static const char *arm_ni_node_type(enum ni_node_type type)
+{
+	switch (type) {
+	case NI_ASNI:
+		return "| ASNI ";
+	case NI_AMNI:
+		return "| AMNI ";
+	case NI_PMU:
+		return "| PMU  ";
+	case NI_HSNI:
+		return "| HSNI ";
+	case NI_HMNI:
+		return "| HMNI ";
+	case NI_PMNI:
+		return "| PMNI ";
+	default:
+		return "| ???? ";
+	}
+}
+
+static int arm_ni_cd_map_show(struct seq_file *s, void *data)
+{
+	struct arm_ni_cd *cd = s->private;
+
+	cd_for_each_unit(cd, unit) {
+		seq_printf(s, "%s#%-2d |", arm_ni_node_type(unit->type), unit->id);
+	}
+	seq_puts(s, "\n");
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(arm_ni_cd_map);
+
+static void arm_ni_cd_debugfs_init(struct arm_ni_cd *cd, u64 res_start)
+{
+	const char *name = "map";
+
+	if (res_start > 0)
+		name = devm_kasprintf(cd_to_ni(cd)->dev, GFP_KERNEL, "map_%llx",
+				res_start >> NI_PMU_PA_SHIFT);
+	if (!name)
+		return;
+
+	cd->debug = debugfs_create_file(name, 0444, arm_ni_cd_debugfs, cd, &arm_ni_cd_map_fops);
+}
+#else
+static void arm_ni_cd_debugfs_init(struct arm_ni_cd *cd, u64 res_start) {}
+#endif
+
 static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_start)
 {
 	struct arm_ni_cd *cd = ni->cds + node->id;
@@ -563,6 +618,7 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
 	name = devm_kasprintf(ni->dev, GFP_KERNEL, "arm_ni_%llx", res_start >> NI_PMU_PA_SHIFT);
 	if (!name)
 		return -ENOMEM;
+	arm_ni_cd_debugfs_init(cd, res_start);
 
 	return perf_pmu_register(&cd->pmu, name, -1);
 }
@@ -575,6 +631,7 @@ static void arm_ni_remove(struct platform_device *pdev)
 		writel_relaxed(0, cd->pmu_base + NI_PMCR);
 		writel_relaxed(U32_MAX, cd->pmu_base + NI_PMINTENCLR);
 		perf_pmu_unregister(&cd->pmu);
+		debugfs_remove(cd->debug);
 	}
 	cpuhp_state_remove_instance_nocalls(arm_ni_hp_state, &ni->cpuhp_node);
 }
@@ -787,9 +844,12 @@ static int __init arm_ni_init(void)
 
 	arm_ni_hp_state = ret;
 
+	arm_ni_cd_debugfs = debugfs_create_dir("arm-ni", NULL);
 	ret = platform_driver_register(&arm_ni_driver);
-	if (ret)
+	if (ret) {
 		cpuhp_remove_multi_state(arm_ni_hp_state);
+		debugfs_remove(arm_ni_cd_debugfs);
+	}
 	return ret;
 }
 
@@ -797,6 +857,7 @@ static void __exit arm_ni_exit(void)
 {
 	platform_driver_unregister(&arm_ni_driver);
 	cpuhp_remove_multi_state(arm_ni_hp_state);
+	debugfs_remove(arm_ni_cd_debugfs);
 }
 
 module_init(arm_ni_init);
-- 
2.43.0


