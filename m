Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC48C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 00:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjubzt0LiiYrk/i706EX37Qgue++TvrGsqI7W/kqAX8=; b=nf+j1t5icFzSS20FmMezIUR+En
	cEPe0uj+Uvpip+dGELlGzw6ulrpVpiZgvejORp58rxdeqm9xIspozjfM8X2DgiNKHIKdr9j3sSA49
	6/jVCxOpMFI2gvu9mdNSt5BkHxjGl9yNaAwGJGZ3xyt+RhnlM7KBJIsKPw8HmnhSjNN9iIgMP2d1X
	6IGHcM8mH5x+/z5K38gp2Y1lTtq+CKnqjYZvEjmdWYUuxU9PQtWFZ0SjmDwWdmjTpk4nwXlFnLDTR
	xDGhu+j10cSZkO0e5w3wfWJAsE2MXaHcxnxObthnRHeQShCRzb4JVXy+o1jXJiU0M14bqrBF19YQR
	hv4qMEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tekf5-0000000EMKa-0j75;
	Mon, 03 Feb 2025 00:50:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tekYe-0000000ELKx-3M8t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 00:43:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B4205C6196;
	Mon,  3 Feb 2025 00:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492B8C4CED1;
	Mon,  3 Feb 2025 00:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738543403;
	bh=AQfzCdl+Y2ebwtEy1FgqsCEm4CfIqqfCEkVfzalKseU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TiAJDCaGoVTJdlcRlCTS2l6+fxg1tdIez8UfzZTXeZ+aBKb7IbD6gpJgnSUpWX7Wv
	 eIvOVTiwJ/CxxXTjcR+BZZohbMhbiWzwFqLt0FnCWbTHVP+j3b1Xz3m2urdH7Ak0NC
	 IhBEv7DTJlWIXNql43ujxD5hgvkhNEcKMmofLvvb1Thfy1+8SG0LkSyVNTATx0lEoS
	 i/l4WkDE9Xfy9lCDFMaZ5EvJKpsF93PE+R38PBdOtE7xEywfzq4xX+/alZZSupuoJx
	 gDOdifFIxFtjeidWqTuRDIOS2w+TtQQtUxLvdD7YQrIy01MBJdEiH8J4Ti6M8zVOk+
	 L+1lyNQPNK5VA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Sun, 02 Feb 2025 18:42:58 -0600
Subject: [PATCH v19 04/11] perf: arm_v7_pmu: Drop obvious comments for
 enabling/disabling counters and interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-arm-brbe-v19-v19-4-1c1300802385@kernel.org>
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
In-Reply-To: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_164324_924549_D2C264DE 
X-CRM114-Status: GOOD (  10.69  )
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

The function calls for enabling/disabling counters and interrupts are
pretty obvious as to what they are doing, and the comments don't add
any additional value.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/perf/arm_v7_pmu.c | 44 --------------------------------------------
 1 file changed, 44 deletions(-)

diff --git a/drivers/perf/arm_v7_pmu.c b/drivers/perf/arm_v7_pmu.c
index 420cadd108e7..7fa88e3b64e0 100644
--- a/drivers/perf/arm_v7_pmu.c
+++ b/drivers/perf/arm_v7_pmu.c
@@ -857,14 +857,6 @@ static void armv7pmu_enable_event(struct perf_event *event)
 		return;
 	}
 
-	/*
-	 * Enable counter and interrupt, and set the counter to count
-	 * the event that we're interested in.
-	 */
-
-	/*
-	 * Disable counter
-	 */
 	armv7_pmnc_disable_counter(idx);
 
 	/*
@@ -875,14 +867,7 @@ static void armv7pmu_enable_event(struct perf_event *event)
 	if (cpu_pmu->set_event_filter || idx != ARMV7_IDX_CYCLE_COUNTER)
 		armv7_pmnc_write_evtsel(idx, hwc->config_base);
 
-	/*
-	 * Enable interrupt for this counter
-	 */
 	armv7_pmnc_enable_intens(idx);
-
-	/*
-	 * Enable counter
-	 */
 	armv7_pmnc_enable_counter(idx);
 }
 
@@ -898,18 +883,7 @@ static void armv7pmu_disable_event(struct perf_event *event)
 		return;
 	}
 
-	/*
-	 * Disable counter and interrupt
-	 */
-
-	/*
-	 * Disable counter
-	 */
 	armv7_pmnc_disable_counter(idx);
-
-	/*
-	 * Disable interrupt for this counter
-	 */
 	armv7_pmnc_disable_intens(idx);
 }
 
@@ -1476,12 +1450,6 @@ static void krait_pmu_enable_event(struct perf_event *event)
 	struct hw_perf_event *hwc = &event->hw;
 	int idx = hwc->idx;
 
-	/*
-	 * Enable counter and interrupt, and set the counter to count
-	 * the event that we're interested in.
-	 */
-
-	/* Disable counter */
 	armv7_pmnc_disable_counter(idx);
 
 	/*
@@ -1494,10 +1462,7 @@ static void krait_pmu_enable_event(struct perf_event *event)
 	else
 		armv7_pmnc_write_evtsel(idx, hwc->config_base);
 
-	/* Enable interrupt for this counter */
 	armv7_pmnc_enable_intens(idx);
-
-	/* Enable counter */
 	armv7_pmnc_enable_counter(idx);
 }
 
@@ -1797,12 +1762,6 @@ static void scorpion_pmu_enable_event(struct perf_event *event)
 	struct hw_perf_event *hwc = &event->hw;
 	int idx = hwc->idx;
 
-	/*
-	 * Enable counter and interrupt, and set the counter to count
-	 * the event that we're interested in.
-	 */
-
-	/* Disable counter */
 	armv7_pmnc_disable_counter(idx);
 
 	/*
@@ -1815,10 +1774,7 @@ static void scorpion_pmu_enable_event(struct perf_event *event)
 	else if (idx != ARMV7_IDX_CYCLE_COUNTER)
 		armv7_pmnc_write_evtsel(idx, hwc->config_base);
 
-	/* Enable interrupt for this counter */
 	armv7_pmnc_enable_intens(idx);
-
-	/* Enable counter */
 	armv7_pmnc_enable_counter(idx);
 }
 

-- 
2.47.2


