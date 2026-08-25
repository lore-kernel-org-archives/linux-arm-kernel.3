Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED10C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 19:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I3I/bN/f/dStTP3Iv4n/YP1BIZquoh3JCsU0DRi791o=; b=USs3oT8EkJixgUqHYSn3p48OW4
	AvR6obBccv4tu6ObaDAq2IutzkEus6MUHxyu1Lx7oSD7pxB8sitDZCa4ZIX3nIwD8N15+w8FyYU1H
	E7O+Um13VUheQOmmdf6xCmI1ljEQuK/lmNK43a+ESbKL4wF9FQrXCKT/0N8S2lUNgkVx9VHSydX4d
	iukEv1DGYajWaBjCWi+ReotuIwDRU/dJI7shBcTxINV6xMfBgEVhJRBKct2ZltKItx66lDAjI4U9H
	3GUhbks+YimuBeTrhdzJoU/xnQzeK9mHJAq5Oi6pG4biLV3Hl5zVsxICNl6LPfC2C3ybXNu2VSskd
	fr3z6nCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywbV-00000001MxE-36yv;
	Tue, 25 Aug 2026 19:14:37 +0000
Received: from mail-oi2-f1.google.com ([74.125.231.193])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywbT-00000001MwQ-0wb3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 19:14:36 +0000
Received: by mail-oi2-f1.google.com with SMTP id 5614622812f47-4960b753d6fso84433b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 12:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787685273; x=1788290073;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I3I/bN/f/dStTP3Iv4n/YP1BIZquoh3JCsU0DRi791o=;
        b=PgiPwIOIb+p5dqlXscFRk46P9V6geG+UfMP8RLR9kDER73SJwc6trOkb4CSobBgFiT
         aFrTMbL07wXAdYG+SGPJmB9EoJ8ddSfNaCKOXcfFmHvL7P6HvL8Z23RO/Rdkpxnz6lkt
         ibR0SvIdqa875cGCdHIvdKKaIrCfKv6bUu5ULVsCNWanjDOZLfWui+BQSLSM5sGBdYxi
         bKWaVffPhS+0XabSq6oo7d8l4FolFwu51j7UgcXimWYDthX6CNXDZ2Ekgm7mzwjTU2o0
         dGM8Kd8gXCQBwJkxLqqq9vI8KERTYPO7fiMhdY1VagrMjXegZzJRG+TNSeYFmbfVuXpa
         p+rg==
X-Gm-Message-State: AFuF++lgy1n2ccity7Ud1HTZ9dTBoYhCqhdijkPf6y25A6MF8RRL/H+S
	ulvNpiL7L4cp52hakYtTTEyilMh3RVGsUyGJkr5LujIyUOb/L77xKMTSGp6hUX2ArLqKhqxrW/V
	orwdSN5kbjaJxIhcY6/3e8QFNSCYhgQEhnSkxqWKfs6btuf7fC3TgWiJnf4PnXg==
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6f98:b0:48a:ddd4:d36f with SMTP id
 5614622812f47-4b3669af679mr1830916b6e.8.1787685273328; Tue, 25 Aug 2026
 12:14:33 -0700 (PDT)
Date: Tue, 25 Aug 2026 12:14:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8de999.dbb3a75c.7844.002a.GAE@google.com>
Subject: [syzbot] [kernel?] WARNING in gic_handle_irq
From: syzbot <syzbot+1e7fd72b380dc57b82b8@syzkaller.appspotmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	maz@kernel.org, syzkaller-bugs@googlegroups.com, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_121435_273956_3E130888 
X-CRM114-Status: UNSURE (   7.81  )
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

Hello,

syzbot found the following issue on:

HEAD commit:    21d6ac051080 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=12f93e79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d1128bc53f2ef7f3
dashboard link: https://syzkaller.appspot.com/bug?extid=1e7fd72b380dc57b82b8
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/88380e2ddcb9/disk-21d6ac05.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5dba5c2896b7/vmlinux-21d6ac05.xz
kernel image: https://storage.googleapis.com/syzbot-assets/52ac739e37e0/Image-21d6ac05.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1e7fd72b380dc57b82b8@syzkaller.appspotmail.com

