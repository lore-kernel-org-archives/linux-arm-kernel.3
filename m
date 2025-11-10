Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741FCCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8B5CcBdi3zMQvooVQTKC9PmSvgkK3V4GqVxUfDMGnk=; b=m6kfpoO8P0T9ZbI0UCPoqOI/gD
	WBV6p+RuJni/55XE/opVidqeS5OkXFkY8KSup9WYPGhxrMVRDfEr9mDqCjdBXJNcWeE7kdzsI5eZp
	xelHDmZto1xFs4vQZr34f8yZh1qmU0eq2JL/2D3lTsZZX7C7zYHEmjDnqVT+toZ93gUDXL6Vo3Fyk
	XtmIWwqujyxkaC4p5AeeFfnq4KGI2uMaRmjUojdC06DXA6637bPY8raa79IokcZnGEhC+6rZiYWrO
	e4+rW0i0JhUMHU9L+RiWeftiDRkv2JP+mDX3NTrzL9K2MIpxa29QrKxkCy9y3OV1KaHO+V66Ug9qO
	4aRtAZ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUl7-00000005nIW-1ewU;
	Mon, 10 Nov 2025 16:28:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUl4-00000005nH7-2ZyC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:28:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 824C916A3;
	Mon, 10 Nov 2025 08:28:38 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F4523F66E;
	Mon, 10 Nov 2025 08:28:45 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 10 Nov 2025 16:28:32 +0000
Subject: [PATCH v2 2/2] perf: arm_spe: Ensure profiling buffer is properly
 disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-arm_spe_fix_truncated_flag-v2-2-a629740985cc@arm.com>
References: <20251110-arm_spe_fix_truncated_flag-v2-0-a629740985cc@arm.com>
In-Reply-To: <20251110-arm_spe_fix_truncated_flag-v2-0-a629740985cc@arm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792122; l=1864;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=l/aU0HZFwL9DexYyDyDNj/KW5vxEQESB+dU0Cog8fmY=;
 b=MFjvNr8klWeo7hLRbQ8b/v89thS4UmvzMhR8j8p+QGdvZ1ckEAuOLFlQn9yaHuEVzICSJEDs6
 ZeCAgwsGsq+DNw3B/BilBY0qtHm5KdabmEEFH9VkRxdRYTsRXTbrQr4
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_082846_691798_3467324E 
X-CRM114-Status: GOOD (  12.47  )
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

During interrupt handling, if arm_spe_perf_aux_output_begin() fails to
calculate a valid limit, it queues the disable callback in the IRQ work
and sets the PERF_HES_STOPPED flag.

Afterwards, the disable callback arm_spe_pmu_stop() is invoked, but
since the PERF_HES_STOPPED flag has already been set, arm_spe_pmu_stop()
exits immediately. As a result, the profiling buffer is not properly
stopped — profiling on exception levels is not disabled, and buffered
data is not drained.

To fix this, explicitly disable the profiling buffer for stopped events
in the interrupt handler.

Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/perf/arm_spe_pmu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index fc8f908c2c3a270f2d1ae574c2badb1fbcf51484..4f51510d5f8a660c12e3934eae8a66f1a1416617 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -761,6 +761,20 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
 		if (!(handle->aux_flags & PERF_AUX_FLAG_TRUNCATED)) {
 			arm_spe_perf_aux_output_begin(handle, event);
 			isb();
+
+			/*
+			 * A non-zero state indicates that an error occurred in
+			 * arm_spe_perf_aux_output_begin(), for example, if the
+			 * buffer overflowed and failed to get a valid limit.
+			 *
+			 * Since the PERF_HES_STOPPED flag has been set, the
+			 * afterwards disable callback exits immediately and
+			 * the buffer disable flow is skipped (see
+			 * arm_spe_pmu_stop()). Explicitly disable the profiling
+			 * buffer here.
+			 */
+			if (event->hw.state)
+				arm_spe_pmu_disable_and_drain_local();
 		}
 		break;
 	case SPE_PMU_BUF_FAULT_ACT_SPURIOUS:

-- 
2.34.1


