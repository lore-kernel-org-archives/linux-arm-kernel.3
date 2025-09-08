Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1F2CAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKGU1abQVfuJ6I1lGgEqdrdZCTshmOZZLCi+h9rWnIw=; b=KUdijF9uWrsTCpPOP9B96FCXDC
	HqtNZVN+OV8nceVSYKv5HXL74NSHfXapOZa4SkDa+IqF2RxXOZg/msyMvSex9R29Y//AG9DbocWu4
	YERA2ZuD3QFA44mCLplRDySey1EmGZgY7fA++Qeec1eNKKadC6PbeO/47v5YS3dFqRuT5mMCFua6m
	07IQcqiM3w9ItvwAmyfMPOu854c8uOskpaAG80d8Eo/88b900knaI5jxWkZQD1HGDcxjtcDGVbAqI
	k/ZcfgSF+YXcba2TWZHW78oEHoTpkYelh8Xe2k/7YT98n4qdmb5Gz5M8Rg2DXaKET3oAqS79b+L2J
	ZrvfbCDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvabp-0000000GqMm-1LXz;
	Mon, 08 Sep 2025 12:04:33 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYgD-0000000GDkz-3FZF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:00:58 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-772627dd50aso5586145b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325657; x=1757930457; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKGU1abQVfuJ6I1lGgEqdrdZCTshmOZZLCi+h9rWnIw=;
        b=Q2Cmu3cw1w2aO+6pWp1cJy9M4hlsTAp0zpymsGVAV0aR/g+T+esJMB6k8WjgiLeb2b
         bjbIlia9BXGhr68f0ZKTonafwbQ+5/EtDyhpvnA15Q0XP+iGvMOwPIs3J+/VhowFTrf4
         uWCmv0bzvSJkGlj0MTD4F4b19dPHVDC18ETvRo6GuERJnKpvw5aYcx57C+cr8A4AFZ5E
         YEHvbd20qu5MKNbSjpulj82UEVR4TEepQAHO07eWkqWTMDu3WcpJQP71KXAWknse3M2G
         gUu6//WgnMN64wqojdu4zrQHVtcpEjjE359RWM9lY02+EvTq6mL+gLPh7pGt58DJebqM
         DqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325657; x=1757930457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKGU1abQVfuJ6I1lGgEqdrdZCTshmOZZLCi+h9rWnIw=;
        b=kxjSUs5vCSQOFqz6L1G58LDWPlLrGTZGvaiIXReH6lvCc4h9LrgLXHzjIPl0q8XRes
         JmeZN2e4KcvNCDAPKd5JFUTIat+3EljTrw3NPFQKE7dZ4PSZsL77PJM/VcUsxHpCzKAM
         VPgHvNAiIWo8IoVzowiwk1ibtZpOvGqHP1NZ6CDOw/HU41jUFkwYVpRKmeBpuS9Tv4JD
         Nl7IbyN1IVcQ9Wt+m0mXtLjsW+4VpwPLIm24i4oIOnOnv9iARHds9faMolgb4IvuJxSB
         bMHCkrpEZXssO8hndr8SLQ3/S2VyvppwcrTCp7umyNYDMejN3OoRn0gHyXLsmh4QKp6b
         9ikg==
X-Forwarded-Encrypted: i=1; AJvYcCVM9khIOQj2PZyBVv/pnmoTEZuz1+CLElPWSf0jjhLZk1A8JwDvbhSi2KCrPGFJD576VQRNFkjgdsaalXUByBPy@lists.infradead.org
X-Gm-Message-State: AOJu0YzBpLJj4LCCT6i4e9q/lmmkuqGHNAlW9DCKJWxErnIh81Lnrv3B
	HBDPO64NVji2iIj6hmq0yGxRjL36Wb5AxonCRb3MlmV2+nxgH941XEIG
X-Gm-Gg: ASbGncuMZzpzE0KViwKMZgDd70/Kd0f/n5DH3amt+un4ibA21dbhP0eAIgap6nHVshh
	vR+sqzGlbpX+ApfjfwGDiELXy8YsjBK9c1hroZOgLolXnsCNMvAg0szPr9c8IVPpYGV+kl7LfMB
	6KjxxCeV92qmrjC52dcJ2cmqddOqasi41Ms5tgrOWyIAK35lacuISAFHIFnyaRTHTjm4znq0isd
	jwfio8rcfZkNuDeigE/oNhwrP84fY6a3B53drFr7DH/XfhwMK45nZ8L0Sj4j27V3QO/fJ4LNqle
	OiPRrt0KADVZazeWcRgcTHjz/3uikgQOjyfMRFzOQwSiHIfScXRuGAcbxdKmFEA2yDDL9n2wEbt
	/p4+TL664kiaTkn2Uk/zeGP6k2Ws=
X-Google-Smtp-Source: AGHT+IG8f7QWlYnkY3npMDxRjSVlZs6moYuSIY71etdNfcW+FyDv3+n517pdY5xG+zHBFK5Cwi4wKA==
X-Received: by 2002:a17:902:c402:b0:24c:ba8e:c5bc with SMTP id d9443c01a7336-24cedc83ab6mr163142315ad.8.1757325656753;
        Mon, 08 Sep 2025 03:00:56 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:00:56 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:27 +0800
Subject: [PATCH RESEND v8 03/21] drivers/perf: apple_m1: Support
 per-implementation event tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-3-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5769; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=QXdFCVGEPqTyu8Bm7SIf1fxdHsV0PUqAo42n6ezyRRw=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlC0et+/+z/qtxr5xUy6bUrh15N0o6KHo8wQ
 30tLI0+/N2JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pQgAKCRABygi3psUI
 JPpzEACVxTd3EvWUAjSmnAg5qkeRXyzv2oSB43nFGnYBrSn3nbiIr/XzPOVAUPZtXQiYYNh73iC
 6bCtU17u5gIGtcU6pfvVoB4YWzwrDRG759MI5aU6+1P4kvsQO4zPQTpmvyRLdmHXFXgdNsqcpvv
 m0cHQF+Ts+RICEnKb1273DabKgNmGq7tfBatr48DfQnYXJJWGBph27/qZhJXpZ9i+Muzgaz+AtI
 SjZvxVXQIdvMF+wxsFm7MTJ6w74w0Ebuf/RsoxpmkVVAFqRrn01G4c8uu5aDHTVY+L2xuLp6JAm
 CMZT63tlvPWVy8DuxTPHpu+GuJuilhYO1+e77NEAT9Jl17hBcsNpIJtg7T6eHEe4JH1DIgQsxFH
 b7LMtJzxPYyl1T2tkrsZqjHOcE7NXx+VthTZ8wST5GT+cw7kfJaXRYbzeuSaGLscoGcRQc2sHQv
 KP3JM7beuodYfVPmjAX5Y5wKMH7IbcEnFo7AcPhUZrk3h+7s8b7/CU8V9ETFrKB4WldYugbVMke
 RXKFpUM0wrohJBO9Gcsuou8JqCZPkFt9OraZDrJqm/w8XfIaToSHRurHq8bhSfpcWfDjPMbOZJ3
 Se4oSUhlVT7S0z6x1hVyJ8XN8R7ozMtsSZ1UXXGxPyoiEL8V7/aqqXDj5PIuNseLFf8MfhJPTkP
 dBH32S9OHOPIZ1g==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_030057_818264_961D6738 
X-CRM114-Status: GOOD (  17.71  )
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
2.51.0


