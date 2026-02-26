Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873F6FD8FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zmDYSkk6amWrHsgLmDE145+Yj0Kcw8ZGMbR6kx/n19I=; b=qrdXGqhlzGgtw5iZPbu5URVsqY
	HCz9snmYYvtefQLyptOS8EJBG+YY+WiSQFvUseGrb/cHjypKaxoIckAXMHVmhCi7iZ73LGSAOgM51
	dwVZFE+2MljHweBRcY+UzFOutA7YavveUzvlhC/gStRgyN7oIziB431EKqYGsgg9+kWFqz/DYS0Te
	bG/te62d7mzMq+ZS3L1kUqfS5jqJQktqj6s06QGmGaRGqhbEwn2AjOPtnbwR5z+7vt2SXD7mGDBh+
	KlytkCAg1kUB3U+G34dwBqkdvIt56H4NZkR2d2oNu72jPSbsmmmpgRtANPDBIu1pdcL+sEZqJmH6b
	bWVXB4JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd2K-00000006Rhs-1Zs4;
	Thu, 26 Feb 2026 15:12:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd1s-00000006Qw9-1wEv
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 15:11:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:To:From:Subject:
	Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=zmDYSkk6amWrHsgLmDE145+Yj0Kcw8ZGMbR6kx/n19I=; b=cBawfuvf3OZ65/ir3UrVkSqiGu
	R4GMm8ms+WNWoIvlHpq+zR3JTSNwlThfAYMSmW5iOY3bGmBvsJdhB8t3XC5oDfmrkcxV+nH8JN0QM
	zHu69ov0D0MV2jfbLRX1Nadp3J7MNVgixLEhMbTc69kZbd9QGsGlkG+fWBjitkbu04icLV2WrBzrx
	h38QohJ1aH2uz1YQ5iQlhMVAMdzMN4g8eBOLmCnbmBo2eenbnwmab2SLwKEcxizKz82rv8axeA5A9
	2A5rmsL9MTtyG2F9ibvVv7AciSRqzGbA/u3qdr6lPRs7FRB43PQ+ss5l/Pj9vBfoo6C/CGRPPe61t
	MAGSxKhg==;
Received: from mail-qk1-f197.google.com ([209.85.222.197])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd1o-0000000BH4u-3Jmv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:11:50 +0000
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71655aa11so1115784485a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 07:11:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772118706; x=1772723506;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zmDYSkk6amWrHsgLmDE145+Yj0Kcw8ZGMbR6kx/n19I=;
        b=OOrhAth4Yi47XBAExc5ASQKubEk9E7kFn8Tgo+B81TnCawMhSstSZHmvqgoIKvK+/3
         rTdmCF8zrD0qHyYoG1ifK1VQGMNU63gyZHiOrn6dC5mz7z23WNt4oh3mv9sK9pK9GD4U
         d2RDQdGtdI4sets4OxHUu6hz6hav8IYFb+oqPai2qd2ubicoczQd13fYDIUBy1evqft2
         PaoAu/oXraEfQvGzGQ4NHEDO4ilWCHMTFKNUBwOGp1SxFI4wNPIeyVsID2yIyjZAMh9w
         j1xuqX94TEJc+BnfJxDwA1ku1nI5DRLvysQVkoc9bHOKP9M1YQEJt/LwYE5OPUm9eD0a
         eQMg==
X-Forwarded-Encrypted: i=1; AJvYcCUjF/B9E1fcYDl4WQaXKD01EqPWydqXxjRiGc2xK9lahUMyoa0a6uxlOU+R2p4bwXRtoPKgjfm0jE6u1FgnL32b@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2VaQjBIYpbNZFwhmKlebIhYdVjYFGlu105Lnof6Z/ULTGB4Nl
	ivT+2oGEYqriV+bXNHZ8B11WGN2L6MXM3atFFor7qQ732XeLtx4QxnOnLAMaPgR0SLNc0T9ySOx
	mRuBnSZTpcUflqpoxXhoEmKsjBy5Te8+ltjUwxjYkoJ2Zmba0csYfxDx2NiY=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:6ac1:b0:679:f37c:f995 with SMTP id
 006d021491bc7-679f3d79437mr1157767eaf.37.1772118325826; Thu, 26 Feb 2026
 07:05:25 -0800 (PST)
Date: Thu, 26 Feb 2026 07:05:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69a06135.050a0220.305b49.0024.GAE@google.com>
Subject: [syzbot] [arm?] BUG: using __this_cpu_read() in preemptible code in __delay
From: syzbot <syzbot+b29d18a34746f34c94cc@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_151148_914240_1E7F0C8C 
X-CRM114-Status: UNSURE (   7.18  )
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

