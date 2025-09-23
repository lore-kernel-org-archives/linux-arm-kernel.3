Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC37ACAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 17:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bCyeH+Se1Xlslcg+YrHByFgUbYZ2PyipV94Q/KGVar0=; b=rpytFl1H0xVZYt
	D+E7QPdU8tCo0FNaxHLTZqIXUeLl9mHjeNPB/LtFpNwEv7w+wPzuvb7Cr7GVHzzzUZPw5e+17Hny4
	HSHQjGPrUxhj+ifBD1JXCVDo/6x88NMAM7+L4HLd1nwRCnvcZCgZF5UPHEkorcb0omfsxMd2V4PTj
	McuCf7Qg2hTfwVHRnzaqyDchv9tYpoR6r2SRE6dosr1nSpF9SuKeTI9d3zsnqhxPiBDg1mPJX89nu
	n6qYHhKNtciZQf3BKBKHfnouwJ44q7tPyNFJfq0w+8/sVkDA72tzcU0alJPos+layisFA4uaSpZEY
	Ye74GXXe+MMed2sa3zGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v179b-0000000ES9G-3YEm;
	Tue, 23 Sep 2025 17:50:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v179A-0000000ERjX-1BLU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 17:49:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86C7D497;
	Tue, 23 Sep 2025 10:49:39 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.30.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4E63D3F5A1;
	Tue, 23 Sep 2025 10:49:44 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 08/16] arm64/insn: always inline aarch64_insn_gen_logical_immediate()
