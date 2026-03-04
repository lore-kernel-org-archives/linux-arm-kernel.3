Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0313CEDEC1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 07:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tExRo9EdJB/0iC9aVc7h/nmkEcGApprYnjO2Gut37XU=; b=RdIVXMW1VxJGJT
	MZMAbxDegfPFw2jlRRc0TY655j3Pt9fmYeq9yfkA3KZVDWnrUEOuuaJgz+nwGKs07h8Thb4lCw8Rr
	r+7E8gn4w1acilvhlkFQDFZpjSGqNghuzpDYdsurrqWKAW8cItT93tPaDQ6M0RPAfEAU4yBddmkOV
	RzN+1x34ECT+9SHrSa46NEX7ivl235pM9xiEqdKIVQv6xDp8u35UOKV0uYk3fbAjJrgv3lUmzzC7z
	lrbRBo8epTV3Ptpr+wHKFYL51slCH6HXK7IG1mirFAaFn2wikxO8ONlZn17Bf7Tp3+92J0LuLjLUX
	G0wHhGXGCwLQIh6td6LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgyq-0000000Ge9M-3zYW;
	Wed, 04 Mar 2026 07:49:16 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgyn-0000000Ge6b-2zaP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 07:49:15 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772610551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tExRo9EdJB/0iC9aVc7h/nmkEcGApprYnjO2Gut37XU=;
	b=o3VFk9tsY0/aMCaIuc4w5j5fckonqI0NeQ2OaPUEVz0wvbxECNWJTR+TvcZsXkl2ziILaC
	opdicwcpYJwtXvsHtTpwtl10xe1cTgjgWhY3aouzwPCfBcCcQSG9m9/M5bZGxJ0g+FiRBO
	vvzhiQoENAdN1v2fUx/jBTRx7NVQtmsSSzlUkB4jQTymS+h0mbZldRQa/TwOHh61pveuyw
	yM6wBLtDIuxr8bIzOHARGazYC5nGirsbll4LCewJ6F1CtkvfjFR45nuY5VScT9XxMXXNpe
	NKbKIw5xrbkDWOi5m3xZoM91SwOhUmIXRMj7ukrYTKOPDqVTYDWrfkeBxhiiTw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772610551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tExRo9EdJB/0iC9aVc7h/nmkEcGApprYnjO2Gut37XU=;
	b=CQlRXt4Xe4r+u9aUimg3wpTf8//0PYh/7nJ3eh1e5EH3GDK90hhYh1Wq7szQXn2HMf4Z3y
	zF1suGnKTfLvjqCA==
Subject: [PATCH v6 00/14] sparc64: vdso: Switch to the generic vDSO library
Date: Wed, 04 Mar 2026 08:48:57 +0100
Message-Id: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XPTW7DIBAF4KtErEsFw6+z6j2iLgwMCVJlR5CiR
 JHvXhyp9aJm+UZ63+g9ScGcsJDj4Uky1lTSPLWg3w7EX8bpjDSFlgkwUMwA0BrKTMt1zF5Lesa
 p1T0FCioCMmVxAE9a+ZoxpvsLPn22fEnlNufH60/l6/WXlD2ycsooCqNH4QLIwD++0vR9y/OU7
 u8BycpW2CjLVZeCRjkVo2XagJBmjxIbNXDTpUSjhDaD485bRLtHyT+KM94fKNeBTDPjohwCjnu
 U2ijOdJdSjRpMjOC0khD/DVyW5QeQOxuZ7AEAAA==
X-Change-ID: 20250722-vdso-sparc64-generic-2-25f2e058e92c
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
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772610551; l=5091;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=coa1rVPXvvfSKVXCp1hWICCYNOIY9jhKAe9k08Z13m4=;
 b=1H28xfAD2yOev2Vntn45b+s1SK9oRczk3lLIF8UfBKz5V9GWLALD82hoRyRbTygmoK8fcOwwj
 u+6aLBOPdaYBTLMN8AdpKgc/jYxHLZZSuJ8YVqDQNA3yoqv/LM3Gquk
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_234914_031497_5BAF0EB2 
X-CRM114-Status: GOOD (  13.64  )
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

The generic vDSO provides a lot common functionality shared between
different architectures. SPARC is the last architecture not using it,
preventing some necessary code cleanup.

Make use of the generic infrastructure.

Follow-up to and replacement for Arnd's SPARC vDSO removal patches:
https://lore.kernel.org/lkml/20250707144726.4008707-1-arnd@kernel.org/

SPARC64 can not map .bss into userspace, so the vDSO datapages are
switched over to be allocated dynamically.

Tested on a Niagara T4 and QEMU.

