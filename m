Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A88FD5306
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 06:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMoWoELWXhUvJ+5dGoSFr0fxre5mWeKbDwq8tLK0U1w=; b=2VopCuuLu/H7NpkuuBV16M3k+W
	zC7D36ziqCg6RgXqrMCtpGgLLibzPr0vmMZiulutfjOZprQSA8oYFsUN92IJJ6ctJ0eupxrWRRaXj
	KuOZEJ/bO32STlLFeoaA5SHMku7y4WKftZtJxSAERUoJpkcXofDEWqT0HCH0xU4ITHHYTCYC1vBlg
	lR0tsKn2eLkz0uy6AAcPiaiKo5F7oXd8x61wqp9gn4gUSUbOUrHGwa8EHWPmfS2nK33v4pNWyExMr
	At/z0w8TNWk8YDcVB+y3hlIKrT2+w4A7/PIRjz6prUjasFWevLgHe4au0M4RQEsK+fH0NCGE0Xl2/
	K7oO1Ggw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrnT-00000007pkx-1lIq;
	Fri, 27 Feb 2026 06:57:59 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrnL-00000007pg6-0qOy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 06:57:52 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772175469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PMoWoELWXhUvJ+5dGoSFr0fxre5mWeKbDwq8tLK0U1w=;
	b=jz3sFWXhcbKGJDvHLemZ34PNAxwppfUXe+wTPhRtV3gLeHLzKe7G/sOWhp432nGhXwdSHn
	MgPHL/ieh4CRL+Sj/V0VrSdeXNrJJWdNoAnA+kUYdLhaxe5hRqxfwTSIVQqT/n2JRu11Db
	54GUiQ3Ep2UOkUDN0lDHYCt1mgYt3lWckWML/nc21HoopTL0vjWSaXA5qYRwVq0Bz0oILh
	Mywz5yZTC95dNZKv+8lxx7sqRgP0XM9ESwO9geQDyk0s6GnuSbY0G6jK3tLh/1UPre0lm2
	maFHxd31Y+gGwZf3eZw3N0MbkkfM5ZYX34hb3FOHezAsDQlFPn+cURluRusTEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772175469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PMoWoELWXhUvJ+5dGoSFr0fxre5mWeKbDwq8tLK0U1w=;
	b=mNoDAPohU52TI7Xd8JWlXSfQ8jNjk3ZTMwand/oL+vE8eWgqiq+6XegH6AjkjIti8lIJxM
	gQC7dMc48YTxE5AQ==
Date: Fri, 27 Feb 2026 07:57:44 +0100
Subject: [PATCH 5/7] MIPS: VDSO: Drop kconfig MIPS_CLOCK_VSYSCALL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-compat_32bit_time-v1-5-3f0286a7bac3@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772175466; l=3146;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=oahUDDzRXbGFMlkc0RC1a89GUCrIJez2IL5R9Ep+PBo=;
 b=04Iyq9XCQR4S4Ii1jZ1CW+E0jOmqmZS2e+vnTE9U0dCmMRBUvfyhPR94yWmPUG9n2pIN7c9iT
 6C8JYr4OYX/DVncCggJaRcX5U23VD83H+KnRI5WnFMgp2MAlxM6D477
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_225751_383523_2CC9EA87 
X-CRM114-Status: GOOD (  11.09  )
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

This configuration option exists so "that we don't provide the symbol
when there's no possibility of there being a usable clocksource".
However it only covers __vdso_gettimeofday() and none of the other vDSO
functions which should be affected by the same circumstances.
As these are more widely used than gettimeofday() and nobody seems to
have had an issue with them so far, drop MIPS_CLOCK_VSYSCALL completely.

The removal of the ifdeffery will also make some upcomming changes
easier to read.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/Kconfig              |  3 ---
 arch/mips/vdso/vdso.lds.S      |  2 --
 arch/mips/vdso/vgettimeofday.c | 20 --------------------
 3 files changed, 25 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index e48b62b4dc48..4c8592fd1556 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1137,9 +1137,6 @@ config CSRC_R4K
 config CSRC_SB1250
 	bool
 
-config MIPS_CLOCK_VSYSCALL
-	def_bool CSRC_R4K || CLKSRC_MIPS_GIC
-
 config GPIO_TXX9
 	select GPIOLIB
 	bool
diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
index 5d08be3a6b85..76b6ad898288 100644
--- a/arch/mips/vdso/vdso.lds.S
+++ b/arch/mips/vdso/vdso.lds.S
@@ -97,9 +97,7 @@ VERSION
 #ifndef CONFIG_MIPS_DISABLE_VDSO
 	global:
 		__vdso_clock_gettime;
-#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
 		__vdso_gettimeofday;
-#endif
 		__vdso_clock_getres;
 #if _MIPS_SIM != _MIPS_SIM_ABI64
 		__vdso_clock_gettime64;
diff --git a/arch/mips/vdso/vgettimeofday.c b/arch/mips/vdso/vgettimeofday.c
index 1d236215e8f6..00f9fcfc327e 100644
--- a/arch/mips/vdso/vgettimeofday.c
+++ b/arch/mips/vdso/vgettimeofday.c
@@ -18,22 +18,12 @@ int __vdso_clock_gettime(clockid_t clock,
 	return __cvdso_clock_gettime32(clock, ts);
 }
 
-#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
-
-/*
- * This is behind the ifdef so that we don't provide the symbol when there's no
- * possibility of there being a usable clocksource, because there's nothing we
- * can do without it. When libc fails the symbol lookup it should fall back on
- * the standard syscall path.
- */
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
 			struct timezone *tz)
 {
 	return __cvdso_gettimeofday(tv, tz);
 }
 
-#endif /* CONFIG_MIPS_CLOCK_VSYSCALL */
-
 int __vdso_clock_getres(clockid_t clock_id,
 			struct old_timespec32 *res)
 {
@@ -59,22 +49,12 @@ int __vdso_clock_gettime(clockid_t clock,
 	return __cvdso_clock_gettime(clock, ts);
 }
 
-#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
-
-/*
- * This is behind the ifdef so that we don't provide the symbol when there's no
- * possibility of there being a usable clocksource, because there's nothing we
- * can do without it. When libc fails the symbol lookup it should fall back on
- * the standard syscall path.
- */
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
 			struct timezone *tz)
 {
 	return __cvdso_gettimeofday(tv, tz);
 }
 
-#endif /* CONFIG_MIPS_CLOCK_VSYSCALL */
-
 int __vdso_clock_getres(clockid_t clock_id,
 			struct __kernel_timespec *res)
 {

-- 
2.53.0


