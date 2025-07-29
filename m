Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC2DC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 15:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9s3HxzgYrDnidaU0jrWBUE13cD0zSYOWfDK2iKQfLeU=; b=ui8UNYHPxCwJXwGkMmULIH4Hbk
	VYCZJDj0+z666vlL9eLcblii3W3sS85z0uQA/uWWDh/Qats5B/sTkRodqgvFtBVJeX95Qw4bbCtSa
	yxHc7lkPaefOIMK3yvPcyomSQUGN89iQAfErcAWyHackh93K9hQ00qr2eXf+Ci0fqrls7qaxsRj+Q
	SgL1lT3oKNmOv+YbBV+RXfpP5Z2U7/yUwUBZJO+/2W9AQzy4xgmmvjnVtP8RkPoYOuPVLpYgPVB93
	G2Ak8Az2nsutdqEGFmBRzFLhZfFrlrXKREaSGlRKYDWDbuvpeSuRHsXmSgmlguVPaMxc7LjdW8ejk
	t8Hcozzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmcp-0000000HBrN-1oyb;
	Tue, 29 Jul 2025 15:52:23 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmPU-0000000H9rB-06Ag
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 15:38:37 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4brzvm3Yqnz2RVvl;
	Tue, 29 Jul 2025 23:36:04 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id CE6411A0188;
	Tue, 29 Jul 2025 23:38:25 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 29 Jul 2025 23:38:25 +0800
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
Subject: [PATCH 2/8] drivers/perf: hisi: Export hisi_uncore_pmu_isr()
Date: Tue, 29 Jul 2025 23:38:17 +0800
Message-ID: <20250729153823.2026154-3-wangyushan12@huawei.com>
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
X-CRM114-CacheID: sfid-20250729_083836_239584_10A9D97B 
X-CRM114-Status: GOOD (  12.30  )
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

Currently Uncore PMU framework assume one PMU device only have one
interrupt and will help register the interrupt handler. It cannot
support a PMU with multiple interrupt resources.  An uncore PMU may
have multiple interrupts that can share the same handler.  Export
hisi_uncore_pmu_isr() to allow drivers register the irq handler by
their own routine.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 drivers/perf/hisilicon/hisi_uncore_pmu.c | 3 ++-
 drivers/perf/hisilicon/hisi_uncore_pmu.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
index 3050899ddf17..ff20ad54f51b 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
@@ -149,7 +149,7 @@ static void hisi_uncore_pmu_clear_event_idx(struct hisi_pmu *hisi_pmu, int idx)
 	clear_bit(idx, hisi_pmu->pmu_events.used_mask);
 }
 
-static irqreturn_t hisi_uncore_pmu_isr(int irq, void *data)
+irqreturn_t hisi_uncore_pmu_isr(int irq, void *data)
 {
 	struct hisi_pmu *hisi_pmu = data;
 	struct perf_event *event;
@@ -178,6 +178,7 @@ static irqreturn_t hisi_uncore_pmu_isr(int irq, void *data)
 
 	return IRQ_HANDLED;
 }
+EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_isr, "HISI_PMU");
 
 int hisi_uncore_pmu_init_irq(struct hisi_pmu *hisi_pmu,
 			     struct platform_device *pdev)
diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.h b/drivers/perf/hisilicon/hisi_uncore_pmu.h
index 50a97e79076a..40aac70352e9 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.h
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.h
@@ -163,6 +163,7 @@ int hisi_uncore_pmu_offline_cpu(unsigned int cpu, struct hlist_node *node);
 ssize_t hisi_uncore_pmu_identifier_attr_show(struct device *dev,
 					     struct device_attribute *attr,
 					     char *page);
+irqreturn_t hisi_uncore_pmu_isr(int irq, void *data);
 int hisi_uncore_pmu_init_irq(struct hisi_pmu *hisi_pmu,
 			     struct platform_device *pdev);
 void hisi_uncore_pmu_init_topology(struct hisi_pmu *hisi_pmu, struct device *dev);
-- 
2.33.0


