Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9882FC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 16:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCRCxepqyBSsxiXr8Wxdf91L7xr4Wx2VP3QGQpGwfTE=; b=SfFtElS29yxLGH0PdLj949qpzU
	iSxiMeVpCQrdXY4nEopWY8LL+0jAFcIw8MJQu5/PHEQL5M+OzgzJ+Bfo8SEW7RgQpb4IJzHy4oquF
	pth2lZ25iUJ0NY6ymA2oiAv5hPyBOfqBtgjYHUp9SsyIfv4/8g263KqB+DYzkWcQeofuoaucNOxfI
	/Mp+70wTK9wPJRnBuiiMuhg0qmnQWW3yHoEJAqy0mI9F0buHoIVbQZIP44rc6Y37xEKA147NUNKrU
	MkgL4XY23Pp+xomaFxv7heJY/+mCXRLkRq++E5Oh15MkoOvjf2Ra9bvb1HxDUWAow2rHOHZktiAqM
	ecPHiX9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmmX-0000000HDJY-2G4Y;
	Tue, 29 Jul 2025 16:02:25 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmPU-0000000H9rI-41Ut
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 15:38:38 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4brzvL6vYtz1R8qr;
	Tue, 29 Jul 2025 23:35:42 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 4A243140155;
	Tue, 29 Jul 2025 23:38:26 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 29 Jul 2025 23:38:26 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 29 Jul 2025 23:38:25 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <linuxarm@huawei.com>, <yangyicong@hisilicon.com>,
	<wangyushan12@huawei.com>
Subject: [PATCH 3/8] drivers/perf: hisi: Simplify the probe process of each L3C PMU version
Date: Tue, 29 Jul 2025 23:38:18 +0800
Message-ID: <20250729153823.2026154-4-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250729153823.2026154-1-wangyushan12@huawei.com>
References: <20250729153823.2026154-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_083837_385071_9EA5A4DE 
X-CRM114-Status: GOOD (  14.95  )
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

Version 1 and 2 of L3C PMU also use different HID. Make use of
struct acpi_device_id::driver_data for version specific information
rather than judge the version register. This will help to
simplify the probe process and also a bit easier for extension.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c | 43 ++++++++++++--------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
index 412fc3a97963..db683dd7375c 100644
--- a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
@@ -345,13 +345,6 @@ static void hisi_l3c_pmu_clear_int_status(struct hisi_pmu *l3c_pmu, int idx)
 	writel(1 << idx, l3c_pmu->base + L3C_INT_CLEAR);
 }
 
-static const struct acpi_device_id hisi_l3c_pmu_acpi_match[] = {
-	{ "HISI0213", },
-	{ "HISI0214", },
-	{}
-};
-MODULE_DEVICE_TABLE(acpi, hisi_l3c_pmu_acpi_match);
-
 static int hisi_l3c_pmu_init_data(struct platform_device *pdev,
 				  struct hisi_pmu *l3c_pmu)
 {
@@ -371,6 +364,10 @@ static int hisi_l3c_pmu_init_data(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
+	l3c_pmu->dev_info = device_get_match_data(&pdev->dev);
+	if (!l3c_pmu->dev_info)
+		return -ENODEV;
+
 	l3c_pmu->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(l3c_pmu->base)) {
 		dev_err(&pdev->dev, "ioremap failed for l3c_pmu resource\n");
@@ -457,6 +454,18 @@ static const struct attribute_group *hisi_l3c_pmu_v2_attr_groups[] = {
 	NULL
 };
 
+static const struct hisi_pmu_dev_info hisi_l3c_pmu_v1 = {
+	.attr_groups = hisi_l3c_pmu_v1_attr_groups,
+	.counter_bits = 48,
+	.check_event = L3C_V1_NR_EVENTS,
+};
+
+static const struct hisi_pmu_dev_info hisi_l3c_pmu_v2 = {
+	.attr_groups = hisi_l3c_pmu_v2_attr_groups,
+	.counter_bits = 64,
+	.check_event = L3C_V2_NR_EVENTS,
+};
+
 static const struct hisi_uncore_ops hisi_uncore_l3c_ops = {
 	.write_evtype		= hisi_l3c_pmu_write_evtype,
 	.get_event_idx		= hisi_uncore_pmu_get_event_idx,
@@ -487,16 +496,9 @@ static int hisi_l3c_pmu_dev_probe(struct platform_device *pdev,
 	if (ret)
 		return ret;
 
-	if (l3c_pmu->identifier >= HISI_PMU_V2) {
-		l3c_pmu->counter_bits = 64;
-		l3c_pmu->check_event = L3C_V2_NR_EVENTS;
-		l3c_pmu->pmu_events.attr_groups = hisi_l3c_pmu_v2_attr_groups;
-	} else {
-		l3c_pmu->counter_bits = 48;
-		l3c_pmu->check_event = L3C_V1_NR_EVENTS;
-		l3c_pmu->pmu_events.attr_groups = hisi_l3c_pmu_v1_attr_groups;
-	}
-
+	l3c_pmu->pmu_events.attr_groups = l3c_pmu->dev_info->attr_groups;
+	l3c_pmu->counter_bits = l3c_pmu->dev_info->counter_bits;
+	l3c_pmu->check_event = l3c_pmu->dev_info->check_event;
 	l3c_pmu->num_counters = L3C_NR_COUNTERS;
 	l3c_pmu->ops = &hisi_uncore_l3c_ops;
 	l3c_pmu->dev = &pdev->dev;
@@ -554,6 +556,13 @@ static void hisi_l3c_pmu_remove(struct platform_device *pdev)
 					    &l3c_pmu->node);
 }
 
+static const struct acpi_device_id hisi_l3c_pmu_acpi_match[] = {
+	{ "HISI0213", (kernel_ulong_t)&hisi_l3c_pmu_v1 },
+	{ "HISI0214", (kernel_ulong_t)&hisi_l3c_pmu_v2 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, hisi_l3c_pmu_acpi_match);
+
 static struct platform_driver hisi_l3c_pmu_driver = {
 	.driver = {
 		.name = "hisi_l3c_pmu",
-- 
2.33.0


