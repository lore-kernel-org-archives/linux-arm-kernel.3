Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE14CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 06:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrBALLudUMMQIpB9Jb++BwmBRlfN0yHG1/njX6fnTE0=; b=IdOIDv/6f0TZOPRT2d/bb1//Ts
	frmtnXFgyv2hBc7EWebP7ZhM0aX7yho3cEo5rYo5WKJOZvYupCeBJiiSXJIai7AAno4q+5Mf6hTh9
	08HIMoeCUIgx5VTaMQyajYfHX0uKSoXUErmCjMD+Mtkh2npN/L3HpCnIqW55dajMxTcD5QX0/Pacl
	IlEnDUjzm9jQX/BjCUVwpd8cyCp2nvlhXu6x7N1TK67O+slq5trNIYp+JCe8gPIpzAqvq6DXvEp8G
	58y7eQ0Y9IGeK3+cWS95ok7/tbDjoCw3U5aLlefywGcaUXlMm+P6oKOnjGhS2Q053sBtRkZiiA/+8
	X+bIt7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnMF-0000000AjL8-2R14;
	Tue, 26 Aug 2025 06:40:39 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn0i-0000000AfCw-1FJ5;
	Tue, 26 Aug 2025 06:18:26 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DrBALLudUMMQIpB9Jb++BwmBRlfN0yHG1/njX6fnTE0=;
	b=s4Tv7+zxFO1UuAQBOJqY36fYzoMoq9HBwuIpEoBOQcWaZh9/ewd4GAmLh1SU0pUebpqr7O
	IrbBTzCLj7CJDuzlV6Dcdr1OqFm6SyO764o/62pnvhkTGUXW7ugMG+bh1U2I/2k0NNBSr5
	OP1XpFRZEaXTaVFqIq3YdSg5+qsRfdKUKvpdsuwozMooSfzSGI0VUbRnkjOqSx5qOrar6I
	ypdEH+UclFWViex+hKIMMrHA9akYZJ7i5W7/rVbBGGVIoe66Tmy8jOSesu8OQcaEiRtLvM
	BHYdoRiODg0CG8wUQD0HRSdvaeLU921bXP6hDATICdIR91DBtxAh0Kw0aN0s1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DrBALLudUMMQIpB9Jb++BwmBRlfN0yHG1/njX6fnTE0=;
	b=aMy3eGdfoQdV0esGEjqNzj2T+GNVN9Gu5aP0E8xfdTY9CE2D/Ql6h41CsmHASq33jrTvgS
	d2ksM8s+JfbrYcAg==
Date: Tue, 26 Aug 2025 08:17:10 +0200
Subject: [PATCH 07/11] vdso: Drop kconfig GENERIC_VDSO_32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250826-vdso-cleanups-v1-7-d9b65750e49f@linutronix.de>
References: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
In-Reply-To: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nam Cao <namcao@linutronix.de>, 
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=1702;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=MIu9l2pTXbhJrvGPCmWjImoXUcbBkNjVmM+9aAFDkec=;
 b=VT2YYQvzHfODm57uAqR09c1duKjkkmGSVqmCVlLdgGb/ARCoX9KqMLFcxG4POgZTTs3Rm7rqY
 RTH8Lz9nPvLBWpZeMT5QB55ugWOPWVYU1mHssRVmDUpj+5tIKw9H+EU
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_231824_538785_98D72BCC 
X-CRM114-Status: UNSURE (   7.52  )
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

This configuration is never used.

Remove it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/mm/Kconfig | 1 -
 arch/x86/Kconfig    | 1 -
 lib/vdso/Kconfig    | 7 -------
 3 files changed, 9 deletions(-)

diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 5c1023a6d78c1b4db67b2d62b71af5a79b7e701f..2347988cf6417b91d8d3580387b53e610ed49a00 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -926,7 +926,6 @@ config VDSO
 	default y if ARM_ARCH_TIMER
 	select HAVE_GENERIC_VDSO
 	select GENERIC_TIME_VSYSCALL
-	select GENERIC_VDSO_32
 	select GENERIC_GETTIMEOFDAY
 	select GENERIC_VDSO_DATA_STORE
 	help
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 58d890fe2100eb6990880bcf5ba600cdefb0a7d1..4f120070a51bd4e225256440649a2dae17025c41 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -14,7 +14,6 @@ config X86_32
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select CLKSRC_I8253
 	select CLONE_BACKWARDS
-	select GENERIC_VDSO_32
 	select HAVE_DEBUG_STACKOVERFLOW
 	select KMAP_LOCAL
 	select MODULES_USE_ELF_REL
diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index 45df764b49ad62479e6456e00c053e46131936a3..76157c26931d28327750ad53bfcae5109a29d998 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -12,13 +12,6 @@ config GENERIC_GETTIMEOFDAY
 	  Each architecture that enables this feature has to
 	  provide the fallback implementation.
 
-config GENERIC_VDSO_32
-	bool
-	depends on GENERIC_GETTIMEOFDAY && !64BIT
-	help
-	  This config option helps to avoid possible performance issues
-	  in 32 bit only architectures.
-
 config GENERIC_COMPAT_VDSO
 	bool
 	help

-- 
2.50.1


