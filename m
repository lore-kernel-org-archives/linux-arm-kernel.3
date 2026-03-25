Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E5B109C059
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 18:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlLhePYL80sOu02aUw6u8m/4ZKI00p8+/Y45HKjk0/A=; b=SQ/nBavTuEqSIIi8qm9xhTEJkl
	S8xDrSrM3k7AlLGy2iGhr/rOY/dvecyCwiOQzxsbLFl5Z0HQdamkhzrKY8nfot+sJ+xaPC1h8ZEFM
	uuy0YcV5Ohh0eCYYZnVML4nGD75/TlqH3pUT8SNRMT0mNpa4ycVNIS7jjh6oIHAwUVmpgHkCoYP4U
	EGRAJUeBFynun6hLju8iQI9qT1V64cSdhM/cnSuvqVBwyH3Xx7IUcSo9amlEf0Nv93iWYSBHYvhRh
	I3sWgxMrLcxAITvyLFGMJRVbclJIzUFb2ysMPD4QQc7pMVf1u5RdvPYg+eIECl8cu7jyXQwjhRvXZ
	HbmzUMsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5TRC-00000004794-1yCW;
	Wed, 25 Mar 2026 18:58:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5TR9-0000000478U-238h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 18:58:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 11488400A9;
	Wed, 25 Mar 2026 18:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC86C4CEF7;
	Wed, 25 Mar 2026 18:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774465117;
	bh=4wiJb71r8PouC2/f0A5EgwpoJUcINFnRCFiI7rXCalY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPjEZEVVQk+BooWQbKW7Ksnp8brOVn6HUSS502JAp69PF4/u1BGp6R/hmHGl5WR3+
	 XSriiIBGBiecnBYISBNXfK6H4K9NqNvKILt9H6eKYbTO052CnkqGYKtEDjvwouf1V0
	 QheFOcAqWp04zUAZo3UAbMgndolyQPgP6MAL0qtkexjGQfy/P+KTq2UacijgwM3E4+
	 6UeVAOPpMsRHcpzmjaAoKrLeInomrdF+om93X7p/hRJWHbg66WIBrSGKGxbzpEHouv
	 q1mWa13Vhm1Slz3w/NPfmhX+69jYqpErrohKCY1A7492nGSM70gMMjNKb9cPj7bnoV
	 ooomwlbcpt6/Q==
Date: Wed, 25 Mar 2026 18:58:30 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Barry Song <21cnbao@gmail.com>, catalin.marinas@arm.com, 
	will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com, 
	willy@infradead.org, dev.jain@arm.com, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/5] mm: rmap: support batched checks of the
 references for large folios
Message-ID: <92e77b03-b7d4-45f0-8077-b3f745727785@lucifer.local>
References: <e54e0ec1-b968-4e12-84a3-4e3d331b1c36@linux.alibaba.com>
 <86f611cb-1292-44e4-b629-6503135d33ca@kernel.org>
 <e5cb474a-a84d-4edc-8289-d68378feee7d@lucifer.local>
 <e3e374cc-ddf2-4112-b063-6cb1839ea566@kernel.org>
 <e227a7f7-0186-4d10-b7b4-c84ca8424bdd@lucifer.local>
 <20260325083016.a32095bea3f04488a7c9005a@linux-foundation.org>
 <af9d8a6a-074c-412c-ac5e-3f0dadde3e7d@lucifer.local>
 <20260325092300.9008e605ed5550ce4935638f@linux-foundation.org>
 <7820cffe-60bf-4ff6-af10-89c774f0fe0c@lucifer.local>
 <20260325114305.eb90add580948aa56a88373b@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325114305.eb90add580948aa56a88373b@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_115839_548890_686954F5 
X-CRM114-Status: GOOD (  18.95  )
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

On Wed, Mar 25, 2026 at 11:43:05AM -0700, Andrew Morton wrote:
> On Wed, 25 Mar 2026 16:28:18 +0000 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org> wrote:
>
> > On Wed, Mar 25, 2026 at 09:23:00AM -0700, Andrew Morton wrote:
> > > On Wed, 25 Mar 2026 15:32:50 +0000 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org> wrote:
> > >
> > > > Really I guess I'd like to know the timing of when mm-stable is taken so I can
> > > > know the deadline for stuff like this.
> > >
> > > Yeah, as mentioned elsewhere I'll add some words into the series file to
> > > try to describe this.
> > >
> > > But the start of the migration is quite variable (-rc4 through -rc6) so
> > > I'll aim to keep people updated in the weekly "mm.git review status"
> > > emails.
> > >
> >
> > Thanks. Wasn't aware that was a thing actually, but I see
> > https://lore.kernel.org/linux-mm/20260323202941.08ddf2b0411501cae801ab4c@linux-foundation.org/
> > now.
>
> Well now I'm all sad.
>
> Yeah, I started doing this Feb 2, shall attempt to sustain this weekly
> after we've hit -rc4 ish.  I expect I'll be adding more waffle to these as
> things occur to me.  A general overview of where the tree is at.
>
> I can Bcc: people if asked ;)   lmk.
>

Yes please!

Thanks, Lorenzo

