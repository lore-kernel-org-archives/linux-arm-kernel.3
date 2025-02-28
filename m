Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE98AC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 04:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7l6OBjbdguvzVanhyg5QiPXwRgVYnvgdyH/pw82tHlU=; b=gkkjgIemecCpniALvB/tb0i2uT
	CDYwQrvyRP/J8/9sMYSyoBmgdOSkPvmuKwowzMfFh1fMDkXRNXlGoRsEzDEjnrOCpWJuAtcFd4VMu
	aNfnUxEktnj4GvsfEUXvztdplnfONopkaF4YJBkJCzA60xD4bMeC4C+7yE60XJNQPLroeeveBa+hs
	4TJZSOzkAcpkYTMugsIBupHJ9VmBvFjpprE6h10CAslVwIM1a8cKo0OivOnODpphylOBxBkquUbjJ
	076+9YGNw3uy+pbj/f2cbYjgUN6z5l1DdxzzlICuBPAQu3tKJq/L319PR9JmRrFsW48gnhYgF5meO
	IFOHl4UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrnq-00000009hs3-0Yv6;
	Fri, 28 Feb 2025 04:16:46 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrjO-00000009gkV-0miz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 04:12:11 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22355618fd9so25880175ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 20:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740715929; x=1741320729; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7l6OBjbdguvzVanhyg5QiPXwRgVYnvgdyH/pw82tHlU=;
        b=iT+E0eOsBLq+FWjnTGNkh/wSrxrRS1Zv+Lh7uUa8RgaBsgX74Ow+JR05nvj71/VmAr
         k5HCBhY0DTGuCULHYWEcazkCv5BFpTM2P8sOlFn1ydJGMr4afhXpUXVak5w0AiMZ7FOv
         1vhMZwNvuCNlDYtxgGCF+jqcaeGQg6woO2T+G9G5OSjOyQcDxKrKixph2lULEnLFRx/z
         rknmJWARxOzFxcpL8r/VarmtMOhrM8oDMoLsIrLfBlygJICXY8jPExsQEewU1kxyo6cx
         0yKFnLQ2K+h1FXSIJnIN8qvrOtwqcLVvH73nU8nN1X7Mq2nQElewDiv5zZmL4+AAGd0t
         WBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740715929; x=1741320729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7l6OBjbdguvzVanhyg5QiPXwRgVYnvgdyH/pw82tHlU=;
        b=bPr4vyeKVwJCd91U7hk1SeEVIVYjWzWBtTL1Pg2sKcSC6OLZyNBonP6VnnaZr8cmMX
         lyqTYoZ+R+BEItYYmmsFeuY6uPdkzgQUoIuljP1I87OwhLAMkjySQMHuYMEJ7j+erqmt
         WDF3f8t4JpbwSSM1ffVMDw0867ZGZHUGCGLll7wHBtRa8i8WwAp+fGXB29N9r8WJ8G42
         jV/V0Me6a43YGwp4XpTOY1gbyUBy8CpBhsrAr6jQHQwafrdh3kSmpiK5qeqtM+O7nNY9
         7ymBHEzz2uB+agpBYdEvHjss85QSIRq5tWUjlNdj9mHhik/L3AuOVZp8icLOeVnSsG+h
         6LNg==
X-Forwarded-Encrypted: i=1; AJvYcCX4s3IfXatgYvXtXFzWwYkhAIvYMiZe3O+w0CorBRhhY5Nlv5WfMhQ0Dkxn0zh5IcyEFvzc7LHq1w6//iJjVlyL@lists.infradead.org
X-Gm-Message-State: AOJu0YysaGBfsEmitFiQbfy0vqLY7Z+sbTWqz5uKIUchCMZU/8d6SSlq
	llP5RkYM2mMG1uIjwASvQiFOjiwaxFJAJ7/B0EW1+oFK9OMhpqXH
X-Gm-Gg: ASbGncvWNqg9AtVA3crDyBK8azYT4lbRNg/GmRF2niRWy+eccMLy4OKNLZVKhHE+KOe
	xyG8s3qyVq+K9D7Oqg6eXUHunfyPA54hPwKhkwBB/4E6PNKsjFm0RzsmUMFimEsj3d5b0kxMDOS
	VjrTZZELAgct5XuTrJMJbuu00ot+mSp0FVQOzBwVerEtPZl6IMpIAYl12/v2UDMF5KyYwfE1Z3E
	kkV1h0ALB+p5rvkYx2i8QjcLoU7EMCKscB3omEmi7irdK+/yA6p0ZmboHdIM8N2IcuCp1RLTU9o
	nEnY95y0KRMXeNhg9T0PrdSQpSs=
