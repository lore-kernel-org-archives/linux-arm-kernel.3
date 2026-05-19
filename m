Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D552CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdu4fuxMlfNkuCT7pxnX1miMms6IxjtPpxq947uJEUk=; b=PqH4IfqtLT+M5BGsbYqmDMcEkC
	Xg4ok6LMjO1PXuRMEKA1TaOc27jlr0Fa0MsTaGMKWrt1PilPim0NMAzrTgIei7tnnKLFKQO8CwzY9
	AC4B8SZHdssXcEKyYAHYYhCBUpy3CDjnAYQr5r/9n08EsU87ckx3H3i3Unv1UcMoTSbH51pt4uuCb
	JWXsEFRmgKTCZd1xMXHfJvo6LSnPrSEk7kOUKFwibATgHl6NryIbG+IPC+KlgvjEWj+FQf5Aw66Rz
	2+l/+uWBx1GyBFXFQ9ee37QkQhvoqfeQJPGdX33YM756xc8kfBNw7LOOlzxREey187GsrYMP/GhA4
	9NtIBfSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLXs-00000001qyK-0f8C;
	Tue, 19 May 2026 14:35:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLXf-00000001qro-3YS3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:35:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 615291F37;
	Tue, 19 May 2026 07:35:22 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 297D73F7B4;
	Tue, 19 May 2026 07:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779201327; bh=Emx8XM8LjkQqO6xEIc3bZVmsae4EqUtaplU0iD/vhTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hXojF65MeqCpiYD47pDwJizwwukRXtMNoBTi9Jjgf/eP4IcF3q7fq6HyPamI0ZRZ4
	 JNWku/v6gL3rQifYakYlugB+sxhd2uLxidEqlFPva1m+OZI2K4V6HO9kpYefnmIMNS
	 rQ+GjXeaoQ7iRYQpiNFR4L5mre5TkHf6spvlfrss=
From: Leonardo Bras <leo.bras@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] KVM: arm64: Introduce S2 walker SKIP return options
Date: Tue, 19 May 2026 15:35:19 +0100
Message-ID: <agx1J1tQFn0cdtBf@devkitleo>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <agxifbKzGcYQivBz@willie-the-truck>
References: <20260515195904.2466381-1-leo.bras@arm.com> <20260515195904.2466381-2-leo.bras@arm.com> <agq-RyKhBy4CIThm@kernel.org> <agrTQMw4QJX6HGrm@willie-the-truck> <agsYF-Dav2bpxWK4@devkitleo> <agxa-TydN1PoKsYn@willie-the-truck> <agxeEA14cP3yMV1m@devkitleo> <agxifbKzGcYQivBz@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_073532_240688_4C56E672 
X-CRM114-Status: GOOD (  33.04  )
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

On Tue, May 19, 2026 at 02:15:41PM +0100, Will Deacon wrote:
> On Tue, May 19, 2026 at 01:56:48PM +0100, Leonardo Bras wrote:
> > On Tue, May 19, 2026 at 01:43:37PM +0100, Will Deacon wrote:
> > > > > I was wondering along similar lines, but maybe it would be useful just
> > > > > to pass a maximum level to the walker logic? That feels like the most
> > > > > general case without complicating the existing logic.
> > > > 
> > > > This proposal seems simpler for me to understand, and indeed looks like a 
> > > > better solution than what I have proposed, taking care of  the 
> > > > 'already split' case with better performance, as it don't even walk a 
> > > > single level-3 entry. 
> > > > 
> > > > On the 'splitting' case, it also works flawlessly if the memory is given in 
> > > > level-2 blocks. There is only one case that I would like to address here:
> > > > 
> > > > - Memory given in level-1 blocks (say 1GB)
> > > > - Walker flag says 'walk down to level-2 only'
> > > > - Split Walker on level-1 will break page down to (up to) level-3 entries.
> > > > - Walker will continue to be called on level-2 entries, even though it's 
> > > >   not necessary.
> > > 
> > > If you're only visiting leaves, why would it be called on the level-2
> > > table entries?
> > > 
> > 
> > Because once the leaf is turned into a table by the splitting walker, it 
> > gets reloaded and walked. This is an excerpt of __kvm_pgtable_visit():
> 
> Sorry, I was musing about the semantics after adding something to limit
> the maximum level. I don't dispute what the current code would do.
> 
> > Example:
> > - Split this level-1 leave:
> >   - Walker creates the whole structure up to given level (currently 3)
> >   - Walker returns, gets reloaded, table detected, go down on that one
> >   - Level 2 entries walked (which is unnecessary)
> > 
> > Please let me know if I am misunderstanding something.
> 
> I just don't grok why this would happen if we limited the maximum level
> to '2' _and_ said we only wanted to visit the leaf entries. In that
> case, I wouldn't expect to descend into any of the L2 table entries
> (because that would imply going beyond level 2) and I wouldn't expect to
> be called for the table entries either (because we're only interested in
> leaves).

Agree, if we specify to skip level-3 entries, it would only walk up to 
level-2 entries, but take above example in detail:
- Split these level-1 leaves, up to level-3 leaves (regular)
  - INFO: kvm_pgtable_walk will call walker:
    - only up to level-2 entries (skip level-3)
    - only on leaf entries
  - Walk first level-1 leaf, calls walker
    - walker will split the level-1 leaf in level-3 leaves
    - walker return from that first level-1 leaf
  - level-1 leaf is reloaded as a table
    - level-2 entries of that table are also walked (unnecessary)
    - on each of the level-2 table entries, level-3 entries are skipped

To avoid the unecessary walk of the level-2 entries above, we would need to 
specify 'skip level-2' that could be an issue if we have a mix of level-1 
and level-2 leaves, as the level-2 leaves in that case would not be split.

That's why I suggest something like "skip recently created table" as a flag 
as well, so we can guarantee no newly created table gets walked 
unecessarily.

Please help me if I am missing something important.

Thanks!
Leo




