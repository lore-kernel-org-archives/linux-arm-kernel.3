Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7E9C02190
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 10:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZ/DDV44XiE8BW+IR4YoYg+wUgkVU1ZjLVw3hTHYaB8=; b=yXSkeyVoMiMCKdW3SLgIskVFq+
	LIlPMpC0/H4Q66gHSTcrkyZzP5HovLGcSRQwrU+4xN7AnlB7nmleeDLOMfeucsS6wJyGDlBwh1jpc
	QO1W908iEJqvn2vdZM53o0isYKIok41B6EBjnuxsXVMC//TQwpTGiFWa7hZB4R9YCpAhu1yymUzm/
	pwiNupy0ngMX/W3KSsk5ppxJjlnDAPyhiPr5juVBE/X57v0vymtGlzbN5HU77dW3nrj5IsQm9nqEN
	rhNuKixS8dopnKY8hYl4xdCPpOFnWEoFWja9E+RG3+E+RUHak6XdZRb8C8VjmhYTDoGiTf4kgrp7e
	i08gvfcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRRv-00000008aKM-21Hn;
	Thu, 30 Jan 2025 10:07:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRQb-00000008a8L-2LBO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 10:05:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 930855C5F1C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 10:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53160C4CEE3
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 10:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738231540;
	bh=C9wDU7pwLV0RekbM8uxPv1jXFKPR+bcAS3GXMtcE3tI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=anMHB3O1uGd7PYynvgIMeTrWouTqRQvsxUW2grYkkiiAKkxil/6+sPJIj4GoM4B7l
	 PwYHoG0s2SrWwjer/X5q1U0tbtI+/aldwSYISCLNiqH6Hq/qWx7I3jJOM64b4wME+Z
	 nxGrrscLuD/JPs8rmrbcVJYXYuKlMsqOnpPk+fOqlmNBuZMquRQxHcsJhHapkLDpy4
	 17v78NFHEL8YTysyJHPFfmJj4hFHlgjbln2mj5UbGceV4j3JD7Gk2/5SjAmhCjQWdA
	 54P2fJhYK1YoI4sbI/yrNuQvKgyBGNUac9z3gkrXJO/YsGJN6/chTMWYcgumfZ9MLl
	 wFLiCTKjVWB0g==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53e3778bffdso648634e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 02:05:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1gwzJ51E6OXQkGelvsp0Mhc5tIiQHsIw1K+VzMvoKnJHPMla6V+j4yEtqkFrn/E2zizjUuN6AYpLBdkVDnosj@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3icvdwapnGs5/ex3LYWZJHLyIfl8iu8fJ55geLaydf4v6ErKg
	lXLE2wlhXZnBsuGYELDRHrB1IgcuV6FkPTSg6gyqjkZpSn2L83ZkJo5ZXH3DN4ZycKXdPism+EZ
	VzDiG4IuBq2ZGgdqt1koXfOib66o=
X-Google-Smtp-Source: AGHT+IFwXvIggK2Dtyju5LXqKD3V9iqpgJ4UOwEp/NQNACdHT9mHUHDkawh0Ijd4NxOjoQyUlIxGY8PWpfPYlVngyYE=
X-Received: by 2002:a05:6512:2344:b0:542:2905:ae52 with SMTP id
 2adb3069b0e04-543e4c3c083mr2345634e87.45.1738231538642; Thu, 30 Jan 2025
 02:05:38 -0800 (PST)
MIME-Version: 1.0
References: <20250109165419.1623683-1-florian.fainelli@broadcom.com>
 <20250109165419.1623683-2-florian.fainelli@broadcom.com> <62786457-d4a1-4861-8bec-7e478626f4db@broadcom.com>
 <2025011247-enable-freezing-ffa2@gregkh> <27bbea11-61fa-4f41-8b39-8508f2d2e385@broadcom.com>
 <2025012002-tactics-murky-aaab@gregkh> <41550c7f-1313-41b4-aa2e-cb4809ad68c2@broadcom.com>
 <2025012938-abreast-explain-f5f7@gregkh> <1fc6d5c8-80ec-4d6b-bc14-c584d89c15b4@broadcom.com>
 <CAMj1kXHheRQYHddgehLbZot6o-xAxkbeHBUq7nS8npyB9A0FvQ@mail.gmail.com> <8994e7c5-812c-4605-9bdf-18a5b402196a@broadcom.com>
In-Reply-To: <8994e7c5-812c-4605-9bdf-18a5b402196a@broadcom.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 30 Jan 2025 11:05:26 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHhgyRSzSgRQfWKRseFSifV1X=OqcTkL0_7ZWfi+UjhcA@mail.gmail.com>
X-Gm-Features: AWEUYZmZyunDbwpw1BQcc0lwJHSSHtpfuzTTNYqADTNclCDIo2dr16ndgmkUVzk
Message-ID: <CAMj1kXHhgyRSzSgRQfWKRseFSifV1X=OqcTkL0_7ZWfi+UjhcA@mail.gmail.com>
Subject: Re: [PATCH] arm64: mm: account for hotplug memory when randomizing
 the linear region
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Will Deacon <will@kernel.org>, 
	Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Baruch Siach <baruch@tkos.co.il>, 
	Petr Tesarik <ptesarik@suse.com>, Mark Rutland <mark.rutland@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Yang Shi <yang@os.amperecomputing.com>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_020541_684059_ED09053E 
X-CRM114-Status: GOOD (  44.77  )
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

