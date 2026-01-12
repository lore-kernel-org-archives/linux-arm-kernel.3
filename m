Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0BDD25032
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 07:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n70btqrdaqToHz89ue0UZuLwgdithscXhcOFepGMlJ0=; b=M1NVeqQUa19dkBnzX4gqO7TEzU
	h8XYcJP9LZyXXl68a8qpMUalpULc+Si3Swj/K0DPhws6oMjsM2QhHjyX97mtN8SA5yxLcD9TfAVay
	m4gEqYcTCwteP36mIkD4KP9SO4kBO3Ii/DsGiXfFQpV9m4y4ajMW+Ejl1U71StufUZbdg1SVjwZqP
	yefET+1frzEc66f1FcJcZ7AjcL2R5l3UUQUqdEiPcdfJI730RF522oQkb4yXZGjlVWuBSC6xEuaPY
	eUtURzPf/Qxnal5WleYuHZrjZsBZedw1+rAzJNsitij4jWbarMjWNd7+sYyRl5O40F8URRlmgN3j0
	Mq7ivRzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCp0-00000004wLt-1Do7;
	Mon, 12 Jan 2026 07:58:42 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCow-00000004wJ0-3MPv;
	Mon, 12 Jan 2026 07:58:40 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768204715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n70btqrdaqToHz89ue0UZuLwgdithscXhcOFepGMlJ0=;
	b=w12esafE1bcBJB945wsCRt0SQ6S4GTCc60/loF2Mhj3Bu64ZDxSmvP5XXo9IztJoc1Ql0J
	13rwNXrBCbYeuhYay8ZZcwZV38NWtCx0I0/Y011gqHeF652RDDRxUgDIktavFtJr3x+tUn
	OpXwjG7OVAU7y0JKWOImEtn46TwepWUJU5S02SlSCOudxZg3jQnLJqfKr5EQMzkSsrdvBX
	WwWDylXqhQKN8l339+kFZYAaOk7KIozr5d/KO25AMklS58ITozJ2Lgjvyny8rVnO8FTj1+
	+48gK0hxjySeiJLTmnKK2pWqoUSg9cf+YLFO4p3l13OXvweR8SI52P/B1KSuhw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768204715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n70btqrdaqToHz89ue0UZuLwgdithscXhcOFepGMlJ0=;
	b=ZpHdGqMsLbaAl1s9iBHxbdPmSb6RfTVBVpJuRlPTj+/b21hkis8V0shwXQjZcnlGtKxlK3
	rmyIe4TbXpbkBSDQ==
Date: Mon, 12 Jan 2026 08:58:29 +0100
Subject: [PATCH v2 1/5] ARC: Always use SWAPE instructions and enable
 ARCH_USE_BUILTIN_BSWAP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260112-headers_install-config-leak-v2-1-4d8084444603@linutronix.de>
References: <20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de>
In-Reply-To: <20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de>
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768204713; l=6304;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=136J/A8/BFtasnT1KZrwlQiIeplv7/+39atWV+MjCN4=;
 b=lc4K5vnhK8ddFcTT+Uppc7Eczf/y3itQq+LJQWzR3frL3LvAep2rDmm5zTnbgn7AvFILMpcPs
 uojHetN6A1QAuBwVUX8z3tuaYokcGEBoFrFdYRI0AMRSKozKT3X1o79
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_235839_120310_D0C3CB89 
X-CRM114-Status: GOOD (  18.11  )
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

Since commit 67a697e7576 ("ARC: retire ARC750 support") all supported
CPUs have the 'swape' instruction.

Replace the custom logic with ARCH_USE_BUILTIN_BSWAP which makes
use of 'swape'.

As as side-effect, remove a leak of an internal kconfig symbol through
the UAPI headers.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/lkml/0ae2688a-5a22-405b-adaf-9b5ad712b245@app.fastmail.com/
Suggested-by: Vineet Gupta <vgupta@kernel.org>
Link: https://lore.kernel.org/lkml/a033a402-e3c5-4982-9fff-b6a4c55817ae@kernel.org/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arc/Kconfig                 |  6 +--
 arch/arc/Makefile                |  3 +-
 arch/arc/include/uapi/asm/swab.h | 99 ----------------------------------------
 scripts/headers_install.sh       |  1 -
 4 files changed, 2 insertions(+), 107 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index f27e6b90428e..390a14360689 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -16,6 +16,7 @@ config ARC
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_NEED_CMPXCHG_1_EMU
 	select ARCH_SUPPORTS_ATOMIC_RMW if ARC_HAS_LLSC
+	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_32BIT_OFF_T
 	select BUILDTIME_TABLE_SORT
 	select GENERIC_BUILTIN_DTB
@@ -121,7 +122,6 @@ choice
 config ARC_CPU_770
 	bool "ARC770"
 	depends on ISA_ARCOMPACT
-	select ARC_HAS_SWAPE
 	help
 	  Support for ARC770 core introduced with Rel 4.10 (Summer 2011)
 	  This core has a bunch of cool new features:
@@ -340,10 +340,6 @@ config ARC_HAS_LLSC
 	default y
 	depends on !ARC_CANT_LLSC
 
-config ARC_HAS_SWAPE
-	bool "Insn: SWAPE (endian-swap)"
-	default y
-
 if ISA_ARCV2
 
 config ARC_USE_UNALIGNED_MEM_ACCESS
diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 0c5e6e6314f2..868805ffcfea 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -9,7 +9,7 @@ ifeq ($(CROSS_COMPILE),)
 CROSS_COMPILE := $(call cc-cross-prefix, arc-linux- arceb-linux- arc-linux-gnu-)
 endif
 
