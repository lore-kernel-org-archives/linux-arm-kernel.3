Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B744D65C7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D015mK7WSxavVbYzWtuulK3/EPR4luIjSULFnLfast0=; b=j1bRBHd+0hvVFtNCooR1OMTPcj
	9mbEscb9E+c5L/JI+rnaKQoJK9H4VeeVhbaEACw/QAx0MWbaw1+5x/mEoi+PBqRrL9cptG4tiUjkG
	cj1ShkssnVawq4Tp6NJb67358q49UAXOyV0G8PRAXT0H31qIX9NVHywojbugf2e1H7foM7H6O6qKV
	uzps83EqDz+8ePbGqhuPIJsyFD6zLatbfWn7N8caVQiBIrMRKKTV0SG5HDvt81+WiLYyR4BCyCUkw
	LnyYawXOfyOvwjmY7rf5UKsSi+YKqxonLhifvScP7imZ9sI4u3a2tGitWb9PhS/VcVfu13qbrIMMD
	UAbeE6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuKd-000000074oR-0RhE;
	Wed, 17 Dec 2025 16:24:55 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuKa-000000074nC-3C9a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 16:24:53 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a09a3bd9c5so36645355ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 08:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988692; x=1766593492; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D015mK7WSxavVbYzWtuulK3/EPR4luIjSULFnLfast0=;
        b=DSSuPghNlzIHYHaQ8LFEVzlXbBsetnz8+jU5plht/ejwp4s4E2B4c503Nvg1KfFDM3
         6r0DbasxQ2uUja3j1knsE41CCc3XIXhZcus3zanznDz6g19YG9Qqc5+i4CI1ZXEG6K0C
         yQabSjh3Q/jDeS8tSn7zxugINXiAbsmNh/qnM3XA/FaJamUsfZTVkZBLxYxa8AFg0vCP
         b6SrktlCDVt+VqxGA96CNvd3FGIng3ewGE8xaDCaYJ06L/8vdiNrgrIdKm8pAUPMDIL+
         pFyeu3is14ROuNnLZiiHf6RyrYmP0PlFt+w6/+eWgFvR2ztVRVMfTzlG+tVK21Z8DYmO
         DA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988692; x=1766593492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D015mK7WSxavVbYzWtuulK3/EPR4luIjSULFnLfast0=;
        b=dY+YHzaepVQDUQhAW4Af+XVcMIFNLPKCX3zp0tsWU/eVv8BUHFuHiw96d38IGiuGW/
         QkeY7PObCt/lzjJwkd5/tXYsoKE1aDYl8FTMdPxDOFD6Kj1kFmzGY9F/9V3R6WlO8QuO
         hJ+aZFrcUvQws0GPAz6bZikrNg0ylHERqZUcCT3WhRTWvcin+m2swn4L/t0a9yezaFdd
         tdN8vlEYRdUVIyN8oU8aE/wdHg6jpDXoUJwvnHlLmn2NotePe0p28y/w4cWwueeEfC4U
         ygOqwKX44BIceaQw1/vlPNt2lCzbb9sKUudDd1KPuKmNRtX5YHgFfZm3kplysadhRsx1
         YtWA==
X-Forwarded-Encrypted: i=1; AJvYcCVeG/8lrJrt4AhDCrxd8mqJtXZsXFrli5PuTr1CtmRL5Lwxc0FsURHTw5+ZW06pjln+vJtCv2dNLa/kFV7LGsb0@lists.infradead.org
X-Gm-Message-State: AOJu0YxgRH8fDewzZd1/SJgo/okBaZaOzhfQCVCzk/K6BZyLepwjZl/X
	VKalyFufo+uuUCFLFNBWUvgfwjq+xX7cM4gVv3237MRr9a5p2bh3j81G
X-Gm-Gg: AY/fxX5h+WItH7ByZUI2l/7dX6Ckp1ejRxzAIwuIPGgWuYMJFYQBTyOYCaK1njHjH3q
	RhD4HeT193ENO1C/UsrmsLTnKL0Sh8U9lSHDr23TJ839Xwh1E1pET1I+veVbwQ+B29JrnUhTgjG
	nz3pFaZDywqBusw1cFxzonX9navfd5SDyZPZhg4pDF1kE8RA/2dvQ7AnIW8ol/VUGo2ZjooNzll
	W0TPybXqpINjdrypvxDQPcZGWqWCqWrYr7kyWKNJoYwqBhKhcPD2vptzIryp74fxqwSPMolABcw
	PMkzSKxqvX5wshxj6sOWucGdcje5QJ9aZeRYVCSeaWf0YMNvFiTqj9XhOTvndx/R9u1AZGAZpNl
	uEJtzQaaPQggjIcYFlIvvUDf0+xgBfhuI3Ylpw3lzs30GQw4Rpr3kr4qWXSXD+9nE1oQ39/zGEq
	2Ule/uzpvqrNHG
