Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F80C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/+6Ra5lzwUJJcz6eAVjO8rdTfxOj3oEt0FhEduahZYk=; b=3utmv81Wv7vwGx
	AOg7RVNqTWIPEt9QkQOUWA7UsXmEfzrlhNbx3kirkw8ae8LJwJHCuYqyl8cMqCaisTjAW3d/a1Vim
	7eAFGdWROLltZi2suXuQVDuy4a0vfxvBZSOmwjaHlDWNLz4qu2XoX3ANVmgxo1I/CZ53px8zCO0hn
	vTAiw2OjsSwc/EfuAvyXXCqFwrewOH8xXfGY0Z25md46tZ0zq02K7uSOYJEyUblYrRKjaNqv215c5
	a7oN+x9hTNbb1rV7rw+s0BPfnykKGlJkH/7nEdHXGk7HXAnNx5Ux3uOo1LLrMNpLva3syn3oG4ZAi
	Px4ZUrnSOmkyv00ifrvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqSt-00000007Icw-0X2Z;
	Mon, 20 Jul 2026 16:03:35 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqSo-00000007Iar-1QOO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:From:Reply-To;
	bh=/+6Ra5lzwUJJcz6eAVjO8rdTfxOj3oEt0FhEduahZYk=; b=XmXKzcy/jMvBFFXbF7oes2t5n7
	JQChKfZ4dcT3T+osgzCaUaGqpux/3Q468/bAbeHw3WbxLtIm1v2/iW6RyvKiWtaN+Q/ZlaI5Qq8v/
	0Lr2q0NdwEJrb/8KlrbuRamwm1YkW5HyW6lpCFAPHKqO9Dk7r4637YnJ/9g3RLGX6E3EQPNbWgtYM
	mU65eTHRghpoS7RvIQFWzvTD+tb8PCo1v8H4yQLdWD0gO9dRg8IW2gpCRAp665sWHeSxTzpCMY0/n
	nKGGiQFKRTgXYRLq/ojzfRw3M7l0fb0FVv9SB0ByoD3A5S3VFn5j1YwPWHjKWymc5FomVGrZulpTW
	pxRjWJlA==;
Received: from [179.118.191.219] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wlqSd-001CZ2-Uw; Mon, 20 Jul 2026 18:03:20 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v6 0/4] arm64: vdso: Implement
 __vdso_futex_robust_try_unlock()
Date: Mon, 20 Jul 2026 13:03:00 -0300
Message-Id: <20260720-tonyk-robust_arm-v6-0-7e68c122047e@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Q3U7DMAwF4FeZck1Q4vxtXPEeCKE0sbcAa1DSV
 UxT3510CG2ovTzS8WfLF1axJKzsaXNhBcdUU+5bsA8bFg6+3yNPsWUGAqzQ0vIh9+cPXnJ3qsO
 bL0duNJFzEYJGzdrYV0FK31fy5fU311P3jmGYnblxSHXI5XzdOcq598e7JT9KLrhQ3luNQCT9c
 9r7z+QfQz6y2R/hTgC9IkATYtfOs+QMBFoI6iYY2K0IqgneUitsddSEC0HfBCfMiqCbgIKiIA9
 mF9VCMHfC6h9ME4ii9FHJbZTunzBN0w/y7x/CywEAAA==
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
X-CRM114-CacheID: sfid-20260720_090330_718733_8624DC00 
X-CRM114-Status: GOOD (  14.83  )
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

Thanks!
	André

[1] https://lore.kernel.org/lkml/20260404093939.7XgeW_54@linutronix.de/
[2] https://lore.kernel.org/lkml/20260529-tonyk-robust_arm-v3-3-a6f02684d4fe@igalia.com/
[3] https://lore.kernel.org/lkml/20260602090536.045586688@kernel.org/

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
André Almeida (4):
      arm64: vdso: Prepare for robust futex unlock support
      arm64: vdso: Implement __vdso_futex_robust_try_unlock()
      arm64: vdso32: Bring vdso32-offsets.h back
      arm64: vdso32: Implement __vdso_futex_robust_try_unlock()

 arch/arm64/Kconfig                    |  1 +
 arch/arm64/Makefile                   |  2 +-
 arch/arm64/include/asm/futex_robust.h | 19 ++++++++++++
 arch/arm64/include/asm/vdso.h         |  3 ++
 arch/arm64/kernel/vdso.c              | 54 ++++++++++++++++++++++++++++++++++-
 arch/arm64/kernel/vdso/Makefile       | 10 +++++++
 arch/arm64/kernel/vdso/vdso.lds.S     |  9 ++++++
 arch/arm64/kernel/vdso/vfutex.c       | 35 +++++++++++++++++++++++
 arch/arm64/kernel/vdso32/Makefile     | 12 ++++++++
 arch/arm64/kernel/vdso32/vdso.lds.S   |  9 ++++++
 arch/arm64/kernel/vdso32/vfutex.c     | 34 ++++++++++++++++++++++
 11 files changed, 186 insertions(+), 2 deletions(-)
---
base-commit: af5e34a41cd607c00ef752e00331736570992354
change-id: 20260416-tonyk-robust_arm-54ff77d2c4e4

Best regards,
--  
André Almeida <andrealmeid@igalia.com>


