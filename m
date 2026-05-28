Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C7FCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 16:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHY9xQqQC+J7YMc/MpvDrKemWT4Wz2Lk7BxhuomWoYQ=; b=s4DQrg0S5VdDW8oX66FQXBtVOD
	z3e8rDeIhASR13o7qdz11+EY1p73crzNTqeyD9NVCiyi/f3DqUgiON0YC28jC2QunR3nDT5nkpaiV
	umflbxdIHmAg+KwXHttF6uU8OSCtLhTxvAPf777dgXa805A312OyLw++Al6mUEjIO/AP6jhEWI0cY
	8C8PMZl30+MujIBp0+/vPO0fi+ABSq83a04JP3b5/Begy6KyagmjztqUE1VUL3sNnqsB79RqHcKRd
	newMiH7Nosck/FEZ66r4QtTePnaK9sPM5WRuwo7NPpa//TwBANVnKDN31mG2heXKLA1B/DCX69XIU
	Hrv26O5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdCv-00000005xWd-0Y7V;
	Thu, 28 May 2026 16:03:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdCt-00000005xW7-14Xt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 16:03:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 144CB22BE;
	Thu, 28 May 2026 09:03:31 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 377EC3F905;
	Thu, 28 May 2026 09:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779984216; bh=8J8dltwTBXdA8FiBW3y/uxaPcc41KNdgTwcsweyy97o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gi9hb7cLuukNhJYrF5l2ObTiuU9OgwQ2Eo6pw+VtVKqBRqaGSXeMvuq7dUQDPpzTf
	 nFSkOBpgAFQ8NHtcMxvFMSPitJvz4vJN37wamfizisgRjhEYDn+yYQ3UnftznhQINn
	 XkZv7Qc8kR/dJ2o4FDLrRhwhv24diWXsX5tgl+qw=
From: Leonardo Bras <leo.bras@arm.com>
To: Oliver Upton <oupton@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Will Deacon <will@kernel.org>,
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
Date: Thu, 28 May 2026 17:03:32 +0100
Message-ID: <ahhg11mzqTDyVjf3@devkitleo>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <agzUZS1l-uHQoodG@kernel.org>
References: <20260515195904.2466381-1-leo.bras@arm.com> <20260515195904.2466381-2-leo.bras@arm.com> <agq-RyKhBy4CIThm@kernel.org> <agrTQMw4QJX6HGrm@willie-the-truck> <agsYF-Dav2bpxWK4@devkitleo> <agxa-TydN1PoKsYn@willie-the-truck> <agxeEA14cP3yMV1m@devkitleo> <agxifbKzGcYQivBz@willie-the-truck> <agx1J1tQFn0cdtBf@devkitleo> <agzUZS1l-uHQoodG@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_090339_372253_D73FE3E7 
X-CRM114-Status: GOOD (  44.25  )
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

On Tue, May 19, 2026 at 02:21:41PM -0700, Oliver Upton wrote:
> On Tue, May 19, 2026 at 03:35:19PM +0100, Leonardo Bras wrote:
> > On Tue, May 19, 2026 at 02:15:41PM +0100, Will Deacon wrote:
> > > On Tue, May 19, 2026 at 01:56:48PM +0100, Leonardo Bras wrote:
> > > > On Tue, May 19, 2026 at 01:43:37PM +0100, Will Deacon wrote:
> > > > > > > I was wondering along similar lines, but maybe it would be useful just
> > > > > > > to pass a maximum level to the walker logic? That feels like the most
> > > > > > > general case without complicating the existing logic.
> 
> FWIW, I had considered this too but decided that it requires a bit more
> churn since we cannot rely on zero initialization in the existing
> callsites (level 0 is a valid level).
> 
> But that's extremely minor.
> 

Instead of passing a number, I implemented it in a dumber way:
+	KVM_PGTABLE_WALK_SKIP_LEVEL0		= BIT(7),
+       KVM_PGTABLE_WALK_SKIP_LEVEL1            = BIT(8),
+       KVM_PGTABLE_WALK_SKIP_LEVEL2            = BIT(9),
+       KVM_PGTABLE_WALK_SKIP_LEVEL3            = BIT(10),

