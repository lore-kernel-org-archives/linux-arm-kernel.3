Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C56CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ht2QQ6l2QMI3jjLbrMSGg7m47Ftunylr0Q1SqunvI3Q=; b=twU/5iEyQ9gelbtHgguWiGgils
	WFYpZ0hs9FGPImJ2QICD6z4cV5tkGmcMcmM1UTPinDLrFE7J4VBc/QBdtLTfurvIALSFbz8Tbe1Pn
	2lbhjtHTEFzJnBe0EVdhHqGqMTmilIpsqaxNIH07Ts6jsvQvLXCnf7CSXKEQl96SYdN9HqOHZmxbX
	9swrs2Zxv9mfTdP5yKZNsHf6u/bCFSYWf0xbaYjIfzlcX3QP6BKQgCJx0jMT3KbflmOMfs/vRWVuZ
	vhiuRNY00/I1VGaf5djMp67SZFSjmzHokeROWGFuoPbw2SDzTExxDiKXETwrMqNVyymnaQUS9CSwA
	/mP8TJUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6pr-00000002Bey-4054;
	Wed, 13 May 2026 10:29:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6pp-00000002BeV-2fca
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 10:29:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E1B6340A1C;
	Wed, 13 May 2026 10:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F393C2BCB7;
	Wed, 13 May 2026 10:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778668140;
	bh=SMSduI5AnAM9kqchaE8jYdlaOT2npCWPyM5+zGPU3o0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqTXi24HsgBOAFuKC6Vi/Jw3ToZ3ix8HWddmTwJTDN0Un1xAN5BkYQzXEShkWawTo
	 GbwdlpXAgWvDqvcNS4fj4SamaL21POucJDoSE7gUJ+y6jgqAQeAzM1iOpDyFP3dDYj
	 RbhQq9r3uXj5eja2m/YDTvPvES31K7BtxsHNPpQukkzx1jXDmNwQs88p5AhLbZkYxo
	 WYY1U+LSv7W2Mu8THlmQACiifeBWhl6VW8dk+ILwXNmNO/9dTqLE3RnuJo2ptdVwoS
	 hfHoLk3RKGkwl/5TkgZ09NqeNYyFzaQwl3SN0CdD5rL7XU7NeUhJHKrDEBwv+tCA7/
	 ezv48qxYD1c9Q==
Date: Wed, 13 May 2026 13:28:51 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Jann Horn <jannh@google.com>, Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Liz Prucka <lizprucka@google.com>,
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 02/15] mm: Make empty_zero_page __ro_after_init
Message-ID: <agRSY-VLLdSqeMT5@kernel.org>
References: <20260427153416.2103979-17-ardb+git@google.com>
 <20260427153416.2103979-19-ardb+git@google.com>
 <CAG48ez1DJ88a0pBCE-Q0VXyDuJgng8zdunb38g4b4JPU88exww@mail.gmail.com>
 <31252c1d-a98d-4635-ab61-ce5b649e256f@app.fastmail.com>
 <CAG48ez2xJwJDgxSH0u2G==9dOQJQxQ7WsQfU14O1H5hEWic1eA@mail.gmail.com>
 <fb5749bb-bc87-4f0b-9ec9-8a1eb7ded3b5@app.fastmail.com>
 <agQ7RMAw51RlNUOj@kernel.org>
 <49d30ffe-b7e1-4b05-89e0-c3fe01348bb6@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49d30ffe-b7e1-4b05-89e0-c3fe01348bb6@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_032901_730423_4B8D7521 
X-CRM114-Status: GOOD (  30.45  )
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

On Wed, May 13, 2026 at 10:53:08AM +0200, Ard Biesheuvel wrote:
> 
> On Wed, 13 May 2026, at 10:50, Mike Rapoport wrote:
> > On Tue, May 12, 2026 at 02:56:16PM +0200, Ard Biesheuvel wrote:
> >> On Mon, 11 May 2026, at 16:40, Jann Horn wrote:
> >> > On Mon, May 11, 2026 at 10:59 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> >> >> I think we should simply do something along the lines of the below,
> >> >> considering that the size of a data object tends to correlate with
> >> >> its minimum alignment.
> >> >>
> >> >> I do find it rather puzzling that the compiler emits empty_zero_page
> >> >> *after* zero_page_pfn - ideally, we'd combine the below with
> >> >> -fdata-sections so that the linker sees all individual objects, but
> >> >> I suspect that would create some problems elsewhere.
> >> >>
> >> >>
> >> >> --- a/include/asm-generic/vmlinux.lds.h
> >> >> +++ b/include/asm-generic/vmlinux.lds.h
> >> >> @@ -452,7 +452,7 @@
> >> >>  #define RO_AFTER_INIT_DATA                                   \
> >> >>         . = ALIGN(8);                                         \
> >> >>         __start_ro_after_init = .;                            \
> >> >> -       *(.data..ro_after_init)                               \
> >> >> +       *(SORT_BY_ALIGNMENT(.data..ro_after_init))            \
> >> >
> >> > Oh, neat, I didn't realize that's possible. That seems like a nicer
> >> > approach...
> >> 
> >> Neat but rather ineffective, unfortunately. (I don't see a size
> >> difference with the arm64 defconfig kernel)
> >> 
> >> Given that empty_zero_page only ever gets its address taken, we
> >> might just move it into the linker script if that requires tweaking
> >> anyway. We can just place it at the start of .rodata, which is
> >> already page aligned on most architectures (and will become page
> >> aligned unless EMPTY_ZERO_PAGE is #define'd by the arch linker
> >> script to something else)
> >> 
> >> 
> >> --- a/include/asm-generic/vmlinux.lds.h
> >> +++ b/include/asm-generic/vmlinux.lds.h
> >> @@ -472,6 +472,17 @@
> >>  #endif
> >>  #endif
> >>  
> >> +#ifndef EMPTY_ZERO_PAGE
> >> +#ifndef __HAVE_COLOR_ZERO_PAGE
> >
> > I don't think we want let architectures that don't use colored zero pages
> > redefine it.
> > If it will be really required we can add the ability to redefine
> > EMPTY_ZERO_PAGE later.
> >
> 
> I was actually intending to add use this for arm64 in the next patch. It
> already has a reserved_pg_dir in .rodata which is page-sized (i.e., up
> to 64k in size) and guaranteed to remain all zeroes, so empty_zero_page
> could actually be an alias for that. This is what I had in a previous
> revision, before you turned the empty_zero_page definition into common
> code:

Works for me if from arm64 perspective that's ok :)
 
> https://lore.kernel.org/all/20260320145934.2349881-16-ardb+git@google.com/

-- 
Sincerely yours,
Mike.

