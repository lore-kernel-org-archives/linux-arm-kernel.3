Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EFDD69113
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 14:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zk+38GcVkHyfGsfMVYqHv5jFWy+UyzxE4EWE+6e9rBE=; b=gLji39mrMfsmQyaytxgxV3zIeT
	/RBlf0fvshXl6R/u/3MzIUCFDlkGsPZb/aKVPEQdaLHngoYB6j++rDPoTdPQlhPAgZHbFonWFJaQM
	LuNiL5Er4SDT6gsCnRu2vkFSm0dFpHaBZ0N+Ba1PqibuwR/QE2cgrAnWazRylPq0xrItVgeLFdJWW
	ycAq4WFkwxF7ipCwpu/Ms4HFBP3OCTznG1gIXy5gy08dC/3vDrpzDTNkhFzHcQ9thFpHwCekq0RGA
	5mwulEhCEW1w/8CVubkk4srPzgihhniQZ8E3Ha9NpX89NdqiDL4tGPmmuwJ4XOE4TsNViAudJafs2
	i3AEMM0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfOh-0000000FkVp-3r7U;
	Thu, 28 Nov 2024 14:21:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfNj-0000000FkQP-2kxa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 14:20:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1DE9AA43BE7;
	Thu, 28 Nov 2024 14:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F6D3C4CECE;
	Thu, 28 Nov 2024 14:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732803634;
	bh=qLn7KCjfeNms18fyJ3R4Q7z/HaY/qcbgERgC7rBSsrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GnhZS14aE5CoghTDrv+dKiJwvpB9YXrZuVykroRSy9YysOGGCj0sGW1lbtqp5rxGE
	 E2szlbIyPkxndDXy6WDDz+5pQIpCQxO2/ue+2b10hELPyifwRFA150KkZIj0sATc3e
	 9LbIwSZI1OJDANcRomO7I2aF+owml7Lo9HMBg65LWXGfgfW2MI+6ckPLFeMMy7lkPn
	 gJYAoLN4sscAXjMOHJBZ+Q1XCO3vfy7230pNkFexFrHUTNYXU1kGI80o7iiWkvTpCC
	 Odt9M6KdWxJfgJ5hlw1WHKuetIRjZTyxsZmG2FXwt7ErUJe+YRQvSLTONY81VgCX9a
	 O776BICHiG4GQ==
Date: Thu, 28 Nov 2024 14:20:28 +0000
From: Will Deacon <will@kernel.org>
To: Yu Zhao <yuzhao@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Thomas Gleixner <tglx@linutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Nanyong Sun <sunnanyong@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 0/6] mm/arm64: re-enable HVO
Message-ID: <20241128142028.GA3506@willie-the-truck>
References: <20241107202033.2721681-1-yuzhao@google.com>
 <20241125152203.GA954@willie-the-truck>
 <CAOUHufYUMYcf=uF7=2zj-PsGXePCDdsRHJGa8t-e-k9VUvYyQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOUHufYUMYcf=uF7=2zj-PsGXePCDdsRHJGa8t-e-k9VUvYyQQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_062035_832112_6BF941B6 
X-CRM114-Status: GOOD (  31.81  )
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

On Mon, Nov 25, 2024 at 03:22:47PM -0700, Yu Zhao wrote:
> On Mon, Nov 25, 2024 at 8:22 AM Will Deacon <will@kernel.org> wrote:
> > On Thu, Nov 07, 2024 at 01:20:27PM -0700, Yu Zhao wrote:
> > > HVO was disabled by commit 060a2c92d1b6 ("arm64: mm: hugetlb: Disable
> > > HUGETLB_PAGE_OPTIMIZE_VMEMMAP") due to the following reason:
> > >
> > >   This is deemed UNPREDICTABLE by the Arm architecture without a
> > >   break-before-make sequence (make the PTE invalid, TLBI, write the
> > >   new valid PTE). However, such sequence is not possible since the
> > >   vmemmap may be concurrently accessed by the kernel.
> > >
> > > This series presents one of the previously discussed approaches to
> > > re-enable HugeTLB Vmemmap Optimization (HVO) on arm64.
> >
> > Before jumping into the new mechanisms here, I'd really like to
> > understand how the current code is intended to work in the relatively
> > simple case where the vmemmap is page-mapped to start with (i.e. when we
> > don't need to worry about block-splitting).
> >
> > In that case, who are the concurrent users of the vmemmap that we need
> > to worry about?
> 
> Any speculative PFN walkers who either only read `struct page[]` or
> attempt to increment page->_refcount if it's not zero.
> 
> > Is it solely speculative references via
> > page_ref_add_unless() or are there others?
> 
> page_ref_add_unless() needs to be successful before writes can follow;
> speculative reads are always allowed.
> 
> > Looking at page_ref_add_unless(), what serialises that against
> > __hugetlb_vmemmap_restore_folio()? I see there's a synchronize_rcu()
> > call in the latter, but what prevents an RCU reader coming in
> > immediately after that?
> 
> In page_ref_add_unless(), the condtion `!page_is_fake_head(page) &&
> page_ref_count(page)` returns false before a PTE becomes RO.
> 
> For HVO, i.e., a PTE being switched from RW to RO, page_ref_count() is
> frozen (remains zero), followed by synchronize_rcu(). After the
> switch, page_is_fake_head() is true and it appears before
> page_ref_count() is unfrozen (become non-zero), so the condition
> remains false.
> 
> For de-HVO, i.e., a PTE being switched from RO to RW, page_ref_count()
> again is frozen, followed by synchronize_rcu(). Only this time
> page_is_fake_head() is false after the switch, and again it appears
> before page_ref_count() is unfrozen. To answer your question, readers
> coming in immediately after that won't be able to see non-zero
> page_ref_count() before it sees page_is_fake_head() being false. IOW,
> regarding whether it is RW, the condition can be false negative but
> never false positive.

Thanks, but I'm still not seeing how this works. When you say "appears
before", I don't see any memory barriers in page_ref_add_unless() that
enforce that e.g. the refcount and the flags are checked in order and
I can't see how the synchronize_rcu() helps either as it's called really
earlyi (I think that's just there for the static key).

If page_is_fake_head() is reliable, then I'm thinking we could use that
to steer page_ref_add_unless() away from the tail pages during the
remapping operations and it would be fine to use a break-before-make
sequence.

Will

