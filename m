Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E540C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 23:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIcgB+tvT4EZ6BD6hvn5buiMDsNcMRKktpWUEIjKt0Q=; b=YrbFlqd/i9XUBvf1ba/p7Rykbv
	OOsSUC/Jdk9JNZGtyfI604GGEp10kmkx7USRevqr51GdU/ehwGbjVzXpujLZ0N2LuSlnD0nfeRU7x
	xO2gNMUCW3eSulwBlXVUdpWzDgmfJfkbGfJxLBlCofld1pnPT+pZXHzvftpvCAcSJiNvQteR05DKM
	tPiXexyCf+Mn2iR8M7EDctk3GGj8lLlP5vTvH0wr78iWDzLpeFqUa2DHBH3Zlb7DSReQVESJqVLa0
	6vkyXubxYdkyp3mQVh11VaSqwhEUI/y8cIYwssnbpojDSJlpZ6DmuR5dcTWvt5rs4tIoQ8vbUJnD8
	UpiwqP7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJD-00000009m6q-3JSm;
	Sat, 08 Aug 2026 23:18:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsqJC-00000009m6L-31UD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 23:18:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 79FC043D28;
	Sat,  8 Aug 2026 23:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C130B1F000E9;
	Sat,  8 Aug 2026 23:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786231110;
	bh=tIcgB+tvT4EZ6BD6hvn5buiMDsNcMRKktpWUEIjKt0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L/2Xcr9xyrCYzPPKDUPzMqRo1EohSgX5ZEo2WBvWrbz8qHLfa3hRADrCObejyGDBe
	 b6I35OxXQ7todPwPSUEN3V+sTbA0AvPp/PLri2Pc+I6XlPIpNrJaHWxejk4wVstUTk
	 jB56reLYqppiSip9NyozScQusOUiePtfutDjJFXEVYvUhJShiL01obRgGpsnqLlyjS
	 JDWLxW330X5kM4qRwqxZ0a8fOcsmto9l2yZa5ApsA/bKqTCHoHc/itXJNLRfTKXLp2
	 ZA+EN4z7jZJ12UY1ynoWn56LHBuROo/3JV4Vn+XT9Ky4F4bwzuf24YIzLBDYlGwSEo
	 VSD3x7DoLYF5w==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Song Liu <song@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v4 05/22] arm64: Rename TRAMP_VALIAS -> TRAMP_VALIAS_ASM in asm-offsets
Date: Sat,  8 Aug 2026 16:17:09 -0700
Message-ID: <108ebf574aa6a6e244fcc225856eb845346cc3fd.1786230311.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1786230311.git.jpoimboe@kernel.org>
References: <cover.1786230311.git.jpoimboe@kernel.org>
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

Rename the asm-offsets TRAMP_VALIAS macro to TRAMP_VALIAS_ASM, following
the naming convention already used by PIE_E0_ASM and PIE_E1_ASM.  This
disambiguates the asm-offsets-generated constant from the C macro of the
same name defined in fixmap.h and vectors.h.

This is needed by a later patch which adds new includes to asm-offsets.c
that would otherwise conflict with the C version.

Acked-by: Song Liu <song@kernel.org>
Reviewed-by: Miroslav Benes <mbenes@suse.cz>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/kernel/asm-offsets.c | 2 +-
 arch/arm64/kernel/entry.S       | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index b6367ff3a49ca..44b92f582c127 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -153,7 +153,7 @@ int main(void)
   DEFINE(ARM64_FTR_SYSVAL,	offsetof(struct arm64_ftr_reg, sys_val));
   BLANK();
 #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
-  DEFINE(TRAMP_VALIAS,		TRAMP_VALIAS);
+  DEFINE(TRAMP_VALIAS_ASM,	TRAMP_VALIAS);
 #endif
 #ifdef CONFIG_ARM_SDE_INTERFACE
   DEFINE(SDEI_EVENT_INTREGS,	offsetof(struct sdei_registered_event, interrupted_regs));
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index d4cbdfb23d733..85f6305c1f568 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -102,7 +102,7 @@
 	.endm
 
 	.macro	tramp_alias, dst, sym
-	.set	.Lalias\@, TRAMP_VALIAS + \sym - .entry.tramp.text
+	.set	.Lalias\@, TRAMP_VALIAS_ASM + \sym - .entry.tramp.text
 	movz	\dst, :abs_g2_s:.Lalias\@
 	movk	\dst, :abs_g1_nc:.Lalias\@
 	movk	\dst, :abs_g0_nc:.Lalias\@
@@ -626,10 +626,10 @@ SYM_CODE_END(ret_to_user)
 #ifdef CONFIG_QCOM_FALKOR_ERRATUM_1003
 alternative_if ARM64_WORKAROUND_QCOM_FALKOR_E1003
 	/* ASID already in \tmp[63:48] */
-	movk	\tmp, #:abs_g2_nc:(TRAMP_VALIAS >> 12)
-	movk	\tmp, #:abs_g1_nc:(TRAMP_VALIAS >> 12)
+	movk	\tmp, #:abs_g2_nc:(TRAMP_VALIAS_ASM >> 12)
+	movk	\tmp, #:abs_g1_nc:(TRAMP_VALIAS_ASM >> 12)
 	/* 2MB boundary containing the vectors, so we nobble the walk cache */
-	movk	\tmp, #:abs_g0_nc:((TRAMP_VALIAS & ~(SZ_2M - 1)) >> 12)
+	movk	\tmp, #:abs_g0_nc:((TRAMP_VALIAS_ASM & ~(SZ_2M - 1)) >> 12)
 	isb
 	tlbi	vae1, \tmp
 	dsb	nsh
-- 
2.54.0


