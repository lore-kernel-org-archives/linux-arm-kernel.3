Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89670CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OR5Q4ZuRkIA741qF/DuLi5z3bNd2XCtlxY+P3oghy5c=; b=gvhSu7+1kzxhTGXEzjoNoxuId+
	Wc3eRLZAmLPGG0KIq6dyNTa2re2IJoac71Pl0J90odLM39+Pwhvm8LpkojtpNImc8j5A19TkO25VY
	/Z1O1ClQopoPLj+6bdvMoFgCGQ/vrtVGPc4hp5vJHxyeg6KY9gu4BWTVMnUIFGJ2REJktOX9ypsNL
	ZYfpkU2SKBZntuMAMZ2QYKMu1S1O7I9MvJ0y7sxwfzkWPAoaEjR8nVhOIs5ojcOmFwZsaHVGGZvmr
	dTbx3xcZssCUsicWNIjkZURWWX37nyfdhcv0LfBSqyhJepvoC4QFkxL/6F0c+IM2863PPZpWj9IgF
	Iwt6rr9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwpT-0000000FFID-108W;
	Thu, 06 Nov 2025 10:02:55 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwp7-0000000FEoT-16dF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:02:35 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OR5Q4ZuRkIA741qF/DuLi5z3bNd2XCtlxY+P3oghy5c=;
	b=ewORpPSINxIarWqzqFOPKYxCR5amHys/rNImmWUbHAfd1+8IDKDOripwkY28a87y5Xs328
	NjocchTp9rSgtLXsCNZHZufHLHc+cIc5ws2zTCj1P2xwI2iferEnfCeg1sntZjX1N/xPti
	6PkdKshrMEXlAi4/QJvrK1E/wFKYrf6F2l14ozqLalJFBOnhpnU7KFiBohyeT9mi04z8at
	Toy1Grq8wT93zeAKhI/19J334TPF5WWXSMbwCga+fDt9swwN+CnZs3/7P1LzzexThZaxi2
	Cx5PkQUSiCkeklJ9/6ZV6tLzHogY7rY3KsBzGnTMhlL49EY231g8ohVvr4dRrA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OR5Q4ZuRkIA741qF/DuLi5z3bNd2XCtlxY+P3oghy5c=;
	b=Ehu4Nnp2Jx/jJ89XmjS0TU0ZyMLmT/lUH5Zx/GFj9Q675+Ldwma6OKZWEBP+c/4wrxokqL
	SSllEL7irDXyC2Bw==
Date: Thu, 06 Nov 2025 11:02:21 +0100
Subject: [PATCH v5 28/34] sparc64: vdso: Move syscall fallbacks into header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251106-vdso-sparc64-generic-2-v5-28-97ff2b6542f7@linutronix.de>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
In-Reply-To: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
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
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=5844;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=54fVsevF6wJL94FjT3o2LBMAQrSAU/5OtqL2hTA5L+g=;
 b=GE+z1lzIrwo6b9gotEsWAVqlfFV/4lWk7aBHYKZHquK3Dlqf241AfhwoKqK4g7J0bxE2Ol25i
 Y121f7OC6ohCFV3kG7ZDMAXTJEs9e9vt6q6U8tk2NEC9a8HdHgDN53J
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_020233_487159_243CD5F1 
X-CRM114-Status: GOOD (  11.98  )
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

The generic vDSO libraries expected the syscall fallbacks in
asm/vdso/gettimeofday.h. To prepare the adoption of the generic library,
move the existing functions there.

While at it, rename them so they match what the generic library expects.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
Acked-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/vdso/gettimeofday.h | 50 +++++++++++++++++++++++++++++
 arch/sparc/vdso/vclock_gettime.c           | 51 ++----------------------------
 2 files changed, 52 insertions(+), 49 deletions(-)

diff --git a/arch/sparc/include/asm/vdso/gettimeofday.h b/arch/sparc/include/asm/vdso/gettimeofday.h
index 31f6505d3ab5dde9e02eca6da9182e5fb91031c4..429dc080568f59145cc0bc696060adeb60ac177a 100644
--- a/arch/sparc/include/asm/vdso/gettimeofday.h
+++ b/arch/sparc/include/asm/vdso/gettimeofday.h
@@ -6,6 +6,9 @@
 #ifndef _ASM_SPARC_VDSO_GETTIMEOFDAY_H
 #define _ASM_SPARC_VDSO_GETTIMEOFDAY_H
 
+#include <uapi/linux/time.h>
+#include <uapi/linux/unistd.h>
+
 #include <linux/types.h>
 #include <asm/vvar.h>
 
@@ -75,4 +78,51 @@ static __always_inline u64 __arch_get_hw_counter(struct vvar_data *vvar)
 		return vread_tick();
 }
 
