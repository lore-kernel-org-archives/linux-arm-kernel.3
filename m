Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBADC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHwwlPAtand1e+7TeeNxrmIn7X9BoGhHY9gnNCUlrkI=; b=z39ToYyDpHUAKrejA5pn0Ej/Lu
	AJVJMD5952DlDmLmDj76LJ5FsYKfdwke+TqnpMU9ztZ4cLM0/rVde6Uys0xCoRy8/wkaGEmfZH1e4
	j64Q1fyYteF+aOtELDd5Hky3YA16wDpsQ/Uj4Djd96yvmk55Pfg3q545+h++THtgvfFOZYZSFKDMP
	h0g+yOl8kfuUPyI2OrfSm2T0AWnTcd3kXHP6WXoznXsWtFMZg9yoi++rrCzYNPQKYebO+Q6KWfpZe
	UuVo2jeRS1EyEkEew9l3W2f/DCrSNi6faTFlEXFnq7UD+ISq+Xr2gZlCKcbfcYajJ6EPmFNyX4Mj/
	waWvP6jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHOj-0000000EpU7-3Iop;
	Wed, 13 Aug 2025 19:44:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umErx-0000000EW6X-1kYa;
	Wed, 13 Aug 2025 17:02:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF4931E7D;
	Wed, 13 Aug 2025 10:02:24 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A75D43F738;
	Wed, 13 Aug 2025 10:02:28 -0700 (PDT)
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
Subject: [PATCH 15/19] perf: Simplify group validation
Date: Wed, 13 Aug 2025 18:01:07 +0100
Message-Id: <8e86d5021812c720219c8843e5179fe03e5c4de4.1755096883.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1755096883.git.robin.murphy@arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_100233_532918_87C39E49 
X-CRM114-Status: GOOD (  13.00  )
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

All of these drivers copy a pattern of actively policing cross-PMU
groups, which is redundant since commit bf480f938566 ("perf/core: Don't
allow grouping events from different hw pmus"). Clean up these checks to
simplfy matters, especially for thunderx2 which can reduce right down to
trivial counting.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm_cspmu/arm_cspmu.c |  7 ++-----
 drivers/perf/arm_dsu_pmu.c         |  6 ++----
 drivers/perf/arm_pmu.c             | 11 ++---------
 drivers/perf/thunderx2_pmu.c       | 30 +++++++-----------------------
 4 files changed, 13 insertions(+), 41 deletions(-)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index efa9b229e701..7f5ea749b85c 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -561,12 +561,9 @@ static bool arm_cspmu_validate_event(struct pmu *pmu,
 				 struct arm_cspmu_hw_events *hw_events,
 				 struct perf_event *event)
 {
-	if (is_software_event(event))
-		return true;
-
-	/* Reject groups spanning multiple HW PMUs. */
+	/* Ignore grouped events that aren't ours */
 	if (event->pmu != pmu)
-		return false;
+		return true;
 
 	return (arm_cspmu_get_event_idx(hw_events, event) >= 0);
 }
diff --git a/drivers/perf/arm_dsu_pmu.c b/drivers/perf/arm_dsu_pmu.c
index cb4fb59fe04b..7480fd6fe377 100644
--- a/drivers/perf/arm_dsu_pmu.c
+++ b/drivers/perf/arm_dsu_pmu.c
@@ -492,11 +492,9 @@ static bool dsu_pmu_validate_event(struct pmu *pmu,
 				  struct dsu_hw_events *hw_events,
 				  struct perf_event *event)
 {
-	if (is_software_event(event))
-		return true;
-	/* Reject groups spanning multiple HW PMUs. */
+	/* Ignore grouped events that aren't ours */
 	if (event->pmu != pmu)
-		return false;
+		return true;
 	return dsu_pmu_get_event_idx(hw_events, event) >= 0;
 }
 
diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index e8a3c8e99da0..2c1af3a0207c 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -375,16 +375,9 @@ validate_event(struct pmu *pmu, struct pmu_hw_events *hw_events,
 {
 	struct arm_pmu *armpmu;
 
-	if (is_software_event(event))
-		return 1;
-
-	/*
-	 * Reject groups spanning multiple HW PMUs (e.g. CPU + CCI). The
-	 * core perf code won't check that the pmu->ctx == leader->ctx
-	 * until after pmu->event_init(event).
-	 */
+	/* Ignore grouped events that aren't ours */
 	if (event->pmu != pmu)
-		return 0;
+		return 1;
 
 	armpmu = to_arm_pmu(event->pmu);
 	return armpmu->get_event_idx(hw_events, event) >= 0;
diff --git a/drivers/perf/thunderx2_pmu.c b/drivers/perf/thunderx2_pmu.c
index 6ed4707bd6bb..472eb4494fd1 100644
--- a/drivers/perf/thunderx2_pmu.c
+++ b/drivers/perf/thunderx2_pmu.c
@@ -519,19 +519,6 @@ static enum tx2_uncore_type get_tx2_pmu_type(struct acpi_device *adev)
 	return (enum tx2_uncore_type)id->driver_data;
 }
 
-static bool tx2_uncore_validate_event(struct pmu *pmu,
-				  struct perf_event *event, int *counters)
-{
-	if (is_software_event(event))
-		return true;
-	/* Reject groups spanning multiple HW PMUs. */
-	if (event->pmu != pmu)
-		return false;
-
-	*counters = *counters + 1;
-	return true;
-}
-
 /*
  * Make sure the group of events can be scheduled at once
  * on the PMU.
@@ -539,23 +526,20 @@ static bool tx2_uncore_validate_event(struct pmu *pmu,
 static bool tx2_uncore_validate_event_group(struct perf_event *event,
 		int max_counters)
 {
-	struct perf_event *sibling, *leader = event->group_leader;
-	int counters = 0;
+	struct perf_event *sibling;
+	int counters = 1;
 
 	if (event->group_leader == event)
 		return true;
 
-	if (!tx2_uncore_validate_event(event->pmu, leader, &counters))
-		return false;
+	if (event->group_leader->pmu == event->pmu)
+		++counters;
 
-	for_each_sibling_event(sibling, leader) {
-		if (!tx2_uncore_validate_event(event->pmu, sibling, &counters))
-			return false;
+	for_each_sibling_event(sibling, event->group_leader) {
+		if (sibling->pmu == event->pmu)
+			++counters;
 	}
 
-	if (!tx2_uncore_validate_event(event->pmu, event, &counters))
-		return false;
-
 	/*
 	 * If the group requires more counters than the HW has,
 	 * it cannot ever be scheduled.
-- 
2.39.2.101.g768bb238c484.dirty


