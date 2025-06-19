Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9768C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHtpcpueIMWjS4j8MioXNvlUPW8MMSg/ZroOQPaaBZw=; b=HhZ0onpKG44tsnIkAAQdU9fvF4
	CtSs9RxT1hzL6d20HBMC4Qz2/wsh5ScLiNoS2oh0TyTD4Zi5VGQuuRbJIfA9lY6e8rKuSpc/IwHVR
	gb65DgKK9PwJOCT49R+5UxMnzr6v9BjNqXK5dQd7SPryPBawar3O77yCHRZ+fcU3+wTic0LJhGowJ
	LaGHB924NaA3puLMzot5++6Mg1raBBctBMNs7kVsQ88gPJkUf2MWfbf5Hdoy7BCUo2lHvQsrAKkLl
	aCgdqXzJU5s65Tb1PjM8X892wNumuVtuYjjHH2UGCx5cXjK437DQPMOd9U2YJ32e3V522U0zrQCnk
	YDl4Sy1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHVX-0000000DXZL-0uxS;
	Thu, 19 Jun 2025 15:48:55 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEoO-0000000D6de-1QV1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:56:15 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bNLGg1Dmyz2QTws;
	Thu, 19 Jun 2025 20:56:59 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 1DA451A0188;
	Thu, 19 Jun 2025 20:56:05 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Jun 2025 20:56:04 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Jun 2025 20:56:04 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <hejunhao3@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [RESEND PATCH v3 2/8] drivers/perf: hisi: Add support for HiSilicon DDRC v3 PMU driver
Date: Thu, 19 Jun 2025 20:55:51 +0800
Message-ID: <20250619125557.57372-3-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250619125557.57372-1-yangyicong@huawei.com>
References: <20250619125557.57372-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_055612_533539_4D33B8EF 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

From: Junhao He <hejunhao3@huawei.com>

HiSilicon DDRC v3 PMU has the different interrupt register offset
compared to the v2. Add device information of v3 PMU with ACPI
HID HISI0235.

Signed-off-by: Junhao He <hejunhao3@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
index 7e3c2436e96b..26eaa6d20c00 100644
--- a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
@@ -43,6 +43,11 @@
 #define DDRC_V2_EVENT_TYPE	0xe74
 #define DDRC_V2_PERF_CTRL	0xeA0
 
+/* DDRC interrupt registers definition in v3 */
+#define DDRC_V3_INT_MASK	0x534
+#define DDRC_V3_INT_STATUS	0x538
+#define DDRC_V3_INT_CLEAR	0x53C
+
 /* DDRC has 8-counters */
 #define DDRC_NR_COUNTERS	0x8
 #define DDRC_V1_PERF_CTRL_EN	0x2
@@ -460,9 +465,28 @@ static const struct hisi_pmu_dev_info hisi_ddrc_v2 = {
 	.private = &hisi_ddrc_v2_pmu_regs,
 };
 
+static struct hisi_ddrc_pmu_regs hisi_ddrc_v3_pmu_regs = {
+	.event_cnt = DDRC_V2_EVENT_CNT,
+	.event_ctrl = DDRC_V2_EVENT_CTRL,
+	.event_type = DDRC_V2_EVENT_TYPE,
+	.perf_ctrl = DDRC_V2_PERF_CTRL,
+	.perf_ctrl_en = DDRC_V2_PERF_CTRL_EN,
+	.int_mask = DDRC_V3_INT_MASK,
+	.int_clear = DDRC_V3_INT_CLEAR,
+	.int_status = DDRC_V3_INT_STATUS,
+};
+
+static const struct hisi_pmu_dev_info hisi_ddrc_v3 = {
+	.counter_bits = 48,
+	.check_event = DDRC_V2_NR_EVENTS,
+	.attr_groups = hisi_ddrc_pmu_v2_attr_groups,
+	.private = &hisi_ddrc_v3_pmu_regs,
+};
+
 static const struct acpi_device_id hisi_ddrc_pmu_acpi_match[] = {
 	{ "HISI0233", (kernel_ulong_t)&hisi_ddrc_v1 },
 	{ "HISI0234", (kernel_ulong_t)&hisi_ddrc_v2 },
+	{ "HISI0235", (kernel_ulong_t)&hisi_ddrc_v3 },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, hisi_ddrc_pmu_acpi_match);
-- 
2.24.0


