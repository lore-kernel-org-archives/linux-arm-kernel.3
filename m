Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDF7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WgU1XNPY0vIUYdQ/FaYaRLqUo4Ff/LB/v3f+zOEPBiQ=; b=jUOQxGNbNS2J0hS/2ar3MMufIR
	mn/jf2ePPG7xEI4l57HgopTjqsaMoFEIfjJf2CU3CCsrpYfYbfSrHRloImYQtV+lew/jeB75c/T4j
	p2rw7g2nCtkzxV0ek6RWuB55yHnZoPUyefcCj/tEmY1RBHTIV2pR4NdOIybPEnFpseVD2H0nd3d5S
	pATQEH/4DCrulQJYHHzob6kcyQ4bR250cky2Kgp+1aZm3Fj0xUBuSxVk7A4PzuEcx7jex+gT77Bv5
	00AI7qKMVIxpGfrh8K96meaC6xtMsM0UcBKVTekcdvOf++hbgUSlO6wt/vC7DEEx2+cgZSy0RQaLw
	btIjE4WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weT3R-0000000G7Ju-1ruN;
	Tue, 30 Jun 2026 07:38:49 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weT3K-0000000G7Et-0Qhf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 07:38:44 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782805119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WgU1XNPY0vIUYdQ/FaYaRLqUo4Ff/LB/v3f+zOEPBiQ=;
	b=h+IH3bIb4hWPAsWvZ9L+T8/HyGFJ0+d2m1BDfA9jlQQqd7hcgQaruHtYDaXdtqMVXigWW1
	9P6ghnGQNfIi9lg1IbgL2IPYfthldRToINTF0IQbuhnP26EZtQOuaD2c3LLwNWSWgjgP11
	QvG0SJ5Pb9tOXQj90FzhQQa9fNqa3P25ETnLRbVEJ/f5D894D+zlmc3lXSc1PcSWbsYY5y
	yai7jrcbn6iRKfSCtixhTz+LejYbyNQX3Vjo3mcKZ5pCUDDLbj+NFGzAVRjNC1UhdYxQDV
	hdkzd/OyQpC7nfwW/+UnxBb7t5JrRy5/QlV1kG/2xLN9H9AlQPLk/p7fV6MvTw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782805119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WgU1XNPY0vIUYdQ/FaYaRLqUo4Ff/LB/v3f+zOEPBiQ=;
	b=F9dovyTgsQ94qzEBBtODBH6sasghBtq0x8pMwb559L+KL31pipNar8eEoVI8R8PXToRPCD
	iH5xgFeGgMybUQBw==
Date: Tue, 30 Jun 2026 09:38:32 +0200
Subject: [PATCH v2 3/9] x86/vdso: Respect COMPAT_32BIT_TIME
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260630-vdso-compat_32bit_time-v2-3-520d194640dd@linutronix.de>
References: <20260630-vdso-compat_32bit_time-v2-0-520d194640dd@linutronix.de>
In-Reply-To: <20260630-vdso-compat_32bit_time-v2-0-520d194640dd@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>
Cc: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org, 
 sparclinux@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782805116; l=3352;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=5A3ufT/BlAl4IMY/Ptlcs79bMJADg0kjD64uZGVIocg=;
 b=PzY+KudQ5YnvlX0RMo1JjTVOXOGayc171Vg7wV3AE9FjYs8epGJlmnq56c01HywzI2H8jpNZ9
 fSfaOYKxkeiDOtUbZXvBhCoJb+KXXreeoSjmohCrORyvtYjO9ZiZAoM
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_003842_281259_188C8FD9 
X-CRM114-Status: GOOD (  11.53  )
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

If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
provide any 32-bit time related functionality. This is the intended
effect of the kconfig option and also the fallback system calls would
also not be implemented.

Currently the kconfig option does not affect the gettimeofday() syscall,
so also keep that in the vDSO.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/entry/vdso/common/vclock_gettime.c | 20 ++++++++++++--------
 arch/x86/entry/vdso/vdso32/vdso32.lds.S     |  2 ++
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/x86/entry/vdso/common/vclock_gettime.c b/arch/x86/entry/vdso/common/vclock_gettime.c
index 57066f346b3f..304dbd1f9db4 100644
--- a/arch/x86/entry/vdso/common/vclock_gettime.c
+++ b/arch/x86/entry/vdso/common/vclock_gettime.c
@@ -15,6 +15,7 @@
 
 #include "lib/vdso/gettimeofday.c"
 
+#if defined(__x86_64__) || defined(CONFIG_COMPAT_32BIT_TIME)
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
 {
 	return __cvdso_gettimeofday(tv, tz);
@@ -29,6 +30,7 @@ __kernel_old_time_t __vdso_time(__kernel_old_time_t *t)
 }
 
 __kernel_old_time_t time(__kernel_old_time_t *t)	__attribute__((weak, alias("__vdso_time")));
+#endif /* CONFIG_COMPAT_32BIT_TIME */
 
 
 #if defined(CONFIG_X86_64) && !defined(BUILD_VDSO32_64)
@@ -51,6 +53,7 @@ int clock_getres(clockid_t, struct __kernel_timespec *)
 
 #else
 /* i386 only */
+#ifdef CONFIG_COMPAT_32BIT_TIME
 int __vdso_clock_gettime(clockid_t clock, struct old_timespec32 *ts)
 {
 	return __cvdso_clock_gettime32(clock, ts);
@@ -59,14 +62,6 @@ int __vdso_clock_gettime(clockid_t clock, struct old_timespec32 *ts)
 int clock_gettime(clockid_t, struct old_timespec32 *)
 	__attribute__((weak, alias("__vdso_clock_gettime")));
 
-int __vdso_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts)
-{
-	return __cvdso_clock_gettime(clock, ts);
-}
-
-int clock_gettime64(clockid_t, struct __kernel_timespec *)
-	__attribute__((weak, alias("__vdso_clock_gettime64")));
-
 int __vdso_clock_getres(clockid_t clock, struct old_timespec32 *res)
 {
 	return __cvdso_clock_getres_time32(clock, res);
@@ -74,6 +69,15 @@ int __vdso_clock_getres(clockid_t clock, struct old_timespec32 *res)
 
 int clock_getres(clockid_t, struct old_timespec32 *)
 	__attribute__((weak, alias("__vdso_clock_getres")));
+#endif /* CONFIG_COMPAT_32BIT_TIME */
+
+int __vdso_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts)
+{
+	return __cvdso_clock_gettime(clock, ts);
+}
+
+int clock_gettime64(clockid_t, struct __kernel_timespec *)
+	__attribute__((weak, alias("__vdso_clock_gettime64")));
 
 int __vdso_clock_getres_time64(clockid_t clock, struct __kernel_timespec *ts)
 {
diff --git a/arch/x86/entry/vdso/vdso32/vdso32.lds.S b/arch/x86/entry/vdso/vdso32/vdso32.lds.S
index cee8f7f9fe80..00629192db56 100644
--- a/arch/x86/entry/vdso/vdso32/vdso32.lds.S
+++ b/arch/x86/entry/vdso/vdso32/vdso32.lds.S
@@ -23,10 +23,12 @@ VERSION
 {
 	LINUX_2.6 {
 	global:
+#ifdef CONFIG_COMPAT_32BIT_TIME
 		__vdso_clock_gettime;
 		__vdso_gettimeofday;
 		__vdso_time;
 		__vdso_clock_getres;
+#endif /* CONFIG_COMPAT_32BIT_TIME */
 		__vdso_clock_gettime64;
 		__vdso_clock_getres_time64;
 		__vdso_getcpu;

-- 
2.55.0


