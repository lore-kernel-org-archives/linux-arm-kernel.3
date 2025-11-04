Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A62CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rSWenVj2+7fEyjwrY9GzjdbeLNu/2sr2FPNzJ2bILbM=; b=KlSzKoRv+zpac/9pIZdRWNd0dW
	id4IHTCNItET7Ex0HKMtfU75pmyl75ngbg24TWlUYMKp0Tv9pEcjiWbPvVJ1FGPrn+f8CmOZiIULy
	kNRWbBs8rR4G/Fp1EUVJhLgi48OSxlzoamIzuBJ4dxrDLJhCdRqneX1o4g9/5LHqd0WRdyCZp5Ck1
	/YzpM4J0EtOB8qkqO2UYXCUEK27/JCZTvdbIdb3E5hceMFmzClOpPN8T953SJNxDhNH1l+0jNrKzC
	vQIDtd/mgtTKBE/WGmehVYxu1WQflEoFrBsVERKQwKTw8lmIfCgQ/wc6Go4DqJQMPzqZstibBFAqT
	XevciTtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLn0-0000000COpa-3vXT;
	Tue, 04 Nov 2025 18:29:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLmy-0000000COoU-0i6U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:29:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C69A61CE0;
	Tue,  4 Nov 2025 10:29:40 -0800 (PST)
Received: from 010265703453.cambridge.arm.com (010265703453.cambridge.arm.com [10.1.33.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D22D23F694;
	Tue,  4 Nov 2025 10:29:47 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] perf/arm-ni: Fix and optimise register offset calculation
Date: Tue,  4 Nov 2025 18:29:40 +0000
Message-Id: <5db610facd51b81af04b1afee53191836315b17a.1762264719.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_102952_257445_18879560 
X-CRM114-Status: GOOD (  11.63  )
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

LKP points out an operator precedence oversight in the new NoC S3
support that, annoyingly, my local W=1 build didn't flag. In fixing
that, we can also take the similarly-missed opportunity to cache the
version check itself at event_init time.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511041749.ok8zDP6u-lkp@intel.com/
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-ni.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
index aa824abc629e..66858c65215d 100644
--- a/drivers/perf/arm-ni.c
+++ b/drivers/perf/arm-ni.c
@@ -323,9 +323,15 @@ static int arm_ni_validate_group(struct perf_event *event)
 	return 0;
 }
 
+static bool arm_ni_is_7xx(const struct arm_ni *ni)
+{
+	return ni->part == PART_NI_700 || ni->part == PART_NI_710AE;
+}
+
 static int arm_ni_event_init(struct perf_event *event)
 {
 	struct arm_ni_cd *cd = pmu_to_cd(event->pmu);
+	struct arm_ni *ni;
 
 	if (event->attr.type != event->pmu->type)
 		return -ENOENT;
@@ -333,7 +339,10 @@ static int arm_ni_event_init(struct perf_event *event)
 	if (is_sampling_event(event))
 		return -EINVAL;
 
-	event->cpu = cd_to_ni(cd)->cpu;
+	ni = cd_to_ni(cd);
+	event->cpu = ni->cpu;
+	event->hw.flags = arm_ni_is_7xx(ni);
+
 	if (NI_EVENT_TYPE(event) == NI_PMU)
 		return arm_ni_validate_group(event);
 
@@ -411,18 +420,12 @@ static void arm_ni_init_evcnt(struct hw_perf_event *hw)
 	writel_relaxed(S32_MIN, (void __iomem *)hw->event_base);
 }
 
-static bool arm_ni_is_7xx(const struct arm_ni *ni)
-{
-	return ni->part == PART_NI_700 || ni->part == PART_NI_710AE;
-}
-
 static int arm_ni_event_add(struct perf_event *event, int flags)
 {
 	struct arm_ni_cd *cd = pmu_to_cd(event->pmu);
 	struct hw_perf_event *hw = &event->hw;
 	struct arm_ni_unit *unit;
 	enum ni_node_type type = NI_EVENT_TYPE(event);
-	bool is_7xx = arm_ni_is_7xx(cd_to_ni(cd));
 	u32 reg;
 
 	if (type == NI_PMU) {
@@ -430,7 +433,7 @@ static int arm_ni_event_add(struct perf_event *event, int flags)
 			return -ENOSPC;
 		hw->idx = NI_CCNT_IDX;
 		hw->event_base = (unsigned long)cd->pmu_base +
-				 is_7xx ? NI700_PMCCNTR_L : NI_PMCCNTR_L;
+				 (hw->flags ? NI700_PMCCNTR_L : NI_PMCCNTR_L);
 		cd->ccnt = event;
 		arm_ni_init_ccnt(hw);
 	} else {
@@ -443,7 +446,7 @@ static int arm_ni_event_add(struct perf_event *event, int flags)
 		unit = (void *)hw->config_base;
 		unit->event[hw->idx] = NI_EVENT_EVENTID(event);
 		hw->event_base = (unsigned long)cd->pmu_base +
-				 is_7xx ? NI700_PMEVCNTR(hw->idx) : NI_PMEVCNTR(hw->idx);
+				 (hw->flags ? NI700_PMEVCNTR(hw->idx) : NI_PMEVCNTR(hw->idx));
 		arm_ni_init_evcnt(hw);
 		lo_hi_writeq_relaxed(le64_to_cpu(unit->pmusel), unit->pmusela);
 
-- 
2.34.1


