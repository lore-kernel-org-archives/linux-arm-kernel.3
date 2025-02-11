Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F968C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 16:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmvoan1YqE/yKtA+UIeo5+2Y3tZ+vsFg5mxf89/sp0U=; b=rrJsV8K3Tao6LBIR8Uf2h6kwun
	m12l9URAsEGmjEc2LNcHQAl5XKzE75OOZpSfQRiDt2HORxXHx23tCx+RFW614YZg9KT9oc1o/A+to
	Ow24mfI1dQZu1SqCiB7aiJcZroerGxjmI0eIvr8DFWRnCExa3FmY35KQV5z0wC4Sy2ISyKuOuQQZJ
	tlgAHDe1KdTkU9pBHBn40yFCMsA2F63nzEij4/m7L8kSgsJYHw5Z17uoMrjk7ZmrVBhkPh/qU5GD2
	pJD8ZxrwJljDsSntNOM8DLe/HAwsqd3GIRq/sX8IKaEM2X/q0A87epEmaT3AoKoL5yyYnOUZjoy+o
	2vGNs06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thst7-00000004Rqc-1Lpn;
	Tue, 11 Feb 2025 16:13:29 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thso6-00000004QPt-2rjU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 16:08:19 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21f7f1e1194so74296585ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 08:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739290098; x=1739894898; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmvoan1YqE/yKtA+UIeo5+2Y3tZ+vsFg5mxf89/sp0U=;
        b=h6Zh1WZkpctRirYasao0wRHMgBWjZxBZ8eJBJzk3S0kJeyJVXJdq+JbTNt4gmwb3I4
         YNnhJ8Zg1QA0L5YQkPkewIUVSyNjYTyEjmy9EDXEocaqdadMUKE9HutiEfb4p8Lbx4xy
         a0V5V3CB14czyms/1+lPQoU7lJpQAZL8LOASy8II95OtjOH73Hmc8lhl9yPOTFbBBzeU
         UGj3a9xYjgYQwdJ/fiVYzg/vfkWwJE0yjvELuFhxFo5w48S96kfIRKawkkXBqQbaR/7Z
         ypuhYY3ROX5Bxjdu37KyUgManM8BP3yePpffDzplpUvPihVTEYT3JsQAiSqRn/MktE4f
         J7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290098; x=1739894898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nmvoan1YqE/yKtA+UIeo5+2Y3tZ+vsFg5mxf89/sp0U=;
        b=uxzumwD1rDHjcXnP/jNKsehUgyaGrOxj4hW9w379m8EWztUN6A67AJXz2/F0vOw1UB
         6OWkKuKkNKJTO9KvXS0C8tkG8D/TwmVkxCYugJbKPGKC9AvqeVFNSzDEoqqJrmh8gfgz
         TSjcapbNQc/vgd9hj7cfSIcHdGGol6lZuWMo3xuBxGGw7sh/+DAIN+gVthGeP/a2Nqqv
         3G+jgJRy2Ct9CspmipCUndo4BMSMeTXoQwqfFQ8+3VUm1WKdYDJYMhiCIPhaPP689lsB
         QXNFMo0ShPV5/8znEdTAI0bahJ8px4XwdM8P7l/w9m7iCkrHa+ab9G54HNdt8PfrJIYC
         jhBw==
X-Forwarded-Encrypted: i=1; AJvYcCXTwy3R+nb0QRn7Ch+QUYxE01/4wcShha3Wm0rf2OaXQrDgBeUaFkHC4YwYzb1oItAZM43ybBRFDG3R4OXYMwPT@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf+q0AvQWEypnxexXRShQKEJmrFKHHwIxLKbzkSDOk4M7wwQfc
	a0IFMf98Y3uRflk1XuxniUHDR3rISeVaoXNzsRgOBgi6mmdNUxEf
X-Gm-Gg: ASbGnctmJPRPang4oV4cNq29W/Wd02fH65LQyNTktsOLxn6LmX7dzWFXQSqWeXHiHjk
	JsISylAPn0XYpmqDhPK+onKtuCBx+NFoBEUMJCTMojHfisnE0gnDT4A5rcgrzY85885xmuduggW
	Rehjaai7Vo+429TvwB1/mn63OBEUkGvXLSS8wmNBW38uCilWA+QzQNCiZ6gnNiybTaAnxeIU2LC
	chU9LJ0y7IIXVQ25D7KnfGlKrvB+flkl2CEvPahc8WGayQBV4dVxIl8ewdvyHeOkJ/oKSly5VAV
	TY//zjxm+oIVYvCZNg==