+#ifdef	CONFIG_SPARC64
+#define SYSCALL_STRING							\
+	"ta	0x6d;"							\
+	"bcs,a	1f;"							\
+	" sub	%%g0, %%o0, %%o0;"					\
+	"1:"
+#else
+#define SYSCALL_STRING							\
+	"ta	0x10;"							\
+	"bcs,a	1f;"							\
+	" sub	%%g0, %%o0, %%o0;"					\
+	"1:"
+#endif
+
+#define SYSCALL_CLOBBERS						\
+	"f0", "f1", "f2", "f3", "f4", "f5", "f6", "f7",			\
+	"f8", "f9", "f10", "f11", "f12", "f13", "f14", "f15",		\
+	"f16", "f17", "f18", "f19", "f20", "f21", "f22", "f23",		\
+	"f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31",		\
+	"f32", "f34", "f36", "f38", "f40", "f42", "f44", "f46",		\
+	"f48", "f50", "f52", "f54", "f56", "f58", "f60", "f62",		\
+	"cc", "memory"
+
+static __always_inline
+long clock_gettime_fallback(clockid_t clock, struct __kernel_old_timespec *ts)
+{
+	register long num __asm__("g1") = __NR_clock_gettime;
+	register long o0 __asm__("o0") = clock;
+	register long o1 __asm__("o1") = (long) ts;
+
+	__asm__ __volatile__(SYSCALL_STRING : "=r" (o0) : "r" (num),
+			     "0" (o0), "r" (o1) : SYSCALL_CLOBBERS);
+	return o0;
+}
+
+static __always_inline
+long gettimeofday_fallback(struct __kernel_old_timeval *tv, struct timezone *tz)
+{
+	register long num __asm__("g1") = __NR_gettimeofday;
+	register long o0 __asm__("o0") = (long) tv;
+	register long o1 __asm__("o1") = (long) tz;
+
+	__asm__ __volatile__(SYSCALL_STRING : "=r" (o0) : "r" (num),
+			     "0" (o0), "r" (o1) : SYSCALL_CLOBBERS);
+	return o0;
+}
+
 #endif /* _ASM_SPARC_VDSO_GETTIMEOFDAY_H */
diff --git a/arch/sparc/vdso/vclock_gettime.c b/arch/sparc/vdso/vclock_gettime.c
index 16ac80982a00b9f965453b89a0cc111312baa9b2..e768c0b84b3420deab2f74335892d40a5b515ee7 100644
--- a/arch/sparc/vdso/vclock_gettime.c
+++ b/arch/sparc/vdso/vclock_gettime.c
@@ -13,38 +13,13 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/time.h>
 #include <linux/string.h>
 #include <asm/io.h>
-#include <asm/unistd.h>
 #include <asm/timex.h>
 #include <asm/clocksource.h>
 #include <asm/vdso/gettimeofday.h>
 #include <asm/vvar.h>
 
-#ifdef	CONFIG_SPARC64
-#define SYSCALL_STRING							\
-	"ta	0x6d;"							\
-	"bcs,a	1f;"							\
-	" sub	%%g0, %%o0, %%o0;"					\
-	"1:"
-#else
-#define SYSCALL_STRING							\
-	"ta	0x10;"							\
-	"bcs,a	1f;"							\
-	" sub	%%g0, %%o0, %%o0;"					\
-	"1:"
-#endif
-
-#define SYSCALL_CLOBBERS						\
-	"f0", "f1", "f2", "f3", "f4", "f5", "f6", "f7",			\
-	"f8", "f9", "f10", "f11", "f12", "f13", "f14", "f15",		\
-	"f16", "f17", "f18", "f19", "f20", "f21", "f22", "f23",		\
-	"f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31",		\
-	"f32", "f34", "f36", "f38", "f40", "f42", "f44", "f46",		\
-	"f48", "f50", "f52", "f54", "f56", "f58", "f60", "f62",		\
-	"cc", "memory"
-
 /*
  * Compute the vvar page's address in the process address space, and return it
  * as a pointer to the vvar_data.
@@ -64,28 +39,6 @@ notrace static __always_inline struct vvar_data *get_vvar_data(void)
 	return (struct vvar_data *) ret;
 }
 
-notrace static long vdso_fallback_gettime(long clock, struct __kernel_old_timespec *ts)
-{
-	register long num __asm__("g1") = __NR_clock_gettime;
-	register long o0 __asm__("o0") = clock;
-	register long o1 __asm__("o1") = (long) ts;
-
-	__asm__ __volatile__(SYSCALL_STRING : "=r" (o0) : "r" (num),
-			     "0" (o0), "r" (o1) : SYSCALL_CLOBBERS);
-	return o0;
-}
-
-notrace static long vdso_fallback_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
-{
-	register long num __asm__("g1") = __NR_gettimeofday;
-	register long o0 __asm__("o0") = (long) tv;
-	register long o1 __asm__("o1") = (long) tz;
-
-	__asm__ __volatile__(SYSCALL_STRING : "=r" (o0) : "r" (num),
-			     "0" (o0), "r" (o1) : SYSCALL_CLOBBERS);
-	return o0;
-}
-
 notrace static __always_inline u64 vgetsns(struct vvar_data *vvar)
 {
 	u64 v;
@@ -184,7 +137,7 @@ __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespec *ts)
 	/*
 	 * Unknown clock ID ? Fall back to the syscall.
 	 */
-	return vdso_fallback_gettime(clock, ts);
+	return clock_gettime_fallback(clock, ts);
 }
 int
 clock_gettime(clockid_t, struct __kernel_old_timespec *)
@@ -220,7 +173,7 @@ __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
 		}
 		return 0;
 	}
-	return vdso_fallback_gettimeofday(tv, tz);
+	return gettimeofday_fallback(tv, tz);
 }
 int
 gettimeofday(struct __kernel_old_timeval *, struct timezone *)

-- 
2.51.0


