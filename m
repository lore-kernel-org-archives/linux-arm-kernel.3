Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DCECAC5B3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 17:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ss/saKnMryxkFtQ4hFKcdP0V3JDpdbG7iyhetNvF7o=; b=sanJ4HrsUACB+y
	1bKCltKRQ7yl5sCLwtl/EOkF86/xX2yZUYAQEzcZIp/FJlop00azwZL81xiFSoBFQlcpsmMRmJmdr
	dbRwtuOm5AnYzlO0iVBzmm4F8NixzVX0wco17Mxiyj6XjpmdhGLphRwIDgeqA71cfGinc17SfslQ3
	/SJ2BkC5KvReyJMSP2IAAuSJI1LB99pYGN00hWBoQS4N/UphdZHQ9oLYjz2hvEOTVL2AZaOjgXKsj
	4rp8Z9BKXcrYUkoSE0g9UXtyItVK6jQAa5G820/9bWiuoB/kbK38aX+kxJXzxEtu73QDWu3HGqt34
	OgubUFghEdaIHIea2LTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v179d-0000000ESB3-0GHf;
	Tue, 23 Sep 2025 17:50:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v179M-0000000ERtu-1WrQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 17:50:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AB86497;
	Tue, 23 Sep 2025 10:49:51 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.30.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 62B403F5A1;
	Tue, 23 Sep 2025 10:49:56 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 11/16] arm64/insn: always inline aarch64_insn_gen_extr()
Date: Tue, 23 Sep 2025 18:48:58 +0100
Message-ID: <20250923174903.76283-12-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923174903.76283-1-ada.coupriediaz@arm.com>
References: <20250923174903.76283-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_105000_621082_319D8A18 
X-CRM114-Status: GOOD (  10.78  )
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

As it is always called with an explicit variant, we can check for
its validity at compile time and remove the runtime error print.

This makes `aarch64_insn_gen_extr()` safe for inlining
and usage from patching callbacks, as both
`aarch64_insn_encode_immediate()` and `aarch64_insn_encode_register()`
have been made safe in previous commits.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/insn.h | 39 ++++++++++++++++++++++++++++++-----
 arch/arm64/lib/insn.c         | 32 ----------------------------
 2 files changed, 34 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index 6e6a53d4d750..4ba4d5c50137 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -1111,12 +1111,41 @@ static __always_inline u32 aarch64_insn_gen_logical_immediate(
 	return aarch64_encode_immediate(imm, variant, insn);
 }
 
+static __always_inline u32 aarch64_insn_gen_extr(
+			 enum aarch64_insn_variant variant,
+			 enum aarch64_insn_register Rm,
+			 enum aarch64_insn_register Rn,
+			 enum aarch64_insn_register Rd,
+			 u8 lsb)
+{
+	compiletime_assert(variant == AARCH64_INSN_VARIANT_32BIT ||
+		variant == AARCH64_INSN_VARIANT_64BIT,
+		"unknown variant encoding");
+	u32 insn;
+
+	insn = aarch64_insn_get_extr_value();
+
+	switch (variant) {
+	case AARCH64_INSN_VARIANT_32BIT:
+		if (lsb > 31)
+			return AARCH64_BREAK_FAULT;
+		break;
+	case AARCH64_INSN_VARIANT_64BIT:
+		if (lsb > 63)
+			return AARCH64_BREAK_FAULT;
+		insn |= AARCH64_INSN_SF_BIT;
+		insn = aarch64_insn_encode_immediate(AARCH64_INSN_IMM_N, insn, 1);
+		break;
+	default:
+		return AARCH64_BREAK_FAULT;
+	}
+
+	insn = aarch64_insn_encode_immediate(AARCH64_INSN_IMM_S, insn, lsb);
+	insn = aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RD, insn, Rd);
+	insn = aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RN, insn, Rn);
+	return aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RM, insn, Rm);
+}
 
-u32 aarch64_insn_gen_extr(enum aarch64_insn_variant variant,
-			  enum aarch64_insn_register Rm,
-			  enum aarch64_insn_register Rn,
-			  enum aarch64_insn_register Rd,
-			  u8 lsb);
 #ifdef CONFIG_ARM64_LSE_ATOMICS
 u32 aarch64_insn_gen_atomic_ld_op(enum aarch64_insn_register result,
 				  enum aarch64_insn_register address,
diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
index 8d38bf4bf203..71df4d72ac81 100644
--- a/arch/arm64/lib/insn.c
+++ b/arch/arm64/lib/insn.c
@@ -1021,38 +1021,6 @@ u32 aarch32_insn_mcr_extract_crm(u32 insn)
 	return insn & CRM_MASK;
 }
 
-u32 aarch64_insn_gen_extr(enum aarch64_insn_variant variant,
-			  enum aarch64_insn_register Rm,
-			  enum aarch64_insn_register Rn,
-			  enum aarch64_insn_register Rd,
-			  u8 lsb)
-{
-	u32 insn;
-
-	insn = aarch64_insn_get_extr_value();
-
-	switch (variant) {
-	case AARCH64_INSN_VARIANT_32BIT:
-		if (lsb > 31)
-			return AARCH64_BREAK_FAULT;
-		break;
-	case AARCH64_INSN_VARIANT_64BIT:
-		if (lsb > 63)
-			return AARCH64_BREAK_FAULT;
-		insn |= AARCH64_INSN_SF_BIT;
-		insn = aarch64_insn_encode_immediate(AARCH64_INSN_IMM_N, insn, 1);
-		break;
-	default:
-		pr_err("%s: unknown variant encoding %d\n", __func__, variant);
-		return AARCH64_BREAK_FAULT;
-	}
-
-	insn = aarch64_insn_encode_immediate(AARCH64_INSN_IMM_S, insn, lsb);
-	insn = aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RD, insn, Rd);
-	insn = aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RN, insn, Rn);
-	return aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RM, insn, Rm);
-}
-
 static u32 __get_barrier_crm_val(enum aarch64_insn_mb_type type)
 {
 	switch (type) {
-- 
2.43.0


