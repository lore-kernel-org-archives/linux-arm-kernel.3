Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90D6C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 00:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ea3qbdppzHtrp+OgojMx38Fd+crkA6AwPr5+Agag3ZU=; b=T9ze6wzLY2rNPV+7ad/bgCZwX2
	fUWH99qDhmCBK9v6sUoIb6nvqnebmlhVaqoiddl5adHVNlxwOl8ppQTsnTGTwZG1Tl+yXRImAGnxy
	rzUHlkhCFCKgIPvImV7J0KN6p2H/MV5MY/QlL+xcPKX0btBPBKARVXiox8BKSO5IaNMhfhECRURip
	mwWcClKwCe86lSJIofNTs6frqHi0DAADUDq/iZa6c0ay8Zrv4/qjpZncGu+EXn/jdbvXlotG0xkx7
	WSJzDZLZAK3oYNfg0nn0tGim8md/1jWTdurT6ovGwJwaqxmICmC/+sNPsbx0lU6pne9Szo6eQQxPD
	CZw7TKMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uakgK-0000000HDAf-2u8D;
	Sun, 13 Jul 2025 00:35:04 +0000
Received: from mail-io1-f77.google.com ([209.85.166.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uakEj-0000000HBWr-0Oix
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 00:06:36 +0000
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-86cf753423cso290212339f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Jul 2025 17:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752365190; x=1752969990;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ea3qbdppzHtrp+OgojMx38Fd+crkA6AwPr5+Agag3ZU=;
        b=MD4oGhnLz2d2UOYgDmbKaeIZj1wR2UX0KAT9KOBb5CqyKdjYFyEtevzrLJlgLaaSv+
         yvhWIJInHgw5FX/caKXQJUr8qcVYCxGj8OxWqwGs2zQwoSPupJ7ZNplj0c0BkGuKsirf
         f7oqtp8/gB9jpEt5d0phBuhIE/kFio6UlmV70xn8TaoIbfb3QKYY+YIHbiLf12aa9QRu
         24tWYJOYYHgLt4STir5vPgBmNOxCPMGAxicx5E07W2cpUFq3quJcyZA9AeLdHfqrICjH
         xJ3P6pyNdNGVYsnokd4TEoQDeRGPdWh9tqbzZiVIvhPBuSSIVhG0yoKU9OH5yN9XdlDr
         vXDg==
X-Forwarded-Encrypted: i=1; AJvYcCVIWDmIoMAzQb5Pb/wda8cjT+pN4xupzdKhR9YRRSpFxUDO2Vo0S22IEJ25WmFn7L3fNC0Haxs0OpyaBBUEwDmK@lists.infradead.org
X-Gm-Message-State: AOJu0Yzyn927Rc6wvxgZ8WFccPoDWetEy5z1cCJ7kmFgCWhCniC1kx8L
	KI7QjkacuEWnON2IFOHyfyVcGO/1rObrYIZU6FlCiDt+iGeOhNqYz15MMYK6yvMXOx/5BPULGn9
	3Z0y7PyKgcNHNDWur+EPUH8cW1F58xKVZHq66PM/iMGcJytRA1zCxc//M1eU=
X-Google-Smtp-Source: AGHT+IEn2iy03zAoER7fhAagB2X3tgSkQ4pMNqBWX0o7nANF/t35cPk7BhMK5Uk659GNlsCe1vfG1R/XR9Km2pqB+RIvXdMOiW6X
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4010:b0:86d:71:d9a with SMTP id
 ca18e2360f4ac-879787b862emr869201339f.2.1752365190087; Sat, 12 Jul 2025
 17:06:30 -0700 (PDT)
Date: Sat, 12 Jul 2025 17:06:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6872f886.a70a0220.3b380f.000d.GAE@google.com>
Subject: [syzbot] [kvmarm?] WARNING in pend_serror_exception
From: syzbot <syzbot+1f6f096afda6f4f8f565@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com, 
	syzkaller-bugs@googlegroups.com, will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_170633_138993_6D26700A 
X-CRM114-Status: UNSURE (   7.58  )
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

HEAD commit:    15724a984643 Merge branch 'kvm-arm64/doublefault2' into kv..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
console output: https://syzkaller.appspot.com/x/log.txt?x=123090f0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=82bd3cd421993314
dashboard link: https://syzkaller.appspot.com/bug?extid=1f6f096afda6f4f8f565
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1324fe8c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1206ed82580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-15724a98.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ec0f03d375a1/vmlinux-15724a98.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a36232f8c6dd/Image-15724a98.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1f6f096afda6f4f8f565@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 3603 at arch/arm64/kvm/inject_fault.c:71 pend_serror_exception+0x19c/0x5ac arch/arm64/kvm/inject_fault.c:71
Modules linked in:
CPU: 0 UID: 0 PID: 3603 Comm: syz.2.16 Not tainted 6.16.0-rc3-syzkaller-g15724a984643 #0 PREEMPT 
Hardware name: linux,dummy-virt (DT)
pstate: 81402009 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
pc : pend_serror_exception+0x19c/0x5ac arch/arm64/kvm/inject_fault.c:71
lr : pend_serror_exception+0x19c/0x5ac arch/arm64/kvm/inject_fault.c:71
sp : ffff80008e807930
x29: ffff80008e807930 x28: d7f0000016ae8028 x27: 0000000000000001
x26: 0000000000000000 x25: 0000000000000001 x24: 00000000000000d7
x23: d7f0000016ae82a8 x22: 00000000000000d7 x21: d7f0000016ae8e81
x20: 0000000000000007 x19: efff800000000000 x18: 0000000000000000
x17: 000000000000005a x16: ffff800080011d9c x15: 0000000020000200
x14: ffffffffffffffff x13: 0000000000000028 x12: 0000000000000081
x11: 81f000001f049564 x10: 0000000000ff0100 x9 : 0000000000000000
x8 : 81f000001f048000 x7 : ffff800080b08704 x6 : ffff80008e807a88
x5 : ffff80008e807a88 x4 : 0000000000000001 x3 : ffff8000801a2e80
x2 : 0000000000000000 x1 : 0000000000000002 x0 : 0000000000000000
Call trace:
 pend_serror_exception+0x19c/0x5ac arch/arm64/kvm/inject_fault.c:71 (P)
 kvm_inject_serror_esr+0x274/0xe40 arch/arm64/kvm/inject_fault.c:330
 __kvm_arm_vcpu_set_events+0x1d4/0x238 arch/arm64/kvm/guest.c:-1
 kvm_arm_vcpu_set_events arch/arm64/kvm/arm.c:1698 [inline]
 kvm_arch_vcpu_ioctl+0xed8/0x16b0 arch/arm64/kvm/arm.c:1810
 kvm_vcpu_ioctl+0x5c4/0xc2c virt/kvm/kvm_main.c:4632
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __arm64_sys_ioctl+0x18c/0x244 fs/ioctl.c:893
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x90/0x2b4 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x180/0x2f4 arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x58/0x74 arch/arm64/kernel/syscall.c:151
 el0_svc+0x58/0x160 arch/arm64/kernel/entry-common.c:767
 el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
irq event stamp: 2728
hardirqs last  enabled at (2727): [<ffff80008653cb88>] __raw_read_unlock_irqrestore include/linux/rwlock_api_smp.h:241 [inline]
hardirqs last  enabled at (2727): [<ffff80008653cb88>] _raw_read_unlock_irqrestore+0x44/0xbc kernel/locking/spinlock.c:268
hardirqs last disabled at (2728): [<ffff800086517e08>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
softirqs last  enabled at (2702): [<ffff8000800c988c>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
softirqs last disabled at (2700): [<ffff8000800c9858>] local_bh_disable+0x10/0x34 include/linux/bottom_half.h:19
---[ end trace 0000000000000000 ]---


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

