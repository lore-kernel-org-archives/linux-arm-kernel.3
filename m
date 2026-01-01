Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DF0EEB56D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 09:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=baePLKadh5VeuMN7NIEHaBw4znqNJn9lrkTnuuN/n4Y=; b=XOhAqcj65r0Wp+W5RaacyPBPQ+
	d62NLAidFRsHV6bx9ZGz0CIDO7oiNtmAj0+yhXuNV10jdaWREw/XQmyA7DLMQ8LPSsyOHHG+Q+L3M
	jviLXNKSupzlpAgnLkeNkTU0iK23wB0a9MJu4Kq42v0AQIFZ+B7TDikYSBHFLHH69B/dzio8cO6Xv
	T7otPPNVpWIrDAvph9jeKiJbhe6Q+o+0Gv6yybpQthWWQcBGuoQMlqL14lJAu6h3NLmDiNsfbSaXf
	nrMqiJCayIRu1NVM5AxQoKkZ6ksJEXEa7ioHEy7sp7FujE7o6CVmQYoWQYBvse9QGGd0btWrcm8NV
	JiIXe14w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEa2-00000006iZe-0wLC;
	Thu, 01 Jan 2026 09:02:50 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEZz-00000006iYE-2DtW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 09:02:48 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso11690616b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 01:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258166; x=1767862966; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=baePLKadh5VeuMN7NIEHaBw4znqNJn9lrkTnuuN/n4Y=;
        b=PK0BPxy3T7BSVTyCyIJW3usgfpQLP/nl7KKQzK8TRBGZ81jFmPqfwUOnaLx81oorEf
         fz59y7+P+1NIavdTgdHNdfemwaIxNq3Csup3uZWkRPKnZl/ho2sVtcn0PJ2IocDQLGH5
         tCOH+bM4kg+Ejs6mOtC9bi9GH+XfDeSdPnKW/Yaay5ByxQ7RF+wC9DEA53XaFgfKEyyL
         +ZXMcba3ikJw3JQ0nikcal2/JiSHhTnvBFGiwR2mp6w3/Yt6vW78nlbCzXQFXlh/nylq
         26GeEiwwY+p3NquOnN7mRd8BiIyyTGDKMmb06c+UhkYQc01MyF8L7LdFd6IzMRjT2rRC
         CQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258166; x=1767862966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=baePLKadh5VeuMN7NIEHaBw4znqNJn9lrkTnuuN/n4Y=;
        b=qmR10UT9Rm8edRSojZxHeqLsds6WTl2ztb9C0qfheEeUhWNj4zuE3lTqdcQBRHeHvn
         hN2BgKtGW3Tn6it8RzLyZLC8TKATodVg2Jb2WjlFFWBbSWHvR0kpHnkz4IB2meJJiDKc
         7nLXqiSmqpq+HJqXp0yIKXmieVg+XWlYMa/1Pz50n6SqKr0yPv7aVlvCaNjSYC+PthlS
         L5WZIhIyLM3VVaQDaE+vNVm8QPNA+qpe9xvodoo49Hv+ITxB1WqiBrdr/35C/Cyw17vA
         Px2u56f66wEW8LbM3xi9Tt8pK6Wu1I+juYAiDg6GfbegdsYAef/PDCIZw0KEyLCQOyp4
         s0hg==
X-Forwarded-Encrypted: i=1; AJvYcCVfm2YjPtXVNuUeMw1kzR6oIdZBMa+N0rmiowo8FcHPK/+pk49newM2dWv68LwCxpcq+i/8RJUNGh8zo/n7/uso@lists.infradead.org
X-Gm-Message-State: AOJu0YzlU93GvnXZJZae55nzV+BuHEfEyNW1ejYdrS8KHyEQQLFHtzs6
	Z2pLO+OyVQUEKMMzSlzlD0T+tdvPOeBV1hxm8VIv5HsMZzHiJ/GuGuvW
