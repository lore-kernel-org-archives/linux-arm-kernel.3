Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68786CCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D25g3GIUkpuROFERGU8MNzTENBMe0qu7egtNoZefnNo=; b=As5wsoCtdDGQJz
	AJqAqXSDDcOIXhCYWCMi+Wa8w14JwHauR3ED6irOM87AZEnv+4fOh0oqHPdFmaFSzfPX1vpKP7h9U
	F0CbpU8X6xe8LydcP/ReE4AC0BNeHbQRPtG/VWsMItzYUHX9G5oFY37BOyxdcylzPUnNQPreCK+OI
	HqiJPsPjaU/9pSII62C7tI4n+Dj01fkHhn0V27dWe3b6T/x43h9YBeQUPT1frnec9LVHNCq3xqYZk
	TILDFEeXUlG+MUcvkAbdDSCd4+z4sheSRx2+tmNCBVqgVxXWac/C9xMhFN5+N0+TNgWb1miRBW2pM
	BWM4R/Z7EXuL/pcl5N/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl5T-00000003SDM-3p8i;
	Fri, 16 Oct 2026 16:47:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl5M-00000003S8q-3XxZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:47:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F0A31477;
	Fri, 16 Oct 2026 09:47:08 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.15.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B703B3F7B4;
	Fri, 16 Oct 2026 09:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169231; bh=TJu4kEwSrFeigql9MenhU56I9pGeuK+7ynjouw3z9Ew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C/HrVQ7D+zQfVk0MuzTy3o2ypxTOS2IsYjAsGOj1jlcOEPkE+9C+T3wQiH/v//oYA
	 VxMzYCfORrBLdW7JonYGnk7MhFsUbvnwZnbAyAx6i/kODmLfdPGqdtfdnhFZTJ4nEV
	 HD2qHWNbXB6s4o5lSYgJC4uTgOGNEzwmwLnH9z8g=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] arm64: insn: clean-up sysregs handling
