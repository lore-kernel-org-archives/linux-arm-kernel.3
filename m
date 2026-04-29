Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4068CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 10:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UH+UelaP/JcezG1oeHoD+gqylFPxfc2y38InY0gc2Y=; b=qorYqLSZRntQUhTMQD0M1e/bgZ
	vg2PezBcJv67rW2+OwcM+hcGdyMNyJJarlVqwOnA8zC+ouEVDBm5j0bjQZm21Aum7gcK10g/tRSfQ
	H+Wi+CIuLb0EF7QxXYWtyyhDSzvzvJxpnhHXf0jwq5WJ6ur0M+sUURscrlBqIUkn6xtB524CNt9LG
	p7tCKhhMAci/r0LG3WJEMoUNCF2jL2WNKyJN24PSgxSjjETpoKQmCZdcQWZsu31pzzug3LHZEgt15
	QDxxMrE50oSxx9N8MEZHiebUiUw+26n0+D4H+dp/Ye2MqWqfnIo9iV8qoFNmGgUALNw1AFbLtP5d1
	Bj4FPtIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2H8-00000003SdO-0H5E;
	Wed, 29 Apr 2026 10:36:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2H0-00000003SaY-3ZMG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 10:36:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0F4D2574;
	Wed, 29 Apr 2026 03:36:00 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B80923F763;
	Wed, 29 Apr 2026 03:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777458966; bh=WUKuIxhIEWp4wEZVLZgARQEt+x2Sk5j9B1YqF+W1LYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SKZysJkAB03+znjoRu/0xLwkINWbYy9STr2P6CD6XiocQmbm/XMJGzYkI4EFEMNcI
	 g+H1Pv3u0GFhYNaCHM1NEmoXsToVTLndMP4NFisJvHNi1ESApqFAAQa6vZg/6EV+GP
	 ZP8lx6orNoMlfdHGJSMJrnuYoMv6BuxAv3NRqWz8=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	ardb@kernel.org,
	lpieralisi@kernel.org,
	mark.rutland@arm.com,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	sudeep.holla@arm.com,
	robh@kernel.org,
	maz@kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [RFC PATCH 3/4] arm64: psci: Move detection and SMCCC probe earlier
Date: Wed, 29 Apr 2026 11:35:34 +0100
Message-ID: <20260429103535.266728-4-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429103535.266728-1-suzuki.poulose@arm.com>
References: <20260429103535.266728-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_033606_986328_4E1C6C51 
X-CRM114-Status: GOOD (  22.36  )
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

We parse the ACPI/DT for the PSCI conduit after the linear map is created via
paging_init(). This implies that we do not have all the information required to
decide whether block mappings are safe for the linear map.

e.g., With Realms, we cannot use Block mappings without BBML2_NOABORT support.
See [0] for more discussion.

This patch moves the detection of PSCI and SMCCC probing, before paging_init(),
after the efi_init(). We scan the ACPI and the DT (unflattened) for the conduit.
If we both have conduit set, we proceed only if they match. Otherwise, we can't
be sure what gets used eventually by the OS. e.g., if the ACPI table is corrupt,
DT may be used.

We do minimal validations on the ACPI tables (e.g. revision checks, FADT
checks etc.). TODO: Verify the checksum ? (acpi_table_checksum())

[0] https://lore.kernel.org/all/20260330161705.3349825-2-ryan.roberts@arm.com/

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/include/asm/acpi.h |  1 +
 arch/arm64/kernel/acpi.c      | 81 +++++++++++++++++++++++++++++++++++
 arch/arm64/kernel/setup.c     | 68 +++++++++++++++++++++++++++++
 3 files changed, 150 insertions(+)

diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
index c07a58b96329..a5198fa46088 100644
--- a/arch/arm64/include/asm/acpi.h
+++ b/arch/arm64/include/asm/acpi.h
@@ -188,4 +188,5 @@ static inline void acpi_map_cpus_to_nodes(void) { }
 
 #define ACPI_TABLE_UPGRADE_MAX_PHYS MEMBLOCK_ALLOC_ACCESSIBLE
 
