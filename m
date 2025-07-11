Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D98C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 17:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5T/B7LgjNQd0jhnXp9pwGaG0Ux56U4+ILwwfyKo6+Dk=; b=uFN6xzIhjsTXCS4krf5EkMLnrh
	+PX8us1HkWfM+kZIjzhRySkoz0y16uh42nw12bcWKoL8y+1JpVIh5HZo1ikB+i/ZQRCtDgZqgQv3W
	qgeH9JTcJi1FGQmidMNAw18vgM4vUq4H3Q5U3T1jBgWoZXjVlal7u3xGoa6wG4clw6mZu2VM0+hCV
	nWcwo5X7bCX70Us7JaluXzGfFW+5gimY5S6G1w991uBl8w4G2o1UQIzwXTahCnQ4vjkzrLVkQF/yn
	/ztltQRt/wbxdBgLmrwyPasBQ5ZXXHgZtlF60osqIb+n/3qVXhN3jKPv+USYrw2YVCN1kUewhTbJW
	ElivI83w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHE4-0000000FMea-3hcV;
	Fri, 11 Jul 2025 17:07:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGRe-0000000FGEZ-14HO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 16:17:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AACE861425;
	Fri, 11 Jul 2025 16:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75292C4CEF0;
	Fri, 11 Jul 2025 16:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752250673;
	bh=7sV42ef3qnlm42vIFFwnfcJvwECcndeyiu5SfLlYqu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cHUsYN57p1WCIQfYJxnAcETmaWxcXbEabSHhQaNdnDM8HofRM9KnCq1IdbaSnmyrf
	 J7InC+Ann/tJcPuIv1jpvuORX0zhlsYKdRnfWof9E2FsJwPzeDUN1b5SEWUdAUoldZ
	 0mP7m/GtRFrsTg7XjJGQCrOsEer5oCE2sfGAf9oW294bYXa4E4dNgqj9HouLH2JIhG
	 1KvVdLEGDj9KxTL/vBCwMUfYD1psoaQ9Um8A/NB4KGs9z3Q930aiw2jn+czdJHDj5Z
	 lmqpwikWby6DauZlUIzFKKAr+np+pHFCmhHlyOqAA0xvlahFnddcJO8kSscThWe8mX
	 tBgfVZ+2LEpUQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 05/10] arm64: mm: Re-implement the __tlbi_level macro in C
Date: Fri, 11 Jul 2025 17:17:27 +0100
Message-Id: <20250711161732.384-6-will@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250711161732.384-1-will@kernel.org>
References: <20250711161732.384-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

__tlbi_level() is just a simple macro around __tlbi_level_op(), so merge
the two into a single C function. Drop the redundant comparison of
'u32 level' against 0 and tidy up the code a little while we're at it.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/tlbflush.h | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 728b00f3e1f4..ddd77e92b268 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -128,8 +128,17 @@ enum tlbi_op {
 	___GEN_TLBI_OP_CASE(op);					\
 		break
 
-static __always_inline void __tlbi_level_op(const enum tlbi_op op, u64 arg)
+static __always_inline void __tlbi_level(const enum tlbi_op op, u64 addr, u32 level)
 {
+	u64 arg = addr;
+
+	if (alternative_has_cap_unlikely(ARM64_HAS_ARMv8_4_TTL) && level <= 3) {
+		u64 ttl = level | (get_trans_granule() << 2);
+
+		arg &= ~TLBI_TTL_MASK;
+		arg |= FIELD_PREP(TLBI_TTL_MASK, ttl);
+	}
+
 	switch (op) {
 	__GEN_TLBI_OP_ASID_CASE(vae1is);
 	__GEN_TLBI_OP_CASE(vae2is);
@@ -145,20 +154,6 @@ static __always_inline void __tlbi_level_op(const enum tlbi_op op, u64 arg)
 #undef __GEN_TLBI_OP_ASID_CASE
 #undef ___GEN_TLBI_OP_CASE
 
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
-	__tlbi_level_op(op, arg);					\
-} while(0)
-
 /*
  * This macro creates a properly formatted VA operand for the TLB RANGE. The
  * value bit assignments are:
-- 
2.50.0.727.gbf7dc18ff4-goog


