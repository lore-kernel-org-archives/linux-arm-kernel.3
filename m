Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723A9C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 18:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sf6sBMMAV5XjKoDS/ngB0As3YdpZ4fzfIUulH+JWe4I=; b=GvOccVV+82nZsS/2/GYSyNaZud
	Ri5YNrsmn+Z37jDj6Y0qW00S1kxcdFG7Sm5bisDfSDeYzqS90A+Z3wk8kRVSXgSUmnEcFFHtQZFjJ
	5osAgDzu+ZLp6cExKz8MQGzweaeAZoFNif7DO5fkHpCTX7UzXeBRJrB9SlvtNB5tbahy8gDs4NlTL
	RIBQEqVX5EEEA8yJIZbt4ubHqZ5qqvhIuMnAVO9fj3t728vgKFvQzXAu7SLGmDedvVfA9+Kj6LxTy
	cCCn4AyJkA5eGh9wI0quIoZYrxJR0l4l+YP146GkXdDUODaxGoaBzVvdmQu+bh7aXJNED3UlKY1uP
	11GJQF1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1Kx-0000000GI6A-3gkL;
	Mon, 03 Feb 2025 18:38:23 +0000
Received: from out-176.mta0.migadu.com ([91.218.175.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1ES-0000000GGjb-2zhf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 18:31:42 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738607493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sf6sBMMAV5XjKoDS/ngB0As3YdpZ4fzfIUulH+JWe4I=;
	b=svjl2qkNOXxx/ORuRlNmH1+hK72/bHVIzo5KboZBHF8OnpcNXt7NFJ0eQxA+u+YTDVo5n+
	RA7dJUgkWmIy3ZtCWhA1clKAjEYG684wATyovmhHkDl+8pC0LGR65BUJR4jdRLa6mprVAi
	3uO7IaBXWr6xqKLNgLDamGve0S/zQ9Q=
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
Subject: [PATCH v2 01/14] drivers/perf: apple_m1: Refactor event select/filter configuration
Date: Mon,  3 Feb 2025 10:30:58 -0800
Message-Id: <20250203183111.191519-2-oliver.upton@linux.dev>
In-Reply-To: <20250203183111.191519-1-oliver.upton@linux.dev>
References: <20250203183111.191519-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_103140_906005_D56E093E 
X-CRM114-Status: GOOD (  11.59  )
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

Supporting guest mode events will necessitate programming two event
filters. Prepare by splitting up the programming of the event selector +
event filter into separate headers.

Opportunistically replace RMW patterns with sysreg_clear_set_s().

Tested-by: Janne Grunau <j@jannau.net>
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/include/asm/apple_m1_pmu.h |  1 +
 drivers/perf/apple_m1_cpu_pmu.c       | 52 ++++++++++++++++-----------
 2 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/apple_m1_pmu.h b/arch/arm64/include/asm/apple_m1_pmu.h
index 99483b19b99f..02e05d05851f 100644
--- a/arch/arm64/include/asm/apple_m1_pmu.h
+++ b/arch/arm64/include/asm/apple_m1_pmu.h
@@ -37,6 +37,7 @@
 #define PMCR0_PMI_ENABLE_8_9	GENMASK(45, 44)
 
 #define SYS_IMP_APL_PMCR1_EL1	sys_reg(3, 1, 15, 1, 0)
+#define SYS_IMP_APL_PMCR1_EL12	sys_reg(3, 1, 15, 7, 2)
 #define PMCR1_COUNT_A64_EL0_0_7	GENMASK(15, 8)
 #define PMCR1_COUNT_A64_EL1_0_7	GENMASK(23, 16)
 #define PMCR1_COUNT_A64_EL0_8_9	GENMASK(41, 40)
diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 06fd317529fc..cea80afd1253 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -327,11 +327,10 @@ static void m1_pmu_disable_counter_interrupt(unsigned int index)
 	__m1_pmu_enable_counter_interrupt(index, false);
 }
 
-static void m1_pmu_configure_counter(unsigned int index, u8 event,
-				     bool user, bool kernel)
+static void __m1_pmu_configure_event_filter(unsigned int index, bool user,
+					    bool kernel)
 {
-	u64 val, user_bit, kernel_bit;
-	int shift;
+	u64 clear, set, user_bit, kernel_bit;
 
 	switch (index) {
 	case 0 ... 7:
@@ -346,19 +345,24 @@ static void m1_pmu_configure_counter(unsigned int index, u8 event,
 		BUG();
 	}
 
-	val = read_sysreg_s(SYS_IMP_APL_PMCR1_EL1);
-
+	clear = set = 0;
 	if (user)
-		val |= user_bit;
+		set |= user_bit;
 	else
-		val &= ~user_bit;
+		clear |= user_bit;
 
 	if (kernel)
-		val |= kernel_bit;
+		set |= kernel_bit;
 	else
-		val &= ~kernel_bit;
+		clear |= kernel_bit;
 
-	write_sysreg_s(val, SYS_IMP_APL_PMCR1_EL1);
+	sysreg_clear_set_s(SYS_IMP_APL_PMCR1_EL1, clear, set);
+}
+
+static void __m1_pmu_configure_eventsel(unsigned int index, u8 event)
+{
+	u64 clear = 0, set = 0;
+	int shift;
 
 	/*
 	 * Counters 0 and 1 have fixed events. For anything else,
@@ -371,21 +375,29 @@ static void m1_pmu_configure_counter(unsigned int index, u8 event,
 		break;
 	case 2 ... 5:
 		shift = (index - 2) * 8;
-		val = read_sysreg_s(SYS_IMP_APL_PMESR0_EL1);
-		val &= ~((u64)0xff << shift);
-		val |= (u64)event << shift;
-		write_sysreg_s(val, SYS_IMP_APL_PMESR0_EL1);
+		clear |= (u64)0xff << shift;
+		set |= (u64)event << shift;
+		sysreg_clear_set_s(SYS_IMP_APL_PMESR0_EL1, clear, set);
 		break;
 	case 6 ... 9:
 		shift = (index - 6) * 8;
-		val = read_sysreg_s(SYS_IMP_APL_PMESR1_EL1);
-		val &= ~((u64)0xff << shift);
-		val |= (u64)event << shift;
-		write_sysreg_s(val, SYS_IMP_APL_PMESR1_EL1);
+		clear |= (u64)0xff << shift;
+		set |= (u64)event << shift;
+		sysreg_clear_set_s(SYS_IMP_APL_PMESR1_EL1, clear, set);
 		break;
 	}
 }
 
+static void m1_pmu_configure_counter(unsigned int index, unsigned long config_base)
+{
+	bool kernel = config_base & M1_PMU_CFG_COUNT_KERNEL;
+	bool user = config_base & M1_PMU_CFG_COUNT_USER;
+	u8 evt = config_base & M1_PMU_CFG_EVENT;
+
+	__m1_pmu_configure_event_filter(index, user, kernel);
+	__m1_pmu_configure_eventsel(index, evt);
+}
+
 /* arm_pmu backend */
 static void m1_pmu_enable_event(struct perf_event *event)
 {
@@ -400,7 +412,7 @@ static void m1_pmu_enable_event(struct perf_event *event)
 	m1_pmu_disable_counter(event->hw.idx);
 	isb();
 
-	m1_pmu_configure_counter(event->hw.idx, evt, user, kernel);
+	m1_pmu_configure_counter(event->hw.idx, event->hw.config_base);
 	m1_pmu_enable_counter(event->hw.idx);
 	m1_pmu_enable_counter_interrupt(event->hw.idx);
 	isb();
-- 
2.39.5


