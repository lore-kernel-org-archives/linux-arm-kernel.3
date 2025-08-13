Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F680C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1fPRqYnV6aR5TuB9Je51zw0t5F0DkBhJ3b+qU0qgjg=; b=40uAogkD/BdckvUFzrsIPHFBJR
	0KRHVlwTEILsD3RYDaNiiK9Dt+cYazCHpYT+X74TBiEySqyiAKLFsqQE41An2NZF3b2RUacJeHEq2
	WSwafupByV4q9pFV0dCq2qPW/9IkmOe04sSA2Lkn4kQSomddIXfWrmMh1H3i3eNItIs3ADZp782dU
	NyemTEP3lh04h+krYuxBttiaOSXcXxMWtTRB1D/xPXYFiEKanHX4PDsWFPdyysXcxevr5BZlCaslA
	c2jL06oKqPQTq4kfN3+tTMQZ7CkpBUoSpfFtEEYgqVhYxcodBT4OhVgud7w/uYVHQchnkIN9MgrAI
	3ldRbGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHO7-0000000Eoax-1jJw;
	Wed, 13 Aug 2025 19:43:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umErb-0000000EVnr-0YPq;
	Wed, 13 Aug 2025 17:02:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AAD71CE2;
	Wed, 13 Aug 2025 10:02:02 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1F4713F738;
	Wed, 13 Aug 2025 10:02:06 -0700 (PDT)
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
Subject: [PATCH 10/19] perf/arm-ni: Improve event validation
Date: Wed, 13 Aug 2025 18:01:02 +0100
Message-Id: <b1cf78c0f67dda1069f5132db9093fe0dec4c66e.1755096883.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1755096883.git.robin.murphy@arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_100211_281607_011EEF61 
X-CRM114-Status: GOOD (  12.17  )
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

Although it is entirely benign for arm_ni_val_count_event() to count
any old hardware leader/sibling as an NI event (perf core will still
ultimately reject the cross-PMU group), it would still be nicer if it
didn't. Stop trying to special-case software events and simply skip any
event which doesn't belong to our PMU. Similarly drop the early return
paths since they can almost never actually return early.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-ni.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
index 1615a0564031..d6b683a0264e 100644
--- a/drivers/perf/arm-ni.c
+++ b/drivers/perf/arm-ni.c
@@ -271,40 +271,37 @@ static void arm_ni_pmu_disable(struct pmu *pmu)
 }
 
 struct arm_ni_val {
+	const struct pmu *pmu;
 	unsigned int evcnt;
 	unsigned int ccnt;
 };
 
-static bool arm_ni_val_count_event(struct perf_event *evt, struct arm_ni_val *val)
+static void arm_ni_val_count_event(struct perf_event *evt, struct arm_ni_val *val)
 {
-	if (is_software_event(evt))
-		return true;
-
-	if (NI_EVENT_TYPE(evt) == NI_PMU) {
-		val->ccnt++;
-		return val->ccnt <= 1;
+	if (evt->pmu == val->pmu) {
+		if (NI_EVENT_TYPE(evt) == NI_PMU)
+			val->ccnt++;
+		else
+			val->evcnt++;
 	}
-
-	val->evcnt++;
-	return val->evcnt <= NI_NUM_COUNTERS;
 }
 
 static int arm_ni_validate_group(struct perf_event *event)
 {
 	struct perf_event *sibling, *leader = event->group_leader;
-	struct arm_ni_val val = { 0 };
+	struct arm_ni_val val = { .pmu = event->pmu };
 
 	if (leader == event)
 		return 0;
 
 	arm_ni_val_count_event(event, &val);
-	if (!arm_ni_val_count_event(leader, &val))
+	arm_ni_val_count_event(leader, &val);
+	for_each_sibling_event(sibling, leader)
+		arm_ni_val_count_event(sibling, &val);
+
+	if (val.evcnt > NI_NUM_COUNTERS || val.ccnt > 1)
 		return -EINVAL;
 
-	for_each_sibling_event(sibling, leader) {
-		if (!arm_ni_val_count_event(sibling, &val))
-			return -EINVAL;
-	}
 	return 0;
 }
 
-- 
2.39.2.101.g768bb238c484.dirty