X-Google-Smtp-Source: AGHT+IFEV+8GtRr4zcR1axgnJ8X+fQckqOO5KYT71vYUJNwCtdK0cLMJYzMXIm72XlvyZN+zJANN6Q==
X-Received: by 2002:a17:90b:4a41:b0:2ee:b0b0:8e02 with SMTP id 98e67ed59e1d1-2fb7e8bb5e7mr437325a91.28.1739290097691;
        Tue, 11 Feb 2025 08:08:17 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fa618e5e18sm6040478a91.41.2025.02.11.08.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:08:17 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Wed, 12 Feb 2025 00:07:23 +0800
Subject: [PATCH 02/10] drivers/perf: apple_m1: Support per-implementation
 event tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-apple-cpmu-v1-2-f8c7f2ac1743@gmail.com>
References: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
In-Reply-To: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5883; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=YQao7sB+3fLgHzETqufpNL42LDNNV6Hr1igoTgjUD9U=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnq3XnXLndYLpfjny34FvZYPhDDrIyS03cHytYC
 w79sFECftuJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6t15wAKCRABygi3psUI
 JHX7EAC1d8N+62+DY2PhhY4Q/8ox2U5uCGEglmpwkDWrE6t2mLPCYW/YW12eppFASRfvvYO6gtI
 lAVQruGvRRPrxs2QSEf9fgA4onFWwZrmsgMlWeS/y+l/k547j2mOMYwk5c777qbU3EgsYvqcE/u
 92nEdifj+nCj/grlNyT/Ru9rkUfGzCr+D7dhBJbjRYB5TIc/Z6lR5/E7bkODzQaa0w7hp8dyer2
 IihseH6TMaJvV9iOw66GvYwblU6JIDkaNfFpIncyXTo1ip6ZpbUyD6icClAYdRxOgEXTK+Tc7DR
 hhIcbqper4NrD6Ozi+h5fGdyNoHChvSIqpJ5T0N/PLBZVSuaepUyk68VNiAW9qBcq2C1h46fO+L
 o7LfJapMN37fyRRbj76ZW2puOvM9DylsWfyks6Te1MctNZ8vRcU3cE+0Jbc/Fw1Sui7sXUINwf0
 HQJzmFfYR2T2VMEJZZw/+FboENkklbPIKV3DEl38Hw8fqsIpHUbjglWimxqWSGP8PZcWmXCGEBx
 f7XXnB+9e+aH5KugMC1W23uCgTHuD7qqSmp/r1mKxFukELLlIUG5w4M52//nyeZiTnEGvoR5SMw
 Lv7jmJW032cZvbCyf/vtRnsDKKo6mPTOYygn4bi2GOoMol+UJUJrffVHOg+QnLCaGJiUZcApTFn
 /yLtwQl6DJvfb0A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_080818_727277_3E59193E 
X-CRM114-Status: GOOD (  17.29  )
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
index 06fd317529fcbab0f1485228efe8470be565407c..1bf7ce5c09846c699d66bdfcca129f418a9dad9e 100644
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
+static int apple_pmu_init_common(struct arm_pmu *cpu_pmu, u32 flags)
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
+	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_47BIT);
 }
 
 static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_firestorm_pmu";
-	return m1_pmu_init(cpu_pmu, ARMPMU_EVT_47BIT);
+	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m1_pmu_map_event;
+	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_47BIT);
 }
 
 static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_avalanche_pmu";
-	return m1_pmu_init(cpu_pmu, ARMPMU_EVT_63BIT);
+	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m2_pmu_map_event;
+	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_63BIT);
 }
 
 static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_blizzard_pmu";
-	return m1_pmu_init(cpu_pmu, ARMPMU_EVT_63BIT);
+	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m2_pmu_map_event;
+	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_63BIT);
 }
 
 static const struct of_device_id m1_pmu_of_device_ids[] = {

-- 
2.48.1