And did some tests, which I commend below...


> > > > > > This proposal seems simpler for me to understand, and indeed looks like a 
> > > > > > better solution than what I have proposed, taking care of  the 
> > > > > > 'already split' case with better performance, as it don't even walk a 
> > > > > > single level-3 entry. 
> > > > > > 
> > > > > > On the 'splitting' case, it also works flawlessly if the memory is given in 
> > > > > > level-2 blocks. There is only one case that I would like to address here:
> > > > > > 
> > > > > > - Memory given in level-1 blocks (say 1GB)
> > > > > > - Walker flag says 'walk down to level-2 only'
> > > > > > - Split Walker on level-1 will break page down to (up to) level-3 entries.
> > > > > > - Walker will continue to be called on level-2 entries, even though it's 
> > > > > >   not necessary.
> > > > > 
> > > > > If you're only visiting leaves, why would it be called on the level-2
> > > > > table entries?
> > > > > 
> > > > 
> > > > Because once the leaf is turned into a table by the splitting walker, it 
> > > > gets reloaded and walked. This is an excerpt of __kvm_pgtable_visit():
> > > 
> > > Sorry, I was musing about the semantics after adding something to limit
> > > the maximum level. I don't dispute what the current code would do.
> > > 
> > > > Example:
> > > > - Split this level-1 leave:
> > > >   - Walker creates the whole structure up to given level (currently 3)
> > > >   - Walker returns, gets reloaded, table detected, go down on that one
> > > >   - Level 2 entries walked (which is unnecessary)
> > > > 
> > > > Please let me know if I am misunderstanding something.
> > > 
> > > I just don't grok why this would happen if we limited the maximum level
> > > to '2' _and_ said we only wanted to visit the leaf entries. In that
> > > case, I wouldn't expect to descend into any of the L2 table entries
> > > (because that would imply going beyond level 2) and I wouldn't expect to
> > > be called for the table entries either (because we're only interested in
> > > leaves).
> > 
> > Agree, if we specify to skip level-3 entries, it would only walk up to 
> > level-2 entries, but take above example in detail:
> > - Split these level-1 leaves, up to level-3 leaves (regular)
> >   - INFO: kvm_pgtable_walk will call walker:
> >     - only up to level-2 entries (skip level-3)
> >     - only on leaf entries
> >   - Walk first level-1 leaf, calls walker
> >     - walker will split the level-1 leaf in level-3 leaves
> >     - walker return from that first level-1 leaf
> >   - level-1 leaf is reloaded as a table
> >     - level-2 entries of that table are also walked (unnecessary)
> >     - on each of the level-2 table entries, level-3 entries are skipped
> > 
> > To avoid the unecessary walk of the level-2 entries above, we would need to 
> > specify 'skip level-2' that could be an issue if we have a mix of level-1 
> > and level-2 leaves, as the level-2 leaves in that case would not be split.
> > 
> > That's why I suggest something like "skip recently created table" as a flag 
> > as well, so we can guarantee no newly created table gets walked 
> > unecessarily.
> > 
> > Please help me if I am missing something important.
> 
> I'm not sure the added complexity of handling this case perfectly results
> in a measurable performance improvement. Just avoiding the level 3
> tables would be an exponential reduction (~ 512-8192x) in the number of
> walk steps.
> 

I tested both scenarios* compared to Vanilla on an AmpereOne and the 
testing numbers agree with you: The added complexity of checking for the 
skip_child makes the routine about 1% slower.

Those tests measured the times for the whole syscall that happens to do 
page splitting, in this case, 
1 - Manual protect and init set: On every KVM_CLEAR_DIRTY_LOG, if the page 
    was requested to be cleaned
2 - Otherwise, on dirty log enable (aka KVM_SET_USER_MEMORY_REGION2 with 
    KVM_MEM_LOG_DIRTY_PAGES set in flags), for the whole memslot 

I will post the detailed results as a reply to the cover letter.

Thanks!
Leo 

*scenario 1: skip level
*scenario 2: skip level + skip child

