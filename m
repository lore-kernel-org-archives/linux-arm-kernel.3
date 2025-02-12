Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C4AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22Z1P7ZTqlUD6cQOv/Yl+YD77nH6S4zD9+2pfCgYfuk=; b=0cMES0Exr/ceKi/IXvdWSltHSD
	oB/Hm1js6NAT9fyq0pm10dpcz5kJ9cmLfVqFsqH7RH6laqzRfkEFTxGo1XaUKqI9B9zq0vaWjMeXT
	hg1NIPMIktsufb48o1hDZPPVq7pzG3uNdHRT0pwIlRuf4pagM7JRU13gPdavzYQTVGlvjzHGJxl9V
	F4OuWCRFjfG4WQ4X2FP/jCEETe1KnUXWS23c8q05lliC6ilRnf+W5t3zXZTWdxdE7s3+uSIzwXNKy
	2K7bHRVTVdI1lTJ2o2ttJP6Wx/ycKKgEjS2ijLu5JdCsEm640foWR/C18yIGXEaKGj8X4wMIJ6CU8
	+PIVsn/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGZY-00000008KSS-3FxP;
	Wed, 12 Feb 2025 17:30:52 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGS6-00000008IpT-00By
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 17:23:11 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21f3c119fe6so161842155ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 09:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739380989; x=1739985789; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22Z1P7ZTqlUD6cQOv/Yl+YD77nH6S4zD9+2pfCgYfuk=;
        b=LfBjJYa7p5RlU7f6sUZiPCJ3SI9DvdgHhBq9HR0sRwinuS18tz3tlfAgOt0J1zcuzR
         4w6tLDqmIU7GBYzTy6r55vd0wxlh6ZrfcbAGhSaG9SJ0rtPHG2USLzfDcCZmenTKKUQK
         cQ/lgJSXhkufFVNFpq3bSraxCken28oKyG8BKIJ5fMd+5I1QdBHaFgW/hVXNBCmItbPj
         dA7pns5213MmJ5syLXHY7wIMCDxmM5J0R6aV9ilTBhUsFtWh9bslWX14hquwYHmNT+Vl
         3BxfZm9zYkj8lNkCbQg/VcQBpVB4Cyy4LG5J+9iLVE0ly17PA1ypPfvN9tSL15ttQfRz
         Qz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739380989; x=1739985789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22Z1P7ZTqlUD6cQOv/Yl+YD77nH6S4zD9+2pfCgYfuk=;
        b=IUV4qRXT8Hd0whxM7N6maSuVdzu+SG2h86xLckfMFiMcuLz+gdae3t8KLz2GQ4uuEv
         ld2YzxERwDps8HSIuXriVDER7LQ9+FRKb3JvnpR8r3vta1y1gJ3RlmjGCDQgC+dRcmIB
         6MODROJxtZOdzPNuqLNjxcA7X5knXKwTQ7tfMGjiqHp7wdGKKaP6RWeS392JD+8RXr0b
         DqJHDLmFokvQtyEThaTXcvEgL3OzrAxVabXU7ABlJR0z3JKVzL55hbXdyNq6efw3qhzr
         yMMmxg++dw7JSq2h44EjPEJxBxDkxrYhtrI1W6ZzMjW9fjSqw9W59SqL8K1te1qQGp2T
         hkfw==
X-Forwarded-Encrypted: i=1; AJvYcCX2EnCBAbzew+4d2qWVfdXlfxZakEa8ODn2uBCmJCCBedxrXa7kNzNSpUFNCxlM8gCqZWiBLrHiAQIHlOCNLRV4@lists.infradead.org
X-Gm-Message-State: AOJu0YyPTwYDzFt6qNsJdvkp2ryY/mmSUA6MBgYPivJSY3glgvt+ONhR
	HejecY6yOcbwmhKBPGLZPHHZ2JFv32gBas25RPef9CAOTnqhXQGM
X-Gm-Gg: ASbGncs5tO1AMT11+9e79o0ybW/4fo3qNd8+EjnnnJTaWL2AuptHxJ7F8YC3vlDzJqF
	tQmsrAW9HDEpwUTQ+hQYr1foVekvQm9PXFF+pcGu2gCJZwTKq5Kyzmz5YVFKPh6YYoVOLoBaOk2
	76YvF2U91cvvYWUPHYPCiXH5wblokLIOmBmYwo3mAKviPCg/pYxik4r1V8c6VNuGAUv9wlrUBEQ
	DnyKuq9oAgOz+NQpRhj09vsXZwFRWbRkPUgzGQzpzjAMQI3b+ByWFvR7ohOI6F2XHWLOi5uBbT5
	dnphLzTOL2K/WBt5ug==
