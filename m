Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2810DFD8FF4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 18:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwEftJ0NcmMJLtU/aiqGwUqPRTnTId50gEy3oxHoSu0=; b=K4Np80X3RgHTmUc36JE63JA5x6
	oyZ0dTP3JJ6n5dz6a57csBehTkY5eiYFC0U94YeXLhuQcMzalVfRxdjnAFvpsXZuxRoaCj/iPKf/Z
	fUtxEb3cl6V83kquxPP6OfNhZZ3pKG/ZUdhA05sX4ZWiKixWOp+ugT/qSuuvKtjwE9c+cd86AEWVU
	DAHuiixarVoHbebmWFoc/VEdAe9afnlLuLGYeqBN3VgvReP2xPZx7PLcMEmucyxxLwUtnEOFQ6ZkU
	pfs1RC3YVbE8YdFv1Cm9o6PqjjlzKf0zMK8W3r4kxQtSAxjmz8lg0ii/4FSYk1ooWd+/oI0noG+29
	NbTsg96w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvg37-00000006xW2-2W5C;
	Thu, 26 Feb 2026 18:25:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvg36-00000006xVm-23q3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 18:25:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C4716013A;
	Thu, 26 Feb 2026 18:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC77C116C6;
	Thu, 26 Feb 2026 18:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772130319;
	bh=jfMff4Gl6e4MBoQvWfFtpIMIZ+n9o8V8+kADuSP57iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NOwhH9egiNcn+t7MqkfmuYBcFV91Tw8sbA3d7EinxbrxVe3N7i6KNwIblL2NP7Azm
	 5bdy0mgPas/gv4JdSL1aSqAyNsw/7fmHEDRYem6myikiwWFyp47uSHhJb8Mik/FUld
	 1KzshbwFSi7WCZSSVH6OoBGFxVYJck305FoIw7eqbbRbkjYVas73i2gZoe6okP2TPT
	 uTH1Z0H1dzgDogMAadc447coWUa9UItt8Ar16QaYfAZH/MSR7yAG0EowuRr0WMWVXw
	 rXaAXEy6TCH1RfY1AhJs9S3hPNUXGB81GYkeD4IYD4lL6QWSSNtKxmDcSr9eAqFKK0
	 KtFEx+n/2GQIQ==
Date: Thu, 26 Feb 2026 18:25:14 +0000
From: Will Deacon <will@kernel.org>
To: syzbot <syzbot+b29d18a34746f34c94cc@syzkaller.appspotmail.com>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	maz@kernel.org
Subject: Re: [syzbot] [arm?] BUG: using __this_cpu_read() in preemptible code
 in __delay
Message-ID: <aaCQCnM9eaBK_ON0@willie-the-truck>
References: <69a06135.050a0220.305b49.0024.GAE@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69a06135.050a0220.305b49.0024.GAE@google.com>
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

On Thu, Feb 26, 2026 at 07:05:25AM -0800, syzbot wrote:
> syzbot found the following issue on:
> 
> HEAD commit:    32a92f8c8932 Convert more 'alloc_obj' cases to default GFP..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1019fc02580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b77d736d2f4fe1b1
> dashboard link: https://syzkaller.appspot.com/bug?extid=b29d18a34746f34c94cc
> compiler:       aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> userspace arch: arm64
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-32a92f8c.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/aabf4d7d9d6a/vmlinux-32a92f8c.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/0367e274b699/Image-32a92f8c.gz.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+b29d18a34746f34c94cc@syzkaller.appspotmail.com
> 
> BUG: using __this_cpu_read() in preemptible [00000000] code: syz.0.1012/5537
> caller is __this_cpu_preempt_check+0x20/0x40 lib/smp_processor_id.c:64
> CPU: 0 UID: 0 PID: 5537 Comm: syz.0.1012 Tainted: G             L      syzkaller #0 PREEMPT 
> Tainted: [L]=SOFTLOCKUP
> Hardware name: linux,dummy-virt (DT)
> Call trace:
>  show_stack+0x18/0x24 arch/arm64/kernel/stacktrace.c:499 (C)
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x7c/0xb0 lib/dump_stack.c:120
>  dump_stack+0x1c/0x28 lib/dump_stack.c:129
>  check_preemption_disabled+0xe0/0xe8 lib/smp_processor_id.c:47
>  __this_cpu_preempt_check+0x20/0x40 lib/smp_processor_id.c:64
>  __arch_counter_get_cntvct_stable arch/arm64/include/asm/arch_timer.h:195 [inline]
>  __delay+0x40/0x374 arch/arm64/lib/delay.c:39
>  __const_udelay+0x48/0x64 arch/arm64/lib/delay.c:66
>  udelay include/asm-generic/delay.h:62 [inline]

This should be fixed by the first patch in this series:

https://lore.kernel.org/r/20260226082234.26707-1-maz@kernel.org

I'll queue that today.

Will

#syz fix: arm64: Fix sampling the "stable" virtual counter in preemptible section

