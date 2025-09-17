Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB7ACAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HGi0V9974FREoLRsYHUwYZzsytUn6wSTNusjibrKdzs=; b=tsz7xySfhIvCDT
	5e2j65mNkj411J65dOAdxdcd12YS+EJ8gGwGYIKzy3X/wJBRD0KsGkeVNdAN/NLTO+biLeP+ZyVJt
	ucIyobNLnydFRv14ZSazhVCsxGMYMOV+t2NhFHWJQs+IpKToWFaGDQv+AjxaZDvb6YLFveG8tdAi+
	d+j5jMdr2tdFygRUF1VdTIf0bCtbB5kaV6w6zUXC+Fqq1vN8HrEuEnosZW8nBly4pLu0//xoVnmCW
	fxUnkUckgXNf0vhfh6KUyY2yfxNpS8uEniiWhV4CxXAv6yu+p8ELgGnettMe4q9ZXaR8MFVRU6XTR
	ol47QZpxoCCQr6VjkiDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysjP-0000000Bx1A-2IPR;
	Wed, 17 Sep 2025 14:01:59 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysjM-0000000Bwwq-2yXW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:01:58 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HGi0V9974FREoLRsYHUwYZzsytUn6wSTNusjibrKdzs=;
	b=isM+9kPQ4l7zxtX8UulQny4upPIBzL+iGzW+OuVMgrsoY1nvlFEmKYevQtn5yhFgrWt/pU
	CRY2Aa35gbK/nUWa3/39YRMDaQHgzQ1QidjrXgu/tgl+RGOLYVyp4SaHFVH+xZCtE8ZlOm
	5oakFizMU6n/DhZ0Nl+fDNcgh7+mO5wK7yzVS7ePMQOOD530S871KCmjCBSkqwk/NQHNNd
	LEjug4R7c+67WGPSiBh3M4nsyDgbkJE6nrRNgU8YMu+HngkNbzzA+VIUweABHZGiniecdN
	udUH0Ub97fUxgeucajFmJ000De2phTWRSaZFD2TuGb7TnA6+jEiTWF+lsjyS2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HGi0V9974FREoLRsYHUwYZzsytUn6wSTNusjibrKdzs=;
	b=579HNYwobyuJgFBlYt8Ppl2Q6NCc+Xqj5++LG7IYiU6qjT2rfZs/Zi0bQ9HFGBmzfSqy6o
	iFdQDKa+SFEPfaDw==
Subject: [PATCH v3 00/36] sparc64: vdso: Switch to the generic vDSO library
Date: Wed, 17 Sep 2025 16:00:02 +0200
Message-Id: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOK+ymgC/3XNQQqDMBCF4atI1p0SJ4narnqP0oUmowZKlMQGi
 3j3RqEUCi7/gffNwgJ5S4Fds4V5ijbYwaUQp4zpvnYdgTWpGXJUvESEaMIAYay9LiR05NJcAwK
 qFomrii6oWRqPnlo77/D9kbq3YRr8e/8T8+36JeURGXPgQKIsatEYlCa/Pa17TX5wdj4bYhsb8
 UdVuTqkMFGNatuKFyUKWf5T67p+AEyRuJ0LAQAA
X-Change-ID: 20250722-vdso-sparc64-generic-2-25f2e058e92c
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
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Arnd Bergmann <arnd@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=6775;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=PrQrNrZPLANUyTQvdEFoleoOlkRGgqFa1qlxQLnhL0w=;
 b=rhvxKL65llIUv4MFPStdUaxOuEEw6BGbfC6VZC3v4dCQdq+8U8DPKTlIArAS9aZ+N1qJ7cLLA
 Aa6EBs+7LpCDKyKWAM2Y6P4XpY3tF7YJ6gLKjXN+vA3qGKiEOoR0D5u
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_070156_891545_D2FA8D4C 
X-CRM114-Status: GOOD (  15.63  )
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

Tested on a Niagara T4 and QEMU.

This has a semantic conflict with my series "vdso: Reject absolute
relocations during build". The last patch of this series expects all users
of the generic vDSO library to use the vdsocheck tool.
This is not the case (yet) for SPARC64. I do have the patches for the
integration, the specifics will depend on which series is applied first.

Based on tip/timers/vdso.

[0] https://lore.kernel.org/lkml/20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de/

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
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

