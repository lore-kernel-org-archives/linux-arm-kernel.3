Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24C3CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 17:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZqYibTnFM44xJTQqZ0OlXXIW0f/qrXTbbi1hnR5eil0=; b=1lnknjg+OJosJh
	tZh2ZWOjyEnpHQ79H81gt5ROP85g8KVRPYyAH1rx5LxylUypz+q1dan4sG/8UrrS/GxoQ4zXPim8n
	Z3glNVAqFzT0v2gEt7ahpbT1xZDzvuV7YwO142QmEH+3iMi41lBEYhSrrXGi80TJczckKSTxc9lzp
	YY0FNRkNansgxLT1T05PADMf3LfDPk2Y7/PJ/ckZZSusjLkJtGlhkWpkbQgoDNr9K9Jd85HzoYzYd
	aVaXki0LqeoRUuyzljbiXg+wZ1MWYcQH2jCT0NWoQpfuqZiZD7cjyuD3Tq8AQF1IO6XuTKyMiYBYp
	veCFO6G5jI6pgXg965hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v179O-0000000ERvt-0D7N;
	Tue, 23 Sep 2025 17:50:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1792-0000000ERbs-20dy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 17:49:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55F86497;
	Tue, 23 Sep 2025 10:49:31 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.30.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C991B3F5A1;
	Tue, 23 Sep 2025 10:49:35 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 06/16] arm64/insn: always inline aarch64_insn_gen_movewide()
Date: Tue, 23 Sep 2025 18:48:53 +0100
Message-ID: <20250923174903.76283-7-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923174903.76283-1-ada.coupriediaz@arm.com>
References: <20250923174903.76283-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_104940_625142_BF9FC764 
X-CRM114-Status: GOOD (  13.12  )
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

As it is always called with an explicit movewide type, we can
check for its validity at compile time and remove the runtime error print.

The other error prints cannot be verified at compile time, but should not
occur in practice and will still lead to a fault BRK, so remove them.

