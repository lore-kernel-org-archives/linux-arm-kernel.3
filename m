Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EEFCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 13:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4tgTUi7WsyUxp3wO7XnfwFOzjz4dOX7aF/QwuRB6cM=; b=OWpSy0MkCD3lVSLCStBizBKC9L
	wP3OEJdD9EH7jrDI8izRJp0rY2ycek7eMSmYhMtYa/t7hXYoIIeDCWGjy2ULfxFixE0qPxBosbqth
	sVtrIBjlGEsIqqgJd0VM/Ev5icdttT15AwnYMneWoWKcP1ngGDv/NCq8ABNXClolT6e0uWa8GQCLc
	0WkX2ZGIctPY85Z4Es9vdu4j+8t/sccfR86Crg642vfnd3ShdbiOz+OrVBa8Mp6KjdT7J+8lJo4gB
	BvWHOwjsxMU7B6rxRnCccBeehZpPnTB4BH/OsTN3s7daCZxVfhAGkBZCmywS3qjR2AqbP4ZkBAZ/q
	aw7n2Q1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umB59-0000000DhOj-43Sy;
	Wed, 13 Aug 2025 12:59:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umAAd-0000000DaVg-3OzJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 12:01:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 433ED175A;
	Wed, 13 Aug 2025 05:01:23 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 08BFD3F5A1;
	Wed, 13 Aug 2025 05:01:27 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	anshuman.khandual@arm.com,
	robh@kernel.org,
	james.morse@arm.com,
	mark.rutland@arm.com,
	joey.gouly@arm.com,
	Dave.Martin@arm.com,
	ahmed.genidi@arm.com,
	kevin.brodsky@arm.com,
	scott@os.amperecomputing.com,
	mbenes@suse.cz,
	james.clark@linaro.org,
	frederic@kernel.org,
	rafael@kernel.org,
	pavel@kernel.org,
	ryan.roberts@arm.com,
	suzuki.poulose@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v3 2/5] arm64: initialise SCTLR2_ELx register at boot time
Date: Wed, 13 Aug 2025 13:01:15 +0100
Message-Id: <20250813120118.3953541-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813120118.3953541-1-yeoreum.yun@arm.com>
References: <20250813120118.3953541-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_050131_924871_0191A6E8 
X-CRM114-Status: GOOD (  13.69  )
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

SCTLR2_ELx register is optional starting from ARMv8.8/ARMv9.3,
and becomes mandatory from ARMv8.9/ARMv9.4
and serveral architectural feature are controled by bits in
these registers.

These register's value is UNKNOWN when it was reset
It wasn't need to be initialised if firmware initilises these registers
properly.
But for the case not initialised properly, initialise SCTLR2_ELx
registers at bootin cpu/vcpu so that
unexpected system behavior couldn't happen for
improper SCTLR2_ELx value.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/include/asm/assembler.h   | 22 ++++++++++++++++++++++
 arch/arm64/include/asm/el2_setup.h   |  6 ++++++
 arch/arm64/include/asm/sysreg.h      |  5 +++++
 arch/arm64/kernel/head.S             |  5 +++++
 arch/arm64/kernel/hyp-stub.S         | 10 ++++++++++
 arch/arm64/kvm/hyp/nvhe/psci-relay.c |  3 +++
 6 files changed, 51 insertions(+)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index 23be85d93348..eef169c105f0 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -738,6 +738,28 @@ alternative_endif
 	set_sctlr sctlr_el2, \reg
 .endm

+	/*
+	 * Set SCTLR2_ELx to the @reg value.
+	 */
+	.macro __set_sctlr2_elx, el, reg, tmp
+	mrs_s	\tmp, SYS_ID_AA64MMFR3_EL1
+	ubfx	\tmp, \tmp, #ID_AA64MMFR3_EL1_SCTLRX_SHIFT, #4
+	cbz	\tmp, .Lskip_sctlr2_\@
+	.if	\el == 2
+	msr_s	SYS_SCTLR_EL2, \reg
+	.elseif	\el == 12
+	msr_s	SYS_SCTLR_EL12, \reg
+	.else
+	msr_s	SYS_SCTLR_EL1, \reg
+	.endif
+.Lskip_sctlr2_\@:
+	.endm
+
+	.macro set_sctlr2_elx, el, reg, tmp
+	__set_sctlr2_elx	\el, \reg, \tmp
+	isb
+	.endm
+
 	/*
 	 * Check whether asm code should yield as soon as it is able. This is
 	 * the case if we are currently running in task context, and the
diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index d755b4d46d77..c03cabd45fcf 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -48,6 +48,11 @@
 	isb
 .endm

+.macro __init_sctlr2_el2
+	mov_q	x0, INIT_SCTLR2_EL2
+	set_sctlr2_elx	2, x0, x1
+.endm
+
 .macro __init_el2_hcrx
 	mrs	x0, id_aa64mmfr1_el1
 	ubfx	x0, x0, #ID_AA64MMFR1_EL1_HCX_SHIFT, #4
@@ -411,6 +416,7 @@
  */
 .macro init_el2_state
 	__init_el2_sctlr
