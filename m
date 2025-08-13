Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA811CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zMyqiCv2M/U2yYZT3qMYAKyPv8u005FDdR0kHpu8uw=; b=sTAB6UBJFm7bObZGGooDk9+R65
	fFYcA7nWZR2OwKZDuJeEYHE/FjHOfgj2GNEJHGWT2snElGcDiwEafySUMic4BtGDiZOloC2R8R2ht
	+c/93XyGGxVl57d9Zfa8R6VkP5wrFaQ7w8SJWZmfhtDIro5ZBqKwxDjNaK1ugplMMkCQ3E3/Bkrqb
	ebfEJVGicUUxB3cNi3jLNUj0ZeWo3yFr9sbOLQ6+ocV80wE8pw+BiFV4kGi1QtNebrd8HnaD5Lo/V
	Klzc6im4H06W3yR1hsIsAagR03TJsouNgMd3/kfZAOxxxH3woMZEy3oRxWd3Nsj5jW5BLnx0agIH9
	naN0B2rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHO4-0000000EoVf-13WO;
	Wed, 13 Aug 2025 19:43:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umErW-0000000EVjg-1MII;
	Wed, 13 Aug 2025 17:02:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEBB71CE0;
	Wed, 13 Aug 2025 10:01:57 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 95E5A3F738;
	Wed, 13 Aug 2025 10:02:01 -0700 (PDT)
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
Subject: [PATCH 09/19] perf/qcom: Improve group validation
Date: Wed, 13 Aug 2025 18:01:01 +0100
Message-Id: <ae74987481902e3937a8aa7ceaee4adcc681d7b4.1755096883.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1755096883.git.robin.murphy@arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_100206_472445_C4CFC8EA 
X-CRM114-Status: GOOD (  14.26  )
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

The L3 driver's group validation is almost right, except for erroneously
counting a software group leader - which is benign other than
artificially limiting the maximum size of such a group to one less than
it could be. Correct that with the now-established pattern of simply
ignoring all events which do not belong to our PMU.

The L2 driver gets a cleanup of some slightly suspicious logic, and both
can have the same overall simplification to not duplicate things that perf
core will already do, and avoid racy access to the sibling list of group
leader events.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/qcom_l2_pmu.c | 81 +++++++++++++++-----------------------
 drivers/perf/qcom_l3_pmu.c | 14 +++----
 2 files changed, 37 insertions(+), 58 deletions(-)

diff --git a/drivers/perf/qcom_l2_pmu.c b/drivers/perf/qcom_l2_pmu.c
index ea8c85729937..9c4e1d89718d 100644
--- a/drivers/perf/qcom_l2_pmu.c
+++ b/drivers/perf/qcom_l2_pmu.c
@@ -468,23 +468,6 @@ static int l2_cache_event_init(struct perf_event *event)
 		return -EINVAL;
 	}
 
-	/* Don't allow groups with mixed PMUs, except for s/w events */
-	if (event->group_leader->pmu != event->pmu &&
-	    !is_software_event(event->group_leader)) {
-		dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
-			 "Can't create mixed PMU group\n");
-		return -EINVAL;
-	}
-
-	for_each_sibling_event(sibling, event->group_leader) {
-		if (sibling->pmu != event->pmu &&
-		    !is_software_event(sibling)) {
-			dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
-				 "Can't create mixed PMU group\n");
-			return -EINVAL;
-		}
-	}
-
 	cluster = get_cluster_pmu(l2cache_pmu, event->cpu);
 	if (!cluster) {
 		/* CPU has not been initialised */
@@ -493,39 +476,6 @@ static int l2_cache_event_init(struct perf_event *event)
 		return -EINVAL;
 	}
 
-	/* Ensure all events in a group are on the same cpu */
-	if ((event->group_leader != event) &&
-	    (cluster->on_cpu != event->group_leader->cpu)) {
-		dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
-			 "Can't create group on CPUs %d and %d",
-			 event->cpu, event->group_leader->cpu);
-		return -EINVAL;
-	}
-
-	if ((event != event->group_leader) &&
-	    !is_software_event(event->group_leader) &&
-	    (L2_EVT_GROUP(event->group_leader->attr.config) ==
-	     L2_EVT_GROUP(event->attr.config))) {
-		dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
-			 "Column exclusion: conflicting events %llx %llx\n",
-		       event->group_leader->attr.config,
-		       event->attr.config);
-		return -EINVAL;
-	}
-
-	for_each_sibling_event(sibling, event->group_leader) {
-		if ((sibling != event) &&
-		    !is_software_event(sibling) &&
-		    (L2_EVT_GROUP(sibling->attr.config) ==
-		     L2_EVT_GROUP(event->attr.config))) {
-			dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
-			     "Column exclusion: conflicting events %llx %llx\n",
-					    sibling->attr.config,
-					    event->attr.config);
-			return -EINVAL;
-		}
-	}
-
 	hwc->idx = -1;
 	hwc->config_base = event->attr.config;
 
@@ -534,6 +484,37 @@ static int l2_cache_event_init(struct perf_event *event)
 	 * same cpu context, to avoid races on pmu_enable etc.
 	 */
 	event->cpu = cluster->on_cpu;
+	if (event->cpu != event->group_leader->cpu) {
+		dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
+			 "Can't create group on CPUs %d and %d",
+			 event->cpu, event->group_leader->cpu);
+		return -EINVAL;
+	}
+
+	if (event == event->group_leader)
+		return 0;
+
+	if ((event->group_leader->pmu == event->pmu) &&
+	    (L2_EVT_GROUP(event->group_leader->attr.config) ==
+	     L2_EVT_GROUP(event->attr.config))) {
+		dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
+			 "Column exclusion: conflicting events %llx %llx\n",
+		       event->group_leader->attr.config,
+		       event->attr.config);
+		return -EINVAL;
+	}
+
+	for_each_sibling_event(sibling, event->group_leader) {
+		if ((sibling->pmu == event->pmu) &&
+		    (L2_EVT_GROUP(sibling->attr.config) ==
+		     L2_EVT_GROUP(event->attr.config))) {
+			dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
+			     "Column exclusion: conflicting events %llx %llx\n",
+					    sibling->attr.config,
+					    event->attr.config);
+			return -EINVAL;
+		}
+	}
 
 	return 0;
 }
diff --git a/drivers/perf/qcom_l3_pmu.c b/drivers/perf/qcom_l3_pmu.c
index 66e6cabd6fff..f0cf6c33418d 100644
--- a/drivers/perf/qcom_l3_pmu.c
+++ b/drivers/perf/qcom_l3_pmu.c
@@ -454,18 +454,16 @@ static bool qcom_l3_cache__validate_event_group(struct perf_event *event)
 	struct perf_event *sibling;
 	int counters = 0;
 
-	if (leader->pmu != event->pmu && !is_software_event(leader))
-		return false;
+	if (leader == event)
+		return true;
 
 	counters = event_num_counters(event);
-	counters += event_num_counters(leader);
+	if (leader->pmu == event->pmu)
+		counters += event_num_counters(leader);
 
 	for_each_sibling_event(sibling, leader) {
-		if (is_software_event(sibling))
-			continue;
-		if (sibling->pmu != event->pmu)
-			return false;
-		counters += event_num_counters(sibling);
+		if (sibling->pmu == event->pmu)
+			counters += event_num_counters(sibling);
 	}
 
 	/*
-- 
2.39.2.101.g768bb238c484.dirty


