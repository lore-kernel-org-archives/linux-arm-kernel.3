Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5E0CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 19:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juDqRYSCPB6BbkPqNWJFc/cfY2oh+anEqxrA8EEHq1k=; b=qqRayCy6zG9JrxdrTpfpd9zSJn
	JBKa2xkosiAFTglpcsAy2IYN6VSnjyptAnCBeCl1dAU+cDYvlqKnTPs5TqYTLtQPCdPb+zOvYK9O2
	mBltYyikK0CQ8j5R0nNEMvcnhX3EV336Vno0ltM+xkjPNQ+eXExh5GhlUdsuTCC59hSEbrLgLyH6d
	XvRSBtrlEAKZIphsQgQU1TQDSyMwuxoSkqIL+390i+b7/SWAuCA8MV6Xothp1VQ10Y+miTVHNNczz
	fbEnCc7zq9c9HIGWL9EgKHPoPcSpDV/t2ZEdFVnS88qedt/tBoCrD6cCgrNezHYJqHvOYSP/plirA
	wVQFJzCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXo1-00000008rGe-2a3V;
	Mon, 11 Aug 2025 19:03:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulVT8-00000008QBa-0zaX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 16:33:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB0A826A4;
	Mon, 11 Aug 2025 09:33:45 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2B42B3F738;
	Mon, 11 Aug 2025 09:33:50 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	anshuman.khandual@arm.com,
	robh@kernel.org,
	james.morse@arm.com,
	mark.rutland@arm.com,
	joey.gouly@arm.com,
	ry111@xry111.site,
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
Subject: [PATCH v2 2/6] arm64: initialise SCTLR2_ELx register at boot time
Date: Mon, 11 Aug 2025 17:33:36 +0100
Message-Id: <20250811163340.1561893-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811163340.1561893-1-yeoreum.yun@arm.com>
References: <20250811163340.1561893-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_093354_405500_DF453B91 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

add initialisation for SCTRL2_ELx register at boot time.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/include/asm/el2_setup.h |  6 ++++++
 arch/arm64/include/asm/sysreg.h    | 22 ++++++++++++++++++++++
 arch/arm64/kernel/head.S           |  5 ++++-
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index d755b4d46d77..347ac4cc1283 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -48,6 +48,11 @@
 	isb
 .endm
 
+.macro __init_el2_sctlr2
+	init_sctlr2_elx	2, x0
+	isb
+.endm
+
 .macro __init_el2_hcrx
 	mrs	x0, id_aa64mmfr1_el1
 	ubfx	x0, x0, #ID_AA64MMFR1_EL1_HCX_SHIFT, #4
@@ -411,6 +416,7 @@
  */
 .macro init_el2_state
 	__init_el2_sctlr
+	__init_el2_sctlr2
 	__init_el2_hcrx
 	__init_el2_timers
 	__init_el2_debug
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index d5b5f2ae1afa..8b82af5be199 100644
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
@@ -1164,6 +1168,24 @@
 	msr	hcr_el2, \reg
 #endif
 	.endm
+
+	.macro init_sctlr2_elx, el, tmp
+	mrs_s	\tmp, SYS_ID_AA64MMFR3_EL1
+	ubfx	\tmp, \tmp, #ID_AA64MMFR3_EL1_SCTLRX_SHIFT, #4
+	cbz	\tmp, .Lskip_sctlr2_\@
+	.if	\el == 2
+	mov_q	\tmp, INIT_SCTLR2_EL2
+	msr_s	SYS_SCTLR_EL2, \tmp
+	.else
+	mov_q	\tmp, INIT_SCTLR2_EL1
+	.if	\el == 12
+	msr_s	SYS_SCTLR_EL12, \tmp
+	.else
+	msr_s	SYS_SCTLR_EL1, \tmp
+	.endif
+	.endif
+.Lskip_sctlr2_\@:
+	.endm
 #else
 
 #include <linux/bitfield.h>
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index ca04b338cb0d..0dff7593e50b 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -276,6 +276,7 @@ SYM_INNER_LABEL(init_el1, SYM_L_LOCAL)
 	mov_q	x0, INIT_SCTLR_EL1_MMU_OFF
 	pre_disable_mmu_workaround
 	msr	sctlr_el1, x0
+	init_sctlr2_elx	1, x0
 	isb
 	mov_q	x0, INIT_PSTATE_EL1
 	msr	spsr_el1, x0
@@ -298,7 +299,6 @@ SYM_INNER_LABEL(init_el2, SYM_L_LOCAL)
 	msr	sctlr_el2, x0
 	isb
 0:
-
 	init_el2_hcr	HCR_HOST_NVHE_FLAGS
 	init_el2_state
 
@@ -315,12 +315,15 @@ SYM_INNER_LABEL(init_el2, SYM_L_LOCAL)
 
 	/* Set a sane SCTLR_EL1, the VHE way */
 	msr_s	SYS_SCTLR_EL12, x1
+	init_sctlr2_elx	12, x2
 	mov	x2, #BOOT_CPU_FLAG_E2H
 	b	3f
 
 2:
 	msr	sctlr_el1, x1
+	init_sctlr2_elx	1, x2
 	mov	x2, xzr
+
 3:
 	mov	x0, #INIT_PSTATE_EL1
 	msr	spsr_el2, x0
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


