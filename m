Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F125EC53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 00:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j8PbTbY2wedKvmEe4vPFLG8ALhOZp0GgcpYiFZK/Frc=; b=kgFQRrBmTAf2vsnZCtsiF1f3dg
	90EC7fSOPedewVdvazDL8JrlabTeDSYh1BQV6sPu0PqiZ1h/V+dlCHGp3h2Ir0/wxUfGs8905wSZt
	/B0FaaVefJ/65hkAB4y5gSTzOPvXjFeSEeCG8b0/CwQYL7S1lhLfPr/9ysq0u9xahK5sw8KHtWUGd
	WTdIgFg1V9Aiv7VujgYdSVNZ4+16sLx2PejoNNXwusA/CZNo/1L55Wya9bSxgtZ8LtLZFC6qIKtwN
	OIHWm3WJbxBZb8YCSBFB/+jT7hPuNVL3klSjqcRxRy0QE/NNNJZ7zKqcvASjwAyOVQCBlYree3cun
	9e0fXCeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1worqe-00000006VIx-3pHn;
	Wed, 29 Jul 2026 00:08:36 +0000
Received: from mail-ot1-f79.google.com ([209.85.210.79])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1worqb-00000006VIc-3JSV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 00:08:35 +0000
Received: by mail-ot1-f79.google.com with SMTP id 46e09a7af769-7eb6a8c61deso328601a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 17:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785283711; x=1785888511;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8PbTbY2wedKvmEe4vPFLG8ALhOZp0GgcpYiFZK/Frc=;
        b=sU6vE8uvqmQjLFw5dBoZcAX9c7CGLJDGw3MqtUAuPkunW+SAnbDe9ObhIAdbaWRQbO
         +czOu0uaZ82mTVgRkDjSAhfzAyxKllCLSo9A8xgEaJXnp/TX/fDze9pSZXAUNX+LrqvZ
         eCop/vV6SfmW6ccIe3Jt2HFMAqG/upA0X/cvqAbZl/puQTHsdyfIUltA9HYMCbAUYWMD
         AW+jR5APg2xFKH+nyyy+XREJKg0H+xMctWHUZs3WBEVi113K9Rfx4opErQG86IUtTJjZ
         RJ1QAlvFZOYjSrVJCq931kKE39/WPl9sswtP1NMCqEVThKye6tJDVjqJZOtb3CXUVw/3
         57Ow==
X-Gm-Message-State: AOJu0YzMxrEsXxtvNUcwhHgtrrVrX5WEx9HgyPFhzQJWMN7XCLYdtiY4
	QZJcyFWhM48iFRVlmel413A4ILPJ/+Cqk+oeuMOjfGXJN22DO1yGVPjimB8nhqqofvpENf+8TCH
	neWYVhCqNuV+ZlGSx2fAx5obg8kESrzsOHnI0uOmP0ZxYtioBDVbzqr2eECsojQ==
MIME-Version: 1.0
X-Received: by 2002:a05:6808:144a:b0:495:28f0:7d with SMTP id
 5614622812f47-4ad5bd567ebmr2574834b6e.33.1785283711326; Tue, 28 Jul 2026
 17:08:31 -0700 (PDT)
Date: Tue, 28 Jul 2026 17:08:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a69447f.6bd615f2.c0aa.0002.GAE@google.com>
Subject: [syzbot] [kernel?] WARNING in its_msi_teardown
From: syzbot <syzbot+229d761b8a110e6de517@syzkaller.appspotmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	maz@kernel.org, syzkaller-bugs@googlegroups.com, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_170833_899841_EE009372 
X-CRM114-Status: UNSURE (   8.61  )
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

