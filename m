Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438CBC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 04:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfW03x8PctsFN6tD/weQNw1AxZpgTS9cl9FMFO0QxSU=; b=KvCS94Bsl51xl/vw8zwVDvDX0S
	NIqXvcBXsCaqoZSaoFXa2Nm6sN6Q97OpMJAvZ7bOjyrPCMdYn29D0UyuFWV0mmIvOaTEo1LFPwmnu
	YVsZouseQiD0ecpw3jKYKUh4JPJYju4Uc6W50AFiIjGZpn2MUlAPhXc7ZxAGsophYzq00LHzOyEBr
	cctpfvcIBBxtdGwYr/f2V9XUaXSN8G+naOVwMK1zwoDbTRQHy2LOa/P/9bcMMWwoAvImkuFoWd108
	k4kODol+NFbW3NGyA0NSx6F4hlGnSQlH2lqtYOAkikeG0chzRhUjWRsn6atsAUAMrfHZiwl0RpKU5
	PPhM3e2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrpN-00000009iGF-3Dea;
	Fri, 28 Feb 2025 04:18:21 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrjT-00000009gmF-0bOm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 04:12:16 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22113560c57so32743505ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 20:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740715934; x=1741320734; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfW03x8PctsFN6tD/weQNw1AxZpgTS9cl9FMFO0QxSU=;
        b=hgGl1R3OyRToTBBIMiVcXIaeH2q3OA8hCLhQBDvBX03qwClIVty4fkPJclj6gFc73z
         SRGshlTtVGZm4Bd3Dq0AjYRSEEZ3OtZmn6KPSQNFlLaUfBGKEgAEPfwb0p8RAVqsCXFE
         PTszDDz1szZ0RegjziTSeWXVc0XH8v1IwOtYTo3gQqubtnmiZDG2i6u+fOOGjexee0pU
         k199V9EzcznfpXR1Gq9RyluXmruv1/kQSdXUZe0kbrlvrRgqhUIp/B1+kVjqAWyhhiSx
         GhHVMgE6Wbrx0qyFxo9syerIBEAua/7uTv+eWFoBaLoXETljssVnzax+trGZ3ZKjlcIT
         vJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740715934; x=1741320734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfW03x8PctsFN6tD/weQNw1AxZpgTS9cl9FMFO0QxSU=;
        b=NK1UPRgyFpHxsUOOtKFbfe+QIJiZ/s1P+AUwQEp37igBp2tHEmzNrsB49IVhLJF0PC
         vU0auP/tBmeJTv+nh8UDH2OsCfhP/yWvyKE45W8TaGFtPwKsZLs7uaJ+Dne/HFEujyXx
         yI+P6IHP8MkOHl7Eg3l1Bq746WUgoNewY7jLc5d3YH+m8hRMxq2YKm3Hamw4RxuhYXoc
         /FRAvELS7uF3tNF7TG16ZyRX6if2MAZBvbr7ayUAkU+XHdCFJhjK138ANXfX2R6vxeLf
         hyHcXP7fOIVUninyWmb6/6kG1HtXh2Pw1tnhQl62lssxdrx62IfRtyXzOl7VbgZbgIFk
         sl0w==
X-Forwarded-Encrypted: i=1; AJvYcCWprekYbxQzDvY/fYixA9ENcNSw3bSSesZr/Tl4HfAJ6JRSMah1JdrOgtZR5mwuLsKa/w6QzRKHbfZMvRLiJZWh@lists.infradead.org
X-Gm-Message-State: AOJu0YyIhAOMJKLtSe/lQKzGkSMaROM9vemhfkwoSFk+mUrNRuhg6Hgv
	k99IBNRRag/o045VFT+UzzI5WF9jecCQ65MSgVW1RIkncmh9wU7w
X-Gm-Gg: ASbGncs9E6MHAX2WHVckbMcjNaF8T+CZICHhyLVy9Iwlzm8Eln4Lk31Eyn4xDodfqQJ
	KxAUnZF7fuXSJjlhxhsH7yjhVz8KdAW2AGaFGYXA1C0dneOp7zKpwVpRevVBvZy5UbvURh2b4nG
	kGK9lxi7wLzxanQdZ9pxM0lHzZBZU5SrnZ0VsLJsqfoH27zwDzN2OnYJBXG7kYXzfrxP2zmmvnA
	Uph4Vi9tS/LExXPrF+catZDPocdkYwtPYPsu0wUYpnGCjxu6RDoQnh/oVnRwSeWRzgX4qdmC+ke
	mAKGbyhL6QhhfDGaMKh1e//UKps=
X-Google-Smtp-Source: AGHT+IEwr4kr04bIVs7yxEwPvsivOao14b1Ljx0gKtW/fUtZRRHL8X5NReKqX7YpC1WASfZQ3srxiw==
X-Received: by 2002:a05:6a21:7109:b0:1ee:d8c8:4b7f with SMTP id adf61e73a8af0-1f2f4d22894mr3081917637.25.1740715934384;
        Thu, 27 Feb 2025 20:12:14 -0800 (PST)
