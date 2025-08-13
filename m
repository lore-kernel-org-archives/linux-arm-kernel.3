Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3333ACA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 18:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OtNOzTh64MmC/rI51h5ufDfuZnMgR3SAG018NNvubv8=; b=C+W8iURYOrzezzx/S5IBoxQnT+
	XovPjcc0GX1XnB82vYreYUnfxr8CVnHmxqOwhdlxbkL1ut08gVXRGX+L1iH70NOQ6tL/OIm/1HKXw
	nx3CUbYVRNlZzQKPYX2r8TfcDvk/k8F1moV+lfsaVMWu4QQMk7uRPzGOAMdJrWEEKNrVIsyF0hOvu
	WwFr4+WZE3QFAhKPM+k2a3v4u2+zQBnMdbkxbHt8Pjd4e7OAi/MuP5rhSSfH1yo4blRbOWvbq8YjA
	RTIiLdoUZxu0LH5t/sA/410ZcqJcKSBGlSgQSI+F1ledxBKb8VAqU/mpX+bJ9yNzUurvVXehf13Cv
	5D9wTOsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFrY-0000000Eez3-11yC;
	Wed, 13 Aug 2025 18:06:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEr0-0000000EVNA-35Zz;
	Wed, 13 Aug 2025 17:01:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 128701BCB;
	Wed, 13 Aug 2025 10:01:26 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EEB253F738;
	Wed, 13 Aug 2025 10:01:29 -0700 (PDT)
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
Subject: [PATCH 02/19] perf/hisilicon: Fix group validation
Date: Wed, 13 Aug 2025 18:00:54 +0100
Message-Id: <c7b877e66ba0d34d8558c5af8bbb620e8c0e47d9.1755096883.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1755096883.git.robin.murphy@arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_100134_869389_AFA9ABC8 
X-CRM114-Status: GOOD (  13.71  )
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

The group validation logic shared by the HiSilicon HNS3/PCIe drivers is
a bit off, in that given a software group leader, it will consider that
event *in place of* the actual new event being opened. At worst this
could theoretically allow an unschedulable group if the software event
config happens to look like one of the hardware siblings.

The uncore framework avoids that particular issue, but all 3 also share
the common issue of not preventing racy access to the sibling list, and
some redundant checks which can be cleaned up.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/hisilicon/hisi_pcie_pmu.c   | 17 ++++++-----------
 drivers/perf/hisilicon/hisi_uncore_pmu.c | 23 +++++++----------------
 drivers/perf/hisilicon/hns3_pmu.c        | 17 ++++++-----------
 3 files changed, 19 insertions(+), 38 deletions(-)

diff --git a/drivers/perf/hisilicon/hisi_pcie_pmu.c b/drivers/perf/hisilicon/hisi_pcie_pmu.c
index c5394d007b61..3b0b2f7197d0 100644
--- a/drivers/perf/hisilicon/hisi_pcie_pmu.c
+++ b/drivers/perf/hisilicon/hisi_pcie_pmu.c
@@ -338,21 +338,16 @@ static bool hisi_pcie_pmu_validate_event_group(struct perf_event *event)
 	int counters = 1;
 	int num;
 
-	event_group[0] = leader;
-	if (!is_software_event(leader)) {
-		if (leader->pmu != event->pmu)
-			return false;
+	if (leader == event)
+		return true;
 
-		if (leader != event && !hisi_pcie_pmu_cmp_event(leader, event))
-			event_group[counters++] = event;
-	}
+	event_group[0] = event;
+	if (leader->pmu == event->pmu && !hisi_pcie_pmu_cmp_event(leader, event))
+		event_group[counters++] = leader;
 
 	for_each_sibling_event(sibling, event->group_leader) {
-		if (is_software_event(sibling))
-			continue;
-
 		if (sibling->pmu != event->pmu)
-			return false;
+			continue;
 
 		for (num = 0; num < counters; num++) {
 			/*
diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
index a449651f79c9..3c531b36cf25 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
@@ -101,26 +101,17 @@ static bool hisi_validate_event_group(struct perf_event *event)
 	/* Include count for the event */
 	int counters = 1;
 
-	if (!is_software_event(leader)) {
-		/*
-		 * We must NOT create groups containing mixed PMUs, although
-		 * software events are acceptable
-		 */
-		if (leader->pmu != event->pmu)
-			return false;
+	if (leader == event)
+		return true;
 
-		/* Increment counter for the leader */
-		if (leader != event)
-			counters++;
-	}
+	/* Increment counter for the leader */
+	if (leader->pmu == event->pmu)
+		counters++;
 
 	for_each_sibling_event(sibling, event->group_leader) {
-		if (is_software_event(sibling))
-			continue;
-		if (sibling->pmu != event->pmu)
-			return false;
 		/* Increment counter for each sibling */
-		counters++;
+		if (sibling->pmu == event->pmu)
+			counters++;
 	}
 
 	/* The group can not count events more than the counters in the HW */
diff --git a/drivers/perf/hisilicon/hns3_pmu.c b/drivers/perf/hisilicon/hns3_pmu.c
index c157f3572cae..382e469257f9 100644
--- a/drivers/perf/hisilicon/hns3_pmu.c
+++ b/drivers/perf/hisilicon/hns3_pmu.c
@@ -1058,21 +1058,16 @@ static bool hns3_pmu_validate_event_group(struct perf_event *event)
 	int counters = 1;
 	int num;
 
-	event_group[0] = leader;
-	if (!is_software_event(leader)) {
-		if (leader->pmu != event->pmu)
-			return false;
+	if (leader == event)
+		return true;
 
-		if (leader != event && !hns3_pmu_cmp_event(leader, event))
-			event_group[counters++] = event;
-	}
+	event_group[0] = event;
+	if (leader->pmu == event->pmu && !hns3_pmu_cmp_event(leader, event))
+		event_group[counters++] = leader;
 
 	for_each_sibling_event(sibling, event->group_leader) {
-		if (is_software_event(sibling))
-			continue;
-
 		if (sibling->pmu != event->pmu)
-			return false;
+			continue;
 
 		for (num = 0; num < counters; num++) {
 			/*
-- 
2.39.2.101.g768bb238c484.dirty


