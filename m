Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF2ACAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 17:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MF8PkXgUBXn0osNVxu7f/la70PCpV5fAZ4RLQTvzLhw=; b=ceUEAdubEHH3+h
	vBACN16Q+xxVs7ze4FTUcew8rEvQSgRSNxWHxHbV2t3Yy96embztMPfMtn11dw12j25UzkGY2sDCV
	ght6slqueL+RuFlWRezgoKH60PSdIlrsT0zOzvolkk16nv5QBSQDuQa3xqj6Lm+jMgDs3CJQ5xdfF
	xzIPmc0tMh9lcNOSGgVzjDg0QrpJhtqZFd4Qsgtcwx5MCTSxdTkilAxlH3veSLx99cjcF+xg5NH3X
	ncddIiu5UgLS05z5uRh2pDKvd9DLcAxXIXy7ZhgPGUcD3NEta5Wph256DOWWGNny/dzBvfzRf6t51
	sSXHPaGV7ptzsCvkNcxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v178x-0000000ERW2-2ip5;
	Tue, 23 Sep 2025 17:49:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v178r-0000000ERRX-3mz7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 17:49:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D92C0497;
	Tue, 23 Sep 2025 10:49:19 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.30.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6F0BD3F5A1;
	Tue, 23 Sep 2025 10:49:24 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 03/16] arm64/insn: always inline aarch64_insn_decode_register()
Date: Tue, 23 Sep 2025 18:48:50 +0100
Message-ID: <20250923174903.76283-4-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923174903.76283-1-ada.coupriediaz@arm.com>
References: <20250923174903.76283-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_104930_068689_9610B949 
X-CRM114-Status: GOOD (  11.05  )
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

As it is always called with an explicit register type, we can
check for its validity at compile time and remove the runtime error print.

This makes `aarch64_insn_decode_register()` self-contained and safe
for inlining and usage from patching callbacks.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/insn.h | 32 ++++++++++++++++++++++++++++++--
 arch/arm64/lib/insn.c         | 29 -----------------------------
 2 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index 18c7811774d3..f6bce1a62dda 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -7,6 +7,7 @@
  */
 #ifndef	__ASM_INSN_H
 #define	__ASM_INSN_H
+#include <linux/bits.h>
 #include <linux/build_bug.h>
 #include <linux/types.h>
 
@@ -558,8 +559,35 @@ enum aarch64_insn_encoding_class aarch64_get_insn_class(u32 insn);
 u64 aarch64_insn_decode_immediate(enum aarch64_insn_imm_type type, u32 insn);
 u32 aarch64_insn_encode_immediate(enum aarch64_insn_imm_type type,
 				  u32 insn, u64 imm);
-u32 aarch64_insn_decode_register(enum aarch64_insn_register_type type,
-					 u32 insn);
+static __always_inline u32 aarch64_insn_decode_register(
+				 enum aarch64_insn_register_type type, u32 insn)
+{
+	compiletime_assert(type >= AARCH64_INSN_REGTYPE_RT &&
+		type <= AARCH64_INSN_REGTYPE_RS, "unknown register type encoding");
+	int shift;
+
+	switch (type) {
+	case AARCH64_INSN_REGTYPE_RT:
+	case AARCH64_INSN_REGTYPE_RD:
+		shift = 0;
+		break;
+	case AARCH64_INSN_REGTYPE_RN:
+		shift = 5;
+		break;
+	case AARCH64_INSN_REGTYPE_RT2:
+	case AARCH64_INSN_REGTYPE_RA:
+		shift = 10;
+		break;
+	case AARCH64_INSN_REGTYPE_RM:
+	case AARCH64_INSN_REGTYPE_RS:
+		shift = 16;
+		break;
+	default:
+		return 0;
+	}
+
+	return (insn >> shift) & GENMASK(4, 0);
+}
 u32 aarch64_insn_gen_branch_imm(unsigned long pc, unsigned long addr,
 				enum aarch64_insn_branch_type type);
 u32 aarch64_insn_gen_comp_branch_imm(unsigned long pc, unsigned long addr,
diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
index 4e298baddc2e..0fac78e542cf 100644
--- a/arch/arm64/lib/insn.c
+++ b/arch/arm64/lib/insn.c
@@ -144,35 +144,6 @@ u32 __kprobes aarch64_insn_encode_immediate(enum aarch64_insn_imm_type type,
 	return insn;
 }
 
-u32 aarch64_insn_decode_register(enum aarch64_insn_register_type type,
-					u32 insn)
-{
-	int shift;
-
-	switch (type) {
-	case AARCH64_INSN_REGTYPE_RT:
-	case AARCH64_INSN_REGTYPE_RD:
-		shift = 0;
-		break;
-	case AARCH64_INSN_REGTYPE_RN:
-		shift = 5;
-		break;
-	case AARCH64_INSN_REGTYPE_RT2:
-	case AARCH64_INSN_REGTYPE_RA:
-		shift = 10;
-		break;
-	case AARCH64_INSN_REGTYPE_RM:
-		shift = 16;
-		break;
-	default:
-		pr_err("%s: unknown register type encoding %d\n", __func__,
-		       type);
-		return 0;
-	}
-
-	return (insn >> shift) & GENMASK(4, 0);
-}
-
 static u32 aarch64_insn_encode_register(enum aarch64_insn_register_type type,
 					u32 insn,
 					enum aarch64_insn_register reg)
-- 
2.43.0