X-Google-Smtp-Source: AGHT+IEYDQXIbIUl2hA4mQuIhbcCAjga8Xha/YZWkkdwnPtEP1alrz7wepIj1Qzk+976osnHuTy2ww==
X-Received: by 2002:a05:6a00:84f:b0:728:e906:e45a with SMTP id d2e1a72fcca58-734ac42cf9amr3499439b3a.24.1740715929284;
        Thu, 27 Feb 2025 20:12:09 -0800 (PST)
Received: from [127.0.1.1] ([49.130.74.133])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-aee7dec4114sm2387856a12.57.2025.02.27.20.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:12:08 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:06:42 +0800
Subject: [PATCH v5 02/11] drivers/perf: apple_m1: Support
 per-implementation event tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-apple-cpmu-v5-2-9e124cd28ed4@gmail.com>
References: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
In-Reply-To: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5765; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=8lUtIdaUZ74bJi6U5U+SM7syFrwG6QLTTZ/s/7A0PwQ=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTeIlNpHaNLlhhgZedgrNR6t68Y3sydP5gJ5+
 ljYARuhnNmJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E3iAAKCRABygi3psUI
 JPGzD/wKgqCzV5ZnQ85NmEg/pVw1MVnRCA+PrdZeO37Pd5acoqcah8YEn2aWYYSSIlzWbJDocPg
 XMMjleWGaV5iHrCuV6W4NeDn3tuU0lv/9ENekmf0NrAbQOiFO6rvA+4zabdUS0tBk28CZuEIepR
 9RRO6CAqB3j+C5iVNc2LgxSlUyQeuLjx63ObExJrn8uz48sl9B6YjTo8nsXZGUBNH4m0tz0NFWS
 yHNhHD2TjGg4kzVeHN7UjkEx5RtyQjmIrN9kSRVesUdWHH75XWSyW4M9WfPPSv2uoSniPSYzmf6
 b3s6BfRHQBY7r8qxFzWujHarI50eADEDttFO/bsfKNoNvl2944xJNpT+aoxyemVfL8+fwC2+b0f
 N/t8F4m/IxS+BWrcM6p19NaQLoOdTZ27EjLvPm8y2A196sFAPzguEkKZY+rQ+QdMjk+xAxqINFF
 AIeeKNUOP//ubWc0ijZN+uq4WJSDUmGxFWaHB1uaNLgh10zk1j7acC3s1uMSsKFRiKWpCw8HLaF
 mfH+sB6tav8ZkEpJHE6wW1hfK9QeI7iRNmti844sjYHMv+6coFXS9n2MLWFqoDeW/mB0KLt6Wz9
 fsOrtC+cGKNWTQwYYpqYNkpMurIcc28Tky/6eni1+eBSf7sOkn/vTDSqaniJs4CA5DlLv5pncPb
 mIKs5zLkFno5Plw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_201210_232339_10F47CE1 
X-CRM114-Status: GOOD (  17.20  )
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
index 06fd317529fcbab0f1485228efe8470be565407c..dfd5d72ce9f3c5bebd990b5df6a6823fb7785cce 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -42,9 +42,6 @@
  * moment, we don't really need to distinguish between the two because we
  * know next to nothing about the events themselves, and we already have
  * per cpu-type PMU abstractions.
- *
- * If we eventually find out that the events are different across
- * implementations, we'll have to introduce per cpu-type tables.
  */
 enum m1_pmu_events {
 	M1_PMU_PERFCTR_RETIRE_UOP				= 0x1,
@@ -466,11 +463,12 @@ static void m1_pmu_write_counter(struct perf_event *event, u64 value)
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
@@ -489,6 +487,12 @@ static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
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
@@ -516,7 +520,8 @@ static void m1_pmu_stop(struct arm_pmu *cpu_pmu)
 	__m1_pmu_set_mode(PMCR0_IMODE_OFF);
 }
 
-static int m1_pmu_map_event(struct perf_event *event)
+static int apple_pmu_map_event_47(struct perf_event *event,
+				  const unsigned int (*perf_map)[])
 {
 	/*
 	 * Although the counters are 48bit wide, bit 47 is what
@@ -524,18 +529,29 @@ static int m1_pmu_map_event(struct perf_event *event)
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
 
 static void m1_pmu_reset(void *info)
@@ -572,25 +588,16 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
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
 
@@ -604,25 +611,33 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
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
2.48.1


