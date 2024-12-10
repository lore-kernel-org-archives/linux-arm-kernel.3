Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8F5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJgggTgO8N+Vok8HWgtqHu6JUBi6YQxNoPBL1gQcIFo=; b=QgoeFTdXXbnxJ9NTrDHUR7zc5M
	R6RmlsXgx9xdztSULZSy6o4vXf3DVtjGUMb98RpOCw7Wv9cd5lbfDsfaWiwkXeLHZJQtrpWCALnDZ
	GjL1loKEF25v5fVzjflJ+Uf98FdrZIT2doCAzJKNtw1m6yy4SWxse/gf0HOV/50ocRnNhgnlnUX3L
	8dDNGzrNyiNwf8WbJtRzjNV5D9nAwh9jknDdv/jc8StchxoN8mW/2s9ThU5qYtq9rqlnM6zXbPIbR
	slLZGq3PbfqdadS7Wxoqxc/0iNPhd6nM1rOLRyMIwz3nRUG037HMiRGg5VCqssli0/XeBqf2pbsGb
	L19o6SJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL17V-0000000BjfK-284j;
	Tue, 10 Dec 2024 14:21:49 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL12M-0000000BiHO-1xcP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:16:33 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Y711f0Djfz1kvSW;
	Tue, 10 Dec 2024 22:13:58 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 8765C14010C;
	Tue, 10 Dec 2024 22:16:22 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 10 Dec 2024 22:16:21 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <jonathan.cameron@huawei.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <yangyicong@hisilicon.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	<wangyushan12@huawei.com>, <prime.zeng@hisilicon.com>
Subject: [PATCH v5 01/10] drivers/perf: hisi: Define a symbol namespace for HiSilicon Uncore PMUs
Date: Tue, 10 Dec 2024 22:15:16 +0800
Message-ID: <20241210141525.37788-2-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241210141525.37788-1-yangyicong@huawei.com>
References: <20241210141525.37788-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_061630_868684_5344C408 
X-CRM114-Status: GOOD (  11.77  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

The HiSilicon Uncore PMU framework implements some common functions
and exported them to the drivers. Use a specific HISI_PMU namespace
for the exported symbols to avoid pollute the generic ones.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c  |  1 +
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c |  1 +
 drivers/perf/hisilicon/hisi_uncore_hha_pmu.c  |  1 +
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c  |  1 +
 drivers/perf/hisilicon/hisi_uncore_pa_pmu.c   |  1 +
 drivers/perf/hisilicon/hisi_uncore_pmu.c      | 36 +++++++++----------
 drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c |  1 +
 drivers/perf/hisilicon/hisi_uncore_uc_pmu.c   |  1 +
 8 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c b/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c
index 3f3fb1de11f5..052509213c51 100644
--- a/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c
@@ -389,6 +389,7 @@ static void __exit hisi_cpa_pmu_module_exit(void)
 }
 module_exit(hisi_cpa_pmu_module_exit);
 
+MODULE_IMPORT_NS("HISI_PMU");
 MODULE_DESCRIPTION("HiSilicon SoC CPA PMU driver");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Qi Liu <liuqi115@huawei.com>");
diff --git a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
index a6ebf2ec99d3..049aa4b47e57 100644
--- a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
@@ -579,6 +579,7 @@ static void __exit hisi_ddrc_pmu_module_exit(void)
 }
 module_exit(hisi_ddrc_pmu_module_exit);
 
+MODULE_IMPORT_NS("HISI_PMU");
 MODULE_DESCRIPTION("HiSilicon SoC DDRC uncore PMU driver");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Shaokun Zhang <zhangshaokun@hisilicon.com>");
diff --git a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
index 32624872596f..e26e50b3278d 100644
--- a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
@@ -581,6 +581,7 @@ static void __exit hisi_hha_pmu_module_exit(void)
 }
 module_exit(hisi_hha_pmu_module_exit);
 
+MODULE_IMPORT_NS("HISI_PMU");
 MODULE_DESCRIPTION("HiSilicon SoC HHA uncore PMU driver");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Shaokun Zhang <zhangshaokun@hisilicon.com>");
diff --git a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
index c235b46ce873..aa3d51dd5d21 100644
--- a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
@@ -615,6 +615,7 @@ static void __exit hisi_l3c_pmu_module_exit(void)
 }
 module_exit(hisi_l3c_pmu_module_exit);
 
+MODULE_IMPORT_NS("HISI_PMU");
 MODULE_DESCRIPTION("HiSilicon SoC L3C uncore PMU driver");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Anurup M <anurup.m@huawei.com>");
