Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5913AC55838
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 12:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84QprRHwhrz+Nkiqha49/PA9CxYa6FBg6w6noEz86g8=; b=Gx51rEbt0go4j+Uwlgqnwk8Kai
	pknmmmSboM7L68HTeurs591AgpOBKNT+z9hyo09oj2qyxW+2636fyEuun1uf2ySoYtGmnEQwfpqcY
	F6IFdZi9sX7kas3jqkE9p3HSTktOEJsQAzqHO8NWVh8wEKsnknDJOmfHSXuMeQu+/NjLtRlWqNvLI
	IX2dC7w8WOe1Eo+CSjawEK0N5loRCxmTcm37meHXColY86UKUmmqmUuUWHldHziqqBsPeJ5/cxwt8
	Slb19nHPSmzc3kbuV+hQuGoV2nhoRyklpKRfefuOj5i/8PEN4L1YMdBYI6kMgxhdFynymRTO3A228
	d2i8uoMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrEUG-00000001qKd-1qPM;
	Tue, 04 Aug 2026 12:43:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrEUE-00000001qKS-1tg1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 12:43:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B2F5441B35;
	Tue,  4 Aug 2026 12:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F3F1F000E9;
	Tue,  4 Aug 2026 12:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785847393;
	bh=84QprRHwhrz+Nkiqha49/PA9CxYa6FBg6w6noEz86g8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UWOdWAkRkJHZkJxmRSHFZYlpGkORiS1kGH2fYisI2uada2AxRE+GeYyHciAVPQr30
	 MNZd6q6kuVhstTX1GSsaMMzewptHToT1kUH0WuveZ7i5IRR9AZFh985L1e0HOxs32H
	 wXbHaoX6vi/rrkSLGy0movwuGO/cWJNMbN6vwTmSwcxFllPwoOqPNM4CgVKNryMIWa
	 OEW9DeHljNMC9Hvnie84zgLGzjIjuFDoip29CmY7iUbIDxnCzqtPygXPJBrUyyRV78
	 YpoweashigOAa2jiQFa9l0ujqRtV9rDaln9png6xRNUr3jCjFaCfpjuh2tbsAOeuHv
	 zbwT/VJNUydlA==
Date: Tue, 4 Aug 2026 13:42:51 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Muhammad Usama Anjum <usama.anjum@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH v2 2/6] parisc: Drop own implementations for ptep_get()
 and ptep_test_and_clear_young()
Message-ID: <anHd7ho3daZFZ-4r@lucifer>
References: <20260803164400.531199-1-pfalcato@suse.de>
 <20260803164400.531199-3-pfalcato@suse.de>
 <anHHyiHqYf3yLf2K@lucifer>
 <anHcJZYyz9Zrshdm@pedro-suse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anHcJZYyz9Zrshdm@pedro-suse>
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

On Tue, Aug 04, 2026 at 01:34:41PM +0100, Pedro Falcato wrote:
> On Tue, Aug 04, 2026 at 12:11:08PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Mon, Aug 03, 2026 at 05:43:56PM +0100, Pedro Falcato wrote:
> > > From: Helge Deller <deller@gmx.de>
> > >
> > > Switch to the generic implementations, which are identical.
> >
> > You sure do like succinct commit messages :)
>
> I didn't even write this one! See the From: :))

Lol well then feedback addressed to Helge ;)

>
> >
> > Maybe worth saying by dropping the __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG and
> > ptep_get defines you get the generic versions from include/pgtable.h which are
> > functionally identical.
> >
>
> I can touch it up though, if you insist.

Yeah, I'm being pedantic here it's not vital to have this change :) but be nice
if you could, I'm sure Helge probably wouldn't mind too much? :)

>
> > (Being pedantic, they're not quite strictly identical as the
> > ptep_test_and_clear_young() generic function does some weird unnecessary
> > indirection with a local variable and the single {} is dropped etc.)
> >
> > >
> > > Suggested-by: Usama Arif <usama.arif@linux.dev>
> > > Suggested-by: John David Anglin <dave.anglin@bell.net>
> > > Signed-off-by: Helge Deller <deller@gmx.de>
> > > Signed-off-by: Pedro Falcato <pfalcato@suse.de>
> >
> > Nits above notwithstanding, LGTM so:
> >
> > Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> Thanks!
>
> --
> Pedro

--
Cheers, Lorenzo

