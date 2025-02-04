Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85899C02197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 12:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWzbODtLNCvv1Ul40EmzaWaPKIdRBRE82K41Ep5Egkc=; b=vqcxDBGJBdF1iDu6eqJxnS3H25
	5KLxI4beSOT+4l3QSujAEzC0ukJNoK16kkuUH+dTG4hr0AMYvjbYQLZDPh3bv2nf11AlveMx4TUil
	SMMbtNUghIuagCKAlMyyMzEk+WoN9woiwpzQ6yoqtFg0MD25d0tLpD+fhkG2KAfEWQTPQU4iYEZ7a
	pD4wju4q9AieywJDaxpa6DiD/Wpkd8u7NEGCNReROAFWLA2GaIyLZAl6NUK4yL451xFPMMz3GNCuC
	yJvcifHBF4KY9clbW+S0AGghT9ZNunCx3gDhXjBsdws/xsQP2scjrJommGUuo0+xcQu2HkWFoppXg
	mjaPxG6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHp8-00000000O0X-4B9a;
	Tue, 04 Feb 2025 12:14:39 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHgw-00000000LIp-2en2;
	Tue, 04 Feb 2025 12:06:13 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738670767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWzbODtLNCvv1Ul40EmzaWaPKIdRBRE82K41Ep5Egkc=;
	b=YqFvxt1YwBR6CYaDHmxpjmsOSlXhIj2Xq9QRUU2O01AjZgAelgzTHmNrrJz/iOpy3OEE3x
	f9zxrIJfA6bKSmteGdt4khX/C5ww2FIorQj74sIJ1eqsM5r9sfNsM/ePRzkH52T+rpgBy9
	m2N/XOmCs2UJTWlnz2twiF+KrvEqcGUdKaCcA+ER71zSXLOid6rFLenNcbHBXP9i3Hh0Ai
	Tzxmu8vXwY1UO/hZiBf3BP2tQtXElgz/VUXteELX+8zqjmZBXfp1dSV3IEirVF/Z0LojOf
	SH4rydHU+/+ZAPsl7RQa924izKZy25N/1AhG2qvfOsawtxLDcOV3QX2hj2PScw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738670767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWzbODtLNCvv1Ul40EmzaWaPKIdRBRE82K41Ep5Egkc=;
	b=FOXwg3thsqFQfOdU9a18O9Iaxu9WrgGvvKRSclGv/I0SKMr0BjtN1ng9gynSC5X+132eYk
	iOcT0qGzU8wlfECw==
Date: Tue, 04 Feb 2025 13:05:36 +0100
Subject: [PATCH v3 04/18] vdso: Rename included Makefile
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250204-vdso-store-rng-v3-4-13a4669dfc8c@linutronix.de>
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
In-Reply-To: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, 
 Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-csky@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738670761; l=8154;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=B3n9HaVUIM0ttqAmIMKk34exnf1W/cPAoDX+ImH3r3Q=;
 b=EPiMeazyKKiscKtnMAnyzzlWXX6Cs9adlUmAxt5p/Vrfpb8n9hcWU+BJ9PJ8TrDNrqbnuN+yW
 E6ruDwqXnCmAjL01ZQqgNMwGhBXGHns4KCu9Ek0+Refjemr7SFyuZHO
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_040610_987331_C2B4629D 
X-CRM114-Status: GOOD (  13.81  )
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

As the Makefile is included into other Makefiles it can not be used to
define objects to be built from the current source directory.
However the generic datastore will introduce such a local source file.
Rename the included Makefile so it is clear how it is to be used and to
make room for a regular Makefile in lib/vdso/.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/vdso/Makefile                  | 2 +-
 arch/arm64/kernel/vdso/Makefile         | 2 +-
 arch/arm64/kernel/vdso32/Makefile       | 2 +-
 arch/csky/kernel/vdso/Makefile          | 2 +-
 arch/loongarch/vdso/Makefile            | 2 +-
 arch/mips/vdso/Makefile                 | 2 +-
 arch/parisc/kernel/vdso32/Makefile      | 2 +-
 arch/parisc/kernel/vdso64/Makefile      | 2 +-
 arch/powerpc/kernel/vdso/Makefile       | 2 +-
 arch/riscv/kernel/vdso/Makefile         | 2 +-
 arch/s390/kernel/vdso32/Makefile        | 2 +-
 arch/s390/kernel/vdso64/Makefile        | 2 +-
 arch/x86/entry/vdso/Makefile            | 2 +-
 lib/vdso/{Makefile => Makefile.include} | 0
 14 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
index 8a306bbec4a0c4d4b6580fe88187faf9f5422eed..cb044bfd145d10b5bf840d31900aefc8a187e5bd 100644
--- a/arch/arm/vdso/Makefile
+++ b/arch/arm/vdso/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 
 hostprogs := vdsomunge
 
diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index 35685c0360441ddb0e549ff0abe39cf4fce64071..5e27e46aa49674bb4d2186bcba548aa841116fa9 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -7,7 +7,7 @@
 #
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 
 obj-vdso := vgettimeofday.o note.o sigreturn.o vgetrandom.o vgetrandom-chacha.o
 
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 25a2cb6317f3592179dded21218e81036a8f67bc..f2dfdc7dc8185bc045907283b68ab18fed980312 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -3,7 +3,7 @@
 # Makefile for vdso32
 #
 
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 
 # Same as cc-*option, but using CC_COMPAT instead of CC
 ifeq ($(CONFIG_CC_IS_CLANG), y)
