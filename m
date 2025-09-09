Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7E0CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 21:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=II4Lb2lAe02YLYjc/mQH0VDDWVw+65865x1zOonNjHs=; b=VIj6jNTaaCOCkadygs4olbxwJ8
	FoHjTSmtaoV6iJeuWzEetSfQyjHUWd0+Qy00sdP3OHLWQbkR6phbIvCGH0TlsLZObvfEgl+H8Yjrw
	zmrai6JrOvnUUxp21+RzgdWqWlpRRaaUA/rF6LVcq7Ozo9D0x59xaux7mdv+uB862jcg8b/hLBcUf
	4psUtLptQMCGGWZh2j81vVlAETBSUddXnGs8j4GNp3Q3+oZRk+3BYUdjPW/veCscQB9frPfLjo2Kx
	5C6wfEAn3IYj4BPvxvt9DjQE7D7YSLRw780J+hNul0uhYwukpufGsQ0anXtiYkbvCAc6MpcMtSwrz
	gQRJjmcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw5p4-0000000AMqg-401F;
	Tue, 09 Sep 2025 21:24:18 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw5p2-0000000AMB5-1Una
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 21:24:17 +0000
Date: Tue, 9 Sep 2025 14:22:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757452930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=II4Lb2lAe02YLYjc/mQH0VDDWVw+65865x1zOonNjHs=;
	b=iEEvDkYaUbyfC+Sb7cCFy2ppnbXr4LNquw7xAreqzypPO9IKdEfmIFkkvbRko51Fy+Bxdw
	CfNM8BT0Ri2yPADzMeSWCC1ntJ1rXAtd+MlUacAUIISsldyWkuncVAS9bnnbWSCuraHr9x
	v/dyze+23fnU5lJY+vujxn5C2pVVmro=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: syzbot <syzbot+31156cb24a340d8e2c05@syzkaller.appspotmail.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maz@kernel.org, suzuki.poulose@arm.com,
	syzkaller-bugs@googlegroups.com, will@kernel.org,
	yuzenghui@huawei.com
Subject: Re: [syzbot] [kvmarm?] KASAN: invalid-access Read in
 __kvm_pgtable_walk
Message-ID: <aMCaeA5qKzPbKwLt@linux.dev>
References: <68c09802.050a0220.3c6139.000d.GAE@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68c09802.050a0220.3c6139.000d.GAE@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_142416_534542_C3E5D288 
X-CRM114-Status: GOOD (  16.11  )
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

