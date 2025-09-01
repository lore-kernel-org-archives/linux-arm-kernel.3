Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F034CA100B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZZgvWpkzzBr+nwBCDJ3J4f7oxmGZr0r5wi9QRbWfI8=; b=Bpz561LVmpwSG4mNqSo1lUfOZq
	TNTU4z01EqHwfps7+Z7wefnfaYTGwVmR/KKK7KQMeLrhFnNbgIRsWqk3TuwZXcAU5zO4fnppdzWE5
	ABBfJSqF+UIc9SvuQd0cfdXXWLIX3wwr8m1knW4+sZGR8jDFXhroSnbGvP4ptp8U4xTVs68q/JPqD
	1RMHrNzD+pi+BZljrWp/CN/Crk2kbmyFH0yxyMQdHrxGGg/P2Lwcw6NVtwny8MWSpX4ZXk9Pp5J0l
	PKJ2OoEa/Atkt+rhn5YzZzSAAsfaIihn2yyGZzVVOjSIMM2npw7Mav1q2LTgn76OFPXWSnQSx1GF1
	Vmu6P5PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7VN-0000000DGvd-3MXk;
	Mon, 01 Sep 2025 16:35:41 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3r6-0000000CYvc-3hCV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:41:54 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3d19699240dso1477560f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756730511; x=1757335311; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZZgvWpkzzBr+nwBCDJ3J4f7oxmGZr0r5wi9QRbWfI8=;
        b=Z9jlLKSsiA6/ytsP0oaTMX42CyoCItMFbl0oGQ6cwkV+Rei7+tyQ1qEw5veIg5442P
         0inFUjCYvbUJuvvIU9hitz0/PmjDzY3slIoR4KriuDVWUX3yPm9MJ4TIaFvLQ9sva7xX
         qj7DFRbKHW/s/Eh06v6q1JxvNMM9U1SceODH9MfKlq43Whr5btZbz2cU7hSPRCoe5X1z
         /F+vdSRmacQGNOMNmqQBl3X7NPAV9RJMS1HQq/Aq8ny4gVCytCFQY2RTTi1UcwYZQ1Im
         53sx9N29IOB3+StYEfQOPyMrOAqUF7y3S7lv48mhp3wluJ7Q1GV+N1OzmePkBFppo5/H
         9crQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756730511; x=1757335311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZZgvWpkzzBr+nwBCDJ3J4f7oxmGZr0r5wi9QRbWfI8=;
        b=CoUn/gbAbWkPHPS3y3LjudW5dlNJNdu09ZfURPkdNlr6+KTdS+LNrFp21ZT9kXdlDc
         fuwxw1GRoPTXGHwW83g9VBVPMZkTObGUVG5KCQhqRcIfyr5FHhC/jBAImF2nm5MUXQ+S
         9tKWeawYIMfvSs+77kGsPi6f67dntRI7aC1+hojRpXlMIXqFl+8lE1MijyWqAmqlxM+c
         Q6g37fLdAtrTPtlUDfkEwxPGb+IgaNrHEuwVnFM5HNfVyjQwXLIZHa91LghVtNHtsnLv
         nwC+PXFEcWBi5vNqXU5nBsbPCLHgN4wY9YErpDPm7AyoHfrifoZx2emqxBaXiKfiv3UF
         CAxQ==
X-Gm-Message-State: AOJu0YzDLw16RV4vnMNQK9XWRZ2iFGDrnweuzXtZn+z2cASNL8pJh7rN
	oQBeX3YmnWoS4uNNGlWLFbtFFKwiNddGn+xWYgGFjtQ1L0DvT1PwwgqhLwzpnwt/9lo=
X-Gm-Gg: ASbGncshJyUzvlhLyX9Y8/d/oxYRRg/r6azCTH0NcZ1OJ+sPgCVCErVefNOIgP8+8ZE
	XYtFyHc6LaHXB7uNrpicFI6XqyBEtPw0izD7kAJdlt5Uaj2WlRjjNhROFPVoSuQND8eJMzORnPd
	sOG16UbLOQ0qTf4WjlgZpoP0ho/a4/55pWciY2UUBRajYnzpRII4rEWbW6whv0fu53rcacaysWj
	Cc77DAWI122XS/3fkv4BUtD1WwTqPrDjZEIBnykX2sYMa1ZbBeOjNY5JDrPXe2vDR7NKQdhgFIo
	FH6fiSIMOyIc2+TIXeVmaDvqittTCBRwP7xch4FyWJSlTidDlw+qzIsS3dY/QBTKW5eWkpL0asZ
	wZ7c2MQJQp6MeMIUzBhgGX4E/KjYAVeY=
X-Google-Smtp-Source: AGHT+IHOmsUvkIOzZdpZGUdJ8+tog1LZQ1DvZke4oaEKX68EXOiUCozD6kPp0FykYmEdPI7ixAJleQ==
X-Received: by 2002:a5d:5d0d:0:b0:3ce:5696:39f1 with SMTP id ffacd0b85a97d-3d1b1af1fc2mr5785396f8f.22.1756730511229;
        Mon, 01 Sep 2025 05:41:51 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e898b99sm154946315e9.19.2025.09.01.05.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:41:50 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 01 Sep 2025 13:40:31 +0100
Subject: [PATCH v8 02/12] perf: arm_spe: Support FEAT_SPEv1p4 filters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-james-perf-feat_spe_eft-v8-2-2e2738f24559@linaro.org>
References: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
In-Reply-To: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
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
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_054152_933150_94EAE631 
X-CRM114-Status: GOOD (  22.69  )
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

Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/sysreg.h |  9 ---------
 drivers/perf/arm_spe_pmu.c      | 23 +++++++----------------
 2 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 6604fd6f33f4..2cf7f30b0d4f 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -344,15 +344,6 @@
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
index 369e77ad5f13..86c9948ab5a0 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -89,6 +89,7 @@ struct arm_spe_pmu {
 #define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
 	u64					features;
 
+	u64					pmsevfr_res0;
 	u16					max_record_sz;
 	u16					align;
 	struct perf_output_handle __percpu	*handle;
@@ -697,20 +698,6 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
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
@@ -726,10 +713,10 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
 	    !cpumask_test_cpu(event->cpu, &spe_pmu->supported_cpus))
 		return -ENOENT;
 
-	if (arm_spe_event_to_pmsevfr(event) & arm_spe_pmsevfr_res0(spe_pmu->pmsver))
+	if (arm_spe_event_to_pmsevfr(event) & spe_pmu->pmsevfr_res0)
 		return -EOPNOTSUPP;
 
-	if (arm_spe_event_to_pmsnevfr(event) & arm_spe_pmsevfr_res0(spe_pmu->pmsver))
+	if (arm_spe_event_to_pmsnevfr(event) & spe_pmu->pmsevfr_res0)
 		return -EOPNOTSUPP;
 
 	if (attr->exclude_idle)
@@ -1107,6 +1094,10 @@ static void __arm_spe_pmu_dev_probe(void *info)
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


