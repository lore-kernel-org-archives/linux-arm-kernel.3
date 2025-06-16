Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE79C71157
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 01:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMIBDXt3IAT64Smd/QsEmSBW2Kr7RYH+ZBjKqzd3OdM=; b=pzOS7aNDG5knA1GrIvj30l1dqi
	Ztu5iqHUnkvRKD2hkZGjkhUXghfDAm2vNMR1R7cgkOFMooyozzftc955OMCyaL6FFfuJmhBttt5To
	SlODy2N9y6r8lrj8iCrpzmn9vsRxiHQzuCJpFBwQm4V4pHraaFIxV+22aSbcnpCKf0UzsjzshVf35
	L2Guj/ZqsW3Xg37RAe3kNEtaOjZSFBAX/GBbChgShkbYTTMXi0wX0sL/L6QQIj29cNHi7lS6GaN+d
	yYgQjo/mJcBAA24o3OWhENPbK+9i/ywcSMNQ5fGOXo+vNWZBd6gN0XFmFZaQfQpOOIiD8aSFp+YZO
	TToWPDJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyqc-000000035WD-3Rhc;
	Mon, 16 Jun 2025 01:41:18 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyi0-000000034DY-2k3Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 01:32:25 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-234b440afa7so39509195ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 18:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037544; x=1750642344; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMIBDXt3IAT64Smd/QsEmSBW2Kr7RYH+ZBjKqzd3OdM=;
        b=arB3QxozXWbG/kU5b4uDo713pC/IMvQU7uI77UeI7qv530ZiRmmtxeTuTH4Xs/Y9IB
         RD8AWRfMxZa0xUoWeEfoO82CG+xccH6CiRZ4Y9mlVs9dXQ67BYyszNnK4YryHqaMbJ5R
         VU402f7sv78nG+Y91Ccn10zpXlLW5gD9Y8n7gJ8lGz2YtPEzg09pk1u31BQSVTmW+2/W
         l59nDVsKtBiRvmmjOtMeImDNPauKGLmYldXkelgRtoyTmWj2lO5TqTRUC0eYui91mZZa
         N496J5GDwHEX27dzIRDYb287n80HEMMHZv/yMgALxNpQhY4MZkwri54SNDPUB5CnTIep
         AD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037544; x=1750642344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMIBDXt3IAT64Smd/QsEmSBW2Kr7RYH+ZBjKqzd3OdM=;
        b=eiA28Am9sewL0g6RYBjEoGY3+YoqdSnTxSbtfsYbv+HOT9Ts1XRppkJQ5l6m7MBMio
         kSupRCuoIBJrcwQrHM4DBbEQPpeGmNnPtaghevpHDcmqaXfq2FgFBvXR31QaoxcgNsvF
         dXk3fxovEPFohOrPHB0Myi1kBDTB1xt5Sk9C7yIh5mnj7bIVRdSIutTokhU6TitNI75c
         LHahRfkmTkRzpXZG7rvt1J+T+J6Zu2ioOq80hHol5TP+c6m0uin6v7Suj1cK19WEKA0e
         L2mBPor0g/0VVjvruEvqEksDkyUuh5UkaroxcYgxDnMC8A6tTmw5zEfpz8TVlqEVFXwz
         oMqA==
X-Forwarded-Encrypted: i=1; AJvYcCWuZmvP9VqZk8NhUKX6iD4DxKE0ilSdTBzBfrJ3sDM7qfzr6S7ICnOLliX0g7ACFpAVvCWMjOQ7oWq7AaP6PNLK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3vkH+aMjTX/VTJcmBxPQOVj42TLwo0q/MNoW33vSJirvdRyjU
	vnqPjNciAWiX0xefBu1l6OGqyU63S8BQLZNAsz3i4WiGsgSSrg+tzgD+