diff --git a/arch/csky/kernel/vdso/Makefile b/arch/csky/kernel/vdso/Makefile
index 069ef0b17fe5235918a6aa13aa120857bbbf3faf..a3042287a0707a9aa5d512441311c3deffff2ceb 100644
--- a/arch/csky/kernel/vdso/Makefile
+++ b/arch/csky/kernel/vdso/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 
 # Symbols present in the vdso
 vdso-syms  += rt_sigreturn
diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index fdde1bcd4e2663bd400dcc6becc4261b7d5dce3a..1c26147aff7018d190c49aebf6012f6780770dd2 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -2,7 +2,7 @@
 # Objects to go into the VDSO.
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 
 obj-vdso-y := elf.o vgetcpu.o vgettimeofday.o vgetrandom.o \
               vgetrandom-chacha.o sigreturn.o
diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index b289b2c1b2946057c29cde8ee456b311fa25d448..fb4c493aaffa904d51f68b483ab83256a2e358e4 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -2,7 +2,7 @@
 # Objects to go into the VDSO.
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 
 obj-vdso-y := elf.o vgettimeofday.o sigreturn.o
 
diff --git a/arch/parisc/kernel/vdso32/Makefile b/arch/parisc/kernel/vdso32/Makefile
index 288f8b85978fb20acd5d95ca9f44edf3e6f93d6c..4ee8d17da229b2d768ec8d8633197c91526f0f94 100644
--- a/arch/parisc/kernel/vdso32/Makefile
+++ b/arch/parisc/kernel/vdso32/Makefile
@@ -1,5 +1,5 @@
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 
 KCOV_INSTRUMENT := n
 
diff --git a/arch/parisc/kernel/vdso64/Makefile b/arch/parisc/kernel/vdso64/Makefile
index bc5d9553f3112a4bcb218d6e351159b55feea17f..c63f4069170f465079e5eed7208f9f64e866b245 100644
--- a/arch/parisc/kernel/vdso64/Makefile
+++ b/arch/parisc/kernel/vdso64/Makefile
@@ -1,5 +1,5 @@
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 
 KCOV_INSTRUMENT := n
 
diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 0e3ed6fb199fff7ad25aadca76e3a49a283b3f94..e8824f93332610db259b303c63957436bfef4191 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -3,7 +3,7 @@
 # List of files in the vdso, has to be asm only for now
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 
 obj-vdso32 = sigtramp32-32.o gettimeofday-32.o datapage-32.o cacheflush-32.o note-32.o getcpu-32.o
 obj-vdso64 = sigtramp64-64.o gettimeofday-64.o datapage-64.o cacheflush-64.o note-64.o getcpu-64.o
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 9a1b555e87331fb288eff12470ad498199d7cf24..ad73607abc2808af2cd1aaf839b227c78d7a1769 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -2,7 +2,7 @@
 # Copied from arch/tile/kernel/vdso/Makefile
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 # Symbols present in the vdso
 vdso-syms  = rt_sigreturn
 ifdef CONFIG_64BIT
diff --git a/arch/s390/kernel/vdso32/Makefile b/arch/s390/kernel/vdso32/Makefile
index 2c5afb88d298263a70abbe1e4f903a95c0389225..1e4ddd1a683ff84492f0f4b48d0efa00688129c2 100644
--- a/arch/s390/kernel/vdso32/Makefile
+++ b/arch/s390/kernel/vdso32/Makefile
@@ -2,7 +2,7 @@
 # List of files in the vdso
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 obj-vdso32 = vdso_user_wrapper-32.o note-32.o
 
 # Build rules
diff --git a/arch/s390/kernel/vdso64/Makefile b/arch/s390/kernel/vdso64/Makefile
index ad206f2068d8c0fa1d3319cc1f4dfd27f61d0882..d8f0df74280960cb351154a8a73b4f7fe83a9125 100644
--- a/arch/s390/kernel/vdso64/Makefile
+++ b/arch/s390/kernel/vdso64/Makefile
@@ -2,7 +2,7 @@
 # List of files in the vdso
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 obj-vdso64 = vdso_user_wrapper.o note.o vgetrandom-chacha.o
 obj-cvdso64 = vdso64_generic.o getcpu.o vgetrandom.o
 VDSO_CFLAGS_REMOVE := -pg $(CC_FLAGS_FTRACE) $(CC_FLAGS_EXPOLINE)
diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index c9216ac4fb1eb8c1e5bc5e33b41e9e40c7924cbf..1c0072336e66177453f8bbad743c6a2ee1f1849d 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -4,7 +4,7 @@
 #
 
 # Include the generic Makefile to check the built vDSO:
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 
 # Files to link into the vDSO:
 vobjs-y := vdso-note.o vclock_gettime.o vgetcpu.o vgetrandom.o vgetrandom-chacha.o
diff --git a/lib/vdso/Makefile b/lib/vdso/Makefile.include
similarity index 100%
rename from lib/vdso/Makefile
rename to lib/vdso/Makefile.include

-- 
2.48.1