HEAD commit:    b66b0005b6ce Merge branches 'for-next/fixes' and 'for-next..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=15f7d746580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=72c97575381cec47
dashboard link: https://syzkaller.appspot.com/bug?extid=229d761b8a110e6de517
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1667e09e580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17525fde580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/63e3226301fe/disk-b66b0005.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b268844cbd22/vmlinux-b66b0005.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9440dfc93d1e/Image-b66b0005.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+229d761b8a110e6de517@syzkaller.appspotmail.com

 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:736
 el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:755
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594
------------[ cut here ]------------
WARNING: drivers/irqchip/irq-gic-v3-its.c:2251 at its_lpi_free drivers/irqchip/irq-gic-v3-its.c:2251 [inline], CPU#0: syz.0.18/4916
WARNING: drivers/irqchip/irq-gic-v3-its.c:2251 at its_msi_teardown+0x3a4/0x424 drivers/irqchip/irq-gic-v3-its.c:3644, CPU#0: syz.0.18/4916
Modules linked in:
CPU: 0 UID: 0 PID: 4916 Comm: syz.0.18 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/02/2026
pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : its_lpi_free drivers/irqchip/irq-gic-v3-its.c:2251 [inline]
pc : its_msi_teardown+0x3a4/0x424 drivers/irqchip/irq-gic-v3-its.c:3644
lr : its_lpi_free drivers/irqchip/irq-gic-v3-its.c:2251 [inline]
lr : its_msi_teardown+0x3a4/0x424 drivers/irqchip/irq-gic-v3-its.c:3644
sp : ffff800098017560
x29: ffff8000980175f0 x28: ffff0000cfc75930 x27: 1fffe00019f8eb26
x26: 1fffe00019f8eb22 x25: ffff0000c13e1000 x24: dfff800000000000
x23: ffff700013002eac x22: 00000000fffffff4 x21: ffff800098017580
x20: ffff0000c1e07ce0 x19: ffff0000cfc75900 x18: 00000000ffffffff
x17: 70202c31206c6176 x16: 0000000000000001 x15: 0000000000000000
x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000000
x11: 0000000000000000 x10: 0000000000000003 x9 : 0000000000000000
x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
x5 : 00000000ffffffff x4 : 0000000000000cc0 x3 : ffff800081ba1c7c
x2 : 00000000fffffff4 x1 : ffff0000cfb10000 x0 : 0000000000000000
Call trace:
 its_lpi_free drivers/irqchip/irq-gic-v3-its.c:2251 [inline] (P)
 its_msi_teardown+0x3a4/0x424 drivers/irqchip/irq-gic-v3-its.c:3644 (P)
 its_msi_teardown+0xa0/0xb8 drivers/irqchip/irq-gic-its-msi-parent.c:249
 msi_remove_device_irq_domain+0x16c/0x27c kernel/irq/msi.c:1127
 msi_device_data_release+0x38/0x9c kernel/irq/msi.c:293
 dr_node_release+0x4c/0x5c drivers/base/devres.c:122
 release_nodes+0xac/0x108 drivers/base/devres.c:546
 devres_release_all+0x138/0x1a4 drivers/base/devres.c:576
 device_unbind_cleanup+0x80/0x1c8 drivers/base/dd.c:597
 __device_release_driver drivers/base/dd.c:1354 [inline]
 device_release_driver_internal+0x19c/0x20c drivers/base/dd.c:1372
 device_release_driver+0x28/0x38 drivers/base/dd.c:1395
 pci_stop_dev drivers/pci/remove.c:27 [inline]
 pci_stop_bus_device+0x108/0x14c drivers/pci/remove.c:93
 pci_stop_and_remove_bus_device+0x84/0xd0 drivers/pci/remove.c:128
 pci_stop_and_remove_bus_device_locked+0x24/0x38 drivers/pci/remove.c:136
 remove_store+0xdc/0x148 drivers/pci/pci-sysfs.c:523
 dev_attr_store+0x6c/0x90 drivers/base/core.c:2505
 sysfs_kf_write+0xe0/0x108 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x260/0x3b8 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x51c/0xa0c fs/read_write.c:687
 ksys_write+0x12c/0x228 fs/read_write.c:739
 __do_sys_write fs/read_write.c:750 [inline]
 __se_sys_write fs/read_write.c:747 [inline]
 __arm64_sys_write+0x7c/0x90 fs/read_write.c:747
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:736
 el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:755
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594
irq event stamp: 1608
hardirqs last  enabled at (1607): [<ffff8000868e3f4c>] irqentry_exit_to_kernel_mode_after_preempt include/linux/irq-entry-common.h:507 [inline]
hardirqs last  enabled at (1607): [<ffff8000868e3f4c>] arm64_exit_to_kernel_mode+0x80/0x94 arch/arm64/kernel/entry-common.c:62
hardirqs last disabled at (1608): [<ffff8000868dfe78>] el1_brk64+0x20/0x54 arch/arm64/kernel/entry-common.c:425
softirqs last  enabled at (1528): [<ffff800084c10fac>] __alloc_skb+0x1c0/0x610 net/core/skbuff.c:698
softirqs last disabled at (1526): [<ffff800084c10f94>] local_bh_disable include/linux/bottom_half.h:20 [inline]
softirqs last disabled at (1526): [<ffff800084c10f94>] __alloc_skb+0x1a8/0x610 net/core/skbuff.c:697
---[ end trace 0000000000000000 ]---
pci 0000:00:01.0: [1af4:1005] type 00 class 0x00ff00 conventional PCI endpoint
pci 0000:00:01.0: BAR 0 [io  0x1000-0x101f]
pci 0000:00:01.0: BAR 1 [mem 0x10110080-0x101100bf]
pci 0000:00:01.0: BAR 1 [mem 0x10110080-0x101100bf]: assigned
pci 0000:00:01.0: BAR 0 [io  0x1000-0x101f]: assigned
virtio-pci 0000:00:01.0: virtio_pci: leaving for legacy driver


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

