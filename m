Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA40CCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8/JbHVO15yx7cykhqtVE5HcukYsP3H0m5cpQMtY1cY=; b=lCqeOL3CR1hafBSYQ1vLaF3Qux
	FPQ9OrodbHMd1r8zzcq2VYTsaf5zTiqlRRo4VuXs2ObwhB0085ZYLBZPkWSKEkX507UU7Aw0sFkMY
	frRcZlXbEM7A1IXAytjQnAD2100HOEKT6id6ephizqb7hyNq2/R8Zm3bezZhQORmxPD8nPM92x2eB
	y2h8Sy8xFJlKwXr5xmcBD5R8FGln0iP+5vxlUpfSF3PEikQOwmI2P9P6B+JDdsSMUUyTgkmWtcISl
	3abAt/BWrEnozXzDiII0+Xc0uQYRn5eraw0DsR3L5u++UdmnlvO1TgOQ9K4rbA2PktdW+MIk2kteE
	ERtdggnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHNo-0000000EoH9-40Em;
	Wed, 13 Aug 2025 19:43:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEr9-0000000EVTy-2kgb;
	Wed, 13 Aug 2025 17:01:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17EBF1BF3;
	Wed, 13 Aug 2025 10:01:35 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 002723F738;
	Wed, 13 Aug 2025 10:01:38 -0700 (PDT)
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
Subject: [PATCH 04/19] perf/starfive: Fix group validation
Date: Wed, 13 Aug 2025 18:00:56 +0100
Message-Id: <6b9c9cf887c102c9154a1f28aea643a66787858f.1755096883.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1755096883.git.robin.murphy@arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_100143_745001_D03EE625 
X-CRM114-Status: GOOD (  10.68  )
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

The group validation code here is superficially the right shape, but
is failing to count the group leader, while also erroneously counting
software siblings. Just correctly count the events which belong to our
PMU, and let perf core worry about the rest.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/starfive_starlink_pmu.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/perf/starfive_starlink_pmu.c b/drivers/perf/starfive_starlink_pmu.c
index 5e5a672b4229..e185f307e639 100644
--- a/drivers/perf/starfive_starlink_pmu.c
+++ b/drivers/perf/starfive_starlink_pmu.c
@@ -347,19 +347,15 @@ static bool starlink_pmu_validate_event_group(struct perf_event *event)
 	struct perf_event *sibling;
 	int counter = 1;
 
-	/*
-	 * Ensure hardware events in the group are on the same PMU,
-	 * software events are acceptable.
-	 */
-	if (event->group_leader->pmu != event->pmu &&
-	    !is_software_event(event->group_leader))
-		return false;
+	if (leader == event)
+		return true;
+
+	if (leader->pmu == event->pmu)
+		counter++;
 
 	for_each_sibling_event(sibling, leader) {
-		if (sibling->pmu != event->pmu && !is_software_event(sibling))
-			return false;
-
-		counter++;
+		if (sibling->pmu == event->pmu)
+			counter++;
 	}
 
 	return counter <= STARLINK_PMU_NUM_COUNTERS;
-- 
2.39.2.101.g768bb238c484.dirty


