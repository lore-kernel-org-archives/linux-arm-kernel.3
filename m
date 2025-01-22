Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E311BC02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 17:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DfBuB1WVX83l/Xuqs0l83yZqQu/qQgoBu7Slnt9tew=; b=RkYlXyUQsgMwMhWuCpKI9gdxPO
	MChcygLRW79sqVqBBfONgolsCmJs1pyfLxbSjplQD/YoXcd7jglgRsmSUGFZSh7z7YSO2iaeylrzZ
	uxQET4SDmvjQBILxdqW3m+EQfe6hHunF/crQd57YGqD6g3e51lSKqJR0vFtn0bm1nGnW6Ts8+JltS
	n3hS9cWgs0y4hV/5hxnzlqCRo9vqAo9xJoS47mjm0UbDVAJRYq/l3WnVWkCxvfW62Z5jTof3DAZ4Y
	ts1NrLa1xBpSAj2RRk3Us5gPwh1M/jZn6suH+L2vcdd+rPLiRBB3bSTMHvhzeEwbqKZ0FuACompXA
	OE7gw1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taeyf-0000000AwFT-0Wz3;
	Wed, 22 Jan 2025 17:57:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taepV-0000000AulX-45Qf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 17:47:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF3BE1007;
	Wed, 22 Jan 2025 09:48:21 -0800 (PST)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 707A23F66E;
	Wed, 22 Jan 2025 09:47:52 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 2/3] arm64: proton-pack: Add Spectre-BSE mitigation for Cortex-A7{2,3,5}
Date: Wed, 22 Jan 2025 17:47:35 +0000
Message-Id: <20250122174736.1560714-3-james.morse@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250122174736.1560714-1-james.morse@arm.com>
References: <20250122174736.1560714-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_094754_102949_1A2B4344 
X-CRM114-Status: GOOD (  22.51  )
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

A group of older Cortex cores are affected by Spectre-BSE which on one
core bypasses the existing Spectre-BHB mitigation.

The workaround is to use the Spectre-BHB 'arch_workaround_3' firmware
call. For Cortex-A7{3,5}, this is the existing mitigation so only the
reporting needs updating.
For Cortex-A72 if WA3 is not implemented, there is still a benefit
from enabling the Spectre-BHB branchy-loop.

This leads to special-casing anything affected by Spectre-BSE to avoid
enabling the branchy-loop, and instead only do this if the firmware WA3
call is not implemented. Such platforms will be reported as:
| Mitigation: Branch predictor hardening, BHB, but not BSE
via the Spectre-v2 vulnerabilities file.

Signed-off-by: James Morse <james.morse@arm.com>
---
Nothing relies on the BSE entries being in the BHB firmware list,
but this is done on the principle of least-surprise.
---
 arch/arm64/include/asm/spectre.h |   1 +
 arch/arm64/kernel/proton-pack.c  | 116 ++++++++++++++++++++++++++++++-
 2 files changed, 114 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/spectre.h b/arch/arm64/include/asm/spectre.h
index 0c4d9045c31f..c4123aa0b00d 100644
--- a/arch/arm64/include/asm/spectre.h
+++ b/arch/arm64/include/asm/spectre.h
@@ -96,6 +96,7 @@ void spectre_v4_enable_task_mitigation(struct task_struct *tsk);
 enum mitigation_state arm64_get_meltdown_state(void);
 
 enum mitigation_state arm64_get_spectre_bhb_state(void);
+enum mitigation_state arm64_get_spectre_bse_state(void);
 bool is_spectre_bhb_affected(const struct arm64_cpu_capabilities *entry, int scope);
 u8 spectre_bhb_loop_affected(int scope);
 void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *__unused);
diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 193f141d4367..4667325e1d7e 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -112,6 +112,24 @@ static const char *get_bhb_affected_string(enum mitigation_state bhb_state)
 	}
 }
 