X-Google-Smtp-Source: AGHT+IFBDhdjBy2ztSMOAWQEhJCi8PCuLD/3d4j/I71RYEGXFxGKEMHoz3QmjpOsdlDcNLlGRzCxhg==
X-Received: by 2002:a17:902:da8b:b0:2a0:9755:2e97 with SMTP id d9443c01a7336-2a097553037mr153493005ad.15.1765988691664;
        Wed, 17 Dec 2025 08:24:51 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:24:51 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:17 +0800
Subject: [PATCH v9 04/21] drivers/perf: apple_m1: Support a
 per-implementation number of counters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-4-4deadbe65d03@gmail.com>
References: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
In-Reply-To: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4845; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=4A+/3Lozln7kmJXLxfl9Ass+jwb1UWj+PPueoGJcx8k=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlA5xAEAlJ14/E7Way5r1bm+LE53/0KIRcw2
 KRmd6EFnSaJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQAAKCRABygi3psUI
 JL7QD/sEfDLO32Y2wh9SQSrGOdG3EEEW+wFpaUCCxyswGBzo0hidSj+n2IS273ssZh8o7Ai8i8i
 PX0x1FP5kbfmd7o2IOwkWxGJB+eY66l8vixwrAwWJeP0vj4L7uDS1nXyFucOpW1dbNZHNxi7af0
 wmdFBD4qEP7BbU7Yzn9YVAsxjuGm20wpI+qH87By8J+wzhlCJ3vImG86bjo7GZmIKnS42QTLCXL
 tO/RqwFMkXZEYTX01mwQMyWnZsfcNX8Z6Zu2MQMou15IAvV83Xb99Om3zc4Yc0bDqmlW3fyf5El
 8Ku033iTpkUAaqICl+S/+ZC+jlO9uwJaXXbHViOIywjTSJGN3A48BJ6hRrsxYBfvUXWtwwud+xf
 iRydxAVqTxhIEH7bvw00l0IL0dctokysBVl420K7SO2Hk7T5ZWzRBViPNQpytc8zfyDFOfkBHOr
 7PFrpHWHt8FAo2FYJz9vio+4lenLZtwY1Es2nrAmL64hGhtFarBbof+WUHXKcr/lA9ptyd6Yo3M
 3ebeT5H0ww1sV8RiwkU66ZTDahz41XULxBi+pPvczKCKRi/gC901+BOnhe16aUGHWz8nY6tBlyt
 wKfD7lmSXvItZeQM9z2c7RuZN9pyT+ST9zj4Ttl3q/Xmz6Ryx35+gOc0+efy13P15kR+02Lfb3P
 YI+nj+Qfo4XdkIA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_082452_815697_196580C9 
X-CRM114-Status: GOOD (  15.73  )
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
index b4ab6a3e5df965b7ef450d7e533995f3cc8633fd..b5fe04ef186f04b4af32524fe433afb79979b791 100644
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
 
@@ -506,7 +507,7 @@ static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	 * counting on the PMU at any given time, and by placing the
 	 * most constraining events first.
 	 */
-	for_each_set_bit(idx, &affinity, M1_PMU_NR_COUNTERS) {
+	for_each_set_bit(idx, &affinity, APPLE_PMU_MAX_NR_COUNTERS) {
 		if (!test_and_set_bit(idx, cpuc->used_mask))
 			return idx;
 	}
@@ -601,13 +602,13 @@ static void m1_pmu_init_pmceid(struct arm_pmu *pmu)
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
@@ -616,6 +617,11 @@ static void m1_pmu_reset(void *info)
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
@@ -639,7 +645,7 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 	return 0;
 }
 
-static int apple_pmu_init(struct arm_pmu *cpu_pmu)
+static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 {
 	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
 	cpu_pmu->enable		  = m1_pmu_enable_event;
@@ -649,7 +655,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
 	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
-	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
 	if (is_hyp_mode_available()) {
@@ -657,7 +662,7 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 		m1_pmu_init_pmceid(cpu_pmu);
 	}
 
-	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
+	bitmap_set(cpu_pmu->cntr_mask, 0, counters);
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
@@ -669,7 +674,8 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_icestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
@@ -677,7 +683,8 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_firestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
@@ -685,7 +692,8 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_avalanche_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
@@ -693,7 +701,8 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
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


