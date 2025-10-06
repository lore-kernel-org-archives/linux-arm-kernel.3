Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA13CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 13:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnMHepD+4WUs5JH2g5ZG/hZQqmEj6Pg6RLIUw2l4UoU=; b=tRssMiEOOVFMkU/kJKi902LwM/
	KtUzawtGUV+Z5AO1TuDQm6UhEBkN1hDRssS+csdM+z8+FQ9gGgB8CgBjRgVhzql1+0TE4+5t71mtb
	idyHZl2zyXhzDLhxQw0dG6MOC0t5Z8yxfsDA5XEo8H9VZCQZX8TkfYDj9VnRyUar8yfjZ4OCbsnMj
	enHK8maUi1Y60Onel96zL2oVZHomzJMZZfv9c/OaD6C9qZP4Fh/Y59dWw/kzbKdGR6CHMc/fJo1J1
	IbhH5CLQpdsohAlVB9cbGZLI6qtycotqlCMq3TuS+b5QuBD6gJjfnCP0On4hPRR4/hKtDwrbSGmSh
	HGQCFpow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5l67-000000004x6-3PKq;
	Mon, 06 Oct 2025 13:17:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5l64-000000004wM-2kJL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 13:17:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80D234341F;
	Mon,  6 Oct 2025 13:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3348C4CEF5;
	Mon,  6 Oct 2025 13:17:43 +0000 (UTC)
Date: Mon, 6 Oct 2025 14:17:40 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: David Hildenbrand <david@redhat.com>
Cc: syzbot <syzbot+d1974fc28545a3e6218b@syzkaller.appspotmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com, will@kernel.org,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [syzbot] [arm?] WARNING in copy_highpage
Message-ID: <aOPBdNLJUdN4EAF0@arm.com>
References: <68dda1ae.a00a0220.102ee.0065.GAE@google.com>
 <aOACSWYIOD3llWnj@arm.com>
 <7af02ceb-563a-4bad-84ee-620aaa513bed@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7af02ceb-563a-4bad-84ee-620aaa513bed@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_061748_732801_EF834CA8 
X-CRM114-Status: GOOD (  23.96  )
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

On Mon, Oct 06, 2025 at 09:55:27AM +0200, David Hildenbrand wrote:
> > > Modules linked in:
> > > CPU: 1 UID: 0 PID: 25189 Comm: syz.2.7336 Not tainted syzkaller #0 PREEMPT
> > > Hardware name: linux,dummy-virt (DT)
> > > pstate: 00402009 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > > pc : copy_highpage+0x150/0x334 arch/arm64/mm/copypage.c:55
> > > lr : copy_highpage+0xb4/0x334 arch/arm64/mm/copypage.c:25
> > > sp : ffff800088053940
> > > x29: ffff800088053940 x28: ffffc1ffc0acf800 x27: ffff800088053b10
> > > x26: ffffc1ffc0acf808 x25: ffffc1ffc037b1c0 x24: ffffc1ffc037b1c0
> > > x23: ffffc1ffc0acf800 x22: ffffc1ffc0acf800 x21: fff000002b3e0000
> > > x20: fff000000dec7000 x19: ffffc1ffc037b1c0 x18: 0000000000000000
> > > x17: fff07ffffcffa000 x16: ffff800080008000 x15: 0000000000000001
> > > x14: 0000000000000000 x13: 0000000000000003 x12: 000000000006d9ad
> > > x11: 0000000000000000 x10: 0000000000000010 x9 : 0000000000000000
> > > x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
> > > x5 : ffff800088053b18 x4 : ffff80008032df94 x3 : 00000000ff000000
> > > x2 : 01ffc00003000001 x1 : 01ffc00003000001 x0 : 01ffc00003000001
> > > Call trace:
> > >   try_page_mte_tagging arch/arm64/include/asm/mte.h:93 [inline] (P)
> > >   copy_highpage+0x150/0x334 arch/arm64/mm/copypage.c:55 (P)
> > >   copy_mc_highpage include/linux/highmem.h:383 [inline]
> > >   folio_mc_copy+0x44/0x6c mm/util.c:740
> > >   __migrate_folio.constprop.0+0xc4/0x23c mm/migrate.c:851
> > >   migrate_folio+0x1c/0x2c mm/migrate.c:882
> > >   move_to_new_folio+0x58/0x144 mm/migrate.c:1097
> > >   migrate_folio_move mm/migrate.c:1370 [inline]
> > >   migrate_folios_move mm/migrate.c:1719 [inline]
> > >   migrate_pages_batch+0xaf4/0x1024 mm/migrate.c:1966
> > >   migrate_pages_sync mm/migrate.c:2023 [inline]
> > >   migrate_pages+0xb9c/0xcdc mm/migrate.c:2105
> > >   do_mbind+0x20c/0x4a4 mm/mempolicy.c:1539
> > >   kernel_mbind mm/mempolicy.c:1682 [inline]
> > >   __do_sys_mbind mm/mempolicy.c:1756 [inline]
> > 
> > I don't think we ever stressed MTE with mbind before. I have a suspicion
> > this problem has been around for some time.
> > 
> > My reading of do_mbind() is that it ends up allocating pages for
> > migrating into via alloc_migration_target_by_mpol() ->
> > folio_alloc_mpol(). Pages returned should be untagged and uninitialised
> > unless the PG_* flags have not been cleared on a prior free. Or
> > migrate_pages_batch() somehow reuses some pages instead of reallocating.
> 
> Staring at __migrate_folio(), I assume we can end up successfully calling
> folio_mc_copy(), but then failing in __folio_migrate_mapping().
> 
> Seems to be as easy as failing the folio_ref_freeze() in
> __folio_migrate_mapping().
> 
> We return -EAGAIN in that case, making the caller retry, stumbling into an
> already-tagged page. (with the same source / destination parameters) IIRC)
> 
> So likely this is simply us re-doing the copy after a migration failed after
> the copy.
> 
> Could it happen that we are calling it with a different source/destination
> combination the second time? I don't think so, but I am not 100% sure.

Thanks David. I can now see how it would retry on the same pages without
reallocating. At least we know it's not causing any side-effects, only
messing up the MTE safety warnings.

> The most reliable way would be to un-tag in case folio_mc_copy succeeded but
> __folio_migrate_mapping() failed.

Clearing an MTE specific flag in the core code doesn't look great. Also
going for some generic mask like PAGE_FLAGS_CHECK_AT_PREP may have
side-effects as we don't know where the page is coming from (we have
those get_new_folio()/put_new_folio() arguments passed on by higher up
callers).

I'm tempted to just drop the warning in the arm64 copy_highpage(),
replace it with a comment about migration retrying on a potentially
tagged page. It will have to override the tags each time (as it
currently does but also warns).

-- 
Catalin

