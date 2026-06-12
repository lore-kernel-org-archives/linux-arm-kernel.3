Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2292DCD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 09:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bE6PdP3m7ALO0XKSTDsYTv4vI5wWUFBXfcNLMsSHkZg=; b=nRKbgkDi7JmChJ+L+5ALHFN4q+
	oC7kX/ONCtKNGCZtfZ/eWwu9EU+x95G3xBZgxxK1CqEtYqCiIyFC5rDzydim02lx39PpV72dgbaKN
	7QvvQFLI7d9IqyO0fO4c6M9W2NabxwDRBs5iNtqzOdxcK+SLwgS3yc1JLt87PIAZ9mZoa0NOY/58D
	MXzg/9nZrb+NzUgVmeWHpLBG9ygh7ZBxgbqxAbtEtvn+s8WpSyXFOCXd1cl82TyOpQnbRM2rBMDfQ
	oSnoA2qNV8Q+tgA6D2bttecm/mmZShZD7Y4TTYz5lw7DNjS2U30y+v/2t0vyNDQEZzVK2G9fG7/rb
	lXF6KHDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyLZ-0000000AgXc-42vr;
	Fri, 12 Jun 2026 09:38:41 +0000
Received: from [113.46.200.224] (helo=canpmsgout09.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyLX-0000000AgSo-07q4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 09:38:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bE6PdP3m7ALO0XKSTDsYTv4vI5wWUFBXfcNLMsSHkZg=;
	b=ykYrd2SaMAkz5+vN2z2fZqmqeZjfDpHu2Lda5SU4brh1zf1GRUZQk+A/PkIQbxYDeNo2SROXe
	dJ5IMh5MjHlZXVg9wVWFOpRadzrY4s/M9atSTSolK14mfhn0mEg0T356ScJAPVhZ3nYYJyQtxf2
	bNXJN/kqa7N8wnI3A9xvO8M=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4gcDl20QHMz1cyT4;
	Fri, 12 Jun 2026 17:30:22 +0800 (CST)
Received: from whupemo500002.china.huawei.com (unknown [7.152.185.250])
	by mail.maildlp.com (Postfix) with ESMTPS id 4938640562;
	Fri, 12 Jun 2026 17:38:16 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 whupemo500002.china.huawei.com (7.152.185.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 12 Jun 2026 17:38:15 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <fanghao11@huawei.com>, <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, <wangzhou1@hisilicon.com>,
	<wangyushan12@huawei.com>
Subject: [PATCH v2 2/2] drivers/perf: hisi: Add new function for HiSilicon MN PMU driver
Date: Fri, 12 Jun 2026 17:38:12 +0800
Message-ID: <20260612093812.1249049-3-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260612093812.1249049-1-wangyushan12@huawei.com>
References: <20260612093812.1249049-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo500002.china.huawei.com (7.152.185.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_023839_393918_799B794F 
X-CRM114-Status: GOOD (  13.89  )
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

From: Yifan Wu <wuyifan50@huawei.com>

MN (Miscellaneous Node) is a hybrid node in ARM CHI. The MN PMU driver
using the HiSilicon uncore PMU framework.

On HiSilicon HIP13 platform, cycle event is supported on MN PMU. The
cycle event is exposed directly in driver and some variables shall be
added suffix to distinguish the version.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c | 61 +++++++++++++++++++--
 1 file changed, 55 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_mn_pmu.c b/drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
index 4df4eebe243e..cdd5a1591408 100644
--- a/drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
@@ -192,7 +192,7 @@ static const struct attribute_group hisi_mn_pmu_format_group = {
 	.attrs = hisi_mn_pmu_format_attr,
 };
 
-static struct attribute *hisi_mn_pmu_events_attr[] = {
+static struct attribute *hisi_mn_pmu_events_attr_v1[] = {
 	HISI_PMU_EVENT_ATTR(req_eobarrier_num,		0x00),
 	HISI_PMU_EVENT_ATTR(req_ecbarrier_num,		0x01),
 	HISI_PMU_EVENT_ATTR(req_dvmop_num,		0x02),
@@ -219,14 +219,55 @@ static struct attribute *hisi_mn_pmu_events_attr[] = {
 	NULL
 };
 
-static const struct attribute_group hisi_mn_pmu_events_group = {
+static const struct attribute_group hisi_mn_pmu_events_group_v1 = {
 	.name = "events",
-	.attrs = hisi_mn_pmu_events_attr,
+	.attrs = hisi_mn_pmu_events_attr_v1,
 };
 
-static const struct attribute_group *hisi_mn_pmu_attr_groups[] = {
+static const struct attribute_group *hisi_mn_pmu_attr_groups_v1[] = {
 	&hisi_mn_pmu_format_group,
-	&hisi_mn_pmu_events_group,
+	&hisi_mn_pmu_events_group_v1,
+	&hisi_pmu_cpumask_attr_group,
+	&hisi_pmu_identifier_group,
+	NULL
+};
+
+static struct attribute *hisi_mn_pmu_events_attr_v2[] = {
+	HISI_PMU_EVENT_ATTR(req_eobarrier_num,		0x00),
+	HISI_PMU_EVENT_ATTR(req_ecbarrier_num,		0x01),
+	HISI_PMU_EVENT_ATTR(req_dvmop_num,		0x02),
+	HISI_PMU_EVENT_ATTR(req_dvmsync_num,		0x03),
+	HISI_PMU_EVENT_ATTR(req_retry_num,		0x04),
+	HISI_PMU_EVENT_ATTR(req_writenosnp_num,		0x05),
+	HISI_PMU_EVENT_ATTR(req_readnosnp_num,		0x06),
+	HISI_PMU_EVENT_ATTR(snp_dvm_num,		0x07),
+	HISI_PMU_EVENT_ATTR(snp_dvmsync_num,		0x08),
+	HISI_PMU_EVENT_ATTR(l3t_req_dvm_num,		0x09),
+	HISI_PMU_EVENT_ATTR(l3t_req_dvmsync_num,	0x0A),
+	HISI_PMU_EVENT_ATTR(mn_req_dvm_num,		0x0B),
+	HISI_PMU_EVENT_ATTR(mn_req_dvmsync_num,		0x0C),
+	HISI_PMU_EVENT_ATTR(pa_req_dvm_num,		0x0D),
+	HISI_PMU_EVENT_ATTR(pa_req_dvmsync_num,		0x0E),
+	HISI_PMU_EVENT_ATTR(cycles,					0x0F),
+	HISI_PMU_EVENT_ATTR(snp_dvm_latency,		0x80),
+	HISI_PMU_EVENT_ATTR(snp_dvmsync_latency,	0x81),
+	HISI_PMU_EVENT_ATTR(l3t_req_dvm_latency,	0x82),
+	HISI_PMU_EVENT_ATTR(l3t_req_dvmsync_latency,	0x83),
+	HISI_PMU_EVENT_ATTR(mn_req_dvm_latency,		0x84),
+	HISI_PMU_EVENT_ATTR(mn_req_dvmsync_latency,	0x85),
+	HISI_PMU_EVENT_ATTR(pa_req_dvm_latency,		0x86),
+	HISI_PMU_EVENT_ATTR(pa_req_dvmsync_latency,	0x87),
+	NULL
+};
+
+static const struct attribute_group hisi_mn_pmu_events_group_v2 = {
+	.name = "events",
+	.attrs = hisi_mn_pmu_events_attr_v2,
+};
+
+static const struct attribute_group *hisi_mn_pmu_attr_groups_v2[] = {
+	&hisi_mn_pmu_format_group,
+	&hisi_mn_pmu_events_group_v2,
 	&hisi_pmu_cpumask_attr_group,
 	&hisi_pmu_identifier_group,
 	NULL
@@ -351,7 +392,14 @@ static struct hisi_mn_pmu_regs hisi_mn_v1_pmu_regs = {
 };
 
 static const struct hisi_pmu_dev_info hisi_mn_v1 = {
-	.attr_groups = hisi_mn_pmu_attr_groups,
+	.attr_groups = hisi_mn_pmu_attr_groups_v1,
+	.counter_bits = 48,
+	.check_event = HISI_MN_EVTYPE_MASK,
+	.private = &hisi_mn_v1_pmu_regs,
+};
+
+static const struct hisi_pmu_dev_info hisi_mn_v2 = {
+	.attr_groups = hisi_mn_pmu_attr_groups_v2,
 	.counter_bits = 48,
 	.check_event = HISI_MN_EVTYPE_MASK,
 	.private = &hisi_mn_v1_pmu_regs,
@@ -359,6 +407,7 @@ static const struct hisi_pmu_dev_info hisi_mn_v1 = {
 
 static const struct acpi_device_id hisi_mn_pmu_acpi_match[] = {
 	{ "HISI0222", (kernel_ulong_t) &hisi_mn_v1 },
+	{ "HISI0224", (kernel_ulong_t) &hisi_mn_v2 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, hisi_mn_pmu_acpi_match);
-- 
2.33.0


