Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95370C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 01:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RspcmdC6N9FCe5+5MFitUG7n/lZdN0nBTHTU7ItA6Ws=; b=HIdr70chvRIQFN9Wr+7hpCOwC4
	5vBzEykClgGGDo43+ixeipla6zV1+vRF5FoGJO4d5S5KbAm/Rls15tQuu+ugFVA4PvY1AWWznmbvo
	VaF4zzZ9k3PWjtmFZim/a0OvMkgGw6bmqzAioTQQOO86zVchfVjKRwhLLe0l539jniqXUmsFO1x3X
	LEgKWc0UzDNhNYVwR+ytwOWkXbwgsljndqn/Vb0Vp1t8cEEb41caSwhA6mAy1dv7BhPDyRz8rBr9W
	t06Ak00YD5t6v1IjF02DC4ewBe4h12IRFgcvI+Fl0U3a3UxQGYxh2ItFf5Daad6eG/JhQsekR1BGq
	9b9MbzNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQysp-0000000363F-2W7d;
	Mon, 16 Jun 2025 01:43:35 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyi3-000000034EM-3Z5u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 01:32:30 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2349f096605so51008955ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 18:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037547; x=1750642347; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RspcmdC6N9FCe5+5MFitUG7n/lZdN0nBTHTU7ItA6Ws=;
        b=X4OXT8w1K+Ktv8n+eGFxQQn9F0YX2iD3AFyfXmr/P7CF0aXNURa4kI7boKaVD1ugxs
         sa4TTBTJSPSBhaTaLLc37dPJib6Zzkv2eJLEo6gvP78mk14ygt1+gypVMiWchLb4joXf
         WJfZwVPJ1Kr+k2KZ6hvBR/x91PMFCBDN7ZoTJyBkPY0FKLjnjv8w2P+pGvf2EPQGHcXN
         gb7oCzerLPZc907CUBoAUbt7ZsE69wp8tAD+cU/pV8wWuUeuqGZrJVgtpmH5ee+dB1zN
         5R7MvvG50XIVae7G2GknOZQkjWqNoXPe5jyoP+esAg22absgaY/Mo6wSwaP/i9lRV3KZ
         5x+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037547; x=1750642347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RspcmdC6N9FCe5+5MFitUG7n/lZdN0nBTHTU7ItA6Ws=;
        b=gZD4iqqxdaIeaogDcMeA0YoHJoU4JQW9wG4MvzNxGRkk55UjyoNdO+C5wY63B0DUiZ
         YRWqaSbtAdXb/V7tH3R61AfxYbDcXskhCiTR4gSDCBGWNGGwJUAd9twGjxMzAOXdhyU/
         fKQgWVXflanZsVqgmsbfqVxmHHTVJFqeSiARo7oRhLBKrD8IhmhhqA9eexKNDTAcYwk2
         AdlmbmHbqrlfy+BWiHhpKH6WUQvAgFLSJeC5nuLCu/8cAbYVxsL3QRhPYiktD6sTV9dQ
         IZo4faVivkYpzvKfBRgAx5QjtphHCiK82gctkTFP8CRBGew53iWdJdAxWDdDy30xE49i
         rukw==
X-Forwarded-Encrypted: i=1; AJvYcCV9a3u7d0J7B7zViuBuxc4vYsFGjeEDJItY6oXdZ4tDb2NhcLfscIDJN1XF3Se12iSew/UTk8DDmjYDuEX4S/N/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhs8AVWE8mHFNZvrI0BbWAqQlLmVl6cJmEkjtKQ1Mmc98usJlk
	IDw2eafhftM3dsA9Vzyw2/0//piiB7HV9R0jZfPIuzBG+wZHdwuTDp8g
X-Gm-Gg: ASbGncvudFdxkUhQ9KXSFaNHlSDG69aSmPr7Dg5yKnmqaMkQ6Ps+eDo2q5U/iEIXxzy
	aQjIYHG/ywAQAO6gIe/koufsenfd1Suk5SKBcbCsPgpnJEVXdXRybxsSZyAFybSCAlMhFsyXC5r
	/M+T6y+CwDAB4pTDAgNavTd2jM6G+QpNAHq6yYPGyh5FzcYJGzw4FdM2Td4DrdNlQkQg2f+kR+0
	XpkzdWfki6TcgcYLoVQY5SqYw7iPp/y2wcty57J4HGGTAdZqDI29S1z+Mqp0kSio4CvLWym7z1S
	GcBORJ5wCByshR9d6iVZBMFGAbJkmy9o263F4WbUW3gldAUdLVsLJlFDe7EiniQ3lghqIeGQdpJ
	z5TE=
