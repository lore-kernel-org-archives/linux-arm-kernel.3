Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADA5CA5FA6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=grKI1a4Kf3+tUXyzE9ofiL5hxQWNslicE10RHv21MaA=; b=X9hgi0TrwQhpCf
	oPZFrSw8pzXZU1dF23sgWdYlvbyIW4TcipoV0jH+3BlmveEIdH+J8+8ebqnybxrlvgkMeP2ges6uC
	j6wYlwAX4QqUUMpPjfKHsqisOn97QDkNU8NvVTO0XZ40TFiI+VBpdPQcXcw9FpDahFkVwZEhBbzj6
	Y1deOwRCEXlXieJ00oVQwXxG1o2dw3vx2J+HfXcEZU6OyQABDFY6U4WMjWbV7uojR2zwuq2RmKlky
	UbsOYEyDCZHLSJ04DOupq/0oj071Ga2sWErE/LNpL7Y2QG+cQAzGxquxn74YWU2eG+LAC7c3ub6fE
	APVbyfiP3fSpd7qMNQGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBRc-00000000eUE-0T37;
	Mon, 28 Sep 2026 13:31:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBRV-00000000eRG-1nal
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 13:30:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13AB41655;
	Mon, 28 Sep 2026 06:30:49 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.11.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5448F3F763;
	Mon, 28 Sep 2026 06:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790602252; bh=Q9WewKZVtsEXuIxIx2/BmD4sMhT/IgCp4Q1z2df9mpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NKmcZZTjiZ2H/hg9MLMmq3ZhYUM9DDUr5+dufPpHdmlrO9mRohmhL5BRWJfec8hcQ
	 6XOE+t2BRCn3E4r/JxgimTqj8MvpWsFr/beVxUBSVgWxDab7oLLsLDQInbmQrrJEna
	 WCgKjXMsQyrN93srcVfUQwgBpSyp2s27EfqH08R8=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/6] arm64: insn: make `aarch64_insn_gen_d{m,s}b()` alternative-safe
