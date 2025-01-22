Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94300C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 17:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPdQFYW1+alBPT0W0zc3pKmITDrBpX+LkBaRcYVjQhA=; b=E/jlnSeyTd8tPyzM27bZz1PP2u
	Kxd6q27z47G/f/e+Srzoj6+WmblMjW99OEcN9I/gsWIz7dtUKeWEnRNdpkvzTfonp8Wl4W8CoaMlp
	3CnRC6/7CGgkyhScGRT34KX/SgrxOrbJ/u+pxxwHPyDzHpGI9utJdg3ON2lEak3xLn60KCW3gN0Ig
	oZEan3WsENpSodQK+WK834mABrWgfFgFBOQ3f+WhuvpAYF0mz3B3b/v8auyzJGuZRLkye7iCvDX3z
	idNWD6smz8smasK9IxAzQ8dejjPpsxln/j+6nVv6g4LV3at48z7ZsQHYziI0/+atRibf+kvDaGFyz
	MaCV853Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taezu-0000000AwRJ-3UHX;
	Wed, 22 Jan 2025 17:58:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taepX-0000000Aumm-30w9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 17:47:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 955181063;
	Wed, 22 Jan 2025 09:48:23 -0800 (PST)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 468663F66E;
	Wed, 22 Jan 2025 09:47:54 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 3/3] arm64: proton-pack: Prefer WA1 for BHB on Cortex-A72 r0pX
Date: Wed, 22 Jan 2025 17:47:36 +0000
Message-Id: <20250122174736.1560714-4-james.morse@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250122174736.1560714-1-james.morse@arm.com>
References: <20250122174736.1560714-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_094755_851313_877A1148 
X-CRM114-Status: GOOD (  18.15  )
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

Cortex-A72 r0pX is affected by Spectre-BSE which bypasses the existing
Spectre-BHB mitigation. As implemented by TFA, both WA1 and WA3
are sufficient to mitigate Spectre-BHB and Spectre-BSE on Cortex-A72 r0pX.
The performance cost will be the same.

The incomplete mitigation is the branchy-loop that was previously used.
It isn't possible to discover if a hypervisor implements WA3 using the
branchy-loop, so WA3 can't be trusted for this CPU.

Instead, use WA1. This involves duplicating the BHB_FW bit in the
mitigations bitmap and patching in the appropriate immediate to the
mitigation sequence. If both WA3 and WA1 are selected, WA1 should
take priority.

