Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF172C87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 14:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bii5U19mzG3NLCbpWEGJVE2xyiZpHRsFsKgumtymqHE=; b=ukCyiFm6A1va13mYozqEBkGyD6
	H9oFH0iil8pquAQTY0+rxGj4IwrQaB7CPiyt2CSidsS8kaF/7tb3UwK+EYjS+69EB0KvNVCzydPYc
	dRsGr3l1aDKWDIz7sZt2XrqK0IER6hg5VaeDPI66BrjfyXmD1mHrLN8IbKmb5RL2DrTqqY9qDI4e9
	o3t8hoUOUxkbAmYxtGg2+w1aP9jIOYuLKq3TBgH5vfiWRFAPVBDbufx4Q/H3Xry6n1tjtPTRNMIpZ
	izWabAceqZJ8+sTHgPaq1k1OAw6xq4/cD/BpwqUaFg4rGRxt9f9b7KBHsj26xBGQGB7stTtziC7KC
	C2V8+QVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTv1-000000086Yc-3ZU2;
	Mon, 11 Aug 2025 14:54:35 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSzv-00000007txz-43Oo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:55:37 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b421b70f986so3075493a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920535; x=1755525335; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bii5U19mzG3NLCbpWEGJVE2xyiZpHRsFsKgumtymqHE=;
        b=MKLJ3m1dH5dCDpp3V/DwmielHbQQbWHupY5gEKSlSOnGNXWvojfl8p2jhBOAJAX+z6
         qPFGasvsTeiCH2xBMf0vMBJz2hDjVrEDnIdAFwI32Av6QQTsx1pBZ2mgr488JCfr1F+f
         bVX+Yvyj0mm0oSfQYIXm896xdmBoy6ZJeyQxNgX6K5XUE8zCosPe0+XuVQgfbjC4KE9C
         k0H749XJZYtVCYoLdWT/d2tF6qSUQMQuAbQw8/9aDV0qF0fgdNq3suz/AfPQ6QraPWNa
         uyx2E5eJpBfFsciwhdROHPUnSqKj3KRphF5lkHRuOsAZO9LM+8NMMCrkp2XsTbqcBwoU
         cShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920535; x=1755525335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bii5U19mzG3NLCbpWEGJVE2xyiZpHRsFsKgumtymqHE=;
        b=HuiEwIVukJq078q6R/eKJTYh3+xOpg91fMrk0AJroqbZes3t6YnwCJIjMkDsGLGykX
         9KKeqtEPP1QFCoFlEMrH5ZUw3Olgz6aL2vaA1MCD6gGgdi3LEDaMzDQjFKoVSF93Nte5
         8tGRnGesCMgb+B7Mn8tNyMkasKfSn2J4HKLX4V1AlbQPQGkzVXbaQ8ngzU1vG+MNbrDB
         1683RytP3yctnHzVLDqeoMxd2Emz62HB4XgbN6DkX3E5DPV+tto+CDtVGhLSvQYHRyrW
         iEDNFpP0n9i2c3miHS+VqfFbsXV2OgEOQFVXunl3PN6hZlNNZmprSSLsveGSzU1WUczl
         tSVg==
X-Forwarded-Encrypted: i=1; AJvYcCVqGxElq/ElXQthjJqIx1mqgqHPM8P1QNNyKMncWkzxOSxgk+KnBFB9tqT2uPEF/O97bP08oVr4uCenxNRwKXyr@lists.infradead.org
X-Gm-Message-State: AOJu0YxHlGEkO78vKVgWSLLQQDsMqNCNdK1JoqK46UMVWXxX7VMYNe71
	fjH4u/ASvxxVAJFvLHm4CMo6PHdrazfOxx+m0J9s50ZhRvmDEOlZiczv
X-Gm-Gg: ASbGnctffGKfvTnBtJh5mkobOh+VkA0L1eBzC8EN/XvH6dZrPipGaao/nEpUMvfjSjj
	8fk3fcOI1DB2fW4yWbJwvv5fWUtmC78i3OGey0kbcd6EEtpqAN1tlT0nqQ4n6ozmNiVD3XODtwE
	UpjCm/SNocf0Y/KH4gOOt9ZpFnod3xmhg9qPTsrLkPvfKuDbCFLV5hxwEMvh3gbEzphANHYrXs/
	kri8PA3y8tBMGsKqiYtMQr+kLb5xLxhBYrKxldkpffONybPjHJbVrUbmEyE9TGUnfZ1Qkth+iFW
	d+20qc47CVaXCuylDs6T7Lqs6yuVtiO6f6QyZMPA/Qi09kQb/STzMxWOrJvL5vIxnFpaM2AkFL3
	d8ZUbdi99kUr3oazlFO5kbRZsWTyj6h3B1tibVht57+CHvj8=
