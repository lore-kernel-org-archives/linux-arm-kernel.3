Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F6AC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 18:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVdhPRPhu/oRpEuf2KXzS/cqoEesNVF//Q5fOtfKKRU=; b=xCHdjKeYEf4J/oAJCb+D7TkbWt
	BD2v0aaqWa7hwPWt5ao/MMl8DtppjVc7gKpYTfr9iV83NrLSq7UrzN+zXy6VjAMDMQ9lnXULCQNWg
	vn1662yr9iNfct95BQjGv1DY2doKJFyq2NK2lZTVAROGkP3tbtelUscHZCcamh6Acn5TM7zm+Mtbt
	35CrU9WuxnSTj6S1tRpm6FIcTgyosp8+9RMwgqtEMl+L5tG61s8zvBA3Hb0sQe5mvWHOVCkcU7aIv
	n7ZVPUlTjulgSGsYZ28tXOXizD4to12asmwJ0rbJz30LJkw0Hr0SEvCJCZAqYGfZzXu5TEgXDusnU
	MAc2Cf3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1MG-0000000GIFI-2Ctx;
	Mon, 03 Feb 2025 18:39:44 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1EW-0000000GGlq-2kNY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 18:31:45 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738607501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HVdhPRPhu/oRpEuf2KXzS/cqoEesNVF//Q5fOtfKKRU=;
	b=OXs9h+CxohMA1hGtuk0TWjCwiDvzQLQdQEdksVxrQurPDD1Nh2a+w5HYxt/FzTeauxNXew
	049151b7alpgPMOmOIahGzTBdn7wkkvaUyqAtndsG44k+IzawmzGO9Mlh7mZ2RjYMOON1c
	MgcMZLlG4qI0shD4d4SpQdcd5eVEuNo=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>,
	Janne Grunau <j@jannau.net>
Subject: [PATCH v2 02/14] drivers/perf: apple_m1: Support host/guest event filtering
Date: Mon,  3 Feb 2025 10:30:59 -0800
Message-Id: <20250203183111.191519-3-oliver.upton@linux.dev>
In-Reply-To: <20250203183111.191519-1-oliver.upton@linux.dev>
References: <20250203183111.191519-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_103144_831155_4642E05D 
X-CRM114-Status: GOOD (  12.97  )
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

The PMU appears to have a separate register for filtering 'guest'
exception levels (i.e. EL1 and !ELIsInHost(EL0)) which has the same
layout as PMCR1_EL1. Conveniently, there exists a VHE register alias
(PMCR1_EL12) that can be used to configure it.

Support guest events by programming the EL12 register with the intended
guest kernel/userspace filters. Limit support for guest events to VHE
(i.e. kernel running at EL2), as it avoids involving KVM to context
switch PMU registers. VHE is the only supported mode on M* parts anyway,
so this isn't an actual feature limitation.

Tested-by: Janne Grunau <j@jannau.net>
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 drivers/perf/apple_m1_cpu_pmu.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index cea80afd1253..d6d4ff6da862 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -120,6 +120,8 @@ enum m1_pmu_events {
 	 */
 	M1_PMU_CFG_COUNT_USER					= BIT(8),
 	M1_PMU_CFG_COUNT_KERNEL					= BIT(9),
+	M1_PMU_CFG_COUNT_HOST					= BIT(10),
+	M1_PMU_CFG_COUNT_GUEST					= BIT(11),
 };
 
 /*
@@ -328,7 +330,7 @@ static void m1_pmu_disable_counter_interrupt(unsigned int index)
 }
 
 static void __m1_pmu_configure_event_filter(unsigned int index, bool user,
-					    bool kernel)
+					    bool kernel, bool host)
 {
 	u64 clear, set, user_bit, kernel_bit;
 
@@ -356,7 +358,10 @@ static void __m1_pmu_configure_event_filter(unsigned int index, bool user,
 	else
 		clear |= kernel_bit;
 
-	sysreg_clear_set_s(SYS_IMP_APL_PMCR1_EL1, clear, set);
+	if (host)
+		sysreg_clear_set_s(SYS_IMP_APL_PMCR1_EL1, clear, set);
+	else if (is_kernel_in_hyp_mode())
+		sysreg_clear_set_s(SYS_IMP_APL_PMCR1_EL12, clear, set);
 }
 
 static void __m1_pmu_configure_eventsel(unsigned int index, u8 event)
@@ -391,10 +396,13 @@ static void __m1_pmu_configure_eventsel(unsigned int index, u8 event)
 static void m1_pmu_configure_counter(unsigned int index, unsigned long config_base)
 {
 	bool kernel = config_base & M1_PMU_CFG_COUNT_KERNEL;
+	bool guest = config_base & M1_PMU_CFG_COUNT_GUEST;
+	bool host = config_base & M1_PMU_CFG_COUNT_HOST;
 	bool user = config_base & M1_PMU_CFG_COUNT_USER;
 	u8 evt = config_base & M1_PMU_CFG_EVENT;
 
-	__m1_pmu_configure_event_filter(index, user, kernel);
+	__m1_pmu_configure_event_filter(index, user && host, kernel && host, true);
+	__m1_pmu_configure_event_filter(index, user && guest, kernel && guest, false);
 	__m1_pmu_configure_eventsel(index, evt);
 }
 
@@ -570,7 +578,7 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 {
 	unsigned long config_base = 0;
 
-	if (!attr->exclude_guest) {
+	if (!attr->exclude_guest && !is_kernel_in_hyp_mode()) {
 		pr_debug("ARM performance counters do not support mode exclusion\n");
 		return -EOPNOTSUPP;
 	}
@@ -578,6 +586,10 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 		config_base |= M1_PMU_CFG_COUNT_KERNEL;
 	if (!attr->exclude_user)
 		config_base |= M1_PMU_CFG_COUNT_USER;
+	if (!attr->exclude_host)
+		config_base |= M1_PMU_CFG_COUNT_HOST;
+	if (!attr->exclude_guest)
+		config_base |= M1_PMU_CFG_COUNT_GUEST;
 
 	event->config_base = config_base;
 
-- 
2.39.5