+enum arm_smccc_conduit __init acpi_early_psci_conduit(void);
 #endif /*_ASM_ACPI_H*/
diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 30c7b11a8a9d..88d79def4c90 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -180,6 +180,87 @@ static int __init acpi_fadt_sanity_check(void)
 	return ret;
 }
 
+/*
+ * Find the PSCI conduit from ACPI FADT table. We only proceed with the parsing
+ * if acpi *may be* used. i.e, acpi=force or acpi=on or DT is stub.
+ *
+ * FADT table is located as below:
+ *
+ *  RSDP -> XSDT ptr -> array of pointers to different Tables
+ *
+ * Note: Arm64 requires ACPI v5.1+, thus we always use XSDT (not RSDT, for < 2.0)
+ *	 from RSDP.
+ *
+ * Returns : Conduit if system is PSCI compliant.
+ *	     Otherwise returns SMCCC_CONDUIT_NONE.
+ */
+enum arm_smccc_conduit __init acpi_early_psci_conduit(void)
+{
+	enum arm_smccc_conduit c = SMCCC_CONDUIT_NONE;
+	struct acpi_table_rsdp *rsdp;
+	struct acpi_table_xsdt *xsdt;
+	u64 *ptr, *end;
+	u64 xsdt_pa, xsdt_len;
+	bool found = false;
+
+	if (param_acpi_off ||
+	    (!param_acpi_on && !param_acpi_force && !dt_is_stub()))
+		return SMCCC_CONDUIT_NONE;
+
+	if (efi.acpi20 == EFI_INVALID_TABLE_ADDR)
+		return SMCCC_CONDUIT_NONE;
+
+	rsdp = early_memremap(efi.acpi20, sizeof(*rsdp));
+	if (!rsdp)
+		return SMCCC_CONDUIT_NONE;
+
+	if (!ACPI_VALIDATE_RSDP_SIG(rsdp->signature) || rsdp->revision < 2 ||
+	    rsdp->xsdt_physical_address == 0) {
+		early_memunmap(rsdp, sizeof(*rsdp));
+		return SMCCC_CONDUIT_NONE;
+	}
+
+	xsdt_pa = rsdp->xsdt_physical_address;
+
+	/* Now that XSDT is found, unmap the RSDP */
+	early_memunmap(rsdp, sizeof(*rsdp));
+
+	/*
+	 * XSDT is mainly an array of table pointers, with standard header.
+	 * So we map upto a PAGE_SIZE (and more with alignment) and only
+	 * look there, with a WARNING.
+	 */
+	xsdt = early_memremap(xsdt_pa, PAGE_SIZE);
+	if (!xsdt)
+		return SMCCC_CONDUIT_NONE;
+
+	xsdt_len = ((struct acpi_table_header*)xsdt)->length;
+	if (xsdt_len > (ALIGN(xsdt_pa + PAGE_SIZE, PAGE_SIZE) - xsdt_pa)) {
+		pr_warn("XSDT table is larger than a page\n");
+	}
+
+	/* Find FADT table from the XSDT */
+	ptr = &xsdt->table_offset_entry[0];
+	end = (u64*)((void *)xsdt + xsdt_len);
+	for (; ptr < end && !found; ptr++) {
+		struct acpi_table_fadt *fadt = early_memremap(*ptr, sizeof(*fadt));
+
+		if (ACPI_COMPARE_NAMESEG(&fadt->header.signature, ACPI_SIG_FADT) &&
+		    __acpi_fadt_sanity_check(fadt) == 0) {
+			u16 arm_boot_flags = fadt->arm_boot_flags;
+
+			if (arm_boot_flags & ACPI_FADT_PSCI_COMPLIANT) {
+				c = arm_boot_flags & ACPI_FADT_PSCI_USE_HVC ?
+					SMCCC_CONDUIT_HVC : SMCCC_CONDUIT_SMC;
+			}
+			found = true;
+		}
+		early_memunmap(fadt, sizeof(*fadt));
+	}
+	early_memunmap(xsdt, PAGE_SIZE);
+	return c;
+}
+
 /*
  * acpi_boot_table_init() called from setup_arch(), always.
  *	1. find RSDP and get its address, and then find XSDT
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 23c05dc7a8f2..595aff6f17d5 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -278,6 +278,71 @@ u64 cpu_logical_map(unsigned int cpu)
 	return __cpu_logical_map[cpu];
 }
 
+static enum arm_smccc_conduit early_dt_probe_psci_conduit(void)
+{
+	int len;
+	int psci_node;
+	const char *method;
+	enum arm_smccc_conduit conduit = SMCCC_CONDUIT_NONE;
+	unsigned long dt_root;
+
+	/* DT hasn't been unflattened yet, we have to work with the flat blob */
+	dt_root = of_get_flat_dt_root();
+	psci_node = of_get_flat_dt_subnode_by_name(dt_root, "psci");
+	if (psci_node <= 0)
+		return conduit;
+
+	method = of_get_flat_dt_prop(psci_node, "method", &len);
+	if (!method)
+		return conduit;
+
+	if (strncmp(method, "smc", len) == 0) {
+		conduit = SMCCC_CONDUIT_SMC;
+	} else if (strncmp(method, "hvc", len) == 0) {
+		conduit = SMCCC_CONDUIT_HVC;
+	}
+	return conduit;
+}
+
+/*
+ * Detect the PSCI conduit from both ACPI and DT, and probe the PSCI/SMCCC
+ * early if we can.
+ *
+ * Given both ACPI and DT could have valid configurations, we go forward with
+ * the early detection only if there is a valid conduit and both of them match.
+ */
+static void __init early_psci_init(void)
+{
+	enum arm_smccc_conduit dt_conduit = SMCCC_CONDUIT_NONE;
+	enum arm_smccc_conduit acpi_conduit = SMCCC_CONDUIT_NONE;
+	enum arm_smccc_conduit conduit = SMCCC_CONDUIT_NONE;
+
+	dt_conduit = early_dt_probe_psci_conduit();
+
+#ifdef CONFIG_ACPI
+	if (efi_enabled(EFI_BOOT))
+		acpi_conduit = acpi_early_psci_conduit();
+#endif
+	if (dt_conduit == SMCCC_CONDUIT_NONE &&
+	    acpi_conduit == SMCCC_CONDUIT_NONE) {
+		pr_crit("PSCI: Early probe: no conduit found\n");
+		return;
+	}
+
+	if (acpi_conduit == SMCCC_CONDUIT_NONE) {
+		conduit = dt_conduit;
+	} else if (dt_conduit == SMCCC_CONDUIT_NONE) {
+		conduit = acpi_conduit;
+	} else if (dt_conduit == acpi_conduit) {
+		conduit = acpi_conduit;
+	} else {
+		WARN(1, "PSCI: Early probe: Mismatched PSCI conduit, skipping\n");
+		return;
+	}
+
+	psci_early_init_conduit(conduit);
+}
+
 void __init __no_sanitize_address setup_arch(char **cmdline_p)
 {
 	setup_initial_init_mm(_text, _etext, _edata, _end);
@@ -322,6 +387,9 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
 	xen_early_init();
 	efi_init();
 
+	/* Probe the PSCI early after the efi_init() */
+	early_psci_init();
+
 	if (!efi_enabled(EFI_BOOT)) {
 		if ((u64)_text % MIN_KIMG_ALIGN)
 			pr_warn(FW_BUG "Kernel image misaligned at boot, please fix your bootloader!");
-- 
2.43.0


