Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037C1C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 00:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMUWndPg8KLSrJkc2QD+zMzpINY+ihCaeX6QA+EG4HA=; b=nXrue14pvN/6eWHqqJjEAjjbx9
	if2SQft7hDpHbN2eMi3NRUgyTXqtJ6QrQh6Ducd7Qj5ZOtjW+eIHtFSpQk7Oh/WWXm7VKGnPhQAjb
	HAFsH0v6e1N5McN8U6/7ojirkvIHD77BUwAZDXRhOBZqybmOwaophohNNSNpb4wJ7/xaNb2xNZGhw
	SLHuEUHnFG+fQIzdEBBg+wo9bTrDHRhGQ9RKvXCb/DE6f+mKnoDVBHOPfp88HosjNGQ5p6jNVcIBF
	GSwnSoPFCz9BEd2WMdFk6IR3p8FLnkW3MDVXRTLgRBxsd1talJCrByABQpKDCCOdZUW/1flJrUz5j
	6nR4+bLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tekhe-0000000EMW5-1kxK;
	Mon, 03 Feb 2025 00:52:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tekYh-0000000ELLx-0UdT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 00:43:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B68015C6181;
	Mon,  3 Feb 2025 00:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A7EC4CED2;
	Mon,  3 Feb 2025 00:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738543406;
	bh=za8iN40FQDk2pmfaRnhlPlw8DceIe2LhWYenqsGL+wo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H3hGoIBBMzDCLW7E18zVmykhF6bZl5dP7Lo1l11EQM6X8XzW3d+RGXBgvEM0X++OE
	 NRG4/9SWnLw9YTfC0lUdqxFuB+6RycR9I6dH0XKkf05YlIESfquaW0CnkEjF5HVLXm
	 BSMilz5mRmrzr8JSPmulK868+aysAY2jx6V/r7kTE9zzrlOBKMe0UNfDfnRDfBLzWY
	 xRMLj7fM2o/CNrDIvzUDoldks3Oo1GD0tX+qAd5z+G4acvN1FrXrhLL8+8j1Hj0kj2
	 fc/AS886T7T8luDUYmI3AlaJbTVm5tYS7CfKXPRhFDy54B2pwcIyyY8F0mCUkUGQje
	 fb+r3+uE9CKtg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Sun, 02 Feb 2025 18:43:00 -0600
Subject: [PATCH v19 06/11] perf: apple_m1: Don't disable counter in
 m1_pmu_enable_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-arm-brbe-v19-v19-6-1c1300802385@kernel.org>
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
X-CRM114-CacheID: sfid-20250202_164327_204367_3CBB9A27 
X-CRM114-Status: UNSURE (   9.97  )
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
index 06fd317529fc..39349ecec3c1 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -396,10 +396,6 @@ static void m1_pmu_enable_event(struct perf_event *event)
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
2.47.2


