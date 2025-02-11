Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E519C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 16:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfKkV7CWiRWo4A1sDx20Z/a947sDezwx25dWCKqppXg=; b=WyiMF8iom4y9uRQ/QGngxuR/2K
	lACae1MYLMUyM/VgBLJjtOFZxdUWgmvdfzwEaFSc4Mn6DGJuyNETyBAb3x2NWZVrip3GkGmQIw87a
	8l0lziKJhpHVXXIgv2hk9LRAeO+KgErGKJHVVzABTFb+Urk7ldZAQoin+YzDvJi7zZitiT/nP3hwR
	HJqMWDoZ1fGC/EyVTcvok1F+flDiex4MGXHJtoUEHT67B4T/EBKRMlW6zTfKDN+DHn/vutDliSN9p
	Mpa5/Z7Rcr/VcFXX24eWBYvE+4vx6fNb/x9bH0TjNtxznugLjKxWp1Yb0fXG816ZbxP9OkOA0ur/c
	U8czNByA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thsuV-00000004SKD-0HOu;
	Tue, 11 Feb 2025 16:14:55 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thso9-00000004QQU-2rdH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 16:08:22 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2fa8ada6662so3517308a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 08:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739290101; x=1739894901; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfKkV7CWiRWo4A1sDx20Z/a947sDezwx25dWCKqppXg=;
        b=Z73Wis2e09NfOHWTwD/gvt2klGzOHrK1eTqIHwAV1ZgWuFHLXAzr6x8jQeTdtF5ORr
         p/fuda+1hSK/+Iwman3IyU5oNTvvmafR4Mqw19NGRPRYuCQN1yaTMZKeKzc/8XzJApXX
         ozNAMJPgMrHcQgIQR9pLuH+RX3v5H73Iem4cZZ4yDI/JP4/gYpB94jYX1RAEzuAWhApr
         ZkSE7PJJrSX+l+k/NDOa/CA/ddC59PyseRoU7xKI9nlKgXXWe3UqY8B/GESIlug110xB
         saBs1EDRu4A2qfm1PDZZ+NSUQ9cgr171QqJQrg6BaN61hY7XvIhx4xzmta/jnOYcqFqW
         KnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290101; x=1739894901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfKkV7CWiRWo4A1sDx20Z/a947sDezwx25dWCKqppXg=;
        b=Kl+ick7YN1sPrCAzNM8uJq4JuE/qc8KU3q9Bj4VAqXXyio2wybrABmrU8RroJwlYV0
         1t08YwRIKsiKRxOXvcTpRq1Z3JYupn9M7VTXfvwPLyikA1NZfgOvbNmKOAzhdiJp0Juj
         o4lcwEbMrfJFsi0f9A6q6vKHWGZyhrpXipGApESuQ2ptfrICHwt+2TF3MytcmBRrVTym
         0+WcryuqLsNpQqMmE0qi79gG8YiAFcQVtQKtaFnLy5Csa4Ub/MPJgOJezh8GhnFUXNjh
         LguO/io65wphCTKZA2G54Jd5wm0SwsmaLNH/26cDOdoPNvUWf0UO3IpjYQfwqvtxiJ1S
         x6pg==
X-Forwarded-Encrypted: i=1; AJvYcCUZbCg9SMSiICiGOaJkRbsXC9oqXSZz5PqC+dkKRRlu56X2Y6ISsbu+NWGupFGmfT+SDLGTNqXeVzrDrcnt87QL@lists.infradead.org
X-Gm-Message-State: AOJu0Yybp2FUnkxWIk2hZPo/m0AldS8PjCYWj79RhUNU8mMBT6RfFMRm
	L6oBOtF0a3P8wEkM7/flC25CKIPH7n4vpfzy+x11ehYtPFa/miAv
X-Gm-Gg: ASbGnctntvlzD0UwRVu9kENpfUJIOrsADi+99AhDSou0ZnO9rc4k9U4E+81yOzuMxmA
	25aRKGdyD3bIUjtubDvHzYR2NjwJm+t7h9ABAorX4sWf/KYZzPaNKT7J2D5CbO+z9rktb2UBZTR
	q3LAycA5GgZBseRtfvpTataf9hdpf3GzyqiYRBax+ytRGMbAiLQz4roXVYz5190GWZua9W6obRN
	jdZoVF+XjurzenX4x01+Yr5B61OXnYnFN1Slic5WP3xw7RWxExEG3FPITWLzT5LwT6zMHhC4v0t
	bICnTSQEjQYcXtffFA==
