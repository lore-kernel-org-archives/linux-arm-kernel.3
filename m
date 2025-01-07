Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4890E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 18:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpeyMU9mAouF5+ieJTiBptIIVXGF1w1Vi2mtyhmI18k=; b=jCoyoAL06y8LrvBNQGXO1J6Kvi
	jut+NqdmsuTlFakyrblMx9RGzf9GYTkVZkpBwc73C/sieakIV9/Xx1OeDH/OUxA0GIoLKLTTdpzse
	rgCtseEh4CSiEMniNm2Ouo5PLzI0x+xzBZ3rkeOxqCLyzuK6ZI6okPnqKMZESFw2E2xb5n76/AWdm
	STuyr8T0jQqrzYVfDZz5tGf1Vjmu1f0W3IlLYdZ0/Q5j0LZrlUBI3YNeHwAkB01y4Yg/K4Tq+cTPB
	ZfWu5+9nUT0gfITAa/QmEi/Yf1Wzv2t96UeUrcIUR7MItMho/nSGALn3G8tQfkDYU/hvRG0ULsxQJ
	K9Dlv8og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDv4-00000005wz2-3r3N;
	Tue, 07 Jan 2025 18:03:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDq4-00000005vrW-34L7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 17:58:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 05F925C5B2D;
	Tue,  7 Jan 2025 17:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ACBAC4CEDD;
	Tue,  7 Jan 2025 17:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736272679;
	bh=5URfCVQGt60Qv1ThmRA61G0kbMgHGKkbCZK3fRVjnOE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u4HphdXBR2Mzj+zIheW5IIWU1w4wJRKDxGVN1uwPVnhqTxDRpe5YjGlD2kbHrEHX/
	 51rRMoL1aCAZ5161wFgienkS4EDoHF8CXym2AsA+3f71wrW3GC+/2jmqxy+KsZB5MB
	 K0kR69d0EqRhQTGX2NN3rcVhSWg7G8ogqOyxqZB1W9M7S7jHlEaO1IHm9yPYPIKDo3
	 P7QV+g1sW2yslRNcbna9sx2oEi3cCue1JATAAcBmeJx2dchtfYXAvQMkSFBqQKcyEi
	 OWoL7oAPJTSPAjaczkRRTKrEQggB9+fCXashmSyA9mLrACf2WfRltPCrEbb/EvWmsG
	 XskxjfiJpW9kg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 07 Jan 2025 11:57:21 -0600
Subject: [PATCH 3/7] perf: arm_pmuv3: Don't disable counter in
 armv8pmu_enable_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-pmu-cleanups-v1-v1-3-313951346a25@kernel.org>
References: <20250107-arm-pmu-cleanups-v1-v1-0-313951346a25@kernel.org>
In-Reply-To: <20250107-arm-pmu-cleanups-v1-v1-0-313951346a25@kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_095800_816467_015C8718 
X-CRM114-Status: GOOD (  11.21  )
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

From: Mark Rutland <mark.rutland@arm.com>

Currently armv8pmu_enable_event() starts by disabling the event counter
it has been asked to enable. This should not be necessary as the counter
(and the PMU as a whole) should not be active when
armv8pmu_enable_event() is called.

Remove the redundant call to armv8pmu_disable_event_counter(). At the
same time, remove the comment immeditately above as everything it says
is obvious from the function names below.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/perf/arm_pmuv3.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index dfef8d4669f58eb7f989a9582164b00a823ac60b..7a1056e1e686146c2c7b20f62d19d384f1ae422b 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -795,11 +795,6 @@ static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
 
 static void armv8pmu_enable_event(struct perf_event *event)
 {
-	/*
-	 * Enable counter and interrupt, and set the counter to count
-	 * the event that we're interested in.
-	 */
-	armv8pmu_disable_event_counter(event);
 	armv8pmu_write_event_type(event);
 	armv8pmu_enable_event_irq(event);
 	armv8pmu_enable_event_counter(event);

-- 
2.45.2


