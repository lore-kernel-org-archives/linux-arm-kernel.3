Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F984C19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 10:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyAHIQeVxV7KJDnqLXHbeSFECRBR40Nsmn5QJdOcsts=; b=lCkQpwjx2LB7qy0ZiuY1Haq28g
	D3Ij4zOqod8pNvfpTzBSFT14KQ3APOZA1qiRo/s6yWrKX1hFm1qiRFmRWvAYhMyHRMnSfW5sAAYo+
	o7Yatcg+QbxF2mI6T8LGm/P52lDT4OVrNTzh51GU2x313+sDpMLvI33XYjuWDL2tuNtMF3+aeRMYb
	WE3JZ1Rllnn0lJmZeYuXKQa0z8V24DYooVhB6cDDd3SlWNUGW+T6C47ElKgSR+HEJdd0ScXh9Mn4Q
	YgQgCFKUeudx+/RzAwR1ifXqyFQMbsxVcaRbOoIM3IAnUFrFlNNR0Uiuhen4RPHs0x+mdfCBrBgqr
	M99lNIfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnELz-00000003EC5-0H3a;
	Wed, 26 Feb 2025 10:09:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEKF-00000003Dy0-1Acu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 10:07:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5ACD75C660A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 10:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D01C4CED6
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 10:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740564452;
	bh=AyAHIQeVxV7KJDnqLXHbeSFECRBR40Nsmn5QJdOcsts=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LgVsLb6ae+6LZxYgCVoI/D5XVgpm6Cz/p1SVdgYH18ndzrPdcLpBd+x3IDZU8Go8i
	 gGsnx3pAaSA8BxbaCutK6L5h9gBJkAwR7r38p/ljcw1QNlBMAVOhCjwkXg3KFr9lHi
	 Ul2GZK+GzGGoiuQYETJDEcBLGN3Z+m8s5dDA2AbmI1lDST3qmHUQHAEnNS28xYlYGX
	 Fmrv/oTt00u+8w/a8YOqJsUDnfXvXhxcchOxz+kZj1dvVJyq1AofUSoouMf7NhXs2x
	 X1q8NGBNLy+b1ojpKIQ4N9tH79OIMMsbRCsRT6go97QHSd9PL1iT3Ii8UqEsEkG/Yi
	 TNLsxJK37cyRQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30761be8fa7so61728671fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 02:07:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXvrLjXDzuhvbGFSoKw9yLBFG61jaVQjq/cE9XJp65PBlPh7YDGTrHHKvTyzMzqGpwZsE/iKubT72SEyjIf8c5n@lists.infradead.org
X-Gm-Message-State: AOJu0Yy74KME8ZlkkU89Zm9eXIpwKiZ8o7zduMd9mY8RzyFzRc+mOVYh
	SrgYEEB+NRnHCIQPpQD33BUWfsyWpnAQ0xHfpijvTkw6/0PJ5HizLuhti+EXLoTqNyCuxi0I0Cq
	FGgQG83hiwbrO22Uz+dRlydXqHX0=
X-Google-Smtp-Source: AGHT+IH77s07/831v/UsWRW9X8Qt2tEO6lngODAKoum/ihUKwQXpXxPbkOfYTJKPMisMdLAWL73xuBPJxdwhVpBZ4kk=
X-Received: by 2002:a05:6512:234e:b0:543:e406:6363 with SMTP id
 2adb3069b0e04-5493c570ed1mr2417228e87.3.1740564451208; Wed, 26 Feb 2025
 02:07:31 -0800 (PST)
MIME-Version: 1.0
References: <20250225114638.2038006-1-ryan.roberts@arm.com>
 <CAMj1kXHNO+iB4vNFz-4tR_9CPzv96hn+RW=eqyZXMGy_AySDpw@mail.gmail.com>
 <20250226001047.GA24197@willie-the-truck> <CAMj1kXH=tPuM+irCsKgycUTbts8h9vD4m3tEtw51YFzWafdSUA@mail.gmail.com>
 <b0578d21-95cd-4d8a-add1-87299f36b491@arm.com> <CAMj1kXHJGC9aYCwwb2XTWfhAjH6GDKQptNdLwO+hfv6hazivHQ@mail.gmail.com>
 <b6b999c9-79cd-4945-9d7a-c5ee8158b7dc@arm.com> <CAMj1kXHesY77QhnW_U19UURGUqiBuQrNcL-kWQs7niaMa4nAng@mail.gmail.com>
 <2c465bdf-8028-4b05-8e18-3154735ce906@arm.com>
