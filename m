Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB5DC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 03:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCbl29XIT1I4WAOKH87d2lc5ACONSBDEpnw9mXpBPIs=; b=qAlYPPJuxoVfv06CtkUYOvQgLe
	adkVnU2ZscHtJOR80e30yqu+nld74L6DA6dBkumyuAxNIu+vK+odU4HLTrA2iMAmex8aHa9BTsdZR
	O2zozAMvekpTfA7tggpK/6UAZkDechkKYcLssyip+ehVKaq1qkuuaoISx78fCE7e5UnfxCgRKgHoS
	N17C9v82Y+MCfYnlZ0ag3ol/u89Hl6M9+7/P7qYbCw5kTduQcy+AJJBBiyYSzjfwt6z5l/WnQxDWW
	fCbizxLKTPB2uiYuJ5NcbRqQfUr/NVJQqHfDNxaw55lXiORxm8IW8xxqbVVQV8Nnhd0GPfIqE2HVv
	k4d/8Zog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9c0J-00000008ER7-3BjR;
	Tue, 29 Apr 2025 03:51:31 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9bsr-00000008D2S-0bJf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 03:43:50 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22c33677183so57663795ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 20:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898228; x=1746503028; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZCbl29XIT1I4WAOKH87d2lc5ACONSBDEpnw9mXpBPIs=;
        b=FTPVBxNQmttCGvpVCc/r+AlPwtRwKfDtTfgZpC9aNFnMpO0C3G7k1s4IGFeRlmXaBP
         gI7ED9EcuFiQuDzCS1NOcQWC7tYmhZN4roJmSGTbWso7OLkyXY4n4rO2Sy/3HPB/CYvM
         nOyGVHFNvzO7R9w4u8pQej/d1+pFGNn1ZQEzf2cb1U5R/rIGgrXF5sZX2XpcqoVYkLEt
         BgM/XI8qWdjUCGfUJm2VCBxWdmIhrOvcZ9LoRWze3kSAR+k6X0MhO6VpCawuJU2XLFKs
         2PqnI4rjJ77VcQXWDSoR6sojLHYCnwzRnFhDLyN/SXncMOnF46K2UjWF6vOg+lZg38lr
         UgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898228; x=1746503028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCbl29XIT1I4WAOKH87d2lc5ACONSBDEpnw9mXpBPIs=;
        b=Qqi6I32F1F58G97EsX51kt7pkzTV+PoYnM9tyGL5Y+JZpxvCspQznXsFM50rBs+Muq
         9vBywbQhJNwTjXfqyFTVmqY51Fjt0GlXvaCzhTGl23QKTOxTWfXuOe8fdQKoulPrHvPr
         lilo+q1nklScDAPpPIV4nROof+a5WiOGIcEGkXLf7x0Dfq9wYVrwp2hoP7vUTDDFcqjc
         grxo0IphN1ZAhVo7Fvs/s21KQzdC6RBX17pqXenVKYpcNDmfvSSVUsuLCBMyn+Uz5aHt
         u8GFD9JcZmSLB9lOxOPI7SvN79X8ze1cl0ZHe+g08MdkAXrn9+DDrjL7hj3kZ2pTnAk9
         9Olw==
X-Forwarded-Encrypted: i=1; AJvYcCU9dHLcBiMO4N2JYbyv0kdq5zvhXjiAJz5J7V8nM88rIEYF9uc07gduro05GQNBfB6D3IBRFWLTQjcPjv8vr0Es@lists.infradead.org
X-Gm-Message-State: AOJu0YxUkObI7nCMDOshdSbV2ueuVTx3H2IarcZ7WbqcJl86HxCma3n4
	zJjzwmbYBQfZQpW7JKn9m58Othx08wO30HqN8vTTSihL3OZu/0c4
X-Gm-Gg: ASbGncti4k4VKnJzairgH5RR768Q6kCG6NeK6UYPI8H76M+OV3JbvTzWObKAVg9UUJV
	PCUlQnIREQ7pgs1Al+s8cdm+HkytwbIcveo1aHQniQhXoc3V6WupzP7b6xRlAyzCmSsNDmmKOA7
	F4mwqaJEIyLOBqGEg4jsZRShLKNNUXx2L2Ljy12L+cfidljdIx98nlYTsIUU4OhGDTXRE0qaVWd
	tpYNmn94djoYzp6GBNllX7igdfoZr3bTO8EoARsnGZhPXrnWWOoNnhuWoCtV8+OjO3sILTKTV9S
	d4ewrzKjXN7jvU6U89LXKqvU0XtGyO+VCLf1q/+AgI4I1SeEubQiaybPlA==
X-Google-Smtp-Source: AGHT+IHsCJrvrpLcRIffYAawzOscxmizCgBym+tlwYIHRq5y95ApU7+cc9L1FjrkqtQjqo6o37Lhcw==
X-Received: by 2002:a17:902:db12:b0:224:c7c:7146 with SMTP id d9443c01a7336-22dc69f5e01mr134266915ad.6.1745898228207;
        Mon, 28 Apr 2025 20:43:48 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:43:47 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:27 +0800
Subject: [PATCH RESEND v6 03/21] drivers/perf: apple_m1: Support
 per-implementation event tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-3-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5785; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=EJFsNO1IGYgWw/sW/3l8ohSThIK8Gp7CsvED/Dkp2Hc=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErjTX35Fv0E0u7EqQ2vfEHXscywKJuACvG2/
 SL3nVvFSSCJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK4wAKCRABygi3psUI
 JDZnD/0RjQRenoIjFQor8g0BlsVEW7CRgD5aDQlBaqF65QKmTqkAgwKBAzziC7Ixrjm9/+MOMNX
 doPjI3XBJ4whqE6O6LZ2888SGla7RDLsm8xYdHZsm3MmiOnxZb28SILzJaXPQ3ebJUs4S9Kfn/9
 T3y8lq6DBAtqOits0gDllR4v80bfZy4raL8nGN0rgF0dA09N0KWI478JlxRx6sndo1IdSQ8shJm
 iXXIePzVhYuzf5GJVPteq6CDxMD6lfvqtIunfSdZemIS2LOGz5+J/6MUP1hODEXGbt4qpEW8Ep7
 O2JMcOh6oPdndD+fI1MOcgdQ7EkNJkUHbyDeRlhIuqYdSMyoheR7VdIln5IeaiJ5lO2JrpIR2z7
 nW+Z1wzMv70BEEM2sYKqQMYa6gn+JpRrlICLrxhT9bpUt7JeR2thocEsHIvkxxd+pC9UDmdc8kS
 Xz6K5JnBKKIH4VwBrSSIQycAw+7jZFiq/z8aKTs3v4SZ5gZF0Mpxv06ASuUh41oYApUzm5wo7cG
 pU7CP29JGA2lb8zclJ6u7WGgsSYeE0KOnFrJSwo+Xt/iKODva4RAVAkkj2dLMAdSfDPc+UwbDyI
 lVYC0L3ok2AJr/FJqg61t2Rn6gcfXyk/78VRAK5uv6JTabxZX7e3F3R/qgG9QV3d5KWvdevelrF
 NaU4omtk+ZuCqGA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_204349_191848_4987D91C 
X-CRM114-Status: GOOD (  17.67  )
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
index b800da3f7f61ffa972fcab5f24b42127f2c55ac6..d1bc850809993de044df8fd5d4dfc61341482ee7 100644
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
+				const u16 event_affinities[M1_PMU_CFG_EVENT])
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


