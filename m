Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629C8C369A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHtpcpueIMWjS4j8MioXNvlUPW8MMSg/ZroOQPaaBZw=; b=uB6XWS87sC1ymAe4xR7mup5ivP
	6b/Cb15IpqkUtehY0FrmwDe9qa41IZSWeBShxmwKD8Tr+N7hFbqKtXlZJDZ8TxldrXAJgNOTEWUQx
	td2dG6KH2g+cG4LGuY1y0xKX43KgtqjzDno8zUC6X5DvUXSQdkBWVp/Pybf14vaAwNo6wtCJPLUHF
	DTZK8qoks3pVI2A+UBTYXcqwU6kGHMrqPhE7D6DhHI3Z+3TD04yMcTl4kHBkgyyKI6Jqkio81juCp
	RcaIu5k3dGX+wwNnX7E4Kcc9eQHQ/w+DgoNzSS8qNjz3ABbl+ZnmZLaWhr/QXEjqVjac9o66RWsX8
	DaomY6sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ptG-0000000ABnD-1m0e;
	Thu, 10 Apr 2025 11:16:14 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nth-00000009sgF-2NxP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 09:08:35 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4ZYDPR0VpkzsSCx;
	Thu, 10 Apr 2025 17:03:23 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 1DFC818001B;
	Thu, 10 Apr 2025 17:08:22 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Apr 2025 17:08:21 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <hejunhao3@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [PATCH v3 2/8] drivers/perf: hisi: Add support for HiSilicon DDRC v3 PMU driver
Date: Thu, 10 Apr 2025 17:08:19 +0800
Message-ID: <20250410090825.13214-3-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250410090825.13214-1-yangyicong@huawei.com>
References: <20250410090825.13214-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_020833_785457_F209AB17 
X-CRM114-Status: UNSURE (   9.79  )
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


