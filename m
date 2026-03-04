Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF79AEDEC1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 07:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bg7n45l3BhxjQl2mgK6tZyeAOE3I5YycolIzoCC4NDY=; b=LBbJtXTpOCQcnkNPWhmtn9mC2y
	R0y2erCBZQAYmF0bk2HFugCl1filRAFowkL5M2f6mNppbGYiHw9+FnxxcROlmzl+FkP/XXn9E79jF
	CxaaxS40rwFVDXOaD3Sq5FXbzVVp1netpX1VfJTCMUjklYNewBRhGB1q9UMowlAkSy90SKxiOniTU
	ytiV37jprFnBn2GD/roLVcrMoFqLbu/b7CbdWiHbgpDu9X5l3NJI3NZ2DeCD08VKZGaslkYCnCQKa
	/U+GuazU55ROwQ0TIKNLaE99e5YkH2wWc/yvrNwEJ7NxtgDu9HyYjkyNxcve6QWKexD36qAmbv8tG
	BrqdNfvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgyw-0000000GeHG-2JkS;
	Wed, 04 Mar 2026 07:49:22 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgyr-0000000Ge91-2VaJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 07:49:19 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772610555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bg7n45l3BhxjQl2mgK6tZyeAOE3I5YycolIzoCC4NDY=;
	b=lTOD78Xe94uc1KdWphFN02t8RRANHlqTV+ltXDRfp88yRt+1aIhBO4PYUjTCOqo6c+L9bg
	jmaAbSdKVYJq5zS+tSlawyW9Q+NOflyF6BMQ4E/ARa9Nc/k7aTdv/iIEW+fgsTsjOTBeB+
	pqNaBN2ZdPOSINd2p+kyW83xKMSq4yJcABWiLSWzTSZQKA5oP2AsNW/jDNnjNEyy0mCPvC
	ozz8c2va6gxS17ckMi6wgp4b3FgLAVwrmCNzTErnG9r2qlS44+e42Mv0LJe0OFi4dRnWL+
	dl0ZYar8Z8OgutWi40Vte94dZZIZe/1X6Hrcx3Rc+y2V4+vvLJxCxrseelo7vA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772610555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bg7n45l3BhxjQl2mgK6tZyeAOE3I5YycolIzoCC4NDY=;
	b=g73UgvgnqZt+77yUZp05qYt8zKLP2434x0orfQ+2QiuTsIJXxk3UcM5PQXd5xMNFuAAiwq
	dKJG/IABFLN8ScAA==
Date: Wed, 04 Mar 2026 08:49:06 +0100
Subject: [PATCH v6 09/14] sparc64: vdso: Introduce vdso/processor.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-vdso-sparc64-generic-2-v6-9-d8eb3b0e1410@linutronix.de>
References: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
In-Reply-To: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>, 
 Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772610551; l=4546;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=MNZEUW6M8syIcj66jnZDrROQra2sbKC2bYbyN7iI9dE=;
 b=17XaTEXthlAZd+cHLsVCZsZ7RGr32B6aj0u9EBT6lr2dChc81D5X3sAveJ7v3v/7jDkCGypoW
 yIIPmzALosvDvosr77dMJ4acqURTb45wGP4zJdwYp90fuxyv6epxy/H
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_234917_822124_BE55CEBA 
X-CRM114-Status: GOOD (  16.04  )
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

The generic vDSO library expects a vdso/processor.h with an definition of
cpu_relax().

Split out cpu_relax() into this dedicated header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
Acked-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/processor.h      |  3 +++
 arch/sparc/include/asm/processor_32.h   |  2 --
 arch/sparc/include/asm/processor_64.h   | 25 --------------------
 arch/sparc/include/asm/vdso/processor.h | 41 +++++++++++++++++++++++++++++++++
 4 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/arch/sparc/include/asm/processor.h b/arch/sparc/include/asm/processor.h
index 18295ea625dd..e34de956519a 100644
--- a/arch/sparc/include/asm/processor.h
+++ b/arch/sparc/include/asm/processor.h
@@ -1,6 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef ___ASM_SPARC_PROCESSOR_H
 #define ___ASM_SPARC_PROCESSOR_H
+
+#include <asm/vdso/processor.h>
+
 #if defined(__sparc__) && defined(__arch64__)
 #include <asm/processor_64.h>
 #else
