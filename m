Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A34C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFekoXDldKygq/dqiamLEfKAIhum7ZAFgMUrKlaqmBY=; b=sFo3aeCGSR1mzcN4D3Ae+D0rqL
	0jLdyKllQ4YfNJzfaCj3Y5vvQ+oKVs3CnoJQLrzwty4kPmQA9IbbnRCg+vuDowhCgn1D7NrfI+RVj
	SrWZxvRKaAU1aHj97fJCkDt7cElO5Wlx7joVbj4Q1EeUTLPDABvXIo9sAKY268pocm2Edx32H91d0
	bLdAQVg84AxOpsGw6YcsZLcgN9NuT2+Yqo0/HKxNi8YiEPmyg6Z7Q5qHffa4Gx6ZS7qnZjvCegOdv
	qh+KvyaBV7RPxrHtcM6BfZaxP5cfb3fPJp324nO1p4lcqz+QBsRo5hgC8Ibb/QiMb76Z6Wur3OL6j
	k6d/SJcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGYB-00000008KF3-0C66;
	Wed, 12 Feb 2025 17:29:27 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGS2-00000008IoM-497X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 17:23:08 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-220c8f38febso12610725ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 09:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739380986; x=1739985786; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFekoXDldKygq/dqiamLEfKAIhum7ZAFgMUrKlaqmBY=;
        b=NyYSKAZoDPJza4tAlO3kELgqsN7C8LRvBFuzGpPTxWXIMuwdvWqEmq6zsjbIqYM6Dy
         M45yxfuwpPEBX0pgGumvC4hOj3WrcuuF8N5vqbsDebdvY54aaNIPA9EhInXv6NhLIml5
         SA38lfk2PhBcBeVUFJbz1Cj3J0TB4dizBKKhxctO2WcpH+Watedc8VopfhsWWfJoK7PP
         qau9VDc6OtYzWehxhGp6CH1AGFCerOFQNm0uQfhQioDYS8m9n/IRbaPMwT8H746JxfNN
         i+PHYd9aZpogL0sCVuQxPahEcdjneDpmqreOefIT53wBo21/t367/GkAbMgBSV6Rgiya
         KeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739380986; x=1739985786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yFekoXDldKygq/dqiamLEfKAIhum7ZAFgMUrKlaqmBY=;
        b=B1aO912UDOkK3c0wph65eELIELjd7XSTf029QuLI+Ng+iwSCSIAOoLkmtkMZd6Ar6T
         ZW3IDmCnxWC0r7fANMnBZylmtr9c9/o5l8runqvUF2I2qjqpZ/gsUurQm6LIBT4emBX1
         TuLlIINeoNfioJ5UT11yrwKjTZ+UeIhB4dVLhMxXZ82JUHz1P5A0kGjXxb5IS/ikKH7w
         30kGbAoAwmN2bXVD5N0trwVd/Jn0MVh5wrWz10+8UFZLt8mgFbRx1Lwao9pxtGVtag7W
         HJsR6Op+GuUZcQdGwyW9VRmpeBvYXYnjVXtrUTzAnyW3j1fWO1t7+csuo7vjjHmN4Y18
         GKnA==
X-Forwarded-Encrypted: i=1; AJvYcCVzuHLpPqp2oIB5vEjTNwYzXVwbQv0iayid5YwJ9GyBay3raHYR9M+lw4rPxFN3Kau6oxO+fxTIGXPVnPmKzJ27@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb1wzRhwr46nDZ+d8KRevMLE/GCxO/AWC2elBhgcmPfaC3s3QR
	t+2pPZrg+n0JBFrPqLv90SDBRDVCf+4mrbETQAdKGYJSp403mmcFrAu6XQ==
X-Gm-Gg: ASbGncsh1mTt/e0/hFcC3ZIHkS9JfIoZzTUDEcIw6CiHBmgEgC82hopH3mgnZHsADiL
	O7IDbyhek93JCY7tvbw/sQTPYHGTxDD09Hm6rgvVriEtQTqsQtlOk3f20BP/kukPqya+4Hh0jtO
	g8nYD8Bv8b3sepZrD1dx7G8aSrX08zyzPDv+B+FXszIoL82vFGWMCyJRoiTFivuuDyitWSpQoHr
	Bp6iPpGrzRPlUuvv40jv4zEGhJLLJF0frYftVJ9SwyayDrHnOenGiPVD76/Xs9YRTnd7+zp1CUm
	ctfXeERX0mVMXM7rJQ==
