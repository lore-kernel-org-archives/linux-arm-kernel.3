Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630D8C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 22:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CI3k8EjFmwTOYcPqsV3PhQ8+RSg8JDcAcfT+x1n6dsQ=; b=JSEFv5bB0qf1fn6lwmD0jKFnhj
	nvUKb9U40xcc7clGdV/lRNpYlnZkWXc++tFo1OMFcal4HgUkV80yZkyLywIuUAKLrM7ziofUILTBE
	gNXGRFCZ2sQRSLAb8Gh0xxfRRpUMVCPzWgVkEn/5V6ih0oONdubVuw3wG4S72UyIBtML7gOPiYOV/
	Nr9XGmVOuVac/VBh2pRm7yVsYJHhb1tnLkTi7KOzc06q979NknM9q5QqkChecmb9mDl59jINbrspy
	eOXZNj7Qv7jYSm0R7LLJKWQOtnDJVx+p+ZTH1sGWu4VKFer0olmyaXpGAM43D98ydCkL6gkuev+bw
	rcCk6P3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSkOC-0000000GkXf-0bXC;
	Fri, 20 Jun 2025 22:39:16 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSk4L-0000000Gh2P-2ALo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 22:18:46 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3ddc5137992so27490605ab.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 15:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457924; x=1751062724; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CI3k8EjFmwTOYcPqsV3PhQ8+RSg8JDcAcfT+x1n6dsQ=;
        b=AeR2Oh+plC9cq0aNBzb1+ATr7cG49yEK4Slia6O89cO0JspRTIe3WKeLPy4kC7iivB
         fqE2TJiWgfcyYOyxp1040pM+dlJjqnzPeax5OXG4BTT54fB0eTEF++Xp1YnrU6nnMfpK
         74Pv3jgrqCQ2ZHYnJ/TfNYOJXHUesT7vAlOCq2tD4Or3rwy9yO0BTJhjufR7ex2ezUg5
         uc7/Ii1SigLZGxatP+AZrxqJXeCCEz7ZyhwCrJ2tTxG9LFkUhMHS0ArRrxVBBpkofCqk
         KcZMLnLDH1b7DUuDWXGwovsVV6VLZLyF3rJR7OEvrqFCqsz89tvdZyDEBqOFMzXSurp5
         PinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457924; x=1751062724;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CI3k8EjFmwTOYcPqsV3PhQ8+RSg8JDcAcfT+x1n6dsQ=;
        b=A0TrBVRpIsLFepDVIoh0Kj3p8VNBRb21sy/0VFbtlI6yhaVWZs+O57YqlBCW53IQk0
         KrhsMqFW4uiJyTK9+gqT5j8UIKI5XhBP0mTt0QlpxF+i4vI7941dbSBLMcTUup40XHNk
         YaSA2NhuJlUb+g4xUgEQ6MsC5lZA8+MhU7Pb/GVzO2ncogU6G6rKYfOCmI6m2r+6h7oj
         MUvfBrmZhGheI5dUtRr24kb8EekszTFITQc7/gWUe59NXtpF1SogTzaElW0DDv4aAOTS
         QucYmv8Z39IPcYhXwrxJ/8/m0etxzP659smEUXkyWN/TX/4p6VyEAF1Q2gNz5bzm7xI5
         nupw==
X-Forwarded-Encrypted: i=1; AJvYcCXtm1L0UtU1LOQkKf0Q6eJyQRj6/HBCrZWwcU29X0fbY0kgT7OH9H4kQhcPhCBDpQCS1+zTHwzMIKDWk9vArbm3@lists.infradead.org
X-Gm-Message-State: AOJu0YxwCkG3BZ1QuJx4vtCTqFDOMLtVZv1n1Z0C0VSi5P+S1RNJJ8KZ
	JAJjZ3l980xVMU4ZWna0AVyTEi6hW1NIiHsiBmbJsHKA/3oevucqKSdDTRNHAYI2Kxq4DoO6+4F
	fAWnGCywA4fRAGlXD8/+3jgO6/g==
X-Google-Smtp-Source: AGHT+IGRzFrNkTKRncgvh4xo99Bcu003VZXHoGW3TcBgBpmaK0gzPhj85w0EWM+POhiHIrJPWFM8l3F3ufOL+8v7Xw==
X-Received: from ilbcp2.prod.google.com ([2002:a05:6e02:3982:b0:3dd:c6fb:13fb])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:351f:b0:3dd:f948:8539 with SMTP id e9e14a558f8ab-3de38c1c186mr52207735ab.2.1750457924241;
 Fri, 20 Jun 2025 15:18:44 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:08 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-9-coltonlewis@google.com>
