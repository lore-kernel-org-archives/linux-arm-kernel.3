Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA98E63CAC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 16:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eE/aTQ6djMnoWzBaNIR1U4SCN48oDP1mwBJ4J5i3rLU=; b=QpzRQdN2C6Jxv16ca2X3Nri1DS
	W2mOpczx1UKpyfWADSrO7g4JmJupQtolPqZlrJtZu8GPw2qQQB1NaWPXUYnbzUewmCjpcxq8WM5al
	A1aJwUGE69B8TlELrWmGkEQCz9Hb5thO/MBRRG6nITRYJvMYx54hwYy+dw7436/BckbCayWfJickX
	O85BPq+86ZU0lLrbyipKyHpT0oOmyQK8WOHxKzxHD/f1xmpkLh5qU+ZGZC0x42L227BimKoFwUcnV
	dFJUdr2bXs9T+yivqzn0wTKSbUa7BkpvTs9/FKMSnqb5fVfLwIX3gEEBigMcmO0pmFkuuuK5RPxyx
	yIVjOZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk3AA-0000000BJtn-1vjF;
	Sun, 25 Jan 2026 16:40:34 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk3A7-0000000BJtE-4Afp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 16:40:33 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a0c20ee83dso36496555ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 08:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769359230; x=1769964030; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eE/aTQ6djMnoWzBaNIR1U4SCN48oDP1mwBJ4J5i3rLU=;
        b=b8sX5kWVHQYRvJwjHYrBipfDLNtj7hd106X4cMFo/yKLUm1FeKoESZdT2djdlVCSwv
         l5L0ZSNeGmodzki7+7V/Yt42pACUjW5XWaOBCAv4OvAVpXKRoj70we3LkrjmLZ8bnFn/
         74xV4NzTrW14AH9k7iZrX4J16BUuFfogJnJpgPCAtNRHtqDwC8AIDpoatyI2gqBJKb8E
         TJYI3GRU2Moc/gez1DQFmWGHTHYDz0YUlkJaVJDUzb5AAJh0bVyR0u77/a5iyDG4bZos
         Tq6kBITVsDYr6T/L/FiYYiRI1cpvjCHwh7yhaUcNKGWB4b5W2NwmkaBC5b5iVC+oppVc
         1s5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769359230; x=1769964030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eE/aTQ6djMnoWzBaNIR1U4SCN48oDP1mwBJ4J5i3rLU=;
        b=i4kvAkaZykXAC1qhzYaKYeYQViBInTw3JP053uyxNMPBF7FoIE3RRA7ut7IzcsDdwO
         Ni0OGkBaFo9t8SHpQE1IjMBvhfKUilWCWi5NUv+/6B/KKuMD7U6Xy8b5Pd70e2HTU+yu
         cb+en6Cfzu+3Fezbgg57WgaAjXDGSDqePqzQqI9Kt75wKVx7cFp3xQWLZAxV4G2M9CMu
         6yyaWbjJP0np/Awn6JcQTnzrpNpWK2joEVMxhM0kdq78H7hBcvFttji53I8yqRN/zpLD
         WjieL21SZoAv5SlgsImLS1qIvUMHNKTg+lRwRl16zULS+venCC32zHP4ku8tO1f7L9EE
         yA+A==
X-Gm-Message-State: AOJu0YwqluISwoMEi7YhzTm84YeeZUiv8VvEDuJ1NCsofTrcNFjTvVC8
	wAnk804YhcSH3g42D4kE26k6yMymXQmOhHSZ5/icXpwot4aVI6FiWpLi
X-Gm-Gg: AZuq6aJQlqGKIzjtRpEz+f/splEpBGbh+zY2/z/8slu1lk4goJTviFytXZ6r7+SdFfG
	Wab9QHZFGg6buB6sf0cQ5weeG2A9UGuJR2NZ+PaFSd8m+m80haTFeDxcS0CFGoS5Qp7l+PeWcUI
	2rmPH8j6L2dYxJi3ePH5Bfd9Qzb+NOB5f63eGfQr/BTuUUtU9kOxOjPZeiphlpUcjplP+fD4lQD
	MyWaPA17vzWkPnW8i+gNRn3yV/KqpRfsEgm0ASR3isDIrPkd03mZ3cI/HYRULCLkJ2NYrvPk8Wb
	XC0TgFXIeFKM1cfuOwOtyrjtIwkfO0B/YLAA3gYRBTHxKTtILasKb6Z9VK8fFESVwLldi/HklqL
	AFSk9cBxdSoUw/R0a+By7TSxkNOOeLoywY+1uCYwVjb2r3IcI2Sbg3UNltRzV17arGLHkB7iERp
	52JP5jgpHUqC/FObKL6zeDNfpctsClOUk=
X-Received: by 2002:a17:903:448:b0:2a1:3ade:c351 with SMTP id d9443c01a7336-2a8452223bamr13723535ad.2.1769359230057;
        Sun, 25 Jan 2026 08:40:30 -0800 (PST)
