Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466D5C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 21:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g216UoIEiisjofR9TSoleYBcTy6x3fxgRf21CQwdNxo=; b=xOjLz0CTEln4UALz/aphkRjD6U
	jikUAFxUN/QBv2DcIxYS6KyTwtyhRaJ835yBvol/ZgwDwq6LYYXQp73uOiVgKVFJR1q+MZjixmYpX
	DR30g+uyPlV7xEUOH6NhaokvZn9sDfDNHOmd3nqUmxYIDpEt4uz8D1mGj8uLo2ojyNUr5IVI0Wcy8
	KRb6/x68HzO26yVnbUxEwIXaKX2xLgac70DgtiBSyTUeEA4siCUt7/HPTazl0Xrcq8QwHdBgA2Rc7
	x+h1imxo4D85RqBN062uRe2YgYftTQn78ezX1oXksJIIXpstOi9OGM1RblHnW7zszA22vXD5OIxNn
	t/WcPLqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUlu-00000009vLV-1vjk;
	Tue, 18 Feb 2025 21:04:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUOa-00000009ohI-1DPo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 20:40:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B8CE6A41898;
	Tue, 18 Feb 2025 20:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20DAAC4CEEB;
	Tue, 18 Feb 2025 20:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739911243;
	bh=0HI/XixRZkGw+9m3cuDiZCs1Y4vkExGOb34klMI4Tis=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uFFCuShQItWJZZbs/xnVI9pRAzaR+yWjzDpJLv/CP2mXqqPMmlbBIUttagyXoWTLA
	 0TVVP+vrcC1/vLJTdwXZo0RpQIOIEDzBklDDO8xkbN7/uwH5nnJRLOromFbNgsl/RR
	 zG6rDp8QIk3oCynaOjYLWNsSV0MLvk29683wfrT2WXT3ZPqDo9eaVF+f5XZIFE2qbF
	 myQgLBDaYcHgLGCt5XmiXePDmkWErABfbHdpI401Fv0CbGh6FQSSsdHT8MsgHQTy2G
	 HN8LUVqBoeXziArDVjkyfmxbmv5aPUO15kvp0k2wyKjM/HMBEk8Z+LH10Jw6OzEn7A
	 rle5XFY9+ukJg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 18 Feb 2025 14:40:01 -0600
Subject: [PATCH v20 06/11] perf: apple_m1: Don't disable counter in
 m1_pmu_enable_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-arm-brbe-v19-v20-6-4e9922fc2e8e@kernel.org>
References: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
In-Reply-To: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_124044_398415_8D0D706A 
X-CRM114-Status: UNSURE (   9.91  )
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
Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
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


