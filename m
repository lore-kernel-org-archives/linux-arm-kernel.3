Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CF4C19F2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 09:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MD0s8HGGD8J7+lciKNl/Dj0IVQMHtZI/veSSn91yDAo=; b=Rk31trL+uL3+/WKEZI0M51I/Mo
	guCdGHXClvAISW7xkJh2EXbpKgZQKPdKWdy5N25nfrjewEAuHHRb/u40QNCR6/qYrkDSyQ+DpgqzI
	hR0So7SSQ/YuDzjCBl7Mo9m1zs9ZSXl/T9wy9JFTU8izDalLgJUzKgxlW3t3kB79YZ9GQlEIgw+aH
	yHP3DXhE/y5GGZmDyjCcdw8oXNrmS9K02MEwHrUwHEtnVT5cWl/tzOI+0aO3k5S9URnIY67o5wAmD
	kZ9NpC1EU6h/vzMOklvzPPCrBKr2Qq4TtFerge3K6BZNgqGtzdqhgrstv4dz17DWaziyn3PINqtkO
	jWUr9IPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDd8-000000033vi-2GXV;
	Wed, 26 Feb 2025 09:23:02 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDLD-000000030UR-2TyQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 09:04:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 662326127F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 09:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBBCC4CEE9
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 09:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740560670;
	bh=MD0s8HGGD8J7+lciKNl/Dj0IVQMHtZI/veSSn91yDAo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qpY84Sbr9g2qMB5LpdWBYhYb86hEqiaZfFe8Pul97DbGo4arUpU0VqK6XJuR0yacG
	 xg/0dhrviLlfnNoowf2MLLdyN/LYA7dAoNKQDJiC0PbdjyE7QaKM+pBuLLfaKPSmyw
	 BTYXASKJViFxl8fW0Rmcv1soBmpW3LVkgTMBJKwBQihLvpnOT24ZxOykrxtrun6Xqi
	 dRPG9ETqyuuuS1mckMGI3vIhkMHFUoB+1pafBzFAvXEE0/GEvNS4UlW/FeTfrPC9YD
	 uXPnOIhxvnMMz5QVTwesDxdzzDn78ZUbkxDFiRodt8ObVncAJQ5CMzf4NIXMG0lucc
	 oMVZcy8NNB+Ow==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30795988ebeso69125181fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 01:04:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwJ4OCjFMc4YtJZyrtBmvbAUdFv0gk0CkllJJNW1qaapDnKNpOfl7+V83HN4n5O1wf0ASCOGrVry5h/Spq4Fol@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0A/qwN6KT8T7f2BKsV6zImQsKWfkZzouzJuwfUQXet6pBcJro
	B1R5W0CwVISSG5gI+RoRe61AS7mAeNXRe68vCKHVnaP3k76pdERd/n2VVNnrCGjUqb9DrcJS0/a
	YF0sbqfWDipL1rQFqmkGtgzAyedA=
X-Google-Smtp-Source: AGHT+IFHUd8UZ5R1CLstTqMjiedgx3Q3D8X50coztIK4yq6AvKMcncp/jJN6WT7urLudiLMShTcy6Zi/2hNgC+d8sm4=
X-Received: by 2002:a19:5f0e:0:b0:545:2e90:8dd7 with SMTP id
 2adb3069b0e04-548510ed6eamr3922564e87.45.1740560669010; Wed, 26 Feb 2025
 01:04:29 -0800 (PST)
MIME-Version: 1.0
References: <20250225114638.2038006-1-ryan.roberts@arm.com>
 <CAMj1kXHNO+iB4vNFz-4tR_9CPzv96hn+RW=eqyZXMGy_AySDpw@mail.gmail.com>
 <20250226001047.GA24197@willie-the-truck> <CAMj1kXH=tPuM+irCsKgycUTbts8h9vD4m3tEtw51YFzWafdSUA@mail.gmail.com>
 <b0578d21-95cd-4d8a-add1-87299f36b491@arm.com> <CAMj1kXHJGC9aYCwwb2XTWfhAjH6GDKQptNdLwO+hfv6hazivHQ@mail.gmail.com>
 <b6b999c9-79cd-4945-9d7a-c5ee8158b7dc@arm.com>
In-Reply-To: <b6b999c9-79cd-4945-9d7a-c5ee8158b7dc@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 26 Feb 2025 10:04:17 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHesY77QhnW_U19UURGUqiBuQrNcL-kWQs7niaMa4nAng@mail.gmail.com>
X-Gm-Features: AQ5f1JrFPO-oVdrkA8BHx4fjAtsnwSoQhhBMdSRuNrnZUrJasIlp_A81Niyew-Q
Message-ID: <CAMj1kXHesY77QhnW_U19UURGUqiBuQrNcL-kWQs7niaMa4nAng@mail.gmail.com>
Subject: Re: [PATCH v1] arm64/mm: Fix Boot panic on Ampere Altra
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Luiz Capitulino <luizcap@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 26 Feb 2025 at 09:55, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 26/02/2025 08:33, Ard Biesheuvel wrote:
> > On Wed, 26 Feb 2025 at 09:07, Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>
> >> On 26/02/2025 06:59, Ard Biesheuvel wrote:
> >>> On Wed, 26 Feb 2025 at 01:10, Will Deacon <will@kernel.org> wrote:
> >>>>
> >>>> On Tue, Feb 25, 2025 at 07:05:35PM +0100, Ard Biesheuvel wrote:
> >>>>> Apologies for the breakage, and thanks for the fix.
> >>>>>
> >>>>> I have to admit that I was a bit overzealous here: there is no point
> >>>>> yet in using the sanitised value, given that we don't actually
> >>>>> override the PA range in the first place.
> >>
> >> But unless I've misunderstood something, parange is overridden; Commit
> >> 62cffa496aac (the same one we are fixing) adds an override to force parange to
> >> 48 bits when arm64.nolva is specified for LPA2 systems (see mmfr2_varange_filter()).
> >>
> >> I thought it would be preferable to honour that override, hence my use of
> >> arm64_apply_feature_override() in the fix. Are you saying we don't need to worry
> >> about that case?
> >>
> >
> > I wouldn't think so (but I'm glad you brought it up because this
> > didn't occur to me at all tbh)
> >
> > With arm64.nolva, both the VA and PA ranges will be reduced, and so
> > the range of the linear map will be 47 bits. So if the PA range is
> > being reduced from 52 to 48, it will still exceed the size of the
> > linear map, and so it should make no difference in this particular
> > case.
>
> OK, so I think you're saying it'll happen to work correctly even if we ignore
> that override? That sounds a bit fragile to me. Surely we should be consistent
> and either always honour the override or remove the override in the first place?
>

I'm trying to walk a fine line here between consistent use of the
override, and fixing something that I broke in a nasty way all the way
back to 6.12.

So yes, I agree that it would be better to use the override
consistently, and this is what we should do going forward. But the
purpose of the original patch was mainly to ensure that we
consistently program the MMU either in LPA2 or in non-LPA2 mode, and
not in a mix of the two. The linear mapping randomization change was
kind of secondary.

So perhaps this should be two patches:
- backing out the use of the sanitised register, as proposed by Will,
with cc:stable
- a follow up based on your proposal, which can be backported later if
needed, but without tagging it for stable.

