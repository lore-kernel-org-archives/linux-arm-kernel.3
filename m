Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A038610A3D85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yeTKFSFJOWv+jUMLZH9EXEKrxiBZkbfEw9C8d3m6DLY=; b=ypClcTmFNV38/z5RrQTDVNo4gh
	NirkdnrZwJWWhu8VYrWM9V5+37VbnID8sANblUckW/EZMigwG8aO1WP0ja/nm2pcVErSuGebPcUi2
	PWux/xck59k7CdS7egjAHbC8Y0CU4deZwuv2nD7qzquRVLdg7KR5itjJqAhOJ3vSjbB+lW3i4GMcu
	RrMd+ZSOx/n41N6sDXvRHg4F5oJPFH2D2qfQB60xd2xuDTLe/LPdLINl8NhMqivtvbPelJ2QbyVXK
	F847N5HAzeOVy7yCz1jY2FeuoEiabb5U61L3+Cv2g/ubFI2A7Vv/oPOICRFQ2ot/h5EOm4kQyLnG8
	hYq5i8fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ji6-00000005R8z-10DP;
	Thu, 26 Mar 2026 12:21:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ji1-00000005R8R-3Egt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 12:21:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 064876011F;
	Thu, 26 Mar 2026 12:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54763C116C6;
	Thu, 26 Mar 2026 12:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774527668;
	bh=9LLTIJ5RmSQfF+WpjdmZswjGncAvaFsJ4VCdRZA4Z2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DlZFyddazkJNNpKXRChaUwVejKLEoXdMer7QNWJHeQLjhtSZXy1JPqYKYtBdOE+ZQ
	 4kv5B3Ir6yhLJ39DwxdE6X3nYjTcbo57sfFVrQCqH8G8IglL51z3pnXsj9GfmB2gk8
	 4gTn9EFlhjH/BYy0OKf+5l0aqbWwvaHBoj5EaYVuvzQXkycIS650YFtU+jJWRn/bms
	 gMacOo8K156uNy+HkXJa9XG5VBZBnraqXO8dP+8fCaNlOiR4RQJTROZmB5IIT727MM
	 j2wlg/id/LUkVYM0nfiHg2WPacB2+SpWn2QzEqJYKFFaQc+pKk2KrsAJp61NL2V+od
	 hqPB3UKVTIwhw==
Date: Thu, 26 Mar 2026 12:21:02 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org, catalin.marinas@arm.com, 
	will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com, 
	willy@infradead.org, dev.jain@arm.com, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/5] mm: rmap: support batched checks of the
 references for large folios
Message-ID: <5b1c0687-a4e4-4a95-8e8f-2d2ce171247c@lucifer.local>
References: <d6820b1e-52ae-4ef2-8342-11818fdd0cb1@linux.alibaba.com>
 <43831628-a00f-4292-9797-cb96a029bb00@kernel.org>
 <e54e0ec1-b968-4e12-84a3-4e3d331b1c36@linux.alibaba.com>
 <86f611cb-1292-44e4-b629-6503135d33ca@kernel.org>
 <e5cb474a-a84d-4edc-8289-d68378feee7d@lucifer.local>
 <e3e374cc-ddf2-4112-b063-6cb1839ea566@kernel.org>
 <e227a7f7-0186-4d10-b7b4-c84ca8424bdd@lucifer.local>
 <bfd282b1-523d-4945-97a0-ec30fe1df577@linux.alibaba.com>
 <a0181a7c-d191-483d-bbc9-678bc355a984@lucifer.local>
 <aef474b9-5286-46f4-99d2-43d0b85f7176@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aef474b9-5286-46f4-99d2-43d0b85f7176@linux.alibaba.com>
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

