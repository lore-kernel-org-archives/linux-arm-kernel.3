Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66823E64A8A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 13:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgDvLnP8L2NVti2kG8twwOIPQ6VP3lgY9FptFR4ILsw=; b=c9N7MCVerYYfp/z/r9DKYPmwvg
	kIb1/9RJEHElcKNu0v+RTs0qJ9wgEAizuj1pQliiBth9cns4Ced6vz8twv7k+N/dq4jBSrYwsVG73
	bIdV/jASDLQOa2Em3lF9kV5QvjsXsEBrnSDm8DyVh6mkqpvkfyVUdTaY7PXTY8BUNhPLe/xf4kBfp
	xYL1B/jp7nbxkK5E0sbAq+tZjOyTgmTh0YM9PS9qXTAcOq7QvIRrAs0+isJ6HWs1tQ6NfgembC8qk
	HvhgBsuacA8+jmWekmpmfbrQJcjV0NX7G4i21BRLessFlooVphFGrheBk33pRgnieU+FleR6ZpcHR
	e0Ph8FDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISgq-00000009YyG-24UI;
	Tue, 03 Dec 2024 13:11:44 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISNZ-00000009VAB-1bNY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:51:51 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Y2gTv381jzqTLp;
	Tue,  3 Dec 2024 20:49:55 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 337AC140156;
	Tue,  3 Dec 2024 20:51:44 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 3 Dec 2024 20:51:43 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <jonathan.cameron@huawei.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <yangyicong@hisilicon.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	<wangyushan12@huawei.com>, <prime.zeng@hisilicon.com>
Subject: [PATCH v4 07/10] drivers/perf: hisi: Provide a generic implementation of cpumask/identifier
Date: Tue, 3 Dec 2024 20:50:46 +0800
Message-ID: <20241203125049.39458-8-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241203125049.39458-1-yangyicong@huawei.com>
References: <20241203125049.39458-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_045149_764093_A939E9C9 
X-CRM114-Status: GOOD (  14.10  )
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

Each type of HiSilicon Uncore PMU has the following sysfs attributes:

- format: bitmask in perf_event_attr::config[012] of corresponding
  attribute
- event: events name and corresponding event code
- cpumask: range of CPUs the events can be opened on
- identifier: the version of this PMU