Received: from DESKTOP-3LEPQG8.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97667sm70633225ad.56.2026.01.25.08.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 08:40:29 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: linux@armlinux.org.uk,
	johannes@sipsolutions.net,
	masahiroy@kernel.org,
	jgross@suse.com,
	nsc@kernel.org,
	kees@kernel.org,
	tglx@kernel.org,
	mingo@kernel.org,
	frederic@kernel.org,
	paulmck@kernel.org,
	peterz@infradead.org,
	mathieu.desnoyers@efficios.com,
	luto@kernel.org,
	edumazet@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xie Yuanbin <qq570070308@gmail.com>
Subject: [PATCH 0/9] ARM: fix wrong lockdep hardirqs state
Date: Mon, 26 Jan 2026 00:40:07 +0800
Message-ID: <20260125164016.331257-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_084032_142793_B31112D3 
X-CRM114-Status: GOOD (  13.46  )
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

Hello, everyone!

For latest linux-next kernel, commit ca3a02fda4da8e2c1cb6 ("Add
linux-next specific files for 20260123"), using default
multi_v7_defconfig, setting CONFIG_PROVE_LOCKING=y,
CONFIG_NO_HZ_FULL=y, and then boot with valid `nohz_full=` cmdline, the
following WARNING will be triggered:
```log
[    4.763050] ------------[ cut here ]------------
[    4.763244] WARNING: kernel/context_tracking.c:450 at __ct_user_enter+0x180/0x184, CPU#0: bash/1
[    4.764815] Modules linked in:
[    4.765386] CPU: 0 UID: 0 PID: 1 Comm: bash Not tainted 6.19.0-rc6-next-20260123 #1 VOLUNTARY
[    4.765761] Hardware name: Generic DT based system
[    4.766105] Call trace:
[    4.766151]  unwind_backtrace from show_stack+0x10/0x14
[    4.766686]  show_stack from dump_stack_lvl+0x68/0x80
[    4.766919]  dump_stack_lvl from __warn+0xf0/0x270
[    4.767140]  __warn from warn_slowpath_fmt+0xc0/0x194
[    4.767542]  warn_slowpath_fmt from __ct_user_enter+0x180/0x184
[    4.767792]  __ct_user_enter from user_enter_callable+0x64/0x6c
[    4.768105]  user_enter_callable from no_work_pending+0x8/0x4c
[    4.768415] Exception stack(0xf0849fb0 to 0xf0849ff8)
[    4.768816] 9fa0:                                     00000000 00000000 00000000 00000000
[    4.769060] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    4.769335] 9fe0: 00000000 beaf2ef0 00000000 b6f10dec 00000010 00000000
[    4.769669] irq event stamp: 211021
[    4.770932] hardirqs last  enabled at (211021): [<c0300114>] no_work_pending+0x4/0x4c
[    4.771687] hardirqs last disabled at (211020): [<c032a064>] do_work_pending+0x48/0xa4
[    4.772290] softirqs last  enabled at (210994): [<c0371354>] handle_softirqs+0x434/0x4dc
[    4.772902] softirqs last disabled at (210987): [<c0371654>] __irq_exit_rcu+0xd0/0x204
[    4.773359] ---[ end trace 0000000000000000 ]---
```

When fixing this issue, I found that because the kernel entry of arm
hadn't kept pace with other architectures for a long time, there were
other issues at returning to user, such as missing statistics
of rseq exit: When CONFIG_RSEQ_STATS=y, the exit entry of
debugfs/rseq/status is always 0.

I think the best adaptation method is to call
syscall_enter_from_user_mode(), syscall_exit_to_user_mode(),
irqentry_enter_from_user_mode(), and irqentry_exit_to_user_mode()
directly. However, this requires too many modifications to the existing
code.

Therefore, I chose a compromise solution:
This series refers to the implementation of the four functions mentioned
above and undergoes minor refactoring.

Xie Yuanbin (9):
  ARM: assembler: add save argument to enable_irq macro
  ARM: entry: remove macros ct_user_enter() and ct_user_exit()
  ARM: entry: fix wrong lockdep hardirqs state
  ARM: entry: use exit_to_user_mode() instead of user_enter_callable()
  ARM: entry: fix missing statistics of rseq exit
  ARM: entry: add tick_nohz_user_enter_prepare() if CONFIG_GENERIC_ENTRY
  ARM: entry: call __exit_to_user_mode_validate() when returning to user
  ARM: entry: use enter_from_user_mode() instead of user_exit_callable()
  ARM: entry: remove redundant asm_trace_hardirqs_on()

 arch/arm/include/asm/assembler.h    |  4 +--
 arch/arm/include/asm/entry-common.h | 11 ++++++++
 arch/arm/kernel/Makefile            |  2 +-
 arch/arm/kernel/entry-armv.S        |  5 +---
 arch/arm/kernel/entry-common.S      | 23 +++++------------
 arch/arm/kernel/entry-header.S      | 28 --------------------
 arch/arm/kernel/entry.c             | 40 +++++++++++++++++++++++++++++
 arch/arm/kernel/signal.c            |  7 +----
 8 files changed, 63 insertions(+), 57 deletions(-)
 create mode 100644 arch/arm/include/asm/entry-common.h
 create mode 100644 arch/arm/kernel/entry.c

-- 
2.51.0


