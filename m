Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B17C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 14:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfW03x8PctsFN6tD/weQNw1AxZpgTS9cl9FMFO0QxSU=; b=fc8EQTNhxBPG2woMuYE4nY1BB9
	CydUGV/6f+O661bJg+TGs5gvRHLqIdlX6sPSIXSS6knBIr7VKW/bWpRzBBf/y164a6ojFwXEv+7s4
	8a1QUV8fXT1vybXXRx3WKX4rxsFImnmf2yD0Ybwoq+DWkhAUDsXVRXNUGYhCW4izHqSiR8JPKwcl3
	fpc1zTjXwbZOSe922/X3nqdpYVhBiahANZZGocC00oXts1IFanLCt1u9ukQEkFx8vcQLS3Pu6ofow
	fSGCR53FG1e2v+7j+zZJZrdxFnFoq4TpjgRDLvh1JRDK7zfnBTy7Rd0Z/z2xCTFr20FiK3DCagKuf
	4dwplmcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwnn-0000000FB16-3LM9;
	Fri, 14 Feb 2025 14:36:23 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwiF-0000000F9nM-19ij
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 14:30:40 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-220d398bea9so29853105ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 06:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739543438; x=1740148238; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfW03x8PctsFN6tD/weQNw1AxZpgTS9cl9FMFO0QxSU=;
        b=VS/Ve5fsSJQDh2cW2zaggWdi7HDxS/hqn7rTLqw6WaUn/JcubDQQNNUVXWrV/cqHao
         GwbE2n39NB6bhWatXtp2BoNHiJCwdQ4oZwNEoOoa+H/xgnXD2zctBezBckK2UakLfPDV
         u5nKoQS3EwOfW+iJnFlt4xN7snAGbYABi4d8QFjFAaQbBBV/0dLt4yEHFzx7ICjN6mc1
         VEcnz/H1fcDPQbJocDiaOe995nFlUmXaG/gk7H1Q4KJPGZaleDJ8BuhV2EgWo44wtnBU
         2nIqVGZotpukq9/WWP+JBUGgxbLqXARvcii3GXKvXGJDNWwaMQGjHZJtwhjImbizse9h
         ccMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739543438; x=1740148238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfW03x8PctsFN6tD/weQNw1AxZpgTS9cl9FMFO0QxSU=;
        b=OkoLytJ4F453FjBnrJquoXd4tFvKaAbTk6wcbxH3EbBUoYl4S8wcxdZiNcYMKqIcb1
         /zxty+M5uKHTAdcY11Z4DMLKxHvhARlD8O4cwdjSPZWez/tH/72aYxV8ltHuP6WCBOrp
         cormXUIPaipKUukhHBmLdGiRIiZeoJlWqZ60td0eG233PyozM7yTKHmX9VQF02gmoMUN
         y92CAB6ylawIz7mF/8eLRVoLBmdkQ2OTnRh21wau0eg2MD7hxOu36vApTQT2jD1fWgCF
         Q1qg1Z4WiLj59i7UgTNFwU4ARk4k9y63XqZOWEXj5QL4c6e4O4jGQ8Zttn3cAAkd4LpL
         bYZg==
X-Forwarded-Encrypted: i=1; AJvYcCV11ftnuzOXqqX3hhzKPuQ+vXUtevLQrrX+nYqGj1POcoUomeAXLe8aLHgTimCbw/STP0JIIrSzh8LVJ+dr/Lcs@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1HmqhXCX+Xcz1aWv9kyyfZNX86nxn/7EwZS4SsSecraXGUcNT
	DkHF15qydieJ0nvDgroXpcQHAauIPqVEK+LJpvemVVXplEO9YMIc
X-Gm-Gg: ASbGncuQ60z5tYtmnGgJUQmH6JnhpDkJeme/Gwc2hDueeWg2j54pxZiKbASME1bGvum
	YvzzjQUa/SRZkTReqdRqBQPuBpvWy6307yMw2wwwtXq3OREmA5+x0BTiIEcnCM8jkqUlnGQwwo+
	82z4v5Dqb9SDfFD3zWcHp9G1JWYlAgucryMnyeCQK6EwTOW2AZ9/DOW6vlmOZudy+C2+LqF3kyi
	HZztzNqh+YC6egxOk5wJmeP/xHqtC7KeHE6rzQoWEpUeI5ABQ+BRKGxdFQS9C86pzByd58HUVnQ
	Hb/WJUoBSpLYgFoqdQ==
X-Google-Smtp-Source: AGHT+IGlV/clcQ7bA1VUVCHwnAC7Ksp+1PRaUPCafXfhp5XXwUagzP+nJKFR5X2c/1fpY3M5q5wCaw==
X-Received: by 2002:a17:902:f545:b0:216:393b:23d4 with SMTP id d9443c01a7336-220bbab0e0cmr199459515ad.11.1739543438299;
        Fri, 14 Feb 2025 06:30:38 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d545c8d1sm29490315ad.113.2025.02.14.06.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:30:37 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 14 Feb 2025 22:28:29 +0800
Subject: [PATCH v4 03/11] drivers/perf: apple_m1: Support a
 per-implementation number of counters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-apple-cpmu-v4-3-ffca0e45147e@gmail.com>
References: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
In-Reply-To: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
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
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnr1OA1ESIhZerrZ84FjKBXZFleAZUOZNbSrprv
 Mym56PWKYqJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ69TgAAKCRABygi3psUI
 JDHbD/wKOIeNqAV2YNyWr/eU5L29ZU0+QQRvSVZBpqK2cU20vrZ6Z1LZNb+v267CjeeBhzFqwT8
 v0wrtmAQ7S45X0xPZpOg7HZXN1fa3PNT4YTF81fjLuYSj+zeb5qlpZIGgJbCsIX7vztqB4uc7JZ
 8VaKwJRHPLpw/0ZgEtVBafy+Ied345opGHA4rPZU/wyOHBL6T0F6Ym+y5+0Bbwg7nNH2XUonhfv
 b/Np36Ro0VebowdqZniRv5tU/M9igtPkX7gv/ctXesu9h5PM/GGXKuizGKb4iSrVf3/Rl8iSWrY
 B7VL6KQEajdCbjUHVySYmFS5sKEbI9POpZ8DAlxIhRbhDWmCs6xUBWXuAu+lL4fwRZTqS+fA5au
 00PAk9oD0j/xvBSDPwaeoU3crZ4sDkvCPDotGQTVYzvsbABs966qe61WJrQtHFEQ1ufdPH64NDL
 GsGIH592Y0F2/jNsH/UD8hqHLQyz9YkWUxqXCXbW/82fxwQhDlyBx9FJIfcFZVnA/CdVuHRdPWl
 X62NzTBNtyDxRBz4oaP5mRl5GvlJmmljIbyjr/7t8DUejNZU4Pucuy3G1ZpGQhc1GtsjudcgOIA
 8+iGYuXNVm8ZN++ev88u+LwYJp13Z3zqjJMFK8umo2BvMTjzhhfdLkNCij4ic8eOgKnWUqa3jed
 q/I7kG8paRK/Blg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_063039_313125_EC2CD1FB 
X-CRM114-Status: GOOD (  15.95  )
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


