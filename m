Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D980CA0EE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBGDke6NrPEwwsNMNZKq4BKfcoViEJgulzCycTPRffE=; b=ez9lm/4FwZbRSWBnbSwTxnzjRH
	qld7vjeyf5spIkyJocucWyIFaM7Ws/1MH2LAEtVrqRi1XLGeyALg3BnWVXxSelh3131GCUEuqoFhc
	rb1Sk4GRSoVC/+as8oDqxVY+QQZlo6OE7+VxSgwiqo72DiJzvBLNArdSs9eUeRWBvH0l5XOqdNxgL
	bJmtCa+MfmzrT/ImyWcwBeZBLvHqNPbFK141yj9Nu5pqlUxS84c0FquOwzJlUzjht5xIPdbHPJFgi
	YR5d3b1FlfdQ0TCxTcJhbv+sT07AHKT5cWw5oOOCaoR5GWDyCzwDCy3gz12ZvW/ewsWMEv3pg4IqF
	ex0c4XAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHO1-0000000EoRL-1cBv;
	Wed, 13 Aug 2025 19:43:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umErR-0000000EVgG-48Fp;
	Wed, 13 Aug 2025 17:02:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35A361CDD;
	Wed, 13 Aug 2025 10:01:53 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 181F03F738;
	Wed, 13 Aug 2025 10:01:56 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	mark.rutland@arm.com,
	acme@kernel.org,
	namhyung@kernel.org,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com
Cc: linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	coresight@lists.linaro.org,
	iommu@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-cxl@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 08/19] perf/arm_smmu_v3: Improve group validation
Date: Wed, 13 Aug 2025 18:01:00 +0100
Message-Id: <c0e5e426b571a438a88adc8a9e16d2f066171cc2.1755096883.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1755096883.git.robin.murphy@arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_100202_142829_A9CF5986 
X-CRM114-Status: GOOD (  11.23  )
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

The group validation here is OK, except for the benign issue that it
will double-count an event that is its own group leader. Even though
it's highly unlikely we'd ever have PMCG hardware with only one counter,
let's sort that out, cleaning up some reudundant checks in the process.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm_smmuv3_pmu.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/perf/arm_smmuv3_pmu.c b/drivers/perf/arm_smmuv3_pmu.c
index 621f02a7f43b..7cac380a3528 100644
--- a/drivers/perf/arm_smmuv3_pmu.c
+++ b/drivers/perf/arm_smmuv3_pmu.c
@@ -377,9 +377,6 @@ static int smmu_pmu_get_event_idx(struct smmu_pmu *smmu_pmu,
 static bool smmu_pmu_events_compatible(struct perf_event *curr,
 				       struct perf_event *new)
 {
-	if (new->pmu != curr->pmu)
-		return false;
-
 	if (to_smmu_pmu(new->pmu)->global_filter &&
 	    !smmu_pmu_check_global_filter(curr, new))
 		return false;
@@ -422,15 +419,6 @@ static int smmu_pmu_event_init(struct perf_event *event)
 		return -EINVAL;
 	}
 
-	/* Don't allow groups with mixed PMUs, except for s/w events */
-	if (!is_software_event(event->group_leader)) {
-		if (!smmu_pmu_events_compatible(event->group_leader, event))
-			return -EINVAL;
-
-		if (++group_num_events > smmu_pmu->num_counters)
-			return -EINVAL;
-	}
-
 	/*
 	 * Ensure all events are on the same cpu so all events are in the
 	 * same cpu context, to avoid races on pmu_enable etc.
@@ -442,8 +430,16 @@ static int smmu_pmu_event_init(struct perf_event *event)
 	if (event->group_leader == event)
 		return 0;
 
+	if (event->group_leader->pmu == event->pmu) {
+		if (!smmu_pmu_events_compatible(event->group_leader, event))
+			return -EINVAL;
+
+		if (++group_num_events > smmu_pmu->num_counters)
+			return -EINVAL;
+	}
+
 	for_each_sibling_event(sibling, event->group_leader) {
-		if (is_software_event(sibling))
+		if (sibling->pmu != event->pmu)
 			continue;
 
 		if (!smmu_pmu_events_compatible(sibling, event))
-- 
2.39.2.101.g768bb238c484.dirty


