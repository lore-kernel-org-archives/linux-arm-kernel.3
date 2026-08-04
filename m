Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DD3C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 13:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7WVi0zd6LcUoDLabZYLULWttoR4Wlz1WJNokp6HKtFM=; b=kfmGPiGZEdfl74szVMgXecD/cZ
	qYdnAvxwBfpRbjBmdfaZ/40RmqAKKt+hx1rTyHd29t/zckzy3RDAkHVCvpJlVv5t3j1AxKuopUMq5
	m/9uz32EILyydsX5lT+nZYCEB5fMDMBzrJXW3hEH5EPvCPFyYw9Ys2RnnGL9FfEtga+gy5Osxu3dX
	aHL1makuwGmh+g8GzLXEXmOKFYtBaGHVC9MwMzmEfvY8PEbpoLY7pRG7kpFNrC/E9WYz9YBAKiZ3/
	jzeBck4BIxOubG/9xNgog//Jbm9WExnjNVRyvUj9427qg0t1XLjuinT1vF9dKquPALsSzQkGuLOZG
	m6iPyqVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrEoV-00000001sdl-3hHr;
	Tue, 04 Aug 2026 13:04:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrEoU-00000001sdc-2wx4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 13:04:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BD1460A7E;
	Tue,  4 Aug 2026 13:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DAB1F00A3D;
	Tue,  4 Aug 2026 13:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785848649;
	bh=7WVi0zd6LcUoDLabZYLULWttoR4Wlz1WJNokp6HKtFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aZ8xZk5PzuGz/b2moWBb4VVtz0n3Ung2XSO7gIhRagGOIZjNIMkuzHy6jFMeVHTWF
	 nA1BvJi/iE2VrsC4XD17lCgxplfi63Afoif31Yj2W0EGlxUQiKtKFRwnI+14Z77Zm/
	 wyREeQLepUuHknwIHKHs5MtSxkyB6+MmQecXZ+aqfDSvp48OtiFS+A/zUg63hoVMix
	 vyCQNYITywtcPJ3HpjO2neSJHyvnHkv687QC8xcOOIa/gki5DxBEwggQe/7XGb0akN
	 nzWsq0j8rO5RTc990ehdmT0keE1zCMZ4cmTlxK1aOc4jA6KVyjsh2uKeL8OyzltUDm
	 Jyzl0tvAyFYNw==
Date: Tue, 4 Aug 2026 14:03:47 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Helge Deller <deller@gmx.de>
Cc: Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Muhammad Usama Anjum <usama.anjum@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH v2 2/6] parisc: Drop own implementations for ptep_get()
 and ptep_test_and_clear_young()
Message-ID: <anHi9n3_8bLjAsxy@lucifer>
References: <20260803164400.531199-1-pfalcato@suse.de>
 <20260803164400.531199-3-pfalcato@suse.de>
 <anHHyiHqYf3yLf2K@lucifer>
 <anHcJZYyz9Zrshdm@pedro-suse>
 <anHd7ho3daZFZ-4r@lucifer>
 <e7ac6f83-72ff-43c0-b67b-6b17caed995e@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7ac6f83-72ff-43c0-b67b-6b17caed995e@gmx.de>
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

On Tue, Aug 04, 2026 at 03:00:43PM +0200, Helge Deller wrote:
> On 8/4/26 14:42, Lorenzo Stoakes (ARM) wrote:
> > On Tue, Aug 04, 2026 at 01:34:41PM +0100, Pedro Falcato wrote:
> > > On Tue, Aug 04, 2026 at 12:11:08PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > > On Mon, Aug 03, 2026 at 05:43:56PM +0100, Pedro Falcato wrote:
> > > > > From: Helge Deller <deller@gmx.de>
> > > > >
> > > > > Switch to the generic implementations, which are identical.
> > > >
> > > > You sure do like succinct commit messages :)
> > >
> > > I didn't even write this one! See the From: :))
> >
> > Lol well then feedback addressed to Helge ;)
>
> Noted :-)
>
> > > > Maybe worth saying by dropping the __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG and
> > > > ptep_get defines you get the generic versions from include/pgtable.h which are
> > > > functionally identical.
>
> Isn't that basically the same as:
> "Switch to the generic implementations, which are identical."
> ;-)

I am being _exceedingly_, possibly outrageously pedantic here :>)

>
> > > I can touch it up though, if you insist.
> >
> > Yeah, I'm being pedantic here it's not vital to have this change :) but be nice
> > if you could, I'm sure Helge probably wouldn't mind too much? :)
>
> Yes, I'm fine with any cleanup/rephrasing of the commit message.

Thanks :)

> Thanks!
> Helge
>
> > > > (Being pedantic, they're not quite strictly identical as the
> > > > ptep_test_and_clear_young() generic function does some weird unnecessary
> > > > indirection with a local variable and the single {} is dropped etc.)

--
Cheers, Lorenzo

