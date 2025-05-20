Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FDDC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 22:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jep+gnO2qujpj7KrEb0bpwSHACCyZ+NIb4ph9EcfDHE=; b=u35QlU3lnbiUMMPHm59bTxXXeP
	RIa3jYAHrcc7/MNk1yJVvxFH6vihuCZQ6vO7YdqbnAkMc3qxo38fYmVeLvT5hN5Nnfh1DD9L6GKLB
	DzXzvd+/7Uo6OOEdi9n+JIxLvm7dLbYUg+57Sr6QkDxFpXayHwata7ufnpG+W1BWVxP5JvDpHFr1P
	Gdyidfmtior26ItBhI+JyCxdXzkIMnQZfjKQKLCpG0fQ+cDghqyPOraLylDjJXqUvGiyU0KfQloHW
	s07XUDjo7mUrfnunLP6ZOhbujsw68FDWCuRgkgABD6jXy5JnYKGTy4JuxHV8KGZOe+VdAKIzWb5LV
	EMpgpOmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHVZy-0000000EICH-1GjR;
	Tue, 20 May 2025 22:36:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHVRS-0000000EGR3-48Oh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 22:28:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6AFB4AED7;
	Tue, 20 May 2025 22:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1A0C4CEEF;
	Tue, 20 May 2025 22:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747780090;
	bh=De2YwkVc5JbJgGUVRzrj39R60riU62P53vG0PIGx1bk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=et6zK3p3/iE+/hyH5tevDzMYjhAcPztTLKBL/fPy54ONgO19ZUTO+owN289eC/8LX
	 gJJFKTwdiMmG51sn6uCdIKO0dcECdzH52KiYszVYobKSZbLeYV8rr6JcQXtSg/nG1l
	 +u/5S9dk6TNxeJgOATlkDgyW/y6U7dDMDTpnyPwBCtg/Z6aPnq/wXwpPMcv0t3KkSp
	 kx+GGQev/z98/PGO+SKf4fGHZdo5/UOL4bBWwXfqp/nCez9H9aoa0E2WF2C6d+MJVw
	 S5jwmWxOI6sVvvpou02C9Y2qdS4vR7DkBwGmftNAnzr8dInbde4NTdAuVSQAS1GW4s
	 caGyaEN2gK7Tw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 20 May 2025 17:27:38 -0500
Subject: [PATCH v22 3/5] arm64: Handle BRBE booting requirements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-arm-brbe-v19-v22-3-c1ddde38e7f8@kernel.org>
References: <20250520-arm-brbe-v19-v22-0-c1ddde38e7f8@kernel.org>
In-Reply-To: <20250520-arm-brbe-v19-v22-0-c1ddde38e7f8@kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_152811_075915_FA7705B0 
X-CRM114-Status: GOOD (  16.62  )
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

From: Anshuman Khandual <anshuman.khandual@arm.com>

To use the Branch Record Buffer Extension (BRBE), some configuration is
necessary at EL3 and EL2. This patch documents the requirements and adds
the initial EL2 setup code, which largely consists of configuring the
fine-grained traps and initializing a couple of BRBE control registers.

Before this patch, __init_el2_fgt() would initialize HDFGRTR_EL2 and
HDFGWTR_EL2 with the same value, relying on the read/write trap controls
for a register occupying the same bit position in either register. The
'nBRBIDR' trap control only exists in bit 59 of HDFGRTR_EL2, while bit
59 of HDFGWTR_EL2 is RES0, and so this assumption no longer holds.

To handle HDFGRTR_EL2 and HDFGWTR_EL2 having (slightly) different bit
layouts, __init_el2_fgt() is changed to accumulate the HDFGRTR_EL2 and
HDFGWTR_EL2 control bits separately. While making this change the
open-coded value (1 << 62) is replaced with
HDFG{R,W}TR_EL2_nPMSNEVFR_EL1_MASK.

