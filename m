Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07450C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfW03x8PctsFN6tD/weQNw1AxZpgTS9cl9FMFO0QxSU=; b=1FPMgV2OkoI8VNlIW+ettlSpQS
	pzCxdHK2uMFVmURLCRwqk2m4Z6gzHDo3ADbktAcHtRN9a6mEOk71x9IwEACeJ5exCoWJZQrWDqoIe
	8hGtXyOCAU8pJ/xTBw7CZShnLv1tZYm8aR2MHRXwZaMHhFi3nmrWHEMTSAVPRl80c/92X5TvKjAl2
	QuP9SECSArHRYVNKOO9qWNfINivdf1fK4eU9mUgaZZrq6UTeO4iTFgq++/XpsZ4J0cuoo2HzsX5gX
	N7k+cOWSqmzBCf6j2+yDAOizQRFIH6t9r3bdhZbKHnC2VsbQfHxUs8m2Ju7GSyKSAcNWBm91fy4cj
	4Y+7fM3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaPx-0000000BO3Q-0XfK;
	Thu, 13 Feb 2025 14:42:17 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaKP-0000000BN3n-1qpG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 14:36:34 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2fbffe0254fso1768057a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 06:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739457392; x=1740062192; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfW03x8PctsFN6tD/weQNw1AxZpgTS9cl9FMFO0QxSU=;
        b=m4SoZgmHrHRGEe4oAYboo4FjvTp85d85Ll0dPhrBPxJ9G8OK8w+LdpYlEjWNLECVBi
         5Q1sfC36liH7pDDHzdz3cPKWrlhw1qS5aMmSeY6+vQSDUyECISt9kwk03qutxDIQBLRf
         xV+Xt+rQq8e6Y13cfy2+m2qD9Un73AtoLmG+9pN20EJ5h+fsGf/iT1TXaleJV1tEO9xY
         1WBxYREOUAkbJ2RpKYTBapFCWVzVrQM7X7C7aLaHQZBrAproiqw7EJJez5X35r/3OUAY
         r71gBYuFZZj+8a0kQo1K1wSAAOBi12JgQoAorcaqlyuwzC+1koXzZUcjnzncmLZxoM16
         Bu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739457392; x=1740062192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfW03x8PctsFN6tD/weQNw1AxZpgTS9cl9FMFO0QxSU=;
        b=P2CmZDb1f7u9cDxEw1Eu+wWpKnR0Nv+AzHxf67DBhjvQAtODggk19IGpViv7OgVbUS
         qYrGMzZ4FBwKaCiF1OPgk5M0F4jc1As7bdZVNJkJSS8ZNoRIexsLpVht37w+UPeMmqNG
         PpNYRFEvosuaK0izIseaYOvF1E6vPG9qVNZDsjtaX8E5D4hcNaO4fuaXG9sMp22auTkE
         8HJ1rEzV00Ln9Orl2xWzdJ6yMB8+ldNV6121p/JWy8JlILKKFRv0SW4SPjcdosBSkJBu
         mR/nX2TZG6/PF+RRrz68IKxF9O5vQl1571ACPay+MYgQDC+ICU7uLTJWAt4LVcsriYRE
         4+yA==
X-Forwarded-Encrypted: i=1; AJvYcCVzs3aPtAwJLiwDc0cHglm+vrWR2TEraqPs4iARyotBF7phBiQAklYXLBNuE4TApM5C/nLVVpKxCYNHYe4DlfwQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwGuoEqEvg7QVAMAl8EB8eSsVr7Ngc6F4XTd1m6c60HT4T9S7Ht
	v3G7q73NTZEqMQz4EBJrYE/TbBW+/sW9/4SHrlIbuBYrEU+04G9f
X-Gm-Gg: ASbGncsxqb5UXEYMVyB1oJZZafUwkkpwcsmRMDiawYy0fhJoK8n78b8iu3a47y2cXn8
	9jwLmBsW0QqXbtKIzHgR8svJ7+66JyrGjjlNvzWMj0WfD3YpJDM7eqOTOvLTu85rTsx9Ltp4wtY
	j6AtoDytFmu5dV5gHD/1KakzTlvpn6U1KZDtSL7U9XXjEJD6atKLd6Pghztuat/KBap2s/zfbWr
	OEjZyGK9gMkfItyB2P/BZ3oPYmxDnteO42H7hNy6oM9BOzh2Y5li3aypppGy4i2gOutEZcTZM0w
	jdDvICrhzu7VYUl9TA==
X-Google-Smtp-Source: AGHT+IHaadyCxwFk79w959D2c6QKmfVmhWlGaOLfG6K6+k/tJ/QQlR9D08Ds+AKafHQJq4Hsvk4/RQ==
X-Received: by 2002:a17:90b:54c6:b0:2f6:be57:49d2 with SMTP id 98e67ed59e1d1-2fbf5c1cc87mr12523915a91.17.1739457392450;
        Thu, 13 Feb 2025 06:36:32 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fbf999b5b4sm3655165a91.30.2025.02.13.06.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:36:32 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 13 Feb 2025 22:36:05 +0800