Received: from [127.0.1.1] ([49.130.74.133])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-aee7dec4114sm2387856a12.57.2025.02.27.20.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:12:14 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:06:43 +0800
Subject: [PATCH v5 03/11] drivers/perf: apple_m1: Support a
 per-implementation number of counters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-apple-cpmu-v5-3-9e124cd28ed4@gmail.com>
References: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
In-Reply-To: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4755; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=MG7H09oJBroEMR2rLRIA2iE+Zt5xTdbc861bsPYOz8o=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTeIOasDWrMTBSApTELuoEHQZSDxKS+Bp3qyw
 +E8oAk6D4CJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E3iAAKCRABygi3psUI
 JGf8D/9fu+FvT8c12d1HIjAx1p51DiBewXXuhvcmKT27E2Tvzx+XXFnCgVM++gG+uv9XqZBnX+U
 Yk9Hr3faLWv3ih7S4x42iw5SOa3grz96N3tE1mVdyIqa9mWcULt0X9vacp/ChIks4TBPbnTq85J
 XbZ1nRKD/zwDXTtBMjDnLaHYUHrOekDJeqwzNJY2PpAeiuEIPTpZOhl0ci8gjk9ZDlxtBjqpTYs
 GlhjRQIrhCMwlq1KPvPaaSLDkfAdO5kR4BB9+ccHienMvxIMv1bukPc075Gn79xK6iwrb0067mP
 6s6ALGGRlOb4sUErDu86xF8wyYzZugDv76G1gpyJ2nwKehQlxCn1SXEoVTghqveLb9/p5x3Btf2
 x6IqKyPlfA8H6NDPiscONQrXch0hJjT18YEPFBgZJVacqV56+s3sHj6IQnWzNJkgYHLY0c1lcQG
 q7rLBYSbp7AmwSkzQimlJgO/LyJShIw+aunLa83nNcNZUagWZaAXTdvv0FTMK46Hpn4d9C49HNe
 UaGabHlNGbIKddEyK8A+mjOcmG64hfIMX/c9EVVzSAnHdUxwItXciNABSYeJj+Fn5nMX3mPS2i/
 4RhWX0rcfxGanOuy4BGibH34eR8rer96v8XbYNfpHfqhTLKRrBDzp2UsWJ6Mlvg9fwW2eilQ/Aq
 JVNuIxu7gy7pGXA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_201215_191237_0851C578 
X-CRM114-Status: GOOD (  15.97  )
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
index dfd5d72ce9f3c5bebd990b5df6a6823fb7785cce..bf397fd81230007dcf52888f148e3158dc02e29d 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -19,6 +19,7 @@
 #include <asm/perf_event.h>
 
 #define M1_PMU_NR_COUNTERS		10
+#define APPLE_PMU_MAX_NR_COUNTERS	10
 
 #define M1_PMU_CFG_EVENT		GENMASK(7, 0)
 
@@ -431,7 +432,7 @@ static irqreturn_t m1_pmu_handle_irq(struct arm_pmu *cpu_pmu)
 
 	regs = get_irq_regs();
 
-	for_each_set_bit(idx, cpu_pmu->cntr_mask, M1_PMU_NR_COUNTERS) {
+	for_each_set_bit(idx, cpu_pmu->cntr_mask, APPLE_PMU_MAX_NR_COUNTERS) {
 		struct perf_event *event = cpuc->events[idx];
 		struct perf_sample_data data;
 
@@ -479,7 +480,7 @@ static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	 * counting on the PMU at any given time, and by placing the
 	 * most constraining events first.
 	 */
-	for_each_set_bit(idx, &affinity, M1_PMU_NR_COUNTERS) {
+	for_each_set_bit(idx, &affinity, APPLE_PMU_MAX_NR_COUNTERS) {
 		if (!test_and_set_bit(idx, cpuc->used_mask))
 			return idx;
 	}
@@ -554,13 +555,13 @@ static int m2_pmu_map_event(struct perf_event *event)
 	return apple_pmu_map_event_63(event, &m1_pmu_perf_map);
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
@@ -569,6 +570,11 @@ static void m1_pmu_reset(void *info)
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
@@ -588,7 +594,7 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 	return 0;
 }
 
-static int apple_pmu_init(struct arm_pmu *cpu_pmu)
+static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 {
 	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
 	cpu_pmu->enable		  = m1_pmu_enable_event;
@@ -598,10 +604,9 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
 	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
-	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
-	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
+	bitmap_set(cpu_pmu->cntr_mask, 0, counters);
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
@@ -613,7 +618,8 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_icestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
@@ -621,7 +627,8 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_firestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
@@ -629,7 +636,8 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_avalanche_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
@@ -637,7 +645,8 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_blizzard_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static const struct of_device_id m1_pmu_of_device_ids[] = {

-- 
2.48.1


