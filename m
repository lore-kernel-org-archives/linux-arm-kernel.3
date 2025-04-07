Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2038EC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 04:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCbl29XIT1I4WAOKH87d2lc5ACONSBDEpnw9mXpBPIs=; b=jbLfK/FTMs0pIBf0+qk+0jEJyV
	weeEz7uXOBOvEuJPEvM7ILroltgtFWih9qN17sBygdJ9bUrIuSX4d9MMwIFR7HxIeEbzFqJVqEnWJ
	Q7OWirbQ3eTpVY8jxHLkHIN6T11z2oYGNpEASqvGHcoAum083O2qQFFYwxcOQxF2xRzLxNn2EdY15
	0MfapnLLaoC+Dvby5SXVhffQS9cdro9a8yKa+e27kehdP3EHJhmhPyx6xj/fCA4OSVahZ6zX4yItX
	OnqY4VwFubLwjT+0jTLeqpOf4bU6OS+mz1A7TKU9xIG2n+buDcJ6t5gBf3T6UXWoG/AiWiTciiFUP
	NZivAINA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eU0-0000000GO57-1uUd;
	Mon, 07 Apr 2025 04:53:16 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eND-0000000GMg2-0ItY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 04:46:16 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so3243556a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 21:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001174; x=1744605974; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZCbl29XIT1I4WAOKH87d2lc5ACONSBDEpnw9mXpBPIs=;
        b=C9JAzSjbmueMLBkaxeuIRtgSN2ii5gGJFL/qQRF3yIjiLVyJzzP29PCxhFATyLbGZL
         sNa3XboXfY13Q7661iravqxh4f/QYYWqSIgnNudkb6gD8mKql6GqjgN21KgbDqgetGJ9
         HP/JenUAjp0nGm9SzqbAipK0+Ukdwf2wxoG3tIP5z56Zimps34GLgisky7+ZEwVNKD0O
         prDs51PFT9kn+fRV9ZnVdTDiS82xoDPhs5QwDI7v28wlsJu85MzEqSN2WzUMxQVoDzjR
         h7OiLmxEJWdzGGZR5aO2g4JZ+7nSpXOIPKJ5VOOrAP01mD32FpyQetvLU85YeFq26Fu3
         M6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001174; x=1744605974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCbl29XIT1I4WAOKH87d2lc5ACONSBDEpnw9mXpBPIs=;
        b=lYUqWNkBsMnilqExtZFJeXAWVT4euylepv4xRjClbZLrS7HndYIHC2BXH0ihabJ+m7
         zV5DAyKWufRtRgfaQM0T/NCAiO3UzG+sZPBXGa9KYim6mnmot+gqmA+GsaI/d+t8fmxY
         YK17ktVuuinGpml0C6LIEzY9gAz7UKmyB7/ILwsDlqmdH0jRvRDaazqARD0DJ+MCMJnn
         rZj2/Mq4YCFtZKEyOOrQbD7nkDA3lvvdjY6CH1tHp9JlgWLDfyq/xeBkULSOLUUWo1ir
         InBYZ5xqt7T15qY509dod5aJEE4N1XwpH4RKKw9E3tjbdHNXFBdQRFBlGafFZj3Qgew6
         LC6w==
X-Forwarded-Encrypted: i=1; AJvYcCUpId3mGidkGYfiAQWv/vQr+zFNoDANA7TdQCb0pxHhCKRTksrAFG9LYQUZyj9WA7Cu39bZ4zkI+JtjyVObJfLZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyEU1x9QVOH5TtxFCp5d+1NHg8Xf94eTlgvSnlpRYRmMFmCmZwf
	RMyaY9FDFeJbA67ucjybBW/WwDZLUllKDS5A0WZ37Q5f7orjrpl5
X-Gm-Gg: ASbGncsi8XDxle1Mku4kjys5k5hRGLaesUY7y9Xbt0mHhXjSqxQxoltCH0kCYDA4b2k
	3epTH34p9ceYb37jtmNfOT+BF2q1VbcW/QmGtXnWOu9cHy8fs+TWl/CT0IKjcrdG1iI8MNOvjEZ
	NkzaByKHzxAPLAUN2CEN0QfurHg5jxEfXGbA9WfbFrEJJirZ2n2bHUZ5ULXz1ls1Einb14vaLS9
	+JnWjuQCVZle33FyydnQQJf8jqYKS5spRDOcOHqt2PwfY85qcCenbKEBdQEQ7/x5EP8/8yqqLa5
	X1PeB1HuBdLuzZKL1i/PRpLEZMAW3ipyeTd0U3P3XXE/ERZgEHMDQZCGcg==
