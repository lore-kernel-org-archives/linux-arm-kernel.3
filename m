Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E704EEB56D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 09:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzvjVfHrZzra3wF9+A+Do+FwcxmxMk+rXbtL9/jEreg=; b=LX0zxB03GisF/8VEoZqtXetLAo
	nJm+DHEQSJwvB8eEZ3yoPzt6wfowT63zMeDUuA7HX5+xkmSAsnzAQx1CmVKqP2AXiZU+lIGAzBPML
	Er+4xe4BruWhK3+kaP3x8TVlteVgz9yV6yt2KZ6jvaSj4sSJfCpE1afRQ8InrGZHYCBGbky5v7y7h
	p/dJ+fAHdiww/DflRY8fDnUwMtv2HuTc12/eXnriuDLdYGVTDA+B9opXlnZ6CfD3A24fDfLH0UpwT
	oajdoVSvU5dDF1Xy6hDjMD9kYbSMg1/l0Rb0BvBgIdZksrrOgex2Q9ghKroNOivUBFNYllts+nKvs
	1P2wVfCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEa4-00000006iak-2Bxm;
	Thu, 01 Jan 2026 09:02:52 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEa2-00000006iZd-2u24
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 09:02:51 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so9647225b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 01:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258170; x=1767862970; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzvjVfHrZzra3wF9+A+Do+FwcxmxMk+rXbtL9/jEreg=;
        b=X6Ivwxml2Rp4uhsC+kQ/mAfBPtHxJgC5ayIttYgFRRFUhvPiAcygAVgOGWSPc3zE1a
         Uo4VC5AZYNDYy03YL85gPvnlroAuvbXsgDzV+YIJx8rWyJuLDIWdmHh4KSYZGY+v0BNs
         vHexvsECbIaRadXadKF5LhnQhdoSRZVyJIot6FyUGe2OefUEUXYKeL9cNhD5WBwJ/YTX
         RnYnNZnhhx1OkRJLyDiKaPva4Z78M2hf4wXGhqBSTLD/ed0rkk6v5nfcP259aeqSvH7i
         gbGQyQ/1bcvDZg0HGTSnNkONuDD8awlUXsQb3E3UJL9vTrUC3dVHAvLkyZoDsdDN5kO/
         1iWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258170; x=1767862970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mzvjVfHrZzra3wF9+A+Do+FwcxmxMk+rXbtL9/jEreg=;
        b=m018U2yewch13osUTg0Fd3Y5vJQG1JSVDAtfjIiwNWDP7a1Gad4+Mdj3VmEY9EWFiT
         Y9kflJAknryAmq+eSK5AFcft78FFa/QzaXT7rLoGbSpT7sKqQ/gDDBm6GyFjQ2lYCTwI
         UaX6pFz+4Q/WUFUUGm1g5230c19cjml27yiWzD//oXCRnya5AOcd+660TJgf8Dfh0Zc1
         1gg5dRfAayYKIeiOKc0fNiPV8m9mo/coHljx85yPXhxMeKAwcQgLtExF4PBFxqv1y0w9
         PTXk1/3cJ/72MSBJVufNPh9mBx1vDVmyCQ8IvCxXbmkxQdrQzFll5xCyP89N0C/ATD02
         Bzuw==
X-Forwarded-Encrypted: i=1; AJvYcCUjpcMvkjIPyIBgV2lLAb+i/PaFOb5vgaf1gtkhUEAaSZ/cXB8HuVlyw+NlvtyHWDuA+anLms6BJEzH4pJbGLm0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4YO173avTGK+yZIJvh4cbDsrjiKXWntQd2Vs4DNC45I2/dUst
	UIMgD8vk7rLrt+9n9OF3TStoFDnUes/Q2b4O+pvyey6YQEU+jAcTGwCm
X-Gm-Gg: AY/fxX4Bltie94YuWn3fz57XcsoDbJbqyDuVMPYaFJ2SPunysg2B7DGTMYqOC9Ohrab
	f/qOwlJJYOM3CdCW1f7xscP1FKaCwqyYRVT1Ws96HPTl47ZAtNd1MD+llkTtViB0wxL/0uvwJrX
	DPoVeUABDSbMXLcjqwUhf058KxuLpeEa1iMHppOL9J7SvM85o5haGH8OR7XfA7wKoSylbV2NchC
	jqVNNlut92AXepZKLk4P0ywUVZ4iec5OfWI4ymsNQDcIlm2+ZcrLdqYB9qU2KnHm8EgiTDsL3WM
	TjtBxDGYHvYMmQ/y5eI8ZCwq0pPFV7ITiKJ/XbgbC+t1Gi9AX0F5lZ5aprvk1vLPaeGABCxxxXD
	/MZFWkNr2fX4I6rXtthB0SFDY4/dt9Gs2no54mMhnHE9F8kFytYwFMg1zXAs9qFOOCN/84GBera
	qeMC/79WlLzj0H
