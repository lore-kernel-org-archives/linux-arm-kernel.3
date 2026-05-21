Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C584CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 13:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DsTDvTP8+/Rb3ztnh/cSbJ4VFOOGCIDm5GZwEObYyZ8=; b=W9tF8XE0A59RxpMUqoLbxXFzBX
	l4bpUgxpa6q3MMTwcuC8tLEHbQMQTP28IAwjK05z9BMIqqODLR2CRaXt4mFGMDm8BGiCH6sZKMzAn
	/sbdpR6DrRZrGPUWcYt4EhEs5xhGLp5W+kThUCPh/u3p/9mXwGwRz8s9GO8y3ANgEGxkaCZWoVCNd
	uyFm8l3zr9lMkOUx6sm3YT41WW5L0Bv6GzlVmaRc2GPqZKBHpAFSwfGlWi0xX0NxsB4TMGnPhELAK
	nT9xPvq4xmpLv5hdC1oeVvitDHPVKVaaLCLo6Rv9+3Ewn/Lt/13h+BZtnYtX/bSkj9t3WwAj3tYQ5
	I1kqGDxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3Q6-00000007s84-0Jve;
	Thu, 21 May 2026 13:26:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3Pq-00000007rus-2hAi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 13:26:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 327291C00;
	Thu, 21 May 2026 06:26:16 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EBE7C3F7B4;
	Thu, 21 May 2026 06:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779369981; bh=kYdhN/MlUx+0O0SIVY7aJPIl6AU8mwgy1D2BewCH+ak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m38GDavRblkVeRCA08ta2DxID1YgmY9tCbpV/Dh1PZg1+He61CpO9eEtfGFRaFzpm
	 PJJS/FHxoZzHCc7L3qjSbxMYg0RovtJRg5aBYS0r6iEhHBk71o2tofTiezkd4e1+Pd
	 ZaVlIJOCdWSM5Ih0zYWcES2rlcPsoFWUO4eMZLfk=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	tabba@google.com,
	will@kernel.org
Subject: [PATCH 07/18] arm64: fpsimd: Use assembler for SVE instructions
Date: Thu, 21 May 2026 14:25:45 +0100
Message-Id: <20260521132556.584676-8-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260521132556.584676-1-mark.rutland@arm.com>
References: <20260521132556.584676-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_062622_814245_ECD84832 
X-CRM114-Status: UNSURE (   8.92  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/fpsimdmacros.h | 64 +++++++--------------------
 1 file changed, 16 insertions(+), 48 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimdmacros.h b/arch/arm64/include/asm/fpsimdmacros.h
index adf33d2da40c3..1122eea6daacf 100644
--- a/arch/arm64/include/asm/fpsimdmacros.h
+++ b/arch/arm64/include/asm/fpsimdmacros.h
@@ -99,85 +99,53 @@
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


