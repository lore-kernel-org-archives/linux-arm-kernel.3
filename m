Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C312FCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXHamsMLNwHVpaGynDdhERM2+xzdxPhWLgT1ksjOIBA=; b=x9pLYCBgU+CpqvkfXdDgtw+N5l
	yqqzgNP3mcGoBFb5NRmvdpSgTgxN46KnoJGr3S/ncVbeQ8Gg38Yt6Y+ZCSu+DNdCyId4i/AYq0JCN
	5uQBnnd8twewCItqK2GLNavZfZ2XZKB2vkW5kl11J5xCQMD7M3F9ObyP6vXK1NYw0DP6tF6txuFk6
	cnSMABL5dSWV0ioAGinXtGhBdi7KruoitX7TZgC3fLQSOD+rhOH2q0sgjcFmrx+Q73RyQakNQz1BD
	XDqrCi/lIU2G72hOuO2HIkoC/iRL0rIvhlRegHYVekFuki33OVMTWUmVHuFoQvL076GybJ8WbfLur
	S1s4pIAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHOD-0000000Eolg-3qP2;
	Wed, 13 Aug 2025 19:44:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umErf-0000000EVrs-1zVw;
	Wed, 13 Aug 2025 17:02:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4F331D14;
	Wed, 13 Aug 2025 10:02:06 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9DB4C3F738;
	Wed, 13 Aug 2025 10:02:10 -0700 (PDT)
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
Subject: [PATCH 11/19] perf/arm-cci: Tidy up event validation
Date: Wed, 13 Aug 2025 18:01:03 +0100
Message-Id: <b433bdccbf83a71878b67a9c159c3e9414bef2d0.1755096883.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1755096883.git.robin.murphy@arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_100215_583046_D56DF47B 
X-CRM114-Status: GOOD (  14.27  )
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

The CCI driver only accepts events of its own type, so it is pointless
to re-check the event type again further into validation. Conversely, if
an event *is* for CCI but has a nonsense config, we should not return
-ENOENT to potentially offer it to other PMUs. Finally it seems wrong
not to count disabled events which may be enabled later.

These are all artefacts left over from the original attempt to fit CCI
into the arm_pmu framework; clean them up, along with the now-redundant
checks for cross-PMU groups which core code will already handle (albeit
not quite as the out-of-date comment says).

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-cci.c | 47 +++++++++++-------------------------------
 1 file changed, 12 insertions(+), 35 deletions(-)

diff --git a/drivers/perf/arm-cci.c b/drivers/perf/arm-cci.c
index 1cc3214d6b6d..086d4363fcc8 100644
--- a/drivers/perf/arm-cci.c
+++ b/drivers/perf/arm-cci.c
@@ -333,7 +333,7 @@ static int cci400_validate_hw_event(struct cci_pmu *cci_pmu, unsigned long hw_ev
 	int if_type;
 
 	if (hw_event & ~CCI400_PMU_EVENT_MASK)
-		return -ENOENT;
+		return -EINVAL;
 
 	if (hw_event == CCI400_PMU_CYCLES)
 		return hw_event;
@@ -354,14 +354,14 @@ static int cci400_validate_hw_event(struct cci_pmu *cci_pmu, unsigned long hw_ev
 		if_type = CCI_IF_MASTER;
 		break;
 	default:
-		return -ENOENT;
+		return -EINVAL;
 	}
 
 	if (ev_code >= cci_pmu->model->event_ranges[if_type].min &&
 		ev_code <= cci_pmu->model->event_ranges[if_type].max)
 		return hw_event;
 
-	return -ENOENT;
+	return -EINVAL;
 }
 
 static int probe_cci400_revision(struct cci_pmu *cci_pmu)
@@ -541,7 +541,7 @@ static int cci500_validate_hw_event(struct cci_pmu *cci_pmu,
 	int if_type;
 
 	if (hw_event & ~CCI5xx_PMU_EVENT_MASK)
-		return -ENOENT;
+		return -EINVAL;
 
 	switch (ev_source) {
 	case CCI5xx_PORT_S0:
@@ -565,14 +565,14 @@ static int cci500_validate_hw_event(struct cci_pmu *cci_pmu,
 		if_type = CCI_IF_GLOBAL;
 		break;
 	default:
-		return -ENOENT;
+		return -EINVAL;
 	}
 
 	if (ev_code >= cci_pmu->model->event_ranges[if_type].min &&
 		ev_code <= cci_pmu->model->event_ranges[if_type].max)
 		return hw_event;
 
-	return -ENOENT;
+	return -EINVAL;
 }
 
 /*
@@ -592,7 +592,7 @@ static int cci550_validate_hw_event(struct cci_pmu *cci_pmu,
 	int if_type;
 
 	if (hw_event & ~CCI5xx_PMU_EVENT_MASK)
-		return -ENOENT;
+		return -EINVAL;
 
 	switch (ev_source) {
 	case CCI5xx_PORT_S0:
@@ -617,14 +617,14 @@ static int cci550_validate_hw_event(struct cci_pmu *cci_pmu,
 		if_type = CCI_IF_GLOBAL;
 		break;
 	default:
-		return -ENOENT;
+		return -EINVAL;
 	}
 
 	if (ev_code >= cci_pmu->model->event_ranges[if_type].min &&
 		ev_code <= cci_pmu->model->event_ranges[if_type].max)
 		return hw_event;
 
-	return -ENOENT;
+	return -EINVAL;
 }
 
 #endif	/* CONFIG_ARM_CCI5xx_PMU */
@@ -801,17 +801,6 @@ static int pmu_get_event_idx(struct cci_pmu_hw_events *hw, struct perf_event *ev
 	return -EAGAIN;
 }
 
-static int pmu_map_event(struct perf_event *event)
-{
-	struct cci_pmu *cci_pmu = to_cci_pmu(event->pmu);
-
-	if (event->attr.type < PERF_TYPE_MAX ||
-			!cci_pmu->model->validate_hw_event)
-		return -ENOENT;
-
-	return	cci_pmu->model->validate_hw_event(cci_pmu, event->attr.config);
-}
-
 static int pmu_request_irq(struct cci_pmu *cci_pmu, irq_handler_t handler)
 {
 	int i;
@@ -1216,21 +1205,8 @@ static int validate_event(struct pmu *cci_pmu,
 			  struct cci_pmu_hw_events *hw_events,
 			  struct perf_event *event)
 {
-	if (is_software_event(event))
-		return 1;
-
-	/*
-	 * Reject groups spanning multiple HW PMUs (e.g. CPU + CCI). The
-	 * core perf code won't check that the pmu->ctx == leader->ctx
-	 * until after pmu->event_init(event).
-	 */
+	/* Ignore grouped events that aren't ours */
 	if (event->pmu != cci_pmu)
-		return 0;
-
-	if (event->state < PERF_EVENT_STATE_OFF)
-		return 1;
-
-	if (event->state == PERF_EVENT_STATE_OFF && !event->attr.enable_on_exec)
 		return 1;
 
 	return pmu_get_event_idx(hw_events, event) >= 0;
@@ -1266,10 +1242,11 @@ static int validate_group(struct perf_event *event)
 
 static int __hw_perf_event_init(struct perf_event *event)
 {
+	struct cci_pmu *cci_pmu = to_cci_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
 	int mapping;
 
-	mapping = pmu_map_event(event);
+	mapping = cci_pmu->model->validate_hw_event(cci_pmu, event->attr.config);
 
 	if (mapping < 0) {
 		pr_debug("event %x:%llx not supported\n", event->attr.type,
-- 
2.39.2.101.g768bb238c484.dirty