diff --git a/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c
index c0f5d7c73e06..29dd77943233 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c
@@ -569,6 +569,7 @@ static void __exit hisi_pa_pmu_module_exit(void)
 }
 module_exit(hisi_pa_pmu_module_exit);
 
+MODULE_IMPORT_NS("HISI_PMU");
 MODULE_DESCRIPTION("HiSilicon Protocol Adapter uncore PMU driver");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Shaokun Zhang <zhangshaokun@hisilicon.com>");
diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
index 918cdc31de57..749d33625980 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
@@ -34,7 +34,7 @@ ssize_t hisi_event_sysfs_show(struct device *dev,
 
 	return sysfs_emit(page, "config=0x%lx\n", (unsigned long)eattr->var);
 }
-EXPORT_SYMBOL_GPL(hisi_event_sysfs_show);
+EXPORT_SYMBOL_NS_GPL(hisi_event_sysfs_show, "HISI_PMU");
 
 /*
  * sysfs cpumask attributes. For uncore PMU, we only have a single CPU to show
@@ -46,7 +46,7 @@ ssize_t hisi_cpumask_sysfs_show(struct device *dev,
 
 	return sysfs_emit(buf, "%d\n", hisi_pmu->on_cpu);
 }
-EXPORT_SYMBOL_GPL(hisi_cpumask_sysfs_show);
+EXPORT_SYMBOL_NS_GPL(hisi_cpumask_sysfs_show, "HISI_PMU");
 
 static bool hisi_validate_event_group(struct perf_event *event)
 {
@@ -96,7 +96,7 @@ int hisi_uncore_pmu_get_event_idx(struct perf_event *event)
 
 	return idx;
 }
-EXPORT_SYMBOL_GPL(hisi_uncore_pmu_get_event_idx);
+EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_get_event_idx, "HISI_PMU");
 
 ssize_t hisi_uncore_pmu_identifier_attr_show(struct device *dev,
 					     struct device_attribute *attr,
@@ -106,7 +106,7 @@ ssize_t hisi_uncore_pmu_identifier_attr_show(struct device *dev,
 
 	return sysfs_emit(page, "0x%08x\n", hisi_pmu->identifier);
 }
-EXPORT_SYMBOL_GPL(hisi_uncore_pmu_identifier_attr_show);
+EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_identifier_attr_show, "HISI_PMU");
 
 static void hisi_uncore_pmu_clear_event_idx(struct hisi_pmu *hisi_pmu, int idx)
 {
@@ -165,7 +165,7 @@ int hisi_uncore_pmu_init_irq(struct hisi_pmu *hisi_pmu,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(hisi_uncore_pmu_init_irq);
+EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_init_irq, "HISI_PMU");
 
 int hisi_uncore_pmu_event_init(struct perf_event *event)
 {
@@ -219,7 +219,7 @@ int hisi_uncore_pmu_event_init(struct perf_event *event)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(hisi_uncore_pmu_event_init);
+EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_event_init, "HISI_PMU");
 
 /*
  * Set the counter to count the event that we're interested in,
@@ -273,7 +273,7 @@ void hisi_uncore_pmu_set_event_period(struct perf_event *event)
 	/* Write start value to the hardware event counter */
 	hisi_pmu->ops->write_counter(hisi_pmu, hwc, val);
 }
-EXPORT_SYMBOL_GPL(hisi_uncore_pmu_set_event_period);
+EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_set_event_period, "HISI_PMU");
 
 void hisi_uncore_pmu_event_update(struct perf_event *event)
 {
@@ -294,7 +294,7 @@ void hisi_uncore_pmu_event_update(struct perf_event *event)
 		HISI_MAX_PERIOD(hisi_pmu->counter_bits);
 	local64_add(delta, &event->count);
 }
-EXPORT_SYMBOL_GPL(hisi_uncore_pmu_event_update);
+EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_event_update, "HISI_PMU");
 
 void hisi_uncore_pmu_start(struct perf_event *event, int flags)
 {
@@ -317,7 +317,7 @@ void hisi_uncore_pmu_start(struct perf_event *event, int flags)
 	hisi_uncore_pmu_enable_event(event);
 	perf_event_update_userpage(event);
 }
-EXPORT_SYMBOL_GPL(hisi_uncore_pmu_start);
+EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_start, "HISI_PMU");
 
 void hisi_uncore_pmu_stop(struct perf_event *event, int flags)
 {
@@ -334,7 +334,7 @@ void hisi_uncore_pmu_stop(struct perf_event *event, int flags)
 	hisi_uncore_pmu_event_update(event);
 	hwc->state |= PERF_HES_UPTODATE;
 }
