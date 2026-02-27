Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54FEFD9E39
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 05:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdg4HeYILg9vH96eeWfpQ6Yd+D1ghXXUjeqaDg3EADI=; b=uYKnXNt/B++SA6rJJtbhJv0dg3
	505dhOBp9fEs2Xh5NRDJbyWfQqwExm1KWCvI2UmSgBBjEqKTeq4QWKQ9XXDUFY6KTj1ZfacNSSkvj
	CGaQV7ZvbtmgfC1qF3ypqeqjxxyzs239/9VwJQz+BcJ+c4sCxunv2Osde+4Jy5ppfNTNF/eX0qoAY
	/NQ5KruSVDMdN1ayX/kvVtG43RDxjyw8rg4/hlj6xmdfyfxBl8Z26EcsbHLLGabzhZzMfVZD+xCp6
	sLBFj85hdv48bVecsFhgBuqj5XdqaM9WG/pH1/V5Is6P5zZ/Ejl8MIPj2OGUMBQed3sPvv+Os8z7u
	Nj4Vrs2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvq8Y-00000007gav-2z1F;
	Fri, 27 Feb 2026 05:11:38 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvq8W-00000007gaZ-1sjl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 05:11:37 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2adb1c1f9d4so51785ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 21:11:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772169095; cv=none;
        d=google.com; s=arc-20240605;
        b=cVWKexPmPAAv8OC6tqnD2tHzfkAbY6uDBg4u5v20v4p1TkUnvtcYkh6+1akN9f9DX1
         pmkwp7Pd7zyBd6GTxfRfqKUFnpFefakh98e3slhNtZU9VBuveiWM5J2oGuxZA3gT8Sxp
         uxyvtS3XiLteYboBdZRSWnWewiT1jL/YBp+s+80Dt3jhbTiiiddZfTv2SGK5dezAv3zr
         Z+Uv6WqZ5aL1kRjmBY0+1aAP+cel+iKRMUu41FNR/Bu7Tdlx+7rbYp8MguOFguhHPNRw
         alAlnIQLqrJoJNvd40zmCpdD8EwdawgrDtMZFc3eSWTrHhrLD3Dj0Am7sB5aRNqc/Xd9
         WNfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kdg4HeYILg9vH96eeWfpQ6Yd+D1ghXXUjeqaDg3EADI=;
        fh=IslDhEydoxbtYNTOYxmuQ/WqPyFGu2Gd3no7DKuAtdU=;
        b=abaGWvPJ+jqSTl7E579Ccx1GU1VnfVPUbz3ni0tRteQ9wBUnzqyKIaT3hh4gEWYqfC
         CTRVPXMdJqViuwpTkkrMdEUUKpTDrEcGQ/Ot/FxhLZRXzPad/QvTOlOTxvzOfPpVjHtC
         +I1hAY1YceIEmqVtHF3+wYQ6BnHxROIdvafrkmcFoZd6dMJ9BzfWWZkF59RP7cHK5DzO
         wj88cOUdUHrlHsv5uzk7jSD2R6TPh5V9qsea375cDauXFeg5eQNmtxfEBqFc9iP7tLWU
         jQdOFCbNlOekrThK42SjWOZJ5XIjfENn2vL6M2eMC8oldQk62WRO4Y6vb7lUsAIGhvYG
         tRnA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772169095; x=1772773895; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdg4HeYILg9vH96eeWfpQ6Yd+D1ghXXUjeqaDg3EADI=;
        b=uoBcqQN0fiiZ4vFQWHJHg5LLuk0QIxvarv9Lyw6xJXJRrS9zlxszcmkY4yAZkXTAS2
         C8FpuHYjcaELniii24r+gxgQLVI98OQdYl+4/UewXYNEcPyylxPITZhajZ4LIJ1qiOZg
         Fae3X6A6Bg1QPxiSiDmYe/Ht2MjpIjmJYfwio6FXgwV6tsTwD+Hhpx9+occCTX+AaVYT
         h84wyws6gcTOKfzol5pAquKvU7/nUnI6qJOzdyZsMx4b+zk+geuKPpFi+eZ3+sT7ahbO
         NBRQ26TkXt2DO0GWJuAT/Xd7qxmftboVnBCLJhwSB3hJge72pdJnQKFDKoT+XxapCedf
         TxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772169095; x=1772773895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kdg4HeYILg9vH96eeWfpQ6Yd+D1ghXXUjeqaDg3EADI=;
        b=eMELGnc4tqHrqOnDGmztoFe8lOAPHB4kcMjdd2S2PRBO6ol97i5cdjg6d0mMpFnf9m
         rrVHRvj59GvTuGOhGBYarb9ij0q1IGP2me5uMyOs6XR9VXCcfGEXEh5G8+WWRGZW6U+l
         xLD6xGZ5YzHs/t0VR8MA9xwhzb+Yl2VBt5+t1XIydOQMkhFKYc378ac+idMvuaRNu2Gq
         oXjaKESAE1VyCbRmxRMS8DAbnyaKbIfhRoAfmKqO7dzI1fc4f3QIvQNZ/uRFbPGrQCqj
         fFTIw+lbn6STjbAV+5QaucsntkAlPkFiN66apPqCeyNqg0c+00OgkPvkDFhFrrdts4EZ
         Vk9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVt00Wb+P98ZvkhD66hgLAHrXsikgazb27y4JSkQ0y6CEmSFpcc3D6niBqoxJdrYz6nzmaBcMfGJMcBRZp/+diO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4NsVGMUzuT3Kmp0d46zusRPinXuNavMJG4XadpZFH737/RdFV
	i0447hkYdW8GNE3eb1tyI96GtUquCmHuKrBDomAoklHkujKvWReicYtxbCY2IFlN0kDKQEoMjoE
	nUxv1MolC3RtTRcfQX/djo5xw/lM07YbXUY7J0Krh
