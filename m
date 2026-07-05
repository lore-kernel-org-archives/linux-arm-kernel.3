Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D14C43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 17:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=soMAPgS4oOuk+Z8BKodzosk4/vXw3jf55nqziJKKfA8=; b=c+fnuWpQosy2zE
	SuGma50BqTFiSnghoUhfXFTuRSjvOBkBxFkve2YdQMG04XP6Ij/S+MwC8FVlzL30nszRUAMSSzMSl
	dmgLs/Rf3XBW1yziwBVK/pygpT/H13tyFNgzW9feX5EsrZ2g0Qo/jQtP5UIzul6lMWAphNekYMS0A
	xSoDr54gMQY73iyrpH4Z4zyQsLCfeiBFwKCiCZW2MonFl/JgIk/F7ynAw2NBP99NzRgfvbGMX8OnT
	LWFk6uNxE+JiAYZZw24sazlT0+wR5vbiz2pjgwU6KdDKKuXlMEtCOI+8gF5oA5yiet+CfXKZKpL0j
	FHGwKb/gZfSSWjFxn4fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgR6Q-00000009XSa-1U5I;
	Sun, 05 Jul 2026 17:58:02 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgR6M-00000009XQR-0c8H
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 17:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=soMAPgS4oOuk+Z8BKodzosk4/vXw3jf55nqziJKKfA8=; b=OFpCMUgDbPOIf+udzKmGI4zJ+V
	gBH5NGTtTqqaMwvLAIROGbzDzsGTMMmQLippPUc54Shkv3E1mpVU7TJfP6Da6Uo2zB0b34HobZz9G
	+acpFx9kcpEx1G0fvbkfKSdqiCE2mKhHuSfy9dCGsPHyhjFlJ9TAoNR5vFAXEJAibW7zaBbszi3//
	7g/Q4i1WHR2FIg/UGMhC5RB/XoUJdjWdxMASx/9ALOJkwsDzCO1IfA9p1YFijaO3vfksb+amUuHaC
	DYd+erva4Kl8kzzPNEOHSFe9LOWjb1HNHgjY0zlFqm5n9JW6pqzXFgP3fO3JSeY4v+GW0zGLE02HH
	8bHnblmg==;
Received: from 201-69-111-23.dial-up.telesp.net.br ([201.69.111.23] helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wgR5c-009PnY-Uu; Sun, 05 Jul 2026 19:57:13 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v4 0/5] arm64: vdso: Implement
 __vdso_futex_robust_try_unlock()
Date: Sun, 05 Jul 2026 14:56:50 -0300
Message-Id: <20260705-tonyk-robust_arm-v4-0-e0fd0fa259d3@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OTQ6CMBAF4KuYrq2BYSjqynsYY0qZ0fpDTYtEY
 7i7BWPU4PIlb743DxHIWwpiOXkIT60N1tUx4HQizF7XO5K2illAAirBVMnG1fej9K68hmar/Vn
 myFwUFRgkFPHs4ontbSDXm1cO1/JApumdvrG3oXH+Pmy2ad9788WYb1OZyCTTWiEBc6pXdqdPV
 s+MO4veb+FLAPwjQBSqMr6nuMjB8EjIPkIOiz9CFgWtOBbmWCHTj9B13RPGakkxRwEAAA==
X-Change-ID: 20260416-tonyk-robust_arm-54ff77d2c4e4
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Carlos O'Donell <carlos@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@aerifal.cx>, 
 Torvald Riegel <triegel@redhat.com>, Darren Hart <dvhart@infradead.org>, 
 Ingo Molnar <mingo@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, 
 Arnd Bergmann <arnd@arndb.de>, Uros Bizjak <ubizjak@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 "Liam R. Howlett" <liam@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, kernel-dev@igalia.com, 
 LKML <linux-kernel@vger.kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_105758_189807_878B0287 
X-CRM114-Status: GOOD (  19.71  )
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

* The patchset

As explained in the Testing section above, we developed a test that puts
breakpoints in the code to test if a user code being interrupted really clears
the op_pending pointer. This test wasn't initially working because of this check
at futex_fixup_robust_unlock():

        /*
         * Avoid dereferencing current->mm if not returning from interrupt.
         * current->rseq.event is going to be used subsequently, so bringing the
         * cache line in is not a big deal.
         */
        if (!current->rseq.event.user_irq)
		return;

rseq.event.user_irq was always false during my tests, and it prevents the fixup
to happen. I figured out that arm64_syscall_enter_from_user_mode() was the
issue because it doesn't set user_irq to true when the task comes from a
syscall. I dropped arm64_syscall_enter_from_user_mode() and replaced with
arm64_enter_from_user_mode() and the test now works fine. I honestly don't know
if this solution is the correct one here, so I would like to hear from the arm64
folks what's the best approach here.

Thanks!
	André

[1] https://lore.kernel.org/lkml/20260404093939.7XgeW_54@linutronix.de/
[2] https://lore.kernel.org/lkml/20260529-tonyk-robust_arm-v3-3-a6f02684d4fe@igalia.com/
[3] https://lore.kernel.org/lkml/20260602090536.045586688@kernel.org/

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
André Almeida (5):
      arm64/entry: Unify user mode handling
      arm64: vdso: Prepare for robust futex unlock support
      arm64: vdso: Implement __vdso_futex_robust_try_unlock()
      arm64: vdso32: Bring vdso32-offsets.h back
      arm64: vdso32: Implement __vdso_futex_robust_try_unlock()

 arch/arm64/Kconfig                    |  1 +
 arch/arm64/Makefile                   |  2 +-
 arch/arm64/include/asm/futex_robust.h | 19 +++++++++++++++++++
 arch/arm64/include/asm/vdso.h         |  3 +++
 arch/arm64/kernel/entry-common.c      | 11 ++---------
 arch/arm64/kernel/vdso.c              | 32 ++++++++++++++++++++++++++++++++
 arch/arm64/kernel/vdso/Makefile       | 10 ++++++++++
 arch/arm64/kernel/vdso/vdso.lds.S     |  9 +++++++++
 arch/arm64/kernel/vdso/vfutex.c       | 35 +++++++++++++++++++++++++++++++++++
 arch/arm64/kernel/vdso32/Makefile     | 12 ++++++++++++
 arch/arm64/kernel/vdso32/vdso.lds.S   |  9 +++++++++
 arch/arm64/kernel/vdso32/vfutex.c     | 33 +++++++++++++++++++++++++++++++++
 12 files changed, 166 insertions(+), 10 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260416-tonyk-robust_arm-54ff77d2c4e4

Best regards,
--  
André Almeida <andrealmeid@igalia.com>


