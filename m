Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992B3E67498
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 09:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72cxXQagokwmA/cZnex2Pm94HvbMxhBEqjUGllZTVzo=; b=GKv6cL4ljWiQvWFZW24U/H+jeb
	a34coU+JhqXnAEWhP733FzrnkvgWUWFSuhUyqJ0mCo4a2BHmXEIKNPxWERRLfsu8fnK58BQ043yOE
	qtprbR44QbEKegZ09+71DDM+9KYc7ffQ/0i+A28SolQkLV6w3inwkme0boseHVaqlPmONSPUziCFL
	s2ZuNXVqRCKX5UA27PC0vViYRjrEhWzZZgnelbclcQ4tvGyVmSx06DkHARSZ8DVhklhxwE/75mnTu
	ywdGnoS12Lx48zVrnDxZ3WdTBJRY6/AL8lf+dFMLgO8sqEyFvTJDOvyw8fi+6DtJtp1RsMIorKekP
	FXvDaDQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcSw-0000000DXdQ-2OVs;
	Mon, 22 Dec 2025 09:44:34 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcSp-0000000DXVd-16DO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 09:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766396665; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=72cxXQagokwmA/cZnex2Pm94HvbMxhBEqjUGllZTVzo=;
	b=iIA2kEZfqEB0N+vusbQqkBnO5BonRWHtz21fniMNqnd7PHuOdYjLTnoYYM7X2dsue7coqtgu7uJVo3N//aZA08uE5OspyPN/ENLQnyFu9tIzGptB2tTuwz612a/rRyEbI73tXs4lctwBmtgsEr83lVgzOIJ0nmbJtScjl/Kc2iY=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WvOT.TX_1766396662 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 22 Dec 2025 17:44:24 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lpieralisi@kernel.org,
	guohanjun@huawei.com,
	sudeep.holla@arm.com,
	xueshuai@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	lenb@kernel.org,
	tony.luck@intel.com,
	bp@alien8.de,
	yazen.ghannam@amd.com,
	misono.tomohiro@fujitsu.com
Cc: tianruidong@linux.alibaba.com
Subject: [PATCH v4 09/17] ras: AEST: Add cpuhp callback
Date: Mon, 22 Dec 2025 17:43:42 +0800
Message-Id: <20251222094351.38792-10-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20251222094351.38792-1-tianruidong@linux.alibaba.com>
References: <20251222094351.38792-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_014427_630702_6F1E15F5 
X-CRM114-Status: GOOD (  15.90  )
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

Move the configuration of interrupts and CE thresholds
into the CPU hotplug callbacks for the per-CPU AEST node.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 drivers/ras/aest/aest-core.c | 118 ++++++++++++++++++++++++++++++++++-
 drivers/ras/aest/aest.h      |   5 ++
 include/linux/cpuhotplug.h   |   1 +
 3 files changed, 121 insertions(+), 3 deletions(-)

diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
index 5ec0ba38f51b..686dde6f2e68 100644
--- a/drivers/ras/aest/aest-core.c
+++ b/drivers/ras/aest/aest-core.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2025, Alibaba Group.
  */
 
+#include <linux/cpu.h>
 #include <linux/interrupt.h>
 #include <linux/panic.h>
 #include <linux/platform_device.h>
