Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C5BCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehm5J2r6KeyWBAyp+HIZ9X5bTSY+awqdBnpZBq46OHI=; b=HFtsJjV8e+qmQuyxWy1YCC1VE3
	2KCfxC0qAkhjEK0NPyMjwWmr15Cb9cyDw5qV8bbN1wYMG87JdfoyQHa+tlGJeYOlYOMtbgbzlEj22
	/Ju3E3LC3Wd8oTJWrGM2rIAPU8wyJXqv6mjgjybCzlf372DQwmVuvEEmLvMFMgx6+oZlkVr14zysU
	RVvpvXRisuBLZjyBop5up7O3BYV0aUVSTjSIuVm8XEZqb1quSrEwUrBcR7qy521MvjQnGjlvzq8Os
	JizzsGgpjeUogrAiWYgGMPYFmEH1DtBvhxndhPGtyhlVlf5W7e5OMBdSxSI8vPuT43VL1Fn9U6S5G
	vK8SNhPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAho-00000000EPz-2Uro;
	Thu, 21 Aug 2025 19:12:12 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5gy-0000000H7RV-1DwC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 13:51:01 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4c74Pd1HvQz13NJ7;
	Thu, 21 Aug 2025 21:47:17 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id F2A53140279;
	Thu, 21 Aug 2025 21:50:51 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 21 Aug 2025 21:50:51 +0800
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
Subject: [PATCH v2 2/9] drivers/perf: hisi: Export hisi_uncore_pmu_isr()
Date: Thu, 21 Aug 2025 21:50:42 +0800
Message-ID: <20250821135049.2010220-3-wangyushan12@huawei.com>
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
X-CRM114-CacheID: sfid-20250821_065100_504472_5941CAB0 
X-CRM114-Status: GOOD (  13.61  )
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
index 6594d64b03a9..de71dcf11653 100644
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
index 6186b232f454..02fa022925d4 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.h
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.h
@@ -165,6 +165,7 @@ int hisi_uncore_pmu_offline_cpu(unsigned int cpu, struct hlist_node *node);
 ssize_t hisi_uncore_pmu_identifier_attr_show(struct device *dev,
 					     struct device_attribute *attr,
 					     char *page);
+irqreturn_t hisi_uncore_pmu_isr(int irq, void *data);
 int hisi_uncore_pmu_init_irq(struct hisi_pmu *hisi_pmu,
 			     struct platform_device *pdev);
 void hisi_uncore_pmu_init_topology(struct hisi_pmu *hisi_pmu, struct device *dev);
-- 
2.33.0