X-Google-Smtp-Source: AGHT+IGYIx9qHgSp+qZcb6/qvb2+gwFM/rh4dYNGwKpwPu7lcZcsAaPnt+SRsdlsmCSE8/iIZIKG+A==
X-Received: by 2002:a17:90b:3d85:b0:2ee:c4f2:a76d with SMTP id 98e67ed59e1d1-2fb63d33b30mr417216a91.21.1739290100762;
        Tue, 11 Feb 2025 08:08:20 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fa618e5e18sm6040478a91.41.2025.02.11.08.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:08:20 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Wed, 12 Feb 2025 00:07:24 +0800
Subject: [PATCH 03/10] drivers/perf: apple_m1: Support a per-implementation
 number of counters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-apple-cpmu-v1-3-f8c7f2ac1743@gmail.com>
References: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
In-Reply-To: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5023; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=tmdsy1Oiq7FNXqzIGpnSzLce1hbAiDf+aC6M6dPM320=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnq3XnbAbnbjs0YuJEYMx1pG99Z7Cr2COlrwO3p
 sNCmoW2gYCJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6t15wAKCRABygi3psUI
 JHV+EAC0De5KVfZwznUq4lQA29PrIK5zuWm90hiZxr7iiRwCDxlB99+q9Fsfsm2Xkb0ptgdCAl4
 76YdTWOWLzQJvcvPYpKimJQR3F7K64bLuUhM8UfYMWGVkMo0ZSKfj0aqVUbCgVBWaZ4Wt0lfZKH
 K7a/1m6Mmnw2qyCfDL76l2soBsDfZ5OpvnGRPDsflRcDCKkOl2bjryydrzFx1WGXF8l7Uq9/iUF
 6i1BjDsM2VqNz5KZnDf1EMjZImS/oBk9hUVwtJQzAWPYNjg12DrV+F33o4zdiVW+eyavODMvhgX
 U1kBKvQ79ncaYvSORpf6yEvk5EiXRKmzzlsF/L0WJP2iM20URftIMQte8fDUQqMO4obS4lAUIkW
 a00PAy3lHEa2iUSd5oPxu3QxhQ0+BO54dp8WpYZh/NfbwTUHXMGAA/CfEB6mXLv1aFCL3MqIeTT
 xLc82sYMOA4A7+mQtNLzgm1qay92AMtyEY7aBLmtQc06xRKweVaA7MuI1ciUKrK7o/ZdVFidfFk
 4RelnmYLXzRGmXfDZl+l3PECz0AsC85ALX+nEX8MwhZmRt4pXgy7RmzH5xuEJQDffYlQIAmENFu
 GQBFSj3RcWvfPdPQW8Za80km9v8iFdLfbTFrKAqRC+qhH+lzH49Qwx55nSQqx8C0/mKPQsm3fJq
 XXHUb2IVowrlcTQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_080821_726755_BAFAB87A 
X-CRM114-Status: GOOD (  16.02  )
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
index 1bf7ce5c09846c699d66bdfcca129f418a9dad9e..ae91848bcd828be197fc21bb2195f3e2460edc65 100644
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
 
-static int apple_pmu_init_common(struct arm_pmu *cpu_pmu, u32 flags)
+static int apple_pmu_init_common(struct arm_pmu *cpu_pmu, u32 flags, u32 counters)
 {
 	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
 	cpu_pmu->enable		  = m1_pmu_enable_event;
@@ -598,10 +604,9 @@ static int apple_pmu_init_common(struct arm_pmu *cpu_pmu, u32 flags)
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
-	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_47BIT);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_47BIT, M1_PMU_NR_COUNTERS);
 }
 
 static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
@@ -621,7 +627,8 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_firestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_47BIT);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_47BIT, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
@@ -629,7 +636,8 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_avalanche_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_63BIT);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_63BIT, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
@@ -637,7 +645,8 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_blizzard_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_63BIT);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_63BIT, M1_PMU_NR_COUNTERS);
 }
 
 static const struct of_device_id m1_pmu_of_device_ids[] = {

-- 
2.48.1