Signed-off-by: James Morse <james.morse@arm.com>
---
 arch/arm64/include/asm/assembler.h |  4 ++-
 arch/arm64/kernel/proton-pack.c    | 58 ++++++++++++++++++++----------
 2 files changed, 42 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index 3d8d534a7a77..36a5c7868cd8 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -838,7 +838,9 @@ alternative_cb_end
 #ifdef CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY
 	stp	x0, x1, [sp, #-16]!
 	stp	x2, x3, [sp, #-16]!
-	mov	w0, #ARM_SMCCC_ARCH_WORKAROUND_3
+alternative_cb ARM64_ALWAYS_SYSTEM, spectre_bhb_patch_wa3
+	mov	w0, #ARM_SMCCC_ARCH_WORKAROUND_3 // Maybe patched to WA1
+alternative_cb_end
 alternative_cb ARM64_ALWAYS_SYSTEM, smccc_patch_fw_mitigation_conduit
 	nop					// Patched to SMC/HVC #0
 alternative_cb_end
diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 4667325e1d7e..cbe731ff1831 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -864,7 +864,8 @@ enum mitigation_state arm64_get_spectre_bhb_state(void)
 
 enum bhb_mitigation_bits {
 	BHB_LOOP,
-	BHB_FW,
+	BHB_FW_WA3,
+	BHB_FW_WA1,
 	BHB_HW,
 	BHB_INSN,
 };
@@ -931,13 +932,17 @@ u8 spectre_bhb_loop_affected(int scope)
 	return k;
 }
 
-static enum mitigation_state spectre_bhb_get_cpu_fw_mitigation_state(void)
+static enum mitigation_state
+spectre_bhb_get_cpu_fw_mitigation_state(enum bhb_mitigation_bits fw_wa)
 {
 	int ret;
 	struct arm_smccc_res res;
+	u64 imm = ARM_SMCCC_ARCH_WORKAROUND_3;
 
-	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
-			     ARM_SMCCC_ARCH_WORKAROUND_3, &res);
+	if (fw_wa == BHB_FW_WA1)
+		imm = ARM_SMCCC_ARCH_WORKAROUND_1;
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID, imm, &res);
 
 	ret = res.a0;
 	switch (ret) {
@@ -956,9 +961,10 @@ static enum mitigation_state spectre_bhb_get_cpu_fw_mitigation_state(void)
  * For a core affected by BSE, get the WA3 state and handle the 'unaffected'
  * case from unaware firmware.
  */
-static enum mitigation_state spectre_bse_get_cpu_fw_mitigation_state(void)
+static enum mitigation_state
+spectre_bse_get_cpu_fw_mitigation_state(enum bhb_mitigation_bits fw_wa)
 {
-	enum mitigation_state state = spectre_bhb_get_cpu_fw_mitigation_state();
+	enum mitigation_state state = spectre_bhb_get_cpu_fw_mitigation_state(fw_wa);
 
 	switch (state) {
 	case SPECTRE_MITIGATED:
@@ -992,7 +998,7 @@ static bool is_spectre_bhb_fw_affected(int scope)
 	if (scope != SCOPE_LOCAL_CPU)
 		return system_affected;
 
-	fw_state = spectre_bhb_get_cpu_fw_mitigation_state();
+	fw_state = spectre_bhb_get_cpu_fw_mitigation_state(BHB_FW_WA3);
 	if (cpu_in_list || (has_smccc && fw_state == SPECTRE_MITIGATED)) {
 		system_affected = true;
 		return true;
@@ -1082,7 +1088,7 @@ static int __init parse_spectre_bhb_param(char *str)
 }
 early_param("nospectre_bhb", parse_spectre_bhb_param);
 
-static void spectre_bhb_enable_fw_mitigation(void)
+static void spectre_bhb_enable_fw_mitigation(enum bhb_mitigation_bits fw_wa)
 {
 	bp_hardening_cb_t cpu_cb;
 	struct bp_hardening_data *data = this_cpu_ptr(&bp_hardening_data);
@@ -1107,7 +1113,7 @@ static void spectre_bhb_enable_fw_mitigation(void)
 	if (__this_cpu_read(bp_hardening_data.fn) != cpu_cb)
 		__this_cpu_write(bp_hardening_data.fn, NULL);
 
-	set_bit(BHB_FW, &system_bhb_mitigations);
+	set_bit(fw_wa, &system_bhb_mitigations);
 }
 
 static void spectre_bhb_enable_loop_mitigation(void)
@@ -1166,9 +1172,9 @@ void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
 			bse_upgrade_loop_mitigation = true;
 		}
 	} else if (is_spectre_bhb_fw_affected(SCOPE_LOCAL_CPU)) {
-		fw_state = spectre_bhb_get_cpu_fw_mitigation_state();
+		fw_state = spectre_bhb_get_cpu_fw_mitigation_state(BHB_FW_WA3);
 		if (fw_state == SPECTRE_MITIGATED) {
-			spectre_bhb_enable_fw_mitigation();
+			spectre_bhb_enable_fw_mitigation(BHB_FW_WA3);
 			state = SPECTRE_MITIGATED;
 
 			if (is_spectre_bse_affected(SCOPE_LOCAL_CPU))
@@ -1178,9 +1184,16 @@ void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
 
 	/* Spectre BSE needs to upgrade the BHB mitigation to use firmware */
 	if (bse_upgrade_loop_mitigation) {
-		bse_state = spectre_bse_get_cpu_fw_mitigation_state();
+		bse_state = spectre_bse_get_cpu_fw_mitigation_state(BHB_FW_WA1);
 		if (bse_state == SPECTRE_MITIGATED) {
-			spectre_bhb_enable_fw_mitigation();
+			/*
+			 * For affected cores the firmware implementions of WA1
+			 * and WA3 are both sufficient for BSE, but what about
+			 * hypervisors? It's possible the hypervisor implements
+			 * WA3 with the branchy-loop, which is not sufficient.
+			 * Use the WA1 call instead.
+			 */
+			spectre_bhb_enable_fw_mitigation(BHB_FW_WA1);
 			state = SPECTRE_MITIGATED;
 			bse_state = SPECTRE_MITIGATED;
 		} else {
@@ -1214,7 +1227,7 @@ void noinstr spectre_bhb_patch_fw_mitigation_enabled(struct alt_instr *alt,
 {
 	BUG_ON(nr_inst != 1);
 
-	if (test_bit(BHB_FW, &system_bhb_mitigations))
+	if (test_bit(BHB_FW_WA3, &system_bhb_mitigations))
 		*updptr++ = cpu_to_le32(aarch64_insn_gen_nop());
 }
 
@@ -1239,26 +1252,33 @@ void noinstr spectre_bhb_patch_loop_iter(struct alt_instr *alt,
 	*updptr++ = cpu_to_le32(insn);
 }
 
-/* Patched to mov WA3 when supported */
+/* Patched to mov WA1 or WA3 when supported */
 void noinstr spectre_bhb_patch_wa3(struct alt_instr *alt,
 				   __le32 *origptr, __le32 *updptr, int nr_inst)
 {
 	u8 rd;
 	u32 insn;
+	u64 imm = ARM_SMCCC_ARCH_WORKAROUND_3;
 
 	BUG_ON(nr_inst != 1); /* MOV -> MOV */
 
-	if (!IS_ENABLED(CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY) ||
-	    !test_bit(BHB_FW, &system_bhb_mitigations))
+	if (!IS_ENABLED(CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY))
 		return;
 
+	if (!test_bit(BHB_FW_WA1, &system_bhb_mitigations) &&
+	    !test_bit(BHB_FW_WA3, &system_bhb_mitigations))
+		return;
+
+	/* If both WA1 and WA3 are selected, WA1 must be used */
+	if (test_bit(BHB_FW_WA1, &system_bhb_mitigations))
+		imm = ARM_SMCCC_ARCH_WORKAROUND_1;
+
 	insn = le32_to_cpu(*origptr);
 	rd = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RD, insn);
 
 	insn = aarch64_insn_gen_logical_immediate(AARCH64_INSN_LOGIC_ORR,
 						  AARCH64_INSN_VARIANT_32BIT,
-						  AARCH64_INSN_REG_ZR, rd,
-						  ARM_SMCCC_ARCH_WORKAROUND_3);
+						  AARCH64_INSN_REG_ZR, rd, imm);
 	if (WARN_ON_ONCE(insn == AARCH64_BREAK_FAULT))
 		return;
 
-- 
2.39.2