On Thu, 30 Jan 2025 at 00:31, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 1/29/25 14:15, Ard Biesheuvel wrote:
> > On Wed, 29 Jan 2025 at 18:45, Florian Fainelli
> > <florian.fainelli@broadcom.com> wrote:
> >>
> >> On 1/29/25 01:17, Greg KH wrote:
> >>> On Mon, Jan 20, 2025 at 08:33:12AM -0800, Florian Fainelli wrote:
> >>>>
> >>>>
> >>>> On 1/20/2025 5:59 AM, Greg KH wrote:
> >>>>> On Mon, Jan 13, 2025 at 07:44:50AM -0800, Florian Fainelli wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 1/12/2025 3:54 AM, Greg KH wrote:
> >>>>>>> On Thu, Jan 09, 2025 at 09:01:13AM -0800, Florian Fainelli wrote:
> >>>>>>>> On 1/9/25 08:54, Florian Fainelli wrote:
> >>>>>>>>> From: Ard Biesheuvel <ardb@kernel.org>
> >>>>>>>>>
> >>>>>>>>> commit 97d6786e0669daa5c2f2d07a057f574e849dfd3e upstream
> >>>>>>>>>
> >>>>>>>>> As a hardening measure, we currently randomize the placement of
> >>>>>>>>> physical memory inside the linear region when KASLR is in effect.
> >>>>>>>>> Since the random offset at which to place the available physical
> >>>>>>>>> memory inside the linear region is chosen early at boot, it is
> >>>>>>>>> based on the memblock description of memory, which does not cover
> >>>>>>>>> hotplug memory. The consequence of this is that the randomization
> >>>>>>>>> offset may be chosen such that any hotplugged memory located above
> >>>>>>>>> memblock_end_of_DRAM() that appears later is pushed off the end of
> >>>>>>>>> the linear region, where it cannot be accessed.
> >>>>>>>>>
> >>>>>>>>> So let's limit this randomization of the linear region to ensure
> >>>>>>>>> that this can no longer happen, by using the CPU's addressable PA
> >>>>>>>>> range instead. As it is guaranteed that no hotpluggable memory will
> >>>>>>>>> appear that falls outside of that range, we can safely put this PA
> >>>>>>>>> range sized window anywhere in the linear region.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >>>>>>>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> >>>>>>>>> Cc: Will Deacon <will@kernel.org>
> >>>>>>>>> Cc: Steven Price <steven.price@arm.com>
> >>>>>>>>> Cc: Robin Murphy <robin.murphy@arm.com>
> >>>>>>>>> Link: https://lore.kernel.org/r/20201014081857.3288-1-ardb@kernel.org
> >>>>>>>>> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> >>>>>>>>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> >>>>>>>>
> >>>>>>>> Forgot to update the patch subject, but this one is for 5.10.
> >>>>>>>
> >>>>>>> You also forgot to tell us _why_ this is needed :(
> >>>>>>
> >>>>>> This is explained in the second part of the first paragraph:
> >>>>>>
> >>>>>> The consequence of this is that the randomization offset may be chosen such
> >>>>>> that any hotplugged memory located above memblock_end_of_DRAM() that appears
> >>>>>> later is pushed off the end of the linear region, where it cannot be
> >>>>>> accessed.
> >>>>>>
> >>>>>> We use both memory hotplug and KASLR on our systems and that's how we
> >>>>>> eventually found out about the bug.
> >>>>>
> >>>>> And you still have 5.10.y ARM64 systems that need this?  Why not move to
> >>>>> a newer kernel version already?
> >>>>
> >>>> We still have ARM64 systems running 5.4 that need this, and the same bug
> >>>> applies to 5.10 that we used to support but dropped in favor of 5.15/6.1.
> >>>> Those are the kernel versions used by Android, and Android TV in particular,
> >>>> so it's kind of the way it goes for us.
> >>>>
> >>>>>
> >>>>> Anyway, I need an ack from the ARM64 maintainers that this is ok to
> >>>>> apply here before I can take it.
> >>>>
> >>>> Just out of curiosity, the change is pretty innocuous and simple to review,
> >>>> why the extra scrutiny needed here?
> >>>
> >>> Why shouldn't the maintainers review a proposed backport patch for core
> >>> kernel code that affects everyone who uses that arch?
> >>
> >> They should, but they are not, we can keep sending messages like those
> >> in the hope that someone does, but clearly that is not working at the
> >> moment.
> >>
> >> This patch cherry picked cleanly into 5.4 and 5.10 maybe they just trust
> >> whoever submit stable bugfixes to have done their due diligence, too, I
> >> don't know how to get that moving now but it fixes a real problem we
> >> observed.
> >>
> >
> > FWIW, I understand why this might be useful when running under a
> > non-KVM hypervisor that relies on memory hotplug to perform resource
> > balancing between VMs. But the upshot of this change is that existing
> > systems that do not rely on memory hotplug at all will suddenly lose
> > any randomization of the linear map if its CPU happens to be able to
> > address more than ~40 bits of physical memory. So I'm not convinced
> > this is a change we should make for these older kernels.
>
> Are there other patches that we could backport in order not to lose the
> randomization in the linear range?

No, this never got fixed. Only recently, I proposed some patches that
allow the PARange field in the CPU id registers to be overridden, and
this would also bring back the ability to randomize the linear map on
CPUs with a wide PARange.

Android also enables memory hotplug, and so I didn't bother with
preserving the old behavior when memory hotplug is disabled, and so
linear map randomization has basically been disabled ever since
(unless you are using an older core with only 40 physical address
bits).

Nobody ever complained about losing this linear map randomization, but
taking it away at this point from 5.4 and 5.10 goes a bit too far imo.

