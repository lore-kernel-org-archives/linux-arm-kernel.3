Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3539E64A89
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 13:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4PdQ7tz3ScatwlgB+p4B1Qeh4WSBGRzPjdyvKq+LsW0=; b=AhZapNiRK1RJfXhuNyQJzgAPj3
	in4VlszsPZpFpSTDRZCM4RG9AIDrhGLuobKw8d06bgXFvgB1/SeJUu/ixly9YJNCuqcF7zmMXxV/O
	NDMujKM/OFyOgyX3usJgQJcX1GNG6zYRo9SSA7G9fHm2JE/a+trJ1nHUlQ3TcYOrfTn7BfHKx6Ap0
	NHHyML6MY0li+/Eroy5+8L0IlS4kHjjyrBZy3Q9eWdtzVBUmiuN81hP+z1rMq3aovkF6z2lOlrGdk
	QD6GeKHKV3kai72AGb4zlVHTMcfuP/ZrmkiKZNIyrcmdSOm+dPk/ZHg+s7/ySD49PxbAa6o2CSG6s
	f8TQJZEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISaz-00000009XmD-35Dk;
	Tue, 03 Dec 2024 13:05:41 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISNX-00000009VA2-3DPo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:51:49 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Y2gXF6WyBz1yrbf;
	Tue,  3 Dec 2024 20:51:57 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 6D82C140391;
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
Subject: [PATCH v4 03/10] drivers/perf: hisi: Migrate to one online CPU if no associated one online
Date: Tue, 3 Dec 2024 20:50:42 +0800
Message-ID: <20241203125049.39458-4-yangyicong@huawei.com>
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
X-CRM114-CacheID: sfid-20241203_045147_968904_CACF7787 
X-CRM114-Status: GOOD (  11.52  )
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

If the selected CPU hisi_pmu::on_cpu goes offline, driver will select
a new online CPU from hisi_pmu::associated_cpus, or if no online CPU
found the PMU context won't be migrated. However for uncore PMUs the
associated CPUs are just a peference and it also works to schedule
the events on any online CPUs. So add a fallback to choose an online
CPU if no associated CPUs found.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/hisilicon/hisi_uncore_pmu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
index dbe7299f0f05..3a4db5c5d70f 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
@@ -499,9 +499,16 @@ int hisi_uncore_pmu_offline_cpu(unsigned int cpu, struct hlist_node *node)
 	/* Give up ownership of the PMU */
 	hisi_pmu->on_cpu = -1;
 
-	/* Choose a new CPU to migrate ownership of the PMU to */
+	/*
+	 * Migrate ownership of the PMU to a new CPU chosen from PMU's online
+	 * associated CPUs if possible, if no associated CPU online then
+	 * migrate to one online CPU.
+	 */
 	target = cpumask_any_and_but(&hisi_pmu->associated_cpus,
 				     cpu_online_mask, cpu);
+	if (target >= nr_cpu_ids)
+		target = cpumask_any_but(cpu_online_mask, cpu);
+
 	if (target >= nr_cpu_ids)
 		return 0;
 
-- 
2.24.0