Different types of PMU have different implementations of the "format"
and "event" but all share the same implementation of the "cpumask"
and "identifier". Thus we can move cpumask and identifier to the
hisi_uncore_pmu framework and drivers can use the generic
implementation.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c  | 27 +----------
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c | 31 ++-----------
 drivers/perf/hisilicon/hisi_uncore_hha_pmu.c  | 31 ++-----------
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c  | 31 ++-----------
 drivers/perf/hisilicon/hisi_uncore_pa_pmu.c   | 35 +++------------
 drivers/perf/hisilicon/hisi_uncore_pmu.c      | 45 ++++++++++++++-----
 drivers/perf/hisilicon/hisi_uncore_pmu.h      |  4 ++
 drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c | 27 +----------
 drivers/perf/hisilicon/hisi_uncore_uc_pmu.c   | 27 +----------
 9 files changed, 63 insertions(+), 195 deletions(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c b/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c
index c9b5016fafdb..0d6a1683892a 100644
--- a/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c
@@ -225,34 +225,11 @@ static const struct attribute_group hisi_cpa_pmu_events_group = {
 	.attrs = hisi_cpa_pmu_events_attr,
 };
 
-static DEVICE_ATTR(cpumask, 0444, hisi_cpumask_sysfs_show, NULL);
-
-static struct attribute *hisi_cpa_pmu_cpumask_attrs[] = {
-	&dev_attr_cpumask.attr,
-	NULL
-};
-
-static const struct attribute_group hisi_cpa_pmu_cpumask_attr_group = {
-	.attrs = hisi_cpa_pmu_cpumask_attrs,
-};
-
-static struct device_attribute hisi_cpa_pmu_identifier_attr =
-	__ATTR(identifier, 0444, hisi_uncore_pmu_identifier_attr_show, NULL);
-
-static struct attribute *hisi_cpa_pmu_identifier_attrs[] = {
-	&hisi_cpa_pmu_identifier_attr.attr,
-	NULL
-};
-
-static const struct attribute_group hisi_cpa_pmu_identifier_group = {
-	.attrs = hisi_cpa_pmu_identifier_attrs,
-};
-
 static const struct attribute_group *hisi_cpa_pmu_attr_groups[] = {
 	&hisi_cpa_pmu_format_group,
 	&hisi_cpa_pmu_events_group,
-	&hisi_cpa_pmu_cpumask_attr_group,
-	&hisi_cpa_pmu_identifier_group,
+	&hisi_pmu_cpumask_attr_group,
+	&hisi_pmu_identifier_group,
 	NULL
 };
 
diff --git a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
index 56a4068d6568..fb596f43ef9a 100644
--- a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
@@ -380,42 +380,19 @@ static const struct attribute_group hisi_ddrc_pmu_v2_events_group = {
 	.attrs = hisi_ddrc_pmu_v2_events_attr,
 };
 
-static DEVICE_ATTR(cpumask, 0444, hisi_cpumask_sysfs_show, NULL);
-
-static struct attribute *hisi_ddrc_pmu_cpumask_attrs[] = {
-	&dev_attr_cpumask.attr,
-	NULL,
-};
-
-static const struct attribute_group hisi_ddrc_pmu_cpumask_attr_group = {
-	.attrs = hisi_ddrc_pmu_cpumask_attrs,
-};
-
-static struct device_attribute hisi_ddrc_pmu_identifier_attr =
-	__ATTR(identifier, 0444, hisi_uncore_pmu_identifier_attr_show, NULL);
-
-static struct attribute *hisi_ddrc_pmu_identifier_attrs[] = {
-	&hisi_ddrc_pmu_identifier_attr.attr,
-	NULL
-};
-
-static const struct attribute_group hisi_ddrc_pmu_identifier_group = {
-	.attrs = hisi_ddrc_pmu_identifier_attrs,
-};
-
 static const struct attribute_group *hisi_ddrc_pmu_v1_attr_groups[] = {
 	&hisi_ddrc_pmu_v1_format_group,
 	&hisi_ddrc_pmu_v1_events_group,
-	&hisi_ddrc_pmu_cpumask_attr_group,
-	&hisi_ddrc_pmu_identifier_group,
+	&hisi_pmu_cpumask_attr_group,
+	&hisi_pmu_identifier_group,
 	NULL,
 };
 
 static const struct attribute_group *hisi_ddrc_pmu_v2_attr_groups[] = {
 	&hisi_ddrc_pmu_v2_format_group,
 	&hisi_ddrc_pmu_v2_events_group,
-	&hisi_ddrc_pmu_cpumask_attr_group,
-	&hisi_ddrc_pmu_identifier_group,
+	&hisi_pmu_cpumask_attr_group,
+	&hisi_pmu_identifier_group,
 	NULL
 };
 
diff --git a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
index e59b31fdc4e4..0a7c44f72ecc 100644
--- a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
@@ -405,42 +405,19 @@ static const struct attribute_group hisi_hha_pmu_v2_events_group = {
 	.attrs = hisi_hha_pmu_v2_events_attr,
 };
 
-static DEVICE_ATTR(cpumask, 0444, hisi_cpumask_sysfs_show, NULL);
-
-static struct attribute *hisi_hha_pmu_cpumask_attrs[] = {
-	&dev_attr_cpumask.attr,
-	NULL,
-};
-
-static const struct attribute_group hisi_hha_pmu_cpumask_attr_group = {
-	.attrs = hisi_hha_pmu_cpumask_attrs,
-};
-
-static struct device_attribute hisi_hha_pmu_identifier_attr =
-	__ATTR(identifier, 0444, hisi_uncore_pmu_identifier_attr_show, NULL);
-
-static struct attribute *hisi_hha_pmu_identifier_attrs[] = {
-	&hisi_hha_pmu_identifier_attr.attr,
-	NULL
-};
-
-static const struct attribute_group hisi_hha_pmu_identifier_group = {
-	.attrs = hisi_hha_pmu_identifier_attrs,
-};
-
 static const struct attribute_group *hisi_hha_pmu_v1_attr_groups[] = {
 	&hisi_hha_pmu_v1_format_group,
 	&hisi_hha_pmu_v1_events_group,
-	&hisi_hha_pmu_cpumask_attr_group,
-	&hisi_hha_pmu_identifier_group,
+	&hisi_pmu_cpumask_attr_group,
+	&hisi_pmu_identifier_group,
 	NULL,
 };
 
 static const struct attribute_group *hisi_hha_pmu_v2_attr_groups[] = {
 	&hisi_hha_pmu_v2_format_group,
 	&hisi_hha_pmu_v2_events_group,
-	&hisi_hha_pmu_cpumask_attr_group,
-	&hisi_hha_pmu_identifier_group,
+	&hisi_pmu_cpumask_attr_group,
+	&hisi_pmu_identifier_group,
 	NULL
 };
 
diff --git a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
index 290a9e311f48..602d8d0b72f7 100644
--- a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
@@ -441,42 +441,19 @@ static const struct attribute_group hisi_l3c_pmu_v2_events_group = {
 	.attrs = hisi_l3c_pmu_v2_events_attr,
 };
 
-static DEVICE_ATTR(cpumask, 0444, hisi_cpumask_sysfs_show, NULL);
-
-static struct attribute *hisi_l3c_pmu_cpumask_attrs[] = {
-	&dev_attr_cpumask.attr,
-	NULL,
-};
-
-static const struct attribute_group hisi_l3c_pmu_cpumask_attr_group = {
-	.attrs = hisi_l3c_pmu_cpumask_attrs,
-};
-
-static struct device_attribute hisi_l3c_pmu_identifier_attr =
-	__ATTR(identifier, 0444, hisi_uncore_pmu_identifier_attr_show, NULL);
-
-static struct attribute *hisi_l3c_pmu_identifier_attrs[] = {
-	&hisi_l3c_pmu_identifier_attr.attr,
-	NULL
-};
-
-static const struct attribute_group hisi_l3c_pmu_identifier_group = {
-	.attrs = hisi_l3c_pmu_identifier_attrs,
-};
-
 static const struct attribute_group *hisi_l3c_pmu_v1_attr_groups[] = {
 	&hisi_l3c_pmu_v1_format_group,
 	&hisi_l3c_pmu_v1_events_group,
-	&hisi_l3c_pmu_cpumask_attr_group,
-	&hisi_l3c_pmu_identifier_group,
+	&hisi_pmu_cpumask_attr_group,
+	&hisi_pmu_identifier_group,
 	NULL,
 };
 
 static const struct attribute_group *hisi_l3c_pmu_v2_attr_groups[] = {
 	&hisi_l3c_pmu_v2_format_group,
 	&hisi_l3c_pmu_v2_events_group,
-	&hisi_l3c_pmu_cpumask_attr_group,
-	&hisi_l3c_pmu_identifier_group,
+	&hisi_pmu_cpumask_attr_group,
+	&hisi_pmu_identifier_group,
 	NULL
 };
 
diff --git a/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c
index d7b525f634b9..bd7640516d17 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c
@@ -353,29 +353,6 @@ static const struct attribute_group hisi_h60pa_pmu_events_group = {
 	.attrs = hisi_h60pa_pmu_events_attr,
 };
 
-static DEVICE_ATTR(cpumask, 0444, hisi_cpumask_sysfs_show, NULL);
-
-static struct attribute *hisi_pa_pmu_cpumask_attrs[] = {
-	&dev_attr_cpumask.attr,
-	NULL
-};
-
-static const struct attribute_group hisi_pa_pmu_cpumask_attr_group = {
-	.attrs = hisi_pa_pmu_cpumask_attrs,
-};
-
-static struct device_attribute hisi_pa_pmu_identifier_attr =
-	__ATTR(identifier, 0444, hisi_uncore_pmu_identifier_attr_show, NULL);
-
-static struct attribute *hisi_pa_pmu_identifier_attrs[] = {
-	&hisi_pa_pmu_identifier_attr.attr,
-	NULL
-};
-
-static const struct attribute_group hisi_pa_pmu_identifier_group = {
-	.attrs = hisi_pa_pmu_identifier_attrs,
-};
-
 static struct hisi_pa_pmu_int_regs hisi_pa_pmu_regs = {
 	.mask_offset = PA_INT_MASK,
 	.clear_offset = PA_INT_CLEAR,
@@ -385,8 +362,8 @@ static struct hisi_pa_pmu_int_regs hisi_pa_pmu_regs = {
 static const struct attribute_group *hisi_pa_pmu_v2_attr_groups[] = {
 	&hisi_pa_pmu_v2_format_group,
 	&hisi_pa_pmu_v2_events_group,
-	&hisi_pa_pmu_cpumask_attr_group,
-	&hisi_pa_pmu_identifier_group,
+	&hisi_pmu_cpumask_attr_group,
+	&hisi_pmu_identifier_group,
 	NULL
 };
 
@@ -399,8 +376,8 @@ static const struct hisi_pmu_dev_info hisi_h32pa_v2 = {
 static const struct attribute_group *hisi_pa_pmu_v3_attr_groups[] = {
 	&hisi_pa_pmu_v2_format_group,
 	&hisi_pa_pmu_v3_events_group,
-	&hisi_pa_pmu_cpumask_attr_group,
-	&hisi_pa_pmu_identifier_group,
+	&hisi_pmu_cpumask_attr_group,
+	&hisi_pmu_identifier_group,
 	NULL
 };
 
@@ -419,8 +396,8 @@ static struct hisi_pa_pmu_int_regs hisi_h60pa_pmu_regs = {
 static const struct attribute_group *hisi_h60pa_pmu_attr_groups[] = {
 	&hisi_pa_pmu_v2_format_group,
 	&hisi_h60pa_pmu_events_group,
-	&hisi_pa_pmu_cpumask_attr_group,
-	&hisi_pa_pmu_identifier_group,
+	&hisi_pmu_cpumask_attr_group,
+	&hisi_pmu_identifier_group,
 	NULL
 };
 
diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
index 1132822ff97a..339e346e94ee 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
@@ -49,6 +49,41 @@ ssize_t hisi_cpumask_sysfs_show(struct device *dev,
 }
 EXPORT_SYMBOL_NS_GPL(hisi_cpumask_sysfs_show, HISI_PMU);
 
+static DEVICE_ATTR(cpumask, 0444, hisi_cpumask_sysfs_show, NULL);
+
+static struct attribute *hisi_pmu_cpumask_attrs[] = {
+	&dev_attr_cpumask.attr,
+	NULL
+};
+
+const struct attribute_group hisi_pmu_cpumask_attr_group = {
+	.attrs = hisi_pmu_cpumask_attrs,
+};
+EXPORT_SYMBOL_NS_GPL(hisi_pmu_cpumask_attr_group, HISI_PMU);
+
+ssize_t hisi_uncore_pmu_identifier_attr_show(struct device *dev,
+					     struct device_attribute *attr,
+					     char *page)
+{
+	struct hisi_pmu *hisi_pmu = to_hisi_pmu(dev_get_drvdata(dev));
+
+	return sysfs_emit(page, "0x%08x\n", hisi_pmu->identifier);
+}
+EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_identifier_attr_show, HISI_PMU);
+
+static struct device_attribute hisi_pmu_identifier_attr =
+	__ATTR(identifier, 0444, hisi_uncore_pmu_identifier_attr_show, NULL);
+
+static struct attribute *hisi_pmu_identifier_attrs[] = {
+	&hisi_pmu_identifier_attr.attr,
+	NULL
+};
+
+const struct attribute_group hisi_pmu_identifier_group = {
+	.attrs = hisi_pmu_identifier_attrs,
+};
+EXPORT_SYMBOL_NS_GPL(hisi_pmu_identifier_group, HISI_PMU);
+
 static bool hisi_validate_event_group(struct perf_event *event)
 {
 	struct perf_event *sibling, *leader = event->group_leader;
@@ -99,16 +134,6 @@ int hisi_uncore_pmu_get_event_idx(struct perf_event *event)
 }
 EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_get_event_idx, HISI_PMU);
 
-ssize_t hisi_uncore_pmu_identifier_attr_show(struct device *dev,
-					     struct device_attribute *attr,
-					     char *page)
-{
-	struct hisi_pmu *hisi_pmu = to_hisi_pmu(dev_get_drvdata(dev));
-
-	return sysfs_emit(page, "0x%08x\n", hisi_pmu->identifier);
-}
-EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_identifier_attr_show, HISI_PMU);
-
 static void hisi_uncore_pmu_clear_event_idx(struct hisi_pmu *hisi_pmu, int idx)
 {
 	clear_bit(idx, hisi_pmu->pmu_events.used_mask);
diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.h b/drivers/perf/hisilicon/hisi_uncore_pmu.h
index 53b1331b8565..f4fed2544877 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.h
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.h
@@ -137,6 +137,10 @@ struct hisi_pmu {
 	u32 identifier;
 };
 
+/* Generic implementation of cpumask/identifier group */
+extern const struct attribute_group hisi_pmu_cpumask_attr_group;
+extern const struct attribute_group hisi_pmu_identifier_group;
+
 int hisi_uncore_pmu_get_event_idx(struct perf_event *event);
 void hisi_uncore_pmu_read(struct perf_event *event);
 int hisi_uncore_pmu_add(struct perf_event *event, int flags);
diff --git a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
index a342ef3d9916..b55a06f351aa 100644
--- a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
@@ -344,34 +344,11 @@ static const struct attribute_group hisi_sllc_pmu_v2_events_group = {
 	.attrs = hisi_sllc_pmu_v2_events_attr,
 };
 
-static DEVICE_ATTR(cpumask, 0444, hisi_cpumask_sysfs_show, NULL);
-
-static struct attribute *hisi_sllc_pmu_cpumask_attrs[] = {
-	&dev_attr_cpumask.attr,
-	NULL
-};
-
-static const struct attribute_group hisi_sllc_pmu_cpumask_attr_group = {
-	.attrs = hisi_sllc_pmu_cpumask_attrs,
-};
-
-static struct device_attribute hisi_sllc_pmu_identifier_attr =
-	__ATTR(identifier, 0444, hisi_uncore_pmu_identifier_attr_show, NULL);
-
-static struct attribute *hisi_sllc_pmu_identifier_attrs[] = {
-	&hisi_sllc_pmu_identifier_attr.attr,
-	NULL
-};
-
-static const struct attribute_group hisi_sllc_pmu_identifier_group = {
-	.attrs = hisi_sllc_pmu_identifier_attrs,
-};
-
 static const struct attribute_group *hisi_sllc_pmu_v2_attr_groups[] = {
 	&hisi_sllc_pmu_v2_format_group,
 	&hisi_sllc_pmu_v2_events_group,
-	&hisi_sllc_pmu_cpumask_attr_group,
-	&hisi_sllc_pmu_identifier_group,
+	&hisi_pmu_cpumask_attr_group,
+	&hisi_pmu_identifier_group,
 	NULL
 };
 
diff --git a/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c
index 2df8976ab4be..f90f752f32dd 100644
--- a/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c
@@ -437,34 +437,11 @@ static const struct attribute_group hisi_uc_pmu_events_group = {
 	.attrs = hisi_uc_pmu_events_attr,
 };
 
-static DEVICE_ATTR(cpumask, 0444, hisi_cpumask_sysfs_show, NULL);
-
-static struct attribute *hisi_uc_pmu_cpumask_attrs[] = {
-	&dev_attr_cpumask.attr,
-	NULL,
-};
-
-static const struct attribute_group hisi_uc_pmu_cpumask_attr_group = {
-	.attrs = hisi_uc_pmu_cpumask_attrs,
-};
-
-static struct device_attribute hisi_uc_pmu_identifier_attr =
-	__ATTR(identifier, 0444, hisi_uncore_pmu_identifier_attr_show, NULL);
-
-static struct attribute *hisi_uc_pmu_identifier_attrs[] = {
-	&hisi_uc_pmu_identifier_attr.attr,
-	NULL
-};
-
-static const struct attribute_group hisi_uc_pmu_identifier_group = {
-	.attrs = hisi_uc_pmu_identifier_attrs,
-};
-
 static const struct attribute_group *hisi_uc_pmu_attr_groups[] = {
 	&hisi_uc_pmu_format_group,
 	&hisi_uc_pmu_events_group,
-	&hisi_uc_pmu_cpumask_attr_group,
-	&hisi_uc_pmu_identifier_group,
+	&hisi_pmu_cpumask_attr_group,
+	&hisi_pmu_identifier_group,
 	NULL
 };
 
-- 
2.24.0


