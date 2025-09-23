Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BF4CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 17:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZyHqDirOg8h1xFyA+fm0sCoxyLJfpze86+oaD8OVwo=; b=u4Mwac/qr/9PiU
	1ihPzk/vxYrUb7lw6Sjb5ktejNEG7/RBpMVvMSACH4uzOYLVfAi0REe/1mt5MPq0E4be3j8Z15QVN
	BQgKZR2Sof6EuqZuStGXzDGyfr0BFr23Mfam4KoYpW/rT5MhRqRR5jMf8SOmpbf3PZYRXedmDSEDQ
	aIXBdByNrwfbcz6OO3mAqhAEPxTkDLrNrpkpqZF5mDrBjc43sJfIAHIbsJMvwJktwUgG6ZinK7koP
	KodBBbuYW+wsupsZEnAZqTjLeIhSpZ2f+MVe+HGaGTaI42UKwwH3z70C7rkd6k2CnX1xQxq2yNArb
	9v8664Wu3m+dQzEU9rcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v179g-0000000ESFC-0bmK;
	Tue, 23 Sep 2025 17:50:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v179Y-0000000ES6T-0Yqq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 17:50:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60DD1497;
	Tue, 23 Sep 2025 10:50:03 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.30.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D65E03F5A1;
	Tue, 23 Sep 2025 10:50:07 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 14/16] arm64/insn: always inline aarch64_insn_encode_ldst_size()
Date: Tue, 23 Sep 2025 18:49:01 +0100
Message-ID: <20250923174903.76283-15-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923174903.76283-1-ada.coupriediaz@arm.com>
References: <20250923174903.76283-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_105012_305069_6AB32A06 
X-CRM114-Status: GOOD (  14.10  )
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

The type and instruction checks cannot be made at compile time,
as they are dynamically created. However, we can remove the error print
as it should never appear in normal operation and will still lead to
a fault BRK.

This makes `aarch64_insn_encode_ldst_size()` safe for inlining
and usage from patching callbacks.

This is a change of visiblity, as previously the function was private to
lib/insn.c.
However, in order to inline more `aarch64_insn_` functions and make
patching callbacks safe, it needs to be accessible by those functions.
As it is more accessible than before, add a check so that only loads
or stores can be affected by the size encoding.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/insn.h | 24 ++++++++++++++++++++++++
 arch/arm64/lib/insn.c         | 19 +------------------
 2 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index 44435eede1f3..46d4d452e2e2 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -717,6 +717,30 @@ static __always_inline u32 aarch64_insn_encode_immediate(
 
 	return insn;
 }
+
+extern const u32 aarch64_insn_ldst_size[];
+static __always_inline u32 aarch64_insn_encode_ldst_size(
+					 enum aarch64_insn_size_type type,
+					 u32 insn)
+{
+	u32 size;
+
+	if (type < AARCH64_INSN_SIZE_8 || type > AARCH64_INSN_SIZE_64) {
+		return AARCH64_BREAK_FAULT;
+	}
+
+	/* Don't corrput the top bits of other instructions which aren't a size. */
+	if (!aarch64_insn_is_ldst(insn)) {
+		return AARCH64_BREAK_FAULT;
+	}
+
+	size = aarch64_insn_ldst_size[type];
+	insn &= ~GENMASK(31, 30);
+	insn |= size << 30;
+
+	return insn;
+}
+
 static __always_inline u32 aarch64_insn_encode_register(
 				 enum aarch64_insn_register_type type,
 				 u32 insn,
diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
index 71df4d72ac81..63564d236235 100644
--- a/arch/arm64/lib/insn.c
+++ b/arch/arm64/lib/insn.c
@@ -42,30 +42,13 @@ u64 aarch64_insn_decode_immediate(enum aarch64_insn_imm_type type, u32 insn)
 	return (insn >> shift) & mask;
 }
 
-static const u32 aarch64_insn_ldst_size[] = {
+const u32 aarch64_insn_ldst_size[] = {
 	[AARCH64_INSN_SIZE_8] = 0,
 	[AARCH64_INSN_SIZE_16] = 1,
 	[AARCH64_INSN_SIZE_32] = 2,
 	[AARCH64_INSN_SIZE_64] = 3,
 };
 
-static u32 aarch64_insn_encode_ldst_size(enum aarch64_insn_size_type type,
-					 u32 insn)
-{
-	u32 size;
-
-	if (type < AARCH64_INSN_SIZE_8 || type > AARCH64_INSN_SIZE_64) {
-		pr_err("%s: unknown size encoding %d\n", __func__, type);
-		return AARCH64_BREAK_FAULT;
-	}
-
-	size = aarch64_insn_ldst_size[type];
-	insn &= ~GENMASK(31, 30);
-	insn |= size << 30;
-
-	return insn;
-}
-
 static inline long label_imm_common(unsigned long pc, unsigned long addr,
 				     long range)
 {
-- 
2.43.0


