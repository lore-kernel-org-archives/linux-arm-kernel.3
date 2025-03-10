Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993B9C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 15:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+hEvvIa7c0MRk0KFVnsaaNYZtYmP6VvBxqDs4xM/bU=; b=1feb/dEmETiD4vsi8TnTZmhPyM
	VBF1mYETkAK54YzpfvYP3ZW566gPiRcdoFIvqTXdnacPxZ07PO7nwpa8qTSesUqIVcTTJm27kltiu
	9qUPBs79RnsHTO05gWhE+xEHlKZwLIk0/v0nvKB5P72jJy3/7W0TqJGGZTsvIzk/66fLRjqFhae6T
	1qcFaNf2/JfpcaXeH2GJDmRQ6N5ls0qGXhft+Dmrk7Q7rYdXWhWGYomW1N6IcXDqi2gAz//+718BB
	J78EW97V3Ek9Elqkz3X3x6akZOewOGNFB4WXHbzasUJQIeddGSrG8cp2F/AeAkAERp10ejusdgdJ2
	1A2HFYzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfKC-00000003FbV-2Fy5;
	Mon, 10 Mar 2025 15:45:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treVo-0000000328h-2J3T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 14:53:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 59CCB5C64C4
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 14:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB680C4CEF5
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 14:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741618426;
	bh=T1byhSalovt7F0xxmtayn6l/TfDh3IOHsRewKjBKIg4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZKphSPUpGt95pJpeccEaOTEtz9kvATosH3Kr/iI0APAJl4R/FVJt3k84YD75CTrEj
	 Exyk6jg0wY3lblauy1wzOzohn1qi/jOxU+jDbOxAewZhiYv0adygg68E/0gSLGiaxf
	 s62Zq1tnTJitd3msn2+YHms85hnUi02DVhQ00MM5tA8VNL4nQ8mqDKfwusqbo9ZyUw
	 k1Dx82S+DjzJpn8eiTEy2VwdSzALs4hE3q5N9ltFsbxGh6ld5wkACJff3N/HwsHaam
	 5t7IOCK/xiJdoI9qdzhXVytqO20pfYqjk0Bzw9evwli6++ttrMNbYJ20ADS5GBDL3F
	 iIieqsBGdQIYg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30b83290b7bso48592451fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 07:53:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWF0GVaMfh7Z8dPq7eQDoa5GiFW1H75hPJTn7fvvb9l5XS+G3bIl+4IJPPcIq+iuK0rgXq7uSzoeAwoYxXdfOqw@lists.infradead.org
X-Gm-Message-State: AOJu0YyHG4kWorxNa8NtJLoR0l7ZVx0VtVHMTi0fOKw5JtwU+OfL6xrZ
	0lizGFNm9qy67gp4GLFlKa5AdeCkjZSyMZeVSwrwfLlWpm3+oA/0Lkf29dtrWL9n+8+ILEF2sne
	nrD0G7sYvx8+cSWAMW+imqtje9Uk=
X-Google-Smtp-Source: AGHT+IF1apSFV9m/ZWzifv+rgyg/saybyP5bff0NLLFQfEO9U3hAtgBsLVs2WNCdeMj08oliaCsK1IuFOe4HwIdg+1Y=
X-Received: by 2002:a2e:9859:0:b0:30b:c5e7:6e61 with SMTP id
 38308e7fff4ca-30bf4535f34mr39347611fa.20.1741618424923; Mon, 10 Mar 2025
 07:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250310062812.216031-1-anshuman.khandual@arm.com>
 <Z87FFqV03Pd0-NXl@J2N7QTR9R3.cambridge.arm.com> <b1fb982a-4936-4c18-aaad-3e8e8f61bccc@arm.com>
 <Z876UI5-xGRHl4td@J2N7QTR9R3.cambridge.arm.com>
