Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25770E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 18:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4xMrJV0xDE8bH+rFgV2L3NCUSZODrvnlDr67+jwP50=; b=ROd0KSVeWeQAPvGLLNe7nqjStC
	dgG2pgg7m2H24ZgKNGCbaphNIzwRdtzo7FkC80a9jPaeewIh7TidBNTb12KSQDRUKm898EYPgVuUb
	0HfMoH1LHWja41bMCOuyTFtyJDn8CRDkRvBNwnIi5auZNGpKs+IYhLkcO95XoqzfzRpf3qbxhXylx
	wXXSmmVApg33Jtok8ZGA+nfHLDReP3CygCKhZIFM7L6dZ1SHCH90K5I2hgrhKF3+hlmTplQMCmZ6h
	B/4j5sW9HDc0hEpwcxTZoIxE8CC4LCU50weSRnK+WkOa2dHE+RVgdGXlJZZBoSSuRfjzQrYNk58g4
	3YQkGJlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDyb-00000005xWP-3WVr;
	Tue, 07 Jan 2025 18:06:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDq9-00000005vsn-1RvI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 17:58:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF6E75C5ACB;
	Tue,  7 Jan 2025 17:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7270EC4CED6;
	Tue,  7 Jan 2025 17:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736272684;
	bh=GB50mQ0xAwvXLDxGsfO9zTbH3wdQV2KxHTzCYS5KFS0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nloULJM8rOfQZkcs39y/l5GTiRGlytGoyivKtOSvBjTv6mKexBvm91vcKXoOGC9De
	 9BogOAa7HMa6PRFu0+LFO/eMIpRt4Zn5u+fbL7JVuxxzECZlO401iCyoN3YM/ychrH
	 ddhMOg9B/tK4EAoQpJhMVhR7M+UmhK7h6B+txwOnmUes+0JN8fTaAAp2segvbV03im
	 X6BFJvYQaasvdxlmYWff2B1qB2B63J26962+bGfdQcJoppnABGWfewZZ5pPCojpF5G
	 Krj++IQkwHz9o4JJWkHdPGeyvY0t/KzI2Ao9a+kyZng6QzAdy47s4QHAq3E1Gn6pmI
	 ftq4O6DHKln6A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 07 Jan 2025 11:57:24 -0600
Subject: [PATCH 6/7] perf: apple_m1: Don't disable counter in
 m1_pmu_enable_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-pmu-cleanups-v1-v1-6-313951346a25@kernel.org>
References: <20250107-arm-pmu-cleanups-v1-v1-0-313951346a25@kernel.org>
In-Reply-To: <20250107-arm-pmu-cleanups-v1-v1-0-313951346a25@kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_095805_428514_35F94D16 
X-CRM114-Status: UNSURE (   9.62  )
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

Currently m1_pmu_enable_event() starts by disabling the event counter
it has been asked to enable. This should not be necessary as the
counter (and the PMU as a whole) should not be active when
m1_pmu_enable_event() is called.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/perf/apple_m1_cpu_pmu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 1d4d01e1275e05c9dc656502d22de5bb2fc46b11..6a7071f0298d3d15f0c6f2fbc49789d669aa02e6 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -394,10 +394,6 @@ static void m1_pmu_enable_event(struct perf_event *event)
 	user = event->hw.config_base & M1_PMU_CFG_COUNT_USER;
 	kernel = event->hw.config_base & M1_PMU_CFG_COUNT_KERNEL;
 
-	m1_pmu_disable_counter_interrupt(event->hw.idx);
-	m1_pmu_disable_counter(event->hw.idx);
-	isb();
-
 	m1_pmu_configure_counter(event->hw.idx, evt, user, kernel);
 	m1_pmu_enable_counter(event->hw.idx);
 	m1_pmu_enable_counter_interrupt(event->hw.idx);

-- 
2.45.2


