Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9908C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 14:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7l6OBjbdguvzVanhyg5QiPXwRgVYnvgdyH/pw82tHlU=; b=V2CZbBtvfIuOXtFROu9HtFdosK
	PP4Y232nBI+aZ3RYRdVmEytvLbWUVza6Wun8davbKbapXv1lg/fxV2m3cB4zw5PmHCZy19uOxutF6
	02TH0vWmNJdMZpsutS9jFTkyBC+4x2QSS0u8kvws7WQWnEIGN7AkVcvj2d/94kdLZluI00MPmnjn/
	i3kx0Q3aJu9+T7yD93IlaEwvgSpeInPi02SxIyMH01ytQYkz6qVhPznCfT92yltZeCKCFqlFWtBlV
	OgqHOg8KE1jDfS5xC+tGkRHmHjyxp5XK/dT6KQiseZdC83ryAwvRiyg5+XjgLYUUUsoW/1vZoXbgm
	J+hjvxNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwmN-0000000FAkH-0bbE;
	Fri, 14 Feb 2025 14:34:55 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwiB-0000000F9mU-3q1F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 14:30:37 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21f78b1fb7dso37052345ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 06:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739543435; x=1740148235; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7l6OBjbdguvzVanhyg5QiPXwRgVYnvgdyH/pw82tHlU=;
        b=PS1JxPTjgJjmqgWTP1nq6qMFUKRRFU5TfZa/fG/06o0eEDXa3vfxBnaUJNiE/vBqS8
         slT0/+iQpEBsWaRd1OpWISIxLPRhPPjmH3oZp92GpqwNhGZ/t2MZMak220FsPfHTpYA1
         DK6KjzAeKF0eEi7TE1dNihUWTxHKyokfC+HcDoveQ068yUZiRq7WrDHwdDLGYTjspeVz
         uQWUl/f6TweEuHV73mU+DzZ2SJ+Z1Gb0MBcoK8YKGu2TKvG8yZx3hSVcrJM/90a1phaT
         60U24QSCkuuktTbnDcxPRvYXMs1H7w9UglYXvU5DQAYUq7nsEGVDZTYbCpJG4FmCVtgO
         CmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739543435; x=1740148235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7l6OBjbdguvzVanhyg5QiPXwRgVYnvgdyH/pw82tHlU=;
        b=vbz3nrrBXfTdW6UxiP8XYABqsyTriy4Z/er/VFm4QjXtzWNvEvn75FyouU0KkyghcG
         h3hnRW+0oRWgj2Fj/xmdqoQPiA2KDMBgpf6eJHojYv2UeChzxDUkgn3f8MBhHskmxRDb
         gLGAG+GYlBKkOxgOTzDb6D0sZwSqLTofmiZ9XtXMvG6asFEMxxqhEjE+iq9Qk7GVg4SJ
         M6TXO7R1VlPrfP4jWarBGGYZpDnExQtcGTiTCv48yHoTKlTb0CPuaHV/eg3PCQL9aE+0
         Ll+qrph4Z28leMwNRMlyK5TNFrkmKFpVwZIMiWlcaa/RMCgxvKfcQOpwXjGMZvFvb3RY
         gbdQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4ZVRS7ssWKIwP2RTre5PvTPyKKWdCQVlB/wA8KvlEJR3Oj33zLlYjQRCKHe0jncfokEaC7i5fD19OeL3iu6HE@lists.infradead.org
X-Gm-Message-State: AOJu0YySRLOHUnceQ3+3qVumhmKhWxAd2b0yC0MNxWtdbEwlRK/SdCMy
	hdlfNaL0zJMH3CpR4rf5B72PeqnY4cHvIHelUpNhOhgtD6HnwQLr
X-Gm-Gg: ASbGnctZydXuHkxLvoawJvVSrVP/JIziOaHSyA5bUf/x0I3HL17stHbqvn6GvZvtDCz
	OHMaRIb+gRgmvglAgABr4KYgTe08hzt17G2IUa2pBjGKTt7yva3NX5hzarZLjCyI5vGX19LOLmQ
	hYNi6+q4CT0uohCf10TWcbMuTgTJ0mkFRipPC5THcCY/AA5BacaHl+O3DSCr5blETy14EmFDHcB
	hug5uPeV7u0ThPdOUlMl1TF5DOgiZZQ5hiVDtw6nc1RVZMVLXaGiTf8t04fy1LybqO+6saqA6Zm
	p9bbGqxd4O2ZGGOC1g==
X-Google-Smtp-Source: AGHT+IG/bVbomX6ZL8o6cgIyCYELKgNnLgDTIIQLfhKHH2P1Nm6zYVwBqR15+gUOMU5DTLQtOl4QHg==
X-Received: by 2002:a17:903:2f8f:b0:220:e991:480a with SMTP id d9443c01a7336-220e991e31amr71970365ad.15.1739543434789;
        Fri, 14 Feb 2025 06:30:34 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d545c8d1sm29490315ad.113.2025.02.14.06.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:30:34 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 14 Feb 2025 22:28:28 +0800
Subject: [PATCH v4 02/11] drivers/perf: apple_m1: Support
 per-implementation event tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-apple-cpmu-v4-2-ffca0e45147e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5765; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=8lUtIdaUZ74bJi6U5U+SM7syFrwG6QLTTZ/s/7A0PwQ=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnr1N/KjjlLGW1G/Qu5tuyuGcZie4elLqLg+YmX
 2T8QHqcdfaJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ69TfwAKCRABygi3psUI
 JFKREACwe+jV0g2vw8XAkjbC6c+oIJnGIRBrYdcOt3TfoV+rtn9faFUL5TEIdB444IFB4zWiERR
 DSzCT9Hdu/4mjo251rfhx55Blzze1QKW/3riaQUKfjg9/lY/1M64n4xfVQzLagAH71oiYNO8K1q
 l/V42F8xJIlIxG7n10pGc8ekOw/1zI8yyRrxpkQug4+/0bq5LAVQzTevxJC/EARux7v1yyS0APz
 gcFrnABtcqKiIJ5FR+5+/0N16UGGJTmBKbDnp4y689Vf9I8k6/XpTMh8mMxTEtuW+koR+YwI4vH
 CrYLkuZ23M65EJJ7GZyt0AtHMxFxRCtYTOnkLRKgjGYnRnXUzE83T9HQsom4vdfb3fnyDz0DhbB
 lC1N3Z5GmL0TCAWhnvXtTrUwHAa0v+DBnbOBx4gpordKhpk8CWoTKq4p2zoIyACYGPC8q2j+hhI
 JMOPIogrS4dM+99g8S2I9nxgrwkFoXIpLLdCUR8Q/dYo6ZUyVfKV8xxbO09/88t0zc9FRewoMJH
 cYNhpTbZ8/NgqoVrhyEOZ8NX3ZQZvDG1ie04xcZn8uQvxiaqYVwBifBSJD9FcNxXicfZ1f5AR7w
 UBafRRr751U+c+yMRgQNIqcCa32/+GCzYIt/+7oa1TZTzPpxKNcHeAusCKpSZ8Kx6JKqv0ImO3v
 cbqBxbcEMah8Ljg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_063035_950204_D6371C71 
X-CRM114-Status: GOOD (  17.28  )
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