-cflags-y	+= -fno-common -pipe -fno-builtin -mmedium-calls -D__linux__
+cflags-y	+= -fno-common -pipe -fno-builtin -mmedium-calls -mswape -D__linux__
 
 tune-mcpu-def-$(CONFIG_ISA_ARCOMPACT)	:= -mcpu=arc700
 tune-mcpu-def-$(CONFIG_ISA_ARCV2)	:= -mcpu=hs38
@@ -41,7 +41,6 @@ endif
 cflags-y				+= -fsection-anchors
 
 cflags-$(CONFIG_ARC_HAS_LLSC)		+= -mlock
-cflags-$(CONFIG_ARC_HAS_SWAPE)		+= -mswape
 
 ifdef CONFIG_ISA_ARCV2
 
diff --git a/arch/arc/include/uapi/asm/swab.h b/arch/arc/include/uapi/asm/swab.h
deleted file mode 100644
index 8d1f1ef44ba7..000000000000
--- a/arch/arc/include/uapi/asm/swab.h
+++ /dev/null
@@ -1,99 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * Copyright (C) 2004, 2007-2010, 2011-2012 Synopsys, Inc. (www.synopsys.com)
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * vineetg: May 2011
- *  -Support single cycle endian-swap insn in ARC700 4.10
- *
- * vineetg: June 2009
- *  -Better htonl implementation (5 instead of 9 ALU instructions)
- *  -Hardware assisted single cycle bswap (Use Case of ARC custom instrn)
- */
-
-#ifndef __ASM_ARC_SWAB_H
-#define __ASM_ARC_SWAB_H
-
-#include <linux/types.h>
-
-/* Native single cycle endian swap insn */
-#ifdef CONFIG_ARC_HAS_SWAPE
-
-#define __arch_swab32(x)		\
-({					\
-	unsigned int tmp = x;		\
-	__asm__(			\
-	"	swape	%0, %1	\n"	\
-	: "=r" (tmp)			\
-	: "r" (tmp));			\
-	tmp;				\
-})
-
-#else
-
-/* Several ways of Endian-Swap Emulation for ARC
- * 0: kernel generic
- * 1: ARC optimised "C"
- * 2: ARC Custom instruction
- */
-#define ARC_BSWAP_TYPE	1
-
-#if (ARC_BSWAP_TYPE == 1)		/******* Software only ********/
-
-/* The kernel default implementation of htonl is
- *		return  x<<24 | x>>24 |
- *		 (x & (__u32)0x0000ff00UL)<<8 | (x & (__u32)0x00ff0000UL)>>8;
- *
- * This generates 9 instructions on ARC (excluding the ld/st)
- *
- * 8051fd8c:	ld     r3,[r7,20]	; Mem op : Get the value to be swapped
- * 8051fd98:	asl    r5,r3,24		; get  3rd Byte
- * 8051fd9c:	lsr    r2,r3,24		; get  0th Byte
- * 8051fda0:	and    r4,r3,0xff00
- * 8051fda8:	asl    r4,r4,8		; get 1st Byte
- * 8051fdac:	and    r3,r3,0x00ff0000
- * 8051fdb4:	or     r2,r2,r5		; combine 0th and 3rd Bytes
- * 8051fdb8:	lsr    r3,r3,8		; 2nd Byte at correct place in Dst Reg
- * 8051fdbc:	or     r2,r2,r4		; combine 0,3 Bytes with 1st Byte
- * 8051fdc0:	or     r2,r2,r3		; combine 0,3,1 Bytes with 2nd Byte
- * 8051fdc4:	st     r2,[r1,20]	; Mem op : save result back to mem
- *
- * Joern suggested a better "C" algorithm which is great since
- * (1) It is portable to any architecture
- * (2) At the same time it takes advantage of ARC ISA (rotate intrns)
- */
-
-#define __arch_swab32(x)					\
-({	unsigned long __in = (x), __tmp;			\
-	__tmp = __in << 8 | __in >> 24; /* ror tmp,in,24 */	\
-	__in = __in << 24 | __in >> 8; /* ror in,in,8 */	\
-	__tmp ^= __in;						\
-	__tmp &= 0xff00ff;					\
-	__tmp ^ __in;						\
-})
-
-#elif (ARC_BSWAP_TYPE == 2)	/* Custom single cycle bswap instruction */
-
-#define __arch_swab32(x)						\
-({									\
-	unsigned int tmp = x;						\
-	__asm__(							\
-	"	.extInstruction	bswap, 7, 0x00, SUFFIX_NONE, SYNTAX_2OP	\n"\
-	"	bswap  %0, %1						\n"\
-	: "=r" (tmp)							\
-	: "r" (tmp));							\
-	tmp;								\
-})
-
-#endif /* ARC_BSWAP_TYPE=zzz */
-
-#endif /* CONFIG_ARC_HAS_SWAPE */
-
-#if !defined(__STRICT_ANSI__) || defined(__KERNEL__)
-#define __SWAB_64_THRU_32__
-#endif
-
-#endif
diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 0e4e939efc94..727f7f82c2c7 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -70,7 +70,6 @@ configs=$(sed -e '
 #
 # The format is <file-name>:<CONFIG-option> in each line.
 config_leak_ignores="
-arch/arc/include/uapi/asm/swab.h:CONFIG_ARC_HAS_SWAPE
 arch/arm/include/uapi/asm/ptrace.h:CONFIG_CPU_ENDIAN_BE8
 arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_NO
 arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_SUPPORT

-- 
2.52.0