X-Google-Smtp-Source: AGHT+IG56QxhJ8o6lppK5g8KQzt2mjlnG2F6bF61e6G66zfYjuaC/cfZ+rAxlP2uwAeBQQjiL4eZyg==
X-Received: by 2002:a17:90b:498e:b0:301:1bce:c25a with SMTP id 98e67ed59e1d1-306af746caemr9540025a91.20.1744001174347;
        Sun, 06 Apr 2025 21:46:14 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:13 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:12 +0800
Subject: [PATCH v6 03/21] drivers/perf: apple_m1: Support
 per-implementation event tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-3-ae8c2f225c1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5785; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=EJFsNO1IGYgWw/sW/3l8ohSThIK8Gp7CsvED/Dkp2Hc=;
 b=owEBbAKT/ZANAwAIAQHKCLemxQgkAcsmYgBn81iGKE0zEYSiAoOBhSC+TnTK7fNCFMRTYvM7Y
 9EFozFfzcSJAjIEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYhgAKCRABygi3psUI
 JOjAD/iZeh+v/hHQ9QkbyFUDYHTRNsZDJmI50M8KeuFjK+Y6Kiwxjd4JksnsOFWLiCPRTKEjW74
 LQv84yH6xcHNytk0Rr50N7Ic/kYHlM08/AnELmDso63nC+/M7WghEjXc4711G/WSFQS2CNdCEqQ
 52M4QbqSzPZhESod+ytQ1e6u3EBqcsyRX5RbywAvSSFli43aDjpyepPnQ049C1V2H8vu+dYPbCn
 vrR0W2oK0YMPvMiF7G/UpIcaUYjhu4nndMJZw8Bc77lCajsrEwvxUZ3Ta7UiGBxk2oY/lhgBU6p
 LRVoHMnuodVopxbkVgjqLZs1v1e/1zuwkH3m3NavJyu1nDCADhkD+PS/WxTYc21YJgwn7yJbcHn
 b9ti8RLpWHQhPrIDixgWmAgvFr0pKnw3QpLqJfRV3i4qv53nGEopgBxZcdEYnRjPfAVfjMqxyB0
 PzKYWZJrA7HIal+h1tmCUDlWzM+HNsd4EGP600bAfrwavtiDq16Ckap/VttgU42730Fjm/ikBE3
 Jtd/LQv32Ah4f9bVPmGUs0IL0w6pAiztFXzPMq/V3JqbwR3WeJD64tVX0kRwsejP/qfCXNtE6TA
 aljKH28PylFn4c5G8cdnvftd8pFVi96C1s9L7BIUZQD40ruC7u3FDTecGN3aJw8LSV5fphS8WEz
 UiBkOT9+dKfc3
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_214615_116225_06E5735D 
X-CRM114-Status: GOOD (  17.45  )
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
index b800da3f7f61ffa972fcab5f24b42127f2c55ac6..d1bc850809993de044df8fd5d4dfc61341482ee7 100644
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
@@ -494,11 +491,12 @@ static void m1_pmu_write_counter(struct perf_event *event, u64 value)
 	isb();
 }
 
-static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
-				struct perf_event *event)
+static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
+				struct perf_event *event,
+				const u16 event_affinities[M1_PMU_CFG_EVENT])
 {
 	unsigned long evtype = event->hw.config_base & M1_PMU_CFG_EVENT;
-	unsigned long affinity = m1_pmu_event_affinity[evtype];
+	unsigned long affinity = event_affinities[evtype];
 	int idx;
 
 	/*
@@ -517,6 +515,12 @@ static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
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
@@ -544,7 +548,8 @@ static void m1_pmu_stop(struct arm_pmu *cpu_pmu)
 	__m1_pmu_set_mode(PMCR0_IMODE_OFF);
 }
 
-static int m1_pmu_map_event(struct perf_event *event)
+static int apple_pmu_map_event_47(struct perf_event *event,
+				  const unsigned int (*perf_map)[])
 {
 	/*
 	 * Although the counters are 48bit wide, bit 47 is what
@@ -552,18 +557,29 @@ static int m1_pmu_map_event(struct perf_event *event)
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
@@ -624,25 +640,16 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
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
 
@@ -661,25 +668,33 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
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
2.49.0


