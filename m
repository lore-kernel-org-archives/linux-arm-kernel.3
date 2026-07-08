Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A714C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 16:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDnpig3MZnB+M3jCpE7pEOtfxRospLvUmeedSs6shPQ=; b=sXoMbChstelOxobWsKjwdpVpdP
	BtJ9YQo6isOw7gNUm8tfYLHzmMvtcL8pyq+9tPfNuCLv5GSegAVaz8SfDGu7KfmfD1YRXFMkg5xJw
	VYB7jw/mFob3BjyudRSwbrG3VpYlZVKrKjC+CgZC19dj0M2JmMoYygU3Zzdx+hdJd6fHH4XjrSIAi
	E73DkLl0qKnZoX+tGlPlHwr6R2ClWjx0lSG5b6NLfX4gaJq1o95Xx5W0OkOlLqKJxHuztob9ApgZl
	+j+gQYKqYf29XhLeiDeteYMWMqgGD76K7raz0ti+T+UuLWEbrU8UkgqLpArBD7hb1IHtXHW6RXHXt
	ltErnp8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVTc-000000001as-2vsM;
	Wed, 08 Jul 2026 16:50:24 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVTZ-000000001aS-3bru
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 16:50:24 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c15b509c323so2832366b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 09:50:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783529418; cv=none;
        d=google.com; s=arc-20260327;
        b=A5qdA9vl+ZmfOwC2F78ZaiMYZ+dVzTgpTV0X6DWSJp7OGhZRz1EC1bXw2Rh0PvvWip
         GH6rz44d+xo/CUxgc2rv4gTIANcGNTzOIeJy90DLb4URyuoKYPAAQKzJsZEIepZpNQBv
         7fpGYwfc9MnrEP5ECUmJAE3s65cjCrD45kkvciNMyO78QWUawuvM/QP3lYs0FZvPsVKu
         1htKyqS5Zsujwcni/Azy/gNT1d+fNQcVJUwiJcdgPFODazpsO/kXwXBMr6FjXQUN+Sw4
         EE4En7pI/hluT3qOcB+uTn4C6ir4yB/r0d+RX+01qxAMkfMcrQUUA8aNWukfRwftA3zQ
         81mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DDnpig3MZnB+M3jCpE7pEOtfxRospLvUmeedSs6shPQ=;
        fh=IdnWiyvlUmDI85Yhsdwq/BaOtMCV7FbY5KzlX68CQBc=;
        b=DNb8l3mQ6qUW0F5XAGmBWj8HYn1MvnJCpscIasncQgls9prAyG3cFeX1oOOyroRL18
         Aci6djYwFoWcq9WW0qCMZAefNu8g9DVUmMMuc1ZuNVL47tsR9wgigGLeOmn78t9Zi7Fu
         s2A8icV0m2xw7vcDR7GqNZIpE2lynq0OHYPwnJTXkzsRVknC8i1O9IIf/4zVmNGEoVnA
         N2ufQBctyU7Vkb1y/GN4FkoMyEkVnb3tGll5XieKiduIwvKwl24igL1zjt3cOTleIo++
         3TswKoYNWFzLI1iGPLXbiZQqrGnJ4KzYyM2H+beJujUIUpHRSw6Z/MUZrnhRRgP5IvIf
         5SEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783529418; x=1784134218; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DDnpig3MZnB+M3jCpE7pEOtfxRospLvUmeedSs6shPQ=;
        b=wkDJq0PeiysAw5juFx1Op6zlhgp5COhx71VVe8jtYTPHvSqCJgt9eEg6W7vl8nOGaP
         CoFdHzKsKjWWxB4OKRf97np5v+Vf7fc6+oSbNb6OoKeAvNwTgHFg1a6c895x/SQgjk+b
         lHpNLODMmHSdTOO0QSss+jh0iDGE/8w24rHz4+0Ln7xziuLBwiq2TwkUKNzCLKChI/0g
         N6i0vCVHjT5AhjTArTxCdSW1SzT6X2ic7ML9QG+bRMikFWAJaLE7YTGbPegPPYl29eY5
         KzuYKUsGoVfpO8z+jkjJKYjBzHmbiLmpgoCPIz2hQnwiYcSL7Py/PWR4Euw3HIjMdMpW
         Xtjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529418; x=1784134218;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DDnpig3MZnB+M3jCpE7pEOtfxRospLvUmeedSs6shPQ=;
        b=kDZCo8TOE5PDtwOiEFobXKYpHpuN+5TayMTWQcDZvDF33Ra3/Dq3fSup01dMZQYD9D
         Ye/hoT2ibKJJMk1FDfvhi3H8CgMz2kBmPyVHaVzOWOBXdMYSg1rn5k8R5Lxl3tN8w2WI
         T6KyxKPwIOXbj+KyrMwpmSiMzrjrJT5rA3IALUilULSclkdsXu/ewG75G0B86MefaofZ
         CiO341I33H96eA9s5GjhlPZSGpldjmRaxW1lrkc9rJ8F8TYZpe4sCd6v2nHe4p4TrfnE
         n/92CekOGMCMOWn4OLItywXqXq0bjRQmL0/jnhwHcdphUsIMEBLerLCLm9JKiyidfIPV
         Oa2w==