On Tue, Sep 09, 2025 at 02:11:30PM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    f777d1112ee5 Merge tag 'vfs-6.17-rc6.fixes' of git://git.k..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=15f84b12580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=45bc268c8b0b2faf
> dashboard link: https://syzkaller.appspot.com/bug?extid=31156cb24a340d8e2c05
> compiler:       aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=117c6d62580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13e94934580000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-f777d111.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/3e36256124c6/vmlinux-f777d111.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/ea9018353872/Image-f777d111.gz.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+31156cb24a340d8e2c05@syzkaller.appspotmail.com
> 
> ==================================================================
> BUG: KASAN: invalid-access in __kvm_pgtable_visit arch/arm64/kvm/hyp/pgtable.c:161 [inline]
> BUG: KASAN: invalid-access in __kvm_pgtable_walk+0x110/0x2d0 arch/arm64/kvm/hyp/pgtable.c:237
> Read at addr fdf000000f7c1000 by task syz.2.17/3592
> Pointer tag: [fd], memory tag: [fe]
> 
> CPU: 1 UID: 0 PID: 3592 Comm: syz.2.17 Not tainted syzkaller #0 PREEMPT 
> Hardware name: linux,dummy-virt (DT)
> Call trace:
>  show_stack+0x18/0x24 arch/arm64/kernel/stacktrace.c:499 (C)
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x78/0x90 lib/dump_stack.c:120
>  print_address_description mm/kasan/report.c:378 [inline]
>  print_report+0x108/0x61c mm/kasan/report.c:482
>  kasan_report+0x88/0xac mm/kasan/report.c:595
>  report_tag_fault arch/arm64/mm/fault.c:326 [inline]
>  do_tag_recovery arch/arm64/mm/fault.c:338 [inline]
>  __do_kernel_fault+0x170/0x1c8 arch/arm64/mm/fault.c:380
>  do_bad_area+0x68/0x78 arch/arm64/mm/fault.c:480
>  do_tag_check_fault+0x34/0x44 arch/arm64/mm/fault.c:853
>  do_mem_abort+0x44/0x94 arch/arm64/mm/fault.c:929
>  el1_abort+0x40/0x60 arch/arm64/kernel/entry-common.c:481
>  el1h_64_sync_handler+0x50/0xac arch/arm64/kernel/entry-common.c:597
>  el1h_64_sync+0x6c/0x70 arch/arm64/kernel/entry.S:591
>  __kvm_pgtable_visit arch/arm64/kvm/hyp/pgtable.c:161 [inline] (P)
>  __kvm_pgtable_walk+0x110/0x2d0 arch/arm64/kvm/hyp/pgtable.c:237 (P)
>  _kvm_pgtable_walk arch/arm64/kvm/hyp/pgtable.c:260 [inline]
>  kvm_pgtable_walk+0xd0/0x164 arch/arm64/kvm/hyp/pgtable.c:283
>  kvm_pgtable_stage2_destroy_range+0x3c/0x70 arch/arm64/kvm/hyp/pgtable.c:1563
>  stage2_destroy_range arch/arm64/kvm/mmu.c:924 [inline]
>  kvm_stage2_destroy+0x74/0xd0 arch/arm64/kvm/mmu.c:935
>  kvm_free_stage2_pgd+0x4c/0x84 arch/arm64/kvm/mmu.c:1112
>  kvm_uninit_stage2_mmu+0x1c/0x34 arch/arm64/kvm/mmu.c:1023
>  kvm_arch_flush_shadow_all+0x6c/0x84 arch/arm64/kvm/nested.c:1113
>  kvm_flush_shadow_all virt/kvm/kvm_main.c:343 [inline]
>  kvm_mmu_notifier_release+0x30/0x84 virt/kvm/kvm_main.c:884
>  mmu_notifier_unregister+0x5c/0x11c mm/mmu_notifier.c:815
>  kvm_destroy_vm+0x148/0x2b0 virt/kvm/kvm_main.c:1287
>  kvm_put_kvm virt/kvm/kvm_main.c:1344 [inline]
>  kvm_vm_release+0x80/0xb0 virt/kvm/kvm_main.c:1367
>  __fput+0xcc/0x2dc fs/file_table.c:468
>  ____fput+0x14/0x20 fs/file_table.c:496
>  task_work_run+0x78/0xd4 kernel/task_work.c:227
>  resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
>  do_notify_resume+0x13c/0x16c arch/arm64/kernel/entry-common.c:155
>  exit_to_user_mode_prepare arch/arm64/kernel/entry-common.c:173 [inline]
>  exit_to_user_mode arch/arm64/kernel/entry-common.c:182 [inline]
>  el0_svc+0x108/0x10c arch/arm64/kernel/entry-common.c:880
>  el0t_64_sync_handler+0xa0/0xe4 arch/arm64/kernel/entry-common.c:898
>  el0t_64_sync+0x1a4/0x1a8 arch/arm64/kernel/entry.S:596
> 
> The buggy address belongs to the physical page:
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x4f7c1
> flags: 0x1ffc80000000000(node=0|zone=0|lastcpupid=0x7ff|kasantag=0x2)
> raw: 01ffc80000000000 ffffc1ffc03df088 ffffc1ffc02393c8 0000000000000000
> raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
>  fff000000f7c0e00: f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5
>  fff000000f7c0f00: f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f5
> >fff000000f7c1000: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
>                    ^
>  fff000000f7c1100: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
>  fff000000f7c1200: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
> ==================================================================
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git fixes