+	__init_sctlr2_el2
 	__init_el2_hcrx
 	__init_el2_timers
 	__init_el2_debug
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index d5b5f2ae1afa..0431b357b87b 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -868,6 +868,8 @@
 #define INIT_SCTLR_EL2_MMU_OFF \
 	(SCTLR_EL2_RES1 | ENDIAN_SET_EL2)

+#define INIT_SCTLR2_EL2			UL(0)
+
 /* SCTLR_EL1 specific flags. */
 #ifdef CONFIG_CPU_BIG_ENDIAN
 #define ENDIAN_SET_EL1		(SCTLR_EL1_E0E | SCTLR_ELx_EE)
@@ -888,6 +890,8 @@
 	 SCTLR_EL1_LSMAOE | SCTLR_EL1_nTLSMD | SCTLR_EL1_EIS   | \
 	 SCTLR_EL1_TSCXT  | SCTLR_EL1_EOS)

+#define INIT_SCTLR2_EL1			UL(0)
+
 /* MAIR_ELx memory attributes (used by Linux) */
 #define MAIR_ATTR_DEVICE_nGnRnE		UL(0x00)
 #define MAIR_ATTR_DEVICE_nGnRE		UL(0x04)
@@ -1164,6 +1168,7 @@
 	msr	hcr_el2, \reg
 #endif
 	.endm
+
 #else

 #include <linux/bitfield.h>
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index ca04b338cb0d..c41015675eae 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -276,6 +276,8 @@ SYM_INNER_LABEL(init_el1, SYM_L_LOCAL)
 	mov_q	x0, INIT_SCTLR_EL1_MMU_OFF
 	pre_disable_mmu_workaround
 	msr	sctlr_el1, x0
+	mov_q	x0, INIT_SCTLR2_EL1
+	__set_sctlr2_elx	1, x0, x1
 	isb
 	mov_q	x0, INIT_PSTATE_EL1
 	msr	spsr_el1, x0
@@ -308,6 +310,7 @@ SYM_INNER_LABEL(init_el2, SYM_L_LOCAL)
 	isb

 	mov_q	x1, INIT_SCTLR_EL1_MMU_OFF
+	mov_q	x2, INIT_SCTLR2_EL1

 	mrs	x0, hcr_el2
 	and	x0, x0, #HCR_E2H
@@ -315,11 +318,13 @@ SYM_INNER_LABEL(init_el2, SYM_L_LOCAL)

 	/* Set a sane SCTLR_EL1, the VHE way */
 	msr_s	SYS_SCTLR_EL12, x1
+	__set_sctlr2_elx	12, x2, x0
 	mov	x2, #BOOT_CPU_FLAG_E2H
 	b	3f

 2:
 	msr	sctlr_el1, x1
+	__set_sctlr2_elx	1, x2, x0
 	mov	x2, xzr
 3:
 	mov	x0, #INIT_PSTATE_EL1
diff --git a/arch/arm64/kernel/hyp-stub.S b/arch/arm64/kernel/hyp-stub.S
index 36e2d26b54f5..ac12f1b4f8e2 100644
--- a/arch/arm64/kernel/hyp-stub.S
+++ b/arch/arm64/kernel/hyp-stub.S
@@ -144,7 +144,17 @@ SYM_CODE_START_LOCAL(__finalise_el2)

 .Lskip_indirection:
 .Lskip_tcr2:
+	mrs_s	x1, SYS_ID_AA64MMFR3_EL1
+	ubfx	x1, x1, #ID_AA64MMFR3_EL1_SCTLRX_SHIFT, #4
+	cbz	x1, .Lskip_sctlr2
+	mrs_s	x1, SYS_SCTLR2_EL12
+	msr_s	SYS_SCTLR2_EL1, x1

+	// clean SCTLR2_EL1
+	mov_q	x1, INIT_SCTLR2_EL1
+	msr_s	SYS_SCTLR2_EL12, x1
+
+.Lskip_sctlr2:
 	isb

 	// Hack the exception return to stay at EL2
diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
index c3e196fb8b18..4ed4b7fa57c2 100644
--- a/arch/arm64/kvm/hyp/nvhe/psci-relay.c
+++ b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
@@ -4,6 +4,7 @@
  * Author: David Brazdil <dbrazdil@google.com>
  */

+#include <asm/alternative.h>
 #include <asm/kvm_asm.h>
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
@@ -219,6 +220,8 @@ asmlinkage void __noreturn __kvm_host_psci_cpu_entry(bool is_cpu_on)
 		release_boot_args(boot_args);

 	write_sysreg_el1(INIT_SCTLR_EL1_MMU_OFF, SYS_SCTLR);
+	if (alternative_has_cap_unlikely(ARM64_HAS_SCTLR2))
+		write_sysreg_el1(INIT_SCTLR2_EL1, SYS_SCTLR2);
 	write_sysreg(INIT_PSTATE_EL1, SPSR_EL2);

 	__host_enter(host_ctxt);
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


