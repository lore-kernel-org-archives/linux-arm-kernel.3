Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA98CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kSUQIaWycRWPeDhTmGOQryGYmMnqnnTORM1hSoq/o6g=; b=z5XxSi7eqq09MMmNOYSFFtp40Y
	+rdflvDcmOlHEqHpOjWClONGPvsa4ETUEd5bRQnIaoDbnYn8osCdccUOEWx269N8DYQxjAVfMMx1k
	vAImhiDJCvgurJ+if5tusIJ7oXpYUQiDXKBfez4B+FF78tQHttbhoi7ZExEoN/r3hBx85lo33riKo
	S9Fc51GaOLtLNUmRsxVVcMEn+kl9DHwFK2OLnKeWKySXuVbsGxSMJ4/LxzPvnQG6FUdEiCF51z085
	CjyUprmDiWokPqVBeZ/W6mJJX/zJcBYTKWIcrzecgyih4tthmp1Ti9NGJwsLOYzX93kbRvdQwl9BR
	TYtu7+Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gZq-0000000Gij5-0Jgl;
	Tue, 14 Oct 2025 15:04:40 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gZm-0000000GigR-3XLh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 15:04:36 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-339c9bf3492so7049751a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 08:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454274; x=1761059074; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSUQIaWycRWPeDhTmGOQryGYmMnqnnTORM1hSoq/o6g=;
        b=LP5sxH+mXTJyteb2LCVc3J2+B+Zh5yHbA6Z+yf4mn55OjrzvqYaySog7bwb2VGACBQ
         bQl2/CzMnP8UP2BX/M6lAptK4x+3sL99ow1BWxs7tWnBTsEq3wakH6b7UrTPs+eCmd4y
         DHle3B0cDkXJ5Kg0uN4MKIZ0VDNHXrYL7yRSBXYLEHHWr1jcHMRxr/HNGGse2M1vs8hg
         sMq6TbnQQa03Jf9kxPYB9+XNKfY7H+HpM1J0EFn5gnuiq3RldQai5xR1ClXsO+SDs146
         KScZHAPHxaMz2AURJgKttin69WSO8k1/iqKr98z42TdeDaQ6bBY3L3KNQGRrbowzLgpK
         7CSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454274; x=1761059074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSUQIaWycRWPeDhTmGOQryGYmMnqnnTORM1hSoq/o6g=;
        b=LlrOIta1AgnimjJwg/isQfsZ9egowmF3nno8RdUmSo+LOFKTor/u8OWeHMYVEkUDgp
         O+t9QcGR889P1pW3saeBdG6YO+b832cvp1NLMiR0Ihc8u6/QXKq2Yhgh4CnsH0UqGB1x
         QRC/dlBridQ3TyQ7rM88U0LHKTfPodj96SG9qKQg/5Y3pO2GHC7AhFv0FNtCbDV3K3Z5
         AFuwuOVBgp/NVDZaVW6hsN0QNqwIpWvu3Zm1mG++MkJhc4geQKRWvZHHdJuffheJqbkW
         PKUdso+QjLHmOTYHR1xEWEgr1Z9TsXUG1QQAAQfEhWnPBAJgJx0WaPTYhGzlVRLoPqXx
         UYBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjSazjWE12Qa0a0n1bZ4sU42rS4X7K2VDtNolgz8M33ACU2g/yARSo+tWHa1EdTHIiE0TOywxvz7sDs2noz//l@lists.infradead.org
X-Gm-Message-State: AOJu0YwMtGZQcVfEv6Es6+Pc0npwkEgh1FxS+QAglz/E+RhzTUtsMxJz
	DXZnJM0bu8zhfTBybtKCm84gxmvcH5HoU/nWRK/sEsyaHPDIwymJD5yc
X-Gm-Gg: ASbGncsXB75BoGnrhXvDm06ta8UUWOld+wy7GNSh2zAPJo0dMnflZ/xms+512wuRZYD
	AMKno0nvZvW8xzyN3+tfvGDyNsP3GVPBNJtoASf2F+6U9SfCss0TpMdO3F3KExw73dWeXsynmBe
	27F9uzEv5fVD+aX+gjA4AyzEe7YSZqA2OlUwXJHp2NTuUaXD61WC6DvaPLEGBY7Q01nx/AcpwNm
	0lmgoJKv2wnXbrG8gJ81OX51mqU7p+BFv9QIjlHCI6gsFPHUxyhLHAs+Iq5+N0WUlCIvK5EvY7F
	59yP9vICaJu1w/nQbz1eC2b79ryocraPgKOFuHHfOeavuy+MLAydiaqTpHwcfs7WvXRWoRF1yKj
	EmXo4Zj4I8QDQnICkezpshNlc/b+1juaApR9JvVFLqy/92m0mP+JRWg==
X-Google-Smtp-Source: AGHT+IEoF6lCOjN7CENp+OMe8HdUVTMA65Yq9hlYC7eCiNlOgtVtwVNNnLz/+2DFCjSowB7zKkXu2A==
X-Received: by 2002:a17:90b:1b04:b0:32b:cb05:849a with SMTP id 98e67ed59e1d1-33b513861cdmr32152572a91.29.1760454273320;
        Tue, 14 Oct 2025 08:04:33 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:04:32 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:37 +0800
Subject: [PATCH RESEND v8 04/21] drivers/perf: apple_m1: Support a
 per-implementation number of counters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-4-3f94d4a2a285@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4845; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=e978bWoFjBQgsdNlqdWrRQsmNCkoajFMktc9t6zXMkE=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZsrkM+DTU4+ennTxw+fzNUfJ9SwPdeIDOW9
 KOaOTHEIsiJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbAAKCRABygi3psUI
 JOfSD/9lLAvN0+5kZ7WZhC2c29OhNbFQ3jzCr4QfopyMWk9PI9okEb+pDwYako8qTkrWMJTfa3J
 4M+hha4zgsIN5xtINN7QpT19s80g93wxOvjjg7TrvBs5iDeKKDmswgC9X0wvkHQzG5+RuWddbKf
 tl2HsjK0hbHCGyjKByFRSiNZQWBTpBHO/W/azKnC4oIkM/8fyMKLd/9N3wukPUP1UyJGThODncm
 GlnJ+rOoJd3Ab/U8ixWuefAZRHbFR0ob1eqJZ25xwaA9WdExRjOjzq62bX54UEy0BNwS/C5UfdY
 mu4fxj0ZO6X+8lqIpZk8z8mg9oa7iAlVxv3yT+rJqbEaSUX40V/WFI4kAnnrfYOsxhPytg/Efs2
 EKmsfPpiwOZi9u6aZ2btITnM9LIeIPoATmfx/lhkY+3QqGheoCwzAIXBfCamYVBuWjv2eqzXfct
 Tj+xsQhtbD2gwwXwqKbCgvS0UxxYNjS92LGFpjlo+fGZN27Xav1dDqCYXT9YheOi4RsdS6ysAAM
 5VKJg/3Wz1WA3FqddwIjrHtCfDsebbUwjts/VqdSXNpZ14zXHnlOSQsI12zusztPfp6tFt4wMNp
 DnqDyxDgCVl+/qScBN7bwnLC8EhrxFyJLot6uD2xR2cw4hb0kMFeRl1dzRV6DKz7v8okNB/G2Y+
 gD67Rf6jer2UBJQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_080434_908790_313E3512 
X-CRM114-Status: GOOD (  16.52  )
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
2.51.0


