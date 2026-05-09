Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2A3CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oOr15lhB2hYKh+9zKzPi4kv7JyYr4PGQI35DlaGm7s=; b=VIIuwu5C8KhDEM+0eImOx+wd7a
	8dfSfUOunCokuKHgfZZzoupHvi97KdpJ4WpNAfomUOhD8Sq4k6K5lGkUnfMyJrSWkxM0F+nzMiVBI
	iWubmqLdwBOp4lkKPWGufb/LOG1bqcc/z/P2CcxQerlJSR09CXijGgvR0IpX3F9c2E7lIdTTWVU3m
	OshKqLwQEnue4gggseNB0t2m/do6vv0Itx57+XM26gWurEP4qGqVckcqYQpezqAI7AZ9fL9pIwiRk
	36PEAAoe6HvF6ip8hkUNWEaANni9lLUAuNi+kU9olboi53wqCvTWVbfoYIBcD3+YrYVbofsnXB1Ez
	2BzTzpNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLfUW-00000008oeo-2Tm8;
	Sat, 09 May 2026 11:05:04 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLfUT-00000008odf-2WVm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 11:05:03 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A1D357A00BC;
	Sat,  9 May 2026 07:04:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 09 May 2026 07:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1778324696; x=
	1778411096; bh=6oOr15lhB2hYKh+9zKzPi4kv7JyYr4PGQI35DlaGm7s=; b=i
	YHwp/XRv0gFo5lo0yIQ7J3BAhxjKzc3qK9tshRBnSUZQ7Mp9aH96+Wpnu1y3GWU3
	UXBfnZHHE6GUePMKSrbBXQJuHtmVhe/9KdUqGG9+g4zhdo82l7Zcl1wNVDqlWfBm
	0HyAlYwth+3lEoTET+zje/53ySJiy7rVG5PyRC/qflCORE5ANufiF3gyvsqWuejS
	ZVvEM4pS0vD0A/QbxyDRXtHCw20oKudQDFFA2vBKGA/Scp+UFHsrubM4oYb3YfFc
	0c7fd9TxoTejQVLLp8+rWmDTLqsAcWkkeCMi+qXc9w4jFWta2dg1XrRt9DqPoEyz
	mI4Y4mK1w9pcw9kRHdNuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778324696; x=1778411096; bh=6oOr15lhB2hYKh+9zKzPi4kv7JyYr4PGQI3
	5DlaGm7s=; b=WWrwA2q5wWAbrLhsibxkrHgSeKPAYsHWw5tDREWL+X9KWWCjoOm
	Tj0iUCm3Rmp6aAVYyK0yk+R+NKby83yPn53wIwthTfHnJz78Oa+JTVE6rGNRep91
	2Of0ERtNC5HHgqoOtjNNXOjXKmsdfZCqArYTECWPnOhPpkIjBdwdNRjI3iayuNW0
	Ku4e941xohI8IdchY9oU3+dABYK1gmmjISegRnmXW+cjZopAT5nlGzrBtEgMXa3y
	qCIx5172E05QgX+I87hfNYsFpD260mMQHZrZOJhi9LrA3VMcHTU3EerU5NK3G0iJ
	4UA1Q7m4UdN+qOzIBTgOpGiEV+Tkcj6jVig==
X-ME-Sender: <xms:1xT_acQi0EO7qMXtDm8A4xH3bnC6oCtAL9JeMPzrFxCVmjuR-8BfRA>
    <xme:1xT_aWNmGsd7QfhleS57DWKqiyZWzDjMW8wMj61CqFebOs00fkcCo1J_GMYeQxRep
    mzAKkJ7NWCjvQhaeV2Rr38xPLdnBsTdqskHhcNt4OXctLA0IyfBgD8>
