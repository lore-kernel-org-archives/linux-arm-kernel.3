Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44077C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 04:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gry3bzp7sxRtt2sNra4Mhddxnl7ZGz7/lk3ev5LDghw=; b=e6ycEOfpI+zOr79qC0J0jjczTj
	EvI7JqwZnvo0eVSNoi0U0ttw9L8fQXsYD1A+FTXl+OkQVz3OZrAi2VA/gJeRjWrAdd3HPklxIAv8X
	d+B1d9wHKIWik3VBr6NqjgDwDVlrqipyCbHb8ckIV3iKnTLAuOeco3hiG5d2oml0YOMsbS0D0EHVQ
	8igZskG/TZtx1c2icy7xcLdCoji1WgBa0qxKHF7JmRAZ+INfanmaGP4Mub4koAXPkEGycZZRWs1Dg
	/SsEQvshfit+EdOYzAy1LZ/hKoJmQiAEvtqb4uCto6/rLXDppl8n6CfkOnxwptbza3IB6+Mmf7bNW
	a70csqEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eVj-0000000GOGo-0YLy;
	Mon, 07 Apr 2025 04:55:03 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eNG-0000000GMhb-2m52
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 04:46:19 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-301a4d5156aso3694709a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 21:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001178; x=1744605978; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gry3bzp7sxRtt2sNra4Mhddxnl7ZGz7/lk3ev5LDghw=;
        b=A25ZkkOCb7djBCM4UBmSb6NCTQjyBg5iD5pCbduXbkCO7N8dFhiphwalRMTiNjrxvc
         4WdZdFoMtOFSpMnklVVRZAndy7rDX4oL4rX86ZJDa06yxpwrUY0HTxcIT4lwCYj8QDhZ
         njpI2Y64evUi0wPJoEwztWmMZ5lk7YOWHNRdoKz49YXkHtyTa4UeJTtnwM8aqMbFMLhY
         Z7wSsNImh2JZhFdoMAIoGYwaveqhpZxW6ekx28R+YDZVY+mlGQwHWPrABmzYfTpZOtkA
         CYnx4n43JynVXlXg8EOUzaK8Oy+r4Th3CoQncBosSDQjVlBMo7D84aRiyBfYYeVfBtq3
         6MsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001178; x=1744605978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gry3bzp7sxRtt2sNra4Mhddxnl7ZGz7/lk3ev5LDghw=;
        b=Aavv5GC8k5Exnpsc53OcaKXL9aN6/DwJFrEsl3R0+hcaldPkC1f8irUieuMSejaHIW
         CPbnWPZ7j403AsoI+5eSjqTgZaLERj5V+3dGlGnw7BT+anLQl60VkpFxomZF0Vov0x34
         rxk5G8EnzV0ytkht5UdKkdeWKFC1gMivBzLOcCg6M68MxGT/zESCc3hSOZIsw3iVwVIN
         YyWodAER959qAKapy6fqOYYhVxYfbYfpD+CrxfPeNamMiArrBHec3iVp9z1Y9P3l8ECl
         bOwU0r65RzS9gOhskI/e2CjA1NvEg9V/nUdmuMTgt0rjudOHwyOffXMRxZbHP/9M+tZl
         Mf/w==
X-Forwarded-Encrypted: i=1; AJvYcCUxhwY75KrHXi6jCSf5gOv+24zJndAeHBCMJDbQf+lrKfWwtQvT+Coxdq7NsQuizRmIRyCb7TXGLRfNH5YEXBod@lists.infradead.org
X-Gm-Message-State: AOJu0YwbPyGB+yuG645ojXmbhu5d5/SH8qadsaMuV0zsEY9XVIRJYGtx
	uJsqGX6eevxeKZWAsqbxNRIEuhICAJrQz5m6ErxDZtXk1zJOVhLi
X-Gm-Gg: ASbGncuzUXWG4tog4PGm1zr6m7cTmGm/Egl0SiDGblpHWVpmo48BnpVjuUD94XF6Va0
	20pcPeG5i7tSGC5IaMWhSIeWcGCeAyyiMH0Uzb3zgDAuOYTrmYBmit6On20U6IffTJDMx9/7qu+
	3FATnU8Y4ZcgKlO5aVBBHXtl5ztRha/4Pn/8uIjncdF/N/+kj9j8/zuDSiUtOwTpw4p58Zul3v1
	qQ1EOqGcc0mqwKtPAmtiFNfgX1DE3ZDYqZA/Te1+X5CmfZ+ZGsFcp2Y0WS0LaD15wYhGSpEhezH
	fWIkZxn9CIHN/Z9Av9YMMwPr9uuPYUoYIAqgiOa655WI9iSgdPsiX3qlHg==
X-Google-Smtp-Source: AGHT+IGrn96k8IFooljFjwgzgf5cA5zXbc26sJl4BoYnJK07cZUWI2sv800GQNYeOpWRf4WuwWHOvg==
X-Received: by 2002:a17:90b:574c:b0:2ff:53ad:a0ec with SMTP id 98e67ed59e1d1-306af747edfmr9119148a91.21.1744001177647;
        Sun, 06 Apr 2025 21:46:17 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:17 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:13 +0800
Subject: [PATCH v6 04/21] drivers/perf: apple_m1: Support a
 per-implementation number of counters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-4-ae8c2f225c1f@gmail.com>
References: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
In-Reply-To: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
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
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iGqhUUZt9nky98KDY3T1B1WYbpyDK+8m3Yx
 gUwHxgLQmiJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYhgAKCRABygi3psUI
 JDKXD/4lIldbnqE1hTQRJKq40e4filHHMJC+4IZgtoHQV9zQvpGEB5y0InQPawHu8Tf2z8ghGrW
 rBHV/OrTcERXXaisZxR+bXTVybcA6IrSWR2xtyBbTlLv0e6p75USp3XfJ0oKhDY3ibrVizo6Hys
 w9Hmd5qCKxDTa0XtXAkg9/BNpxPDpvIwabca0KvcrKjtwX9s9R4/5GVu4qnSKpOprT1fphO1UyZ
 wld4wNY2RM/Zt4usnUnFKQkTSYgjKU6br3r84+0UPJWVzkR/6mNBZkFVJaKVvOjbhC/L8cPn5D8
 Zdy5vn4MDTE9QVufxf/38RkCD66qMLaPrCylqsz5pVPWIBrJXfHK4JYgEFwjnGxnzDl+xCPUHhw
 oPXbMpK9+bc+QbF9fDRPWlK6hiQwBue6RdGmpByoRLuqBT9ZENx4htJz0EzIB2rxcWyTS+I01M1
 z5mpVLKKeXDaGC58kG48Day4fJ3w6ielBMs3hnLwz/K9FHX7eG9N6KJHttopx90aIj1e7bbxrwF
 soGeVQeFJzQlZXuvncRaWzfuo6aGqiKbqvcMGtXi8kkp4c/Rjr1hxTRYIqzbNZgWVXfycklDUqh
 zsrgUbWygnAwU/kVcmZLGcEId7YrlqabgJaLzs9kaFcHJXzSXN2+FaapQKmEkSf1GaJWS1ZDrsw
 CTg+TUuCT8qrznw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_214618_705776_B452D07C 
X-CRM114-Status: GOOD (  16.40  )
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


