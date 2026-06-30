Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A75C43638
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLMUk/yMfaiFPgFvnWmAECoPJREoyyvTC7Prat1r96I=; b=vu5vA91XeJwk60R/A1U/z43RdD
	/MCvoms+nXiUJKmMnurkFrL/vejTBarQPCzGAWbTvm1fbMrlxXnsO+NzLR2OnIbb+sVezV6xWjwGH
	miG2AwxejDkcGUET6R9HaC7njkoM9SBVzHsPQDhwDNNFhMQFv8/bzQ7rVM1fRTJvewepj8Oj9lQda
	TOSgf8dZ0Dp6kB0dj+V71j/+LXpbqb7hMeSuytS5hiyxULcMgq/zYJw2EvxlkX9RrHTN8YFRfB0CL
	ZZMLIzZqQ+6uMa5+0n4uSRgPj74FZaus7feUZVQ/FtiXT/lXa8OlAutv8QXdyxfeMHDCwoB7677e+
	lg071MxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weT3S-0000000G7Lr-1TCL;
	Tue, 30 Jun 2026 07:38:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weT3M-0000000G7GL-36a9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 07:38:47 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782805120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oLMUk/yMfaiFPgFvnWmAECoPJREoyyvTC7Prat1r96I=;
	b=xs3x1Pjfbw+jtif4Ux4gwzmNi2TjSpFeP32XnxHtpcaiTGGWWK4YG681PAUV4GVZVphAob
	ASLgA1yUtGspkWLkqezV8XVVXZUA0rCGRoxIhhg8Fbxe6Vs/b+klMFiPT462lzYGS4IQZk
	HkGajj9Utoc6znjfXxr5UFHEuuFZfTRvFAtHEgwRq8U7lojgogT11LVugHkZwoxdEF37kD
	kIffFQ9SVTSrSHuwMJItnP1eBmnBxHF/+Vg/0WtVZdmO0qpb8TKBU6tCKRYSooMiqM9BxY
	p4VmT9F9Pgw6zSA1GjdJHXWn57yAJt3V2S+GXmm2Hc+cpBIw6+O+HlJNnQFY5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782805120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oLMUk/yMfaiFPgFvnWmAECoPJREoyyvTC7Prat1r96I=;
	b=qx+W8f38ofF6zICatvj4+srW01mOicSd7rnKy8/FWbLY87uzG2hELauTTgO0SEPrlTVfBu
	EY2d+CQszihi7/Dg==
Date: Tue, 30 Jun 2026 09:38:35 +0200
Subject: [PATCH v2 6/9] powerpc/vdso: Respect COMPAT_32BIT_TIME
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260630-vdso-compat_32bit_time-v2-6-520d194640dd@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782805116; l=4909;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Qhpx3Xfl+Ro99botE5UEjPE2/tscRuOVBD2UN2HjYfQ=;
 b=Z4VF7j04jCTsakdoKCOJkmqBAxMXn2DHpuXL9IVEvSButRpRVsO8befWXpECQWvou78n05wvE
 p6JjNeW6LPcDKDGX4ph/GO4igdXofpwIXMEY78R8YaQcfyhSrZxTvHM
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_003845_369515_1D458269 
X-CRM114-Status: GOOD (  11.67  )
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
 arch/powerpc/kernel/vdso/gettimeofday.S  |  8 ++++++++
 arch/powerpc/kernel/vdso/vdso32.lds.S    | 10 ++++++----
 arch/powerpc/kernel/vdso/vgettimeofday.c | 16 ++++++++++------
 3 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/vdso/gettimeofday.S b/arch/powerpc/kernel/vdso/gettimeofday.S
index 1c8e51691bf8..c635cd1e77be 100644
--- a/arch/powerpc/kernel/vdso/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso/gettimeofday.S
@@ -67,9 +67,11 @@
  * int __kernel_gettimeofday(struct timeval *tv, struct timezone *tz);
  *
  */
+#if defined(__powerpc64__) || defined(CONFIG_COMPAT_32BIT_TIME)
 V_FUNCTION_BEGIN(__kernel_gettimeofday)
 	cvdso_call __c_kernel_gettimeofday
 V_FUNCTION_END(__kernel_gettimeofday)
+#endif
 
 /*
  * Exact prototype of clock_gettime()
@@ -77,9 +79,11 @@ V_FUNCTION_END(__kernel_gettimeofday)
  * int __kernel_clock_gettime(clockid_t clock_id, struct timespec *tp);
  *
  */