X-Google-Smtp-Source: AGHT+IGobLhMetJMQ0kqhmZbc2dvKpQgQcpToUx45wdgkBO1Lyl74VfMgW1vCxAWuj4T/AwvpbtnWA==
X-Received: by 2002:a05:6a00:3d46:b0:72d:9cbc:730d with SMTP id d2e1a72fcca58-7322c39d1dbmr6513556b3a.11.1739380989023;
        Wed, 12 Feb 2025 09:23:09 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-ad54f1691ddsm6001705a12.61.2025.02.12.09.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:23:08 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 13 Feb 2025 01:22:26 +0800
Subject: [PATCH v2 03/10] drivers/perf: apple_m1: Support a
 per-implementation number of counters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-apple-cpmu-v2-3-87b361932e88@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4846; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=L+Tl6yOf4IhDKUIycb3hLlpdWXpiiAGyKeFO2ADZTD8=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrNjvQb2YIK3BJQeW3xopIS5Ew3zALFGpnvRYn
 IQkSGbyED6JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6zY7wAKCRABygi3psUI
 JIjOD/9OCiE4HbMvImN9OaimhBddGmIgt3gG6W5YIr7qX3llWPpFg56YqftGDOhyj4ZtJmoLURj
 b7NVQztkcZkt/J1ev4P8PKOuIHvcxHCt3R9c0vzXSpwMlWU39lesxyT+DsoLmpz/qYPcaDNebsL
 qJK9yRjwfu1LTJZEJ9W5cfA9KoUusuqsJe8nduPipcGHiZpnFH/y1DkWqU79Mahy/nwvrmCBnbR
 tTWcC7/PyLCOF6UVmj5jE2yZIQS7uuExmkDKmaommXqiwydlysU1nBlCZAVAYJtQN9mrB87zkaJ
 shcKo7ym3R4Pr1ZFXXVx31H7q1w3RT7LFoUy082kH92JU40IG3wmu3ItTJfgLEKSC96L0jK/mBX
 35wdR72XMSn4uwB3sWMT1k/FIgJVubl6fbKSalgEUaLjGUtg5rFLweyoIdUnO5hacljubqBEo83
 NPD22hBOMzgWcUasj1VLd/G7RcogTFGHAw3oQo0SVdpiB6Zjub/2F2Em1HZ7gz4fCl8z9W5bxMQ
 9yJRT4JY27EMXei7B84Qu9I0wVb0f0OflupWc+ZX6QNOxftNyjWP9dssQvT/ysp5Szkm460pFWR
 1DkJ8GU96igRo3FrxC7/iuqkR6cANP9hmAWBgahmhVAKgNeOue+ASjXpbde2SwvpeS1pCDYKhTr
 mlfhgkc52ZK5/7g==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_092310_051090_2D6E296D 
X-CRM114-Status: GOOD (  16.05  )
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
index 9b26d5f35d91b715e9ccb7524a3ca7b87a4d5265..14e6fd0c2653912a6bbbcc31e6f4c54ee2d062a1 100644
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
+static void apple_pmu_reset_common(void *info, u32 counters)
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
+	apple_pmu_reset_common(info, M1_PMU_NR_COUNTERS);
+}
+
 static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 				   struct perf_event_attr *attr)
 {
@@ -588,7 +594,7 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 	return 0;
 }
 
-static int apple_pmu_init_common(struct arm_pmu *cpu_pmu)
+static int apple_pmu_init_common(struct arm_pmu *cpu_pmu, u32 counters)
 {
 	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
 	cpu_pmu->enable		  = m1_pmu_enable_event;
@@ -598,10 +604,9 @@ static int apple_pmu_init_common(struct arm_pmu *cpu_pmu)
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
-	return apple_pmu_init_common(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init_common(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
@@ -621,7 +627,8 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_firestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init_common(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init_common(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
@@ -629,7 +636,8 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_avalanche_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init_common(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init_common(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
@@ -637,7 +645,8 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_blizzard_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init_common(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init_common(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static const struct of_device_id m1_pmu_of_device_ids[] = {

-- 
2.48.1


