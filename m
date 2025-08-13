Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F196FCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8vVt+hyG8dD0Tbz+oeO5uX4deqsIy2mk9ronRV2MPI=; b=YmGlMx/Gbfi439d5+Pu54SI+EA
	HkxlZHJ/01FoC3nFZFWMAH3ELWdqYO4XwuzsZIRRcwJ0LS+v/31ERrSf3dB16dDiEd0/aE+SdfRkx
	E7kxuIBgXGzoAKN1KdwavlUCll0f+sIQFZ6kMYuTGV+61v2i/HURANsY8he8btAWW1Y6KY/iIoOS0
	2WiOFSPrxp+kx1EA3Mz49dwVM3B8dVlDy++/fAmc3yo+0WgF4zkNe2uZ+Lp7p4UoYaGAMSma1LI8S
	UK9dWKw72g+AS5F6yaiJTvqP1a36BFbR7ALnC3LR03ze59K0xtb3zsJyKgv2xXBJsA+hbgHw/EIwu
	0Zc1wxDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHOL-0000000EozB-3Fuv;
	Wed, 13 Aug 2025 19:44:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umErj-0000000EVuz-3y3R;
	Wed, 13 Aug 2025 17:02:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C8671D15;
	Wed, 13 Aug 2025 10:02:11 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 25A5E3F738;
	Wed, 13 Aug 2025 10:02:15 -0700 (PDT)
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
Subject: [PATCH 12/19] perf: Ignore event state for group validation
Date: Wed, 13 Aug 2025 18:01:04 +0100
Message-Id: <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1755096883.git.robin.murphy@arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_100220_069383_6FC9B0D7 
X-CRM114-Status: GOOD (  14.93  )
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

It may have been different long ago, but today it seems wrong for these
drivers to skip counting disabled sibling events in group validation,
given that perf_event_enable() could make them schedulable again, and
thus increase the effective size of the group later. Conversely, if a
sibling event is truly dead then it stands to reason that the whole
group is dead, so it's not worth going to any special effort to try to
squeeze in a new event that's never going to run anyway. Thus, we can
simply remove all these checks.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/alpha/kernel/perf_event.c   | 2 +-
 arch/powerpc/perf/core-book3s.c  | 3 +--
 arch/powerpc/perf/core-fsl-emb.c | 3 +--
 arch/sparc/kernel/perf_event.c   | 3 +--
 arch/x86/events/core.c           | 2 +-
 arch/x86/events/intel/uncore.c   | 3 +--
 drivers/dma/idxd/perfmon.c       | 3 +--
 drivers/perf/arm_pmu.c           | 6 ------
 8 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index a3eaab094ece..8557165e64c0 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -352,7 +352,7 @@ static int collect_events(struct perf_event *group, int max_count,
 		current_idx[n++] = PMC_NO_INDEX;
 	}
 	for_each_sibling_event(pe, group) {
-		if (!is_software_event(pe) && pe->state != PERF_EVENT_STATE_OFF) {
+		if (!is_software_event(pe)) {
 			if (n >= max_count)
 				return -1;
 			event[n] = pe;
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 8b0081441f85..d67f7d511f13 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -1602,8 +1602,7 @@ static int collect_events(struct perf_event *group, int max_count,
 		events[n++] = group->hw.config;
 	}
 	for_each_sibling_event(event, group) {
-		if (event->pmu->task_ctx_nr == perf_hw_context &&
-		    event->state != PERF_EVENT_STATE_OFF) {
+		if (event->pmu->task_ctx_nr == perf_hw_context) {
 			if (n >= max_count)
 				return -1;
 			ctrs[n] = event;
diff --git a/arch/powerpc/perf/core-fsl-emb.c b/arch/powerpc/perf/core-fsl-emb.c
index 7120ab20cbfe..509932b91b75 100644
--- a/arch/powerpc/perf/core-fsl-emb.c
+++ b/arch/powerpc/perf/core-fsl-emb.c
@@ -261,8 +261,7 @@ static int collect_events(struct perf_event *group, int max_count,
 		n++;
 	}
 	for_each_sibling_event(event, group) {
-		if (!is_software_event(event) &&
-		    event->state != PERF_EVENT_STATE_OFF) {
+		if (!is_software_event(event)) {
 			if (n >= max_count)
 				return -1;
 			ctrs[n] = event;
diff --git a/arch/sparc/kernel/perf_event.c b/arch/sparc/kernel/perf_event.c
index cae4d33002a5..706127749c66 100644
--- a/arch/sparc/kernel/perf_event.c
+++ b/arch/sparc/kernel/perf_event.c
@@ -1357,8 +1357,7 @@ static int collect_events(struct perf_event *group, int max_count,
 		current_idx[n++] = PIC_NO_INDEX;
 	}
 	for_each_sibling_event(event, group) {
-		if (!is_software_event(event) &&
-		    event->state != PERF_EVENT_STATE_OFF) {
+		if (!is_software_event(event)) {
 			if (n >= max_count)
 				return -1;
 			evts[n] = event;
diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 7610f26dfbd9..eca5bb49aa85 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -1211,7 +1211,7 @@ static int collect_events(struct cpu_hw_events *cpuc, struct perf_event *leader,
 		return n;
 
 	for_each_sibling_event(event, leader) {
-		if (!is_x86_event(event) || event->state <= PERF_EVENT_STATE_OFF)
+		if (!is_x86_event(event))
 			continue;
 
 		if (collect_event(cpuc, event, max_count, n))
diff --git a/arch/x86/events/intel/uncore.c b/arch/x86/events/intel/uncore.c
index a762f7f5b161..297ff5adb667 100644
--- a/arch/x86/events/intel/uncore.c
+++ b/arch/x86/events/intel/uncore.c
@@ -406,8 +406,7 @@ uncore_collect_events(struct intel_uncore_box *box, struct perf_event *leader,
 		return n;
 
 	for_each_sibling_event(event, leader) {
-		if (!is_box_event(box, event) ||
-		    event->state <= PERF_EVENT_STATE_OFF)
+		if (!is_box_event(box, event))
 			continue;
 
 		if (n >= max_count)
diff --git a/drivers/dma/idxd/perfmon.c b/drivers/dma/idxd/perfmon.c
index 4b6af2f15d8a..8c539e1f11da 100644
--- a/drivers/dma/idxd/perfmon.c
+++ b/drivers/dma/idxd/perfmon.c
@@ -75,8 +75,7 @@ static int perfmon_collect_events(struct idxd_pmu *idxd_pmu,
 		return n;
 
 	for_each_sibling_event(event, leader) {
-		if (!is_idxd_event(idxd_pmu, event) ||
-		    event->state <= PERF_EVENT_STATE_OFF)
+		if (!is_idxd_event(idxd_pmu, event))
 			continue;
 
 		if (n >= max_count)
diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 5c310e803dd7..e8a3c8e99da0 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -386,12 +386,6 @@ validate_event(struct pmu *pmu, struct pmu_hw_events *hw_events,
 	if (event->pmu != pmu)
 		return 0;
 
-	if (event->state < PERF_EVENT_STATE_OFF)
-		return 1;
-
-	if (event->state == PERF_EVENT_STATE_OFF && !event->attr.enable_on_exec)
-		return 1;
-
 	armpmu = to_arm_pmu(event->pmu);
 	return armpmu->get_event_idx(hw_events, event) >= 0;
 }
-- 
2.39.2.101.g768bb238c484.dirty