X-Forwarded-Encrypted: i=1; AHgh+RqZX81tgV1jtmFFLZyiBkLUn53vgeGH7ZKC8AGkeeFpePsOREGnqWhsNr5YM8xJ3DkqbL7Ssbh8AJ98fmiB530c@lists.infradead.org
X-Gm-Message-State: AOJu0YzL7Zi6LUWnuFXLJxuFVBvIHhjPMv58ccMMwucGJixVcSRRh6/T
	9lqlIMbElvv5gGpsSiLlguubUyvrt9JVhL8/uT5xz0PB/FVQRNuCv9o65bDhTel9ccuFgaG0m7O
	cU49kDhi4ZohDLWWGI0nMrzUIyDF92COJR8mFUhJb
X-Gm-Gg: AfdE7cmeCvuC8zHD4OHIrCKlkYNt7nyTaLfGGUV6uEFr9PN8Pc2sHiNzvgnRPzT8Htw
	pUSlTwGvHfC4Qn2xLCwuckYFFyF5XFxx8Pf1mJ+c69QXYM/WYeeAHc/GpQJAxgKkPTBv5Mn+393
	zGEOcxJT74TbIu43tF4hsJ64QChU3co0V/FT/Ur2rK3E4iDctK5YDZCCeFJhh9RxbJYrQFZz93Z
	UWt06ln7T2O+cTEQ82z8pwVC1PdjGffy/MpQUkOp2fcPJrlB9SH1VKZnQE8hhoEuLkDUqjq6jCX
	epGsQJ0WQGz8edFBWCdt8Kt47lDFqgQCYwnCUEz/tOt47tkOHR6H/eIvSRw=
X-Received: by 2002:a17:906:f58a:b0:bee:6806:d69a with SMTP id
 a640c23a62f3a-c15ce0fa3a9mr165048166b.38.1783529417441; Wed, 08 Jul 2026
 09:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com> <FC9E78F0-8FF7-44AF-A848-8401B4702488@linux.dev>
In-Reply-To: <FC9E78F0-8FF7-44AF-A848-8401B4702488@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Wed, 8 Jul 2026 09:49:40 -0700
X-Gm-Features: AVVi8Cfv5yaxCo1wy94skRAUBfR5X0m2laz06imtAANj8KZpWB7cPkC9ZIIhScg
Message-ID: <CADrL8HVkrojXbBuEX-W=UHBmyyFzqxdGBvtAoPP53SyYa10uag@mail.gmail.com>
Subject: Re: [PATCH 00/18] Another attempt at HVO support on arm64
To: Muchun Song <muchun.song@linux.dev>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oscar Salvador <osalvador@suse.de>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_095021_939714_E0FB6491 
X-CRM114-Status: GOOD (  48.60  )
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

On Wed, Jul 8, 2026 at 1:41=E2=80=AFAM Muchun Song <muchun.song@linux.dev> =
wrote:
> > On Jul 8, 2026, at 11:11, James Houghton <jthoughton@google.com> wrote:
> >
> > Hi everyone,
> >
> > This patch series uses a trick with the Access Flag on CPUs that suppor=
t
> > hardware update of the AF to update vmemmap page table entries without
> > introducing a time window where CPUs accessing the vmemmap might fault.
> >
> > By avoiding faults, the HugeTLB vmemmap optimization (HVO) can be
> > implemented correctly on arm64 in a much more straightforward way than
> > previously attempted, most recently here[1] (please see [1] for a
> > breakdown of the other approaches attempted before).
>
> Hi,
>
> Thanks for your ongoing efforts on supporting HVO on arm64. This is truly
> one of the most useful features that arm64 has been missing for a while.

Hi Muchun,

Thanks for taking a look so quickly. :)

