Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4418CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 01:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NO8UUl0cc2qXIJH7SLeI5Q+K1DE7y81dX+uJlx5f+fA=; b=Ri3QYzLcJ6U9M6giQpBC1Z96IG
	CIoEPOiYM7oWBLJ8TCCHb2ZFfcvLMVnGeSmrwswmjqk1gCNCcqvxW8HYJla6a95y759y7kVlP6Tad
	ApgjDQt/ogqy+EmjOlkDkqurbb08k4VVj2Akpfi0XV4eJZNpWik8c63G7daYczKJuvFytwywJfNMs
	cOq1XU2EndsUL7/MacS3xDqfTObQ8UDCOJzDkKI5kiF/VI0CBriv+uEa8G36A7suZHpcHd4GFNpi3
	Z4/46WUgfhhC1MLN+3G3qcMINakKOLCXabFiNw2ylAdHoNOgJ45MFPQnsejP/2yKl1+FTQBAii1vs
	HM+sExhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG5Uc-0000000AsPX-2fiW;
	Tue, 04 Nov 2025 01:05:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG5Ub-0000000AsPR-0seq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 01:05:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35633601DF;
	Tue,  4 Nov 2025 01:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5AB0C4CEE7;
	Tue,  4 Nov 2025 01:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1762218347;
	bh=5TWeHa9L+UKC4ivQThYbj/5dl2jCMFfjpOayfYk03Eg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ji11rneq0JEXsVQI7V39y4Y+9FA53jlHpB/K7jPiOJWiHK0e/XbRu/mia1j7obbkH
	 lnN2GObf3hn/rv7b86Dz/H96saru74TYLPT9c1D0HEL+X4SBc1XMoej/Palr1yJrfv
	 D8UGNsmEDluRipk/cTfeuHwEbfZg2EXt4jg+AR7s=
Date: Mon, 3 Nov 2025 17:05:47 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>, Mark Brown
 <broonie@kernel.org>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
 Aishwarya.TCV@arm.com
Subject: Re: [PATCH] mm/huge_memory: Initialise the tags of the huge zero
 folio
Message-Id: <20251103170547.4935d9caae8bf558faa1b04f@linux-foundation.org>
In-Reply-To: <aQjRa-Bh8J8Smgur@arm.com>
References: <20251031170133.280742-1-catalin.marinas@arm.com>
	<aQiu-hU3x5V5drHF@finisterre.sirena.org.uk>
	<aQi8dA_QpXM8XqrE@arm.com>
	<79a1f2dd-6752-426c-84c1-a38d300eb78c@kernel.org>
	<aQjRa-Bh8J8Smgur@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 3 Nov 2025 15:59:39 +0000 Catalin Marinas <catalin.marinas@arm.com> wrote:

> > > --- a/arch/arm64/mm/fault.c
> > > +++ b/arch/arm64/mm/fault.c
> > > @@ -969,6 +969,16 @@ struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
> > >   void tag_clear_highpage(struct page *page)
> > >   {
> > > +	/*
> > > +	 * Check if MTE is supported and fall back to clear_highpage().
> > > +	 * get_huge_zero_folio() unconditionally passes __GFP_ZEROTAGS and
> > > +	 * post_alloc_hook() will invoke tag_clear_highpage().
> > > +	 */
> > > +	if (!system_supports_mte()) {
> > > +		clear_highpage(page);
> > > +		return;
> > > +	}
> > 
> > LGTM!
> 
> I tested it with and without MTE and it works fine.
> 
> Andrew, would you like a separate patch or are you ok with folding this
> into the previous patch?

I added it as a -fix patch thanks.

And I added a Signed-off-by-you-by-me ;)