@@ -563,8 +564,6 @@ static int aest_init_record(struct aest_record *record, int i,
 	record->addressing_mode = test_bit(i, node->info->addressing_mode);
 	record->index = i;
 	record->node = node;
-	aest_set_ce_threshold(record);
-	aest_enable_irq(record);
 
 	aest_record_dbg(record, "base: %p, index: %d, address mode: %x\n",
 			record->regs_base, record->index,
@@ -572,9 +571,113 @@ static int aest_init_record(struct aest_record *record, int i,
 	return 0;
 }
 
+static void aest_online_record(struct aest_record *record, void *data)
+{
+	if (record_read(record, ERXFR) & ERR_FR_CE)
+		aest_set_ce_threshold(record);
+
+	aest_enable_irq(record);
+}
+
+static void aest_online_oncore_node(struct aest_node *node)
+{
+	int count;
+
+	count = aest_proc(node);
+	aest_node_dbg(node, "Find %d error on CPU%d before AEST probe\n", count,
+		      smp_processor_id());
+
+	aest_node_foreach_record(aest_online_record, node, NULL,
+				 node->record_implemented);
+
+	aest_node_foreach_record(aest_online_record, node, NULL,
+				 node->status_reporting);
+}
+
+static void aest_online_oncore_dev(void *data)
+{
+	int fhi_irq, eri_irq, i;
+	struct aest_device *adev = this_cpu_ptr(data);
+
+	for (i = 0; i < adev->node_cnt; i++)
+		aest_online_oncore_node(&adev->nodes[i]);
+
+	fhi_irq = adev->irq[ACPI_AEST_NODE_FAULT_HANDLING];
+	if (fhi_irq > 0)
+		enable_percpu_irq(fhi_irq, IRQ_TYPE_NONE);
+	eri_irq = adev->irq[ACPI_AEST_NODE_ERROR_RECOVERY];
+	if (eri_irq > 0)
+		enable_percpu_irq(eri_irq, IRQ_TYPE_NONE);
+}
+
+static void aest_offline_oncore_dev(void *data)
+{
+	int fhi_irq, eri_irq;
+	struct aest_device *adev = this_cpu_ptr(data);
+
+	fhi_irq = adev->irq[ACPI_AEST_NODE_FAULT_HANDLING];
+	if (fhi_irq > 0)
+		disable_percpu_irq(fhi_irq);
+	eri_irq = adev->irq[ACPI_AEST_NODE_ERROR_RECOVERY];
+	if (eri_irq > 0)
+		disable_percpu_irq(eri_irq);
+}
+
+static void aest_online_dev(struct aest_device *adev)
+{
+	int count, i;
+	struct aest_node *node;
+
+	for (i = 0; i < adev->node_cnt; i++) {
+		node = &adev->nodes[i];
+
+		if (!node->name)
+			continue;
+
+		count = aest_proc(node);
+		aest_node_dbg(node, "Find %d error before AEST probe\n", count);
+
+		aest_config_irq(node);
+
+		aest_node_foreach_record(aest_online_record, node, NULL,
+					 node->record_implemented);
+		aest_node_foreach_record(aest_online_record, node, NULL,
+					 node->status_reporting);
+	}
+}
+
+static int aest_starting_cpu(unsigned int cpu)
+{
+	pr_debug("CPU%d starting\n", cpu);
+	aest_online_oncore_dev(&percpu_adev);
+
+	return 0;
+}
+
+static int aest_dying_cpu(unsigned int cpu)
+{
+	pr_debug("CPU%d dying\n", cpu);
+	aest_offline_oncore_dev(&percpu_adev);
+
+	return 0;
+}
+
 static void aest_device_remove(struct platform_device *pdev)
 {
+	struct aest_device *adev = platform_get_drvdata(pdev);
+	int i;
+
 	platform_set_drvdata(pdev, NULL);
+
+	if (adev->type != ACPI_AEST_PROCESSOR_ERROR_NODE)
+		return;
+
+	on_each_cpu(aest_offline_oncore_dev, adev->adev_oncore, 1);
+
+	for (i = 0; i < MAX_GSI_PER_NODE; i++) {
+		if (adev->irq[i])
+			free_percpu_irq(adev->irq[i], adev->adev_oncore);
+	}
 }
 
 static char *alloc_aest_node_name(struct aest_node *node)
@@ -682,7 +785,6 @@ static int aest_init_node(struct aest_device *adev, struct aest_node *node,
 				return -ENOMEM;
 		}
 	}
-	aest_config_irq(node);
 
 	ret = aest_node_set_errgsr(adev, node);
 	if (ret)
@@ -826,6 +928,16 @@ static int aest_device_probe(struct platform_device *pdev)
 		aest_dev_err(adev, "register irq failed\n");
 		return ret;
 	}
+
+	if (aest_dev_is_oncore(adev))
+		ret = cpuhp_setup_state(CPUHP_AP_ARM_AEST_STARTING,
+					"drivers/acpi/arm64/aest:starting",
+					aest_starting_cpu, aest_dying_cpu);
+	else
+		aest_online_dev(adev);
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, adev);
 
 	aest_dev_dbg(adev, "Node cnt: %x, id: %x\n", adev->node_cnt, adev->id);
diff --git a/drivers/ras/aest/aest.h b/drivers/ras/aest/aest.h
index a5e43b2a2e90..f85e81ff35a6 100644
--- a/drivers/ras/aest/aest.h
+++ b/drivers/ras/aest/aest.h
@@ -339,3 +339,8 @@ static inline void aest_sync(struct aest_node *node)
 	if (node->type == ACPI_AEST_PROCESSOR_ERROR_NODE)
 		isb();
 }
+
+static inline bool aest_dev_is_oncore(struct aest_device *adev)
+{
+	return adev->type == ACPI_AEST_PROCESSOR_ERROR_NODE;
+}
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 62cd7b35a29c..831fe9011943 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -179,6 +179,7 @@ enum cpuhp_state {
 	CPUHP_AP_HYPERV_TIMER_STARTING,
 	/* Must be the last timer callback */
 	CPUHP_AP_DUMMY_TIMER_STARTING,
+	CPUHP_AP_ARM_AEST_STARTING,
 	CPUHP_AP_ARM_XEN_STARTING,
 	CPUHP_AP_ARM_XEN_RUNSTATE_STARTING,
 	CPUHP_AP_ARM_CORESIGHT_STARTING,
-- 
2.51.2.612.gdc70283dfc


