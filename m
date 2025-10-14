Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCFACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKGU1abQVfuJ6I1lGgEqdrdZCTshmOZZLCi+h9rWnIw=; b=viIp2/igD/Tey1jDGqL4yMFFNZ
	KmNyjjUJCJavm4yGdwvCJeqsFvSksQDZ5aEJ+aHE58DDEp72wbNcspcDiMaf1OrUux71oyeDgsASY
	kt1vlamOF1YXxb3Ho0OxiM1KHK3jKkm+4Te40lAKAF31Cng9dBbsOyD31NPJfcuyqRxCNiF77ONRV
	8ZFzfNCzpD92Q23y/44w2g6usr9a/8bg+eWyFtihTfnR53pyv442NwQg5EPt7k1/Yh0HRe9+a/iiU
	JvWVs7wrkxv0kxHq94x77f6meRlLSfrBbidskY0MuE2W/MvKXGtI2aZVixS6z8kRG0F7R/vybCcue
	b3rSHkzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gZm-0000000GigT-1ZWg;
	Tue, 14 Oct 2025 15:04:34 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gZj-0000000Gidf-1LFA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 15:04:32 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-781001e3846so5320561b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 08:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454270; x=1761059070; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKGU1abQVfuJ6I1lGgEqdrdZCTshmOZZLCi+h9rWnIw=;
        b=LT2S0908u/IOGf+CdaMGzkRndKb1VCO8mN1/am4ny/H52+iHzQs3F1uYBB3KM4m+oN
         5fwyrS0sHRHp9AEL6MenoF9DZLb8qK5IBn849RGmMe49mbhWgftfrSeZJfqOHXmwNhgW
         yvxv27F6uw8ByFXXpvOk+Ck8gLFw37CfRy315pFsE6HONT/NBLXEkokGQOvpviuN01PC
         wqKHRkZurBA/JkoaF9cIw7j9qLibU+X5txrhdMXEAtfuyBPCEugut6LGNPg7Rb+uKtVu
         G3UHJGjwgJOnonvl9iA0jefwPXVbRFYhiG1i/VUEq3qeBicuI3MJCIVS44kQKqJqt5iz
         dq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454270; x=1761059070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKGU1abQVfuJ6I1lGgEqdrdZCTshmOZZLCi+h9rWnIw=;
        b=OGfZ6QJw5xU1UXYZ5fjSgCxKU3OqohvbvNoilkBmLxFtg41uSvVp8g5sLN3Emq5UgJ
         Tr9xYrdkyqbl3hJi82UMNeapyn7UxXxRIrfe+H6DrZJxhkNGHzL9Y4lRfUBOczIsWD1m
         BqWRiy4dKOufJOEOOSDQk72mhVMy26OtBABfCxN4yJVghW/3zG2mT6PL47CBt2hXg9en
         lh6eL/dUWXQpTvhLYgKoegXbdiXGDJH/C0bjKXojTv0pMav/GFlqVe+TXGlBZr7UPVEr
         +5HsIL9AvVm8TJfbe9oIBWsl9IW9hpLnFxpn27xbzS8M8UmwHgE7JhCs9SgNZK3aCHfE
         ExBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUFzEGIpuTjww5mfheGbWc04LIeEFImeGyDEhoSSDe9lNN47dr498LWbK0dBo1H2GAIISyF7zCY56U3x4BSea1@lists.infradead.org
X-Gm-Message-State: AOJu0YwphcYAnAV9RsggPjUJ1tJUbH4xur4yutddo5ymRSO4dIULfCHC
	YfL+TzJkdTIsfBF5utF8fF9/B2+KHSrtFKkonpH+CyNA0qRGRcb0hMBE
X-Gm-Gg: ASbGnctoRfzRIUHpLPz/I9Ax/CMgYjCL/gDniJY4Yy7QKp5xA9+zkSf6p+p7CQ3+g1z
	p8oeDCeI0prbuWY5grfbswpfSuBnxwo5pM7A0qV9OJeOzLVwYZrrlEp+3OpRtr+J9PANLMCco2I
	XMt7OVXDN3rU6Y3muDrmY9qyrSi7w2T/egAYp3kr93yufAkJ8pGMO4S/Qrv/b8V/+Tj6OpkLUXS
	FOkz2xs35oi1+zGHNHu7w47afiH7iuG+eW0PKXEZ8mk9s/1ot1cHKfVvb2a92gtYzaBdYte3kdY
	Vylkqd+bTu2jXFC6NstfJlZrx4r3VdjlfZIIcw+HFl1BwNz7MvAjt3XICKItn7Cv2WRT0sHrYrc
	790rRFh3GNVLXMDvqscLRde0HeeB+gxtc1J+tQyi4DbA/UuHB9j9sNQ==
X-Google-Smtp-Source: AGHT+IGn9ofuLs8eQ7ej34Sc9yoDNYgiACYcK+p77Fp4lhiP+L+rchOzwCG5t7CeGEM6RreDtUL8hQ==
X-Received: by 2002:a05:6a20:3d1c:b0:2e8:1c23:5c2d with SMTP id adf61e73a8af0-32da845fde6mr32193612637.50.1760454269685;
        Tue, 14 Oct 2025 08:04:29 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:04:29 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:36 +0800
Subject: [PATCH RESEND v8 03/21] drivers/perf: apple_m1: Support
 per-implementation event tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-3-3f94d4a2a285@gmail.com>
References: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
In-Reply-To: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
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
 h=from:subject:message-id; bh=QXdFCVGEPqTyu8Bm7SIf1fxdHsV0PUqAo42n6ezyRRw=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZsqjEa3GuOXC7NCs37f+fSqA+5CTGWWNrSX
 z2iBaCWscWJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbAAKCRABygi3psUI
 JIo7D/wI0HMXMQvqn2Xs8Mnq7NhEWbDiLFr8ZI8RN+NuDGplRl4uIoCIEILIrGbRTbugUXwoQ2e
 UPONH6zO24lJdeyOXd2RRLB3m7M3TQz+jVPNIqvvLg2WIty8RjMSm0jr6QH5HkNRjfxXXeJ4z2H
 eLVp/AATczKlH8pi4NILo/icFgq9CPU9HEzy3m6DtEdet2OBid9UEQo3wxwwQhmuj/SPRl++5C6
 32Bhqmr23qmX0StN1NN3O6Ha7u5hDw85DZIBQYtM2SH++wgEt+2aQZQAgjIQ2GjRNTalEEpnOUg
 Ue/TiQnkVyP7JCG9Q+lX9wj3du5xJcKq1dd5vStkM+fI4Ee6c+aBYKPh356ZNs7MHoeq+Hah2Jf
 mUZqgBrit10FISRiuzm79aHP5vnjX/j+M0pA2Z8xrqUoS+fkZ7Vw5LpCkvglYYP1oWl4oN65uGv
 V8BjUhr6hH1+R/dD/jqa336zxaLV+8T265xVLc/RuEAIMXQ3FjdgcjKTllcrhgVQjuwFOMAk5yT
 4OvXjc/qKsd8kCQv8y03d4n9gr3QT7kSsTgAtUD++NPvDUcjrA9s61AIGPDjsbIFIEdEAVPBNO+
 VMLcmSANzUOuOgmW966IemyGrPgYgGGlhBMa4wwoYr9/X71/kcxTIJvH0cM9TvXYgFaelztY1zN
 KWUdev4lRtP0h0Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_080431_390917_19DE621D 
X-CRM114-Status: GOOD (  17.78  )
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
2.51.0