X-Gm-Gg: ASbGncuGIJ6p8VFoBo5pXS7X2/K1RQorMQ2qAhtGN5A3yEzPHeEwGM3bgYdtPt2SzAV
	qvZ+zbDRf5Kqdd0dZSHsHeK0y4vzKlcOMMwQLrrDTMC460JQk1uibksZPE8diX+TdvRHXgNeSB/
	2CYLrK0wZAKbI+vtuaV5Mll0bH2XkKscjAfcRPDbelVr47TNvcYqayHpdd/K5NZrS0QPNtOOUWo
	+xcoDlIGcBltxeujX3RDPQT7GASuqeXJKCxPHraNRjZmJuEDGxWcdPYJrQViZfSN9ONIlQkj0nU
	brsVPmRoaxsntbl1W7WlvxWIyjm6kvAu73ROywBArrElkyeHplbrU+dC5QDHW4JBTGgG8qk2Q6j
	wHcc=
X-Google-Smtp-Source: AGHT+IFbFo5ifb6sLWiBD4ZiNFitfhzcj3WWFMwZHiL8I71ydk2Cc0g+Icv9oBMZE6Vvn1wp8SttmA==
X-Received: by 2002:a17:903:1c6:b0:234:a139:1208 with SMTP id d9443c01a7336-2366b35021amr117932765ad.16.1750037543782;
        Sun, 15 Jun 2025 18:32:23 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:32:23 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:31:52 +0800
Subject: [PATCH RESEND v7 03/21] drivers/perf: apple_m1: Support
 per-implementation event tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-3-df2778a44d5c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5769; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=40iBkshuT7rxTV03RILkcUaTWGCgn/IFCgnsDvO8O/4=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QXahV7k8F70XGC8o8Vn+M6DTHkgzxaEC38d
 y4qcQliEBaJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90FwAKCRABygi3psUI
 JNO5EACIQXBLWxc0imgRlBPChuoQQfWnIM5VL5Ufyz0y4SiKP30ZAmXJdDNOWY/QUO67J7oSfyz
 JwUqWPx+W/Ms5iMRJdIPs4Aws2kNauZYofpLmodL7tF67e433vcP0zNGxLByA93inHyEvrEPc8A
 8owL0c+ZNPSTKSawT+g/55lBdo5KfSxxu84rwHR0EhRiAcf3OZTf8o4CVC47hFEuChiYEGkZy8z
 Kpd4cEpncwN1JJBdoJBaB5KgfhWjohN1h6uDpNxbK+KI35loLMV8hFT/m3p4ankqa1+8hXnopsi
 46Wd6PnIbOb9K57SntS1k/I/l5OgWvnu7ZXbH8IIGWeasGOxgaclXGloGUz8FW6E2L2u02ayWk/
 c8z6UchZ4dUpz8hpKnsqshsJPXYUYmNjdBOUR3hfnaOW2q8E3ZxhYtLP0fnZiRykjI+O8WeIZSR
 AuQdLPdFRZ0/0t++kMAfzZ6mK+ZhjJ25E8+JZtxvcH2tj4kpxVHD78D/NcAYwtFQh++uj7r5GkU
 c82evqiWwsJkEyNJjVE1w1huqTWTZoyhIACriNJ8nHU37wUofPkC5Vc4OmNAVuXhequ4vFx77E6
 PoEUhmCittodPDHqp1ssr10D7IbJtLf9ijvS7pnOzhcKsPhk/Je3Y62beFFOEulB/NhWQEGcXjx
 UZlF8ntNGkrUqcw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_183224_701138_2077B4B7 
X-CRM114-Status: GOOD (  17.18  )
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
index b800da3f7f61ffa972fcab5f24b42127f2c55ac6..c19a433ee6478876e4cf6667d7a85a193b6cb069 100644
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
@@ -494,11 +491,12 @@ static void m1_pmu_write_counter(struct perf_event *event, u64 value)
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
@@ -517,6 +515,12 @@ static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
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
@@ -544,7 +548,8 @@ static void m1_pmu_stop(struct arm_pmu *cpu_pmu)
 	__m1_pmu_set_mode(PMCR0_IMODE_OFF);
 }
 
-static int m1_pmu_map_event(struct perf_event *event)
+static int apple_pmu_map_event_47(struct perf_event *event,
+				  const unsigned int (*perf_map)[])
 {
 	/*
 	 * Although the counters are 48bit wide, bit 47 is what
@@ -552,18 +557,29 @@ static int m1_pmu_map_event(struct perf_event *event)
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
@@ -624,25 +640,16 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
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
 
@@ -661,25 +668,33 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
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
2.49.0


