Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEB8C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 17:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/J3VPLD/0jNQWnA/reLpPBCbLWGNdED/4IMh6P28Ok=; b=MTVLF+ZC/H2qTnYSuCQnt/0Eak
	t7ETLlxbgXZjP1TRKoKum14xTLdvGv+D7gZC4guDoYJbXiF7R8DCS68FOLDQ8Dp24F/mc/sazhWRf
	9yPfzHiV9nZeRMXyQpDnUBUOCVmhagXYiPeOz5qAaIrjcs9uPsbo7KpevaiuhgVaVBgDX0cvhcp3X
	TMR7acJnvonqUWj527Xa2NX4eGztJkaAv5/1vwxgx/fcKhWs1tnUsaUv+e2IkxgBNMssS4U2wPxnq
	Ti0APa9Z6AwVoXBzh1WuLHQDN/IqZ/w1G2m7GFIAsjMS2iqE/fJ5V8VYhuge/zYwnSskyMZ50tNsl
	002Roepg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueH1e-00000003AZe-41tM;
	Tue, 22 Jul 2025 17:43:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGzA-00000003AM2-1pC2
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Jul 2025 17:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=s/J3VPLD/0jNQWnA/reLpPBCbLWGNdED/4IMh6P28Ok=; b=WK3QEft7HdNfRL1YMYm5JU4XCD
	ocNCHf3ZpDfyBX6CEDCcUGqPbn++WwQpuGtaZF7UNEL/jA3uGw9jzH6Sbwsgh8J2yoHRUcih/8Che
	dqolss86EAw0X0SIpa1m1w5s1Rnbh54spcYD9rBsQWeJBESTtde0D7XxKsDutqBfiLXBHVVXLxjyV
	RN8tCLunhslGmcdAVvI+rlKTmiNa4pJodnB9xkM7DtYf8SciuijmQPVmeGK2DsFXp0mRWUKDnyW4v
	Ct0o0X64NnrAnkFHkyYT6vsRiBn2jOyvqCpr6XpIWYXnRYXhZZT70Psg7e03d0ifBZBBrn+WhBd8F
	ZpmPateQ==;
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGz7-0000000BKMI-1b6b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 17:41:03 +0000
Date: Tue, 22 Jul 2025 13:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753206051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s/J3VPLD/0jNQWnA/reLpPBCbLWGNdED/4IMh6P28Ok=;
	b=mKPe4yRCOtwietQaZXJeK3jPwUeLqepL0oFoxNIeaMK569oWBRxM82ZWA2UGb2HOGdZy1x
	cShu0gIWLsRcJnQ+5B6aW1RzH0d5hCh9p01W2907EedEMR4cj2trpEk2N/eoJBYf5e7Rh1
	BUq2NXjQqzWUEWa3/AA3PDvvy1/T/fw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: syzbot <syzbot+760777ae7038cad77437@syzkaller.appspotmail.com>
Cc: brauner@kernel.org, jack@suse.cz, linux-bcachefs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, phillip@squashfs.org.uk, 
	squashfs-devel@lists.sourceforge.net, syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [syzbot] [bcachefs?] [squashfs?] INFO: task hung in
 truncate_inode_pages_final (2)
Message-ID: <nigv3ov43zldfawvowuulkj2ovsilclwve3lli334v4jq6dto2@sdtp64i4km5m>
References: <68765304.a00a0220.105e77.0000.GAE@google.com>
 <gmycktnchukrybhfdc2isnijr6n3hjsf7jjdeg2qerdoqcbhna@6gmx55nv4a6b>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gmycktnchukrybhfdc2isnijr6n3hjsf7jjdeg2qerdoqcbhna@6gmx55nv4a6b>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_184101_536002_30870E02 
X-CRM114-Status: GOOD (  19.30  )
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

+cc linux-arm-kernel@lists.infradead.org 

