Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF130C369A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMNiT3tWBypM+YhmOEFxXUuwyEu/2qVPCo7sKimiiTM=; b=MUpQnoY2x//MxzW2cNmyo2Anmu
	mOa2owKlZDi4suM2uy09hJPdKBaV/hupsVDqM2+0kesuK3c1TEQsV4UFGttmD1yl7WU0Vt+Hcd3kj
	4Mwlq/YlH9fKN+3sJu9jmqALzYRHHzy3XqlieNQdGZcv2feuFwHK3LZOVwKnpNrF/mX4sfRXnHS9M
	W7VL3DpuCUe4fDDsVAYdZogmxrTeunZ9iGbQ1NN4ZDA9lk6WdeVexAGMQ7Q8ZdyGEC9QEAAbPTObd
	lYZWa97Bs4IQO6LY3cnR/8Tg20mN6uR/VS4RWlsrGRo+ikPsf1grDQsVOygKBcpdZN6XusXLqLk96
	L4cec7Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pt8-0000000ABYp-26Jo;
	Thu, 10 Apr 2025 11:16:06 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ntc-00000009sdf-0RxR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 09:08:30 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZYDQX3FKhzvWqV;
	Thu, 10 Apr 2025 17:04:20 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id CF2EA140276;
	Thu, 10 Apr 2025 17:08:23 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Apr 2025 17:08:23 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <hejunhao3@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [PATCH v3 6/8] drivers/perf: hisi: Support PMUs with no interrupt
Date: Thu, 10 Apr 2025 17:08:23 +0800
Message-ID: <20250410090825.13214-7-yangyicong@huawei.com>
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
X-CRM114-CacheID: sfid-20250410_020828_308159_073BEE9F 
X-CRM114-Status: GOOD (  11.80  )
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

We'll have PMUs don't have an interrupt to indicate the counter
overflow, but the Uncore PMU core assume all the PMUs have
interrupt. So handle this case in the core. The existing PMUs
won't be affected.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/hisilicon/hisi_uncore_pmu.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
index ef058b1dd509..a449651f79c9 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
@@ -510,7 +510,9 @@ int hisi_uncore_pmu_online_cpu(unsigned int cpu, struct hlist_node *node)
 			return 0;
 
 		hisi_pmu->on_cpu = cpumask_local_spread(0, dev_to_node(hisi_pmu->dev));
-		WARN_ON(irq_set_affinity(hisi_pmu->irq, cpumask_of(hisi_pmu->on_cpu)));
+		if (hisi_pmu->irq > 0)
+			WARN_ON(irq_set_affinity(hisi_pmu->irq,
+						 cpumask_of(hisi_pmu->on_cpu)));
 		return 0;
 	}
 
@@ -525,7 +527,8 @@ int hisi_uncore_pmu_online_cpu(unsigned int cpu, struct hlist_node *node)
 	hisi_pmu->on_cpu = cpu;
 
 	/* Overflow interrupt also should use the same CPU */
-	WARN_ON(irq_set_affinity(hisi_pmu->irq, cpumask_of(cpu)));
+	if (hisi_pmu->irq > 0)
+		WARN_ON(irq_set_affinity(hisi_pmu->irq, cpumask_of(cpu)));
 
 	return 0;
 }
@@ -560,7 +563,9 @@ int hisi_uncore_pmu_offline_cpu(unsigned int cpu, struct hlist_node *node)
 	perf_pmu_migrate_context(&hisi_pmu->pmu, cpu, target);
 	/* Use this CPU for event counting */
 	hisi_pmu->on_cpu = target;
-	WARN_ON(irq_set_affinity(hisi_pmu->irq, cpumask_of(target)));
+
+	if (hisi_pmu->irq > 0)
+		WARN_ON(irq_set_affinity(hisi_pmu->irq, cpumask_of(target)));
 
 	return 0;
 }
-- 
2.24.0


