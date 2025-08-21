Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68E4CA0FE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCRCxepqyBSsxiXr8Wxdf91L7xr4Wx2VP3QGQpGwfTE=; b=2aqq7hH28i7mvwjsE/Ik5haQOc
	297N6EoDAsWswVXzCPHnZSPpEKjg9/rkTcITSI/fzyKhKYAVR5aVdr+xEZgv56k/biQ9bOk0CdiAC
	4nUYV41XcWZg9a93+9wGDl1nLqYerFHMD2WjvB92/nNwYzO+mQ2fRUY0/tH192H0fIb1henPTlt38
	oqQI3U7chADhGcSFY4BINDpKq3fUZXnQjdDg2ipGxc+sWR33vomc8EH8Mwg2jhp5EvMbuk3vyYMi0
	aHcZSTh2iJWudTlwSXG6Ul+i3nxrz9PGSyQEn/dyNLs4V5zQazB0EMTgml0yToATg54oj4k17oIlp
	4XqoefOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAhv-00000000Ed1-3Dr5;
	Thu, 21 Aug 2025 19:12:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5hE-0000000H7Vc-4BVj
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 21 Aug 2025 13:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bCRCxepqyBSsxiXr8Wxdf91L7xr4Wx2VP3QGQpGwfTE=; b=cjx2tbtArmNd3dQibUiIsuYmOi
	TFFTgkG9Gc9/vcESiN4X+tjJ6VJAFgYfn3d9/xZhu5ihkYlFV1N0iuaHjHKQIDOrkqEcKkj2qAQ2O
	zLgLEubvN/8P2pFG5ijghEAUDdjUlydjPc+Bmp4cJao8glKEaJSBmIMXkMQeRVOH7CyFGEHL5RLOH
	XZiteExnvoe4hTc2DNX44StqZzYufMHMyenSyaXKDY20IZ+ybED/cOguM8ZL3atboTt6a6oBbxHVg
	YGj1Bxz+1q32iJ+Eh2FOeb+e9xHfl/N2Igrx2KfTCGYznvSDGf7sdPCRV9/bjkJH3WN12okpqG7wE
	Z8rhhdxw==;
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5hB-00000000a4t-1Ns1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 13:51:15 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4c74QQ6R3fz2gL3R;
	Thu, 21 Aug 2025 21:47:58 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 8A4A5140294;
	Thu, 21 Aug 2025 21:50:52 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 21 Aug 2025 21:50:52 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 21 Aug 2025 21:50:51 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <robin.murphy@arm.com>, <yangyicong@huawei.com>,
	<Jonathan.Cameron@huawei.com>, <liuyonglong@huawei.com>,
	<wanghuiqiang@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <hejunhao3@h-partners.com>
Subject: [PATCH v2 3/9] drivers/perf: hisi: Simplify the probe process of each L3C PMU version
Date: Thu, 21 Aug 2025 21:50:43 +0800
Message-ID: <20250821135049.2010220-4-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250821135049.2010220-1-wangyushan12@huawei.com>
References: <20250821135049.2010220-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_145114_305400_1900EB92 
X-CRM114-Status: GOOD (  15.65  )
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