X-Gm-Gg: ATEYQzzTNBZ4BwDM0fFZCAsgzy9xZvW4JOtw9JOhjZZPS+ZSaPSsVQ13Bx63ls/Xhca
	mCu7s7txvePKvDSprayy3xn4lVU9uNYRQpaob5sD0I4LCjUZGgIGabVlwTvD/YGwZ3ZRNf2VZBk
	lbHhHBpFmdERx64RboJmuEBIBOK09q+tU5VjDZq0iF+25m7504mDyMtw54oBb0o2bYUCMTAqkx6
	0KFfuObst1BHOBEYx3kKi/ZPy0MFoO2rIbCtErtb65UfS0s0QJeKHqdGg8qnkkjgAIdX5yaxAEq
	h2EXlI1i7NCS5tZxBdy6cKusnBNFAHA4Yu0JSmIV
X-Received: by 2002:a17:903:1a4c:b0:2a9:5c9d:d1b with SMTP id
 d9443c01a7336-2adff4fa1f5mr4231785ad.9.1772169094728; Thu, 26 Feb 2026
 21:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20260217145026.3880286-1-dev.jain@arm.com> <CAC_TJvfD19E--wyeVyTmp-LP9ffoLQaUHruZARbdes2EnKgptQ@mail.gmail.com>
 <e1858dc5-6526-4aac-8392-f4f2e19da1bc@arm.com>
In-Reply-To: <e1858dc5-6526-4aac-8392-f4f2e19da1bc@arm.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Thu, 26 Feb 2026 21:11:22 -0800
X-Gm-Features: AaiRm50D65ghbF7RzaRcTJH7irRq9mkR44Hj5G0F0y3SYG8dtuk-hDxr7CftTvE
Message-ID: <CAC_TJvcvybHqVAV8nAHEvN-UXUQ5hMjZx+_b2W3MY=xgqR9=6w@mail.gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] Per-process page size
To: Dev Jain <dev.jain@arm.com>
Cc: lsf-pc@lists.linux-foundation.org, ryan.roberts@arm.com, 
	catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org, 
	willy@infradead.org, hughd@google.com, baolin.wang@linux.alibaba.com, 
	akpm@linux-foundation.org, david@kernel.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?Q?Mateusz_Ma=C4=87kowski?= <mmac@google.com>, 
	=?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>, 
	Marcin Szymczyk <marcinszymczyk@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_211136_564337_3F9561F9 
X-CRM114-Status: GOOD (  58.28  )
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

On Thu, Feb 26, 2026 at 12:45=E2=80=AFAM Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 26/02/26 1:10 pm, Kalesh Singh wrote:
> > On Tue, Feb 17, 2026 at 6:50=E2=80=AFAM Dev Jain <dev.jain@arm.com> wro=
te:
> >>
> >> Hi everyone,
> >>
> >> We propose per-process page size on arm64. Although the proposal is fo=
r
> >> arm64, perhaps the concept can be extended to other arches, thus the
> >> generic topic name.
> >>
> >> -------------
> >> INTRODUCTION
> >> -------------
> >> While mTHP has brought the performance of many workloads running on an=
 arm64 4K