Subject: [PATCH v3 03/10] drivers/perf: apple_m1: Support a
 per-implementation number of counters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-apple-cpmu-v3-3-be7f8aded81f@gmail.com>
References: <20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com>
In-Reply-To: <20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4755; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=MG7H09oJBroEMR2rLRIA2iE+Zt5xTdbc861bsPYOz8o=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrgNiUgPvCpFGhGTMyGdNU7wLWBKTezl49j80M
 QCYbF7PhyWJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ64DYgAKCRABygi3psUI
 JMemD/9JYfxAYOnpBp8Fk5eCumWdwJTLnto1PTYrT9O+bvtNzy18w9IUswqKPmpDc3WAt3oKpRV
 y/W2TeDQmTuHN/xdj87s+A8aLyJOliY7B/sF6JWTfzkS9I53A3AA5re0HxYkVCqgW8YxQOj6N9t
 kFdejqO39YNBuw0moG5v7IickGguOQ8JDfwPvIwSL2+/0RkbuvU1RAiuteDTqc5rPzOWxzFetm4
 IXTOcLX+pF3YjlV5kbtsDePGMHiQoBrarmPeuZ90iqHjIMbCPdGARWGwBNM5renVokOPQ2+TY6Z
 kCO6Evh+G1xS6wBXdXjeFzsyqhGweOHEnW75Iseuq4ndkQAxYEDfupaqarP/jvrzBJKNnhL86Ec
 GCp0YkbvP7Zu4d9B5EJ+fu02zSwpPu/y5+J2g7/FY1JIERcOjyVWzey8hpacMV56a8S/sJXc+48
 vIDarGgd3X9SasIs0TnCehg4PCn/5tL0FJOrSO5kPKPaWEtZCUF30AZ78NYLMv4YUYbHU6Nt6rV
 lKDQtZHMMxLE3dMFaRBIicIxjrGW3leaA06Ga6RqRFbKRlL3P/wFKsP57YBgTnCdUSEBaYN/CuQ
 c4HmSmVzS0HGRAa4IW+ysOCDnmEJUxZNOGwHpyBCHL9bGzMleBikZCC6BdX7heTmb5QrCF20hbM
 kEFlinkOOg5tDYQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_063633_485875_9CD3953E 
X-CRM114-Status: GOOD (  15.92  )
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
index dfd5d72ce9f3c5bebd990b5df6a6823fb7785cce..bf397fd81230007dcf52888f148e3158dc02e29d 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -19,6 +19,7 @@
 #include <asm/perf_event.h>
 
 #define M1_PMU_NR_COUNTERS		10
+#define APPLE_PMU_MAX_NR_COUNTERS	10
 
 #define M1_PMU_CFG_EVENT		GENMASK(7, 0)
 
@@ -431,7 +432,7 @@ static irqreturn_t m1_pmu_handle_irq(struct arm_pmu *cpu_pmu)
 
 	regs = get_irq_regs();
 
-	for_each_set_bit(idx, cpu_pmu->cntr_mask, M1_PMU_NR_COUNTERS) {
+	for_each_set_bit(idx, cpu_pmu->cntr_mask, APPLE_PMU_MAX_NR_COUNTERS) {
 		struct perf_event *event = cpuc->events[idx];
 		struct perf_sample_data data;
 
@@ -479,7 +480,7 @@ static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	 * counting on the PMU at any given time, and by placing the
 	 * most constraining events first.
 	 */
-	for_each_set_bit(idx, &affinity, M1_PMU_NR_COUNTERS) {
+	for_each_set_bit(idx, &affinity, APPLE_PMU_MAX_NR_COUNTERS) {
 		if (!test_and_set_bit(idx, cpuc->used_mask))
 			return idx;
 	}
@@ -554,13 +555,13 @@ static int m2_pmu_map_event(struct perf_event *event)
 	return apple_pmu_map_event_63(event, &m1_pmu_perf_map);
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
@@ -569,6 +570,11 @@ static void m1_pmu_reset(void *info)
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
@@ -588,7 +594,7 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 	return 0;
 }
 
-static int apple_pmu_init(struct arm_pmu *cpu_pmu)
+static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 {
 	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
 	cpu_pmu->enable		  = m1_pmu_enable_event;
@@ -598,10 +604,9 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
 	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
-	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
-	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
+	bitmap_set(cpu_pmu->cntr_mask, 0, counters);
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
@@ -613,7 +618,8 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_icestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
@@ -621,7 +627,8 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_firestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
@@ -629,7 +636,8 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_avalanche_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
@@ -637,7 +645,8 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_blizzard_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static const struct of_device_id m1_pmu_of_device_ids[] = {

-- 
2.48.1