This has emantic conflicts with
* "vdso: Reject absolute relocations during build" [0]
* "vDSO: Respect COMPAT_32BIT_TIME" [1]

But I expect both other serieses to need more discussions.

[0] https://lore.kernel.org/lkml/20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de/
[1] https://lore.kernel.org/lkml/20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de/

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v6:
- Provide statically allocated during early boot to avoid canges to the rng core
- Use non-compound data pages
- Reword commit messages
- Rebase on v7.0-rc1
- Link to v5: https://lore.kernel.org/r/20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de

Changes in v5:
- Merge the patches for 'struct page' mapping and dynamic allocation
- Zero out newly-allocated data pages
- Pick up review tags
- Link to v4: https://lore.kernel.org/r/20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de

Changes in v4:
- Rebase on v6.18-rc1.
- Keep inclusion of asm/clocksource.h from linux/clocksource.h
- Reword description of "s390/time: Set up vDSO datapage later"
- Link to v3: https://lore.kernel.org/r/20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de

Changes in v3:
- Allocate vDSO data pages dynamically (and lots of preparations for that)
- Drop clock_getres()
- Fix 32bit clock_gettime() syscall fallback
- Link to v2: https://lore.kernel.org/r/20250815-vdso-sparc64-generic-2-v2-0-b5ff80672347@linutronix.de

Changes in v2:
- Rebase on v6.17-rc1
- Drop RFC state
- Fix typo in commit message
- Drop duplicate 'select GENERIC_TIME_VSYSCALL'
- Merge "sparc64: time: Remove architecture-specific clocksource data" into the
  main conversion patch. It violated the check in __clocksource_register_scale()
- Link to v1: https://lore.kernel.org/r/20250724-vdso-sparc64-generic-2-v1-0-e376a3bd24d1@linutronix.de

---
Arnd Bergmann (1):
      clocksource: remove ARCH_CLOCKSOURCE_DATA

Thomas Weißschuh (13):
      vdso/datastore: Reduce scope of some variables in vvar_fault()
      vdso/datastore: Drop inclusion of linux/mmap_lock.h
      vdso/datastore: Allocate data pages dynamically
      sparc64: vdso: Link with -z noexecstack
      sparc64: vdso: Remove obsolete "fake section table" reservation
      sparc64: vdso: Replace code patching with runtime conditional
      sparc64: vdso: Move hardware counter read into header
      sparc64: vdso: Move syscall fallbacks into header
      sparc64: vdso: Introduce vdso/processor.h
      sparc64: vdso: Switch to the generic vDSO library
      sparc64: vdso2c: Drop sym_vvar_start handling
      sparc64: vdso2c: Remove symbol handling
      sparc64: vdso: Implement clock_gettime64()

 arch/sparc/Kconfig                         |   3 +-
 arch/sparc/include/asm/clocksource.h       |   9 -
 arch/sparc/include/asm/processor.h         |   3 +
 arch/sparc/include/asm/processor_32.h      |   2 -
 arch/sparc/include/asm/processor_64.h      |  25 --
 arch/sparc/include/asm/vdso.h              |   2 -
 arch/sparc/include/asm/vdso/clocksource.h  |  10 +
 arch/sparc/include/asm/vdso/gettimeofday.h | 184 ++++++++++++++
 arch/sparc/include/asm/vdso/processor.h    |  41 ++++
 arch/sparc/include/asm/vdso/vsyscall.h     |  10 +
 arch/sparc/include/asm/vvar.h              |  75 ------
 arch/sparc/kernel/Makefile                 |   1 -
 arch/sparc/kernel/time_64.c                |   6 +-
 arch/sparc/kernel/vdso.c                   |  69 ------
 arch/sparc/vdso/Makefile                   |   8 +-
 arch/sparc/vdso/vclock_gettime.c           | 380 ++---------------------------
 arch/sparc/vdso/vdso-layout.lds.S          |  26 +-
 arch/sparc/vdso/vdso.lds.S                 |   2 -
 arch/sparc/vdso/vdso2c.c                   |  24 --
 arch/sparc/vdso/vdso2c.h                   |  45 +---
 arch/sparc/vdso/vdso32/vdso32.lds.S        |   4 +-
 arch/sparc/vdso/vma.c                      | 274 ++-------------------
 include/linux/clocksource.h                |   6 +-
 include/linux/vdso_datastore.h             |   6 +
 init/main.c                                |   2 +
 kernel/time/Kconfig                        |   4 -
 lib/vdso/datastore.c                       |  97 +++++---
 27 files changed, 375 insertions(+), 943 deletions(-)
---
base-commit: f02e02079ac56b44ff89d4c2189cf7185ab794f3
change-id: 20250722-vdso-sparc64-generic-2-25f2e058e92c

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


