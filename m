Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22371CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4LAZWLbzSC6po+MQTLjsFFRxaZ1h7K5WpCihesgYxw=; b=1gAMZjQG++OsDZDKxibEMECaBX
	Xiv1i9WUOPw7S610tkZRY9Vh8/IRvc9SzJtIGJoY143D3E5IDhFAZOUlJh4NShjVSyiXeuL26/thF
	AOo4KJirLCqxzSch/0paRYWnW0YLLAgV9r1JgOK5HwK9bLVIwr3i13lifrfLliz795pPUoefb/a+b
	7FgjupwP4mwol5yWLoWnWcjGqB4Qt4j4K1fteDDRIlOw0Qa/0n8RCNOO5W2/P/rOoUtY8tkGUeIHx
	qBE0n9ORnQ8koy99B7oQhC26eCPSMYl2BUXxk9OxF8lwyuCVYq3P30tzo/AMkUIp64+yxsuWW4xgx
	OH/TaKYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUlB-00000005nKm-0pQ8;
	Mon, 10 Nov 2025 16:28:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUl6-00000005nGo-289O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:28:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 214A32F;
	Mon, 10 Nov 2025 08:28:37 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B271A3F66E;
	Mon, 10 Nov 2025 08:28:43 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 10 Nov 2025 16:28:31 +0000
Subject: [PATCH v2 1/2] perf: arm_spe: Correct setting the PERF_HES_STOPPED
 flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-arm_spe_fix_truncated_flag-v2-1-a629740985cc@arm.com>
References: <20251110-arm_spe_fix_truncated_flag-v2-0-a629740985cc@arm.com>
In-Reply-To: <20251110-arm_spe_fix_truncated_flag-v2-0-a629740985cc@arm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792122; l=1937;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=8UdIi+vekhUmBUYHnTWZHzY9nrwSvSb76pHrnU/+RmE=;
 b=lB5mNzWEC2PrAQOxpWQ1p1l+2TaiTL4ViYONCUsNXp36RWaHBusoUJ5G2rM483wtrZUiI/Rn1
 /7utNQOolWPBqGkGc7FrkZCQILQHDk950A36mpGxfRWLvyRaJtyNv3g
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_082848_587482_7BC68B50 
X-CRM114-Status: GOOD (  12.44  )
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

In arm_spe_perf_aux_output_begin(), if the calculation of limit fails
and arm_spe_pmu_next_off() returns zero, the driver misses to set the
PERF_HES_STOPPED flag for the event.  As a result, hwc->state does not
reflect the latest state, which can mislead subsequent operations.

Validate the limit when exiting the function: if the limit is 0,
that tracing is disabled, set the PERF_HES_STOPPED flag accordingly.

Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/perf/arm_spe_pmu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index fa50645feddadbea5dc1e404f80f62cf5aa96fd4..fc8f908c2c3a270f2d1ae574c2badb1fbcf51484 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -597,7 +597,6 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
 	/* Start a new aux session */
 	buf = perf_aux_output_begin(handle, event);
 	if (!buf) {
-		event->hw.state |= PERF_HES_STOPPED;
 		/*
 		 * We still need to clear the limit pointer, since the
 		 * profiler might only be disabled by virtue of a fault.
@@ -608,15 +607,19 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
 
 	limit = buf->snapshot ? arm_spe_pmu_next_snapshot_off(handle)
 			      : arm_spe_pmu_next_off(handle);
-	if (limit)
-		limit |= PMBLIMITR_EL1_E;
+	if (!limit)
+		goto out_write_limit;
 
 	limit += (u64)buf->base;
+	limit |= PMBLIMITR_EL1_E;
 	base = (u64)buf->base + PERF_IDX2OFF(handle->head, buf);
 	write_sysreg_s(base, SYS_PMBPTR_EL1);
 
 out_write_limit:
 	write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
+
+	if (!limit)
+		event->hw.state |= PERF_HES_STOPPED;
 }
 
 static void arm_spe_perf_aux_output_end(struct perf_output_handle *handle)

-- 
2.34.1