Date: Tue, 23 Sep 2025 18:48:55 +0100
Message-ID: <20250923174903.76283-9-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923174903.76283-1-ada.coupriediaz@arm.com>
References: <20250923174903.76283-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_104948_424513_C36760DC 
X-CRM114-Status: GOOD (  20.08  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kasan-dev@googlegroups.com, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

As it is always called with an explicit logic instruction type, we can
check for its validity at compile time and remove the runtime error print.

Pull its helper functions, `aarch64_encode_immediate()` and
`range_of_ones()`, into the header and make them `__always_inline`
as well.
This is safe as they only call other `__always_inline` functions.

This makes `aarch64_insn_gen_logical_immediate()` safe for inlining
and usage from patching callbacks.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/insn.h | 149 ++++++++++++++++++++++++++++++++--
 arch/arm64/lib/insn.c         | 136 -------------------------------
 2 files changed, 144 insertions(+), 141 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index 5a25e311717f..a94ecc9140f1 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -16,6 +16,8 @@
 
 #ifndef __ASSEMBLY__
 
+#include <linux/bitops.h>
+
 enum aarch64_insn_hint_cr_op {
 	AARCH64_INSN_HINT_NOP	= 0x0 << 5,
 	AARCH64_INSN_HINT_YIELD	= 0x1 << 5,
@@ -880,11 +882,148 @@ u32 aarch64_insn_gen_logical_shifted_reg(enum aarch64_insn_register dst,
 u32 aarch64_insn_gen_move_reg(enum aarch64_insn_register dst,
 			      enum aarch64_insn_register src,
 			      enum aarch64_insn_variant variant);
-u32 aarch64_insn_gen_logical_immediate(enum aarch64_insn_logic_type type,
-				       enum aarch64_insn_variant variant,
-				       enum aarch64_insn_register Rn,
-				       enum aarch64_insn_register Rd,
-				       u64 imm);
+
+static __always_inline bool range_of_ones(u64 val)
+{
+	/* Doesn't handle full ones or full zeroes */
+	u64 sval = val >> __ffs64(val);
+
+	/* One of Sean Eron Anderson's bithack tricks */
+	return ((sval + 1) & (sval)) == 0;
+}
+
+static __always_inline u32 aarch64_encode_immediate(u64 imm,
+				 enum aarch64_insn_variant variant,
+				 u32 insn)
+{
+	unsigned int immr, imms, n, ones, ror, esz, tmp;
+	u64 mask;
+
+	switch (variant) {
+	case AARCH64_INSN_VARIANT_32BIT:
+		esz = 32;
+		break;
+	case AARCH64_INSN_VARIANT_64BIT:
+		insn |= AARCH64_INSN_SF_BIT;
+		esz = 64;
+		break;
+	default:
+		return AARCH64_BREAK_FAULT;
+	}
+
+	mask = GENMASK(esz - 1, 0);
+
+	/* Can't encode full zeroes, full ones, or value wider than the mask */
+	if (!imm || imm == mask || imm & ~mask)
+		return AARCH64_BREAK_FAULT;
+
+	/*
+	 * Inverse of Replicate(). Try to spot a repeating pattern
+	 * with a pow2 stride.
+	 */
+	for (tmp = esz / 2; tmp >= 2; tmp /= 2) {
+		u64 emask = BIT(tmp) - 1;
+
+		if ((imm & emask) != ((imm >> tmp) & emask))
+			break;
+
+		esz = tmp;
+		mask = emask;
+	}
+
+	/* N is only set if we're encoding a 64bit value */
+	n = esz == 64;
+
+	/* Trim imm to the element size */
+	imm &= mask;
+
+	/* That's how many ones we need to encode */
+	ones = hweight64(imm);
+
+	/*
+	 * imms is set to (ones - 1), prefixed with a string of ones
+	 * and a zero if they fit. Cap it to 6 bits.
+	 */
+	imms  = ones - 1;
+	imms |= 0xf << ffs(esz);
+	imms &= BIT(6) - 1;
+
+	/* Compute the rotation */
+	if (range_of_ones(imm)) {
+		/*
+		 * Pattern: 0..01..10..0
+		 *
+		 * Compute how many rotate we need to align it right
+		 */
+		ror = __ffs64(imm);
+	} else {
+		/*
+		 * Pattern: 0..01..10..01..1
+		 *
+		 * Fill the unused top bits with ones, and check if
+		 * the result is a valid immediate (all ones with a
+		 * contiguous ranges of zeroes).
+		 */
+		imm |= ~mask;
+		if (!range_of_ones(~imm))
+			return AARCH64_BREAK_FAULT;
+
+		/*
+		 * Compute the rotation to get a continuous set of
+		 * ones, with the first bit set at position 0
+		 */
+		ror = fls64(~imm);
+	}
+
+	/*
+	 * immr is the number of bits we need to rotate back to the
+	 * original set of ones. Note that this is relative to the
+	 * element size...
+	 */
+	immr = (esz - ror) % esz;
+
+	insn = aarch64_insn_encode_immediate(AARCH64_INSN_IMM_N, insn, n);
+	insn = aarch64_insn_encode_immediate(AARCH64_INSN_IMM_R, insn, immr);
+	return aarch64_insn_encode_immediate(AARCH64_INSN_IMM_S, insn, imms);
+}
+
+static __always_inline u32 aarch64_insn_gen_logical_immediate(
+					 enum aarch64_insn_logic_type type,
+					 enum aarch64_insn_variant variant,
+					 enum aarch64_insn_register Rn,
+					 enum aarch64_insn_register Rd,
+					 u64 imm)
+{
+	compiletime_assert(type == AARCH64_INSN_LOGIC_AND ||
+		type == AARCH64_INSN_LOGIC_ORR ||
+		type == AARCH64_INSN_LOGIC_EOR ||
+		type == AARCH64_INSN_LOGIC_AND_SETFLAGS,
+		"unknown logical encoding");
+	u32 insn;
+
+	switch (type) {
+	case AARCH64_INSN_LOGIC_AND:
+		insn = aarch64_insn_get_and_imm_value();
+		break;
+	case AARCH64_INSN_LOGIC_ORR:
+		insn = aarch64_insn_get_orr_imm_value();
+		break;
+	case AARCH64_INSN_LOGIC_EOR:
+		insn = aarch64_insn_get_eor_imm_value();
+		break;
+	case AARCH64_INSN_LOGIC_AND_SETFLAGS:
+		insn = aarch64_insn_get_ands_imm_value();
+		break;
+	default:
+		return AARCH64_BREAK_FAULT;
+	}
+
+	insn = aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RD, insn, Rd);
+	insn = aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RN, insn, Rn);
+	return aarch64_encode_immediate(imm, variant, insn);
+}
+
+
 u32 aarch64_insn_gen_extr(enum aarch64_insn_variant variant,
 			  enum aarch64_insn_register Rm,
 			  enum aarch64_insn_register Rn,
diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
index 7530d51f9b2a..15634094de05 100644
--- a/arch/arm64/lib/insn.c
+++ b/arch/arm64/lib/insn.c
@@ -1106,142 +1106,6 @@ u32 aarch32_insn_mcr_extract_crm(u32 insn)
 	return insn & CRM_MASK;
 }
 
-static bool range_of_ones(u64 val)
-{
-	/* Doesn't handle full ones or full zeroes */
-	u64 sval = val >> __ffs64(val);
-
-	/* One of Sean Eron Anderson's bithack tricks */
-	return ((sval + 1) & (sval)) == 0;
-}
-
-static u32 aarch64_encode_immediate(u64 imm,
-				    enum aarch64_insn_variant variant,
-				    u32 insn)
-{
-	unsigned int immr, imms, n, ones, ror, esz, tmp;
-	u64 mask;
-
-	switch (variant) {
-	case AARCH64_INSN_VARIANT_32BIT:
-		esz = 32;
-		break;
-	case AARCH64_INSN_VARIANT_64BIT:
-		insn |= AARCH64_INSN_SF_BIT;
-		esz = 64;
-		break;
-	default:
-		pr_err("%s: unknown variant encoding %d\n", __func__, variant);
-		return AARCH64_BREAK_FAULT;
-	}
-
-	mask = GENMASK(esz - 1, 0);
-
-	/* Can't encode full zeroes, full ones, or value wider than the mask */
-	if (!imm || imm == mask || imm & ~mask)
-		return AARCH64_BREAK_FAULT;
-
-	/*
-	 * Inverse of Replicate(). Try to spot a repeating pattern
-	 * with a pow2 stride.
-	 */
-	for (tmp = esz / 2; tmp >= 2; tmp /= 2) {
-		u64 emask = BIT(tmp) - 1;
-
-		if ((imm & emask) != ((imm >> tmp) & emask))
-			break;
-
-		esz = tmp;
-		mask = emask;
-	}
-
-	/* N is only set if we're encoding a 64bit value */
-	n = esz == 64;
-
-	/* Trim imm to the element size */
-	imm &= mask;
-
-	/* That's how many ones we need to encode */
-	ones = hweight64(imm);
-
-	/*
-	 * imms is set to (ones - 1), prefixed with a string of ones
-	 * and a zero if they fit. Cap it to 6 bits.
-	 */
-	imms  = ones - 1;
-	imms |= 0xf << ffs(esz);
-	imms &= BIT(6) - 1;
-
-	/* Compute the rotation */
-	if (range_of_ones(imm)) {
-		/*
-		 * Pattern: 0..01..10..0
-		 *
-		 * Compute how many rotate we need to align it right
-		 */
-		ror = __ffs64(imm);
-	} else {
-		/*
-		 * Pattern: 0..01..10..01..1
-		 *
-		 * Fill the unused top bits with ones, and check if
-		 * the result is a valid immediate (all ones with a
-		 * contiguous ranges of zeroes).
-		 */
-		imm |= ~mask;
-		if (!range_of_ones(~imm))
-			return AARCH64_BREAK_FAULT;
-
-		/*
-		 * Compute the rotation to get a continuous set of
-		 * ones, with the first bit set at position 0
-		 */
-		ror = fls64(~imm);
-	}
-
-	/*
-	 * immr is the number of bits we need to rotate back to the
-	 * original set of ones. Note that this is relative to the
-	 * element size...
-	 */
-	immr = (esz - ror) % esz;
-
-	insn = aarch64_insn_encode_immediate(AARCH64_INSN_IMM_N, insn, n);
-	insn = aarch64_insn_encode_immediate(AARCH64_INSN_IMM_R, insn, immr);
-	return aarch64_insn_encode_immediate(AARCH64_INSN_IMM_S, insn, imms);
-}
-
-u32 aarch64_insn_gen_logical_immediate(enum aarch64_insn_logic_type type,
-				       enum aarch64_insn_variant variant,
-				       enum aarch64_insn_register Rn,
-				       enum aarch64_insn_register Rd,
-				       u64 imm)
-{
-	u32 insn;
-
-	switch (type) {
-	case AARCH64_INSN_LOGIC_AND:
-		insn = aarch64_insn_get_and_imm_value();
-		break;
-	case AARCH64_INSN_LOGIC_ORR:
-		insn = aarch64_insn_get_orr_imm_value();
-		break;
-	case AARCH64_INSN_LOGIC_EOR:
-		insn = aarch64_insn_get_eor_imm_value();
-		break;
-	case AARCH64_INSN_LOGIC_AND_SETFLAGS:
-		insn = aarch64_insn_get_ands_imm_value();
-		break;
-	default:
-		pr_err("%s: unknown logical encoding %d\n", __func__, type);
-		return AARCH64_BREAK_FAULT;
-	}
-
-	insn = aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RD, insn, Rd);
-	insn = aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RN, insn, Rn);
-	return aarch64_encode_immediate(imm, variant, insn);
-}
-
 u32 aarch64_insn_gen_extr(enum aarch64_insn_variant variant,
 			  enum aarch64_insn_register Rm,
 			  enum aarch64_insn_register Rn,
-- 
2.43.0


