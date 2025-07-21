Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882E7C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 14:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXkvCvtwQUgO1rzNPbi1g5SXwSvNrlBklFVwiaO7B+s=; b=fsbE4NyXvCTZnxQDI/JNqHQZdb
	sU87WR1grgda5NBZbz/4sPHzMPZiWOouZFyM7QQ65d0mfBZEqndhEXlE8suSFh4IZJI/4iw5+UQI+
	NBAn3/SKEaepjxdM2/WexeM9FZJoiZAV0EsarMeuCB7vnej/gJKMh+OfPPg8ikjGe5xQfFtqWH/6e
	3E64JLuf2J8KfyYCUAFhXdVjMe1rJ8MjaJpZRJoxCMTu2jMX+gnlTOVTT+Vw+3+TB7Aj8jcR9Oahq
	ZHAeKNdB6RmJC1WHtw057Ptwj49zupPj/EhRl1y6INhlzQ31ac/O0MqIfVYbTopTHQmWaqO7yPU8X
	zkeBjx3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udry5-0000000019d-0d6O;
	Mon, 21 Jul 2025 14:58:17 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udq21-0000000HIc9-3zbX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 12:54:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4550709f2c1so31936565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 05:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753102453; x=1753707253; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXkvCvtwQUgO1rzNPbi1g5SXwSvNrlBklFVwiaO7B+s=;
        b=GrV4bajC8Sl6xCy7qF2EgVHv5Q20L/2+dpa1FJTumsae4EFBq+yv3vO/aPaRnyg8zI
         TqDC+b1h0EffrAZSR/NfSkw8TEAE9t16MXwbkfLE+68RM+CeeDayrWFk478O7WEa5G6N
         FmAccJEzCMXjVyPVLfdPxc0oi6W+970JZT9dvPuR9axl5EsOvakkDUxmy/RHK+NJ6laI
         MhmZwdRWcmIe1bhJixT31Timlfz4eb79S0gqwXSm/To9nUjWw4PqtJ/kPJMLz0luZMUM
         3h7TJbGMfhP21U3k5yumgjADmQzZCuJS5Kn9g/j9Pn4LGeF3HuqFUWzlj52qT9LftiSO
         Pquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753102453; x=1753707253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXkvCvtwQUgO1rzNPbi1g5SXwSvNrlBklFVwiaO7B+s=;
        b=jRdVtwSYJbceNX717uuoIybwIcLn1c6zI9Cr9iL5bPvneTuZ/vg4c0PG75vWnyhcz3
         oC6wqBv0zr6bknr8s9O3MP/5D5ELzzJH0Ks/cMzU8B4ehkdQguuNR96pzw+Psl675EyC
         bsZM7NW6NKvtJokENFKJrgCOPfiMnIiDpokgfFuOIv1Br1gF5IMk0wfa96dJejkhkSbt
         VGJaRxYU6+qW8fskhnQiIwxYP7wtBndSRehTNJUR/B51cft82v0ZY4i8iMn3xZDB3l76
         Hmo5pvCuUICdAUxOCDLZRvh1tqZJdLrxR9OyfXkE36XRLKx+q9TDyWQU1PsI5cX9HVqI
         H6nQ==
X-Gm-Message-State: AOJu0YyYJm0+Wred/CEcMwZLJ4oQR8itG4AwfTEtUSA0MyDEO2p1RvyX
	cMmIIAA1RxCEMSgc4H8Tex1x3OAjiN4HAa7NLGY7VuvEnvBFx9OlfETfILlx7vFNe5Y=
X-Gm-Gg: ASbGnct3A+snlUyfK9ey16reTC4v9mwHL01ad0GbOF+sOSUSuMw98/2m9VeDC9Pj31w
	9Uai14aeqE7oB3GY41TMzxKDPGeWp2ZRn2vQrDuek4sm/ZzpOQJioHeeWcfjScGwzLR58WvqGyn
	WG8Z7Epw9vG1ZA5l+l8sln1KUENimoes9Be4wkJCD9uhTERcbPluQe7A7qK87vbNdGJIuowzkI2
	KDR1mV62sl7t88ipast2da4qiCjKgrpLyBYptHtM02Dj91gNn7+DFQv0WlAmp+e/o1rnPoxyWgN
	+6EodKsxSXX/6OVh7APKfeUTjDFbg5hTu6Svod1yCnyX+ebbrVlL2KbJaEu46kE0IiU0DBn3SsR
	kKq+Ah49qQotmhceQ+UKgSRItAaadGCM=
X-Google-Smtp-Source: AGHT+IHpaWh2ac5SYmY2ltrgXpysP6sDtQYkPcfWwMUoh63zg4xaji/VnwZ2IITaD9sW48Svnh7IDA==
X-Received: by 2002:a05:600c:348c:b0:456:1d4e:c14f with SMTP id 5b1f17b1804b1-4564ab4fe8cmr29393885e9.28.1753102452582;
        Mon, 21 Jul 2025 05:54:12 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b75de26sm98995225e9.33.2025.07.21.05.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 05:54:12 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 13:53:33 +0100
Subject: [PATCH v4 02/12] perf: arm_spe: Support FEAT_SPEv1p4 filters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v4-2-0a527410f8fd@linaro.org>
References: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
In-Reply-To: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_055414_000705_5EE2E4C0 
X-CRM114-Status: GOOD (  21.92  )
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