The BRBCR_EL1 and BRBCR_EL2 registers are unusual and require special
initialisation: even though they are subject to E2H renaming, both have
an effect regardless of HCR_EL2.TGE, even when running at EL2. So we
must initialize BRBCR_EL2 in case we run in nVHE mode. This is handled
in __init_el2_brbe() with a comment to explain the situation.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
[Mark: rewrite commit message, fix typo in comment]
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Co-developed-by: "Rob Herring (Arm)" <robh@kernel.org>
Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
---
v22:
- Reword booting.rst section name (s/feature/the/) and move next to
  other PMU related features instead of in the middle of SME features.
- Drop setting SYS_BRBCR_EL1
- Drop CONFIG_ARM64_BRBE ifdef
- Rework initialization of HFGITR_EL2

v20:
 - Document that MDCR_EL3.SBRBE can be 0b01 also
 - Fix "HDFGWTR_EL2 is RES0" in commit msg
---
 Documentation/arch/arm64/booting.rst | 21 +++++++++++
 arch/arm64/include/asm/el2_setup.h   | 71 ++++++++++++++++++++++++++++++++++--
 2 files changed, 89 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index dee7b6de864f..fbdc4b071755 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -388,6 +388,27 @@ Before jumping into the kernel, the following conditions must be met:
 
     - SMCR_EL2.EZT0 (bit 30) must be initialised to 0b1.
 
+  For CPUs with the Branch Record Buffer Extension (FEAT_BRBE):
+
+  - If EL3 is present:
+
+    - MDCR_EL3.SBRBE (bits 33:32) must be initialised to 0b01 or 0b11.
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+    - BRBCR_EL2.CC (bit 3) must be initialised to 0b1.
+    - BRBCR_EL2.MPRED (bit 4) must be initialised to 0b1.
+
+    - HDFGRTR_EL2.nBRBDATA (bit 61) must be initialised to 0b1.
+    - HDFGRTR_EL2.nBRBCTL  (bit 60) must be initialised to 0b1.
+    - HDFGRTR_EL2.nBRBIDR  (bit 59) must be initialised to 0b1.
+
+    - HDFGWTR_EL2.nBRBDATA (bit 61) must be initialised to 0b1.
+    - HDFGWTR_EL2.nBRBCTL  (bit 60) must be initialised to 0b1.
+
+    - HFGITR_EL2.nBRBIALL (bit 56) must be initialised to 0b1.
+    - HFGITR_EL2.nBRBINJ  (bit 55) must be initialised to 0b1.
+
   For CPUs with the Performance Monitors Extension (FEAT_PMUv3p9):
 
  - If EL3 is present:
diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 30f57b0334a3..c55a8bb8a961 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -189,6 +189,28 @@
 .Lskip_set_cptr_\@:
 .endm
 
+/*
+ * Configure BRBE to permit recording cycle counts and branch mispredicts.
+ *
+ * At any EL, to record cycle counts BRBE requires that both BRBCR_EL2.CC=1 and
+ * BRBCR_EL1.CC=1.
+ *
+ * At any EL, to record branch mispredicts BRBE requires that both
+ * BRBCR_EL2.MPRED=1 and BRBCR_EL1.MPRED=1.
+ *
+ * Set {CC,MPRED} in BRBCR_EL2 in case nVHE mode is used and we are
+ * executing in EL1.
+ */
+.macro __init_el2_brbe
+	mrs	x1, id_aa64dfr0_el1
+	ubfx	x1, x1, #ID_AA64DFR0_EL1_BRBE_SHIFT, #4
+	cbz	x1, .Lskip_brbe_\@
+
+	mov_q	x0, BRBCR_ELx_CC | BRBCR_ELx_MPRED
+	msr_s	SYS_BRBCR_EL2, x0
+.Lskip_brbe_\@:
+.endm
+
 /* Disable any fine grained traps */
 .macro __init_el2_fgt
 	mrs	x1, id_aa64mmfr0_el1