On Thu, Mar 26, 2026 at 08:04:10PM +0800, Baolin Wang wrote:
>
>
> On 3/26/26 7:10 PM, Lorenzo Stoakes (Oracle) wrote:
> > On Thu, Mar 26, 2026 at 09:47:51AM +0800, Baolin Wang wrote:
> > >
> > >
> > > On 3/25/26 11:06 PM, Lorenzo Stoakes (Oracle) wrote:
> > > > On Wed, Mar 25, 2026 at 03:58:36PM +0100, David Hildenbrand (Arm) wrote:
> > > > > On 3/25/26 15:36, Lorenzo Stoakes (Oracle) wrote:
> > > > > > On Mon, Mar 16, 2026 at 03:15:18PM +0100, David Hildenbrand (Arm) wrote:
> > > > > > > On 3/16/26 07:25, Baolin Wang wrote:
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > Sure. However, after investigating RISC‑V and x86, I found that
> > > > > > > > ptep_clear_flush_young() does not flush the TLB on these architectures:
> > > > > > > >
> > > > > > > > int ptep_clear_flush_young(struct vm_area_struct *vma,
> > > > > > > >                  unsigned long address, pte_t *ptep)
> > > > > > > > {
> > > > > > > >       /*
> > > > > > > >        * On x86 CPUs, clearing the accessed bit without a TLB flush
> > > > > > > >        * doesn't cause data corruption. [ It could cause incorrect
> > > > > > > >        * page aging and the (mistaken) reclaim of hot pages, but the
> > > > > > > >        * chance of that should be relatively low. ]
> > > > > > > >        *
> > > > > > > >        * So as a performance optimization don't flush the TLB when
> > > > > > > >        * clearing the accessed bit, it will eventually be flushed by
> > > > > > > >        * a context switch or a VM operation anyway. [ In the rare
> > > > > > > >        * event of it not getting flushed for a long time the delay
> > > > > > > >        * shouldn't really matter because there's no real memory
> > > > > > > >        * pressure for swapout to react to. ]
> > > > > > > >        */
> > > > > > > >       return ptep_test_and_clear_young(vma, address, ptep);
> > > > > > > > }
> > > > > > >
> > > > > > > You'd probably want an arch helper then, that tells you whether
> > > > > > > a flush_tlb_range() after ptep_test_and_clear_young() is required.
> > > > > > >
> > > > > > > Or some special flush_tlb_range() helper.
> > > > > > >
> > > > > > > I agree that it requires more work.
> > >
> > > (Sorry, David. I forgot to reply to your email because I've had a lot to
> > > sort out recently.)
> > >
> > > Rather than adding more arch helpers (we already have plenty for the young
> > > flag check), I think we should try removing the TLB flush, as I mentioned to
> > > Barry[1]. MGLRU reclaim already skips the TLB flush, and it seems to work
> > > fine. What do you think?
> > >
> > > Here are our previous attempts to remove the TLB flush:
> > >
> > > My patch: https://lkml.org/lkml/2023/10/24/533
> > > Barry's patch:
> > > https://lore.kernel.org/lkml/20220617070555.344368-1-21cnbao@gmail.com/
> > >
> > > [1] https://lore.kernel.org/all/6bdc4b03-9631-4717-a3fa-2785a7930aba@linux.alibaba.com/
> > >
> > > > > > Sorry unclear here - does the series need more work or does a follow up patch
> > > > > > need more work?
> > > > >
> > > > > Follow up!
> > > >
> > > > Ok good as in mm-stable now. Sadly means I don't get to review it but there we
> > > > go.
> > >
> > > Actually this patchset has already been merged upstream:)
>
> Let me try to make things clear.
>
> > Err but this revision was sent _during_ the merge window...?
> >
> > Was sent on 9th Feb on Monday in merge window week 1, with a functional change
> > listed:
> >
> > - Skip batched unmapping for uffd case, reported by Dev. Thanks.
> >
> > And then sent in 2nd batch on 18th Feb (see [0]).
> >
> > So we were ok with 1 week of 'testing' (does anybody actually test -next during
> > the merge window? Was it even sent to -next?) for what appears to be a
> > functional change?
>
> I posted v5 on Dec 26th[0], and it collected quite a few Reviewed-by tags
> and sat in mm-unstable for testing.
>
> Later, Dev reported a uffd-related issue (I hope you recall that
> discussion). I posted a fix[1] for it on Jan 16th, which Andrew accepted.
>
> Since then, the v5 series (plus the fix) continued to be tested in
> mm-unstable. We kept it there mainly because David mentioned he wanted to
> review the series, so we were waiting for his time.
>
> On Feb 9th, after returning from vacation, David reviewed the series
> (thanks, David!). I replied to and addressed all his comments, then posted
> v6 on the same day[2].

OK thanks, I see that now.

I still don't think we should have made any changes _during_ the merge window,
even if they were simple code quality things.

Changing patches then seems just crazy to me, as even code quality stuff can
cause unexpected bugs, and now we're having upstream take it.

Also this speaks to -fix patches just being broken in general.

If you'd just respun with the fix as a v6, then we'd know 'v6 sent on 16th Jan
addressed this' and there'd be no isssue.

Now v5 isn't v5, there's v5 and something-not-v5 and to have a sense of the
testing you have to go read a bunch of email chains.

It also means change logs are now really inaccurate:

Changes from v5:
 - Collect reviewed tags from Ryan, Harry and David. Thanks.
 - Fix some coding style issues (per David).
 - Skip batched unmapping for uffd case, reported by Dev. Thanks.

And that to me means 'v5 didn't have this, v6 does'.

And it's really hard to track timelines for testing.

>
> Additionally, v6 had no functional changes compared to v5 + the fix, and it
> mainly addressed some coding style issues pointed out by David. I also
> discussed this with David off-list, and since there were no functional
> changes, my expectation was that it could still make it into the merge
> window. That is why v6 was merged.

Yeah, we still shouldn't have taken changes to a series DURING the merge window,
it's just crazy.

>
> [0] https://lore.kernel.org/linux-mm/cover.1766631066.git.baolin.wang@linux.alibaba.com/#t
> [1] https://lore.kernel.org/linux-mm/20260116162652.176054-1-baolin.wang@linux.alibaba.com/
> [2] https://lore.kernel.org/all/cover.1770645603.git.baolin.wang@linux.alibaba.com/
>
> > And there was ongoing feedback on this and the v5 series (at [1])?
>
> Regarding the feedback on v5, I believe everything has been addressed.
>
> > This doesn't really feel sane?
> >
> > And now I'm confused as to whether mm-stable patches can collect tags, since
> > presumably this was in mm-stable at the point this respin was done?
> >
> > Maybe I'm missing something here but this doesn't feel like a sane process?
>
> Andrew, David, please correct me if I've missed anything. Also, please let
> me know if there's anything in the process that needs to be improved.
> Thanks.

This isn't on you, it's about the process as a whole. We need clear rules about
when changes will be accepted and when not.

And frankly I think we need to do away with fix patches as a whole based on
this, or at least anything even vaguely non-trivial or that potentially impacts
code.

Thanks, Lorenzo