On Tue, Jul 22, 2025 at 01:40:08PM -0400, Kent Overstreet wrote:
> On Tue, Jul 15, 2025 at 06:09:24AM -0700, syzbot wrote:
> > Hello,
> > 
> > syzbot found the following issue on:
> > 
> > HEAD commit:    ec4801305969 Merge branches 'for-next/core' and 'for-next/..
> > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> > console output: https://syzkaller.appspot.com/x/log.txt?x=1323ba8c580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=9e99b6fcd403d050
> > dashboard link: https://syzkaller.appspot.com/bug?extid=760777ae7038cad77437
> > compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
> > userspace arch: arm64
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14d38d82580000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=130ba0f0580000
> > 
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/64d8dc107d9d/disk-ec480130.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/31280b2dee28/vmlinux-ec480130.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/b3f9fb3d09f8/Image-ec480130.gz.xz
> > mounted in repro: https://storage.googleapis.com/syzbot-assets/9b3f4e51e5f9/mount_0.gz
> > 
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+760777ae7038cad77437@syzkaller.appspotmail.com
> > 
> > INFO: task syz-executor:6656 blocked for more than 143
> > INFO: task syz-executor:6656 blocked for more than 143 seconds.
> >       Not tainted 6.16.0-rc5-syzkaller-gec4801305969 #0
> > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > task:syz-executor    state:D stack:0     pid:6656  tgid:6656  ppid:1      task_flags:0x400140 flags:0x00000019
> > Call trace:
> >  __switch_to+0x414/0x834 arch/arm64/kernel/process.c:742 (T)
> >  context_switch kernel/sched/core.c:5401 [inline]
> >  __schedule+0x1414/0x2a28 kernel/sched/core.c:6790
> >  __schedule_loop kernel/sched/core.c:6868 [inline]
> >  schedule+0xb4/0x230 kernel/sched/core.c:6883
> >  io_schedule+0x84/0xf0 kernel/sched/core.c:7728
> >  folio_wait_bit_common+0x56c/0x9e0 mm/filemap.c:1317
> >  __folio_lock mm/filemap.c:1675 [inline]
> >  folio_lock include/linux/pagemap.h:1114 [inline]
> >  __filemap_get_folio+0x1ec/0xc38 mm/filemap.c:1928
> >  truncate_inode_pages_range+0x38c/0xe18 mm/truncate.c:388
> >  truncate_inode_pages mm/truncate.c:460 [inline]
> >  truncate_inode_pages_final+0x8c/0xbc mm/truncate.c:495
> >  evict+0x420/0x928 fs/inode.c:812
> >  dispose_list fs/inode.c:852 [inline]
> >  evict_inodes+0x650/0x6e8 fs/inode.c:906
> >  generic_shutdown_super+0xa0/0x2b8 fs/super.c:628
> >  kill_block_super+0x44/0x90 fs/super.c:1755
> >  deactivate_locked_super+0xc4/0x12c fs/super.c:474
> >  deactivate_super+0xe0/0x100 fs/super.c:507
> >  cleanup_mnt+0x31c/0x3ac fs/namespace.c:1417
> >  __cleanup_mnt+0x20/0x30 fs/namespace.c:1424
> >  task_work_run+0x1dc/0x260 kernel/task_work.c:227
> >  resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
> >  do_notify_resume+0x174/0x1f4 arch/arm64/kernel/entry-common.c:155
> >  exit_to_user_mode_prepare arch/arm64/kernel/entry-common.c:173 [inline]
> >  exit_to_user_mode arch/arm64/kernel/entry-common.c:182 [inline]
> >  el0_svc+0xb8/0x180 arch/arm64/kernel/entry-common.c:880
> >  el0t_64_sync_handler+0x84/0x12c arch/arm64/kernel/entry-common.c:898
> >  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:596
> > 
> > Showing all locks held in the system:
> > 3 locks held by kworker/u8:1/14:
> > 1 lock held by khungtaskd/32:
> >  #0: ffff80008f8599c0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire+0x4/0x48 include/linux/rcupdate.h:330
> > 2 locks held by pr/ttyAMA0/43:
> > 2 locks held by getty/6289:
> >  #0: ffff0000d314d0a0 (&tty->ldisc_sem){++++}-{0:0}, at: ldsem_down_read+0x3c/0x4c drivers/tty/tty_ldsem.c:340
> >  #1: ffff80009ba2e2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x34c/0xfa4 drivers/tty/n_tty.c:2222
> > 1 lock held by syz-executor/6656:
> >  #0: ffff0000c8c7e0e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock fs/super.c:57 [inline]
> >  #0: ffff0000c8c7e0e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock_excl fs/super.c:72 [inline]
> >  #0: ffff0000c8c7e0e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: deactivate_super+0xd8/0x100 fs/super.c:506
> > 1 lock held by syz-executor/6739:
> >  #0: ffff0000dbe180e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock fs/super.c:57 [inline]
> >  #0: ffff0000dbe180e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock_excl fs/super.c:72 [inline]
> >  #0: ffff0000dbe180e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: deactivate_super+0xd8/0x100 fs/super.c:506
> > 1 lock held by syz-executor/6760:
> >  #0: ffff0000c90c20e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock fs/super.c:57 [inline]
> >  #0: ffff0000c90c20e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock_excl fs/super.c:72 [inline]
> >  #0: ffff0000c90c20e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: deactivate_super+0xd8/0x100 fs/super.c:506
> > 1 lock held by syz-executor/6787:
> >  #0: ffff0000d3e2a0e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock fs/super.c:57 [inline]
> >  #0: ffff0000d3e2a0e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock_excl fs/super.c:72 [inline]
> >  #0: ffff0000d3e2a0e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: deactivate_super+0xd8/0x100 fs/super.c:506
> > 1 lock held by syz-executor/6808:
> >  #0: ffff0000d89180e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock fs/super.c:57 [inline]
> >  #0: ffff0000d89180e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock_excl fs/super.c:72 [inline]
> >  #0: ffff0000d89180e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: deactivate_super+0xd8/0x100 fs/super.c:506
> > 1 lock held by syz-executor/6839:
> >  #0: ffff0000f2aba0e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock fs/super.c:57 [inline]
> >  #0: ffff0000f2aba0e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock_excl fs/super.c:72 [inline]
> >  #0: ffff0000f2aba0e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: deactivate_super+0xd8/0x100 fs/super.c:506
> > 1 lock held by syz-executor/6876:
> >  #0: ffff0000dd8f40e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock fs/super.c:57 [inline]
> >  #0: ffff0000dd8f40e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock_excl fs/super.c:72 [inline]
> >  #0: ffff0000dd8f40e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: deactivate_super+0xd8/0x100 fs/super.c:506
> > 1 lock held by syz-executor/6909:
> >  #0: ffff0000eac320e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock fs/super.c:57 [inline]
> >  #0: ffff0000eac320e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock_excl fs/super.c:72 [inline]
> >  #0: ffff0000eac320e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: deactivate_super+0xd8/0x100 fs/super.c:506
> > 1 lock held by syz-executor/6942:
> >  #0: ffff0000d65fa0e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock fs/super.c:57 [inline]
> >  #0: ffff0000d65fa0e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: __super_lock_excl fs/super.c:72 [inline]
> >  #0: ffff0000d65fa0e0 (&type->s_umount_key#54){+.+.}-{4:4}, at: deactivate_super+0xd8/0x100 fs/super.c:506
> > 
> > =============================================
> > 
> > 
> > 
> > ---
> > This report is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> > 
> > syzbot will keep track of this issue. See:
> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> > 
> > If the report is already addressed, let syzbot know by replying with:
> > #syz fix: exact-commit-title
> > 
> > If you want syzbot to run the reproducer, reply with:
> > #syz test: git://repo/address.git branch-or-commit-hash
> > If you attach or paste a git patch, syzbot will apply it before testing.
> > 
> > If you want to overwrite report's subsystems, reply with:
> 
> #syz set subsystems: arm
> 
> Per the console log, bcachefs wasn't even being tested - very curious
> how this got flagged as potentially bcachefs.
> 
> But, all the reports have been from the arm tree, not upstream.
> 
> I wouldn't be surprised if it's a lost wakeup, those hit arm first due
> to looser memory ordering.

