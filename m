Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3006D5E391
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 14:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTcM2sL3eF3rqG4pU9NmD+bZNWW94f+Sg5odGvQeJJY=; b=qj8BoJHfmHQrm1ijDkY6xqiA4Y
	pYwnMpsNaX3mrTcrnseAGC8ZRw1T2hRx31E1tNMR39l+q9w4cnHGvXaB7JwMuhaaOUnALO8YkRYsK
	i2waD7QuJgJwYIVOSqffzwiXax2y/GklJldCHpaNe+eQWTSeAT2vh7R9U3RGC3+ADE8D7jSRvMIoP
	J5yTFuGWe2hgoeQbfE9Ta1+irfxBoXJkZsaGxQgG3sAmG0tX5paqzOCucbXoIqX8AwCP35TbQj8uv
	w57zgcn0wJig9vpg1PEOfbhMaGZm0zoheRfMEafROK/ikGSL5Rt4Bz9wKDxtRcsJqY/Xs5hykIuqb
	HRuUQwPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWJc-00000005Mek-0kAT;
	Tue, 16 Dec 2025 14:46:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWJa-00000005Mdg-17OI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 14:46:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8917C1516;
	Tue, 16 Dec 2025 06:46:05 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BD143F73F;
	Tue, 16 Dec 2025 06:46:11 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Linu Cherian <Linu.Cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 01/13] arm64: mm: Re-implement the __tlbi_level macro as a C function
Date: Tue, 16 Dec 2025 14:45:46 +0000
Message-ID: <20251216144601.2106412-2-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216144601.2106412-1-ryan.roberts@arm.com>
References: <20251216144601.2106412-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_064614_606395_7562BB10 
X-CRM114-Status: UNSURE (   9.71  )
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

As part of efforts to reduce our reliance on complex preprocessor macros
for TLB invalidation routines, convert the __tlbi_level macro to a C
function for by-level TLB invalidation.

Each specific tlbi level op is implemented as a C function and the
appropriate function pointer is passed to __tlbi_level(). Since
everything is declared inline and is statically resolvable, the compiler
will convert the indirect function call to a direct inline execution.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 69 +++++++++++++++++++++++++------
 1 file changed, 56 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index a2d65d7d6aae..13a59cf28943 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -105,19 +105,62 @@ static inline unsigned long get_trans_granule(void)
 
 #define TLBI_TTL_UNKNOWN	INT_MAX
 
-#define __tlbi_level(op, addr, level) do {				\
-	u64 arg = addr;							\
-									\
-	if (alternative_has_cap_unlikely(ARM64_HAS_ARMv8_4_TTL) &&	\
-	    level >= 0 && level <= 3) {					\
-		u64 ttl = level & 3;					\
-		ttl |= get_trans_granule() << 2;			\
-		arg &= ~TLBI_TTL_MASK;					\
-		arg |= FIELD_PREP(TLBI_TTL_MASK, ttl);			\
-	}								\
-									\
-	__tlbi(op, arg);						\
-} while(0)
+typedef void (*tlbi_op)(u64 arg);
+
+static __always_inline void vae1is(u64 arg)
+{
+	__tlbi(vae1is, arg);
+}
+
+static __always_inline void vae2is(u64 arg)
+{
+	__tlbi(vae2is, arg);
+}
+
+static __always_inline void vale1(u64 arg)
+{
+	__tlbi(vale1, arg);
+	__tlbi_user(vale1, arg);
+}
+
+static __always_inline void vale1is(u64 arg)
+{
+	__tlbi(vale1is, arg);
+}
+
+static __always_inline void vale2is(u64 arg)
+{
+	__tlbi(vale2is, arg);
+}
+
+static __always_inline void vaale1is(u64 arg)
+{
+	__tlbi(vaale1is, arg);
+}
+
+static __always_inline void ipas2e1(u64 arg)
+{
+	__tlbi(ipas2e1, arg);
+}
+
+static __always_inline void ipas2e1is(u64 arg)
+{
+	__tlbi(ipas2e1is, arg);
+}
+
+static __always_inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
+{
+	u64 arg = addr;
+
+	if (alternative_has_cap_unlikely(ARM64_HAS_ARMv8_4_TTL) && level <= 3) {
+		u64 ttl = level | (get_trans_granule() << 2);
+
+		arg &= ~TLBI_TTL_MASK;
+		arg |= FIELD_PREP(TLBI_TTL_MASK, ttl);
+	}
+
+	op(arg);
+}
 
 #define __tlbi_user_level(op, arg, level) do {				\
 	if (arm64_kernel_unmapped_at_el0())				\
-- 
2.43.0


