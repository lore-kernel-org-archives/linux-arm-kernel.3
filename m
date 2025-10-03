Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A4BCCA472
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 17:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WMIgDpAx805nWeJrJtmkC04TGvBX9gEz0X3iDOLJOR4=; b=YfThJAcmHd+OwWdOziyFxS1XB4
	4hrvuIve3ELmXQUI2SNoPCAwLOVawJZhenvq9XkEhYndO+mifErwnRxfOPPkaZSseNX2bHN/zBJgq
	GL/sNXCKUMSqyVHFxxFKn5HmjFfQ1fDAhx+vUGUaEiFcvG1smRoHa87gr6jXYpTFRTd5XhxdXgF/E
	mbkJCr06tiXC9H/NNN4cd2fjALHJ/TZP5T7azmBk6Yy7noq0/GOInHL49SkbATsOOevsMfuy5Olnn
	6gtE6bkdIjWLxzjPr7DwaYSGl5idCEcy/UAWE5lDPCYymVRJHS+RAxedVpNk7M1HvetFonXM4bG9L
	i9e+MKIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4jDc-0000000CnDY-3JcQ;
	Fri, 03 Oct 2025 17:05:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4jDa-0000000CnCs-1l1X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 17:05:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FA5940A0F;
	Fri,  3 Oct 2025 17:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17081C4CEF5;
	Fri,  3 Oct 2025 17:05:15 +0000 (UTC)
Date: Fri, 3 Oct 2025 18:05:13 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: syzbot <syzbot+d1974fc28545a3e6218b@syzkaller.appspotmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com, will@kernel.org,
	David Hildenbrand <david@redhat.com>
Subject: Re: [syzbot] [arm?] WARNING in copy_highpage
Message-ID: <aOACSWYIOD3llWnj@arm.com>
References: <68dda1ae.a00a0220.102ee.0065.GAE@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68dda1ae.a00a0220.102ee.0065.GAE@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_100518_499466_91090599 
X-CRM114-Status: GOOD (  15.14  )
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

Thanks for the report (for some reason, outlook did not deliver this to
my inbox; Will pointed me at the message)

Adding David H as well, he may have some ideas. I haven't tried to
reproduce it yet.

On Wed, Oct 01, 2025 at 02:48:30PM -0700, syzbot wrote:
> syzbot found the following issue on:
> 
> HEAD commit:    fec734e8d564 Merge tag 'riscv-for-linus-v6.17-rc8' of git:..

So that's just before 6.17, not something that turned up during the
merging window.

> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=12187d34580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=13bd892ec3b155a2
> dashboard link: https://syzkaller.appspot.com/bug?extid=d1974fc28545a3e6218b
> compiler:       aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> userspace arch: arm64
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-fec734e8.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/d7e18b408aea/vmlinux-fec734e8.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/9b7984f47117/Image-fec734e8.gz.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+d1974fc28545a3e6218b@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 25189 at arch/arm64/mm/copypage.c:55 try_page_mte_tagging arch/arm64/include/asm/mte.h:93 [inline]
> WARNING: CPU: 1 PID: 25189 at arch/arm64/mm/copypage.c:55 copy_highpage+0x150/0x334 arch/arm64/mm/copypage.c:55

This warning means that the destination page is already tagged
(PG_mte_tagged set) when it got to copy_page().  In general it is fine
as we copy into and override all the tags but my assumption until now
has been that such new pages are always untagged.

> Modules linked in:
> CPU: 1 UID: 0 PID: 25189 Comm: syz.2.7336 Not tainted syzkaller #0 PREEMPT 
> Hardware name: linux,dummy-virt (DT)
> pstate: 00402009 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : copy_highpage+0x150/0x334 arch/arm64/mm/copypage.c:55
> lr : copy_highpage+0xb4/0x334 arch/arm64/mm/copypage.c:25
> sp : ffff800088053940
> x29: ffff800088053940 x28: ffffc1ffc0acf800 x27: ffff800088053b10
> x26: ffffc1ffc0acf808 x25: ffffc1ffc037b1c0 x24: ffffc1ffc037b1c0
> x23: ffffc1ffc0acf800 x22: ffffc1ffc0acf800 x21: fff000002b3e0000
> x20: fff000000dec7000 x19: ffffc1ffc037b1c0 x18: 0000000000000000
> x17: fff07ffffcffa000 x16: ffff800080008000 x15: 0000000000000001
> x14: 0000000000000000 x13: 0000000000000003 x12: 000000000006d9ad
> x11: 0000000000000000 x10: 0000000000000010 x9 : 0000000000000000
> x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
> x5 : ffff800088053b18 x4 : ffff80008032df94 x3 : 00000000ff000000
> x2 : 01ffc00003000001 x1 : 01ffc00003000001 x0 : 01ffc00003000001
> Call trace:
>  try_page_mte_tagging arch/arm64/include/asm/mte.h:93 [inline] (P)
>  copy_highpage+0x150/0x334 arch/arm64/mm/copypage.c:55 (P)
>  copy_mc_highpage include/linux/highmem.h:383 [inline]
>  folio_mc_copy+0x44/0x6c mm/util.c:740
>  __migrate_folio.constprop.0+0xc4/0x23c mm/migrate.c:851
>  migrate_folio+0x1c/0x2c mm/migrate.c:882
>  move_to_new_folio+0x58/0x144 mm/migrate.c:1097
>  migrate_folio_move mm/migrate.c:1370 [inline]
>  migrate_folios_move mm/migrate.c:1719 [inline]
>  migrate_pages_batch+0xaf4/0x1024 mm/migrate.c:1966
>  migrate_pages_sync mm/migrate.c:2023 [inline]
>  migrate_pages+0xb9c/0xcdc mm/migrate.c:2105
>  do_mbind+0x20c/0x4a4 mm/mempolicy.c:1539
>  kernel_mbind mm/mempolicy.c:1682 [inline]
>  __do_sys_mbind mm/mempolicy.c:1756 [inline]

I don't think we ever stressed MTE with mbind before. I have a suspicion
this problem has been around for some time.

My reading of do_mbind() is that it ends up allocating pages for
migrating into via alloc_migration_target_by_mpol() ->
folio_alloc_mpol(). Pages returned should be untagged and uninitialised
unless the PG_* flags have not been cleared on a prior free. Or
migrate_pages_batch() somehow reuses some pages instead of reallocating.

-- 
Catalin