------------[ cut here ]------------
Unexpected interrupt (irqnr 8194)
WARNING: drivers/irqchip/irq-gic-v3.c:826 at __gic_handle_irq drivers/irqchip/irq-gic-v3.c:826 [inline], CPU#0: syz.7.608/7953
WARNING: drivers/irqchip/irq-gic-v3.c:826 at __gic_handle_irq_from_irqson drivers/irqchip/irq-gic-v3.c:873 [inline], CPU#0: syz.7.608/7953
WARNING: drivers/irqchip/irq-gic-v3.c:826 at gic_handle_irq+0xf8/0x180 drivers/irqchip/irq-gic-v3.c:917, CPU#0: syz.7.608/7953
Modules linked in:
CPU: 0 UID: 0 PID: 7953 Comm: syz.7.608 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/07/2026
pstate: 634000c5 (nZCv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : __gic_handle_irq drivers/irqchip/irq-gic-v3.c:826 [inline]
pc : __gic_handle_irq_from_irqson drivers/irqchip/irq-gic-v3.c:873 [inline]
pc : gic_handle_irq+0xf8/0x180 drivers/irqchip/irq-gic-v3.c:917
lr : __gic_handle_irq drivers/irqchip/irq-gic-v3.c:826 [inline]
lr : __gic_handle_irq_from_irqson drivers/irqchip/irq-gic-v3.c:873 [inline]
lr : gic_handle_irq+0xf8/0x180 drivers/irqchip/irq-gic-v3.c:917
sp : ffff80008eb67fd0
x29: ffff80008eb67fd0 x28: ffff0000c2f78000 x27: dfff800000000000
x26: 0000000000000001 x25: 0000000000000000 x24: ffff800088af6598
x23: dfff800000000000 x22: ffff0000c2f78020 x21: ffff80008a19c000
x20: 0000000000002002 x19: 0000000000002002 x18: 1fffe00034bb7428
x17: ffff80011d2d8000 x16: ffff80008eb60000 x15: 0000000000000000
x14: 0000000000000001 x13: 0000000000000001 x12: 0000000000000000
x11: 0000000000000000 x10: 0000000000010005 x9 : 73714fb681136800
x8 : 73714fb681136800 x7 : ffff80008048c5b8 x6 : 0000000000000000
x5 : 0000000000000001 x4 : 0000000000000000 x3 : ffff8000802f6830
x2 : 0000000100010003 x1 : ffff0000c2f78000 x0 : 0000000000000000
Call trace:
 __gic_handle_irq drivers/irqchip/irq-gic-v3.c:826 [inline] (P)
 __gic_handle_irq_from_irqson drivers/irqchip/irq-gic-v3.c:873 [inline] (P)
 gic_handle_irq+0xf8/0x180 drivers/irqchip/irq-gic-v3.c:917 (P)
 call_on_irq_stack+0x30/0x48 arch/arm64/kernel/entry.S:885
 do_interrupt_handler+0xd4/0x138 arch/arm64/kernel/entry-common.c:178
 __el1_irq arch/arm64/kernel/entry-common.c:530 [inline]
 el1_interrupt+0x3c/0x60 arch/arm64/kernel/entry-common.c:543
 el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:548
 el1h_64_irq+0x6c/0x70 arch/arm64/kernel/entry.S:586
 __daif_local_irq_restore arch/arm64/include/asm/irqflags.h:175 [inline] (P)
 arch_local_irq_restore arch/arm64/include/asm/irqflags.h:195 [inline] (P)
 __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:178 [inline] (P)
 _raw_spin_unlock_irqrestore+0x44/0x98 kernel/locking/spinlock.c:198 (P)
 spin_unlock_irqrestore include/linux/spinlock.h:408 [inline]
 rmqueue_bulk mm/page_alloc.c:2555 [inline]
 __rmqueue_pcplist+0x1008/0x1630 mm/page_alloc.c:3341
 alloc_pages_bulk_noprof+0x42c/0x730 mm/page_alloc.c:5204
 ___alloc_pages_bulk mm/kasan/shadow.c:345 [inline]
 __kasan_populate_vmalloc_do mm/kasan/shadow.c:370 [inline]
 __kasan_populate_vmalloc+0xc0/0x1d0 mm/kasan/shadow.c:424
 kasan_populate_vmalloc include/linux/kasan.h:580 [inline]
 alloc_vmap_area+0xdf4/0x13e8 mm/vmalloc.c:2145
 __get_vm_area_node+0x210/0x32c mm/vmalloc.c:3248
 get_vm_area+0x9c/0xd0 mm/vmalloc.c:3290
 arena_map_alloc+0x200/0x668 kernel/bpf/arena.c:292
 map_create_alloc kernel/bpf/syscall.c:1523 [inline]
 map_create+0xa64/0x156c kernel/bpf/syscall.c:1640
 __sys_bpf+0x308/0x82c kernel/bpf/syscall.c:6395
 __do_sys_bpf kernel/bpf/syscall.c:6537 [inline]
 __se_sys_bpf kernel/bpf/syscall.c:6534 [inline]
 __arm64_sys_bpf+0xd0/0xec kernel/bpf/syscall.c:6534
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:758
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:777
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:590
irq event stamp: 15940
hardirqs last  enabled at (15939): [<ffff800086930818>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:178 [inline]
hardirqs last  enabled at (15939): [<ffff800086930818>] _raw_spin_unlock_irqrestore+0x38/0x98 kernel/locking/spinlock.c:198
hardirqs last disabled at (15940): [<ffff80008690b4b4>] __el1_irq arch/arm64/kernel/entry-common.c:527 [inline]
hardirqs last disabled at (15940): [<ffff80008690b4b4>] el1_interrupt+0x28/0x60 arch/arm64/kernel/entry-common.c:543
softirqs last  enabled at (15930): [<ffff80008030e6e4>] softirq_handle_end kernel/softirq.c:468 [inline]
softirqs last  enabled at (15930): [<ffff80008030e6e4>] handle_softirqs+0xc28/0xd98 kernel/softirq.c:650
softirqs last disabled at (15925): [<ffff8000800204c0>] __do_softirq+0x14/0x20 kernel/softirq.c:656
---[ end trace 0000000000000000 ]---


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

