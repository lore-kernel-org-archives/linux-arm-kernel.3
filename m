Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDF0CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ouRM+zVkiFRpVMFcOzw3Woa3JO/3peq21EAy/oIXLJA=; b=1PkFj01zVAIGRBZUO/PolOZ82Z
	xWNx/JNmkNClgz6R5NtNzRkVj7l5PhBRA+/68Hn49I4/QuqVbb/4K3ErnWphu/G3BY0qKMMLMU9Fp
	sOA2MtRQvtWsPg6bGLdb32ZhZi5COEOd7tT9LK62b0sQohMt3kEQhuNba8TtiJEXaCtipwe44A/bL
	kD/lELYFW27NUZVjvZTjCNhYztl3zAnXpkAkLbUkYTZIWQMenl4QpYWglV2YktEHlBl9o2V3wZ3vu
	JlhqnVvi/Rgb+0+BgZUJQCvOwWuopWoDfUZ+vWxgJSutRjr4IBjhTX1bltouqf929mTjZ/wQMKfPC
	V9jWE2Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjRA-0000000Et8m-2TgH;
	Wed, 03 Jun 2026 11:07:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjR8-0000000Et62-2mYm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:07:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F93F32E4;
	Wed,  3 Jun 2026 04:06:56 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5798A3F86F;
	Wed,  3 Jun 2026 04:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780484821; bh=8BljP1hWhbtKXmA/On32yV+gMdhsFlbsc/9sDPSZtU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rgzUmm6Xgvpu88k0lxqBSQ//hsPUqXlyxKZTZCUh7gNhJ8p53K+/yC1o9JRxoys98
	 v74AyZbz/nAn8u5oiPNSFNWpErf4Xwieih1jr8fH4Pe+JFGoMBPP3dRYgoKDyt9YXH
	 xJU00XE4A44DzTGHfe+3LBWF0XZM1fISpBwGr71I=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	stable@vger.kernel.org,
	tabba@google.com,
	vladimir.murzin@arm.com,
	will@kernel.org
Subject: [PATCH v4 09/20] arm64: fpsimd: Use assembler for SVE instructions
Date: Wed,  3 Jun 2026 12:06:19 +0100
Message-Id: <20260603110630.1027435-10-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260603110630.1027435-1-mark.rutland@arm.com>
References: <20260603110630.1027435-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_040702_791753_8932F0BF 
X-CRM114-Status: UNSURE (   9.41  )
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

Historically we supported assemblers which could not assemble SVE
instructions. We dropped support for such assemblers in commit:

  118c40b7b503 ("kbuild: require gcc-8 and binutils-2.30")

Since that commit, all supported assemblers (binutils and LLVM) are
capable of assembling SVE instructions, and there's no need for us to
manually encode SVE instructions.

Rely on the assembler to encode SVE instructions, and remove the manual
encoding. The various _sve_<insn> macros are kept for now, and will be
cleaned up in subsequent patches.

There should be no functional change as a result of this patch.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/fpsimdmacros.h | 65 +++++++--------------------
 1 file changed, 17 insertions(+), 48 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimdmacros.h b/arch/arm64/include/asm/fpsimdmacros.h
index adf33d2da40c3..4ba23e493cb69 100644
--- a/arch/arm64/include/asm/fpsimdmacros.h
+++ b/arch/arm64/include/asm/fpsimdmacros.h
@@ -99,85 +99,54 @@
 	.endif
 .endm
 
-/* SVE instruction encodings for non-SVE-capable assemblers */
-/* (pre binutils 2.28, all kernel capable clang versions support SVE) */
+/* Deprecated macros for SVE instructions */
 
 /* STR (vector): STR Z\nz, [X\nxbase, #\offset, MUL VL] */
 .macro _sve_str_v nz, nxbase, offset=0
-	_sve_check_zreg \nz
-	_check_general_reg \nxbase
-	_check_num (\offset), -0x100, 0xff
-	.inst	0xe5804000			\
-		| (\nz)				\
-		| ((\nxbase) << 5)		\
-		| (((\offset) & 7) << 10)	\
-		| (((\offset) & 0x1f8) << 13)
+	.arch_extension sve
+	str	z\nz, [X\nxbase, #\offset, MUL VL]
 .endm
 
 /* LDR (vector): LDR Z\nz, [X\nxbase, #\offset, MUL VL] */
 .macro _sve_ldr_v nz, nxbase, offset=0
-	_sve_check_zreg \nz
-	_check_general_reg \nxbase
-	_check_num (\offset), -0x100, 0xff
-	.inst	0x85804000			\
-		| (\nz)				\
-		| ((\nxbase) << 5)		\
-		| (((\offset) & 7) << 10)	\
-		| (((\offset) & 0x1f8) << 13)
+	.arch_extension sve
+	ldr	z\nz, [X\nxbase, #\offset, MUL VL]
 .endm
 
 /* STR (predicate): STR P\np, [X\nxbase, #\offset, MUL VL] */
 .macro _sve_str_p np, nxbase, offset=0
-	_sve_check_preg \np
-	_check_general_reg \nxbase
-	_check_num (\offset), -0x100, 0xff
-	.inst	0xe5800000			\
-		| (\np)				\
-		| ((\nxbase) << 5)		\
-		| (((\offset) & 7) << 10)	\
-		| (((\offset) & 0x1f8) << 13)
+	.arch_extension sve
+	str	p\np, [X\nxbase, #\offset, MUL VL]
 .endm
 
 /* LDR (predicate): LDR P\np, [X\nxbase, #\offset, MUL VL] */
 .macro _sve_ldr_p np, nxbase, offset=0
-	_sve_check_preg \np
-	_check_general_reg \nxbase
-	_check_num (\offset), -0x100, 0xff
-	.inst	0x85800000			\
-		| (\np)				\
-		| ((\nxbase) << 5)		\
-		| (((\offset) & 7) << 10)	\
-		| (((\offset) & 0x1f8) << 13)
+	.arch_extension sve
+	ldr p\np, [x\nxbase, #\offset, MUL VL]
 .endm
 
 /* RDVL X\nx, #\imm */
 .macro _sve_rdvl nx, imm
-	_check_general_reg \nx
-	_check_num (\imm), -0x20, 0x1f
-	.inst	0x04bf5000			\
-		| (\nx)				\
-		| (((\imm) & 0x3f) << 5)
+	.arch_extension sve
+	rdvl x\nx, #\imm
 .endm
 
 /* RDFFR (unpredicated): RDFFR P\np.B */
 .macro _sve_rdffr np
-	_sve_check_preg \np
-	.inst	0x2519f000			\
-		| (\np)
+	.arch_extension sve
+	rdffr p\np\().b
 .endm
 
 /* WRFFR P\np.B */
 .macro _sve_wrffr np
-	_sve_check_preg \np
-	.inst	0x25289000			\
-		| ((\np) << 5)
+	.arch_extension sve
+	wrffr p\np\().b
 .endm
 
 /* PFALSE P\np.B */
 .macro _sve_pfalse np
-	_sve_check_preg \np
-	.inst	0x2518e400			\
-		| (\np)
+	.arch_extension sve
+	pfalse	p\np\().b
 .endm
 
 /* SME instruction encodings for non-SME-capable assemblers */
-- 
2.30.2