HEAD commit:    32a92f8c8932 Convert more 'alloc_obj' cases to default GFP..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1019fc02580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b77d736d2f4fe1b1
dashboard link: https://syzkaller.appspot.com/bug?extid=b29d18a34746f34c94cc
compiler:       aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-32a92f8c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/aabf4d7d9d6a/vmlinux-32a92f8c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0367e274b699/Image-32a92f8c.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b29d18a34746f34c94cc@syzkaller.appspotmail.com

BUG: using __this_cpu_read() in preemptible [00000000] code: syz.0.1012/5537
caller is __this_cpu_preempt_check+0x20/0x40 lib/smp_processor_id.c:64
CPU: 0 UID: 0 PID: 5537 Comm: syz.0.1012 Tainted: G             L      syzkaller #0 PREEMPT 
Tainted: [L]=SOFTLOCKUP
Hardware name: linux,dummy-virt (DT)
Call trace:
 show_stack+0x18/0x24 arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x7c/0xb0 lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 check_preemption_disabled+0xe0/0xe8 lib/smp_processor_id.c:47
 __this_cpu_preempt_check+0x20/0x40 lib/smp_processor_id.c:64
 __arch_counter_get_cntvct_stable arch/arm64/include/asm/arch_timer.h:195 [inline]
 __delay+0x40/0x374 arch/arm64/lib/delay.c:39
 __const_udelay+0x48/0x64 arch/arm64/lib/delay.c:66
 udelay include/asm-generic/delay.h:62 [inline]
 snd_timer_close_locked+0x258/0x94c sound/core/timer.c:443
 snd_timer_close+0xa4/0x120 sound/core/timer.c:476
 snd_seq_timer_close+0x88/0xd0 sound/core/seq/seq_timer.c:311
 queue_delete+0x50/0xac sound/core/seq/seq_queue.c:126
 snd_seq_queue_delete+0x2c/0x58 sound/core/seq/seq_queue.c:188
 snd_seq_ioctl_delete_queue+0x6c/0xa0 sound/core/seq/seq_clientmgr.c:1546
 call_seq_client_ctl+0x94/0x120 sound/core/seq/seq_clientmgr.c:2419
 snd_seq_kernel_client_ctl+0x68/0x100 sound/core/seq/seq_clientmgr.c:2447
 delete_seq_queue.isra.0+0xbc/0x124 sound/core/seq/oss/seq_oss_init.c:371
 snd_seq_oss_release+0x13c/0x1a0 sound/core/seq/oss/seq_oss_init.c:416
 odev_release+0x4c/0x88 sound/core/seq/oss/seq_oss.c:141
 __fput+0x2d0/0x958 fs/file_table.c:469
 ____fput+0x14/0x20 fs/file_table.c:497
 task_work_run+0x134/0x238 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:67 [inline]
 exit_to_user_mode_loop+0x194/0x1c8 kernel/entry/common.c:98
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:226 [inline]
 exit_to_user_mode_prepare_legacy include/linux/irq-entry-common.h:242 [inline]
 arm64_exit_to_user_mode arch/arm64/kernel/entry-common.c:81 [inline]
 el0_svc+0x258/0x29c arch/arm64/kernel/entry-common.c:725
 el0t_64_sync_handler+0xa0/0xe4 arch/arm64/kernel/entry-common.c:743
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:596
BUG: using __this_cpu_read() in preemptible [00000000] code: syz.0.1012/5537
caller is __this_cpu_preempt_check+0x20/0x40 lib/smp_processor_id.c:64
CPU: 0 UID: 0 PID: 5537 Comm: syz.0.1012 Tainted: G             L      syzkaller #0 PREEMPT 
Tainted: [L]=SOFTLOCKUP
Hardware name: linux,dummy-virt (DT)
Call trace:
 show_stack+0x18/0x24 arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x7c/0xb0 lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 check_preemption_disabled+0xe0/0xe8 lib/smp_processor_id.c:47
 __this_cpu_preempt_check+0x20/0x40 lib/smp_processor_id.c:64
 __arch_counter_get_cntvct_stable arch/arm64/include/asm/arch_timer.h:195 [inline]
 __delay+0x10c/0x374 arch/arm64/lib/delay.c:55
 __const_udelay+0x48/0x64 arch/arm64/lib/delay.c:66
 udelay include/asm-generic/delay.h:62 [inline]
 snd_timer_close_locked+0x258/0x94c sound/core/timer.c:443
 snd_timer_close+0xa4/0x120 sound/core/timer.c:476
 snd_seq_timer_close+0x88/0xd0 sound/core/seq/seq_timer.c:311
 queue_delete+0x50/0xac sound/core/seq/seq_queue.c:126
 snd_seq_queue_delete+0x2c/0x58 sound/core/seq/seq_queue.c:188
 snd_seq_ioctl_delete_queue+0x6c/0xa0 sound/core/seq/seq_clientmgr.c:1546
 call_seq_client_ctl+0x94/0x120 sound/core/seq/seq_clientmgr.c:2419
 snd_seq_kernel_client_ctl+0x68/0x100 sound/core/seq/seq_clientmgr.c:2447
 delete_seq_queue.isra.0+0xbc/0x124 sound/core/seq/oss/seq_oss_init.c:371
 snd_seq_oss_release+0x13c/0x1a0 sound/core/seq/oss/seq_oss_init.c:416
 odev_release+0x4c/0x88 sound/core/seq/oss/seq_oss.c:141
 __fput+0x2d0/0x958 fs/file_table.c:469
 ____fput+0x14/0x20 fs/file_table.c:497
 task_work_run+0x134/0x238 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:67 [inline]
 exit_to_user_mode_loop+0x194/0x1c8 kernel/entry/common.c:98
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:226 [inline]
 exit_to_user_mode_prepare_legacy include/linux/irq-entry-common.h:242 [inline]
 arm64_exit_to_user_mode arch/arm64/kernel/entry-common.c:81 [inline]
 el0_svc+0x258/0x29c arch/arm64/kernel/entry-common.c:725
 el0t_64_sync_handler+0xa0/0xe4 arch/arm64/kernel/entry-common.c:743
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:596
BUG: using __this_cpu_read() in preemptible [00000000] code: syz.0.1012/5537
caller is __this_cpu_preempt_check+0x20/0x40 lib/smp_processor_id.c:64
CPU: 0 UID: 0 PID: 5537 Comm: syz.0.1012 Tainted: G             L      syzkaller #0 PREEMPT 
Tainted: [L]=SOFTLOCKUP
Hardware name: linux,dummy-virt (DT)
Call trace:
 show_stack+0x18/0x24 arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x7c/0xb0 lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 check_preemption_disabled+0xe0/0xe8 lib/smp_processor_id.c:47
 __this_cpu_preempt_check+0x20/0x40 lib/smp_processor_id.c:64
 __arch_counter_get_cntvct_stable arch/arm64/include/asm/arch_timer.h:195 [inline]
 __delay+0x19c/0x374 arch/arm64/lib/delay.c:59
 __const_udelay+0x48/0x64 arch/arm64/lib/delay.c:66
 udelay include/asm-generic/delay.h:62 [inline]
 snd_timer_close_locked+0x258/0x94c sound/core/timer.c:443
 snd_timer_close+0xa4/0x120 sound/core/timer.c:476
 snd_seq_timer_close+0x88/0xd0 sound/core/seq/seq_timer.c:311
 queue_delete+0x50/0xac sound/core/seq/seq_queue.c:126
 snd_seq_queue_delete+0x2c/0x58 sound/core/seq/seq_queue.c:188
 snd_seq_ioctl_delete_queue+0x6c/0xa0 sound/core/seq/seq_clientmgr.c:1546
 call_seq_client_ctl+0x94/0x120 sound/core/seq/seq_clientmgr.c:2419
 snd_seq_kernel_client_ctl+0x68/0x100 sound/core/seq/seq_clientmgr.c:2447
 delete_seq_queue.isra.0+0xbc/0x124 sound/core/seq/oss/seq_oss_init.c:371
 snd_seq_oss_release+0x13c/0x1a0 sound/core/seq/oss/seq_oss_init.c:416
 odev_release+0x4c/0x88 sound/core/seq/oss/seq_oss.c:141
 __fput+0x2d0/0x958 fs/file_table.c:469
 ____fput+0x14/0x20 fs/file_table.c:497
 task_work_run+0x134/0x238 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:67 [inline]
 exit_to_user_mode_loop+0x194/0x1c8 kernel/entry/common.c:98
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:226 [inline]
 exit_to_user_mode_prepare_legacy include/linux/irq-entry-common.h:242 [inline]
 arm64_exit_to_user_mode arch/arm64/kernel/entry-common.c:81 [inline]
 el0_svc+0x258/0x29c arch/arm64/kernel/entry-common.c:725
 el0t_64_sync_handler+0xa0/0xe4 arch/arm64/kernel/entry-common.c:743
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:596


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