FEAT_SPEv1p4 (optional from Armv8.8) adds some new filter bits and also
makes some previously available bits unavailable again e.g:

  E[30], bit [30]
  When FEAT_SPEv1p4 is _not_ implemented ...

Continuing to hard code the valid filter bits for each version isn't
scalable, and it also doesn't work for filter bits that aren't related
to SPE version. For example most bits have a further condition:

  E[15], bit [15]
  When ... and filtering on event 15 is supported:

Whether "filtering on event 15" is implemented or not is only
discoverable from the TRM of that specific CPU or by probing
PMSEVFR_EL1.

Instead of hard coding them, write all 1s to the PMSEVFR_EL1 register
and read it back to discover the RES0 bits. Unsupported bits are RAZ/WI
so should read as 0s.

For any hardware that doesn't strictly follow RAZ/WI for unsupported
filters: Any bits that should have been supported in a specific SPE
version but now incorrectly appear to be RES0 wouldn't have worked
anyway, so it's better to fail to open events that request them rather
than behaving unexpectedly. Bits that aren't implemented but also aren't
RAZ/WI will be incorrectly reported as supported, but allowing them to
be used is harmless.

Testing on N1SDP shows the probed RES0 bits to be the same as the hard
coded ones. The FVP with SPEv1p4 shows only additional new RES0 bits,
i.e. no previously hard coded RES0 bits are missing.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/sysreg.h |  9 ---------
 drivers/perf/arm_spe_pmu.c      | 23 +++++++----------------
 2 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index f1bb0d10c39a..e80207572786 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -350,15 +350,6 @@
 #define SYS_PAR_EL1_ATTR		GENMASK_ULL(63, 56)
 #define SYS_PAR_EL1_F0_RES0		(GENMASK_ULL(6, 1) | GENMASK_ULL(55, 52))
 
-/*** Statistical Profiling Extension ***/
-#define PMSEVFR_EL1_RES0_IMP	\
-	(GENMASK_ULL(47, 32) | GENMASK_ULL(23, 16) | GENMASK_ULL(11, 8) |\
-	 BIT_ULL(6) | BIT_ULL(4) | BIT_ULL(2) | BIT_ULL(0))
-#define PMSEVFR_EL1_RES0_V1P1	\
-	(PMSEVFR_EL1_RES0_IMP & ~(BIT_ULL(18) | BIT_ULL(17) | BIT_ULL(11)))
-#define PMSEVFR_EL1_RES0_V1P2	\
-	(PMSEVFR_EL1_RES0_V1P1 & ~BIT_ULL(6))
-
 /* Buffer error reporting */
 #define PMBSR_EL1_FAULT_FSC_SHIFT	PMBSR_EL1_MSS_SHIFT
 #define PMBSR_EL1_FAULT_FSC_MASK	PMBSR_EL1_MSS_MASK
diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 3efed8839a4e..051ec885318d 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -89,6 +89,7 @@ struct arm_spe_pmu {
 #define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
 	u64					features;
 
+	u64					pmsevfr_res0;
 	u16					max_record_sz;
 	u16					align;
 	struct perf_output_handle __percpu	*handle;
@@ -693,20 +694,6 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static u64 arm_spe_pmsevfr_res0(u16 pmsver)
-{
-	switch (pmsver) {
-	case ID_AA64DFR0_EL1_PMSVer_IMP:
-		return PMSEVFR_EL1_RES0_IMP;
-	case ID_AA64DFR0_EL1_PMSVer_V1P1:
-		return PMSEVFR_EL1_RES0_V1P1;
-	case ID_AA64DFR0_EL1_PMSVer_V1P2:
-	/* Return the highest version we support in default */
-	default:
-		return PMSEVFR_EL1_RES0_V1P2;
-	}
-}
-
 /* Perf callbacks */
 static int arm_spe_pmu_event_init(struct perf_event *event)
 {
@@ -722,10 +709,10 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
 	    !cpumask_test_cpu(event->cpu, &spe_pmu->supported_cpus))
 		return -ENOENT;
 
-	if (arm_spe_event_to_pmsevfr(event) & arm_spe_pmsevfr_res0(spe_pmu->pmsver))
+	if (arm_spe_event_to_pmsevfr(event) & spe_pmu->pmsevfr_res0)
 		return -EOPNOTSUPP;
 
-	if (arm_spe_event_to_pmsnevfr(event) & arm_spe_pmsevfr_res0(spe_pmu->pmsver))
+	if (arm_spe_event_to_pmsnevfr(event) & spe_pmu->pmsevfr_res0)
 		return -EOPNOTSUPP;
 
 	if (attr->exclude_idle)
@@ -1103,6 +1090,10 @@ static void __arm_spe_pmu_dev_probe(void *info)
 		spe_pmu->counter_sz = 16;
 	}
 
+	/* Write all 1s and then read back. Unsupported filter bits are RAZ/WI. */
+	write_sysreg_s(U64_MAX, SYS_PMSEVFR_EL1);
+	spe_pmu->pmsevfr_res0 = ~read_sysreg_s(SYS_PMSEVFR_EL1);
+
 	dev_info(dev,
 		 "probed SPEv1.%d for CPUs %*pbl [max_record_sz %u, align %u, features 0x%llx]\n",
 		 spe_pmu->pmsver - 1, cpumask_pr_args(&spe_pmu->supported_cpus),

-- 
2.34.1


