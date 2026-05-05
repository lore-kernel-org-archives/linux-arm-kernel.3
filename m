Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F414FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96eo86FK0DBmyESIUj5nSdLgKWomtIJp9oYhqj0wyEA=; b=k4qPGKxctqeFnSItxmPuDzDESi
	+s0phTYS9I0L9/LRPuCL4pR0o+rLeTfwsFc6r3Q5G3TKNRguZhRKp6tY5gI9/38W2BcbAUFW5auuo
	MZDNd6SOK10nLx2HYoWDcK2z9xr5LOyNpdIxGK2d4EqqQUaketEvSDdsnomUmp2rGNOFMw/iIiPn6
	QaZv9/aZSpqwr2znedwL/F3JA5+QxnRZ64CAwrynXJb2gEIIY/LU+XD9dncdfe3ZbvFS6TjPXCzIX
	yZnVFA3C+lj3Rnz5IDYtE7R1AqcfWk5fGBIBtzv0DH9/Xcju7NqacDvXKnUgE8dKK0nLN901L816o
	9dVgohQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIA3-0000000Gkbp-0tVe;
	Tue, 05 May 2026 15:58:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIA0-0000000GkZd-1iYo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 15:58:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B3E53105;
	Tue,  5 May 2026 08:58:05 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 017973F905;
	Tue,  5 May 2026 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777996690; bh=5PnC7v96/dj1I65TZK5GmbsyqX2pUyuny4YHlaetBJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V1QFyosWyHQnyBmdtkaCySHfS2bbgBGjKm0ZeGuqRBx/pVJJrIyOmpPagzlYQjS84
	 ttJBt2ngHB9DP8nXfovfe01vcaYzzbwAPUv7+/DJo8tbU7DistyeHIsc/arSQXvO9b
	 wrM1I+J+duMxdObJule86wwel8CSeo77jFcuXbEs=
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
Subject: [RFC PATCH v2 3/4] arm64: psci: Move detection and SMCCC probe earlier
Date: Tue,  5 May 2026 16:57:41 +0100
Message-ID: <20260505155742.623287-4-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505155742.623287-1-suzuki.poulose@arm.com>
References: <20260429103535.266728-1-suzuki.poulose@arm.com>
 <20260505155742.623287-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_085812_541044_9E98558C 
X-CRM114-Status: GOOD (  24.45  )
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
 arch/arm64/kernel/acpi.c      | 96 +++++++++++++++++++++++++++++++++++
 arch/arm64/kernel/setup.c     | 78 ++++++++++++++++++++++++++++
 3 files changed, 175 insertions(+)

diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
index 8a54ca6ba602..448320ffba98 100644
--- a/arch/arm64/include/asm/acpi.h
+++ b/arch/arm64/include/asm/acpi.h
@@ -173,4 +173,5 @@ static inline void acpi_map_cpus_to_nodes(void) { }
 
 #define ACPI_TABLE_UPGRADE_MAX_PHYS MEMBLOCK_ALLOC_ACCESSIBLE
 
+enum arm_smccc_conduit __init acpi_early_psci_conduit(void);
 #endif /*_ASM_ACPI_H*/
diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index d6050e9cde89..a36a9881a4f7 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -180,6 +180,102 @@ static int __init acpi_fadt_sanity_check(void)
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
+	u64 xsdt_pa, xsdt_len, xsdt_map_len;
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
+	 * So we map upto a PAGE_SIZE (and more with alignment) and check
+	 * the length. If the current mapping doesn't cover the full table,
+	 * we remap it upto the actual length.
+	 */
+	xsdt_map_len = PAGE_SIZE;
+	xsdt = early_memremap(xsdt_pa, xsdt_map_len);
+	if (!xsdt)
+		return SMCCC_CONDUIT_NONE;
+
+	/* Length of the mapped region */
+	xsdt_len = ALIGN(xsdt_pa + xsdt_map_len, PAGE_SIZE) - xsdt_pa;
+
+	if (xsdt_len < ((struct acpi_table_header*)xsdt)->length) {
+		xsdt_len = ((struct acpi_table_header*)xsdt)->length;
+		early_memunmap(xsdt, xsdt_map_len);
+		xsdt_map_len = xsdt_len;
+		xsdt = early_memremap(xsdt_pa, xsdt_map_len);
+		if (!xsdt)
+			return SMCCC_CONDUIT_NONE;
+	} else {
+		xsdt_len = ((struct acpi_table_header*)xsdt)->length;
+	}
+
+	/* Find FADT table from the XSDT */
+	ptr = &xsdt->table_offset_entry[0];
+	end = (u64*)((void *)xsdt + xsdt_len);
+	for (; ptr < end && !found; ptr++) {
+		struct acpi_table_fadt *fadt = early_memremap(*ptr, sizeof(*fadt));
+
+		if (!fadt) {
+			pr_warn("Unable to map ACPI table at 0x%llx\n", *ptr);
+			continue;
+		}
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
+	early_memunmap(xsdt, xsdt_map_len);
+	return c;
+}
+
 /*
  * acpi_boot_table_init() called from setup_arch(), always.
  *	1. find RSDP and get its address, and then find XSDT
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 23c05dc7a8f2..af35a0f3b7d0 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -278,6 +278,81 @@ u64 cpu_logical_map(unsigned int cpu)
 	return __cpu_logical_map[cpu];
 }
 
+static enum arm_smccc_conduit early_dt_probe_psci_conduit(void)
+{
+	int len = 0;
+	int psci_node;
+	const char *method, *status;
+	enum arm_smccc_conduit conduit = SMCCC_CONDUIT_NONE;
+	unsigned long dt_root;
+
+	/* DT hasn't been unflattened yet, we have to work with the flat blob */
+	dt_root = of_get_flat_dt_root();
+	psci_node = of_get_flat_dt_subnode_by_name(dt_root, "psci");
+	if (psci_node <= 0)
+		return conduit;
+
+	if (!of_flat_dt_is_compatible(psci_node, "arm,psci-0.2") &&
+	    !of_flat_dt_is_compatible(psci_node, "arm,psci-1.0"))
+		return conduit;
+
+	status = of_get_flat_dt_prop(psci_node, "status", &len);
+	if (status) {
+		if (strncmp(status, "ok", len) && strncmp(status, "okay", len))
+			return conduit;
+	}
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
@@ -322,6 +397,9 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
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


