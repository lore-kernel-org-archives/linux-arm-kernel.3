Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFECDD65C7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=baePLKadh5VeuMN7NIEHaBw4znqNJn9lrkTnuuN/n4Y=; b=ZVDIbR81vj+MCNNtvb4oXJ9a1O
	mqB5dVZfa9mxh5HExys+pfLIxOR5gpsHAssan+90NVmv8giqbtAKnUouA2xMTb32+eyiIhj9oLcZw
	8T4lzX5/TrHh7AJYx3kGiE1vr7mRrhEd4xgJEtl/4yvlRRDvxc/fUT9ksfrVn5MKMpefT0Nha1Stu
	PCCY9ZFEDIcuqpRCPUda1VCD/v+18wwCdZGQiyetk4tQ1PAP2EvhGANRrkyzLVOy2XDStri447jPc
	pgdX7nQR7mk2lyLRSpqhEB8SsjZ+2SbXFDhCBv7iQolmvNjhbezHZ/ZWzKyTC2/WDB9g2siCKzy1h
	8f4genpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuKZ-000000074ml-3Noj;
	Wed, 17 Dec 2025 16:24:51 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuKX-000000074lY-28Ch
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 16:24:50 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a0f3f74587so43569175ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 08:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988688; x=1766593488; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=baePLKadh5VeuMN7NIEHaBw4znqNJn9lrkTnuuN/n4Y=;
        b=dWTnMlHmtXZe/2BIoqI8G7aFNusDm2h7V5FoZtEtBJlSRMGEzuRxo+Xk8MUusf6TxH
         d7Nit64JmXKAnxumawAe8Ka9kv2VqhRVpDaooxNL7ObwOt7+XIsfoC/eRYsKFDsR0Ik2
         54eUo14cGSGH3iQp1Mx23Y4Za6tJomzp3Bzt86+cdRqzbKz5Qj9DkT90Z+Y+PYPOtELz
         e4v36Os5Cmf4HG+F+O0OgUHbb7Zmn8n53PFTfSoyrLLUV12nfC5yNdF47x2tNzHO+yTu
         XehhCMI7Czl21gHYRMallV+Qpnihmu2n/RHZHNceq/ACD0119w/Wilh59m2h1zgLXxh0
         40OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988688; x=1766593488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=baePLKadh5VeuMN7NIEHaBw4znqNJn9lrkTnuuN/n4Y=;
        b=Jjqlf3kJ87fpLx8N+flIkqGVLpdkQdVMWoBKco5FICc/7eqMWADXpxn/8rDifbwVg7
         RL6eLUsjYmziCixD95pLNifINEUphrngFqDBO/i5VY3yzG4oU1R4jhGelk/YRa40Ac4Q
         lJ6Wg4KmutXf1Z9qjNH0if6kxQWyYzPc3BmnmRyfaGUEGJToEtrWYCc/54ggDxC2cNE9
         lJ5Mco526CAcinDoj529VeqKFSj33oIfG3uy8iLKcOEMjhGXRhH4cq0Z1sarqPBsCQkY
         cneDcHqwZtVVG0YLSORokIFwSpNSybWkY+c1g2nqrwt5t5MDPIeXFl6pklbBjI5uIOND
         F70Q==
X-Forwarded-Encrypted: i=1; AJvYcCULZlV2oOzF3qioYB0ZqHcfd3jIyD1Uw+RQcVXDp8SRAnQjnoZFkPB63wOYG23U2M2IakVf/wiLvbI5KzxK8CrT@lists.infradead.org
X-Gm-Message-State: AOJu0YxH/GgMC7ezU+Q53H7Q8x47iOifBTX+uGIxZVOKK7CYzVgLCpZz
	EL2pjKaVusP8C1c6vKITsVu533Frs9AIHru3EZbCHaE2NeBYLwxAutOE
X-Gm-Gg: AY/fxX6vKdUeGLvmEtfqhYU/wGu70ShTN5gcZiJwVCZ1s7eeBuE/toZIBkghnooD5pb
	pes5pRzFM/GdYLoaC+0lJhzG+ruHStW1umKB97n4LZI0KfgrhR0l8zPJwcLqwxXq890fyg9UtXr
	73cipFTKXCUjfT8RRBy7lcC1jo0R+j6kzcms9GpOy6mn8w3/LjOFV9my1fzWSXSg+jBC7L1Pj6Z
	JvRoQ0R/SFGHtDgoRYZtuztxSyOuxOb4nRtDmloYYd1nXdO1tRymaEdpMVNrvGiV5KBBMVlowt9
	iaL9l150zmdq8WzykeiEEkKNgpmDrm0P6u477D+ZpzuCQAhrBWRQkUXPK0NGb71vvNgD6M1rBnZ
	K/j9804VPBUi9Bhf7Ime9Yc0OCGxek+Rm1PzW0bcKtiEnh7ieKuYlHs/tLObiEM6zwR/71A40jn
	0a1JM0BKfPkAPI
