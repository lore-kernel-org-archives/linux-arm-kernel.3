Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B9FC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 14:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HfG0x4eKTu65ucAx3SNv7y6476H+fkKTI8A1VI3a9Q=; b=zddqkYZtouMkc9acH0j3jVlUSs
	j8Fduc/ZVjFL0aUeIXtLRxByqpxnZgP1Z4EX0mP/t0c5JQC7gwdo3eE04XJDZ86bVEMJZC4FC6M63
	cZp2XO/Cpkcn6NLRU2oSAW1l5FnbkNuRM0w52ZDyfHxuYJ+O2NzaNafb0kjdcIO76fuIsuA/zq5Ip
	tefYT/h21Wj+Tjk5jYIalcu+vvNKMjUmLUrfJFTgmCoh7Xi0yFoahC72muwVBkshkyg9c+41aSMit
	rKRQlqTA4KQfHvCaod/hckVzOHWIN7ia/oqOJZ3vyazn3479iY38w3YrQccYhX38uDBtDW7/sBuge
	XJ5odG/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTxc-000000086uO-2vFh;
	Mon, 11 Aug 2025 14:57:16 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulT00-00000007u1E-2FEf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:55:41 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-32128c5fc44so3455693a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920540; x=1755525340; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6HfG0x4eKTu65ucAx3SNv7y6476H+fkKTI8A1VI3a9Q=;
        b=YVKETNrx+KIWArUn0mM4wMBFYBQLIFrg3eqj0ygN/Nz948KzzvEUkeiyuRTrCyLeIM
         +X6IYQ9r3KQkIi7c3iVM/klUu8d5fT/3s+7G7BzM+dy+SqfU3KZxEgR28y/D88h797+4
         2KxJ2vC5RR0SxTc7Ab9e0sgTyC2RtsmZXwbZKnfKI5BfO9lBlg5dRGJIc5Vcll15Rt5O
         36EKsfRNzXIMOSQJ6bpI5OUzkvXqsG0GU+Psyc1MYtn9KMb+d6Sxo2CwRS9i1IyS33jQ
         9kAPLXUy8Uano5YUVVii3bABrv21cVciP53SxPGJLzR4IVJMul47McSAGNRw4UaQYJv7
         4/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920540; x=1755525340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HfG0x4eKTu65ucAx3SNv7y6476H+fkKTI8A1VI3a9Q=;
        b=q44z1deGWkNk51VVpYlg7kSIqzcAjir39L0xpOiKhAyypVEtZmknh3hb1DnHLYSwcT
         xPm7k5SulG+OEyYG9rSDCzi/LgNRANVmM7CwOGqawJofYUa49jddTsF7e+CYTA0Z/cfC
         tNaYVF8LHTWzFc856dx8djG3CJsTBA3KxstPoef4yRLPtIYfSiEeJi039iaO2orMZ8Uv
         OXh3AanO9kGcLeHjFYSWn1NNOw7/TnK0pJ4RG/Xm7mIv63/lFs98yYi8yQJwhJhU2XPw
         0qs26W+bjrgBOa+VNLsSnlCf9gfRej4ulWcZbRocu7h0L3u6kZsGLV36XtDDToh0QxEK
         R17A==
X-Forwarded-Encrypted: i=1; AJvYcCXLtAlB4lvbT/GxaWCiR6SkMYPA69AZ9jgiVZCxm+PJ0DzXL4R/l7xcIxW8fuoKzyaoVpDugOYQJQz3pngiFlJ6@lists.infradead.org
X-Gm-Message-State: AOJu0YyHm3NEr1jk7PAG4h6HiY3rkseNQXDn9JlXqP8F9vaU6F2CNeEb
	255oiYQ0wuThMuYFqV5UCYlMttvbT9/eNHtHC7t8XjeTN+2F/MUs9ljVt5F2sQ==
X-Gm-Gg: ASbGncuuNpBXfrNLGWykM7mWtfP+jt0HqDasoptRdlx51lGTnTceuMWAUT5wJ6KPzCG
	e0c78VYLbYVNN70Ez0KLWlHGyi99XXSea9ZAMMHH4XxhCckbg43km7bufVgbS2PntyW1+2YP3Il
	TpTjFjd/nzqIfFnFqo3iajQw3MLSanmyXwLX54DMApfgeiIvIDVvp563mVqTSU0LRcqFrbQuvx/
	GEZFmaHjsXYRldWxz/yvdp+730zb2PrUSONkLCHQMn38m1PwFwxAIwIgO6Gs55yopy3C7XP30Cj
	uTyXotWjr5NzNtFqyBsvPxH/WUCxqX0JTTGtzi1cqAx+KBEnBExIZsZK7veNPK8KGjbQZgc2k7f
	thDap2Hw5MAhBeQx9Q1n/MWaVT1keLITqCwgQVk/AWRbqaA4=
X-Google-Smtp-Source: AGHT+IFnVl8UL17RZBUa0BT0F/Rcmkalku9A4g8RHGTBDR8nQ5SSWKMfWiQxEunTch+bh2Al4PgqhQ==
X-Received: by 2002:a17:90b:2784:b0:315:9624:37db with SMTP id 98e67ed59e1d1-321843734ecmr16913945a91.3.1754920539694;
        Mon, 11 Aug 2025 06:55:39 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:55:39 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:36 +0800
Subject: [PATCH v8 04/21] drivers/perf: apple_m1: Support a
 per-implementation number of counters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-4-c560ebd9ca46@gmail.com>