@@ -196,20 +218,62 @@
 	cbz	x1, .Lskip_fgt_\@
 
 	mov	x0, xzr
+	mov	x2, xzr
 	mrs	x1, id_aa64dfr0_el1
 	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
 	cmp	x1, #3
 	b.lt	.Lskip_spe_fgt_\@
 	/* Disable PMSNEVFR_EL1 read and write traps */
-	orr	x0, x0, #(1 << 62)
+	orr	x0, x0, #HDFGRTR_EL2_nPMSNEVFR_EL1_MASK
+	orr	x2, x2, #HDFGWTR_EL2_nPMSNEVFR_EL1_MASK
 
 .Lskip_spe_fgt_\@:
+	mrs	x1, id_aa64dfr0_el1
+	ubfx	x1, x1, #ID_AA64DFR0_EL1_BRBE_SHIFT, #4
+	cbz	x1, .Lskip_brbe_fgt_\@
+
+	/*
+	 * Disable read traps for the following registers
+	 *
+	 * [BRBSRC|BRBTGT|RBINF]_EL1
+	 * [BRBSRCINJ|BRBTGTINJ|BRBINFINJ|BRBTS]_EL1
+	 */
+	orr	x0, x0, #HDFGRTR_EL2_nBRBDATA_MASK
+
+	/*
+	 * Disable write traps for the following registers
+	 *
+	 * [BRBSRCINJ|BRBTGTINJ|BRBINFINJ|BRBTS]_EL1
+	 */
+	orr	x2, x2, #HDFGWTR_EL2_nBRBDATA_MASK
+
+	/* Disable read and write traps for [BRBCR|BRBFCR]_EL1 */
+	orr	x0, x0, #HDFGRTR_EL2_nBRBCTL_MASK
+	orr	x2, x2, #HDFGWTR_EL2_nBRBCTL_MASK
+
+	/* Disable read traps for BRBIDR_EL1 */
+	orr	x0, x0, #HDFGRTR_EL2_nBRBIDR_MASK
+
+.Lskip_brbe_fgt_\@:
 
 .Lset_debug_fgt_\@:
 	msr_s	SYS_HDFGRTR_EL2, x0
-	msr_s	SYS_HDFGWTR_EL2, x0
+	msr_s	SYS_HDFGWTR_EL2, x2
 
 	mov	x0, xzr
+	mov	x2, xzr
+
+	mrs	x1, id_aa64dfr0_el1
+	ubfx	x1, x1, #ID_AA64DFR0_EL1_BRBE_SHIFT, #4
+	cbz	x1, .Lskip_brbe_insn_fgt_\@
+
+	/* Disable traps for BRBIALL instruction */
+	orr	x2, x2, #HFGITR_EL2_nBRBIALL_MASK
+
+	/* Disable traps for BRBINJ instruction */
+	orr	x2, x2, #HFGITR_EL2_nBRBINJ_MASK
+
+.Lskip_brbe_insn_fgt_\@:
 	mrs	x1, id_aa64pfr1_el1
 	ubfx	x1, x1, #ID_AA64PFR1_EL1_SME_SHIFT, #4
 	cbz	x1, .Lskip_sme_fgt_\@
@@ -250,7 +314,7 @@
 .Lset_fgt_\@:
 	msr_s	SYS_HFGRTR_EL2, x0
 	msr_s	SYS_HFGWTR_EL2, x0
-	msr_s	SYS_HFGITR_EL2, xzr
+	msr_s	SYS_HFGITR_EL2, x2
 
 	mrs	x1, id_aa64pfr0_el1		// AMU traps UNDEF without AMU
 	ubfx	x1, x1, #ID_AA64PFR0_EL1_AMU_SHIFT, #4
@@ -324,6 +388,7 @@
 	__init_el2_hcrx
 	__init_el2_timers
 	__init_el2_debug
+	__init_el2_brbe
 	__init_el2_lor
 	__init_el2_stage2
 	__init_el2_gicv3

-- 
2.47.2


