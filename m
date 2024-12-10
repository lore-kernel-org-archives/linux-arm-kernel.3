Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3B2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9/ky/0Zm30n37/FvbhkeYIQHlv/9HTAG+JM0ljnpi0=; b=VjhBZ6BPFijcGgbPXUGmGL3/rx
	uUfwHsr5Ap51Cn4jGfdEcvUWBTNbn9F6hnKd3VVeGgqqy91etIjJwghfhUMtxwGvPrTes1IQSCgzP
	lA/WnGp9yHP1w2ViyvRl1I1mAMGrvQvItcDO6XOVzuDY7P/bWSQtrbPH1MpgWgPheNo5pnyUW7FVL
	doGpEoHIfiL65EBuhtMnNyiY+3WYq1DFyVQkOMoIQ4MPPP5ELGix2HRUIxI3DwdSzVKZWWO8oHIls
	8rkIHzpLsUULyP33M5O70wWAGA+PogTr+UbEJzJ6ev6ATQSYy+xQXOjd/nx7X5/vjZIqpPWxmmMRH
	b+YchXsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL14R-0000000BirH-2isR;
	Tue, 10 Dec 2024 14:18:39 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL12M-0000000BiHQ-1JFb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:16:32 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Y712R2XTTz21mqZ;
	Tue, 10 Dec 2024 22:14:39 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 4B9B114010C;
	Tue, 10 Dec 2024 22:16:23 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 10 Dec 2024 22:16:22 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <jonathan.cameron@huawei.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <yangyicong@hisilicon.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	<wangyushan12@huawei.com>, <prime.zeng@hisilicon.com>
Subject: [PATCH v5 03/10] drivers/perf: hisi: Migrate to one online CPU if no associated one online
Date: Tue, 10 Dec 2024 22:15:18 +0800
Message-ID: <20241210141525.37788-4-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241210141525.37788-1-yangyicong@huawei.com>
References: <20241210141525.37788-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_061630_498199_438F60DC 
X-CRM114-Status: GOOD (  10.78  )
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
index 8c404f8b3f39..c775e4722dac 100644
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