X-Google-Smtp-Source: AGHT+IG8CAmo6a0aZ0BwqY/s6U9ApO+quHd1pSXgFQijbkEbpTCB7lMLOO4u7q5HwbAUJS9Fu8A2OA==
X-Received: by 2002:a17:903:74f:b0:234:b422:7120 with SMTP id d9443c01a7336-2366b3137c0mr80246105ad.9.1750037547086;
        Sun, 15 Jun 2025 18:32:27 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:32:26 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:31:53 +0800
Subject: [PATCH RESEND v7 04/21] drivers/perf: apple_m1: Support a
 per-implementation number of counters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-4-df2778a44d5c@gmail.com>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
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
 h=from:subject:message-id; bh=92neIFKGScRdX0M24usDNCsl0ZJtczDZfCVErT5yl+Y=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QXkcb2egfyxEIUDDhCkP08355OURKO+riCz
 mGVquyf1LSJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90FwAKCRABygi3psUI
 JIbvD/0fEGJvjk8QbPrwi7DbwIJob5LLJWbkt6axymTyd0d2U6aBs7QJbhrRLqdB+TSXLy0mUmR
 /cLxARZvk+HMZEWe9ErZdd1miHtKVwRyoewo+QvQhVkU8slwKf4t+jUxSZdpGTewCApvNIQFZgR
 qOZjvS2314iZJnJ7tL2RwgiK89XvVSRSaI5o75mVDaUEXn0CEdOlXPyXFFTWjhXCTmPfZyiZw/U
 VKUjD8bNgGYowCN85EK3HdGQ6jWj32rBbks99Wi4xyMFebfOKyFN5AyS0YgJ33Urg+TdbJc/LSP
 CWFwJZSlYzru9tipcBlOndo52Mc6K7Uo4S7EzmRKo9ta9+z0rTDBLedyvWGIjFTtHr3uo3sYcAm
 AJ5JAMMLijtOUBHiQ2kq/HrSkK6BkIlqZn1UVX9YzjWC/bMhTbsTmp/eFqnfzzlKLwC/3CtZ+z3
 v6tDX63k+wdbpDHBVlc6Oxp1/6dnbnuCACx4DJ1ol/DWkmqR/Pca51C4eWt34bJ8EoVmYqyPzkt
 Rf+L9d3vXFdTwa+eG6Wo9LVL4s30s2HmOQoDHSlK0y8W/RW5xJWCZys2+cgKGzOgaI/KxFxhIj1
 Iz5APgsI2KRHDO9Qs2EiNFLQ9nZKEV1091KTxrEoGnU4PpFXalhxq8E6ps1LM2BNtUY4XZQ0iiO
 kunnM3Dis2MDhkw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_183227_897445_B960A50F 
X-CRM114-Status: GOOD (  16.13  )
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
index c19a433ee6478876e4cf6667d7a85a193b6cb069..35a34eca403384c4908c2bba2f8186ea854d63bf 100644
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
 
@@ -507,7 +508,7 @@ static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	 * counting on the PMU at any given time, and by placing the
 	 * most constraining events first.
 	 */
-	for_each_set_bit(idx, &affinity, M1_PMU_NR_COUNTERS) {
+	for_each_set_bit(idx, &affinity, APPLE_PMU_MAX_NR_COUNTERS) {
 		if (!test_and_set_bit(idx, cpuc->used_mask))
 			return idx;
 	}
@@ -602,13 +603,13 @@ static void m1_pmu_init_pmceid(struct arm_pmu *pmu)
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
@@ -617,6 +618,11 @@ static void m1_pmu_reset(void *info)
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
@@ -640,7 +646,7 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 	return 0;
 }
 
-static int apple_pmu_init(struct arm_pmu *cpu_pmu)
+static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 {
 	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
 	cpu_pmu->enable		  = m1_pmu_enable_event;
@@ -650,7 +656,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
 	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
-	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
 	if (is_hyp_mode_available()) {
@@ -658,7 +663,7 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 		m1_pmu_init_pmceid(cpu_pmu);
 	}
 
-	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
+	bitmap_set(cpu_pmu->cntr_mask, 0, counters);
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
@@ -670,7 +675,8 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_icestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
@@ -678,7 +684,8 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_firestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
@@ -686,7 +693,8 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_avalanche_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
@@ -694,7 +702,8 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_blizzard_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static const struct of_device_id m1_pmu_of_device_ids[] = {

-- 
2.49.0


