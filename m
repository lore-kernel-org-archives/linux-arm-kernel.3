Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4464CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 21:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yK8ClsucKWiZ7rP6dTqe53VFnXreX3iMm3poQhOEI+w=; b=tX8yDH3aPgTpeLHBWKA6hlG1CG
	oChTntU+2hgsVUbH3jrEJe7cWDejIhGevyet5dw1ZPgq0h2RFAVUjnYMDKTOcYwTLzZgjOCTTw6Ft
	J+o/+wsR+DM6n933BFF3+38zq3ktRbyNy3BeVGztEyx+ivtQkDVD3vO5iV4tG0CosWIdXQpy5x1Gs
	u4Njq4+JmjLupIg1b8WsApAQGdDHM7mY5q40FPD54kfh5ebTIP5zg7EfVE3SGpveGt3oVhowxFjx8
	Co5JHcwuHGqFZJ2tS7r3z9LzkPXJyv8DwJxM51R6FQ8Nkf2+ikTwoWbrYQSx0Hlh+mOxBXcTUPGAu
	zMZt8LRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw5cl-0000000AIeM-2whR;
	Tue, 09 Sep 2025 21:11:35 +0000
Received: from mail-il1-f206.google.com ([209.85.166.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw5ci-0000000AIbe-1BHo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 21:11:33 +0000
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-40b48e4a0deso56179185ab.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 14:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757452290; x=1758057090;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yK8ClsucKWiZ7rP6dTqe53VFnXreX3iMm3poQhOEI+w=;
        b=IPKv4RSl5c1X1WL37oIqfPEDVe+t496I4tTNYIc9oggUt27cK1wGwgWR3eYs2yekzC
         1zzluEQDMNcCx5UdSD3NCbtmLJf9MeFgyMuTk3Hv8VbWQyRWABY1aBUU8AcryPt4jVKM
         77Sk2L6VcPgPCxe+qC+o79vslI3BDD24ykB/icfzMCAUinMPnNHPnv+1ttsf05QBoOAo
         ljlu9fEHWfyqPgtJTj2eq1H+EP9h1q1ONtqSFOO67RFmW9H8tZFOqQZZW5cf3DENr9Z/
         CTP8oNt/XOWyJSbiCj92w4hYFoRLmr+qBg6UtebT3i04rR+1Esl7nPkZ/gkUpRo2fHun
         /LFw==
X-Forwarded-Encrypted: i=1; AJvYcCVjPRdWzfrZdQTiNrggZvqk2oPBmb03yPFesoa72NQ71ltUln7O32C2Nq4l/u8PyJFZuxE4rmdwlpUejjMO8RX/@lists.infradead.org
X-Gm-Message-State: AOJu0YzL7LncJ1/LweAZLe808bDLf22htQDFlcgB4LFEPhaJkW5gJWyx
	vgkb5M83KFwvPr7fpKs1ejiVxVJI1iMhJKQCnlw11YoOAMpdjF9aXgMQbX6Uf+L8JP1w+AcZCi8
	I//lL4/gc0imwHAkKoB4xksSVGyePmGJhjCFkLkEysLRHpfyrZlFsizvZCnE=
X-Google-Smtp-Source: AGHT+IGssSVcxmkBfpblAy2nP+e5Aj6iGPblHqj/69X/ccVF/yGQCkSd5+z/RwxOxmuNFincMwwqtng89Ctn5p55ABp9QPWIGMgv
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:5e85:b0:3fd:a540:9352 with SMTP id
 e9e14a558f8ab-3fda5409466mr174561575ab.17.1757452290375; Tue, 09 Sep 2025
 14:11:30 -0700 (PDT)
Date: Tue, 09 Sep 2025 14:11:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68c09802.050a0220.3c6139.000d.GAE@google.com>
Subject: [syzbot] [kvmarm?] KASAN: invalid-access Read in __kvm_pgtable_walk
From: syzbot <syzbot+31156cb24a340d8e2c05@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com, 
	syzkaller-bugs@googlegroups.com, will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_141132_325702_28BEB9B8 
X-CRM114-Status: UNSURE (   7.61  )
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

HEAD commit:    f777d1112ee5 Merge tag 'vfs-6.17-rc6.fixes' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15f84b12580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=45bc268c8b0b2faf
dashboard link: https://syzkaller.appspot.com/bug?extid=31156cb24a340d8e2c05
compiler:       aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=117c6d62580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13e94934580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-f777d111.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3e36256124c6/vmlinux-f777d111.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ea9018353872/Image-f777d111.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+31156cb24a340d8e2c05@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: invalid-access in __kvm_pgtable_visit arch/arm64/kvm/hyp/pgtable.c:161 [inline]
BUG: KASAN: invalid-access in __kvm_pgtable_walk+0x110/0x2d0 arch/arm64/kvm/hyp/pgtable.c:237
Read at addr fdf000000f7c1000 by task syz.2.17/3592
Pointer tag: [fd], memory tag: [fe]

CPU: 1 UID: 0 PID: 3592 Comm: syz.2.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: linux,dummy-virt (DT)
Call trace:
 show_stack+0x18/0x24 arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x78/0x90 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x108/0x61c mm/kasan/report.c:482
 kasan_report+0x88/0xac mm/kasan/report.c:595
 report_tag_fault arch/arm64/mm/fault.c:326 [inline]
 do_tag_recovery arch/arm64/mm/fault.c:338 [inline]
 __do_kernel_fault+0x170/0x1c8 arch/arm64/mm/fault.c:380
 do_bad_area+0x68/0x78 arch/arm64/mm/fault.c:480
 do_tag_check_fault+0x34/0x44 arch/arm64/mm/fault.c:853
 do_mem_abort+0x44/0x94 arch/arm64/mm/fault.c:929
 el1_abort+0x40/0x60 arch/arm64/kernel/entry-common.c:481
 el1h_64_sync_handler+0x50/0xac arch/arm64/kernel/entry-common.c:597
 el1h_64_sync+0x6c/0x70 arch/arm64/kernel/entry.S:591
 __kvm_pgtable_visit arch/arm64/kvm/hyp/pgtable.c:161 [inline] (P)
 __kvm_pgtable_walk+0x110/0x2d0 arch/arm64/kvm/hyp/pgtable.c:237 (P)
 _kvm_pgtable_walk arch/arm64/kvm/hyp/pgtable.c:260 [inline]
 kvm_pgtable_walk+0xd0/0x164 arch/arm64/kvm/hyp/pgtable.c:283
 kvm_pgtable_stage2_destroy_range+0x3c/0x70 arch/arm64/kvm/hyp/pgtable.c:1563
 stage2_destroy_range arch/arm64/kvm/mmu.c:924 [inline]
 kvm_stage2_destroy+0x74/0xd0 arch/arm64/kvm/mmu.c:935
 kvm_free_stage2_pgd+0x4c/0x84 arch/arm64/kvm/mmu.c:1112
 kvm_uninit_stage2_mmu+0x1c/0x34 arch/arm64/kvm/mmu.c:1023
 kvm_arch_flush_shadow_all+0x6c/0x84 arch/arm64/kvm/nested.c:1113
 kvm_flush_shadow_all virt/kvm/kvm_main.c:343 [inline]
 kvm_mmu_notifier_release+0x30/0x84 virt/kvm/kvm_main.c:884
 mmu_notifier_unregister+0x5c/0x11c mm/mmu_notifier.c:815
 kvm_destroy_vm+0x148/0x2b0 virt/kvm/kvm_main.c:1287
 kvm_put_kvm virt/kvm/kvm_main.c:1344 [inline]
 kvm_vm_release+0x80/0xb0 virt/kvm/kvm_main.c:1367
 __fput+0xcc/0x2dc fs/file_table.c:468
 ____fput+0x14/0x20 fs/file_table.c:496
 task_work_run+0x78/0xd4 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 do_notify_resume+0x13c/0x16c arch/arm64/kernel/entry-common.c:155
 exit_to_user_mode_prepare arch/arm64/kernel/entry-common.c:173 [inline]
 exit_to_user_mode arch/arm64/kernel/entry-common.c:182 [inline]
 el0_svc+0x108/0x10c arch/arm64/kernel/entry-common.c:880
 el0t_64_sync_handler+0xa0/0xe4 arch/arm64/kernel/entry-common.c:898
 el0t_64_sync+0x1a4/0x1a8 arch/arm64/kernel/entry.S:596

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x4f7c1
flags: 0x1ffc80000000000(node=0|zone=0|lastcpupid=0x7ff|kasantag=0x2)
raw: 01ffc80000000000 ffffc1ffc03df088 ffffc1ffc02393c8 0000000000000000
raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 fff000000f7c0e00: f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5
 fff000000f7c0f00: f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5
>fff000000f7c1000: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
                   ^
 fff000000f7c1100: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
 fff000000f7c1200: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
==================================================================


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