X-Google-Smtp-Source: AGHT+IHc9I6hIyljcY7HJbTACaSv3ftbDSpYv2swxF233857uapz1SqkCZUNyhI2JqbdRS8fhwZLuQ==
X-Received: by 2002:a17:90b:558e:b0:311:ed2:b758 with SMTP id 98e67ed59e1d1-321839d9dfbmr18574178a91.3.1754920535058;
        Mon, 11 Aug 2025 06:55:35 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:55:34 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:35 +0800
Subject: [PATCH v8 03/21] drivers/perf: apple_m1: Support
 per-implementation event tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-3-c560ebd9ca46@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5769; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=L2YMsQakHXAovXEtkfkDoO7BcCisDs2noWQ8gSGB4P4=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZBqHdal0BAjjTgQbH52DWluytNz3S2xTEzC
 s+6fQn6qcWJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QQAKCRABygi3psUI
 JCgbD/kB5IrVKa5WSvD4j+qzCZ7IawmO0u+5y8zwKQrp3Qyl20OdNTRrtAbErhIf8BBRuDBafU5
 abcoH+dUwb5fmQDxo13ZdulVpVqNPxXKXYGhuvaeWyDieZgtp3SHYV/3mEcSHSZZSYwftYJ9Dxo
 vTtlKLK2JDHXr7R15AKZKeuB4I6c34p1Lpz+1mS5iXpFNFDha1R2/kuMjpLS6BeoTggUEfmJ8cs
 AHJviwFNEproj3Gff+DIx/AgroktT5t39QtvFBH9F/viiQbob26YBLvpX6UIvtl2ehZSHSG6r4Z
 BduXTZkZUldXe/lgJGVm21+46O1ma9s0kjJMwfODiFF9cQn0oNWIRk7f1nLGs1zNKkiObNH+2Bx
 OUD0etGDV7JNe/I+m6yUB7EM5Tj+EftkLtS5JIGpjDeYMnmV4LlgJJbe4jl+DGqsb1el9RrkC9r
 t+0Gfj7KJAGLqZmm9fxcf2O9bE1FJakg4C0GbWSh+hvI5OKHYhjUrGOp4qMkXABdXDtAr2pDKWx
 evpuRFx0ooXSvcvY9iocDHa7RFg/sd1nzCJsh562luG3BTWGl4CQwQwz+PJ0FlvZOlnahz1g7Jt
 7Q4WC5e0/IH8Se+4i/wqx5X6ozCiJ/2ElxFraD3muszE90l7Lc808eMPD5E9WJ0c/SinlQty6PI
 l1LUXwR9E9qJPEQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065536_020012_A30FC18D 
X-CRM114-Status: GOOD (  17.98  )
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

Use per-implementation event tables to allow supporting implementations
with a different list of events and event affinities.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 65 +++++++++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 25 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index f3948528e28e0189efd0f17fde0d808930d936af..b4ab6a3e5df965b7ef450d7e533995f3cc8633fd 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -43,9 +43,6 @@
  * moment, we don't really need to distinguish between the two because we
  * know next to nothing about the events themselves, and we already have
  * per cpu-type PMU abstractions.
- *
- * If we eventually find out that the events are different across
- * implementations, we'll have to introduce per cpu-type tables.
  */
 enum m1_pmu_events {
 	M1_PMU_PERFCTR_RETIRE_UOP				= 0x1,
@@ -493,11 +490,12 @@ static void m1_pmu_write_counter(struct perf_event *event, u64 value)
 	isb();
 }
 