> >> kernel closer to that of the performance on an arm64 64K kernel, a per=
formance
> >> gap still remains. This is attributed to a combination of greater numb=
er of
> >> pgtable levels, less reach within the walk cache and higher data cache=
 footprint
> >> for pgtable memory. At the same time, 64K is not suitable for general
> >> purpose environments due to it's significantly higher memory footprint=
.
> >>
> >> To solve this, we have been experimenting with a concept called "per-p=
rocess
> >> page size". This breaks the historic assumption of a single page size =
for the
> >> entire system: a process will now operate on a page size ABI that is g=
reater
> >> than or equal to the kernel's page size. This is enabled by a key arch=
itectural
> >> feature on Arm: the separation of user and kernel page tables.
> >>
> >> This can also lead to a future of a single kernel image instead of 4K,=
 16K
> >> and 64K images.
> >>
> >> --------------
> >> CURRENT DESIGN
> >> --------------
> >> The design is based on one core idea; most of the kernel continues to =
believe
> >> there is only one page size in use across the whole system. That page =
size is
> >> the size selected at compile-time, as is done today. But every process=
 (more
> >> accurately mm_struct) has a page size ABI which is one of the 3 page s=
izes
> >> (4K, 16K or 64K) as long as that page size is greater than or equal to=
 the
> >> kernel page size (kernel page size is the macro PAGE_SIZE).
> >>
> >> Pagesize selection
> >> ------------------
> >> A process' selected page size ABI comes into force at execve() time an=
d
> >> remains fixed until the process exits or until the next execve(). Any =
forked
> >> processes inherit the page size of their parent.
> >> The personality() mechanism already exists for similar cases, so we pr=
opose
> >> to extend it to enable specifying the required page size.
> >>
> >> There are 3 layers to the design. The first two are not arch-dependent=
,
> >> and makes Linux support a per-process pagesize ABI. The last layer is
> >> arch-specific.
> >>
> >> 1. ABI adapter
> >> --------------
> >> A translation layer is added at the syscall boundary to convert betwee=
n the
> >> process page size and the kernel page size. This effectively means enf=
orcing
> >> alignment requirements for addresses passed to syscalls and ensuring t=
hat
> >> quantities passed as =E2=80=9Cnumber of pages=E2=80=9D are interpreted=
 relative to the process
> >> page size and not the kernel page size. In this way the process has th=
e illusion
> >> that it is working in units of its page size, but the kernel is workin=
g in
> >> units of the kernel page size.
> >>
> >> 2. Generic Linux MM enlightenment
> >> ---------------------------------
> >> We enlighten the Linux MM code to always hand out memory in the granul=
arity
> >> of process pages. Most of this work is greatly simplified because of t=
he
> >> existing mTHP allocation paths, and the ongoing support for large foli=
os
> >> across different areas of the kernel. The process order will be used a=
s the
> >> hard minimum mTHP order to allocate.
> >>
> >> File memory
> >> -----------
> >> For a growing list of compliant file systems, large folios can already=
 be
> >> stored in the page cache. There is even a mechanism, introduced to sup=
port
> >> filesystems with block sizes larger than the system page size, to set =
a
> >> hard-minimum size for folios on a per-address-space basis. This mechan=
ism
> >> will be reused and extended to service the per-process page size requi=
rements.
> >>
> >> One key reason that the 64K kernel currently consumes considerably mor=
e memory
> >> than the 4K kernel is that Linux systems often have lots of small
> >> configuration files which each require a page in the page cache. But t=
hese
> >> small files are (likely) only used by certain processes. So, we prefer=
 to
> >> continue to cache those using a 4K page.
> >> Therefore, if a process with a larger page size maps a file whose page=
cache
> >> contains smaller folios, we drop them and re-read the range with a fol=
io
> >> order at least that of the process order.
> >>
> >> 3. Translation from Linux pagetable to native pagetable
> >> -------------------------------------------------------
> >> Assume the case of a kernel pagesize of 4K and app pagesize of 64K.
> >> Now that enlightenment is done, it is guaranteed that every single map=
ping
> >> in the 4K pagetable (which we call the Linux pagetable) is of granular=
ity
> >> at least 64K. In the arm64 MM code, we maintain a "native" pagetable p=
er
> >> mm_struct, which is based off a 64K geometry. Because of the guarantee
> >> aforementioned, any pagetable operation on the Linux pagetable
> >> (set_ptes, clear_flush_ptes, modify_prot_start_ptes, etc) is going to =
happen
> >> at a granularity of at least 16 PTEs - therefore we can translate this
> >> operation to modify a single PTE entry in the native pagetable.
> >> Given that enlightenment may miss corner cases, we insert a warning in=
 the