X-Google-Smtp-Source: AGHT+IG//YxahrclczP1AC225IHf0ohzcxjk/aV5E60f9V/aou3rm6VdA9YREiMvUx6GHuijzcCWYw==
X-Received: by 2002:a17:902:ef09:b0:215:a028:4ed with SMTP id d9443c01a7336-220bdf13ba4mr57434755ad.20.1739380985984;
        Wed, 12 Feb 2025 09:23:05 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-ad54f1691ddsm6001705a12.61.2025.02.12.09.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:23:05 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 13 Feb 2025 01:22:25 +0800
Subject: [PATCH v2 02/10] drivers/perf: apple_m1: Support
 per-implementation event tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-apple-cpmu-v2-2-87b361932e88@gmail.com>
References: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
In-Reply-To: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5800; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=b4/Mn/CXmCbLpAt2Gw4jqi0tjGVxwUxbkqr0KY2PlmQ=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrNjvWd/NLST/mP1GA++mV92tW72Is0gaB7qJr
 d/nO+CCiDCJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6zY7wAKCRABygi3psUI
 JJ2jEACm/BvK77HH4KRIcztqe62ud7DEi/OMMgxLuSx7z3aXqwI/uI4PVAP1v09czqzFV1OZTB6
 KoXt+0/0xcixC74zlT1EHec6sU4DHBNR0XdPjWG0z+5Dh6xNqLOIRtxmBZKnci8D4bLXtFqXCNR
 XPaRWOg2QRvsRUcnLRa081j97g8JRCMoZo/GKu85NMY6428nGoPPJbe7Dfteal7kR6onOfk6+Zq
 wV1OpUjazSbwrbXup5u6sA0EUmXxH3rMqbTeWidncypgYC8jfR1mCmlrOWRV6jdZ/6GKRicKgp8
 kVjX4nscihV+ST1aHgOP1Avr74aa+h/C17gb3M0JyLrDSxfbfFEqW+hneGeOFrbcoGYCWrg91Du
 bfCjlCI8n61YKsKSeEWG4LPHjyJdk3lHiKG1ZWUQOUEAN6E25w2rDaR0v/vLZSDqr1EOgm64LJo
 MYuqCX6530jxXaqI6scy+3LZiSb/Et2mDWZlIpkFzKYaBd5GDX3GU6ztvhy26YTfJnmoazQBLc2
 m/aI9SVHfhU7/kO2/We7qiwXc4ctRecovKwWVFmeN1BK6+/+co5VUV5z2w6YpNx/o0GwSJJPFzd
 vEzuBt0GF6Fjuggh9TkxvB9ABsAKSRxzlB9wRdWhHjyVmJWGoU0xKGpziYHXJUTIwMhcI6kGZQ7
 oa0U90GkkDOfAGA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_092307_035860_BAE07E82 
X-CRM114-Status: GOOD (  17.38  )
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
index 06fd317529fcbab0f1485228efe8470be565407c..9b26d5f35d91b715e9ccb7524a3ca7b87a4d5265 100644
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
+static int apple_pmu_init_common(struct arm_pmu *cpu_pmu)
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
+	return apple_pmu_init_common(cpu_pmu);
 }
 
 static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_firestorm_pmu";
-	return m1_pmu_init(cpu_pmu, ARMPMU_EVT_47BIT);
+	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m1_pmu_map_event;
+	return apple_pmu_init_common(cpu_pmu);
 }
 
 static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_avalanche_pmu";
-	return m1_pmu_init(cpu_pmu, ARMPMU_EVT_63BIT);
+	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m2_pmu_map_event;
+	return apple_pmu_init_common(cpu_pmu);
 }
 
 static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_blizzard_pmu";
-	return m1_pmu_init(cpu_pmu, ARMPMU_EVT_63BIT);
+	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m2_pmu_map_event;
+	return apple_pmu_init_common(cpu_pmu);
 }
 
 static const struct of_device_id m1_pmu_of_device_ids[] = {

-- 
2.48.1