-static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
-				struct perf_event *event)
+static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
+				struct perf_event *event,
+				const u16 event_affinities[])
 {
 	unsigned long evtype = event->hw.config_base & M1_PMU_CFG_EVENT;
-	unsigned long affinity = m1_pmu_event_affinity[evtype];
+	unsigned long affinity = event_affinities[evtype];
 	int idx;
 
 	/*
@@ -516,6 +514,12 @@ static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	return -EAGAIN;
 }
 
+static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
+				struct perf_event *event)
+{
+	return apple_pmu_get_event_idx(cpuc, event, m1_pmu_event_affinity);
+}
+
 static void m1_pmu_clear_event_idx(struct pmu_hw_events *cpuc,
 				   struct perf_event *event)
 {
@@ -543,7 +547,8 @@ static void m1_pmu_stop(struct arm_pmu *cpu_pmu)
 	__m1_pmu_set_mode(PMCR0_IMODE_OFF);
 }
 
-static int m1_pmu_map_event(struct perf_event *event)
+static int apple_pmu_map_event_47(struct perf_event *event,
+				  const unsigned int (*perf_map)[])
 {
 	/*
 	 * Although the counters are 48bit wide, bit 47 is what
@@ -551,18 +556,29 @@ static int m1_pmu_map_event(struct perf_event *event)
 	 * being 47bit wide to mimick the behaviour of the ARM PMU.
 	 */
 	event->hw.flags |= ARMPMU_EVT_47BIT;
-	return armpmu_map_event(event, &m1_pmu_perf_map, NULL, M1_PMU_CFG_EVENT);
+	return armpmu_map_event(event, perf_map, NULL, M1_PMU_CFG_EVENT);
 }
 
-static int m2_pmu_map_event(struct perf_event *event)
+static int apple_pmu_map_event_63(struct perf_event *event,
+				  const unsigned int (*perf_map)[])
 {
 	/*
-	 * Same deal as the above, except that M2 has 64bit counters.
+	 * Same deal as the above, except with 64bit counters.
 	 * Which, as far as we're concerned, actually means 63 bits.
 	 * Yes, this is getting awkward.
 	 */
 	event->hw.flags |= ARMPMU_EVT_63BIT;
-	return armpmu_map_event(event, &m1_pmu_perf_map, NULL, M1_PMU_CFG_EVENT);
+	return armpmu_map_event(event, perf_map, NULL, M1_PMU_CFG_EVENT);
+}
+
+static int m1_pmu_map_event(struct perf_event *event)
+{
+	return apple_pmu_map_event_47(event, &m1_pmu_perf_map);
+}
+
+static int m2_pmu_map_event(struct perf_event *event)
+{
+	return apple_pmu_map_event_63(event, &m1_pmu_perf_map);
 }
 
 static int m1_pmu_map_pmuv3_event(unsigned int eventsel)
@@ -623,25 +639,16 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 	return 0;
 }
 
-static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
+static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
 	cpu_pmu->enable		  = m1_pmu_enable_event;
 	cpu_pmu->disable	  = m1_pmu_disable_event;
 	cpu_pmu->read_counter	  = m1_pmu_read_counter;
 	cpu_pmu->write_counter	  = m1_pmu_write_counter;
-	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
 	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
-
-	if (flags & ARMPMU_EVT_47BIT)
-		cpu_pmu->map_event = m1_pmu_map_event;
-	else if (flags & ARMPMU_EVT_63BIT)
-		cpu_pmu->map_event = m2_pmu_map_event;
-	else
-		return WARN_ON(-EINVAL);
-
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
@@ -660,25 +667,33 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
 static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_icestorm_pmu";
-	return m1_pmu_init(cpu_pmu, ARMPMU_EVT_47BIT);
+	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m1_pmu_map_event;
+	return apple_pmu_init(cpu_pmu);
 }
 
 static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_firestorm_pmu";
-	return m1_pmu_init(cpu_pmu, ARMPMU_EVT_47BIT);
+	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m1_pmu_map_event;
+	return apple_pmu_init(cpu_pmu);
 }
 
 static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_avalanche_pmu";
-	return m1_pmu_init(cpu_pmu, ARMPMU_EVT_63BIT);
+	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m2_pmu_map_event;
+	return apple_pmu_init(cpu_pmu);
 }
 
 static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_blizzard_pmu";
-	return m1_pmu_init(cpu_pmu, ARMPMU_EVT_63BIT);
+	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m2_pmu_map_event;
+	return apple_pmu_init(cpu_pmu);
 }
 
 static const struct of_device_id m1_pmu_of_device_ids[] = {

-- 
2.50.1