X-Google-Smtp-Source: AGHT+IFnI76IAZxZQYfdU0cvowu4POt/fXHKU7/xVVfniBzosjklThD5++ABZlM8rP8ORaLE2hP2Rw==
X-Received: by 2002:a17:902:d4c4:b0:2a0:b06d:1575 with SMTP id d9443c01a7336-2a0b06d1731mr114240415ad.51.1765988688494;
        Wed, 17 Dec 2025 08:24:48 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:24:48 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:16 +0800
Subject: [PATCH v9 03/21] drivers/perf: apple_m1: Support
 per-implementation event tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-3-4deadbe65d03@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5769; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=GEbwxw7PfrqcXKYl5oW/iB71cJY49weGjklHwoM3hyk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlA+kasIgm1d08qjNIxyta1PI/a/3sOaDdH7
 YA5jw2xb7mJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQAAKCRABygi3psUI
 JDdwEACPnOcKvw3tvd0H4PzxLqD37zGgX4/vymjIZG3u0NXrwb5zOPTzw8WJKqkHmNqGfnO11Ib
 scXDgtoGbyWB9s8gBMerBXP4ThOrNXZbv5hR+KklI55lXDp6wD7Fm9uMbC2stuM2AyLDDT4FJQ6
 Kg1KdCqLc3pMjU3NY6G+AEI8FCxvU3/um9aRSUHW99YriLwj0JXjzu2LaNSTPdt1DB4JYb1ybe1
 5Ge2W4iv61OD7NhK2l+AyvyVMQ9hir4y9EQi4TpmgVIt6HnCAbscER8Ynu3mVSwONZQTC9bjrTo
 Xgiv2JyYMU6AqjdLKSgY9S2FumujMQuSXrelx8Au4uTtydMNq6/s9kkdq9TdPM6mMORZw88ZmSC
 Zrm1mXk15raFVffuG/Q+y1wvyH5CzVqqGDo7EiBMkoVIMv6ry1wDSd8ZOIEFf5XckNjkbT9SMLp
 A1Iu+CESQcJVexLbhZS5fj1trysT5xUjBEeMaPFVj9FZ/HFK8A+JdP/Umq/eDOTdwvqqklqY3Sk
 8SbZxkxPnaP3ojeFJCNDjxJfHkxSm8LaOYrFXAwVcFQrM85heU5PqBVGpqGw5I4ukbyJjDKrdWi
 bVvyyv6jU9dT2ShKSykzKE2E6lUZJPQ03n28lcgq4Ub8g5NP+CBjMOzqLET7BQLVGfjm6ACLC33
 YzBMTzWFhphvd4Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_082449_559847_F12CE8D0 
X-CRM114-Status: GOOD (  16.98  )
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
index f3948528e28e0189efd0f17fde0d808930d936af..b4ab6a3e5df965b7ef450d7e533995f3cc8633fd 100644
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
@@ -493,11 +490,12 @@ static void m1_pmu_write_counter(struct perf_event *event, u64 value)
 	isb();
 }
 
-static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
-				struct perf_event *event)
+static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
+				struct perf_event *event,
+				const u16 event_affinities[])
 {
 	unsigned long evtype = event->hw.config_base & M1_PMU_CFG_EVENT;
-	unsigned long affinity = m1_pmu_event_affinity[evtype];
+	unsigned long affinity = event_affinities[evtype];
 	int idx;
 
 	/*
@@ -516,6 +514,12 @@ static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
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
@@ -543,7 +547,8 @@ static void m1_pmu_stop(struct arm_pmu *cpu_pmu)
 	__m1_pmu_set_mode(PMCR0_IMODE_OFF);
 }
 
-static int m1_pmu_map_event(struct perf_event *event)
+static int apple_pmu_map_event_47(struct perf_event *event,
+				  const unsigned int (*perf_map)[])
 {
 	/*
 	 * Although the counters are 48bit wide, bit 47 is what
@@ -551,18 +556,29 @@ static int m1_pmu_map_event(struct perf_event *event)
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
@@ -623,25 +639,16 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
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
 
@@ -660,25 +667,33 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
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
2.52.0


