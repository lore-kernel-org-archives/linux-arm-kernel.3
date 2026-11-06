Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D02C606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 02:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=knxMCMFz;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=kiH7SxKL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mu9ahmsvD2vM/2MuVCitn+kVEcmnrs1DHn2+gosEv5Y=; b=knxMCMFzcwI44APhrju4nf6J9L
	0qARXDHfO1uWAhkI+gJ0mZriG+nrzbRcYpT3MG4ZDwX+KWn8/yyLjUptx8tCpRvNhSuzhlgW8wQSP
	CPg9/zOiRayavwKyJV5WsE95C54TUM0NpYr3sjMmep5YshLGi/xXwQK0HyoWYXSVwqkBnT+Mu6yBe
	J5z9k/mQbs2iwuyLQTzK1bjuVA7medOTm/zAggjjgxcjD+e+K36O9uCTmhtEq4kSDQ7gUz0pkJ95U
	rcYp5PODWpDY/WPe0njuFsApUMy7d6NqiNpaM4z3OBylmDNBjchI724Rf8cOFJP9plTfzq+OC9ywW
	GTgfd1GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9cb-0000000B3GO-2jPP;
	Fri, 06 Nov 2026 02:24:05 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9cX-0000000B3Dw-1ap0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 02:24:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:From:Reply-To;
	bh=mu9ahmsvD2vM/2MuVCitn+kVEcmnrs1DHn2+gosEv5Y=; t=1793931841; x=2109291841; 
	b=kiH7SxKLLJKDMmNyv/D+DBLyndxCOlHL5zwe1cQynwUMvIglzbWvZKN9l9doH0IYMPPRUtRW1Hm
	SJn4oONhSAwny0aGbDPzOZVNqAi1o+xIAJlVmLQv0T0Fv4nI2XXDbwJfUDqQoMAeDx5clXweVfIkp
	Uzyp5XuX9q+VIkVdv7a5ISNZSrk2hiX6NUKWwrULCOuzqWKLE6PYVXCCtofCb9uS4KaS3z99IeN07
	HcMx9qkPcqjXJgFxtB24934Gx8GkHn+JzyqrRo90aH/oOPcZucMO097qzuYAhWWcSpbuYRV7J/+3y
	5mojqCStb1SFeU55CDQP1jPhG0cxBWWtdUEg==;
Received: from [177.172.122.137] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xP9cA-003xm9-Cw; Fri, 06 Nov 2026 03:23:38 +0100
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v10 0/3] arm64: vdso: Implement
 __vdso_futex_robust_try_unlock()
Date: Thu, 05 Nov 2026 23:23:41 -0300
Message-Id: <20261105-tonyk-robust_arm-v10-0-366ed4a3435b@igalia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23R207DMAwG4FeZck1R4iZxyhXvgRDKyVuArajtK
 qZp7046hFqUXDpyvuS3r2yMQ4oje9pd2RDnNKb+lAvBH3bMH+xpH5sU8gEDDppLoZupP10+mqF
 353F6s8OxUZIIMYCXUbJ87WuIlL7v5svrbz2e3Xv00+IsHYc0Tv1wuT86i6Xvj8eSn0XDG95aq
 2UEImGf095+Jvvo+yNb/Bk2AsiKAFkILn9PEyrwVAjtKijoKkKbBaspNxgZJMVCkKuAXFUEmYX
 IKXCyoLrQFoLaCNU5qCwQBWFDK0wQWAh6IwCvCDoLGLXxAoBLLFPgVjAVAbMgucHWt4helynMK
 hgQFcEs20REjk6T8GWKbhW66hy6ZRcu80446aX7J9xutx8pDJtj1AIAAA==
X-Change-ID: 20260416-tonyk-robust_arm-54ff77d2c4e4
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Florian Weimer <fweimer@redhat.com>, 
 Darren Hart <dvhart@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
 Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>, 
 Uros Bizjak <ubizjak@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, kernel-dev@igalia.com, 
 LKML <linux-kernel@vger.kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_182401_437786_6F7D81AD 
