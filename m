Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60CFE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 12:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O0gxgEs+ULiumsoc768lAaB9yYvmCFlMUxmwr2iiEBM=; b=PUhr/evDsCVKNeG4zNs+STC6AB
	rm59CmoswEDHwBhqhXmK0sInjQpAuAAtITktUKn1jCrspcAoZVzOyTgmNflsf+SV4iH0q8FlaqyTP
	y02rFLH6+H8dNOV7RFMYQ5Jwjjlh2S87ESnxP7yr8noYDNgo+wMwzNTh/lkA3VZqpLypGilEh93lD
	3LT/sbHqPuTfDFAfQ1mka0dhZQurPc9M+py5hspUz3I3AnnHk9xfAtYcRESTGUQOpPr7EoUVJweyx
	e9lMs6BVZANVdOdF3Gq4xDP+nw7FBZ/QxB0fKyfeFfHrxYeTTU8fwUuX7S5C1T7jhwk9ccGVjD8+F
	cbcCBc5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPhvi-0000000A0uG-2E6v;
	Mon, 23 Dec 2024 12:53:02 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPhuV-0000000A0jc-3arJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 12:51:49 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4YGyVg0293z1V708;
	Mon, 23 Dec 2024 20:48:11 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 3E65818007C;
	Mon, 23 Dec 2024 20:51:32 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 23 Dec 2024 20:51:31 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <yangyicong@hisilicon.com>
Subject: [PATCH] drivers/perf: hisi: Set correct IRQ affinity for PMUs with no association
Date: Mon, 23 Dec 2024 20:51:34 +0800
Message-ID: <20241223125134.57885-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_045148_051896_CC469ACD 
X-CRM114-Status: GOOD (  10.11  )
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

For PMUs with no association, the hisi_pmu->on_cpu is initialized
according to the NUMA locality but use a wrong CPU for the interrupt
affinity. The CPU selected from cpumask_local_spread() can be different
from the CPU by the cpuhp callback. Fix this by setting the IRQ affinity
to hisi_pmu->on_cpu.

Fixes: 6cd137088fdf ("drivers/perf: hisi: Refactor the detection of associated CPUs")
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/hisilicon/hisi_uncore_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
index 83bdc9c31367..ef058b1dd509 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
@@ -510,7 +510,7 @@ int hisi_uncore_pmu_online_cpu(unsigned int cpu, struct hlist_node *node)
 			return 0;
 
 		hisi_pmu->on_cpu = cpumask_local_spread(0, dev_to_node(hisi_pmu->dev));
-		WARN_ON(irq_set_affinity(hisi_pmu->irq, cpumask_of(cpu)));
+		WARN_ON(irq_set_affinity(hisi_pmu->irq, cpumask_of(hisi_pmu->on_cpu)));
 		return 0;
 	}
 
-- 
2.24.0


