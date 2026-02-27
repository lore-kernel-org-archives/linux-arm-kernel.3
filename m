Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6DAFD5304
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 06:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tB8OLfzV0yLcpSZIz+yX61nKI7piyON1S04PRpwPwsA=; b=11Wow0U2+tcqFE7ZvFsGIWOlQd
	PpJFoGesYU2B9WIepuuEJZwrHSqyNkpxgIzZFpi29NERYj2LCxM+cmq6YFa/+lEk3e98ZApVrZNWv
	XTfXwVdORU0fTIDdq035PGIqALq5qk59+lHIO/1rk8mTOg9EN5AnrAxQonfffYigJwCFOAYftKN0+
	AbuOxtWjZ/lDwBs1sIsv4HvrnaUFOPDYTUq0l/kj2zc+8sO5mmwawbkv/gaBuFO/9NrcpQ+GZUTX1
	Whv3Baopd7ncawa55aGsp2MzUJ2Dr9fiSdI4KEN1SJ7Wwm12avoMmmEUZmZcSeoo9NrDaG2f3E/8c
	9jLODJDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrnT-00000007pkY-0Y7z;
	Fri, 27 Feb 2026 06:57:59 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrnK-00000007pf8-2QIj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 06:57:52 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772175469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tB8OLfzV0yLcpSZIz+yX61nKI7piyON1S04PRpwPwsA=;
	b=w0103LqBgb+JA2hk7slblHRyqhjUgMxbAPY1uaHto4KknOa65o5qZhZJlSzj8WaWXUL5rJ
	KLQwaABcEs70WKppllRY1NLTTt2BT0xHaV0kBtAvE7bFTL2FPzPjEa4GOXFIYJ/jmoGkhr
	UUvlfEzXcdEgDcn1zS4TirH4v9LMx/IHqPQmd/W+N1tbZaRayrZUWQ6d6bti51du61LToX
	NJXofMLo0aDmkuXFlmANrlPNT8nqVo9yLDssTkhF5+JJH6ARgWCCEwM1DB/H7/ZtUuOvRc
	CoXCN/nr3ixC4OrC+cVsh8RWFkHdVUgZUcfm0zezs16N1YdLY0FvPLFXdILOFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772175469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tB8OLfzV0yLcpSZIz+yX61nKI7piyON1S04PRpwPwsA=;
	b=dwQQbZwa0iNY4Z2tCRDuTF0yTx5tJzYwPhL58hNbssVKjkzYmrS56sigv0jtjlcjwdR3qc
	sBdobaHcn+xe0xAA==
Date: Fri, 27 Feb 2026 07:57:43 +0100
Subject: [PATCH 4/7] powerpc/vdso: Respect COMPAT_32BIT_TIME
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-compat_32bit_time-v1-4-3f0286a7bac3@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
In-Reply-To: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772175466; l=4469;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Xv3eH/9VHgNpvqglSUhIiLYYyy1PpoIoaT4yuSsTW5M=;
 b=MdmjO5KPhmsMXEd+ePjxhegLEWrjviduid5rr6rky5WJ94+NBzZC0pKA3jwyXKw3kLi1cCcfS
 /XYsS38ugRTB2pvIoZOiDkb7YT3sStIbRvJA37ZRPZfVvanqzK6DEU9
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_225750_768214_8498828A 
X-CRM114-Status: GOOD (  10.35  )
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
 arch/powerpc/kernel/vdso/gettimeofday.S  |  6 ++++++
 arch/powerpc/kernel/vdso/vdso32.lds.S    | 10 ++++++----
 arch/powerpc/kernel/vdso/vgettimeofday.c | 16 ++++++++++------
 3 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/vdso/gettimeofday.S b/arch/powerpc/kernel/vdso/gettimeofday.S
index 1c8e51691bf8..c8fda56ac520 100644
--- a/arch/powerpc/kernel/vdso/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso/gettimeofday.S
@@ -77,9 +77,11 @@ V_FUNCTION_END(__kernel_gettimeofday)
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
@@ -99,9 +101,11 @@ V_FUNCTION_END(__kernel_clock_gettime64)
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
@@ -122,6 +126,8 @@ V_FUNCTION_END(__kernel_clock_getres_time64)
  * time_t time(time *t);
  *
  */
+#if defined(__powerpc64__) || defined(CONFIG_COMPAT_32BIT_TIME)
 V_FUNCTION_BEGIN(__kernel_time)
 	cvdso_call __c_kernel_time call_time=1
 V_FUNCTION_END(__kernel_time)
+#endif
diff --git a/arch/powerpc/kernel/vdso/vdso32.lds.S b/arch/powerpc/kernel/vdso/vdso32.lds.S
index 3f384a2526ae..53fe3796a571 100644
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
 		__kernel_time;
+#endif /* CONFIG_COMPAT_32BIT_TIME */
+		__kernel_gettimeofday;
+		__kernel_get_syscall_map;
+		__kernel_clock_gettime64;
+		__kernel_clock_getres_time64;
 		__kernel_get_tbfreq;
 		__kernel_sync_dicache;
 		__kernel_sigtramp32;
diff --git a/arch/powerpc/kernel/vdso/vgettimeofday.c b/arch/powerpc/kernel/vdso/vgettimeofday.c
index 3c194e1ab562..dfefd13a19e1 100644
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
@@ -49,7 +51,9 @@ int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz
 	return __cvdso_gettimeofday_data(vd, tv, tz);
 }
 
+#if defined(__powerpc64__) || defined(CONFIG_COMPAT_32BIT_TIME)
 __kernel_old_time_t __c_kernel_time(__kernel_old_time_t *time, const struct vdso_time_data *vd)
 {
 	return __cvdso_time_data(vd, time);
 }
+#endif

-- 
2.53.0


