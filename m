Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A389FD5301
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 06:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HtbZMuKPuZ/Q8N4tWs6O3IZMokrlUXoSJAG1PhFcJgY=; b=gYyX6TM9ohhMgZ
	Li3JG+VVxM2ZSjAs1Q0R9FXuegjgHgTCh1nMlJ6waYHGm1NBfRPMATyXlZIBUAWqYYSQL6q05+4Ir
	amVO9CBuKrMaKgg8XB1+QURbJjheBUOvFIyLJnOTcs2dyf+hG5nQYF43XIpHh2PH0AYVjwjuknYCi
	ABvw7cebz4Lix7E1u/cHZ0tQbVlzbf6OAKBNO3YYzs1jGU8byuKUbWnWdLuT2gbqieAf+vmD/xKyy
	0r1KoRVYgi6wiIgfAklUGYY5fCQ4WHTx5sG2hYeeFkFDDJuqH0yYAYbygbMuGK04qP2CDK+9GKHn+
	Lg330kxeMzPAaJsQ0+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrnK-00000007pgc-3yzQ;
	Fri, 27 Feb 2026 06:57:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrnI-00000007pep-1wUI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 06:57:49 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772175466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HtbZMuKPuZ/Q8N4tWs6O3IZMokrlUXoSJAG1PhFcJgY=;
	b=H4o7ORTn4JvG+PVTnYpO0/oTgdZCJbwVt4425etjg8+5ole07xXCVfxDm7D5LGyIHgoBJx
	8NwMkH71P64oXxvqvHLZB+IND37Jq3yby+W4GswDpz7bHdPKCez33/1zzxosn/+0pinBkm
	X7Yo9UMR4Vv0MfeCsSwufKeBILZtlkEgMVdYUbInPIWcpTl7UPQfgtO+RpsiiUy7r+2O4y
	++fQbI9BcasRK1a65vijBTiUpgA5nuY2eYltLq2LS2SOlWhynNISJ+i8/Wm4kqSqPLV9jT
	vpwtDuAp08YVymX36aLS9EWtu6mZVL9Q8F70pw/L9Ch47fljYATqIzqrE6JI3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772175466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HtbZMuKPuZ/Q8N4tWs6O3IZMokrlUXoSJAG1PhFcJgY=;
	b=gOAq0G/CQ3E3pUMxzw8fM3TjOLd6FY02Gw7eezax8KZlsADL9RmM590a28hE1bUpjrjYNl
	zytu7ftaESwuGKAA==
Subject: [PATCH 0/7] vDSO: Respect COMPAT_32BIT_TIME
Date: Fri, 27 Feb 2026 07:57:39 +0100
Message-Id: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avIrBP8AbOuEhFWU83CDBUJorsnL
 b/Few8kjIQJevZAxEKJwlkhGwbL4c4dOa3VoIQyQkrNy5oCX4K/XJ60milPmTxytMK2RmPXGgc
 1viJudP/jYXzfD3yh3uRoAAAA
X-Change-ID: 20260113-vdso-compat_32bit_time-e808763e976a
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772175466; l=2310;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=j+10mN0yr2XgOejP9mFbnsE8FfQujsP1mq/LotWdhto=;
 b=4qjwQGnBsBfZe0LjYUORov+hgkDQzer/ymRhbE91DQX1XPZRWzaKFR4++0Fr1RMsBbxUveStm
 UAm3S7SwNMvA4AnLvQRE43aBQhvrPLsa/92l8LBwRdO3MAbzufbbm2f
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_225748_666985_F33C6C31 
X-CRM114-Status: GOOD (  10.21  )
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

I also tried to introduce some helpers to avoid much of the ifdeffery,
but due to the high variance in the architecture-specific glue code
these would need to handle they ended up being worse than the current
proposal.

As a side-effect this will make the self-tests more reliable,
as there is now always a matching syscall available for each vDSO function.

clock_gettime_time64() was only introduced in v6.19, so libc implementations
are likely not using it yet.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (7):
      x86/vdso: Respect COMPAT_32BIT_TIME
      ARM: VDSO: Respect COMPAT_32BIT_TIME
      arm64: vdso32: Respect COMPAT_32BIT_TIME
      powerpc/vdso: Respect COMPAT_32BIT_TIME
      MIPS: VDSO: Drop kconfig MIPS_CLOCK_VSYSCALL
      MIPS: VDSO: Respect COMPAT_32BIT_TIME
      vdso/gettimeofday: Verify COMPAT_32BIT_TIME interactions

 arch/arm/vdso/vdso.lds.S                    |  4 +++-
 arch/arm/vdso/vgettimeofday.c               | 14 ++++++------
 arch/arm64/kernel/vdso32/vdso.lds.S         |  4 +++-
 arch/arm64/kernel/vdso32/vgettimeofday.c    | 14 ++++++------
 arch/mips/Kconfig                           |  3 ---
 arch/mips/vdso/vdso.lds.S                   |  6 +++---
 arch/mips/vdso/vgettimeofday.c              | 33 +++++++----------------------
 arch/powerpc/kernel/vdso/gettimeofday.S     |  6 ++++++
 arch/powerpc/kernel/vdso/vdso32.lds.S       | 10 +++++----
 arch/powerpc/kernel/vdso/vgettimeofday.c    | 16 ++++++++------
 arch/x86/entry/vdso/common/vclock_gettime.c | 20 ++++++++++-------
 arch/x86/entry/vdso/vdso32/vdso32.lds.S     |  4 +++-
 lib/vdso/gettimeofday.c                     |  8 +++++++
 13 files changed, 78 insertions(+), 64 deletions(-)
---
base-commit: 328b128e8fe2ae981900c1f38b3b9c75c586455e
change-id: 20260113-vdso-compat_32bit_time-e808763e976a

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


