Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0E0CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 09:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2hyVLnuGKA/FTg3qoM09weoJcnPdaoQ6/KK7y/T4ck=; b=JY73XT5ADkUwOgOGg17GgsEDdv
	Xo9bUhg3kKgr8st8YNVg50wZ3KdjD+xEcWqsfTUiPYNUG0o8lTPpIzuItNDkJ6AJN30FwuvLjhC5f
	TJkYp7iOmnkl9BoREL3gkRIvvalz19BVSLYWR5a7VwA6+cuCaTkvdAdI9wgS2ZJHOSJILJEZ6vjUg
	CKV4T4hNbz2IckaXCtKZr2agJ1BHuua7b4C/BSSKDPgbHPAVLWSpUzCCBQkJPTugwAyV+9NcrP3xB
	x7+CUp68/dmGfrrMTHET42KTmu8uvDG9HHv582XndmzGwyXg0eIKI0VTSKKfNBIE80V7mPxyb5Xvt
	HWXpwkMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uof49-0000000CudH-1fV2;
	Wed, 20 Aug 2025 09:25:09 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeS1-0000000Cn2o-0lnU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 08:45:46 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4c6Kfx3gb5zdcYF;
	Wed, 20 Aug 2025 16:41:13 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 7EDEB140123;
	Wed, 20 Aug 2025 16:45:36 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 20 Aug 2025 16:45:36 +0800
Received: from DESKTOP-VM4LOUJ.huawei.com (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 20 Aug 2025 16:45:35 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <sudeep.holla@arm.com>, <james.clark@linaro.org>, <robh@kernel.org>,
	<anshuman.khandual@arm.com>, <jonathan.cameron@huawei.com>,
	<hejunhao3@huawei.com>, <linuxarm@huawei.com>, <prime.zeng@hisilicon.com>,
	<xuwei5@huawei.com>, <wangyushan12@huawei.com>, <yangyicong@hisilicon.com>
Subject: [PATCH v2 1/2] perf: arm_pmuv3: Factor out PMCCNTR_EL0 use conditions
Date: Wed, 20 Aug 2025 16:45:33 +0800
Message-ID: <20250820084534.28037-2-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250820084534.28037-1-yangyicong@huawei.com>
References: <20250820084534.28037-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_014545_375401_82ECA015 
X-CRM114-Status: GOOD (  12.93  )
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

PMCCNTR_EL0 is preferred for counting CPU_CYCLES under certain
conditions. Factor out the condition check to a separate function
for further extension. Add documents for better understanding.
No functional changes intended.

Reviewed-by: James Clark <james.clark@linaro.org>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/arm_pmuv3.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index f6d7bab5d555..69c5cc8f5606 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -978,6 +978,32 @@ static int armv8pmu_get_chain_idx(struct pmu_hw_events *cpuc,
 	return -EAGAIN;
 }
 
+static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
+				     struct perf_event *event)
+{
+	struct hw_perf_event *hwc = &event->hw;
+	unsigned long evtype = hwc->config_base & ARMV8_PMU_EVTYPE_EVENT;
+
+	if (evtype != ARMV8_PMUV3_PERFCTR_CPU_CYCLES)
+		return false;
+
+	/*
+	 * A CPU_CYCLES event with threshold counting cannot use PMCCNTR_EL0
+	 * since it lacks threshold support.
+	 */
+	if (armv8pmu_event_get_threshold(&event->attr))
+		return false;
+
+	/*
+	 * PMCCNTR_EL0 is not affected by BRBE controls like BRBCR_ELx.FZP.
+	 * So don't use it for branch events.
+	 */
+	if (has_branch_stack(event))
+		return false;
+
+	return true;
+}
+
 static int armv8pmu_get_event_idx(struct pmu_hw_events *cpuc,
 				  struct perf_event *event)
 {
@@ -986,8 +1012,7 @@ static int armv8pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	unsigned long evtype = hwc->config_base & ARMV8_PMU_EVTYPE_EVENT;
 
 	/* Always prefer to place a cycle counter into the cycle counter. */
-	if ((evtype == ARMV8_PMUV3_PERFCTR_CPU_CYCLES) &&
-	    !armv8pmu_event_get_threshold(&event->attr) && !has_branch_stack(event)) {
+	if (armv8pmu_can_use_pmccntr(cpuc, event)) {
 		if (!test_and_set_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask))
 			return ARMV8_PMU_CYCLE_IDX;
 		else if (armv8pmu_event_is_64bit(event) &&
-- 
2.24.0


