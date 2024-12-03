Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A7AE64A89
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 13:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQW88qz9+wbWEqCZ8z5z++nVTqcPLZgCyS1kvno9Qds=; b=KtrGQoHStyz4XbfFAOJqVVJMy9
	uBSTKuFXcsKu97uHSh+lxQ1Grhog71I72vpQEE/ZbZFroIIuYAytg+Dn9oMgblcucihsNblLjgYQa
	bwMhKi7nk15qnQxabPKDfX/mbIGD77mTRfUR8X88FkEYE4QdE3d8gy8dnXSt7ar7mYzlVyjWXwBR5
	WsrOxalzcvr7BqlzaI+oGCmwG41usXH1gITKL2Eg+y9jyIEU9Bn8rG0qSxgjSHlSiQ/fd2+twNmET
	61JFmznTl0j3zUJbzlAMthtayMqiSwC7TkvXXZDibEZ6POGDeQHLBFHi1+nQf042ERM93M9TZy8/w
	4bMvSZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISdv-00000009YPU-2jeM;
	Tue, 03 Dec 2024 13:08:43 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISNY-00000009VA1-01AG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:51:50 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Y2gWq3Crzz1JDY2;
	Tue,  3 Dec 2024 20:51:35 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 085D51402CB;
	Tue,  3 Dec 2024 20:51:42 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 3 Dec 2024 20:51:41 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <jonathan.cameron@huawei.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <yangyicong@hisilicon.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	<wangyushan12@huawei.com>, <prime.zeng@hisilicon.com>
Subject: [PATCH v4 02/10] drivers/perf: hisi: Don't update the associated_cpus on CPU offline
Date: Tue, 3 Dec 2024 20:50:41 +0800
Message-ID: <20241203125049.39458-3-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241203125049.39458-1-yangyicong@huawei.com>
References: <20241203125049.39458-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_045148_241003_367DE5D6 
X-CRM114-Status: UNSURE (   9.04  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

Event will be scheduled on CPU of hisi_pmu::on_cpu which is selected
from the intersection of hisi_pmu::associated_cpus and online CPUs.
So the associated_cpus don't need to be maintained with online CPUs.
This will save one update operation if one associated CPU is offlined.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/hisilicon/hisi_uncore_pmu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
index 416f72a813fc..dbe7299f0f05 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
@@ -492,9 +492,6 @@ int hisi_uncore_pmu_offline_cpu(unsigned int cpu, struct hlist_node *node)
 						     node);
 	unsigned int target;
 
-	if (!cpumask_test_and_clear_cpu(cpu, &hisi_pmu->associated_cpus))
-		return 0;
-
 	/* Nothing to do if this CPU doesn't own the PMU */
 	if (hisi_pmu->on_cpu != cpu)
 		return 0;
-- 
2.24.0