This makes `aarch64_insn_gen_movewide()` safe for inlining
and usage from patching callbacks, as both
`aarch64_insn_encode_register()` and `aarch64_insn_encode_immediate()`
have been made safe in previous commits.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/insn.h | 58 ++++++++++++++++++++++++++++++++---
 arch/arm64/lib/insn.c         | 56 ---------------------------------
 2 files changed, 54 insertions(+), 60 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index 5f5f6a125b4e..5a25e311717f 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -624,6 +624,8 @@ static __always_inline bool aarch64_get_imm_shift_mask(
 #define ADR_IMM_LOSHIFT		29
 #define ADR_IMM_HISHIFT		5
 
+#define AARCH64_INSN_SF_BIT	BIT(31)
+
 enum aarch64_insn_encoding_class aarch64_get_insn_class(u32 insn);
 u64 aarch64_insn_decode_immediate(enum aarch64_insn_imm_type type, u32 insn);
 
@@ -796,10 +798,58 @@ u32 aarch64_insn_gen_bitfield(enum aarch64_insn_register dst,
 			      int immr, int imms,
 			      enum aarch64_insn_variant variant,
 			      enum aarch64_insn_bitfield_type type);
-u32 aarch64_insn_gen_movewide(enum aarch64_insn_register dst,
-			      int imm, int shift,
-			      enum aarch64_insn_variant variant,
-			      enum aarch64_insn_movewide_type type);
+
+static __always_inline u32 aarch64_insn_gen_movewide(
+				 enum aarch64_insn_register dst,
+				 int imm, int shift,
+				 enum aarch64_insn_variant variant,
+				 enum aarch64_insn_movewide_type type)
+{
+	compiletime_assert(type >=  AARCH64_INSN_MOVEWIDE_ZERO &&
+		type <= AARCH64_INSN_MOVEWIDE_INVERSE, "unknown movewide encoding");
+	u32 insn;
+
+	switch (type) {
+	case AARCH64_INSN_MOVEWIDE_ZERO:
+		insn = aarch64_insn_get_movz_value();
+		break;
+	case AARCH64_INSN_MOVEWIDE_KEEP:
+		insn = aarch64_insn_get_movk_value();
+		break;
+	case AARCH64_INSN_MOVEWIDE_INVERSE:
+		insn = aarch64_insn_get_movn_value();
+		break;
+	default:
+		return AARCH64_BREAK_FAULT;
+	}
+
+	if (imm & ~(SZ_64K - 1)) {
+		return AARCH64_BREAK_FAULT;
+	}
+
+	switch (variant) {
+	case AARCH64_INSN_VARIANT_32BIT:
+		if (shift != 0 && shift != 16) {
+			return AARCH64_BREAK_FAULT;
+		}
+		break;
+	case AARCH64_INSN_VARIANT_64BIT:
+		insn |= AARCH64_INSN_SF_BIT;
+		if (shift != 0 && shift != 16 && shift != 32 && shift != 48) {
+			return AARCH64_BREAK_FAULT;
+		}
+		break;
+	default:
+		return AARCH64_BREAK_FAULT;
+	}
+
+	insn |= (shift >> 4) << 21;
+
+	insn = aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RD, insn, dst);
+
+	return aarch64_insn_encode_immediate(AARCH64_INSN_IMM_16, insn, imm);
+}
+
 u32 aarch64_insn_gen_add_sub_shifted_reg(enum aarch64_insn_register dst,
 					 enum aarch64_insn_register src,
 					 enum aarch64_insn_register reg,
diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
index d77aef7f84f1..7530d51f9b2a 100644
--- a/arch/arm64/lib/insn.c
+++ b/arch/arm64/lib/insn.c
@@ -16,7 +16,6 @@
 #include <asm/insn.h>
 #include <asm/kprobes.h>
 
-#define AARCH64_INSN_SF_BIT	BIT(31)
 #define AARCH64_INSN_N_BIT	BIT(22)
 #define AARCH64_INSN_LSL_12	BIT(22)
 
@@ -702,61 +701,6 @@ u32 aarch64_insn_gen_bitfield(enum aarch64_insn_register dst,
 	return aarch64_insn_encode_immediate(AARCH64_INSN_IMM_S, insn, imms);
 }
 
-u32 aarch64_insn_gen_movewide(enum aarch64_insn_register dst,
-			      int imm, int shift,
-			      enum aarch64_insn_variant variant,
-			      enum aarch64_insn_movewide_type type)
-{
-	u32 insn;
-
-	switch (type) {
-	case AARCH64_INSN_MOVEWIDE_ZERO:
-		insn = aarch64_insn_get_movz_value();
-		break;
-	case AARCH64_INSN_MOVEWIDE_KEEP:
-		insn = aarch64_insn_get_movk_value();
-		break;
-	case AARCH64_INSN_MOVEWIDE_INVERSE:
-		insn = aarch64_insn_get_movn_value();
-		break;
-	default:
-		pr_err("%s: unknown movewide encoding %d\n", __func__, type);
-		return AARCH64_BREAK_FAULT;
-	}
-
-	if (imm & ~(SZ_64K - 1)) {
-		pr_err("%s: invalid immediate encoding %d\n", __func__, imm);
-		return AARCH64_BREAK_FAULT;
-	}
-
-	switch (variant) {
-	case AARCH64_INSN_VARIANT_32BIT:
-		if (shift != 0 && shift != 16) {
-			pr_err("%s: invalid shift encoding %d\n", __func__,
-			       shift);
-			return AARCH64_BREAK_FAULT;
-		}
-		break;
-	case AARCH64_INSN_VARIANT_64BIT:
-		insn |= AARCH64_INSN_SF_BIT;
-		if (shift != 0 && shift != 16 && shift != 32 && shift != 48) {
-			pr_err("%s: invalid shift encoding %d\n", __func__,
-			       shift);
-			return AARCH64_BREAK_FAULT;
-		}
-		break;
-	default:
-		pr_err("%s: unknown variant encoding %d\n", __func__, variant);
-		return AARCH64_BREAK_FAULT;
-	}
-
-	insn |= (shift >> 4) << 21;
-
-	insn = aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RD, insn, dst);
-
-	return aarch64_insn_encode_immediate(AARCH64_INSN_IMM_16, insn, imm);
-}
-
 u32 aarch64_insn_gen_add_sub_shifted_reg(enum aarch64_insn_register dst,
 					 enum aarch64_insn_register src,
 					 enum aarch64_insn_register reg,
-- 
2.43.0


