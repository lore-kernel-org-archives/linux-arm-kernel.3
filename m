Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307C2CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 17:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZVkYOevjL7FlXWA0dHOu3mnPA7zEZjKOe2JRitWsqY=; b=vP/6t/U6xjN8vYbLzM5SqMYSB+
	gz/fB8fglp3anYbSHYSAlBfb/ZMDdaN3i+ElZMpE1HDe1lmZHUZrj6C//8hqdtjuUYvqoRSLckC6J
	cf8Hg+WpEpe/nJSUFPbjJnzYb+OTDTZD7Bz695x9d69dODCDDbKIpR/L9Tb9LyZ+YhkUoI8f4VSKJ
	gvVg7uvJBAxLvET3U1SwRsP9L+N5lqS4nmht+rGES3MYlWzs52iw8wwZYpaeaKs6xIuoILp8GTvXQ
	UAiF+JnG+IdCpNZqiGBrTpDtiYXAZVf3HVj9hpD039tmkDUkajBskTGNa0MspaDRAnfBOEEKooK52
	5HfoD+jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4fE-00000006gTy-1VOw;
	Tue, 23 Jun 2026 17:11:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4fB-00000006gTU-482G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 17:11:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5C0514BF;
	Tue, 23 Jun 2026 10:11:47 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 290E03F62B;
	Tue, 23 Jun 2026 10:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782234712; bh=Dxe3mvHcxdglVG7y4dd4JmaJkVwRDW0juOrCiKYqNmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GqGg8pmM+4me4s427XLrPiVTIz4+Bk5hJxoH7b02XrTCiKzTMeZEr81wh5odqYxCq
	 Uvscfxy4Ql2su1sbLaQdBANm5mQCX+XE4vv/H7J5V0E+6hfqZv7oXxs9L287NH/Sgp
	 RNdKP8gA1DrJD2dJ+px4es/a9yQ+tJYHSGjgwQ4Y=
Date: Tue, 23 Jun 2026 18:11:46 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: Harry Yoo <harry@kernel.org>, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, corbet@lwn.net, glider@google.com,
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, kaleshsingh@google.com,
	21cnbao@gmail.com, david@kernel.org, will@kernel.org
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
Message-ID: <ajq-Ukmd9NBruhr5@arm.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
 <ajVByfkLbetzA8bB@arm.com>
 <2208123f-8a51-483b-aa93-c35d8d053d25@kernel.org>
 <ajltLd6FQg1aMge_@arm.com>
 <78d97371-b477-4230-8690-ac870a7bab3b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78d97371-b477-4230-8690-ac870a7bab3b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_101154_119436_300EED23 
X-CRM114-Status: GOOD (  36.63  )
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

On Tue, Jun 23, 2026 at 10:32:16AM +0530, Dev Jain wrote:
> On 22/06/26 10:43 pm, Catalin Marinas wrote:
> > On Mon, Jun 22, 2026 at 09:42:10PM +0900, Harry Yoo wrote:
> >> On 6/19/26 10:19 PM, Catalin Marinas wrote:
> >>> On Thu, Jun 18, 2026 at 10:35:15PM +0900, Harry Yoo wrote:
> >>>> On 6/12/26 1:44 PM, Dev Jain wrote:
> >>>>> Now, when a memory object will be freed, it will retain the random tag it
> >>>>> had at allocation time. This compromises on catching UAF bugs, till the
> >>>>> time the object is not reallocated, at which point it will have a new
> >>>>> random tag.
> >>>>>
> >>>>> Hence, not catching "use-after-free-before-reallocation" and not catching
> >>>>> "double-free" will be the compromise for reduced KASAN overhead.
> >>>>
> >>>> I doubt users who care about security enough to enable HW_TAGS KASAN
> >>>> are willing to compromise on security just to save a few instructions
> >>>> to store tags in the free path.
> >>>>
> >>>> To me, it looks like too much of a compromise on security for little
> >>>> performance gain.
> >>>
> >>> I don't think there's much compromise on security for use-after-free.
> >>
> >> I think it depends... OH, WAIT! I see what you mean.
> >>
> >> You mean use-after-free before reallocation does not lead to much
> >> compromise on security because objects are initialized after allocation?
> >>
> >> You're probably right.
> >>
> >> Hmm, but stores to e.g.) free pointer, fields initialized by
> >> constructor or accessed by SLAB_TYPESAFE_BY_RCU semantics after free
> >> will be undiscovered if they happen before reallocation.
> > 
> > Even with SLAB_TYPESAFE_BY_RCU, the object isn't tagged on free either
> > (or realloc, only if the actual slab page ends up freed). But we don't
> > get type confusion for such slab.
> > 
> > However, without tagging on free, one could argue that it reduces
> > security for cases where the page is re-allocated as untagged - e.g. all
> > user pages mapped without PROT_MTE. Currently we have a deterministic
> > tag check fault if the page is coloured as KASAN_TAG_INVALID. I think
> 
> So you are saying that a stale kernel pointer can continue to use the
> reallocated page, because for non-PROT_MTE case the page does not get
> a new tag. Makes sense.

Yes.

> > for this patch, it might be better to only do such skip on free in
> > kasan_poison_slab() rather than kasan_poison(). Freed pages would then
> > be tagged.
> 
> I think you mean to say, "skip tag on free when freeing pages into buddy"?

No, I meant always poison via kasan_poison_pages(), as we currently do
with KASAN_PAGE_FREE being set.

> So that would mean, kasan_poison() will do the poisoning also in the
> case of value == KASAN_PAGE_FREE.
> 
> > An alternative would be tagging on free only with a new tag and skipping
> > it on re-alloc. But we'd need to track when it's a completely new
> > allocation or a reused object (I haven't looked I'm pretty sure it's
> > doable).
> 
> That was our original approach, and IIRC we had concluded there was no
> security compromise. However it is difficult to implement - it has cases
> like, what happens when two differently tagged pages are coalesced by
> buddy and someone gets that large page as an allocation.

Yeah, it's fairly complex.

I think the more problematic case is when we can't detect
use-after-reallocation and this happens when a page is reused untagged
(probabilistically, also when the page is reused with the old tag). As
an optimisation, it might be sufficient to skip poisoning when freeing
an object into the slab but keep the poisoning when freeing a slab page
into the buddy allocator. That's where the page may end up in a place
untagged.

Also for your optimisation to only tag on reallocation, do you have any
code to read the current tag and avoid reusing it? That's useful for
kmalloc caches or other merged kmem caches where we can have type
confusion.

-- 
Catalin