In-Reply-To: <2c465bdf-8028-4b05-8e18-3154735ce906@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 26 Feb 2025 11:07:19 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGQSFh9A_uK6-i1-sd59i+yKg3vZxD+cYQ_vyz-HZJZKg@mail.gmail.com>
X-Gm-Features: AQ5f1JqAlass0uE8mVVRnhELpOjzjIKuYqX8xCtGGpSz6emoBSwU3fQmwrmDzrg
Message-ID: <CAMj1kXGQSFh9A_uK6-i1-sd59i+yKg3vZxD+cYQ_vyz-HZJZKg@mail.gmail.com>
Subject: Re: [PATCH v1] arm64/mm: Fix Boot panic on Ampere Altra
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Luiz Capitulino <luizcap@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_020735_424992_710DB5DD 
X-CRM114-Status: GOOD (  43.12  )
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

On Wed, 26 Feb 2025 at 10:45, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 26/02/2025 09:04, Ard Biesheuvel wrote:
> > On Wed, 26 Feb 2025 at 09:55, Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>
> >> On 26/02/2025 08:33, Ard Biesheuvel wrote:
> >>> On Wed, 26 Feb 2025 at 09:07, Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>>>
> >>>> On 26/02/2025 06:59, Ard Biesheuvel wrote:
> >>>>> On Wed, 26 Feb 2025 at 01:10, Will Deacon <will@kernel.org> wrote:
> >>>>>>
> >>>>>> On Tue, Feb 25, 2025 at 07:05:35PM +0100, Ard Biesheuvel wrote:
> >>>>>>> Apologies for the breakage, and thanks for the fix.
> >>>>>>>
> >>>>>>> I have to admit that I was a bit overzealous here: there is no point
> >>>>>>> yet in using the sanitised value, given that we don't actually
> >>>>>>> override the PA range in the first place.
> >>>>
> >>>> But unless I've misunderstood something, parange is overridden; Commit
> >>>> 62cffa496aac (the same one we are fixing) adds an override to force parange to
> >>>> 48 bits when arm64.nolva is specified for LPA2 systems (see mmfr2_varange_filter()).
> >>>>
> >>>> I thought it would be preferable to honour that override, hence my use of
> >>>> arm64_apply_feature_override() in the fix. Are you saying we don't need to worry
> >>>> about that case?
> >>>>
> >>>
> >>> I wouldn't think so (but I'm glad you brought it up because this
> >>> didn't occur to me at all tbh)
> >>>
> >>> With arm64.nolva, both the VA and PA ranges will be reduced, and so
> >>> the range of the linear map will be 47 bits. So if the PA range is
> >>> being reduced from 52 to 48, it will still exceed the size of the
> >>> linear map, and so it should make no difference in this particular
> >>> case.
> >>
> >> OK, so I think you're saying it'll happen to work correctly even if we ignore
> >> that override? That sounds a bit fragile to me. Surely we should be consistent
> >> and either always honour the override or remove the override in the first place?
> >>
> >
> > I'm trying to walk a fine line here between consistent use of the
> > override, and fixing something that I broke in a nasty way all the way
> > back to 6.12.
> >
> > So yes, I agree that it would be better to use the override
> > consistently, and this is what we should do going forward. But the
> > purpose of the original patch was mainly to ensure that we
> > consistently program the MMU either in LPA2 or in non-LPA2 mode, and
> > not in a mix of the two. The linear mapping randomization change was
> > kind of secondary.
> >
> > So perhaps this should be two patches:
> > - backing out the use of the sanitised register, as proposed by Will,
> > with cc:stable
> > - a follow up based on your proposal, which can be backported later if
> > needed, but without tagging it for stable.
>
> I suspect I'm misunderstanding something crucial about the way the linear map
> randomization works (TBH the details of the signed comparisons went a little
> over my head).
>
> But my rough understanding is that there are 2 values you want to compare; the
> size of the linear map and the PA range. If the PA range is significantly bigger
> than the linear map size then we conclude we have enough room to randomize.

It is the other way around: the linear map should be able to cover all
system RAM that may appear anywhere in the PA space, and so if the PA
space is very large (and memory hotplug is enabled), no randomization
is possible, as it may end up mapping RAM that appears later past the
top of the VA space. Note that the same is fundamentally true for
running a 39-bit VA kernel on hardware that has a PA range that
exceeds that.

As for the signed arithmetic: the randomization works by substracting
from memstart_addr (aka PHYS_OFFSET). Normally, if system RAM starts
at 1G, memstart_addr will be 1G, and the linear map will associate
PAGE_OFFSET with PA 1G.

To randomize the linear mapping, the system RAM has to be moved up in
the linear map (as this is the only direction it can be moved), and so
PAGE_OFFSET needs to map to a lower value, and so memstart_addr may
wrap around and become negative.

> (I
> think this assumes that VA size is always GTE PA size). But if linear map size
> is based on an overridden VA and overridden PA size (which I assume it must be,
> given the pgtables will be limitted to the overridden VA size) and PA size is
> not overridden, isn't it possible to wrongly conclude that there is enough room
> to randomize when there really is not?
>

No, if the linear map is only 47 bits, and the PA space is either 52
or 48 bits, no randomization is possible. We might even run out of
space without randomization, but this is an existing problem for
non-LPA2 too.

