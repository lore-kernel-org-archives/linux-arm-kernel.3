Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EF5C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 15:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RspcmdC6N9FCe5+5MFitUG7n/lZdN0nBTHTU7ItA6Ws=; b=el6FFwJ4Ec8vsxsJCLnVMY3J1I
	nx3OxnZ5M/0+ndtkeEYO0/yF/9dc4ZAqtwOdhCRbWH9pCD+Jf3YK82Og+5ZsQhanlm/N3LQlpLklK
	iLmpremXBdSHJBSdtSzkk2k57esja6B99dJ9ZUI+rizuboXrp9U51vhdoPP87V+RJQx+SNJ4seEoi
	Ak7AMesNrrFX2qWPFmqKKrYZ5DVuWEYBK0l0MbQ3uM2Zzb1L2cbKn/T6PzXqcX0RmOnN2FIV97Q+G
	oM1J6rL4Lnd/4VE5eJ1QWgcK+Ud/ZLbfhd6khWVz0UOMun3jRWJptdTEsLrbNjt1bd5FFLNWG7a5I
	vEXYPRSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDm1h-000000065Sn-1qJo;
	Sat, 10 May 2025 15:22:09 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlrb-0000000645e-0mWj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 15:11:44 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b1ffeda9363so2941261a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 08:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889902; x=1747494702; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RspcmdC6N9FCe5+5MFitUG7n/lZdN0nBTHTU7ItA6Ws=;
        b=L7zCmeHPVSxHRsbIxFtcRqWfZ6O11kmsesFXrFQADKoWfYQqig0aDRQQOG+y7ydiCj
         BMU6Kxl+Qrh173eJOzevZumzcK80GWeac6PiI1e2ROTkxvL5JhZfb4J9jpS2bMqkKdoE
         YQ5bs+TbkOjEGaMoOjKooig5PASVUZ74fndgYdyMCrT1Lbxv7tIW0Ek1U8GcAdeRuQW1
         cSgnw+CbBwrh235f2Oe2LSfuEnS7cQ7YvApS/b7hbFQ2zcjApctCLMH+lFz5Yn3cCbqm
         gwZ8Sf51+2evbt8ofieCeOuVUHSrXUDDtfLGMI/kv5cHyPGw8BFgHA2LGYBrINNu2jdu
         QSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889902; x=1747494702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RspcmdC6N9FCe5+5MFitUG7n/lZdN0nBTHTU7ItA6Ws=;
        b=cRRcOz9KE9GCWyzlVEYkhtuK8br09vS8qKiatiY/oREicUJgsJOIU2ssZhw0qy8mkh
         EmdD/LRIH27KEcuiW6R64kcNWwIAla81bZXpkp+tA0uiGaRROkbOmhTWi8rYh5xbyo5N
         qzqs+/K5QfzfBJSuVTqEL6Y1iIR7EBE5E7Zn/Ozr+GNrNehmrrE5MtXdM3jWgQ3dJWHB
         LEVgvisUndGyucYR3ZptYKBkzTqtvUkgU5Mxr4WmGLm2fFrtpRnk9bsB8wQWNsqluu2/
         czYXa9Rho5Vps7/P+VgLqUqtpvcS5/IVZvk7L1JQgxspIQEq1hbmgyhv/iI/AzGwef5z
         cOGg==
X-Forwarded-Encrypted: i=1; AJvYcCWihlwFoIPkswbdVJc8h4hweo9+VIMdEs7fW1vaWOTmBw/E7HvxLfPjO4k6n5mI3g2g3g6N2gXU21EYEouoR6z9@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt93c/5ye94mN8yljttHKqIi1gTiFvGYw4DdWT5fFtPi4U08ec
	DLl9JEdyUVKQblO7XHlJTNUd8wpZgBV0i4iFkq0EsaN8YcCtf82l6MFKjg==
X-Gm-Gg: ASbGncvifsTRyAguluuIcfWRX7nqh3NGaDhswDoTOCx9LdZR62B0VistXdElCk5Nluq
	13S4SCxQDcU5lhqAwRKCe4mt41qcDYpX6yeskkOodoc0NcF8TFdpwx9L+fsosOQC1ymbhGg1wyc
	Dz5S3GtyoLXBDVyNNQkngXRm47+J2RA7dM4hKzkqpKRy6bChytdnNMP/6q+NFBLMquBXdrYjJSR
	KUep/W92KwfvVwHW34fM+OfD0aq0ELHd6V+N+CczYTCSukbD/16n0j/taW1iAJmyOiPF8VDerjF
	q62ZrKaVTIKFiqA9Xr9QIaW90EY7KDjmHwVRU6rQZCrbN9lZaznsTA==
X-Google-Smtp-Source: AGHT+IH6LOQJxyz6csgZLr0PJhoHpZeb4CPb2lTMFD5ePFD1IshoBGWDGCQdrqqAtaHGRZzB1c7pDg==
X-Received: by 2002:a05:6a20:3d81:b0:1f5:8a1d:3905 with SMTP id adf61e73a8af0-215abb54c9fmr12010580637.7.1746889902187;
        Sat, 10 May 2025 08:11:42 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:11:41 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:45 +0800
Subject: [PATCH v7 04/21] drivers/perf: apple_m1: Support a
 per-implementation number of counters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-4-bd505cb6c520@gmail.com>
References: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
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
 h=from:subject:message-id; bh=92neIFKGScRdX0M24usDNCsl0ZJtczDZfCVErT5yl+Y=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2ya13gcTy6b8qRQIOa1Rt2jH8B3xfc10cesY
 +t9h/brlf2JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9smgAKCRABygi3psUI
 JEwQD/4tGlSHmelrEbyAMqwr3JY9m9fL8G5QuPRBqxpH/HEK2SdBMAf4zpfWRhal2UOeIvwc1BF
 KtPrgrTQblsYBwirT7CF5qOxJarGpL4su/3RNQUaaTYaww+yjVIrz8dcZxC0lQpcA1L+s5hh5MX
 Kbwwe8kUeArHmk6lSioRZDQ8gk2N0CmdTvUl3P/6ANaekpxtRgKu1ZcnfzpI+dLV5Y4TI070H8j
 vk8KIYB1AMq8hGfyPJDhYDlQH8KXdCWRW99vWi6K4YNi6VwGT0bfTWoWMIObyvkn1d/XxUO/hnv
 blrqqCYLAvCjpMlnAFXT4hT/qYe64sMzNc7u8uPm76RcPAJkT69K5vE5Q3fnDCh2nLGAUo+S2lL
 7PAa2N3c0oOKm/PWuuyEgRX1V+E1ItNdjGpBBYkeYQvaT/3P5+/yb74JrMpVDuHg53j/hjV5KoL
 M7b79TeRhGibUqm3x0vbMtdFTBMJvtPl1wPQ2PuAjY2sr1sdI3yaX7atITysaDeRyrRl1pt+yTn
 h+lnmmYekfDGgSNkJ4ZlPpY64fU2frfiWCrxBhHXPjmNbyKc8U+ysUQC2TEDVyxDfGGbOduyQS/
 1KcMxZWZl4l3VidobhXR7vjn4WFSCrtFrw/nhlMkcw1kXPk8m7FSIR0Rxv2rvLLvg1Sv7shgupL
 Jt1xLBWw8vPDGRw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_081143_231447_90B0CA61 
X-CRM114-Status: GOOD (  16.60  )
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
index c19a433ee6478876e4cf6667d7a85a193b6cb069..35a34eca403384c4908c2bba2f8186ea854d63bf 100644
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