Date: Mon, 28 Sep 2026 14:30:30 +0100
Message-ID: <20260928133034.243541-3-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928133034.243541-1-ada.coupriediaz@arm.com>
References: <20260928133034.243541-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_063053_554939_5208DD29 
X-CRM114-Status: GOOD (  11.79  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Barry Song <baohua@kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Shanker Donthineni <sdonthineni@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, Oliver Upton <oupton@kernel.org>, James Morse <james.morse@arm.com>, Andre Przywara <andre.przywara@arm.com>, Tejun Heo <tj@kernel.org>, Lucas Wei <lucaswei@google.com>, Will Deacon <will@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Move `aarch64_insn_gen_d{m,s}b()` and `__get_barrier_crm_val()`
to `insn.h` and mark them `__always_inline`.
Replace the error print by a build-time check now that the compiler can
verify all call sites.

This is possible thanks to all enum types being covered in the previous
commit, and the only current caller being BPF with static arguments.

As all functions are now inlined and do not call any instrumentable
function, they are now safe to call in alternative callbacks.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/insn.h | 56 +++++++++++++++++++++++++++++++++--
 arch/arm64/lib/insn.c         | 52 --------------------------------
 2 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index 8ec9d86cc575c..40f13d28a5fd7 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -7,6 +7,7 @@
  */
 #ifndef	__ASM_INSN_H
 #define	__ASM_INSN_H
+#include <linux/bits.h>
 #include <linux/build_bug.h>
 #include <linux/types.h>
 
@@ -699,8 +700,59 @@ u32 aarch64_insn_gen_cas(enum aarch64_insn_register result,
 			 enum aarch64_insn_register value,
 			 enum aarch64_insn_size_type size,
 			 enum aarch64_insn_mem_order_type order);
-u32 aarch64_insn_gen_dmb(enum aarch64_insn_mb_type type);
-u32 aarch64_insn_gen_dsb(enum aarch64_insn_mb_type type);
+
+static __always_inline u32 __get_barrier_crm_val(enum aarch64_insn_mb_type type)
+{
+	switch (type) {
+	case AARCH64_INSN_MB_SY:
+		return 0xf;
+	case AARCH64_INSN_MB_ST:
+		return 0xe;
+	case AARCH64_INSN_MB_LD:
+		return 0xd;
+	case AARCH64_INSN_MB_ISH:
+		return 0xb;
+	case AARCH64_INSN_MB_NSH:
+		return 0x7;
+	case AARCH64_INSN_MB_OSH:
+		return 0x3;
+	default:
+		BUILD_BUG_ON_MSG(1, "unknown barrier type");
+		return AARCH64_BREAK_FAULT;
+	}
+}
+
+static __always_inline u32 aarch64_insn_gen_dmb(enum aarch64_insn_mb_type type)
+{
+	u32 opt;
+	u32 insn;
+
+	opt = __get_barrier_crm_val(type);
+	if (opt == AARCH64_BREAK_FAULT)
+		return AARCH64_BREAK_FAULT;
+
+	insn = aarch64_insn_get_dmb_value();
+	insn &= ~GENMASK(11, 8);
+	insn |= (opt << 8);
+
+	return insn;
+}
+
+static __always_inline u32 aarch64_insn_gen_dsb(enum aarch64_insn_mb_type type)
+{
+	u32 opt, insn;
+
+	opt = __get_barrier_crm_val(type);
+	if (opt == AARCH64_BREAK_FAULT)
+		return AARCH64_BREAK_FAULT;
+
+	insn = aarch64_insn_get_dsb_base_value();
+	insn &= ~GENMASK(11, 8);
+	insn |= (opt << 8);
+
+	return insn;
+}
+
 u32 aarch64_insn_gen_mrs(enum aarch64_insn_register result,
 			 enum aarch64_insn_system_register sysreg);
 
diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
index c70820d65805f..5c37f3a4c402b 100644
--- a/arch/arm64/lib/insn.c
+++ b/arch/arm64/lib/insn.c
@@ -1561,58 +1561,6 @@ u32 aarch64_insn_gen_extr(enum aarch64_insn_variant variant,
 	return aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RM, insn, Rm);
 }
 
-static u32 __get_barrier_crm_val(enum aarch64_insn_mb_type type)
-{
-	switch (type) {
-	case AARCH64_INSN_MB_SY:
-		return 0xf;
-	case AARCH64_INSN_MB_ST:
-		return 0xe;
-	case AARCH64_INSN_MB_LD:
-		return 0xd;
-	case AARCH64_INSN_MB_ISH:
-		return 0xb;
-	case AARCH64_INSN_MB_NSH:
-		return 0x7;
-	case AARCH64_INSN_MB_OSH:
-		return 0x3;
-	default:
-		pr_err("%s: unknown barrier type %d\n", __func__, type);
-		return AARCH64_BREAK_FAULT;
-	}
-}
-
-u32 aarch64_insn_gen_dmb(enum aarch64_insn_mb_type type)
-{
-	u32 opt;
-	u32 insn;
-
-	opt = __get_barrier_crm_val(type);
-	if (opt == AARCH64_BREAK_FAULT)
-		return AARCH64_BREAK_FAULT;
-
-	insn = aarch64_insn_get_dmb_value();
-	insn &= ~GENMASK(11, 8);
-	insn |= (opt << 8);
-
-	return insn;
-}
-
-u32 aarch64_insn_gen_dsb(enum aarch64_insn_mb_type type)
-{
-	u32 opt, insn;
-
-	opt = __get_barrier_crm_val(type);
-	if (opt == AARCH64_BREAK_FAULT)
-		return AARCH64_BREAK_FAULT;
-
-	insn = aarch64_insn_get_dsb_base_value();
-	insn &= ~GENMASK(11, 8);
-	insn |= (opt << 8);
-
-	return insn;
-}
-
 u32 aarch64_insn_gen_mrs(enum aarch64_insn_register result,
 			 enum aarch64_insn_system_register sysreg)
 {
-- 
2.43.0


