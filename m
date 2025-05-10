Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7EBC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 15:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMIBDXt3IAT64Smd/QsEmSBW2Kr7RYH+ZBjKqzd3OdM=; b=pHI2XgD8UHJfuefDnAAXownqcU
	3hXUUK0hYuEeRHpdvY5zWMv2m72UzC2pXXn57ohrvh2XOiNauV5h17/xzLGXEg5OMAoUgclGpNGnN
	CK8/+a+E6IHSTmTfWUFtuewa/p6rapRIgs7YBRyFMO3dQXdjmOB2nyGOrBNs06h/P1kwPwMqM4G3G
	gz1zkBX13OlR/dw/NsFEIwWOkFn2vphtqDH8o5zBau6jai3F2sE7gTx4F0K/kqzaC8R97uYs+/vFp
	HFp+Vm/zUstXvc9Wr3Tyy22z7nIc+aoSyewVnU4NPnPYJQXpSTaZ6dDEdLaVjqfWbcC7uLnbdqzii
	+Mg1mIAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlze-000000065Ln-1ZFi;
	Sat, 10 May 2025 15:20:02 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlrX-0000000644u-3Axr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 15:11:40 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-30c35ac35dfso2160128a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 08:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889899; x=1747494699; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMIBDXt3IAT64Smd/QsEmSBW2Kr7RYH+ZBjKqzd3OdM=;
        b=KqNIA8NgNrLAjHIotL6vfXXnJPA+zLLnCT2cYfTI9KZQ2h3KuX53LCv6x48mlTgthR
         7YH12hW7gmZpJ0NvhCpQSJ9u7VBO/8H5xGOAiXuWWMc7sfWcIjxqmCcyQqLWp13Zf53d
         L6biAR0yN7EILNEoXCcs3Ecv2GlXAnvRGOlcjejL9xqFvtLjJSgLDZdTSw6aG2ZnDWp/
         hD4i0hCweuTUoYyeK3m46an5FEA6eOPt+ocKBKCtbTFL88qH8iWEWndipsCuNDoZzN6S
         9uabileBGEhvFI/WkTuYSxQD4/lgnCjEa9NoeS2oU19n6Q3M/6N8CSQgsGhKNemxNExC
         DMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889899; x=1747494699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMIBDXt3IAT64Smd/QsEmSBW2Kr7RYH+ZBjKqzd3OdM=;
        b=Ph9nxWr6O2xrFv4PQRPXqTOqnb7AbHNs13nvRY9y+ymETkTnsp35ohF/3uyo343FWv
         ZQiEC1yv3cLfcfFkJaX/2edFDj5XrLEMDTttzOPVHGv5ktcNScj+0SIaSdf7oGMSP50t
         SpTN0fioIMN5tpaU7WdNYdO3+TlSEUvvRK6J2HzHqykAu3PB86gDjAy1i8KmlsE5mcGD
         wnxQGv8WLBxq0NMEDUEkVX+N4uBvdNQfeSU9ccbTES1LXn8PCvzqCvbi3EPwRn1ng09Y
         Zre/lwb8SskliX9kW1QjenirQfbWfmKfxFjVoIt9Vfr1qtSRGuPCrAuzNZMYBL08I9NF
         GP8g==
X-Forwarded-Encrypted: i=1; AJvYcCWzWQaXSza7XcgGqC0ZmShSTlD3nG4BwigHo6fLdVqciOZ5230kXRMsS0UbZAPXPAMZqyRyZOnm+vgotgVpqdey@lists.infradead.org
X-Gm-Message-State: AOJu0YzeHPQIz+5SXnbpY7m/WUdP+vcPFrvdH8LrdA18TYvU6VEGRjBx
	X/UPfzodMjwrdGwWzYiACbh72gN1NgfdkmAGcQtzqYcZbyZfxnBT
X-Gm-Gg: ASbGncswwWETL1ijWcbnIpxiw8gR/+fT0jowsabO6UYTP5sUlgFvebaeCwMDfiizgRJ
	PBH+SXZkhob2axZUQdaMj/mTCali253+D+hVAb6Oha0tV24R16xqBArKaHPdTuF0MawBWG6FpRb
	b6Ou+gZidaR902gnUhnFl066521vmgpstQdG3EpFvgp+lmjYprFva46k/Wd99UU63QwGKQhCL7b
	DQoOXVRC1C1NaSz+pONMgD0q6VthedGzdNEijwvmoQ1z2fOyQlrcQw8EeEvtdrcDVTOJPRD1b8+
	ZarqJqPCR8SgOt6TVxtW/x1bUVxFrchaS+b2uo8PxZLnKe2UuqasIA==
X-Google-Smtp-Source: AGHT+IFGAQvSkp5FuP8s6Ekd05DHEU91mrsGXhbEbbmC5koqmXT9CbW191uBwo7jB2JIqA6kyeBvLQ==
X-Received: by 2002:a17:90b:1644:b0:2ff:4e90:3c55 with SMTP id 98e67ed59e1d1-30c3d62db0emr11513587a91.27.1746889898831;
        Sat, 10 May 2025 08:11:38 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:11:38 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:44 +0800
Subject: [PATCH v7 03/21] drivers/perf: apple_m1: Support
 per-implementation event tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-3-bd505cb6c520@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5769; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=40iBkshuT7rxTV03RILkcUaTWGCgn/IFCgnsDvO8O/4=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2yayhIz5PCA9CQkhAbNeCgQ9GQexfDTqXWO0
 ctPUr1ixGmJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9smgAKCRABygi3psUI
 JCrnD/sEgdFU1NJujXIghWMxs8rHXtSyh92JAPQV7u0sEkfidYyYNdEBnU832xAgfr+6ZQsunR3
 rWcYGRX2GW+01RcwFsuLZL920aI4I/GYP7gxElY3gP0be6Q+yvzAdRxwkuvGwtCZPYS+tBEbyEK
 N7Yz0yOLPZ5PnzA0dalNlj5b7m5ANTN+7ET+RnIl2u/mQV2+PyBWTk4yiM3zYRSLHIxvML7WM8r
 Zpxn5CFnzYBtgme8YaJC3jn/ayayuoaCAC19ASVf3GLbRS0bUu3LrCd90VDKeD1VDU1Wkb5CVxd
 pBwFCDhk9fpg7XkQY3fBExa++uOWqfHkEsOfcqGY0zAEalO1U+GJoQkoPkBH5i+jyL1zlimpT8G
 1uQGwAKzgwZo4UIjme1mXlONbw5/5MeWQC9rumXb5KP/f9s7saX4geoAwtyZ1D+9Fy9zqMxGUym
 R1bewdXG8LVu3F80f+JOmgdkyo1vW9NjAkpPeMzhlH3GltCrZ5wphN2P1RSCRxFN4Ig9mMqjyfX
 tvyJmDwiPBicJycEOz83WDsZBxoYHnC0d+upLPcXviqnvGM2fKyhmy87/0yqSPTHmVyuVElIgNN
 xaLzn03uXyBlnp/Xdbo285lNd9cuI1T1pA/XUrxoDcc0qLud5cGBL9uvM0DehczF2dCQTqy0zMV
 fvPHQWZOd9njTVw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_081139_805583_2F670794 
X-CRM114-Status: GOOD (  17.67  )
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
index b800da3f7f61ffa972fcab5f24b42127f2c55ac6..c19a433ee6478876e4cf6667d7a85a193b6cb069 100644
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
+				const u16 event_affinities[])
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


