Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04911CA0EE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jiRkyMGNQe8ri4us5YwuHaYzp7gBwG5DOl+ObHonGLo=; b=mbakq6wbf0WSG+Bd+HQREQ5Euo
	LUGpUMxv9Wzteg+56yuPqXGOWjeRFLq1yI19g3QbI/JJjWAG1AIG5LRQcVmk3dHVgCSwvCpHXwI/D
	C6npviRKI52HSCO65FfPTer5jeTaq13QvVlYiQzfIG96C0tpurDMF0yWjsH1b+UROvk2m9lBkvOBP
	BlQ2/sZy+BGhn/sMk78EG3inN5k3Ud5V3vJBwMaRnqHElsIGJWBksSQQbcRcMQFxXJTXzhhq3hMQk
	LJbSbZKxCsbOFjdJdiz5FRGieMg6uwOK/PtQLI7DwoYpSQhvKZ9S7SD7C79U9jvvfbK1zPdwpBuEa
	4znqQCSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHNt-0000000EoHz-1OV9;
	Wed, 13 Aug 2025 19:43:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umErE-0000000EVXt-1XCU;
	Wed, 13 Aug 2025 17:01:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93BEC1C00;
	Wed, 13 Aug 2025 10:01:39 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7CB223F738;
	Wed, 13 Aug 2025 10:01:43 -0700 (PDT)
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
Subject: [PATCH 05/19] iommu/vt-d: Fix perfmon group validation
Date: Wed, 13 Aug 2025 18:00:57 +0100
Message-Id: <fcc4a9091ff02606df9495fd16b00094216a933e.1755096883.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1755096883.git.robin.murphy@arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_100148_461847_1629FC94 
X-CRM114-Status: GOOD (  13.28  )
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

The group validation here has a few issues to fix: firstly, failing to
count the group leader or the event being opened itself. Secondly it
appears wrong not to count disabled sibling events given that they could
be enabled later. Finally there's the subtlety that we should avoid racy
access to the sibling list when the event is its own group leader.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/intel/perfmon.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/intel/perfmon.c b/drivers/iommu/intel/perfmon.c
index 75f493bcb353..c3a1ac14cb2b 100644
--- a/drivers/iommu/intel/perfmon.c
+++ b/drivers/iommu/intel/perfmon.c
@@ -258,21 +258,25 @@ static int iommu_pmu_validate_group(struct perf_event *event)
 {
 	struct iommu_pmu *iommu_pmu = iommu_event_to_pmu(event);
 	struct perf_event *sibling;
-	int nr = 0;
+	int nr = 1;
 
+	if (event == event->group_leader)
+		return 0;
 	/*
 	 * All events in a group must be scheduled simultaneously.
 	 * Check whether there is enough counters for all the events.
 	 */
-	for_each_sibling_event(sibling, event->group_leader) {
-		if (!is_iommu_pmu_event(iommu_pmu, sibling) ||
-		    sibling->state <= PERF_EVENT_STATE_OFF)
-			continue;
+	if (is_iommu_pmu_event(iommu_pmu, event->group_leader))
+		++nr;
 
-		if (++nr > iommu_pmu->num_cntr)
-			return -EINVAL;
+	for_each_sibling_event(sibling, event->group_leader) {
+		if (is_iommu_pmu_event(iommu_pmu, sibling))
+			++nr;
 	}
 
+	if (nr > iommu_pmu->num_cntr)
+		return -EINVAL;
+
 	return 0;
 }
 
-- 
2.39.2.101.g768bb238c484.dirty