Subject: [PATCH v2 07/23] perf: pmuv3: Introduce method to partition the PMU
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_151845_549326_F6919165 
X-CRM114-Status: GOOD (  26.92  )
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

For PMUv3, the register field MDCR_EL2.HPMN partitiones the PMU
counters into two ranges where counters 0..HPMN-1 are accessible by
EL1 and, if allowed, EL0 while counters HPMN..N are only accessible by
EL2.

Create module parameters partition_pmu and reserved_guest_counters to
reserve a number of counters for the guest. These numbers are set at
boot because the perf subsystem assumes the number of counters will
not change after the PMU is probed.

Introduce the function armv8pmu_partition() to modify the PMU driver's
cntr_mask of available counters to exclude the counters being reserved
for the guest and record reserved_guest_counters as the maximum
allowable value for HPMN.

Due to the difficulty this feature would create for the driver running
at EL1 on the host, partitioning is only allowed in VHE mode. Working
on nVHE mode would require a hypercall for every counter access in the
driver because the counters reserved for the host by HPMN are only
accessible to EL2.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm/include/asm/arm_pmuv3.h   | 10 ++++
 arch/arm64/include/asm/arm_pmuv3.h |  5 ++
 drivers/perf/arm_pmuv3.c           | 95 +++++++++++++++++++++++++++++-
 include/linux/perf/arm_pmu.h       |  1 +
 4 files changed, 109 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index 2ec0e5e83fc9..9dc43242538c 100644
--- a/arch/arm/include/asm/arm_pmuv3.h
+++ b/arch/arm/include/asm/arm_pmuv3.h
@@ -228,6 +228,11 @@ static inline bool kvm_set_pmuserenr(u64 val)
 
 static inline void kvm_vcpu_pmu_resync_el0(void) {}
 
+static inline bool has_vhe(void)
+{
+	return false;
+}
+
 /* PMU Version in DFR Register */
 #define ARMV8_PMU_DFR_VER_NI        0
 #define ARMV8_PMU_DFR_VER_V3P1      0x4
@@ -242,6 +247,11 @@ static inline bool pmuv3_implemented(int pmuver)
 		 pmuver == ARMV8_PMU_DFR_VER_NI);
 }
 
+static inline bool is_pmuv3p1(int pmuver)
+{
+	return pmuver >= ARMV8_PMU_DFR_VER_V3P1;
+}
+
 static inline bool is_pmuv3p4(int pmuver)
 {
 	return pmuver >= ARMV8_PMU_DFR_VER_V3P4;
diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 32c003a7b810..e2057365ba73 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -173,6 +173,11 @@ static inline bool pmuv3_implemented(int pmuver)
 		 pmuver == ID_AA64DFR0_EL1_PMUVer_NI);
 }
 
