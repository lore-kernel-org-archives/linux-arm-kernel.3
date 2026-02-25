Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55CDFD3760
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 15:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g39e/A3RgtPfBnKGuUvK/U79pecjFDzJR16wZWSZvto=; b=QXRVeWXbzJ7ez6EHJW7K2WkStF
	Lo7hLosePpkZFGNkJ7tBalLTRsVyP+xuIW3pKWsGx65QqEMiucKcfnGRBEvWqwqDiijplmd7ldGOj
	LJOMo2dAYdpZDR5nl2q4/3Em+tk7soZl26A60LZlr9OISzPViWjeVNXTJ59CD9fEdQmq5dIVVDzUO
	Rx67qXwggyS7vFjOnpAmQjdRCW4yscuYw4g4vsGiKXWXh54J65emW2KNet6rf486lJfHBijV3CRhp
	/yds5pefzO1iCpvYSjB0Tc5gH//g/OnxNn+Mc58yRdtgtNEQd/9KqIiesYgCqwIdHGO+AorLE5P5Z
	HLBJYVaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGRT-00000004FFs-2Dxw;
	Wed, 25 Feb 2026 15:04:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGRS-00000004FFi-0U43
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 15:04:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F259600AE;
	Wed, 25 Feb 2026 15:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4B1C2BC86;
	Wed, 25 Feb 2026 15:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772031885;
	bh=AeeGpAWlnalKkGljt+Q0JTWXMacSXGiGTEbRoHMMxa8=;
	h=From:To:Cc:Subject:Date:From;
	b=MtmWOUVbV4BtgVlYAunihoPmvjLR0NY07DV5MwoUtauxI6Qc0/LCFFaW3a8cP29E2
	 e92RpW1FcUMfHcKw9YRYJqL1mIyj7n4/Nsy2Kek1VNrInA7217/YO1mzKHAlDeMFPm
	 MlUkvnTyECuoYzZ9YgljvVNa+nWHloF6g4YLdDVynX0H47K/k0NyjE8l3kH5ueVCrq
	 H3X/d6NUw1y9EfR9P7dDEUVh5fqoXsWr4k5l0qTbaNMDgddtWNVJhe9jJn7dekeL8Z
	 UyQb8Ey5+2oDsVPxuyHBbCJe2ZnjCcwY75ShMsmWEAxxWzLM/iMlCEFuTcOIhpeNLo
	 PJAKRaGqxj/Tw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: runtime-const: save one instruction when ARM64_VA_BITS <= 48
Date: Wed, 25 Feb 2026 22:46:13 +0800
Message-ID: <20260225144613.30846-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
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

Currently, the runtime_const_ptr() uses 4 instructions to move a long
imm to GP, but when ARM64_VA_BITS <= 48(which is true for android and
armbian), the top 8bits of runtime cont ptr is all '1', so we can make
use of the movn instruction to construct the imm's top 8bits and lower
16bits at the same time, thus save one instruction.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/arm64/include/asm/runtime-const.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/include/asm/runtime-const.h b/arch/arm64/include/asm/runtime-const.h
index be5915669d23..6797dd37d690 100644
--- a/arch/arm64/include/asm/runtime-const.h
+++ b/arch/arm64/include/asm/runtime-const.h
@@ -7,6 +7,8 @@
 /* Sigh. You can still run arm64 in BE mode */
 #include <asm/byteorder.h>
 
+#if CONFIG_ARM64_VA_BITS > 48
+
 #define runtime_const_ptr(sym) ({				\
 	typeof(sym) __ret;					\
 	asm_inline("1:\t"					\
@@ -20,6 +22,22 @@
 		:"=r" (__ret));					\
 	__ret; })
 
+#else
+
+#define runtime_const_ptr(sym) ({				\
+	typeof(sym) __ret;					\
+	asm_inline("1:\t"					\
+		"movn %0, #0x3210\n\t"				\
+		"movk %0, #0x89ab, lsl #16\n\t"			\
+		"movk %0, #0x4567, lsl #32\n\t"			\
+		".pushsection runtime_ptr_" #sym ",\"a\"\n\t"	\
+		".long 1b - .\n\t"				\
+		".popsection"					\
+		: "=r" (__ret));				\
+	__ret; })
+
+#endif
+
 #define runtime_const_shift_right_32(val, sym) ({		\
 	unsigned long __ret;					\
 	asm_inline("1:\t"					\
@@ -58,11 +76,19 @@ static inline void __runtime_fixup_caches(void *where, unsigned int insns)
 static inline void __runtime_fixup_ptr(void *where, unsigned long val)
 {
 	__le32 *p = lm_alias(where);
+#if CONFIG_ARM64_VA_BITS > 48
 	__runtime_fixup_16(p, val);
+#else
+	__runtime_fixup_16(p, ~val);
+#endif
 	__runtime_fixup_16(p+1, val >> 16);
 	__runtime_fixup_16(p+2, val >> 32);
+#if CONFIG_ARM64_VA_BITS > 48
 	__runtime_fixup_16(p+3, val >> 48);
 	__runtime_fixup_caches(where, 4);
+#else
+	__runtime_fixup_caches(where, 3);
+#endif
 }
 
 /* Immediate value is 6 bits starting at bit #16 */
-- 
2.51.0