References: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
In-Reply-To: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4845; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=QyfayPXBF0G8wGc13eGHybo/0TGaFMU6vqkkCqnR2wU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZB/jzaufq4SFk1QWLQjOeskxIK4AYQnfCzk
 syEmMG9sFKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QQAKCRABygi3psUI
 JJqLD/9LU2/IiF1sAyfa6B9PDwRmjRl8FIefRE3GDyob6PaDFikplWtJ3A5g+joTUCuAsjL9xof
 iS90qkQF1Vetl5TOX+qbG9OYuJi38KSoPvdOUTzxomPHTTrUSX70iMLozVc1EvUaqMDZL5ZtS8d
 gFKSNVewf/mvOQt68oix3jouYjll151v0TtvJ5ItPiGAPS1/a5Y9qgHNG/Ek/NlXJHnU+edFO5f
 XV2k2OZA5HIthSzBS617HUe2INnhXknobpRuSMFrVgb0wdsJlgse9kGdS6fQshmuPR1hEn0pXRA
 YuVfVwctdBf9xNPNaaPU7Jf0Gzn9qlaotZOS/UaJmUnyDz7GQOBz6WDdh3jVRZD9JBRCNL51Iz4
 10rkLdkxNKSxLSD6mnOKg3oFiYeTazkko9vVXOcsqRQ1z/5OW0Szf4Lyc7gGQypsQEZfc+RnQyC
 WB4TnQ3ArKQ1MZDwVUDYxe+ZWV9BF7rT1qKaUd+t6rxGh+EqwbqhCKvhhHtvTSMU667VsJhOyK5
 aA7qeI39ABiqwWJjQpOCsJVqyFSdl+IKdfdGRpoObyRSi9VAIHygITf8+lEWy3QXvK7C3wQtVok
 mNZcInVB4Ay2DOsRZ0+TXEIX6FmFDinhIeOYIXH7WRr/JZew+D0yu4zm6XXetwxntuHearUV/gL
 xyCJc3Lm39ti5qg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065540_580762_EEF666E6 
X-CRM114-Status: GOOD (  16.72  )
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

Support a per-implementation number of counters to allow adding support
for implementations with less counters.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index b4ab6a3e5df965b7ef450d7e533995f3cc8633fd..b5fe04ef186f04b4af32524fe433afb79979b791 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -20,6 +20,7 @@
 #include <asm/perf_event.h>
 
 #define M1_PMU_NR_COUNTERS		10
+#define APPLE_PMU_MAX_NR_COUNTERS	10
 
 #define M1_PMU_CFG_EVENT		GENMASK(7, 0)
 
@@ -459,7 +460,7 @@ static irqreturn_t m1_pmu_handle_irq(struct arm_pmu *cpu_pmu)
 
 	regs = get_irq_regs();
 
-	for_each_set_bit(idx, cpu_pmu->cntr_mask, M1_PMU_NR_COUNTERS) {
+	for_each_set_bit(idx, cpu_pmu->cntr_mask, APPLE_PMU_MAX_NR_COUNTERS) {
 		struct perf_event *event = cpuc->events[idx];
 		struct perf_sample_data data;
 
@@ -506,7 +507,7 @@ static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	 * counting on the PMU at any given time, and by placing the
 	 * most constraining events first.
 	 */
-	for_each_set_bit(idx, &affinity, M1_PMU_NR_COUNTERS) {
+	for_each_set_bit(idx, &affinity, APPLE_PMU_MAX_NR_COUNTERS) {
 		if (!test_and_set_bit(idx, cpuc->used_mask))
 			return idx;
 	}
@@ -601,13 +602,13 @@ static void m1_pmu_init_pmceid(struct arm_pmu *pmu)
 	}
 }
 
-static void m1_pmu_reset(void *info)
+static void apple_pmu_reset(void *info, u32 counters)
 {
 	int i;
 
 	__m1_pmu_set_mode(PMCR0_IMODE_OFF);
 
-	for (i = 0; i < M1_PMU_NR_COUNTERS; i++) {
+	for (i = 0; i < counters; i++) {
 		m1_pmu_disable_counter(i);
 		m1_pmu_disable_counter_interrupt(i);
 		m1_pmu_write_hw_counter(0, i);
@@ -616,6 +617,11 @@ static void m1_pmu_reset(void *info)
 	isb();
 }
 
+static void m1_pmu_reset(void *info)
+{
+	apple_pmu_reset(info, M1_PMU_NR_COUNTERS);
+}
+
 static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 				   struct perf_event_attr *attr)
 {
@@ -639,7 +645,7 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 	return 0;
 }
 
-static int apple_pmu_init(struct arm_pmu *cpu_pmu)
+static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 {
 	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
 	cpu_pmu->enable		  = m1_pmu_enable_event;
@@ -649,7 +655,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
 	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
-	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
 	if (is_hyp_mode_available()) {
@@ -657,7 +662,7 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 		m1_pmu_init_pmceid(cpu_pmu);
 	}
 
-	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
+	bitmap_set(cpu_pmu->cntr_mask, 0, counters);
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
@@ -669,7 +674,8 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_icestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
@@ -677,7 +683,8 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_firestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
@@ -685,7 +692,8 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_avalanche_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
@@ -693,7 +701,8 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_blizzard_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static const struct of_device_id m1_pmu_of_device_ids[] = {

-- 
2.50.1