> >> architecture code - on being presented with an operation not translata=
ble
> >> into a native operation, we fallback to the Linux pagetable, thus losi=
ng
> >> the benefits borne out of the pagetable geometry but keeping
> >> the emulation intact.
> >>
> >> -----------------------
> >> What we want to discuss
> >> -----------------------
> >>  - Are there other arches which could benefit from this?
> >>  - What level of compatibility we can achieve - is it even possible to
> >>    contain userspace within the emulated ABI?
> >>  - Rough edges of compatibility layer - pfnmaps, ksm, procfs, etc. For
> >>    example, what happens when a 64K process opens a procfs file of
> >>    a 4K process?
> >>  - native pgtable implementation - perhaps inspiration can be taken
> >>    from other arches with an involved pgtable logic (ppc, s390)?
> >>
> >
> > Hi Dev, Ryan,
> >
> > I'd be very interested in joining this discussion at LSF/MM.
>
> Thanks Kalesh for your interest!
>
> >
> > On Android, we have a separate but very related use case: we emulate a
> > larger userspace page size on x86, primarily to allow app developers
> > to test their apps for 16KB compatibility using x86 emulators [1].
> >
> > Similar to your proposed "ABI adapter" layer, our approach works by
> > enforcing a larger 16KB granularity and alignment on the VMAs to
> > emulate the userspace page size, while the underlying kernel still
> > operates on a 4KB granularity [2].
> >
> > In our emulation experience, we've run into a few specific rough edges:
> >
> > 1. mmap and SIGBUS: Enforcing a larger VMA granularity means that
> > mapping files can easily extend the VMA beyond the end of the file's
> > valid offset. When userspace touches this padded area, the 4KB filemap
> > fault cannot resolve to a valid index, resulting in a SIGBUS that
> > applications aren't expecting.
>
> You did mention in the other email the links below, and I went ahead
> to compare :) I was puzzled to see some sort of VMA padding approach
> in your patches. OTOH our approach pads anonymous pages. So for example,
> if a 64K process maps a 12K sized file, we will map 52K/4K =3D 13 anonymo=
us
> pages into the 64K-aligned VMA.
>
> Implementation-wise, we detect such a condition in filemap_fault
> and return VM_FAULT_NEED_ANONPAGE, and redirect that to do_anonymous_page
> to map 4K pages.

Ah, the VMA padding patches you saw are actually for a different feature.

To handle the file mapping overhang, we currently insert a separate
anonymous VMA to cover the remainder of the emulated page range. Tough
I think your approach of returning VM_FAULT_NEED_ANONPAGE to fault
anonymous pages without needing to manage extra VMAs is a much cleaner
design :)

Thanks,
Kalesh

>
> >
> > 2. userfaultfd: This inherently operates at the strict PTE granularity
> > of the underlying kernel (4KB). Hiding this from a userspace that
> > expects a 16KB/64KB fault granularity while the kernel still operates
> > on 4KB granularity is messy ...
>
> Indeed. We will have to fault in 16 4K pages.
>
> >
> > 3. pagemap and PFN interfaces: As you noted with procfs, interfaces
> > that expose or consume PFNs are problematic. Userspace tools reading
> > /proc/pid/pagemap, /proc/kpagecount, /proc/kpageflags,
> > /proc/kpagecgroup, and /sys/kernel/mm/page_idle/bitmap calculate
> > offsets based on the userspace page size ABI, but the kernel returns
> > 4KB PFNs which breaks such users.
> >
> >
> > It would be great to explore if we can align on a unified approach to
> > solve these.
> >
> > [1] https://developer.android.com/guide/practices/page-sizes#16kb-emula=
tor
> > [2] https://source.android.com/docs/core/architecture/16kb-page-size/ge=
tting-started-cf-x86-64-pgagnostic
> >
> > Thanks,
> > Kalesh
> >
> >> -------------
> >> Key Attendees
> >> -------------
> >>  - Ryan Roberts (co-presenter)
> >>  - mm folks (David Hildenbrand, Matthew Wilcox, Liam Howlett, Lorenzo =
Stoakes,
> >>              and many others)
> >>  - arch folks
> >>
>