+static const char *get_bse_affected_string(enum mitigation_state bse_state)
+{
+	enum mitigation_state bhb_state = arm64_get_spectre_bhb_state();
+
+	switch (bse_state) {
+	case SPECTRE_UNAFFECTED:
+		return "";
+	default:
+	case SPECTRE_VULNERABLE:
+		/* BHB+BSE = ", but not BHB or BSE" */
+		if (bhb_state == SPECTRE_VULNERABLE)
+			return " or BSE";
+		return ", but not BSE";
+	case SPECTRE_MITIGATED:
+		return ", BSE";
+	}
+}
+
 static bool _unprivileged_ebpf_enabled(void)
 {
 #ifdef CONFIG_BPF_SYSCALL
@@ -125,7 +143,9 @@ ssize_t cpu_show_spectre_v2(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
 	enum mitigation_state bhb_state = arm64_get_spectre_bhb_state();
+	enum mitigation_state bse_state = arm64_get_spectre_bse_state();
 	const char *bhb_str = get_bhb_affected_string(bhb_state);
+	const char *bse_str = get_bse_affected_string(bse_state);
 	const char *v2_str = "Branch predictor hardening";
 
 	switch (spectre_v2_state) {
@@ -143,7 +163,7 @@ ssize_t cpu_show_spectre_v2(struct device *dev, struct device_attribute *attr,
 		if (bhb_state == SPECTRE_MITIGATED && _unprivileged_ebpf_enabled())
 			return sprintf(buf, "Vulnerable: Unprivileged eBPF enabled\n");
 
-		return sprintf(buf, "Mitigation: %s%s\n", v2_str, bhb_str);
+		return sprintf(buf, "Mitigation: %s%s%s\n", v2_str, bhb_str, bse_str);
 	case SPECTRE_VULNERABLE:
 		fallthrough;
 	default:
@@ -825,6 +845,15 @@ int arch_prctl_spec_ctrl_get(struct task_struct *task, unsigned long which)
  * - Has the 'Exception Clears Branch History Buffer' (ECBHB) feature, so no
  *   software mitigation in the vectors is needed.
  * - Has CSV2.3, so is unaffected.
+ *
+ *
+ * Spectre BSE.
+ *
+ * Affects a small number of CPUs. Cortex-A73 and Cortex-A75 are already
+ * mitigated by the firmware Spectre-BHB mitigation.
+ * A72 r0 is mitigated by the firmware Spectre v2 call. This means A72 appears
+ * in both the BHB "loop mitigated list" and "firmware mitigated list", and
+ * needs special casing.
  */
 static enum mitigation_state spectre_bhb_state;
 
@@ -841,6 +870,13 @@ enum bhb_mitigation_bits {
 };
 static unsigned long system_bhb_mitigations;
 
+static enum mitigation_state spectre_bse_state;
+
+enum mitigation_state arm64_get_spectre_bse_state(void)
+{
+	return spectre_bse_state;
+}
+
 /*
  * This must be called with SCOPE_LOCAL_CPU for each type of CPU, before any
  * SCOPE_SYSTEM call will give the right answer.
@@ -916,12 +952,36 @@ static enum mitigation_state spectre_bhb_get_cpu_fw_mitigation_state(void)
 	}
 }
 
+/*
+ * For a core affected by BSE, get the WA3 state and handle the 'unaffected'
+ * case from unaware firmware.
+ */
+static enum mitigation_state spectre_bse_get_cpu_fw_mitigation_state(void)
+{
+	enum mitigation_state state = spectre_bhb_get_cpu_fw_mitigation_state();
+
+	switch (state) {
+	case SPECTRE_MITIGATED:
+		return state;
+	default:
+	case SPECTRE_UNAFFECTED:
+		/*
+		 * We don't rely on firmware for discovery of BSE affected
+		 * cores. Unaffected is treated as not-implemented.
+		 */
+	case SPECTRE_VULNERABLE:
+		return SPECTRE_VULNERABLE;
+	}
+}
+
 static bool is_spectre_bhb_fw_affected(int scope)
 {
 	static bool system_affected;
 	enum mitigation_state fw_state;
 	bool has_smccc = arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_NONE;
 	static const struct midr_range spectre_bhb_firmware_mitigated_list[] = {
+		/* A72 r0pX */
+		MIDR_RANGE(MIDR_CORTEX_A72, 0, 0, 0, 0xf),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A73),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A75),
 		{},
@@ -974,6 +1034,29 @@ bool is_spectre_bhb_affected(const struct arm64_cpu_capabilities *entry,
 	return false;
 }
 
+static bool is_spectre_bse_affected(int scope)
+{
+	static bool system_affected;
+	static const struct midr_range spectre_bse_firmware_mitigated_list[] = {
+		/* A72 r0pX */
+		MIDR_RANGE(MIDR_CORTEX_A72, 0, 0, 0, 0xf),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A73),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A75),
+		{},
+	};
+
+	if (scope != SCOPE_LOCAL_CPU)
+		return system_affected;
+
+	if (is_midr_in_range_list(read_cpuid_id(),
+				  spectre_bse_firmware_mitigated_list)) {
+		system_affected = true;
+		return true;
+	}
+
+	return false;
+}
+
 static void this_cpu_set_vectors(enum arm64_bp_harden_el1_vectors slot)
 {
 	const char *v = arm64_get_bp_hardening_vector(slot);
@@ -1046,7 +1129,9 @@ static void spectre_bhb_enable_loop_mitigation(void)
 
 void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
 {
+	bool bse_upgrade_loop_mitigation = false;
 	enum mitigation_state fw_state, state = SPECTRE_VULNERABLE;
+	enum mitigation_state bse_state = SPECTRE_VULNERABLE;
 	struct bp_hardening_data *data = this_cpu_ptr(&bp_hardening_data);
 
 	if (!is_spectre_bhb_affected(entry, SCOPE_LOCAL_CPU))
@@ -1073,17 +1158,42 @@ void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
 		state = SPECTRE_MITIGATED;
 		set_bit(BHB_INSN, &system_bhb_mitigations);
 	} else if (spectre_bhb_loop_affected(SCOPE_LOCAL_CPU)) {
-		spectre_bhb_enable_loop_mitigation();
-		state = SPECTRE_MITIGATED;
+		/* Cores also affected by BSE are special cased later */
+		if (!is_spectre_bse_affected(SCOPE_LOCAL_CPU)) {
+			spectre_bhb_enable_loop_mitigation();
+			state = SPECTRE_MITIGATED;
+		} else {
+			bse_upgrade_loop_mitigation = true;
+		}
 	} else if (is_spectre_bhb_fw_affected(SCOPE_LOCAL_CPU)) {
 		fw_state = spectre_bhb_get_cpu_fw_mitigation_state();
 		if (fw_state == SPECTRE_MITIGATED) {
 			spectre_bhb_enable_fw_mitigation();
 			state = SPECTRE_MITIGATED;
+
+			if (is_spectre_bse_affected(SCOPE_LOCAL_CPU))
+				bse_state = SPECTRE_MITIGATED;
 		}
 	}
 
+	/* Spectre BSE needs to upgrade the BHB mitigation to use firmware */
+	if (bse_upgrade_loop_mitigation) {
+		bse_state = spectre_bse_get_cpu_fw_mitigation_state();
+		if (bse_state == SPECTRE_MITIGATED) {
+			spectre_bhb_enable_fw_mitigation();
+			state = SPECTRE_MITIGATED;
+			bse_state = SPECTRE_MITIGATED;
+		} else {
+			spectre_bhb_enable_loop_mitigation();
+			state = SPECTRE_MITIGATED;
+			bse_state = SPECTRE_VULNERABLE;
+		}
+	} else if (!is_spectre_bse_affected(SCOPE_LOCAL_CPU)) {
+		bse_state = SPECTRE_UNAFFECTED;
+	}
+
 	update_mitigation_state(&spectre_bhb_state, state);
+	update_mitigation_state(&spectre_bse_state, bse_state);
 }
 
 /* Patched to NOP when enabled */
-- 
2.39.2


