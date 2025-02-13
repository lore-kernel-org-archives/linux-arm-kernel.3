Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219EEC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 15:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7l6OBjbdguvzVanhyg5QiPXwRgVYnvgdyH/pw82tHlU=; b=Yxt0jLkxMTdaBX3eYjS5qZudHC
	u4TqbDtrCY0GNrFt9YR6ojIx4WHY8chggRBT5XH3ydoMhc0MwNE1aSYXhNBIN1lQWJbL/PdXSXYpD
	QClC2Kvq85qmjSWBIFiQznHCL2S7r/TECkXIDQG4pXarbTPaqPit+Ze4tMdA11jo6xJnJVMp9QGsG
	ZGvdrRV0k7ikj6SURsejX7xy4o/eTaolACPtWxbyYz8H6XelyyJqTIKJB06qhyqiOdcazouM48EDi
	b07nLjJfNpqJNuY6H/q9S26/FUzsSa41PWivFjuXHQsDq9CQQVpxiaMWo+ZNIEqU+t1Qon1DuESgM
	6D8gibYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibLB-0000000Ba57-02jv;
	Thu, 13 Feb 2025 15:41:25 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaKM-0000000BN2y-1tIW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 14:36:31 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2fbfa8c73a6so1849004a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 06:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739457389; x=1740062189; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7l6OBjbdguvzVanhyg5QiPXwRgVYnvgdyH/pw82tHlU=;
        b=mpbhwJtAjnH7YQ8T3QGe7PqMIYbKYFsNoBroKst76CFh+hpT5f9aH3Q8eOB6K5lCU/
         gARikzAn/8jkGKKKHImseyEBew1r9m5ZVlVoDibWdE5CwBy0pmn+bu4UbD2fFKaOJNzZ
         /UvoqikH7eKRFt5BTzKGp3+Vlx7bBkW/7RZPNVu+hAMAPKWVool22lf6VII48kaRDnXD
         0eGeaC7g+uqirK6ioXRCk9e87Svh7ibNZnKKZGXVMEu80052KvOidlgptLP7EH1VSAzX
         m7M0YKS1OvqhthLW5mqARnX2ySaDbmWlPuviiM0Ckzg1w/1TORAa6R1fT1EfrvbOnaTr
         F3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739457389; x=1740062189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7l6OBjbdguvzVanhyg5QiPXwRgVYnvgdyH/pw82tHlU=;
        b=PX+RK+j/VS1AvJny9pzdgpNrc/WxKxzdZcoSBuUnpwikkFa2ka5nIRf44Ps2TKKcfA
         SOujCDoKkw6kgqIaBAhhNyQll7gJRjbmHANZQae3g/6imNGbXXuirftpu49daUUAVOc2
         v1/tziMyX4JXNHkFFRDbIYqWTx1S2xoofAVHx4Nvku+USXbnJsx+Q5av3AJddNIn07xu
         v3vjN0voCecaXRBQh4GuTOiwbn/8McBgH5He05QtabssPiHuxJeDUoajRn7SFBe/6fjV
         peA5vces4u0SlU6eVgrLuISwYW1elRTuERv+h4K/2Tntms4G8vu/riRef7YvqLQ91QI6
         a2yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYlpvWNBQ1r19XxqQfk7A40d2gKj4KbcYPuNkTF+NEkB8ZSG9z9Z5OsXZzc5kJSPzcu+tnOC3vxWmVq8lDhLYp@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ+D39E/WFc4Ipirk31gRusiGEV35Ky4eh7krMOLdM85PyH5u/
	/RFpzstyz4uw4jIXYOJVlX+9wgVVKzwe42xCMCKSXOtkZWeeJbD6
X-Gm-Gg: ASbGnct49mpH2CiHuJ6ekxHNLbjqlRu5bEsLTb/8bbkxaZYLLgIetOl2xc6FSvkvFRm
	ENL4Ja/cwAwc3o5toOZgrbxVw5l1FqJpk+3WWaDVcZyPqqf3Jn82lbn9Ss79eYBeQLb+LTl8HT2
	TcIy6IY9b5tP8JXMHcXkev1RyUQqq5AL8h4GFhemWRogP3NPRL2QdQNEySRhIuDEIJWtluS07NC
	uAYgRT8HOgnQF80p0AQSP5rSWGa3GaS2wbIFIRZhPGgQf7EROIJWmNOMFqEei25S9HTfG9kZtk0
	rlIAOgmAEkzMYWL8XA==