+#if defined(__powerpc64__) || defined(CONFIG_COMPAT_32BIT_TIME)
 V_FUNCTION_BEGIN(__kernel_clock_gettime)
 	cvdso_call __c_kernel_clock_gettime
 V_FUNCTION_END(__kernel_clock_gettime)
+#endif
 
 /*
  * Exact prototype of clock_gettime64()
@@ -99,9 +103,11 @@ V_FUNCTION_END(__kernel_clock_gettime64)
  * int __kernel_clock_getres(clockid_t clock_id, struct timespec *res);
  *
  */
+#if defined(__powerpc64__) || defined(CONFIG_COMPAT_32BIT_TIME)
 V_FUNCTION_BEGIN(__kernel_clock_getres)
 	cvdso_call __c_kernel_clock_getres
 V_FUNCTION_END(__kernel_clock_getres)
+#endif
 
 /*
  * Exact prototype of clock_getres_time64()
@@ -122,6 +128,8 @@ V_FUNCTION_END(__kernel_clock_getres_time64)
  * time_t time(time *t);
  *
  */
+#if defined(__powerpc64__) || defined(CONFIG_COMPAT_32BIT_TIME)
 V_FUNCTION_BEGIN(__kernel_time)
 	cvdso_call __c_kernel_time call_time=1
 V_FUNCTION_END(__kernel_time)
+#endif
diff --git a/arch/powerpc/kernel/vdso/vdso32.lds.S b/arch/powerpc/kernel/vdso/vdso32.lds.S
index 3f384a2526ae..876c965b827d 100644
--- a/arch/powerpc/kernel/vdso/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso32.lds.S
@@ -119,13 +119,15 @@ VERSION
 {
 	VDSO_VERSION_STRING {
 	global:
-		__kernel_get_syscall_map;
-		__kernel_gettimeofday;
+#ifdef CONFIG_COMPAT_32BIT_TIME
 		__kernel_clock_gettime;
-		__kernel_clock_gettime64;
 		__kernel_clock_getres;
-		__kernel_clock_getres_time64;
+		__kernel_gettimeofday;
 		__kernel_time;
+#endif /* CONFIG_COMPAT_32BIT_TIME */
+		__kernel_get_syscall_map;
+		__kernel_clock_gettime64;
+		__kernel_clock_getres_time64;
 		__kernel_get_tbfreq;
 		__kernel_sync_dicache;
 		__kernel_sigtramp32;
diff --git a/arch/powerpc/kernel/vdso/vgettimeofday.c b/arch/powerpc/kernel/vdso/vgettimeofday.c
index 3c194e1ab562..4b712fb01a3f 100644
--- a/arch/powerpc/kernel/vdso/vgettimeofday.c
+++ b/arch/powerpc/kernel/vdso/vgettimeofday.c
@@ -18,23 +18,25 @@ int __c_kernel_clock_getres(clockid_t clock_id, struct __kernel_timespec *res,
 	return __cvdso_clock_getres_data(vd, clock_id, res);
 }
 #else
+#ifdef CONFIG_COMPAT_32BIT_TIME
 int __c_kernel_clock_gettime(clockid_t clock, struct old_timespec32 *ts,
 			     const struct vdso_time_data *vd)
 {
 	return __cvdso_clock_gettime32_data(vd, clock, ts);
 }
 
-int __c_kernel_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts,
-			       const struct vdso_time_data *vd)
-{
-	return __cvdso_clock_gettime_data(vd, clock, ts);
-}
-
 int __c_kernel_clock_getres(clockid_t clock_id, struct old_timespec32 *res,
 			    const struct vdso_time_data *vd)
 {
 	return __cvdso_clock_getres_time32_data(vd, clock_id, res);
 }
+#endif /* CONFIG_COMPAT_32BIT_TIME */
+
+int __c_kernel_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts,
+			       const struct vdso_time_data *vd)
+{
+	return __cvdso_clock_gettime_data(vd, clock, ts);
+}
 
 int __c_kernel_clock_getres_time64(clockid_t clock_id, struct __kernel_timespec *res,
 				   const struct vdso_time_data *vd)
@@ -43,6 +45,7 @@ int __c_kernel_clock_getres_time64(clockid_t clock_id, struct __kernel_timespec
 }
 #endif
 
+#if defined(__powerpc64__) || defined(CONFIG_COMPAT_32BIT_TIME)
 int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz,
 			    const struct vdso_time_data *vd)
 {
@@ -53,3 +56,4 @@ __kernel_old_time_t __c_kernel_time(__kernel_old_time_t *time, const struct vdso
 {
 	return __cvdso_time_data(vd, time);
 }
+#endif

-- 
2.55.0


