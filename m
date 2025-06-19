Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8843BC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7r1Z7nwSVN8k1Y4f71LqMy9rbqSDtUaKem1EVRqZmyg=; b=tNNgeT5ZZvHv20+1SRRk1ehY2f
	xAEYihm/8/S3tm6vvj8CbHbzJSO+oWV0NN/47O5jMMm6pfFD0E2rFFqCNAeG6Haz6GyqohRtoT+N6
	2itRBJ834I6T0EiDgiAhHzQiyLUfBnqLlis//QM5PepNSeDCB7t282lmHBaOpbPGwplk7r+Ciz7L7
	TYKI/F3ce+KQwIliPk5oVAZZxUvvTOr26oK4w5K5DaLrz+r0R8vUsgBbLis3BcHbTujIp6JU32iNU
	A2HThEET+R0OFfNLPHugc5bc7VIVkC1WCeXBV/Ve5fQ+AM5EZRRN17VZHUxaTckO/Sr/AkQNxUBr1
	4VdRUqjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIee-0000000Demq-0t9D;
	Thu, 19 Jun 2025 17:02:24 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEoN-0000000D6dY-1KhJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:56:14 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bNLCx0tv4z2BdgT;
	Thu, 19 Jun 2025 20:54:37 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 6F1841A0188;
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
Subject: [RESEND PATCH v3 5/8] drivers/perf: hisi: Relax the event number check of v2 PMUs
Date: Thu, 19 Jun 2025 20:55:54 +0800
Message-ID: <20250619125557.57372-6-yangyicong@huawei.com>
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
X-CRM114-CacheID: sfid-20250619_055611_716188_13EC5A2B 
X-CRM114-Status: GOOD (  15.37  )
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

The supported event number range of each Uncore PMUs is provided by
each driver in hisi_pmu::check_event and out of range events
will be rejected. A later version with expanded event number range
needs to register the PMU with updated hisi_pmu::check_event
even if it's the only update, which means the expanded events
cannot be used unless the driver's updated. However the unsupported
events won't be counted by the hardware so we can relax the event
number check to allow the use the expanded events.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Junhao He <hejunhao3@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c | 2 +-
 drivers/perf/hisilicon/hisi_uncore_hha_pmu.c  | 6 +++---
 drivers/perf/hisilicon/hisi_uncore_pa_pmu.c   | 2 +-
 drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
index 26eaa6d20c00..21c494881ca0 100644
--- a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
@@ -53,7 +53,7 @@
 #define DDRC_V1_PERF_CTRL_EN	0x2
 #define DDRC_V2_PERF_CTRL_EN	0x1
 #define DDRC_V1_NR_EVENTS	0x7
-#define DDRC_V2_NR_EVENTS	0x90
+#define DDRC_V2_NR_EVENTS	0xFF
 
 #define DDRC_EVENT_CNTn(base, n)	((base) + (n) * 8)
 #define DDRC_EVENT_TYPEn(base, n)	((base) + (n) * 4)
diff --git a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
index ca609db86046..97cfaa586a87 100644
--- a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
@@ -47,9 +47,9 @@
 #define HHA_SRCID_CMD		GENMASK(16, 6)
 #define HHA_SRCID_MSK		GENMASK(30, 20)
 #define HHA_DATSRC_SKT_EN	BIT(23)
-#define HHA_EVTYPE_NONE		0xff
+#define HHA_EVTYPE_MASK		GENMASK(7, 0)
 #define HHA_V1_NR_EVENT		0x65
-#define HHA_V2_NR_EVENT		0xCE
+#define HHA_V2_NR_EVENT		0xFF
 
 HISI_PMU_EVENT_ATTR_EXTRACTOR(srcid_cmd, config1, 10, 0);
 HISI_PMU_EVENT_ATTR_EXTRACTOR(srcid_msk, config1, 21, 11);
@@ -197,7 +197,7 @@ static void hisi_hha_pmu_write_evtype(struct hisi_pmu *hha_pmu, int idx,
 
 	/* Write event code to HHA_EVENT_TYPEx register */
 	val = readl(hha_pmu->base + reg);
-	val &= ~(HHA_EVTYPE_NONE << shift);
+	val &= ~(HHA_EVTYPE_MASK << shift);
 	val |= (type << shift);
 	writel(val, hha_pmu->base + reg);
 }
diff --git a/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c
index a0142684e379..80108c63cb60 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c
@@ -440,7 +440,7 @@ static int hisi_pa_pmu_dev_probe(struct platform_device *pdev,
 	pa_pmu->pmu_events.attr_groups = pa_pmu->dev_info->attr_groups;
 	pa_pmu->num_counters = PA_NR_COUNTERS;
 	pa_pmu->ops = &hisi_uncore_pa_ops;
-	pa_pmu->check_event = 0xB0;
+	pa_pmu->check_event = PA_EVTYPE_MASK;
 	pa_pmu->counter_bits = 64;
 	pa_pmu->dev = &pdev->dev;
 	pa_pmu->on_cpu = -1;
diff --git a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
index 852114cfe3bf..cd32d606df05 100644
--- a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
@@ -58,7 +58,7 @@
 #define SLLC_V3_SRCID_CMD_SHIFT		1
 #define SLLC_V3_SRCID_MSK_SHIFT		10
 
-#define SLLC_NR_EVENTS			0x80
+#define SLLC_NR_EVENTS			0xff
 #define SLLC_EVENT_CNTn(cnt0, n)	((cnt0) + (n) * 8)
 
 HISI_PMU_EVENT_ATTR_EXTRACTOR(tgtid_min, config1, 10, 0);
-- 
2.24.0


