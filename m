Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49466C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 03:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gry3bzp7sxRtt2sNra4Mhddxnl7ZGz7/lk3ev5LDghw=; b=OxwsEvvFULTkZFFCrJYSg05HMr
	NemOTHos/6S9YuuPzhGQhxi+v+ZrIrM7LGy6dPswKRregP+QuXKqrgNZchLJAZov0HAmbvlfoEbtF
	eM1gXGvWZ1BLJU3STlWO4OiXh5vlFEaweqG6KF0k0tEF78uqN0alW5PHJvuWAIZBRsbC3ljUg7+e6
	LUHXTV1Pz9PljQ6AefLfurNgNm6BeZu/5EmELkf6ewGAR3kDUmAiOoBnWw4civJsZQUYu4qciOFjt
	p5fizRV75lXRY0ilOOkHqLGJQ6AqGcRcb2K2RmT0nBNUSftYPD1CZ2H+bkR1We6TJZDGzFrs62yzG
	eGoBO6fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9c2B-00000008Ee8-2CEr;
	Tue, 29 Apr 2025 03:53:27 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9bsu-00000008D3V-2GNF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 03:43:53 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-301302a328bso7775548a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 20:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898232; x=1746503032; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gry3bzp7sxRtt2sNra4Mhddxnl7ZGz7/lk3ev5LDghw=;
        b=Vir42DxAu3IzwaPZWM56kjnOVje51pgNidos7jbVi5WDKlOfN1PHLbl3R9gBwSOY1e
         auWQGhZPnz9uw55Bo9nbdbxQPEbgy6GMy4i+dS6qgHG5g+qfbW/zoyGCVlZXk4w+qPBr
         nq7kyjqQIOdEXuxVZPQubaXluXvXtzYVYeZ1rNBgIeZa5dzRUBGjPx3ZTzYkaPoddP/U
         /Y8Pmef9JQ535tFoCg+uEFIzBr1BOjp9ybu3zuCbt2IDz28qwZDnPua2Gii92sGAUQtS
         kMPES7Nue2WfcJH/LndWPmiKiZYSyBn1SvEL25/ncDtw3slhuhoDFiXtVacLuyrxXP/u
         V7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898232; x=1746503032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gry3bzp7sxRtt2sNra4Mhddxnl7ZGz7/lk3ev5LDghw=;
        b=jBBRd+AaicYujQwlALKuwEvBqGRVLCGnRaFaWaAUPQUfCfkZCxitKWtQzjEB/wzOvv
         8mpjrILpTrmW6qbdJ1meV9cqFQuo+akh+RsJbSAngkWGKU4TWQusHcWckzivi8VnzwFZ
         RdKphitcf+Jgm41R8TfHvzzj8OBIuAKqr+IR03994GCjNc/0ecr8oH8WV3FlkQ59Yz+1
         8vfe4S99NyisWll7FJQvI8FeTRnRc7KWpnY9yeETgKZXh6ZtivGkjd8FIjnCa/yV0MBU
         TkzN//QWiJLJqaBduF/zclikvvpKr9uqrEtEJLKdhydFyXvh6YC38HxYcZL5C7AZiNzy
         c60g==
X-Forwarded-Encrypted: i=1; AJvYcCUCjmeC/+3udTdd4UrGCc4Frawi3f93Sa3p3rcwFG7C5gWIb5t4jpP88IqIaVbR/N6Js7uQQryIpEfTeRtVlifH@lists.infradead.org
X-Gm-Message-State: AOJu0YzpGFnMloftFOsKU2jYj8Urz3A9CUlQ3MM2k1PdpMr7ENMs+xSl
	0gen2w6D2M0azrzMNJtiCIFV86u9xKKpRCDukrPqpa0q54MzVMEM
X-Gm-Gg: ASbGncvSCVeo+B+bUrJdptIoEogEQ2b12ugrltM038w1lVRg89wv5W1mFWJfWRCPkUH
	N1KQ/DbWKN19dGA4nfXl4EGsq2l5GuMjOgTQjQ28MTc60foj52AQOzYNNqDQsnp9XEIJ21CWGJC
	lGI/TP8JAb5SD6AD6N1pIlMTqYdjnebZz1ug9G6EXr5vF36yn1ftykMqgNwYfe3abu5zW6mJnis
	m2wyp6kbFnWUZnJqYeqx+POUHrq175vOwgU7D8bk7ZiqMBLVgzWe1CtHl/51L/O+pcFpXkjQTPv
	xhqtcMCUYYSqBc3i4K89n3rCFXS6eFkeThBjVESKTlCJ/IBlCjCBkP9Xnw==
