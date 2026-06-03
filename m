Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D378CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8jn/yoWaWQ4KoHuM/rGHQpYuKkIdi8hEzM2c1EXiMM=; b=h5XrGZV/ACtC9/4kk5mU99nibk
	wzxR+NonePJAqrmaMsSQLIp8L1e4LpxjaEMzPVvOqqORNZGN5ywVj+fi9DRJxSa9WdPISYJYNsa/o
	6TasOOl3KG79aOgi+UFlkQMOnyK4Ngy8HTiGEWs1vOgHcNGkznZQHf48zMq/UEQfUtjsHk43d8L/w
	WWQv4hsmJbbIV1IWfqC4co3VfTdkAgHrnP41B0uLYnJHmin5MDce3LxZnbaKC1k7oY0SKRthYUPtC
	f3ZNWE3Z3NMdjKbN8J4Xt/UsBa0ztIvQL73zIFBVMNIOdB8AqiC2P6BCFXfvbFjFSXfJrnrq4qJHx
	OuRudWjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjRF-0000000EtFH-03gu;
	Wed, 03 Jun 2026 11:07:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjRC-0000000EtBF-3TsA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:07:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56B6932E4;
	Wed,  3 Jun 2026 04:07:00 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7FCDA3F86F;
	Wed,  3 Jun 2026 04:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780484825; bh=2Tl/g/kFQwJkWh+M+kfAdA+4EPK4GXtiDQJ9FXS5U6E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cS+utUCofRsedl/Aj/Cv+dul0LCWArjHQDnP1qQhR5wFG1bLz6R+8Fau8xKksELE5
	 IxLViWqvfv2+AZPrdB+OXBkKRbqcQCZwhwEqdvc1MAK14igHU4gOJbcBNIkodo2T5L
	 q30r6QW10CrO95j+V8quYUW9srqL5GZZsHAYi8iA=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	stable@vger.kernel.org,
	tabba@google.com,
	vladimir.murzin@arm.com,
	will@kernel.org
Subject: [PATCH v4 11/20] arm64: fpsimd: Move sve_get_vl() and sme_get_vl() inline
Date: Wed,  3 Jun 2026 12:06:21 +0100
Message-Id: <20260603110630.1027435-12-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260603110630.1027435-1-mark.rutland@arm.com>
References: <20260603110630.1027435-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_040706_962893_70C7616C 
X-CRM114-Status: GOOD (  13.09  )
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

The sve_get_vl() and sme_get_vl() functions are wrappers for the RDVL
and RDSVL instructions respectively. There's no need for those to be
out-of-line.

Replace the out-of-line assembly functions with equivalent inline
functions.

The _sve_rdvl assembly macro is unused, and so it is removed. The
_sme_rdsvl assembly macro is still used elsewhere, and so is kept for
now.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h       | 31 +++++++++++++++++++++++++--
 arch/arm64/include/asm/fpsimdmacros.h |  6 ------
 arch/arm64/kernel/entry-fpsimd.S      | 10 ---------
 3 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index 8efa3c0402a7a..36cf528e64971 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -22,6 +22,9 @@
 #include <linux/stddef.h>
 #include <linux/types.h>
 
+#define __SVE_PREAMBLE		".arch_extension sve\n"
+#define __SME_PREAMBLE		".arch_extension sme\n"
+
 /* Masks for extracting the FPSR and FPCR from the FPSCR */
 #define VFP_FPSCR_STAT_MASK	0xf800009f
 #define VFP_FPSCR_CTRL_MASK	0x07f79f00
@@ -141,11 +144,23 @@ static inline void *thread_zt_state(struct thread_struct *thread)
 	return thread->sme_state + ZA_SIG_REGS_SIZE(sme_vq);
 }
 
+static inline unsigned int sve_get_vl(void)
+{
+	unsigned int vl;
+
+	asm volatile(
+	__SVE_PREAMBLE
+	"	rdvl %x[vl], #1\n"
+	: [vl] "=r" (vl)
+	);
+
+	return vl;
+}
+
 extern void sve_save_state(void *state, u32 *pfpsr, int save_ffr);
 extern void sve_load_state(void const *state, u32 const *pfpsr,
 			   int restore_ffr);
 extern void sve_flush_live(bool flush_ffr, unsigned long vq_minus_1);
-extern unsigned int sve_get_vl(void);
 extern void sme_save_state(void *state, int zt);
 extern void sme_load_state(void const *state, int zt);
 
@@ -400,8 +415,20 @@ static inline int sme_max_virtualisable_vl(void)
 	return vec_max_virtualisable_vl(ARM64_VEC_SME);
 }
 
+static inline unsigned int sme_get_vl(void)
+{
+	unsigned int vl;
+
+	asm volatile(
+	__SME_PREAMBLE
+	"	rdsvl %x[vl], #1\n"
+	: [vl] "=r" (vl)
+	);
+
+	return vl;
+}
+
 extern void sme_alloc(struct task_struct *task, bool flush);
-extern unsigned int sme_get_vl(void);
 extern int sme_set_current_vl(unsigned long arg);
 extern int sme_get_current_vl(void);
 extern void sme_suspend_exit(void);
diff --git a/arch/arm64/include/asm/fpsimdmacros.h b/arch/arm64/include/asm/fpsimdmacros.h
index 4a9bf46e52913..c724fcad7ee02 100644
--- a/arch/arm64/include/asm/fpsimdmacros.h
+++ b/arch/arm64/include/asm/fpsimdmacros.h
@@ -125,12 +125,6 @@
 	ldr p\np, [x\nxbase, #\offset, MUL VL]
 .endm
 
-/* RDVL X\nx, #\imm */
-.macro _sve_rdvl nx, imm
-	.arch_extension sve
-	rdvl x\nx, #\imm
-.endm
-
 /* RDFFR (unpredicated): RDFFR P\np.B */
 .macro _sve_rdffr np
 	.arch_extension sve
diff --git a/arch/arm64/kernel/entry-fpsimd.S b/arch/arm64/kernel/entry-fpsimd.S
index bfa73f26653f2..a124c6d3766cf 100644
--- a/arch/arm64/kernel/entry-fpsimd.S
+++ b/arch/arm64/kernel/entry-fpsimd.S
@@ -57,11 +57,6 @@ SYM_FUNC_START(sve_load_state)
 	ret
 SYM_FUNC_END(sve_load_state)
 
-SYM_FUNC_START(sve_get_vl)
-	_sve_rdvl	0, 1
-	ret
-SYM_FUNC_END(sve_get_vl)
-
 /*
  * Zero all SVE registers but the first 128-bits of each vector
  *
@@ -84,11 +79,6 @@ SYM_FUNC_END(sve_flush_live)
 
 #ifdef CONFIG_ARM64_SME
 
-SYM_FUNC_START(sme_get_vl)
-	_sme_rdsvl	0, 1
-	ret
-SYM_FUNC_END(sme_get_vl)
-
 /*
  * Save the ZA and ZT state
  *
-- 
2.30.2