Date: Fri, 16 Oct 2026 17:46:48 +0100
Message-ID: <20261016164648.251258-5-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016164648.251258-1-ada.coupriediaz@arm.com>
References: <20261016164648.251258-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_094712_982636_89EDAED6 
X-CRM114-Status: GOOD (  14.13  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Barry Song <baohua@kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Lucas Wei <lucaswei@google.com>, Mark Brown <broonie@kernel.org>, Andre Przywara <andre.przywara@arm.com>, Tejun Heo <tj@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

System register encodings are already defined in <asm/sysreg.h>, so
use those definitions in <asm/insn.h> instead of duplicating them.
This will avoid future errors and deviations.

Remove the unnecessary shifts for encoding/decoding now that the enum
values directly match the encoded registers.

No code using the insn register encodings currently makes a distinction
between "regular" system registers and special-purpose registers,
so let's just drop the difference and merge the two enums.
Remove all unused registers while we are here.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/insn.h          | 36 ++++++++------------------
 arch/arm64/kernel/probes/decode-insn.c |  2 +-
 arch/arm64/lib/insn.c                  |  4 +--
 3 files changed, 14 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index e020f9d8b83c2..6533191638804 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 
 #include <asm/insn-def.h>
+#include <asm/sysreg.h>
 
 #ifndef __ASSEMBLER__
 
@@ -113,38 +114,23 @@ enum aarch64_insn_register {
 	AARCH64_INSN_REG_SP = 31  /* Stack pointer: as load/store base reg */
 };
 
+/* System register encoding for MRS/MSR (register) instructions. */
 #define AARCH64_INSN_SYSREG_OFFSET	5
 #define AARCH64_INSN_SYSREG_MASK	GENMASK(20, AARCH64_INSN_SYSREG_OFFSET)
+#define AARCH64_INSN_SYSREG_FROM_DEF(sysreg) \
+	AARCH64_INSN_SYSREG_##sysreg = SYS_##sysreg
 
-enum aarch64_insn_special_register {
-	AARCH64_INSN_SPCLREG_SPSR_EL1	= 0xC200,
-	AARCH64_INSN_SPCLREG_ELR_EL1	= 0xC201,
-	AARCH64_INSN_SPCLREG_SP_EL0	= 0xC208,
-	AARCH64_INSN_SPCLREG_SPSEL	= 0xC210,
-	AARCH64_INSN_SPCLREG_CURRENTEL	= 0xC212,
-	AARCH64_INSN_SPCLREG_NZCV	= 0xDA10,
-	AARCH64_INSN_SPCLREG_DAIF	= 0xDA11,
-	AARCH64_INSN_SPCLREG_FPCR	= 0xDA20,
-	AARCH64_INSN_SPCLREG_DSPSR_EL0	= 0xDA28,
-	AARCH64_INSN_SPCLREG_DLR_EL0	= 0xDA29,
-	AARCH64_INSN_SPCLREG_SPSR_EL2	= 0xE200,
-	AARCH64_INSN_SPCLREG_ELR_EL2	= 0xE201,
-	AARCH64_INSN_SPCLREG_SP_EL1	= 0xE208,
-	AARCH64_INSN_SPCLREG_SPSR_IRQ	= 0xE218,
-	AARCH64_INSN_SPCLREG_SPSR_ABT	= 0xE219,
-	AARCH64_INSN_SPCLREG_SPSR_UND	= 0xE21A,
-	AARCH64_INSN_SPCLREG_SPSR_FIQ	= 0xE21B,
-	AARCH64_INSN_SPCLREG_SPSR_EL3	= 0xF200,
-	AARCH64_INSN_SPCLREG_ELR_EL3	= 0xF201,
-	AARCH64_INSN_SPCLREG_SP_EL2	= 0xF208,
-};
 
+/* Do not duplicate encodings: we already define them in <asm/sysreg.h> */
 enum aarch64_insn_system_register {
-	AARCH64_INSN_SYSREG_SP_EL0	= 0xC208,
-	AARCH64_INSN_SYSREG_TPIDR_EL1	= 0xC684,
-	AARCH64_INSN_SYSREG_TPIDR_EL2	= 0xE682,
+	AARCH64_INSN_SYSREG_FROM_DEF(SP_EL0),
+	AARCH64_INSN_SYSREG_FROM_DEF(TPIDR_EL1),
+	AARCH64_INSN_SYSREG_FROM_DEF(DAIF),
+	AARCH64_INSN_SYSREG_FROM_DEF(TPIDR_EL2),
 };
 
+#undef AARCH64_INSN_SYSREG_FROM_DEF
+
 enum aarch64_insn_variant {
 	AARCH64_INSN_VARIANT_32BIT,
 	AARCH64_INSN_VARIANT_64BIT
diff --git a/arch/arm64/kernel/probes/decode-insn.c b/arch/arm64/kernel/probes/decode-insn.c
index 4137cc5ef031f..bb0af08105885 100644
--- a/arch/arm64/kernel/probes/decode-insn.c
+++ b/arch/arm64/kernel/probes/decode-insn.c
@@ -40,7 +40,7 @@ static bool __kprobes aarch64_insn_is_steppable(u32 insn)
 		 */
 		if (aarch64_insn_is_mrs(insn))
 			return aarch64_insn_extract_system_reg(insn)
-			     != AARCH64_INSN_SPCLREG_DAIF;
+			     != AARCH64_INSN_SYSREG_DAIF;
 
 		/*
 		 * The HINT instruction is steppable only if it is in whitelist
diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
index 2edc5a9c0a9c8..1611c86885c9f 100644
--- a/arch/arm64/lib/insn.c
+++ b/arch/arm64/lib/insn.c
@@ -1364,7 +1364,7 @@ u32 aarch64_insn_adrp_set_offset(u32 insn, s32 offset)
  */
 noinstr u32 aarch64_insn_extract_system_reg(u32 insn)
 {
-	return (insn & AARCH64_INSN_SYSREG_MASK) >> AARCH64_INSN_SYSREG_OFFSET;
+	return insn & AARCH64_INSN_SYSREG_MASK;
 }
 
 bool aarch32_insn_is_wide(u32 insn)
@@ -1567,7 +1567,7 @@ u32 aarch64_insn_gen_mrs(enum aarch64_insn_register result,
 	u32 insn = aarch64_insn_get_mrs_value();
 
 	insn &= ~AARCH64_INSN_SYSREG_MASK;
-	insn |= sysreg << AARCH64_INSN_SYSREG_OFFSET;
+	insn |= sysreg;
 	return aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RT,
 					    insn, result);
 }
-- 
2.43.0


