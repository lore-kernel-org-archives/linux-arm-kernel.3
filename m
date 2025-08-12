Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6C4C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+WMvKfgj79UKM5YricBTgo/1xQ/Vhop3RnEOUImzb4=; b=H7hrmHqdoUIRzs0Rg1bx1sb6aE
	WlNNWQ2MR8c0FWGe2d0cmhybEa7eNJ25BzAzMDIW8F7zlzuH9ROE6NApO0tpDqlTpHANw0iO53xK3
	YsMV+ncOUFNYpyWo1pyD35XB7JNORONw8CFf9v8eW2S76i05+1PjpiSEULpuEDbFjJrIKonUzWTWm
	kg8d5ZUKCx8/INJQcfZ1seOL1aoHA/vi4k0SncH7X4Yn8sIlgNSaK+OWBUWHHcw1xNG3XEzzlpj3g
	rSf3H/Wm1d2wPdPAtosZhHJBjtAYauP2iE8iOfEYcrtZMcmTrSfu3scX2QHZabpV34modXJonGTpg
	1TWBvk/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloEo-0000000AhwJ-29UT;
	Tue, 12 Aug 2025 12:36:22 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulk3j-0000000ACaj-2izl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:08:42 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4c1PF13jpQz13N1C;
	Tue, 12 Aug 2025 16:05:09 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 5B060180B54;
	Tue, 12 Aug 2025 16:08:32 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 12 Aug 2025 16:08:32 +0800
Received: from DESKTOP-VM4LOUJ.huawei.com (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 12 Aug 2025 16:08:31 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <james.clark@linaro.org>, <robh@kernel.org>, <anshuman.khandual@arm.com>,
	<jonathan.cameron@huawei.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <wangyushan12@huawei.com>,
	<yangyicong@hisilicon.com>
Subject: [PATCH 1/2] perf: arm_pmuv3: Factor out PMCCNTR_EL0 use conditions
Date: Tue, 12 Aug 2025 16:08:29 +0800
Message-ID: <20250812080830.20796-2-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250812080830.20796-1-yangyicong@huawei.com>
References: <20250812080830.20796-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_010839_851560_876D0EAF 
X-CRM114-Status: GOOD (  13.78  )
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

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/arm_pmuv3.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index f6d7bab5d555..95c899d07df5 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -978,6 +978,33 @@ static int armv8pmu_get_chain_idx(struct pmu_hw_events *cpuc,
 	return -EAGAIN;
 }
 
+static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
+				     struct perf_event *event)
+{
+	struct hw_perf_event *hwc = &event->hw;
+	unsigned long evtype = hwc->config_base & ARMV8_PMU_EVTYPE_EVENT;
+
+	/* PMCCNTR_EL0 can only be used for CPU_CYCLES event */
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
@@ -986,8 +1013,7 @@ static int armv8pmu_get_event_idx(struct pmu_hw_events *cpuc,
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


