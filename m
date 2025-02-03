Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF071C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 00:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSGm8dGm8xNZZHzoGTfMzcP9QthlbcKpXlAmYuuQ58M=; b=G40eScLf8xrzzHENqLC6mo3dcu
	94PMoyPJHgrwlfzt5cxippw51ooMmoNSJnOIzxQUWa6KP3Apm38U7CYZ+5JQsfv1r2InNqdTh8dAZ
	nsDS5f9eyaWkMXExDIQouZ9s8rN2pIvKzyDazpLXrVGbgTphFkdT3LRoRApWO3i3y9yRe3a0WWa53
	pUUPg8R6MWGHpiDglnJNDrJzuT3HiqCV1yMO4flqfr4XoRu5zmo6Np46sBnSLkMeQfCgrSgF5QWKK
	FnKZs/gdtbSNioPclXk+1HwSBQCtlXLl/tjGTSRlHp8gjKdPISELz+stHusi1EgxPWX1YI1w9qEgX
	k5nY6WDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tekgM-0000000EMQK-3JLo;
	Mon, 03 Feb 2025 00:51:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tekYf-0000000ELLY-2xEb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 00:43:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 50F235C6210;
	Mon,  3 Feb 2025 00:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE324C4CEE3;
	Mon,  3 Feb 2025 00:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738543405;
	bh=HlJZ4X1QMrX/xJ0XjPX1zV2wX+vGp3xXOqm0TGuJopU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cPwVx/x7GuYkzvdEuyjaydOXSjWrwbwhgrGixTeEjUTqXZJb+otZxbgyud3yioHjc
	 2kwkTabYNQPy2afhrFVDaklbdRx8lkMTvQN3Q1xKZCqiB31O3PBGM+Y7uDcR69eK21
	 ELboOt8FXLdEDPHSAkf79OV63k+s/8cuTm2jueMRevdABKbO32M/S593yXIeXTJ+eb
	 rLDbD/Aug0boQA4+LuWMfk79IGZ4+1v1HGYqgMmjOx86cc5Ex3Av8MrvP2wpqhurGj
	 7H2TMOYkjacLRyAogUdGB2CA4WhjQOGDelUGj/O8a4wMA1nhV13vY9bHAje3LwgRHZ
	 eM+bdJHxSN/Bg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Sun, 02 Feb 2025 18:42:59 -0600
Subject: [PATCH v19 05/11] perf: arm_v7_pmu: Don't disable counter in
 (armv7|krait_|scorpion_)pmu_enable_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-arm-brbe-v19-v19-5-1c1300802385@kernel.org>
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
X-CRM114-CacheID: sfid-20250202_164325_789716_5239FAE8 
X-CRM114-Status: GOOD (  10.71  )
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

Currently (armv7|krait_|scorpion_)pmu_enable_event() start by disabling
the event counter it has been asked to enable. This should not be
necessary as the counter (and the PMU as a whole) should not be active
when *_enable_event() is called.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/perf/arm_v7_pmu.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/perf/arm_v7_pmu.c b/drivers/perf/arm_v7_pmu.c
index 7fa88e3b64e0..17831e1920bd 100644
--- a/drivers/perf/arm_v7_pmu.c
+++ b/drivers/perf/arm_v7_pmu.c
@@ -857,8 +857,6 @@ static void armv7pmu_enable_event(struct perf_event *event)
 		return;
 	}
 
-	armv7_pmnc_disable_counter(idx);
-
 	/*
 	 * Set event (if destined for PMNx counters)
 	 * We only need to set the event for the cycle counter if we
@@ -1450,8 +1448,6 @@ static void krait_pmu_enable_event(struct perf_event *event)
 	struct hw_perf_event *hwc = &event->hw;
 	int idx = hwc->idx;
 
-	armv7_pmnc_disable_counter(idx);
-
 	/*
 	 * Set event (if destined for PMNx counters)
 	 * We set the event for the cycle counter because we
@@ -1762,8 +1758,6 @@ static void scorpion_pmu_enable_event(struct perf_event *event)
 	struct hw_perf_event *hwc = &event->hw;
 	int idx = hwc->idx;
 
-	armv7_pmnc_disable_counter(idx);
-
 	/*
 	 * Set event (if destined for PMNx counters)
 	 * We don't set the event for the cycle counter because we

-- 
2.47.2