> >
> > For large-memory systems that allocate most of their available memory t=
o
> > HugeTLB, HVO saves a huge amount of memory (1.5% of system memory).
> >
> > This series has four parts:
> >  1. Some preparatory changes (patches 1-3)
> >  1. Bare minimum HVO support (patches 4-10)
>
> It looks like there is a typo in the number here.

Oh yes, so there is. I'll fix it in the next version of the cover letter.

> >  2. Drop BBML2_NOABORT requirement for HVO (patches 11-13)
> >  3. Drop the user-configurable Kconfig for HVO (patches 14-18)
> >
> > Parts 3 and 4 are technically optional. More details below.
> >
> > The main functional caveat with this series is that bootmem HugeTLB
> > pages are not "pre-HVOed". They will be HVOed, but because at pre-HVO
> > time SMP CPUs have not been enabled, we cannot query for full system
> > support.
>
> Do you mean that the support for AF might vary across different CPUs?
> I'm not that familiar with arm64, so it seems a bit strange to me that
> such basic hardware features can differ so much from one CPU to another.

Yes, hardware updates of the Access Flag is a per-CPU feature. It is
available for a CPU to use if TCR_EL1.HA is set. TCR_EL1 is a system
register; each CPU has its own. (Linux will always enable HW AF for a
CPU when it is onlined[1] if support is advertised, so we simply need
to check if support is advertised to know that it is in fact enabled.)

These days it is not uncommon for a system to have two (or more?)
different core implementations, like with "fast" cores and "efficient"
cores.

[1] See the CONFIG_ARM64_HW_AFDBM bits in arch/arm64/mm/proc.S

> > This series is based on 7.2-rc2 (0e35b9b6ec0f).
> >
> > This series almost 100% cleanly applies to mm-new, which has some of
> > Muchun's HVO patches, with one trivial conflict. I imagine this series
> > will conflict pretty heavily with some of Muchun's other patches[2].
>
> You know, as we iterate on HVO, the codebase is becoming increasingly
> complex and difficult to maintain. Aside from the work in [2] that you
> mentioned, I actually have some local patches aimed at refactoring
> hugetlb_vmemmap.c as well to reduce this maintenance complexity. I really
> want to avoid piling more code on top of it right now, as that would
> only make things worse.
>
> Therefore, my personal suggestion is that if this approach is
> theoretically validated on arm64, it it better to wait until the HVO
> refactoring is complete, and then review your work based on the clean
> codebase. For now, what we need to focus on is evaluating the feasibility
> and soundness of the approach itself. What do you think?

I agree. The first order of business should be for the Arm folks to
tell me if they think this approach is unsound (though I've been
chatting with Will about this for quite some time :)).

I'm happy to rebase on top of your refactoring work when it is ready.

> >
> > -- The AF trick --
> >
> > The trick is that translations with the AF unset cannot be cached in th=
e
> > TLB (see Rule R_DWZCQ in the Arm ARM), so they can be atomically update=
d
> > without needing a full break-before-make sequence.
> >
> > So the PTE update sequence becomes:
> >  1. Atomically clear the AF on the existing PTE.
> >  2. Invalidate the TLB.
> >  3. cmpxchg the AF=3D0 PTE with the new PTE. If this fails, goto 1.
> >
> > If there is a CPU on the system that does not support hardware access
> > flag updates, clearing the AF is problematic, as those CPUs might fault
> > on the vmemmap usage. Therefore, HVO compatbility checks all CPUs for H=
W
> > AF updates.
>
> Sorry, I am not familiar with arm64, so I will leave it to the arm64
> maintainers (or experts) to verify the feasibility here. Once the viabili=
ty
> of the approach is confirmed, I will look into the HVO-related implementa=
tion
> details and consider how to support this feature on top of the refactored
> code in the future.

Sounds good, thanks Muchun.

I'm hoping you can look at patches 1-3 anyway. I think they're the
right thing to do, even without the arm64 changes.

> > -- Application to HVO --
> >
> > HVO relies on the following page table transitions:
> >  - When enabling HVO for a page, PMD block entries in the vmemmap are
> >    shattered into PMD table entries. The first PTE remains mapped
> >    normally (RW mapping to a real page of struct pages), but the
> >    remaining PTEs in the vmemmap are mapped read-only to a shared
> >    page of struct pages (that is, there is an OA change and a
> >    permissions change).
>
> Just to clarify, does OA mean Output Address? Please spell it out for
> readers who are less familiar with this context.

That's right, sorry about that. I'll spell it out more clearly in
future versions of the series.

Thanks, Muchun!