diff --git a/arch/sparc/include/asm/processor_32.h b/arch/sparc/include/asm/processor_32.h
index ba8b70ffec08..a074d313f4f8 100644
--- a/arch/sparc/include/asm/processor_32.h
+++ b/arch/sparc/include/asm/processor_32.h
@@ -91,8 +91,6 @@ unsigned long __get_wchan(struct task_struct *);
 extern struct task_struct *last_task_used_math;
 int do_mathemu(struct pt_regs *regs, struct task_struct *fpt);
 
-#define cpu_relax()	barrier()
-
 extern void (*sparc_idle)(void);
 
 #endif
diff --git a/arch/sparc/include/asm/processor_64.h b/arch/sparc/include/asm/processor_64.h
index 321859454ca4..485070495263 100644
--- a/arch/sparc/include/asm/processor_64.h
+++ b/arch/sparc/include/asm/processor_64.h
@@ -182,31 +182,6 @@ unsigned long __get_wchan(struct task_struct *task);
 #define KSTK_EIP(tsk)  (task_pt_regs(tsk)->tpc)
 #define KSTK_ESP(tsk)  (task_pt_regs(tsk)->u_regs[UREG_FP])
 
-/* Please see the commentary in asm/backoff.h for a description of
- * what these instructions are doing and how they have been chosen.
- * To make a long story short, we are trying to yield the current cpu
- * strand during busy loops.
- */
-#ifdef	BUILD_VDSO
-#define	cpu_relax()	asm volatile("\n99:\n\t"			\
-				     "rd	%%ccr, %%g0\n\t"	\
-				     "rd	%%ccr, %%g0\n\t"	\
-				     "rd	%%ccr, %%g0\n\t"	\
-				     ::: "memory")
-#else /* ! BUILD_VDSO */
-#define cpu_relax()	asm volatile("\n99:\n\t"			\
-				     "rd	%%ccr, %%g0\n\t"	\
-				     "rd	%%ccr, %%g0\n\t"	\
-				     "rd	%%ccr, %%g0\n\t"	\
-				     ".section	.pause_3insn_patch,\"ax\"\n\t"\
-				     ".word	99b\n\t"		\
-				     "wr	%%g0, 128, %%asr27\n\t"	\
-				     "nop\n\t"				\
-				     "nop\n\t"				\
-				     ".previous"			\
-				     ::: "memory")
-#endif
-
 /* Prefetch support.  This is tuned for UltraSPARC-III and later.
  * UltraSPARC-I will treat these as nops, and UltraSPARC-II has
  * a shallower prefetch queue than later chips.
diff --git a/arch/sparc/include/asm/vdso/processor.h b/arch/sparc/include/asm/vdso/processor.h
new file mode 100644
index 000000000000..f7a9adc807f7
--- /dev/null
+++ b/arch/sparc/include/asm/vdso/processor.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_SPARC_VDSO_PROCESSOR_H
+#define _ASM_SPARC_VDSO_PROCESSOR_H
+
+#include <linux/compiler.h>
+
+#if defined(__arch64__)
+
+/* Please see the commentary in asm/backoff.h for a description of
+ * what these instructions are doing and how they have been chosen.
+ * To make a long story short, we are trying to yield the current cpu
+ * strand during busy loops.
+ */
+#ifdef	BUILD_VDSO
+#define	cpu_relax()	asm volatile("\n99:\n\t"			\
+				     "rd	%%ccr, %%g0\n\t"	\
+				     "rd	%%ccr, %%g0\n\t"	\
+				     "rd	%%ccr, %%g0\n\t"	\
+				     ::: "memory")
+#else /* ! BUILD_VDSO */
+#define cpu_relax()	asm volatile("\n99:\n\t"			\
+				     "rd	%%ccr, %%g0\n\t"	\
+				     "rd	%%ccr, %%g0\n\t"	\
+				     "rd	%%ccr, %%g0\n\t"	\
+				     ".section	.pause_3insn_patch,\"ax\"\n\t"\
+				     ".word	99b\n\t"		\
+				     "wr	%%g0, 128, %%asr27\n\t"	\
+				     "nop\n\t"				\
+				     "nop\n\t"				\
+				     ".previous"			\
+				     ::: "memory")
+#endif /* BUILD_VDSO */
+
+#else /* ! __arch64__ */
+
+#define cpu_relax()	barrier()
+
+#endif /* __arch64__ */
+
+#endif /* _ASM_SPARC_VDSO_PROCESSOR_H */

-- 
2.53.0


