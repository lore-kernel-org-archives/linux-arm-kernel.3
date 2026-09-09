Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D98FC79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 07:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYAaJ/nstk18ZP+Irwr92KPlz26fv0Oh5+iqsnRCB4U=; b=jcCP2c/LAX2NXH70DisIHN1NH1
	YLR/64Ek4Yrf3SG15oskd/cYf5V9mFjF+t2MnEqQv+4ifQDLP2tKR7sOFHsgg7Dik7kZGjN21anMT
	C8CVNIaPZjhjMiSHSV+WRh3R77TfMG+vicoUqXZVM9Q2Tg9KhgcJUEJXp5bJjbojksJ4WEAVn/Gq3
	GCLE4Eq7I8OREhMiM3AM4GIY+PysXbmVF6PiurTS0GG8PVqvr/Yea9FmpzCX6AH7Go3MJlURnzWi2
	SHtOpOpiAEPnVGcuvd+B4M04dNbNNPsXJLTf0JH3jLmc6JjuNTHpuB//u+WZV3KOXRr2mhnWtgsfx
	tOnP25JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4CgM-0000000AycK-2fey;
	Wed, 09 Sep 2026 07:25:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4CgM-0000000Aybm-0UYu
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 07:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FYAaJ/nstk18ZP+Irwr92KPlz26fv0Oh5+iqsnRCB4U=; b=JnE2jG/Xfd6FEGltCfvP7B5xff
	5VL2yL8rREEIxq8M83inUqC2MIzuX/mOo4WOHTstudYRu1qPrgIEv/grQAWWq1R8e+Rx6jVUlUj+p
	XsVCxZ0LREW7scFe1eTIcHbbJiULBLdk1+jnEsUDKzWvsFrcLcm6tWqZi1IPvjVye+2y3e46vZQdV
	AsTWAQVN8bQ4knn3VxdMKQYMZVtBIpD4UauET362cAT2TDTtQPzvP5/nw1mKfKQwim/ybVm2gXAm6
	Hw7s8Juie+TKTmfk6LWqJcrIddO0KR9QBCmVxuQJmO3RcL6zIvq9/veVTjE5zMuPSz8EPfaBNs6nk
	0mwjHaNg==;
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Cg7-00000000qQf-0ETb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 07:25:20 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FYAaJ/nstk18ZP+Irwr92KPlz26fv0Oh5+iqsnRCB4U=;
	b=3jJRz0A8YI8rCByIrw0v18w2KtrXcTmS6tpw8lCycDJ0pLP/urlLzCB6ifjAT1bQsAbwS9zm6
	B+e+3AWsR+VAbq3PZJ/fSveQ2C70DWkaHsPVy1g77R77C6+AnOvMUlUqC5cfXov2ckXiLL19FoS
	8wMvrSfdBGd/wtBTwJlt0d0=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hfsS71fhdz1K96s;
	Wed,  9 Sep 2026 15:11:51 +0800 (CST)
Received: from whupemo500002.china.huawei.com (unknown [7.152.185.250])
	by mail.maildlp.com (Postfix) with ESMTPS id A57724058D;
	Wed,  9 Sep 2026 15:22:45 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 whupemo500002.china.huawei.com (7.152.185.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 15:22:44 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <u.kleine-koenig@baylibre.com>, <linuxarm@huawei.com>,
	<liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangzhou1@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [PATCH v5 3/3] drivers/perf: hisi: Add cycle event for HIP13 MN PMU
Date: Wed, 9 Sep 2026 15:22:40 +0800
Message-ID: <20260909072240.2308808-4-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260909072240.2308808-1-wangyushan12@huawei.com>
References: <20260909072240.2308808-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo500002.china.huawei.com (7.152.185.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_082517_318734_FAF2F51C 
X-CRM114-Status: GOOD (  13.59  )
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

The MN (Miscellaneous Node) PMU on HiSilicon HIP13 exposes a cycle
counter in addition to the existing event set. Add a v2 event list
that includes the cycles event (0x0F) and a new hisi_mn_v2 dev_info
matched by the new ACPI id HISI0224.

Rename the existing event list, attribute group and attr_groups array
to *_v1 so the two MN PMU versions can coexist.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c | 63 ++++++++++++++++++---
 1 file changed, 56 insertions(+), 7 deletions(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_mn_pmu.c b/drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
index ad898153ff49..1ded8a6b2358 100644
--- a/drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
@@ -188,7 +188,7 @@ static const struct attribute_group hisi_mn_pmu_format_group = {
 	.attrs = hisi_mn_pmu_format_attr,
 };
 
-static struct attribute *hisi_mn_pmu_events_attr[] = {
+static struct attribute *hisi_mn_pmu_events_attr_v1[] = {
 	HISI_PMU_EVENT_ATTR(req_eobarrier_num,		0x00),
 	HISI_PMU_EVENT_ATTR(req_ecbarrier_num,		0x01),
 	HISI_PMU_EVENT_ATTR(req_dvmop_num,		0x02),
@@ -215,14 +215,55 @@ static struct attribute *hisi_mn_pmu_events_attr[] = {
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
@@ -347,14 +388,22 @@ static struct hisi_mn_pmu_regs hisi_mn_v1_pmu_regs = {
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
 };
 
 static const struct acpi_device_id hisi_mn_pmu_acpi_match[] = {
-	{ "HISI0222", (kernel_ulong_t) &hisi_mn_v1 },
+	{ "HISI0222", (kernel_ulong_t)&hisi_mn_v1 },
+	{ "HISI0224", (kernel_ulong_t)&hisi_mn_v2 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, hisi_mn_pmu_acpi_match);
-- 
2.33.0


