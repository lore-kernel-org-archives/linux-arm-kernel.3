Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B66BCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+biOGKKguDUuRUAhQ0+dLthYNe28/1HU1RGsMJffvw=; b=pRgVRKIDFaycoAffbfPXrp9ZeK
	jeEa1MMcki2jPQSyfLx9Ao0Mi9YyXHL+Aa1+ShPdX6uo5kea8gqP31rFJ3MTCOFVgATn6rAO77Fr4
	bNndhEjsD3ahWzi4Fh9RuIgF3lrhSx0+H1ARDjHXnfg31n0GU3OuIX1jZQoGLMWKQe5SLdSl3rDjT
	GJzU1Yl6rpO1inof0nF5mBDJibJF1AZcnuag2LyYizgDglwkbKtjmrO9odllc9Xurd0y5kf2J1zPM
	v0rLIrQQWVcbwZ1cc7v9azvIhPrsZDQWrBglhs5NFS0SL/iER3WoHJFocwEhm8Dff0/RZatObEb/q
	MRdPhFpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyslJ-0000000Bzvy-0Ae8;
	Wed, 17 Sep 2025 14:03:57 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysjn-0000000Bxcq-0mgo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:02:26 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j+biOGKKguDUuRUAhQ0+dLthYNe28/1HU1RGsMJffvw=;
	b=Q/ql4mj7Oqha+n1+zWFMHqf6AN0NJY+yf8D5vjlijtUN7GKN76OsAHWTo+9VOy/rJHZ2IT
	4CYpfHnWdwKUM6nnKJFUpm6cpWO8kXH0qekaujtfqB+aCcrZkcxWkxzhqNXvxq6+fj0gIo
	RUKT/fQAG1ob6HEmhcZl4wuTdlo6E7wWmVmiw3iAZz+HC29hRnAmUMCqNQSh5L/l9zq1+F
	B0snSBWJgyLP//MeSZJdvLKbCEp3knyRLar+vKpkyeuXtXDCyAO84fQR1EAQsd7aoN2JM5
	LKc46ePgxXh9T9KfnzDphlGm1SnT/VASy/e640MqttQAG+3jCvBZ8f78IKHFMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j+biOGKKguDUuRUAhQ0+dLthYNe28/1HU1RGsMJffvw=;
	b=+t6hmZOfY/qlclhLwxtdQbKthvuYmaF5Oc4VwtZI8vjD3ivseTq1MjM9W5AWz+ifnnvfs1
	VODjJJD3lU6k/XCg==
Date: Wed, 17 Sep 2025 16:00:36 +0200
Subject: [PATCH v3 34/36] sparc64: vdso: Implement clock_gettime64()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-vdso-sparc64-generic-2-v3-34-3679b1bc8ee8@linutronix.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
In-Reply-To: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
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
 Sven Schnelle <svens@linux.ibm.com>, 
 Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, 
 Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=3230;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=zMIzJ15FbxyFeuQIxSk4GNU8RIcZLfNhISbA3hu5yNQ=;
 b=9BbtDwHAenbMghoU6tM/Syy/OgZuKlkxcwIxGWN87y87xZOmS4MtwmZNMkF8EXZ9HCyqVMysv
 eVjBlZHre0vACPgZ5sMHt1rPiS2p/7jwHLAT08LAfIpGHsUqzEYgjgq
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_070223_448403_98B78423 
X-CRM114-Status: GOOD (  10.77  )
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

To be y2038-safe, 32-bit userspace needs to explicitly call the 64-bit safe
time APIs.

Implement clock_gettime64() in the 32-bit vDSO.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/sparc/include/asm/vdso/gettimeofday.h | 20 ++++++++++++++++++--
 arch/sparc/vdso/vclock_gettime.c           |  8 ++++++++
 arch/sparc/vdso/vdso32/vdso32.lds.S        |  2 ++
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/include/asm/vdso/gettimeofday.h b/arch/sparc/include/asm/vdso/gettimeofday.h
index a35875fba45470ba961a7df3ae52bc17d2a4a4a0..b0c80c8a28bb71e16398ab38904ba826457ac71d 100644
--- a/arch/sparc/include/asm/vdso/gettimeofday.h
+++ b/arch/sparc/include/asm/vdso/gettimeofday.h
@@ -101,6 +101,8 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode, const struct vd
 	"f48", "f50", "f52", "f54", "f56", "f58", "f60", "f62",		\
 	"cc", "memory"
 
+#ifdef CONFIG_SPARC64
+
 static __always_inline
 long clock_gettime_fallback(clockid_t clock, struct __kernel_timespec *ts)
 {
@@ -113,7 +115,20 @@ long clock_gettime_fallback(clockid_t clock, struct __kernel_timespec *ts)
 	return o0;
 }
 
-#ifndef CONFIG_SPARC64
+#else /* !CONFIG_SPARC64 */
+
+static __always_inline
+long clock_gettime_fallback(clockid_t clock, struct __kernel_timespec *ts)
+{
+	register long num __asm__("g1") = __NR_clock_gettime64;
+	register long o0 __asm__("o0") = clock;
+	register long o1 __asm__("o1") = (long) ts;
+
+	__asm__ __volatile__(SYSCALL_STRING : "=r" (o0) : "r" (num),
+			     "0" (o0), "r" (o1) : SYSCALL_CLOBBERS);
+	return o0;
+}
+
 static __always_inline
 long clock_gettime32_fallback(clockid_t clock, struct old_timespec32 *ts)
 {
@@ -125,7 +140,8 @@ long clock_gettime32_fallback(clockid_t clock, struct old_timespec32 *ts)
 			     "0" (o0), "r" (o1) : SYSCALL_CLOBBERS);
 	return o0;
 }
-#endif
+
+#endif /* CONFIG_SPARC64 */
 
 static __always_inline
 long gettimeofday_fallback(struct __kernel_old_timeval *tv, struct timezone *tz)
diff --git a/arch/sparc/vdso/vclock_gettime.c b/arch/sparc/vdso/vclock_gettime.c
index 093a7ff4dafce1cf0af5af4c303bef86e159858a..1d9859392e4cfd285349cf9155ca1fc25d3a7b41 100644
--- a/arch/sparc/vdso/vclock_gettime.c
+++ b/arch/sparc/vdso/vclock_gettime.c
@@ -48,4 +48,12 @@ int __vdso_clock_gettime(clockid_t clock, struct old_timespec32 *ts)
 int clock_gettime(clockid_t, struct old_timespec32 *)
 	__weak __alias(__vdso_clock_gettime);
 
+int __vdso_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts)
+{
+	return __cvdso_clock_gettime(clock, ts);
+}
+
+int clock_gettime64(clockid_t, struct __kernel_timespec *)
+	__weak __alias(__vdso_clock_gettime64);
+
 #endif
diff --git a/arch/sparc/vdso/vdso32/vdso32.lds.S b/arch/sparc/vdso/vdso32/vdso32.lds.S
index 53575ee154c492f9503efdd8f995ac2a035203c7..a14e4f77e6f2222b855df27cc7a0d0a4f98bd4ac 100644
--- a/arch/sparc/vdso/vdso32/vdso32.lds.S
+++ b/arch/sparc/vdso/vdso32/vdso32.lds.S
@@ -17,6 +17,8 @@ VERSION {
 	global:
 		clock_gettime;
 		__vdso_clock_gettime;
+		clock_gettime64;
+		__vdso_clock_gettime64;
 		gettimeofday;
 		__vdso_gettimeofday;
 	local: *;

-- 
2.51.0


