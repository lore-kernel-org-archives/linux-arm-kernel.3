Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD4BCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7ZCyuAbPC6KaoW+DrYKooiBi6+ixnVwcKtXdep92Ts=; b=XYlRIBmmIwcjF3rZrk4pN6+gpN
	Njcb/+3rjMwHP2qHyos2QsOS/pM1Z7UFjjjahERzN2+jLzMqObsKkok+kJt8Z78JecKc6DtJDVRGQ
	hbPMVoG5M6OALFmVwmVC8e7xEDrLFzqM/Xc4h+En0qD/I9/Nccpq7o0eJX87wU57QSm+WR6Phu+N/
	ceUl8aIFz0K0g7BPlg3U8VT2/t7L5+8dWdoYWiYVR+pnsDrEs1boRsbwHKB6oMraUUXQdhMM4oXZ/
	MhjG9uj9yaqClZ9JZQ14nWZTOeLBC60jjGIfSlwMkOZc80P1if0FSCOulbjhjIDJhc5VYSTeSO3W9
	V71vic0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHNy-0000000EoNi-1LE0;
	Wed, 13 Aug 2025 19:43:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umErN-0000000EVdv-1T8Q;
	Wed, 13 Aug 2025 17:01:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7DB41C14;
	Wed, 13 Aug 2025 10:01:48 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F4993F738;
	Wed, 13 Aug 2025 10:01:52 -0700 (PDT)
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
Subject: [PATCH 07/19] ARM: imx: Fix MMDC PMU group validation
Date: Wed, 13 Aug 2025 18:00:59 +0100
Message-Id: <12766b2e16939ed97df8c410a994c730bede8298.1755096883.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1755096883.git.robin.murphy@arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_100157_421650_8EA16CF6 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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

The group validation here gets the event and its group leader mixed up,
such that if the group leader belongs to a different PMU, the set_bit()
may go wildly out of bounds. While we fix that, also adopt the standard
pattern to avoid racy access the sibling list and drop checks that are
redundant with core code.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm/mach-imx/mmdc.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-imx/mmdc.c b/arch/arm/mach-imx/mmdc.c
index 94e4f4a2f73f..f9d432b385a2 100644
--- a/arch/arm/mach-imx/mmdc.c
+++ b/arch/arm/mach-imx/mmdc.c
@@ -238,11 +238,8 @@ static bool mmdc_pmu_group_event_is_valid(struct perf_event *event,
 {
 	int cfg = event->attr.config;
 
-	if (is_software_event(event))
-		return true;
-
 	if (event->pmu != pmu)
-		return false;
+		return true;
 
 	return !test_and_set_bit(cfg, used_counters);
 }
@@ -260,12 +257,12 @@ static bool mmdc_pmu_group_is_valid(struct perf_event *event)
 	struct perf_event *sibling;
 	unsigned long counter_mask = 0;
 
-	set_bit(leader->attr.config, &counter_mask);
+	if (event == leader)
+		return true;
 
-	if (event != leader) {
-		if (!mmdc_pmu_group_event_is_valid(event, pmu, &counter_mask))
-			return false;
-	}
+	set_bit(event->attr.config, &counter_mask);
+	if (!mmdc_pmu_group_event_is_valid(leader, pmu, &counter_mask))
+		return false;
 
 	for_each_sibling_event(sibling, leader) {
 		if (!mmdc_pmu_group_event_is_valid(sibling, pmu, &counter_mask))
-- 
2.39.2.101.g768bb238c484.dirty