In-Reply-To: <Z876UI5-xGRHl4td@J2N7QTR9R3.cambridge.arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 10 Mar 2025 15:53:33 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEZ86C8bouLt+xNkNr+L9AvCSQ2SZeJpLMtyvGo-8h6gw@mail.gmail.com>
X-Gm-Features: AQ5f1Jr2rr6S3G8y4c5Ng2bpMQK5K8uitjzKua2mpJvGbKtVr89KWYpuQht0eG4
Message-ID: <CAMj1kXEZ86C8bouLt+xNkNr+L9AvCSQ2SZeJpLMtyvGo-8h6gw@mail.gmail.com>
Subject: Re: [PATCH V2] arm64/mm: Create level specific section mappings in map_range()
To: Mark Rutland <mark.rutland@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_075348_682555_8B25DCBA 
X-CRM114-Status: GOOD (  35.04  )
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

On Mon, 10 Mar 2025 at 15:42, Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Mon, Mar 10, 2025 at 01:48:53PM +0000, Ryan Roberts wrote:
> > On 10/03/2025 10:55, Mark Rutland wrote:
> > > On Mon, Mar 10, 2025 at 11:58:12AM +0530, Anshuman Khandual wrote:
> > >> Currently PMD section mapping mask i.e PMD_TYPE_SECT is used while creating
> > >> section mapping at all page table levels except the last level. This works
> > >> fine as the section mapping masks are exactly the same (0x1UL) for all page
> > >> table levels.
> > >>
> > >> This will change in the future with D128 page tables that have unique skip
> > >> level values (SKL) required for creating section mapping at different page
> > >> table levels. Hence use page table level specific section mapping macros
> > >> instead of the common PMD_TYPE_SECT. While here also ensure that a section
> > >> mapping is only created on page table levels which could support that on a
> > >> given page size configuration otherwise fall back to create table entries.
> > >>
> > >> Cc: Catalin Marinas <catalin.marinas@arm.com>
> > >> Cc: Will Deacon <will@kernel.org>
> > >> Cc: Ryan Roberts <ryan.roberts@arm.com>
> > >> Cc: Ard Biesheuvel <ardb@kernel.org>
> > >> Cc: linux-kernel@vger.kernel.org
> > >> Cc: linux-arm-kernel@lists.infradead.org
> > >> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > >> ---
> > >> This patch applies on v6.14-rc6
> > >>
> > >> Changes in V2:
> > >>
> > >> - Dropped PGD_TYPE_SECT macro and its instance from map_range()
> > >> - Create table entries on levels where section mapping is not possible
> > >
> > > On the last version, there was talk of an extant bug:
> > >
> > >   https://lore.kernel.org/all/5f1b36e2-6455-44d9-97b0-253aefd5024f@arm.com/
> > >
> > > ... did that turn out to not be the case?
> >
> > In the absence of Ard (or anyone else) telling me it's not a bug, then I'll
> > continue to assert that it is a bug, and should have a Fixes tag, and Cc stable.
>
> Ok -- can we please have a description of the bug, and a fix
> specifically for that, before we try to reshape this for D128?
>
> IIUC the problem is that for a sufficiently large (and aligned) extent
> of physical memory, we might try to create a block mapping larger than
> the HW supports?
>

Yes. However, this code is only called to map the kernel, the DTB and
the ID map code and data pages, and so it seems unlikely that we'll
hit this bug in practice.

Nonetheless, it is a shortcoming that we should address to avoid
future surprises.

> With that in mind, my earlier comment about LPA2 and blocks at level-0
> is particularly relevant...
>

Indeed - at the higher levels, there is quite some variation between
page sizes, LPA2 vs !LPA2 etc in which level is the highest at which
block mappings are supported.

But given the context where this code is used, I'd prefer to simply
map everything down to level 2 or higher (for 64-bit descriptors)
rather than add elaborate rules for all these combinations that are
never exercised in practice. The net result should be identical.

...
>
> Though TBH, maybe it makes more sense to split this up into separate
> levels (as with the code in arch/arm64/mm/mmu.c) and handle each level
> explicitly with a separate function. That way each level's check can be
> handled within that level's function, and we can use the right types,
> etc. It feels like that might be better for D128 in future?
>

I have a slight inclination towards having a separate routine for
D128, but I can easily be persuaded otherwise.