+static inline bool is_pmuv3p1(int pmuver)
+{
+	return pmuver >= ID_AA64DFR0_EL1_PMUVer_V3P1;
+}
+
 static inline bool is_pmuv3p4(int pmuver)
 {
 	return pmuver >= ID_AA64DFR0_EL1_PMUVer_V3P4;
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 3db9f4ed17e8..26230cd4175c 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -35,6 +35,17 @@
 #define ARMV8_THUNDER_PERFCTR_L1I_CACHE_PREF_ACCESS		0xEC
 #define ARMV8_THUNDER_PERFCTR_L1I_CACHE_PREF_MISS		0xED
 
+static bool partition_pmu __read_mostly;
+static u8 reserved_guest_counters __read_mostly;
+
+module_param(partition_pmu, bool, 0);
+MODULE_PARM_DESC(partition_pmu,
+		 "Partition the PMU into host and guest VM counters [y/n]");
+
+module_param(reserved_guest_counters, byte, 0);
+MODULE_PARM_DESC(reserved_guest_counters,
+		 "How many counters to reserve for guest VMs [0-$NR_COUNTERS]");
+
 /*
  * ARMv8 Architectural defined events, not all of these may
  * be supported on any given implementation. Unsupported events will
@@ -500,6 +511,11 @@ static void armv8pmu_pmcr_write(u64 val)
 	write_pmcr(val);
 }
 
+static u64 armv8pmu_pmcr_n_read(void)
+{
+	return FIELD_GET(ARMV8_PMU_PMCR_N, armv8pmu_pmcr_read());
+}
+
 static int armv8pmu_has_overflowed(u64 pmovsr)
 {
 	return !!(pmovsr & ARMV8_PMU_OVERFLOWED_MASK);
@@ -1195,6 +1211,74 @@ struct armv8pmu_probe_info {
 	bool present;
 };
 
+/**
+ * armv8pmu_reservation_is_valid() - Determine if reservation is allowed
+ * @guest_counters: Number of host counters to reserve
+ *
+ * Determine if the number of host counters in the argument is
+ * allowed. It is allowed if it will produce a valid value for
+ * register field MDCR_EL2.HPMN.
+ *
+ * Return: True if reservation allowed, false otherwise
+ */
+static bool armv8pmu_reservation_is_valid(u8 guest_counters)
+{
+	return guest_counters <= armv8pmu_pmcr_n_read();
+}
+
+/**
+ * armv8pmu_partition_supported() - Determine if partitioning is possible
+ *
+ * Partitioning is only supported in VHE mode (with PMUv3, assumed
+ * since we are in the PMUv3 driver)
+ *
+ * Return: True if partitioning is possible, false otherwise
+ */
+static bool armv8pmu_partition_supported(void)
+{
+	return has_vhe();
+}
+
+/**
+ * armv8pmu_partition() - Partition the PMU
+ * @pmu: Pointer to pmu being partitioned
+ * @guest_counters: Number of host counters to reserve
+ *
+ * Partition the given PMU by taking a number of host counters to
+ * reserve and, if it is a valid reservation, recording the
+ * corresponding HPMN value in the hpmn field of the PMU and clearing
+ * the guest-reserved counters from the counter mask.
+ *
+ * Passing 0 for @guest_counters has the effect of disabling partitioning.
+ *
+ * Return: 0 on success, -ERROR otherwise
+ */
+static int armv8pmu_partition(struct arm_pmu *pmu, u8 guest_counters)
+{
+	u8 nr_counters;
+	u8 hpmn;
+
+	if (!armv8pmu_reservation_is_valid(guest_counters))
+		return -EINVAL;
+
+	nr_counters = armv8pmu_pmcr_n_read();
+	hpmn = guest_counters;
+
+	pmu->hpmn_max = hpmn;
+
+	/* Inform host driver of available counters */
+	bitmap_clear(pmu->cntr_mask, 0, hpmn);
+	bitmap_set(pmu->cntr_mask, hpmn, nr_counters - hpmn);
+	clear_bit(ARMV8_PMU_CYCLE_IDX, pmu->cntr_mask);
+
+	if (pmuv3_has_icntr())
+		clear_bit(ARMV8_PMU_INSTR_IDX, pmu->cntr_mask);
+
+	pr_info("Partitioned PMU with HPMN %u", hpmn);
+
+	return 0;
+}
+
 static void __armv8pmu_probe_pmu(void *info)
 {
 	struct armv8pmu_probe_info *probe = info;
@@ -1209,10 +1293,10 @@ static void __armv8pmu_probe_pmu(void *info)
 
 	cpu_pmu->pmuver = pmuver;
 	probe->present = true;
+	cpu_pmu->hpmn_max = -1;
 
 	/* Read the nb of CNTx counters supported from PMNC */
-	bitmap_set(cpu_pmu->cntr_mask,
-		   0, FIELD_GET(ARMV8_PMU_PMCR_N, armv8pmu_pmcr_read()));
+	bitmap_set(cpu_pmu->cntr_mask, 0, armv8pmu_pmcr_n_read());
 
 	/* Add the CPU cycles counter */
 	set_bit(ARMV8_PMU_CYCLE_IDX, cpu_pmu->cntr_mask);
@@ -1221,6 +1305,13 @@ static void __armv8pmu_probe_pmu(void *info)
 	if (pmuv3_has_icntr())
 		set_bit(ARMV8_PMU_INSTR_IDX, cpu_pmu->cntr_mask);
 
+	if (partition_pmu) {
+		if (armv8pmu_partition_supported())
+			WARN_ON(armv8pmu_partition(cpu_pmu, reserved_guest_counters));
+		else
+			pr_err("PMU partition is not supported");
+	}
+
 	pmceid[0] = pmceid_raw[0] = read_pmceid0();
 	pmceid[1] = pmceid_raw[1] = read_pmceid1();
 
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 1de206b09616..95f2b800e63d 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -130,6 +130,7 @@ struct arm_pmu {
 
 	/* Only to be used by ACPI probing code */
 	unsigned long acpi_cpuid;
+	u8		hpmn_max; /* MDCR_EL2.HPMN: counter partition pivot */
 };
 
 #define to_arm_pmu(p) (container_of(p, struct arm_pmu, pmu))
-- 
2.50.0.714.g196bf9f422-goog


