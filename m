Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9D6C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEv61VNSiUoIrFhKZ7pDqi0aDWhZmGJb3IYzgqpzPeg=; b=rYh19+ZUTBDQmitlr6QYbzZcd3
	jvGOgQrsiYy0tjmko+ZoevGTxd0qRQUZTtEVfYbJ9yE3rJaFa/b5MiyO8AumYuqHk/qk7E85PwhOB
	ciqqHec/vRLGTMJcv1kM6pwlFuXx1vHMMbSHVJOZxtMXbEaLn2U1ikX7A0WQW4Zjmtcua1CpxPQmh
	dkLsSwTsBOqenIjYABFKkuBzP87SvcuByozxh4MKWiYqgZakDcGATvMK9esfoGdB1a8ZNIi03fPDO
	K2YEWCAlbeYTCrdyCc/nwoidsLLqLnVt8KMinIaD3S788akPmxAZ4GIxDsDhyqGQzG28kryZCG4lY
	LElMx3tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHVY-0000000DXcB-3xrM;
	Thu, 19 Jun 2025 15:48:56 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEoa-0000000D6i8-075e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:56:25 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bNL8j2VYLzRk4n;
	Thu, 19 Jun 2025 20:51:49 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 3D21B1400D9;
	Thu, 19 Jun 2025 20:56:06 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Jun 2025 20:56:06 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Jun 2025 20:56:05 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <hejunhao3@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [RESEND PATCH v3 4/8] drivers/perf: hisi: Add support for HiSilicon SLLC v3 PMU driver
Date: Thu, 19 Jun 2025 20:55:53 +0800
Message-ID: <20250619125557.57372-5-yangyicong@huawei.com>
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
X-CRM114-CacheID: sfid-20250619_055624_413284_FE6136EF 
X-CRM114-Status: GOOD (  12.06  )
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

SLLC v3 PMU has the following changes compared to previous version:
a) update the register layout
b) update the definition of SRCID_CTRL and TGTID_CTRL registers.
   To be compatible with v2, we use maximum width (11 bits)
   and mask the extra length for themselves.
c) remove latency events (driver does not need to be adapted).

SLLC v3 PMU is identified with HID HISI0264.

Signed-off-by: Junhao He <hejunhao3@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
index 79327639ec17..852114cfe3bf 100644
--- a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
@@ -28,6 +28,18 @@
 #define SLLC_VERSION			0x1cf0
 #define SLLC_EVENT_CNT0_L		0x1d00
 
+/* SLLC registers definition in v3 */
+#define SLLC_V3_INT_MASK		0x6834
+#define SLLC_V3_INT_STATUS		0x6838
+#define SLLC_V3_INT_CLEAR		0x683c
+#define SLLC_V3_VERSION			0x6c00
+#define SLLC_V3_PERF_CTRL		0x6d00
+#define SLLC_V3_SRCID_CTRL		0x6d04
+#define SLLC_V3_TGTID_CTRL		0x6d08
+#define SLLC_V3_EVENT_CTRL		0x6d14
+#define SLLC_V3_EVENT_TYPE0		0x6d18
+#define SLLC_V3_EVENT_CNT0_L		0x6e00
+
 #define SLLC_EVTYPE_MASK		0xff
 #define SLLC_PERF_CTRL_EN		BIT(0)
 #define SLLC_FILT_EN			BIT(1)
@@ -40,6 +52,12 @@
 #define SLLC_TGTID_MAX_SHIFT		12
 #define SLLC_SRCID_CMD_SHIFT		1
 #define SLLC_SRCID_MSK_SHIFT		12
+
+#define SLLC_V3_TGTID_MIN_SHIFT		1
+#define SLLC_V3_TGTID_MAX_SHIFT		10
+#define SLLC_V3_SRCID_CMD_SHIFT		1
+#define SLLC_V3_SRCID_MSK_SHIFT		10
+
 #define SLLC_NR_EVENTS			0x80
 #define SLLC_EVENT_CNTn(cnt0, n)	((cnt0) + (n) * 8)
 
@@ -404,6 +422,27 @@ static const struct hisi_pmu_dev_info hisi_sllc_v2 = {
 	.private = &hisi_sllc_v2_pmu_regs,
 };
 
+static struct hisi_sllc_pmu_regs hisi_sllc_v3_pmu_regs = {
+	.int_mask = SLLC_V3_INT_MASK,
+	.int_clear = SLLC_V3_INT_CLEAR,
+	.int_status = SLLC_V3_INT_STATUS,
+	.perf_ctrl = SLLC_V3_PERF_CTRL,
+	.srcid_ctrl = SLLC_V3_SRCID_CTRL,
+	.srcid_cmd_shift = SLLC_V3_SRCID_CMD_SHIFT,
+	.srcid_mask_shift = SLLC_V3_SRCID_MSK_SHIFT,
+	.tgtid_ctrl = SLLC_V3_TGTID_CTRL,
+	.tgtid_min_shift = SLLC_V3_TGTID_MIN_SHIFT,
+	.tgtid_max_shift = SLLC_V3_TGTID_MAX_SHIFT,
+	.event_ctrl = SLLC_V3_EVENT_CTRL,
+	.event_type0 = SLLC_V3_EVENT_TYPE0,
+	.version = SLLC_V3_VERSION,
+	.event_cnt0 = SLLC_V3_EVENT_CNT0_L,
+};
+
+static const struct hisi_pmu_dev_info hisi_sllc_v3 = {
+	.private = &hisi_sllc_v3_pmu_regs,
+};
+
 static const struct hisi_uncore_ops hisi_uncore_sllc_ops = {
 	.write_evtype		= hisi_sllc_pmu_write_evtype,
 	.get_event_idx		= hisi_uncore_pmu_get_event_idx,
@@ -497,6 +536,7 @@ static void hisi_sllc_pmu_remove(struct platform_device *pdev)
 
 static const struct acpi_device_id hisi_sllc_pmu_acpi_match[] = {
 	{ "HISI0263", (kernel_ulong_t)&hisi_sllc_v2 },
+	{ "HISI0264", (kernel_ulong_t)&hisi_sllc_v3 },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, hisi_sllc_pmu_acpi_match);
-- 
2.24.0