X-Google-Smtp-Source: AGHT+IGqqiPjx/xvESUvDV6JJP7KHZMh5lbCYmIQOaYARolGu9SAVW0ae8w3Wzy8lFkcnMAfkDpaLQ==
X-Received: by 2002:a17:90b:2dc8:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-2fbf5bb1d1bmr11556616a91.7.1739457389372;
        Thu, 13 Feb 2025 06:36:29 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fbf999b5b4sm3655165a91.30.2025.02.13.06.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:36:29 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 13 Feb 2025 22:36:04 +0800
Subject: [PATCH v3 02/10] drivers/perf: apple_m1: Support
 per-implementation event tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-apple-cpmu-v3-2-be7f8aded81f@gmail.com>
References: <20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com>
In-Reply-To: <20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5765; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=8lUtIdaUZ74bJi6U5U+SM7syFrwG6QLTTZ/s/7A0PwQ=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrgNiHtHdtlJEqZY86tRJY/Yt+POi1Wor9jrCS
 Ce3MhA2w0mJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ64DYgAKCRABygi3psUI
 JDubD/95vTRUzOF24IYySpgZ7RqMbgtInCO1tudyRQnMCGsmMQWWDDbZQqz97KbYY4joEXqa4Vq
 wxc5qTnq/0qSLtz/yxXf6iYRiQjCCsWODtIYs4lqxzBlqXy9PEIEG9AUQ5Ot/2Qbu9/nmM6XTdG
 UHIZZB3mxKl8vAnPPfUDtrUQ+ioKSUpObr4oot2VlgJG61K8tYgC7JYzIXdbeUBPX9olMsfmrpC
 1FkvsO13EhsUCsR+XpHuu9bjXx35OGyU16+4EgPZKUzTO+lxkNPtU01NkJRQkEpFoPBAi+L32+1
 mvy587EdAR0YCsKz1zsXdtPUL0iD1kJzNuIQII9Uctcxu6Ltqu0rfK13WqMSSJ64Z710HOnwV66
 4XVF7ZTdkkdJGCqTf32d9EOVYydymLmg8XVj4ZV/+eKOztKBf4R2KFzpukiDiCCF0MeCdwvBAG+
 9bce2ya2cg6Jf+Zj1/MUz8EetJpXAYfzhuEszjmA0N0XgLUULzhR9oOdkcvLZxU3oY2UkxH+be4
 oRUDw9tx83cy6FjB2TELZ/bxSGZNwB0CmGvDMGWN3EgJEa+hCMKktV/kYALvJbbU5toN+E9aBR9
 nbDz+p2+YP0GvJrN2UJJB4TAPOCkgGKO0E37TiXaNxUuseYfZdLkdawIvqA9uvr/NzUPl1aDYZ3
 380mztBSV6Dszzw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_063630_503127_E2708AA8 
X-CRM114-Status: GOOD (  17.15  )
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
index 06fd317529fcbab0f1485228efe8470be565407c..dfd5d72ce9f3c5bebd990b5df6a6823fb7785cce 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -42,9 +42,6 @@
  * moment, we don't really need to distinguish between the two because we
  * know next to nothing about the events themselves, and we already have
  * per cpu-type PMU abstractions.
- *
- * If we eventually find out that the events are different across
- * implementations, we'll have to introduce per cpu-type tables.
  */
 enum m1_pmu_events {
 	M1_PMU_PERFCTR_RETIRE_UOP				= 0x1,
@@ -466,11 +463,12 @@ static void m1_pmu_write_counter(struct perf_event *event, u64 value)
 	isb();
 }
 
-static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
-				struct perf_event *event)
+static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
+				struct perf_event *event,
+				const u16 event_affinities[M1_PMU_CFG_EVENT])
 {
 	unsigned long evtype = event->hw.config_base & M1_PMU_CFG_EVENT;
-	unsigned long affinity = m1_pmu_event_affinity[evtype];
+	unsigned long affinity = event_affinities[evtype];
 	int idx;
 
 	/*
@@ -489,6 +487,12 @@ static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
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
@@ -516,7 +520,8 @@ static void m1_pmu_stop(struct arm_pmu *cpu_pmu)
 	__m1_pmu_set_mode(PMCR0_IMODE_OFF);
 }
 
-static int m1_pmu_map_event(struct perf_event *event)
+static int apple_pmu_map_event_47(struct perf_event *event,
+				  const unsigned int (*perf_map)[])
 {
 	/*
 	 * Although the counters are 48bit wide, bit 47 is what
@@ -524,18 +529,29 @@ static int m1_pmu_map_event(struct perf_event *event)
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
 
 static void m1_pmu_reset(void *info)
@@ -572,25 +588,16 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
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
 
@@ -604,25 +611,33 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
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
2.48.1


