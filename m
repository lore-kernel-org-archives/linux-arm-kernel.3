Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B15C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYXRa5l/CdD2C2xpitWtlaAFbTnk8w36CIwHuGabkYg=; b=PpUeOQfB6sBfVLhlZOny7SF7oV
	tm/DNvdcMN4jybvAG3IGMq276psQ2iSCxDqf0BJO1unms/Au4gg2l7Q5wgpTVnAbavRgGAc6l4Toc
	GK9HQMOiT9b1uDM8HCo7qFICgDu0GJD2CUcCJkgQ6lMpEnJFQeB4WXiYVQN9TwK+hHbxWmFBAbxng
	BmGhp1hHX1ai2WMEozu+7RfuvUfmUJ1Rg1plpLMKuyiXRqrxRvNN/6K7o+je2oVK7CNtFsCzbeNnb
	4CLqdJ8fAFbI2sIVZkYovlzCOY/UmkDdE6XMKeODpuqRVuBkSJ+hu/idKZMpdaHGRnVc4/6lkWDu2
	SBV+ihdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCg7-00000003qFH-0Peb;
	Thu, 02 Jul 2026 08:21:47 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCg2-00000003q9I-3awp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:21:44 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782980501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DYXRa5l/CdD2C2xpitWtlaAFbTnk8w36CIwHuGabkYg=;
	b=XVc1AG4vsrK0a7pnM0dkUyJxPGcDwnMXfIP4DbrVYlHn6kiVr1r162htY+reuvexes8urw
	N/2VHDtf7YxNvAUy1ScxDHZunjondJaxA22XZiph+OZxWheOwn/4cKcWYffJHnqSYbwrCX
	pz4RDXLDP8Y0+tVodVMunXHaUWA+9LuM8zF8qieah1vt3egwRfjEtVS9inb5Cnjnud0pg4
	4uVrDGPhMk+uesnzQaCOnoni3VwcbTUuIHhc4iyUicNJFjzy7DQAsoYdhqLgo+2MLSmit2
	kpLeQMduwCTRA0kgYlsa21CwEHLZ+RhInVFxinq8gykNGhOIRh9x4Zk/HSj86g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782980501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DYXRa5l/CdD2C2xpitWtlaAFbTnk8w36CIwHuGabkYg=;
	b=C2lbJx/lDZIbv8xS2JUlHrr/Y0I7SrYde892VNhJtwBeXer8ftSR9ALwWmLL/uMpl2XBXc
	iPRj4S0f234rCuDw==
Date: Thu, 02 Jul 2026 10:21:31 +0200
Subject: [PATCH v3 7/9] MIPS: VDSO: Respect COMPAT_32BIT_TIME
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260702-vdso-compat_32bit_time-v3-7-db9f36d8d432@linutronix.de>
References: <20260702-vdso-compat_32bit_time-v3-0-db9f36d8d432@linutronix.de>
In-Reply-To: <20260702-vdso-compat_32bit_time-v3-0-db9f36d8d432@linutronix.de>
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
 sparclinux@vger.kernel.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782980489; l=1652;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=db+HUQOgoPhMZomGV9E3SOxOlzH0qf2UqfHYn/OzdpY=;
 b=LaLkTIW5BQe8nXjVz9t/ub5bfz3xAP/47ZQj5zxKD6mwfTVfpm4LyKgHZg4jRmIjques1fK+g
 MWN6JfPtX18DwYmzCmzpAkao6Iyb1LT3juNvIOoagAPUvhrF3B2B9Ba
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_012143_036426_45346322 
X-CRM114-Status: UNSURE (   9.21  )
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

If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
provide any 32-bit time related functionality. This is the intended
effect of the kconfig option and also the fallback system calls would
also not be implemented.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/vdso/vdso.lds.S      | 2 ++
 arch/mips/vdso/vgettimeofday.c | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
index 278ab6444e98..b11ee493c67f 100644
--- a/arch/mips/vdso/vdso.lds.S
+++ b/arch/mips/vdso/vdso.lds.S
@@ -97,9 +97,11 @@ VERSION
 	LINUX_2.6 {
 #ifdef CONFIG_GENERIC_GETTIMEOFDAY
 	global:
+#if _MIPS_SIM == _MIPS_SIM_ABI64 || defined(CONFIG_COMPAT_32BIT_TIME)
 		__vdso_clock_gettime;
 		__vdso_gettimeofday;
 		__vdso_clock_getres;
+#endif
 #if _MIPS_SIM != _MIPS_SIM_ABI64
 		__vdso_clock_gettime64;
 		__vdso_clock_getres_time64;
diff --git a/arch/mips/vdso/vgettimeofday.c b/arch/mips/vdso/vgettimeofday.c
index 00f9fcfc327e..a1fb06b8973e 100644
--- a/arch/mips/vdso/vgettimeofday.c
+++ b/arch/mips/vdso/vgettimeofday.c
@@ -12,6 +12,8 @@
 #include <vdso/gettime.h>
 
 #if _MIPS_SIM != _MIPS_SIM_ABI64
+
+#ifdef CONFIG_COMPAT_32BIT_TIME
 int __vdso_clock_gettime(clockid_t clock,
 			 struct old_timespec32 *ts)
 {
@@ -29,6 +31,7 @@ int __vdso_clock_getres(clockid_t clock_id,
 {
 	return __cvdso_clock_getres_time32(clock_id, res);
 }
+#endif /* CONFIG_COMPAT_32BIT_TIME */
 
 int __vdso_clock_gettime64(clockid_t clock,
 			   struct __kernel_timespec *ts)

-- 
2.55.0