X-CRM114-Status: GOOD (  17.06  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

This is my take on implementing the new vDSO for unlocking a robust futex in
arm64. If you don't know what's that, Thomas wrote a good summary,
including the motivation for this work and the x86 implementation:

   https://lore.kernel.org/lkml/878qb89g7b.ffs@tglx/

* Testing

There's one selftest proposed [1] that tests precisely if the task is
interrupted during the critical section, if the kernel will clear op_pending
pointer. I've adapted to arm64 [2] and it works as expected. This test is not
being upstreamed right now because it depends on a better way to expose
vdso.so.dbg [3].

I also used gdb to manually check if the address is cleared when the kernel
interrupts the critical section.

Thanks!
	André

[1] https://lore.kernel.org/lkml/20260404093939.7XgeW_54@linutronix.de/
[2] https://lore.kernel.org/lkml/20260529-tonyk-robust_arm-v3-3-a6f02684d4fe@igalia.com/
[3] https://lore.kernel.org/lkml/20260602090536.045586688@kernel.org/

Changes in v10:
- Rebased on top of 7.4-rc1
- Link to v9: https://patch.msgid.link/20260917-tonyk-robust_arm-v9-0-ab082b1b4c4b@igalia.com

Changes in v9:
- Refactored asm code style
- Fix registers constrains, making sure that [pop_reg] uses the allocated
register and mark [lock] as read-write
- Simplified arm64_futex_robust_unlock_get_pop() with regs->regs[]
- Reduced the scope a bit, dropped the compat vdso32 bit entry for now. It needs
to first be added to arch/arm/, and later to arch/arm64/kernel/vdso32/ to ensure
that they are the same thing. I will add those bits in a next series, as
arch/arm needs a different toolchain, vm image, test and so on.
- v8: https://patch.msgid.link/20260821-tonyk-robust_arm-v8-0-077707b6f1c7@igalia.com

Changes in v8:
- Fix build when CONFIG_FUTEX is disabled
- v7: https://patch.msgid.link/20260728-tonyk-robust_arm-v7-0-40873c377c63@igalia.com

Changes in v7:
- vdso32: Use stlex instead of strex to ensure release semanthics
- vdso32: result reg should use "=&r" clobber
- both: pop_reg will be read afterwards so it was moved to be an input operand,
  with "+Q" clobber"
v6: https://patch.msgid.link/20260720-tonyk-robust_arm-v6-0-7e68c122047e@igalia.com

Changes in v6:
- Reorganized the patchset, better split for helpers functions vs aarch64 vs
arm32 code
- Use "full name" for labels instead of macros
- Completely reworded "Implement __vdso_futex_robust_try_unlock()" to make it
more obvious what's the bug and how does this fix it
v5: https://patch.msgid.link/20260717-tonyk-robust_arm-v5-0-ffd1ad318d17@igalia.com

Changes in v5:
 - Drop unneeded commit "arm64/entry: Unify user mode handling"
 - Replace "_success" with "_start" labels in vdso_futex_robust_unlock_update_ips
 - Added "cc" to the asm clobberlist
v4: https://patch.msgid.link/20260705-tonyk-robust_arm-v4-0-e0fd0fa259d3@igalia.com

Changes in v4:
 - Added commit "arm64/entry: Unify user mode handling"
 - Added missing ifdef FUTEX_ROBUST_UNLOCK guards
 - Fixed the position of _start and _success labels in the critical section
 - Instead of checking the zero flag, check the result register to decide if the
 op_pending needs to be cleared
v3: https://patch.msgid.link/20260529-tonyk-robust_arm-v3-0-a6f02684d4fe@igalia.com

Changes in v3:
 - Change asm to always use x2 to store *pop
 - Fix clang asm errors
 - Moved 32 bit entry point to vdso32/ and use littlearm asm
 - Adapted Sebastians test for arm
v2: https://patch.msgid.link/20260424-tonyk-robust_arm-v2-0-db4e46f752cf@igalia.com

Changes in v2:
 - s/CONFIG_COMPAT/CONFIG_COMPAT_VDSO (Thomas Weißschuh)
 - Fixed linker not finding the symbols (Thomas Weißschuh)
v1: https://patch.msgid.link/20260417-tonyk-robust_arm-v1-0-03aa64e2ff1a@igalia.com

---
André Almeida (2):
      arm64: vdso: Prepare for robust futex unlock support
      arm64: vdso: Implement __vdso_futex_robust_try_unlock()

Mark Rutland (1):
      arm64: vdso: Split native/compat mremap callbacks

 arch/arm64/Kconfig                    |  1 +
 arch/arm64/include/asm/futex_robust.h | 24 ++++++++++++++++++++
 arch/arm64/kernel/vdso.c              | 42 +++++++++++++++++++++++++++++++++--
 arch/arm64/kernel/vdso/Makefile       | 10 +++++++++
 arch/arm64/kernel/vdso/vdso.lds.S     |  9 ++++++++
 arch/arm64/kernel/vdso/vfutex.c       | 41 ++++++++++++++++++++++++++++++++++
 6 files changed, 125 insertions(+), 2 deletions(-)
---
base-commit: eedaa7d61f1ec8ae053a9ece0d553785350ac486
change-id: 20260416-tonyk-robust_arm-54ff77d2c4e4

Best regards,
--  
André Almeida <andrealmeid@igalia.com>


