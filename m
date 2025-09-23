Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6320CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 17:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nqNV/UFwypdIEpJKRCZL0w0/uWdDcXO5z3KDapN25dQ=; b=dxR1ZHriFyLBWc
	AHOTzs5MoMdwFrcO/UrDsEpbYo1YrTLXsRLjosZRO8CgdhF3l9I3o10F7cCql/8Yx6ZgMlG+MnpYk
	ipHlY8rlyW9KwHxXstTcaE9JygjBOWqjn0I2UwmsyX9XurUs2lRnaJdvKDJzfdpdll+u4K5ZgRXiA
	V3K7mGj+ieWBCPZCFeShcYgyvLLb+xVOwRmyqPhd7XSTVOTtKpnmpzzNA54DXjlIaYf04uPAYHzaR
	seT+33aHEDDapnpsx+cn3QbLL+YsNSKlgfbflMKdF6U3MYI1y7CICVfQD1DN2T0f8cTdNXZy7BdGd
	6QCeiKcnh0d6hw8ZnxMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v179b-0000000ES8n-21KK;
	Tue, 23 Sep 2025 17:50:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v179E-0000000ERnA-1CGT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 17:49:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8739497;
	Tue, 23 Sep 2025 10:49:43 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.30.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1AE8B3F5A1;
	Tue, 23 Sep 2025 10:49:47 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 09/16] arm64/insn: always inline aarch64_insn_gen_add_sub_imm()
Date: Tue, 23 Sep 2025 18:48:56 +0100
Message-ID: <20250923174903.76283-10-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923174903.76283-1-ada.coupriediaz@arm.com>
References: <20250923174903.76283-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_104952_401019_6336467C 
X-CRM114-Status: GOOD (  16.04  )
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

As it is always called with an explicit instruction adsb type and variant,
we can check for their validity at compile time and remove
the runtime error print.

This is not the case for the immediate error print, as it checks
dynamically. However, it should not occur in practice and will still
generate a fault BRK, so remove it.

This makes `aarch64_insn_gen_add_sub_imm()` safe for inlining
and usage from patching callbacks, as both
`aarch64_insn_encode_register()` and `aarch64_insn_encode_immediate()`
have been made safe in previous commits.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/insn.h | 68 +++++++++++++++++++++++++++++++++--
 arch/arm64/lib/insn.c         | 62 --------------------------------
 2 files changed, 66 insertions(+), 64 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index a94ecc9140f1..a7caafd6f02b 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -627,6 +627,8 @@ static __always_inline bool aarch64_get_imm_shift_mask(
 #define ADR_IMM_HISHIFT		5
 
 #define AARCH64_INSN_SF_BIT	BIT(31)
+#define AARCH64_INSN_LSL_12	BIT(22)
+
 
 enum aarch64_insn_encoding_class aarch64_get_insn_class(u32 insn);
 u64 aarch64_insn_decode_immediate(enum aarch64_insn_imm_type type, u32 insn);
@@ -788,10 +790,72 @@ u32 aarch64_insn_gen_load_store_ex(enum aarch64_insn_register reg,
 				   enum aarch64_insn_register state,
 				   enum aarch64_insn_size_type size,
 				   enum aarch64_insn_ldst_type type);
-u32 aarch64_insn_gen_add_sub_imm(enum aarch64_insn_register dst,
+
+static __always_inline u32 aarch64_insn_gen_add_sub_imm(
+				 enum aarch64_insn_register dst,
 				 enum aarch64_insn_register src,
 				 int imm, enum aarch64_insn_variant variant,
-				 enum aarch64_insn_adsb_type type);
+				 enum aarch64_insn_adsb_type type)
+{
+	compiletime_assert(type >= AARCH64_INSN_ADSB_ADD &&
+		type <= AARCH64_INSN_ADSB_SUB_SETFLAGS,
+		"unknown add/sub encoding");
+	compiletime_assert(variant == AARCH64_INSN_VARIANT_32BIT ||
+		variant == AARCH64_INSN_VARIANT_64BIT,
+		"unknown variant encoding");
+	u32 insn;
+
+	switch (type) {
+	case AARCH64_INSN_ADSB_ADD:
+		insn = aarch64_insn_get_add_imm_value();
+		break;
+	case AARCH64_INSN_ADSB_SUB:
+		insn = aarch64_insn_get_sub_imm_value();
+		break;
+	case AARCH64_INSN_ADSB_ADD_SETFLAGS:
+		insn = aarch64_insn_get_adds_imm_value();
+		break;
+	case AARCH64_INSN_ADSB_SUB_SETFLAGS:
+		insn = aarch64_insn_get_subs_imm_value();
+		break;
+	default:
+		return AARCH64_BREAK_FAULT;
+	}
+
+	switch (variant) {
+	case AARCH64_INSN_VARIANT_32BIT:
+		break;
+	case AARCH64_INSN_VARIANT_64BIT:
+		insn |= AARCH64_INSN_SF_BIT;
+		break;
+	default:
+		return AARCH64_BREAK_FAULT;
+	}
+
+	/* We can't encode more than a 24bit value (12bit + 12bit shift) */
+	if (imm & ~(BIT(24) - 1))
+		goto out;
+
+	/* If we have something in the top 12 bits... */
+	if (imm & ~(SZ_4K - 1)) {
+		/* ... and in the low 12 bits -> error */
+		if (imm & (SZ_4K - 1))
+			goto out;
+
+		imm >>= 12;
+		insn |= AARCH64_INSN_LSL_12;
+	}
+
+	insn = aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RD, insn, dst);
+
+	insn = aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RN, insn, src);
+
+	return aarch64_insn_encode_immediate(AARCH64_INSN_IMM_12, insn, imm);
+
+out:
+	return AARCH64_BREAK_FAULT;
+}
+
 u32 aarch64_insn_gen_adr(unsigned long pc, unsigned long addr,
 			 enum aarch64_insn_register reg,
 			 enum aarch64_insn_adr_type type);
diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
index 15634094de05..34b6f1c692b4 100644
--- a/arch/arm64/lib/insn.c
+++ b/arch/arm64/lib/insn.c
@@ -17,7 +17,6 @@
 #include <asm/kprobes.h>
 
 #define AARCH64_INSN_N_BIT	BIT(22)
-#define AARCH64_INSN_LSL_12	BIT(22)
 
 u64 aarch64_insn_decode_immediate(enum aarch64_insn_imm_type type, u32 insn)
 {
@@ -585,67 +584,6 @@ u32 aarch64_insn_gen_cas(enum aarch64_insn_register result,
 }
 #endif
 
-u32 aarch64_insn_gen_add_sub_imm(enum aarch64_insn_register dst,
-				 enum aarch64_insn_register src,
-				 int imm, enum aarch64_insn_variant variant,
-				 enum aarch64_insn_adsb_type type)
-{
-	u32 insn;
-
-	switch (type) {
-	case AARCH64_INSN_ADSB_ADD:
-		insn = aarch64_insn_get_add_imm_value();
-		break;
-	case AARCH64_INSN_ADSB_SUB:
-		insn = aarch64_insn_get_sub_imm_value();
-		break;
-	case AARCH64_INSN_ADSB_ADD_SETFLAGS:
-		insn = aarch64_insn_get_adds_imm_value();
-		break;
-	case AARCH64_INSN_ADSB_SUB_SETFLAGS:
-		insn = aarch64_insn_get_subs_imm_value();
-		break;
-	default:
-		pr_err("%s: unknown add/sub encoding %d\n", __func__, type);
-		return AARCH64_BREAK_FAULT;
-	}
-
-	switch (variant) {
-	case AARCH64_INSN_VARIANT_32BIT:
-		break;
-	case AARCH64_INSN_VARIANT_64BIT:
-		insn |= AARCH64_INSN_SF_BIT;
-		break;
-	default:
-		pr_err("%s: unknown variant encoding %d\n", __func__, variant);
-		return AARCH64_BREAK_FAULT;
-	}
-
-	/* We can't encode more than a 24bit value (12bit + 12bit shift) */
-	if (imm & ~(BIT(24) - 1))
-		goto out;
-
-	/* If we have something in the top 12 bits... */
-	if (imm & ~(SZ_4K - 1)) {
-		/* ... and in the low 12 bits -> error */
-		if (imm & (SZ_4K - 1))
-			goto out;
-
-		imm >>= 12;
-		insn |= AARCH64_INSN_LSL_12;
-	}
-
-	insn = aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RD, insn, dst);
-
-	insn = aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RN, insn, src);
-
-	return aarch64_insn_encode_immediate(AARCH64_INSN_IMM_12, insn, imm);
-
-out:
-	pr_err("%s: invalid immediate encoding %d\n", __func__, imm);
-	return AARCH64_BREAK_FAULT;
-}
-
 u32 aarch64_insn_gen_bitfield(enum aarch64_insn_register dst,
 			      enum aarch64_insn_register src,
 			      int immr, int imms,
-- 
2.43.0