-EXPORT_SYMBOL_GPL(hisi_uncore_pmu_stop);
+EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_stop, "HISI_PMU");
 
 int hisi_uncore_pmu_add(struct perf_event *event, int flags)
 {
@@ -357,7 +357,7 @@ int hisi_uncore_pmu_add(struct perf_event *event, int flags)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(hisi_uncore_pmu_add);
+EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_add, "HISI_PMU");
 
 void hisi_uncore_pmu_del(struct perf_event *event, int flags)
 {
@@ -369,14 +369,14 @@ void hisi_uncore_pmu_del(struct perf_event *event, int flags)
 	perf_event_update_userpage(event);
 	hisi_pmu->pmu_events.hw_events[hwc->idx] = NULL;
 }
-EXPORT_SYMBOL_GPL(hisi_uncore_pmu_del);
+EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_del, "HISI_PMU");
 
 void hisi_uncore_pmu_read(struct perf_event *event)
 {
 	/* Read hardware counter and update the perf counter statistics */
 	hisi_uncore_pmu_event_update(event);
 }
-EXPORT_SYMBOL_GPL(hisi_uncore_pmu_read);
+EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_read, "HISI_PMU");
 
 void hisi_uncore_pmu_enable(struct pmu *pmu)
 {
@@ -389,7 +389,7 @@ void hisi_uncore_pmu_enable(struct pmu *pmu)
 
 	hisi_pmu->ops->start_counters(hisi_pmu);
 }
-EXPORT_SYMBOL_GPL(hisi_uncore_pmu_enable);
+EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_enable, "HISI_PMU");
 
 void hisi_uncore_pmu_disable(struct pmu *pmu)
 {
@@ -397,7 +397,7 @@ void hisi_uncore_pmu_disable(struct pmu *pmu)
 
 	hisi_pmu->ops->stop_counters(hisi_pmu);
 }
-EXPORT_SYMBOL_GPL(hisi_uncore_pmu_disable);
+EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_disable, "HISI_PMU");
 
 
 /*
@@ -484,7 +484,7 @@ int hisi_uncore_pmu_online_cpu(unsigned int cpu, struct hlist_node *node)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(hisi_uncore_pmu_online_cpu);
+EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_online_cpu, "HISI_PMU");
 
 int hisi_uncore_pmu_offline_cpu(unsigned int cpu, struct hlist_node *node)
 {
@@ -515,7 +515,7 @@ int hisi_uncore_pmu_offline_cpu(unsigned int cpu, struct hlist_node *node)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(hisi_uncore_pmu_offline_cpu);
+EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_offline_cpu, "HISI_PMU");
 
 void hisi_pmu_init(struct hisi_pmu *hisi_pmu, struct module *module)
 {
@@ -535,7 +535,7 @@ void hisi_pmu_init(struct hisi_pmu *hisi_pmu, struct module *module)
 	pmu->attr_groups        = hisi_pmu->pmu_events.attr_groups;
 	pmu->capabilities       = PERF_PMU_CAP_NO_EXCLUDE;
 }
-EXPORT_SYMBOL_GPL(hisi_pmu_init);
+EXPORT_SYMBOL_NS_GPL(hisi_pmu_init, "HISI_PMU");
 
 MODULE_DESCRIPTION("HiSilicon SoC uncore Performance Monitor driver framework");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
index c5f4764ee888..d39aee31ca42 100644
--- a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
@@ -507,6 +507,7 @@ static void __exit hisi_sllc_pmu_module_exit(void)
 }
 module_exit(hisi_sllc_pmu_module_exit);
 
+MODULE_IMPORT_NS("HISI_PMU");
 MODULE_DESCRIPTION("HiSilicon SLLC uncore PMU driver");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Shaokun Zhang <zhangshaokun@hisilicon.com>");
diff --git a/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c
index 481dcc9e8fbf..2233d288ccf5 100644
--- a/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c
@@ -613,6 +613,7 @@ static void __exit hisi_uc_pmu_module_exit(void)
 }
 module_exit(hisi_uc_pmu_module_exit);
 
+MODULE_IMPORT_NS("HISI_PMU");
 MODULE_DESCRIPTION("HiSilicon SoC UC uncore PMU driver");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Junhao He <hejunhao3@huawei.com>");
-- 
2.24.0


