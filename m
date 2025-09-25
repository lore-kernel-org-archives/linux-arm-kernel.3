Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C89CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 03:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6+P6kp349nYcX8AKLKnOLB3Jz3QMQvP1Ie8XwklShlo=; b=F1cgIhS1I7+JcK5yeyeN0dQSEa
	DNxqqH6a7IVRnOe8/ePWuzD77inmztzMgvyceftC0F6uu2oFy5WhXvh+RIaQpopXdzow0NH1W3V9N
	3jvGZXIbr5aWM53uq+6x1Kii1DHoWUCycQXBlq7OIVSLl7YgEAVmow0HNhwXSVmpo1pVmJ3hMIr/4
	Pra1HLayTccYIPeag8JmIJWLFwKjjdUZS0grG6m8TC7fH3v5/9LKYwVNi9wj8aLI1YJZYsXuEdjQk
	826DGkeuKJ7BdaUF6+Znn4E5ZiGbSWdi9i6zYRA56xfKJOv3gglXmiELXPk4uG7FLMbcjue4eqF3L
	yWA9ttrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1chm-00000005PZj-1ooC;
	Thu, 25 Sep 2025 03:31:38 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1chj-00000005PYx-1Z7H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 03:31:37 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4cXJzW3Xjzz2Cgq3;
	Thu, 25 Sep 2025 11:26:47 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 5E7401A016C;
	Thu, 25 Sep 2025 11:31:26 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 25 Sep 2025 11:31:24 +0800
Received: from DESKTOP-VM4LOUJ.huawei.com (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 25 Sep 2025 11:31:24 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <yangyicong@hisilicon.com>, <wangyushan12@huawei.com>,
	<hejunhao3@h-partners.com>, <yangyccccc@gmail.com>
Subject: [PATCH] drivers/perf: hisi: Add tt_core_deprecated for compatibility
Date: Thu, 25 Sep 2025 11:31:23 +0800
Message-ID: <20250925033123.5836-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_203135_733188_1DC9D703 
X-CRM114-Status: GOOD (  17.52  )
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

Previously tt_core is defined as config1:0-7 which may not cover all
the CPUs sharing L3C on platforms with more than 8 CPUs in a L3C. In
order to support such platforms extend tt_core to 16 bits, since no
spare space in config1, tt_core was moved to config2:0-15.

Though linux expects the users to retrieve the control encoding from
sysfs first for each option, it's possible if user doesn't follow
this and hardcoded tt_core in config1. So add an option
tt_core_deprecated for config1:0-7 for backward compatibility.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
Fail the event init if user use tt_core and tt_core_deprecated simultaneuously,
based on the dicussion:
Link: https://lore.kernel.org/linux-arm-kernel/aNPTwxnlXGbazFLR@willie-the-truck/

 Documentation/admin-guide/perf/hisi-pmu.rst  |  4 +++
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c | 33 +++++++++++++++++---
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
index c4c2cbbf88cb..0017f8ddeb75 100644
--- a/Documentation/admin-guide/perf/hisi-pmu.rst
+++ b/Documentation/admin-guide/perf/hisi-pmu.rst
@@ -66,6 +66,10 @@ specified as a bitmap::
 
 This will only count the operations from core/thread 0 and 1 in this cluster.
 
+User should not use tt_core_deprecated to specify the core/thread filtering.
+This option is provided for backward compatiblility and only support 8bit
+which may not cover all the core/thread sharing L3C.
+
 2. Tracetag allow the user to chose to count only read, write or atomic
 operations via the tt_req parameeter in perf. The default value counts all
 operations. tt_req is 3bits, 3'b100 represents read operations, 3'b101
diff --git a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
index bbd81a43047d..f963e4f9e552 100644
--- a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
@@ -57,6 +57,11 @@
 #define L3C_V2_NR_EVENTS	0xFF
 
 HISI_PMU_EVENT_ATTR_EXTRACTOR(ext, config, 17, 16);
+/*
+ * Remain the config1:0-7 for backward compatibility if some existing users
+ * hardcode the config1:0-7 directly without parsing the sysfs attribute.
+ */
+HISI_PMU_EVENT_ATTR_EXTRACTOR(tt_core_deprecated, config1, 7, 0);
 HISI_PMU_EVENT_ATTR_EXTRACTOR(tt_req, config1, 10, 8);
 HISI_PMU_EVENT_ATTR_EXTRACTOR(datasrc_cfg, config1, 15, 11);
 HISI_PMU_EVENT_ATTR_EXTRACTOR(datasrc_skt, config1, 16, 16);
@@ -95,6 +100,21 @@ static bool support_ext(struct hisi_l3c_pmu *pmu)
 	return l3c_pmu_ext->support_ext;
 }
 