X-Gm-Gg: AY/fxX42gRHy6MOgDW3oE7NLzOmbUArwG8CpHyVr9+sngrLIbVYhJr7qzjNAt5roF8y
	IKGFYoXIKtEUYfRe1OTzXITpSJUI/Pw0/m3HXeBotwYvy2TJF5Ce5lqwCqNjEMYYZtUHkUJdgHl
	nT2kOaVBdc14yKbHGMWAaUEZg0dQV9nx/9eC67OrjEGGWasRRSZv3ARG9ocjtW2m9pbVn6yGxSt
	WOE1KcxcT6rcdsZiB8a7bM7082Cu380j46PUJRAniXzVZAbWeWXgf+hg/TgiDM6fPoRPQXuPU38
	75D6amMDY1oyK2vIBzLJqVIqJoHFAcw4TE74y6MxIxUEumUK9UC5niosgxK24MH7vB7CqWDITa8
	U8yDblRW3amPvEb+nr9Qn1IViEl/8yzdsBeXn267O32wBYuPHo5PRKN0NTpPWv7UdPO/bHg3Ure
	mkUFrQ/suRghE8
X-Google-Smtp-Source: AGHT+IFwZ772YgX24ZCsCjr+hNHZNgr0GI3d19+sgft/Ou0eQbAfXufEa//uY0SOVefkVsaor2Gprg==
X-Received: by 2002:a05:6a00:e12:b0:7e8:450c:61b1 with SMTP id d2e1a72fcca58-7ff6607e32emr33228421b3a.33.1767258166521;
        Thu, 01 Jan 2026 01:02:46 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:02:46 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:39 +0800
Subject: [PATCH v10 03/21] drivers/perf: apple_m1: Support
 per-implementation event tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-3-48812c529ffc@gmail.com>
References: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
In-Reply-To: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5769; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=GEbwxw7PfrqcXKYl5oW/iB71cJY49weGjklHwoM3hyk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgmVXJdJ9wiGFSfn+XJXbtAUzBTOK1PCJtPb
 uHglwMaztyJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4JgAKCRABygi3psUI
 JCkDD/9HjpLV3d9Ea4W5AzKeFkIbEJT3mGFLnT/U0nlvbcqsPI86Mw/OearuqCYgbtNxU1vSZcn
 2NSS7OMmEOPuzBkfHF+NevT82KYdymLbVeYeJ3Oxkucwsmo56qGSum9GqiNixXuABeOZgS4JRGs
 kAN+iWwYY4bOb0IWRlZXubM0DnoCyK4aN0R8U4mKTdONj7ZlPf4mflqQainGasQM5ve9ITww3nB
 CbzRRZGG377Ty4ahbbzeQY8GhUGT0R/KV6s2eaK7BLcXCIaKA1+PCSwpcmfy3u76TWx9lSH6twq
 P2mPaDJmDjP9PEzjwQAU5vlN/Krklhl9+P/b6li2FTTS3EubYgUYd8DK/nTE/oDmnUu5F7ze4XO
 oKOM6HX++UVLX84At0BfUPOUhnkn9HjWjI6XqXtlNQOl1iZg1bamAR6Rgh4zubrk1GVfsIW0JwE
 ceF8e+/C5+K7pVgCY9SRTiM+QBK+dgsXrFfrZvS+G8opt4+Ug9ctadGRAI8zI/a06KH/ikncbVS
 G5QjNq5f5iXPH+ErVq6bOI7HOxOcRApU4R6923Xkyvm1BrJfR3Olw56GOHdR4RPBoM2HZJl5yS3
 8LoQi9a2BuO5xn4GUp41u1RvmAiJJ6ODaP2oDgez3hgDkEAFocFgw/FbAuSpqAS1bxsbfZjPU4u
 jmVBzmlKX/n0dQQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_010247_585228_256D1019 
X-CRM114-Status: GOOD (  17.68  )
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
2.52.0


