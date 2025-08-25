Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781D1CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 21:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BqZ4/31f0Gtlx5+7VYAHWFz+uBSEbjWh2SiS3l8pvq8=; b=csSc67YrzMzmKTrdMBLSKvSLDg
	av/xxZdjgeZEEL9WiL4d1hR8n4xcNnNNZxRg/fVCG5+GQBsXd2ofC7ijnd5SVmlCDS+KiLmYrkKtN
	cOp4EouysmfVV06N6ub1ku/MkLeAOEEfrV5oscTRD4KL+lmzrfOonv6Gn9va+KOenaQP8Z4Rm5Z48
	LWRKcXVDz5K1OwZJCQcjTDPyoK7r5mJx9ZekQ2UxyGGrImRRDR9KhkYzPith8CjyuENciQP55su7k
	gPelon6D/0pDw1JiIckaS/g+KtEsURh9SdFZA7P1yLoxR6f4QUMm4Pjez7pqhNynmOaoxj8H5SL2O
	+1RexOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqeTP-00000009kWn-2EOn;
	Mon, 25 Aug 2025 21:11:27 +0000
Received: from mail-io1-f78.google.com ([209.85.166.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqeQk-00000009kGJ-3i4t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 21:08:44 +0000
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-88432e1ea71so1274961239f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 14:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756156121; x=1756760921;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BqZ4/31f0Gtlx5+7VYAHWFz+uBSEbjWh2SiS3l8pvq8=;
        b=NmJA1NcwK7FAu8hQimWP06liBM6ZJYRadQXUlkHp8kVGNVhzzS64giomtcOcsPMr+D
         2byaxC/D1jpadxSyroiODRWh6DeR3nFGr4DOyC7JfCM/0OBNoVEQoxjv/bNL5/YUuf58
         7JLJFocxjUVdBQ6h23E7mcBIcS2gVojItK+GSHwei5++9j0WSkNNXZWIMuXaDJ+pVS3Q
         QiyfnpIfRppL4xx0Ez6alMk80MD26zL4BQ0zPSPrjEoiy7vvW5qwLiaqdz+E5yOc4RJP
         YDJcraZBLOA/WXOldZWEU6dRgZOrBtUZzqTsNkA9EjQiw2Kx1PizbUPKAoAJh2R3+Xmw
         5WTA==
X-Forwarded-Encrypted: i=1; AJvYcCUP8o3nsb6wuLyLYFg9mR/paFWIfiXLqKdMfX8DjiugxY5FTl/WWvJPdGiv/jWN0exk3jJO7QvU8DZomtMDJ49Q@lists.infradead.org
X-Gm-Message-State: AOJu0YzBbH4kB1plN01DPQalU5RzGydlubUMgCNKy7FH4kxJfug4L0LX
	z6YIlPIbtYa2iQOob1t+NkSgQ2c44SiqYiheS44EUBKaEQ6xUIYaLd4H2bzpdYnocCxW9YLP92T
	iR4KAp68bb0HrA8A1KFAvvVNxXtuh5sBkTgqSbgjL/gMjDxxSeoBD8jxkCzE=
X-Google-Smtp-Source: AGHT+IGpS1LzWvp0I6RmvMl/qq93Vsp8qCYZ44qc949rEp5qDgNdDz744+IAFZov/EbEy+xcBL5nFoRh5qOVdUWsvpJwmA8GhIZ1
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fe1:b0:3e5:7e26:2f90 with SMTP id
 e9e14a558f8ab-3e922504b72mr209775655ab.24.1756156121309; Mon, 25 Aug 2025
 14:08:41 -0700 (PDT)
Date: Mon, 25 Aug 2025 14:08:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68acd0d9.a00a0220.33401d.048b.GAE@google.com>
Subject: [syzbot] [kvmarm?] [kvm?] WARNING: locking bug in vgic_put_irq
From: syzbot <syzbot+cef594105ac7e60c6d93@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	suzuki.poulose@arm.com, syzkaller-bugs@googlegroups.com, will@kernel.org, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_140842_924836_D36154F1 
X-CRM114-Status: UNSURE (   7.37  )
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

HEAD commit:    7b8346bd9fce KVM: arm64: Don't attempt vLPI mappings when ..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
console output: https://syzkaller.appspot.com/x/log.txt?x=17b4e862580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7c53d3478750eda0
dashboard link: https://syzkaller.appspot.com/bug?extid=cef594105ac7e60c6d93
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15860634580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1074e862580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-7b8346bd.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/74f545807499/vmlinux-7b8346bd.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d83062566dc7/Image-7b8346bd.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cef594105ac7e60c6d93@syzkaller.appspotmail.com

=============================
[ BUG: Invalid wait context ]
6.16.0-rc3-syzkaller-g7b8346bd9fce #0 Not tainted
-----------------------------
syz.0.29/3743 is trying to lock:
a3ff80008e2e9e18 (&xa->xa_lock#20){....}-{3:3}, at: vgic_put_irq+0xb4/0x190 arch/arm64/kvm/vgic/vgic.c:137
other info that might help us debug this:
context-{5:5}
3 locks held by syz.0.29/3743:
 #0: a3ff80008e2e90a8 (&kvm->slots_lock){+.+.}-{4:4}, at: kvm_vgic_destroy+0x50/0x624 arch/arm64/kvm/vgic/vgic-init.c:499
 #1: a3ff80008e2e9fa0 (&kvm->arch.config_lock){+.+.}-{4:4}, at: kvm_vgic_destroy+0x5c/0x624 arch/arm64/kvm/vgic/vgic-init.c:500
 #2: 58f0000021be1428 (&vgic_cpu->ap_list_lock){....}-{2:2}, at: vgic_flush_pending_lpis+0x3c/0x31c arch/arm64/kvm/vgic/vgic.c:150
stack backtrace:
CPU: 0 UID: 0 PID: 3743 Comm: syz.0.29 Not tainted 6.16.0-rc3-syzkaller-g7b8346bd9fce #0 PREEMPT 
Hardware name: linux,dummy-virt (DT)
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 print_lock_invalid_wait_context kernel/locking/lockdep.c:4833 [inline]
 check_wait_context kernel/locking/lockdep.c:4905 [inline]
 __lock_acquire+0x978/0x299c kernel/locking/lockdep.c:5190
 lock_acquire+0x14c/0x2e0 kernel/locking/lockdep.c:5871
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0x5c/0x7c kernel/locking/spinlock.c:162
 vgic_put_irq+0xb4/0x190 arch/arm64/kvm/vgic/vgic.c:137
 vgic_flush_pending_lpis+0x24c/0x31c arch/arm64/kvm/vgic/vgic.c:158
 __kvm_vgic_vcpu_destroy+0x44/0x500 arch/arm64/kvm/vgic/vgic-init.c:455
 kvm_vgic_destroy+0x100/0x624 arch/arm64/kvm/vgic/vgic-init.c:505
 kvm_arch_destroy_vm+0x80/0x138 arch/arm64/kvm/arm.c:244
 kvm_destroy_vm virt/kvm/kvm_main.c:1308 [inline]
 kvm_put_kvm+0x800/0xff8 virt/kvm/kvm_main.c:1344
 kvm_vm_release+0x58/0x78 virt/kvm/kvm_main.c:1367
 __fput+0x4ac/0x980 fs/file_table.c:465
 ____fput+0x20/0x58 fs/file_table.c:493
 task_work_run+0x1bc/0x254 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 do_notify_resume+0x1b4/0x270 arch/arm64/kernel/entry-common.c:151
 exit_to_user_mode_prepare arch/arm64/kernel/entry-common.c:169 [inline]
 exit_to_user_mode arch/arm64/kernel/entry-common.c:178 [inline]
 el0_svc+0xb4/0x160 arch/arm64/kernel/entry-common.c:768
 el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600


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