+/*
+ * tt_core was extended to cover all the CPUs sharing the L3 and was moved from
+ * config1:0-7 to config2:0-*. Try it first and fallback to tt_core_deprecated
+ * if user's still using the deprecated one.
+ */
+static u32 hisi_l3c_pmu_get_tt_core(struct perf_event *event)
+{
+	u32 core = hisi_get_tt_core(event);
+
+	if (core)
+		return core;
+
+	return hisi_get_tt_core_deprecated(event);
+}
+
 static int hisi_l3c_pmu_get_event_idx(struct perf_event *event)
 {
 	struct hisi_pmu *l3c_pmu = to_hisi_pmu(event->pmu);
@@ -259,7 +279,7 @@ static void hisi_l3c_pmu_clear_ds(struct perf_event *event)
 static void hisi_l3c_pmu_config_core_tracetag(struct perf_event *event)
 {
 	struct hw_perf_event *hwc = &event->hw;
-	u32 core = hisi_get_tt_core(event);
+	u32 core = hisi_l3c_pmu_get_tt_core(event);
 
 	if (core) {
 		u32 val;
@@ -280,7 +300,7 @@ static void hisi_l3c_pmu_config_core_tracetag(struct perf_event *event)
 static void hisi_l3c_pmu_clear_core_tracetag(struct perf_event *event)
 {
 	struct hw_perf_event *hwc = &event->hw;
-	u32 core = hisi_get_tt_core(event);
+	u32 core = hisi_l3c_pmu_get_tt_core(event);
 
 	if (core) {
 		u32 val;
@@ -300,7 +320,7 @@ static void hisi_l3c_pmu_clear_core_tracetag(struct perf_event *event)
 
 static bool hisi_l3c_pmu_have_filter(struct perf_event *event)
 {
-	return hisi_get_tt_req(event) || hisi_get_tt_core(event) ||
+	return hisi_get_tt_req(event) || hisi_l3c_pmu_get_tt_core(event) ||
 	       hisi_get_datasrc_cfg(event) || hisi_get_datasrc_skt(event);
 }
 
@@ -331,6 +351,9 @@ static int hisi_l3c_pmu_check_filter(struct perf_event *event)
 	if (ext < 0 || ext > hisi_l3c_pmu->ext_num)
 		return -EINVAL;
 
+	if (hisi_get_tt_core(event) && hisi_get_tt_core_deprecated(event))
+		return -EINVAL;
+
 	return 0;
 }
 
@@ -602,10 +625,11 @@ static const struct attribute_group hisi_l3c_pmu_v1_format_group = {
 
 static struct attribute *hisi_l3c_pmu_v2_format_attr[] = {
 	HISI_PMU_FORMAT_ATTR(event, "config:0-7"),
-	HISI_PMU_FORMAT_ATTR(tt_core, "config2:0-15"),
+	HISI_PMU_FORMAT_ATTR(tt_core_deprecated, "config1:0-7"),
 	HISI_PMU_FORMAT_ATTR(tt_req, "config1:8-10"),
 	HISI_PMU_FORMAT_ATTR(datasrc_cfg, "config1:11-15"),
 	HISI_PMU_FORMAT_ATTR(datasrc_skt, "config1:16"),
+	HISI_PMU_FORMAT_ATTR(tt_core, "config2:0-15"),
 	NULL
 };
 
@@ -617,6 +641,7 @@ static const struct attribute_group hisi_l3c_pmu_v2_format_group = {
 static struct attribute *hisi_l3c_pmu_v3_format_attr[] = {
 	HISI_PMU_FORMAT_ATTR(event, "config:0-7"),
 	HISI_PMU_FORMAT_ATTR(ext, "config:16-17"),
+	HISI_PMU_FORMAT_ATTR(tt_core_deprecated, "config1:0-7"),
 	HISI_PMU_FORMAT_ATTR(tt_req, "config1:8-10"),
 	HISI_PMU_FORMAT_ATTR(tt_core, "config2:0-15"),
 	NULL
-- 
2.24.0