X-Google-Smtp-Source: AGHT+IEX1s5ks4GSf9vW+xRL0kaPOFIGucJSrgtfX5TcAhrNEbjWInD/uhlAFVi+IvqgSG5t8zgPJw==
X-Received: by 2002:a05:6a00:801b:b0:7e8:4587:e8cf with SMTP id d2e1a72fcca58-7ff66a6ea42mr36292504b3a.66.1767258169687;
        Thu, 01 Jan 2026 01:02:49 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:02:49 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:40 +0800
Subject: [PATCH v10 04/21] drivers/perf: apple_m1: Support a
 per-implementation number of counters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-4-48812c529ffc@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5683; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=vnsmCGSw7Ox/D+cYElRWl33lnlkyIEYomCaHfMV1wgk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgmHJtVqtjeoiJKKIhDQt9qIWdQDOC/zGFyo
 QkRwkr9DvmJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4JgAKCRABygi3psUI
 JARoD/9Zh0Vhm/bNiMMe2pBZbvJMqnJf2oHnxk2JKgdwWa9kfkiQlZbdzArn7sqWM8wmDXbjmco
 mfsYi8LvlBm9vrklaUZwi9yKoavfyZNHTu9YF4sP77fFG40ipagDZxmzKPdcgQTHRveTwbEczcz
 mA3FjuTxhDkud544e8b130aLcMJIPa/YL68X9VZKFFoLze5bgIJzfDLvORZHyJ4MOaXDMWI05Cf
 XkYofevpChBhCV942gZQQ2CZPpD2DTaHWrXhVxOdCu8SHxpWMW1gb4lgCNMgud4UW7tubdreqw7
 JTPbeLeyPpTbJeiHxg3jvHSWO1qLDT6sJthyWyZxNyD8QxctRZ/zY2qFJxH1YmCDXRmuI0BEBEv
 Fxo2qKPAn7pqD++V6b4lmI1qd1ZaEoJe29aJtC6oR9foGsOtB9vGHuBiTMBY93Hsp36hQej1oBu
 IM5FxvDfDO+UFyZ7gr26B7Es3Lub6sBjENMN46CvAX4PlqxzSkIaEPyz1JEOr2npVSzioUKYTzV
 lm+/84J31ToC7iwpAqnWE28ADkpGJh1nQU4oEfKe5MPTzdRILSGPHdH4zBPFlQE8EVy0HmwYodc
 EaDb9rDSljSH+f2l31Ogp2i3GjaDgWBsq+Q4RMthooPQtrfZHCDI+L1layneq2efUroKVN22MWD
 3qxb75Yp5k6w5yQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_010250_749755_2E9BF38E 
X-CRM114-Status: GOOD (  16.58  )
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
 drivers/perf/apple_m1_cpu_pmu.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index b4ab6a3e5df965b7ef450d7e533995f3cc8633fd..0b0ee2b9ad4b555f66b9b478055a420b7eec8f3c 100644
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
 
@@ -492,7 +493,8 @@ static void m1_pmu_write_counter(struct perf_event *event, u64 value)
 
 static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 				struct perf_event *event,
-				const u16 event_affinities[])
+				const u16 event_affinities[],
+				u8 nr_counters)
 {
 	unsigned long evtype = event->hw.config_base & M1_PMU_CFG_EVENT;
 	unsigned long affinity = event_affinities[evtype];
@@ -506,7 +508,7 @@ static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	 * counting on the PMU at any given time, and by placing the
 	 * most constraining events first.
 	 */
-	for_each_set_bit(idx, &affinity, M1_PMU_NR_COUNTERS) {
+	for_each_set_bit(idx, &affinity, nr_counters) {
 		if (!test_and_set_bit(idx, cpuc->used_mask))
 			return idx;
 	}
@@ -517,7 +519,8 @@ static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 				struct perf_event *event)
 {
-	return apple_pmu_get_event_idx(cpuc, event, m1_pmu_event_affinity);
+	return apple_pmu_get_event_idx(cpuc, event, m1_pmu_event_affinity,
+				       M1_PMU_NR_COUNTERS);
 }
 
 static void m1_pmu_clear_event_idx(struct pmu_hw_events *cpuc,
@@ -601,13 +604,13 @@ static void m1_pmu_init_pmceid(struct arm_pmu *pmu)
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
@@ -616,6 +619,11 @@ static void m1_pmu_reset(void *info)
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
@@ -639,7 +647,7 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 	return 0;
 }
 
-static int apple_pmu_init(struct arm_pmu *cpu_pmu)
+static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 nr_counters)
 {
 	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
 	cpu_pmu->enable		  = m1_pmu_enable_event;
@@ -649,7 +657,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
 	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
-	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
 	if (is_hyp_mode_available()) {
@@ -657,7 +664,7 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 		m1_pmu_init_pmceid(cpu_pmu);
 	}
 
-	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
+	bitmap_set(cpu_pmu->cntr_mask, 0, nr_counters);
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
@@ -669,7 +676,8 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_icestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
@@ -677,7 +685,8 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_firestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
@@ -685,7 +694,8 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_avalanche_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
@@ -693,7 +703,8 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_blizzard_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static const struct of_device_id m1_pmu_of_device_ids[] = {

-- 
2.52.0