X-Google-Smtp-Source: AGHT+IHyuoAiU84K1xnInJKCOMn+x9v6JwkShn/xb25YntATfLxZj2N6UMln0Qoki1xE6k+DWcx6wQ==
X-Received: by 2002:a17:90a:c105:b0:2ff:7b28:a51c with SMTP id 98e67ed59e1d1-30a215a1c05mr2568356a91.34.1745898231632;
        Mon, 28 Apr 2025 20:43:51 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:43:51 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:28 +0800
Subject: [PATCH RESEND v6 04/21] drivers/perf: apple_m1: Support a
 per-implementation number of counters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-4-ed21815f0c3f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4845; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=BTD9OzZ4+bVdpzPnyX6mWog1RpRVl3h0ilCKcAXUUSU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErjGxMUZXaCzNA+hDn0NL7rxEmDrzluCX9Ao
 OjQpnaIA+eJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK4wAKCRABygi3psUI
 JKyfD/9QQMeNunFe+b3VOtj8xNDZd/QUQNnQSmNK3PYh94BR8kVUufLOaLtzMFbLeFAttpRWVRR
 mU9QI7EY9OIlac+LBWOUXqC34qW0Xorq0TtpeC61jGxyrdQWkMLdiWPN23tDWH0DJqm/TNZG+x/
 9wdOCg+zMn27lEMPEzMHs2N6AD3E4wbYgQpW3o6IiBvuJsDdLZMJ2CrXHuLcm2/r+1/h02QJoLj
 GoxTF2Ywb36NWSB4Oplg5gXGSHousJhC9VJvoKc4UQhOpjnLI3UbDfF1aDSyXiAkGtctY+oluVj
 Ei6cvbpSLoxb99ffFGq0OCQYJZLgEBEAFyhWx9QblsEQRoxiF0v+A2L4Jtk+JldMLFoypT6uiUo
 FoaGW8fM4SgAM/i08JjSCgaHCq+0y+fOiwgMNwG9QNxn3a93Wr9QF95WatZzV9PpnInhzCo0t02
 Y0Wh6c+Ijob/QeWfr9xr4DLMzqxzSaNQsJRXbUGU1atSf8Q1vxkaR3wBaELeGNyCzm/I48saA0Z
 XidvWgpD5h/Yz8C6x3TbMlvVg7vxKSStg9CdRwSu3eBSl2ZubCs/WA+jTfSjNq1UzSlgcS5k5Po
 x5qo7EP0VkAy+cwbrCf0q1CJ9UZMLzA/HD1xAgv0hYA8yrhNQJTknJ1eLntmoNrupme7P5Bg5/h
 FqSx4bCjIhKmxkw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_204352_583462_0C405473 
X-CRM114-Status: GOOD (  16.61  )
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
 drivers/perf/apple_m1_cpu_pmu.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index d1bc850809993de044df8fd5d4dfc61341482ee7..c03eb7acbb66790e17967d570c71746f72e40867 100644
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
 
@@ -507,7 +508,7 @@ static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	 * counting on the PMU at any given time, and by placing the
 	 * most constraining events first.
 	 */
-	for_each_set_bit(idx, &affinity, M1_PMU_NR_COUNTERS) {
+	for_each_set_bit(idx, &affinity, APPLE_PMU_MAX_NR_COUNTERS) {
 		if (!test_and_set_bit(idx, cpuc->used_mask))
 			return idx;
 	}
@@ -602,13 +603,13 @@ static void m1_pmu_init_pmceid(struct arm_pmu *pmu)
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
@@ -617,6 +618,11 @@ static void m1_pmu_reset(void *info)
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
@@ -640,7 +646,7 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 	return 0;
 }
 
-static int apple_pmu_init(struct arm_pmu *cpu_pmu)
+static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 {
 	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
 	cpu_pmu->enable		  = m1_pmu_enable_event;
@@ -650,7 +656,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
 	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
-	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
 	if (is_hyp_mode_available()) {
@@ -658,7 +663,7 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 		m1_pmu_init_pmceid(cpu_pmu);
 	}
 
-	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
+	bitmap_set(cpu_pmu->cntr_mask, 0, counters);
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
@@ -670,7 +675,8 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_icestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
@@ -678,7 +684,8 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_firestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
@@ -686,7 +693,8 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_avalanche_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
@@ -694,7 +702,8 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_blizzard_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static const struct of_device_id m1_pmu_of_device_ids[] = {

-- 
2.49.0


