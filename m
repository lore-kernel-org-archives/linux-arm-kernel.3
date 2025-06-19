Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5C2C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMNiT3tWBypM+YhmOEFxXUuwyEu/2qVPCo7sKimiiTM=; b=GeYMV9RXiJywta5D+t8RhVtk5u
	cJ7NEgEqS7lQBodMsK8NooLAJFJFiXVkOsgjgKt3LX84cWpbbDGh1oYt4X2gkoKQNkW4h1HsoROyp
	e38FSE9lHU7FiKWZmildOJsxYHHkEe6c1M7WcwH5VtqygOt0rfykk+yaaxfJ8MS3IkVGjZ++joFLQ
	pUYZn1MnFxECkfJtOQJ9M8kMMIFW8E43EByMAuk4UihBok8EMlwqCJSrPbSoJmSKowIvl9pTY3stV
	9xs8mwM3ii25KK7+6qdFqdyrGPUSHmZ0VcFsgpje5IhpOcaWqoQ6M/T2fQJp+5uKiiPELDEs47omD
	45kYZyKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIed-0000000DemY-3xXx;
	Thu, 19 Jun 2025 17:02:23 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEoN-0000000D6dc-1L7t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:56:13 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bNL8k1jtvzRk68;
	Thu, 19 Jun 2025 20:51:50 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 2346414011A;
	Thu, 19 Jun 2025 20:56:07 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Jun 2025 20:56:06 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Jun 2025 20:56:06 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <hejunhao3@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [RESEND PATCH v3 6/8] drivers/perf: hisi: Support PMUs with no interrupt
Date: Thu, 19 Jun 2025 20:55:55 +0800
Message-ID: <20250619125557.57372-7-yangyicong@huawei.com>
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
X-CRM114-CacheID: sfid-20250619_055611_522904_32C56BEC 
X-CRM114-Status: GOOD (  11.18  )
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