Thomas Weißschuh (35):
      selftests: vDSO: vdso_test_correctness: Handle different tv_usec types
      arm64: vDSO: getrandom: Explicitly include asm/alternative.h
      arm64: vDSO: gettimeofday: Explicitly include vdso/clocksource.h
      arm64: vDSO: compat_gettimeofday: Add explicit includes
      ARM: vdso: gettimeofday: Add explicit includes
      powerpc/vdso/gettimeofday: Explicitly include vdso/time32.h
      powerpc/vdso: Explicitly include asm/cputable.h and asm/feature-fixups.h
      LoongArch: vDSO: Explicitly include asm/vdso/vdso.h
      MIPS: vdso: Add include guard to asm/vdso/vdso.h
      MIPS: vdso: Explicitly include asm/vdso/vdso.h
      random: vDSO: Add explicit includes
      vdso/gettimeofday: Add explicit includes
      vdso/helpers: Explicitly include vdso/processor.h
      vdso/datapage: Remove inclusion of gettimeofday.h
      vdso/datapage: Trim down unnecessary includes
      random: vDSO: trim vDSO includes
      random: vDSO: remove ifdeffery
      random: vDSO: split out datapage update into helper functions
      random: vDSO: only access vDSO datapage after random_init()
      s390/time: Set up vDSO datapage later
      vdso/datastore: Reduce scope of some variables in vvar_fault()
      vdso/datastore: Drop inclusion of linux/mmap_lock.h
      vdso/datastore: Map pages through struct page
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
      clocksource: drop include of asm/clocksource.h from linux/clocksource.h

 arch/arm/include/asm/vdso/gettimeofday.h           |   2 +
 arch/arm64/include/asm/vdso/compat_gettimeofday.h  |   3 +
 arch/arm64/include/asm/vdso/gettimeofday.h         |   2 +
 arch/arm64/kernel/vdso/vgetrandom.c                |   2 +
 arch/loongarch/kernel/process.c                    |   1 +
 arch/loongarch/kernel/vdso.c                       |   1 +
 arch/mips/include/asm/vdso/vdso.h                  |   5 +
 arch/mips/kernel/vdso.c                            |   1 +
 arch/powerpc/include/asm/vdso/gettimeofday.h       |   1 +
 arch/powerpc/include/asm/vdso/processor.h          |   3 +
 arch/s390/kernel/time.c                            |   4 +-
 arch/sparc/Kconfig                                 |   3 +-
 arch/sparc/include/asm/clocksource.h               |   9 -
 arch/sparc/include/asm/processor.h                 |   3 +
 arch/sparc/include/asm/processor_32.h              |   2 -
 arch/sparc/include/asm/processor_64.h              |  25 --
 arch/sparc/include/asm/vdso.h                      |   2 -
 arch/sparc/include/asm/vdso/clocksource.h          |  10 +
 arch/sparc/include/asm/vdso/gettimeofday.h         | 184 ++++++++++
 arch/sparc/include/asm/vdso/processor.h            |  41 +++
 arch/sparc/include/asm/vdso/vsyscall.h             |  10 +
 arch/sparc/include/asm/vvar.h                      |  75 ----
 arch/sparc/kernel/Makefile                         |   1 -
 arch/sparc/kernel/time_64.c                        |   6 +-
 arch/sparc/kernel/vdso.c                           |  69 ----
 arch/sparc/vdso/Makefile                           |   8 +-
 arch/sparc/vdso/vclock_gettime.c                   | 380 ++-------------------
 arch/sparc/vdso/vdso-layout.lds.S                  |  26 +-
 arch/sparc/vdso/vdso.lds.S                         |   2 -
 arch/sparc/vdso/vdso2c.c                           |  24 --
 arch/sparc/vdso/vdso2c.h                           |  45 +--
 arch/sparc/vdso/vdso32/vdso32.lds.S                |   4 +-
 arch/sparc/vdso/vma.c                              | 274 +--------------
 drivers/char/random.c                              |  75 ++--
 include/linux/clocksource.h                        |   8 -
 include/linux/vdso_datastore.h                     |   6 +
 include/vdso/datapage.h                            |  23 +-
 include/vdso/helpers.h                             |   1 +
 init/main.c                                        |   2 +
 kernel/time/Kconfig                                |   4 -
 lib/vdso/datastore.c                               |  73 ++--
 lib/vdso/getrandom.c                               |   3 +
 lib/vdso/gettimeofday.c                            |  17 +
 .../testing/selftests/vDSO/vdso_test_correctness.c |   8 +-
 44 files changed, 451 insertions(+), 997 deletions(-)
---
base-commit: 5f84f6004e298bd41c9e4ed45c18447954b1dce6
change-id: 20250722-vdso-sparc64-generic-2-25f2e058e92c

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