X-ME-Received: <xmr:1xT_aRHVXMYQDA8sKpZv8qc0jHN-p59Ib5Xi6t33yZoI8iHSHcCjEf_3clsKnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudeftdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkihhrihhllhesshhhuhhtvghmohhvrdhnrghmvgeqnecugg
    ftrfgrthhtvghrnhepfeetheejudeujeeikeetudelvdevkeefuddtkedvtdehtdetieeu
    ieetjeeugedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepkhhirhhilhhlsehshhhuthgvmhhovhdrnhgrmhgvpdhnsggprhgtphhtthhopeef
    gedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrvhhiugeskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheprghruggsodhgihhtsehgohhoghhlvgdrtghomhdprhgtphht
    thhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrug
    drohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehmrghr
    khdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopegrrhgusgeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprhihrghnrdhrohgsvghrthhssegrrhhmrdgtohhm
X-ME-Proxy: <xmx:1xT_aWga9cOpYE_pyhIBjzdsgHr_rfOj1BkR1y3iWOZMCR7O-JxLzQ>
    <xmx:1xT_aVwT2YD9zGiOAPeWGTEZQ_AWNb9NzZ_CYTvN5hhr7Mxo-WSoZQ>
    <xmx:1xT_aSrdIdu-kum0CJwm9VQK2P8SdtM--gColK0Mkz7qx_7Oip9pCw>
    <xmx:1xT_abXbuN040Cx3-DrAvxcS65Gg5Dm0uUpPzmm_pOfKKNSxKF2kYw>
    <xmx:2BT_aavA9QRV2e0u10CUCCw742gCNFuNq8s1eS7dSWg3LPMBFYhS18xw>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 May 2026 07:04:54 -0400 (EDT)
Date: Sat, 9 May 2026 12:04:47 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 02/15] mm: Make empty_zero_page __ro_after_init
Message-ID: <af8UEuy-gfLj6DSV@thinkstation>
References: <20260427153416.2103979-17-ardb+git@google.com>
 <20260427153416.2103979-19-ardb+git@google.com>
 <3d1a6b5c-f3bf-462f-879a-cdb5b60868ac@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d1a6b5c-f3bf-462f-879a-cdb5b60868ac@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_040501_917204_7051816E 
X-CRM114-Status: GOOD (  25.43  )
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

On Tue, Apr 28, 2026 at 09:51:09PM +0200, David Hildenbrand (Arm) wrote:
> On 4/27/26 17:34, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> > 
> > The empty zero page is used to back any kernel or user space mapping
> > that is supposed to remain cleared, and so the page itself is never
> > supposed to be modified.
> > 
> > So make it __ro_after_init rather than __page_aligned_bss: on most
> > architectures, this ensures that both the kernel's mapping of it and any
> > aliases that are accessible via the kernel direct (linear) map are
> > mapped read-only, and cannot be used (inadvertently or maliciously) to
> > corrupt the contents of the zero page.
> > 
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  mm/mm_init.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > index f9f8e1af921c..6ca01ed2a5a4 100644
> > --- a/mm/mm_init.c
> > +++ b/mm/mm_init.c
> > @@ -57,7 +57,7 @@ unsigned long zero_page_pfn __ro_after_init;
> >  EXPORT_SYMBOL(zero_page_pfn);
> >  
> >  #ifndef __HAVE_COLOR_ZERO_PAGE
> > -uint8_t empty_zero_page[PAGE_SIZE] __page_aligned_bss;
> > +uint8_t empty_zero_page[PAGE_SIZE] __ro_after_init __aligned(PAGE_SIZE);
> >  EXPORT_SYMBOL(empty_zero_page);
> >  
> >  struct page *__zero_page __ro_after_init;
> 
> I am no expert on BSS etc, but from what I understand, we'll still get zeroed
> page-aligned memory. I don't know if there is any other impact on not having it
> in bss.page_aligned. I assume no

IIUC, unlike BSS, it will be part of the kernel image. So kernel image
size will grow by PAGE_SIZE. But compressor will eat it as it is all
zeros, so it should be okay.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

