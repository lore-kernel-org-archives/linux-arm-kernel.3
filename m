Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A76BCF538A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 13:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAwd48omU14UhJi85ziG9ck13JNx93zmUVUlcB4wXIA=; b=hCJ8ks+oPgapledEo9oM4ulXnA
	v7N2wjNKhCq2JCncNyVv6so8PAi+5IMHORKtqIWrYQ/Biekk9WF47IpetivBnSrJvD6LBaWBfM5qC
	gP9JsQME0dqRkP0Qmff+sU8/98gdwqoBTbNH4YXS7VKEUpWmXgG0Mwpz4SkoZi8oNhQBf3bB7DxQW
	O8tVBOUTB7Bk5Sqe0AH0FAcOl6/iEKRxEn+FWRku/KJ2mydM/QzG9sdkDXCb/HHxc6WJ5yyGyubge
	6e2TnecFfKNE0n3f27/MuldxyvsSy0+wc9lzGueyUqalVKt3VXTvUs9za9M5kbi42jxb8qibH7vuD
	3Sr9ZPaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bcZ-0000000EaAG-1Mow;
	Wed, 23 Oct 2024 13:41:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bb2-0000000EZzW-27Hl;
	Wed, 23 Oct 2024 13:40:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 448FF5C5F0D;
	Wed, 23 Oct 2024 13:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B251C4CEE5;
	Wed, 23 Oct 2024 13:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729690819;
	bh=Lu9YSclbTdVAZko8HL1EN4aP4k9nSSYXLWoin86L7dk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Pf3xZiQBCxAPHaN7y/LNoguShipMOR7i6eDCrlw5URNtM7BjG8DaUNBEFtiN+bvFu
	 ggqCHHcXRju5mymBaSBM9HKTeyijIGw7hOj/SCQ8/oOt+zyxoY9krENgYjWJ/m10MS
	 EPWuWXPx5wS+yo1jbo3ONNc1C/ldL6g/tyvYh0cRjWmZ7Z1lyoHKrMvIXBDfGXjuIC
	 5tuL1xnJVp7GcMoKf7FI7iwoXafhfycx079vaaYAbYVTzRa26JYI2bK+hqTymP7H95
	 l0hidiaSWkBqvxQZSdHdu9oNcGCPMjBk6Xo1PTS99Sty73uYUQ1jHi8ce2ZmPG1oEz
	 ncBbnyetDsy6g==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e59dadebso8483902e87.0;
        Wed, 23 Oct 2024 06:40:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKBYRDHukwgGFTzBvLdI8VVsR8ClZMzr11b5cVPLA/ziKSAY6UCPArmIZsrzbWPbCRvANhaA==@lists.infradead.org, AJvYcCXonFR0IqxJDSq1S4W+R7jixzfMMRL9uO1KGuMMTq7oTH1SuJ8zkEwgur3BmiiiKzwUmnK6hhZ5v/SQ2YfL4HM6iw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWrb0L6ZjaxNZPKHvkt9K1nEjqCPU0wMry/KY6LuIp4G6o/tKn
	khVES+yxNFmEeS5tCyJvN9N6aHZHsYZr6/FzjYEl6KD5ddsZJ7b/tfOeLQtp2EkkaTI+LnB3Up6
	P2gLx42RqHKmGMCQZzawZ+zw7mg==
X-Google-Smtp-Source: AGHT+IFp1rlvBvAgovwWIHdkc8JKbjpOUlWvNyNMMr+FomXIFzVaHzZoAryx8MZFai0b1ZgDur6QOvdz+dUkJLEiYps=
X-Received: by 2002:a05:6512:1110:b0:539:da76:c77e with SMTP id
 2adb3069b0e04-53b1a31d8a9mr1461200e87.5.1729690817815; Wed, 23 Oct 2024
 06:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20241003113840.2972416-1-usamaarif642@gmail.com>
 <20241004000316.GA1910499-robh@kernel.org> <d3d90f10-1ccd-4557-843c-5b546d3b913c@gmail.com>
 <CAL_JsqJVEjPt9tHNr0uAGHQwGnUbZDZoe7kURp3Qx0ce1jv+vw@mail.gmail.com> <4b9456a3-47ea-4a00-92fe-131ccd80e550@gmail.com>
In-Reply-To: <4b9456a3-47ea-4a00-92fe-131ccd80e550@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Oct 2024 08:40:05 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLLxyhjrc-Aqg12mjUZHGGgw59=AJxPpOfh5uSST8hY0Q@mail.gmail.com>
Message-ID: <CAL_JsqLLxyhjrc-Aqg12mjUZHGGgw59=AJxPpOfh5uSST8hY0Q@mail.gmail.com>
Subject: Re: [PATCH] of/kexec: save pa of initial_boot_params for arm64 and
 use it at kexec
To: Usama Arif <usamaarif642@gmail.com>
Cc: mark.rutland@arm.com, will@kernel.org, leitao@debian.org, 
	catalin.marinas@arm.com, saravanak@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_064020_659897_246EA0D0 
X-CRM114-Status: GOOD (  36.32  )
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

On Mon, Oct 7, 2024 at 10:30=E2=80=AFAM Usama Arif <usamaarif642@gmail.com>=
 wrote:
>
>
>
> On 07/10/2024 15:39, Rob Herring wrote:
> > On Mon, Oct 7, 2024 at 9:06=E2=80=AFAM Usama Arif <usamaarif642@gmail.c=
om> wrote:
> >>
> >>
> >>
> >> On 04/10/2024 01:03, Rob Herring wrote:
> >>> On Thu, Oct 03, 2024 at 12:38:40PM +0100, Usama Arif wrote:
> >>>>  __pa() is only intended to be used for linear map addresses and usi=
ng
> >>>> it for initial_boot_params which is in fixmap for arm64 will give an
> >>>> incorrect value. Hence stash the physical address when it is known a=
t
> >>>> boot time and use it at kexec time instead of converting the virtual
> >>>> address using __pa().
> >>>>
> >>>> Reported-by: Breno Leitao <leitao@debian.org>
> >>>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> >>>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> >>>> Fixes: ac10be5cdbfa ("arm64: Use common of_kexec_alloc_and_setup_fdt=
()")
> >>>> ---
> >>>>  arch/arm64/kernel/setup.c | 8 ++++++++
> >>>>  drivers/of/fdt.c          | 6 ++++++
> >>>>  drivers/of/kexec.c        | 8 ++++++--
> >>>>  include/linux/of_fdt.h    | 2 ++
> >>>>  4 files changed, 22 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> >>>> index b22d28ec8028..a4d96f5e2e05 100644
> >>>> --- a/arch/arm64/kernel/setup.c
> >>>> +++ b/arch/arm64/kernel/setup.c
> >>>> @@ -194,6 +194,14 @@ static void __init setup_machine_fdt(phys_addr_=
t dt_phys)
> >>>>      /* Early fixups are done, map the FDT as read-only now */
> >>>>      fixmap_remap_fdt(dt_phys, &size, PAGE_KERNEL_RO);
> >>>>
> >>>> +    /*
> >>>> +     * Save dt_phys address so that it can be used later for kexec.=
 This
> >>>> +     * is done as __pa() is only intended to be used for linear map=
 addresses
> >>>> +     * and using it for initial_boot_params which is in fixmap will=
 give an
> >>>> +     * incorrect value.
> >>>> +     */
> >>>> +    set_initial_boot_params_pa(dt_phys);
> >>>
> >>> No new arch->dt functions please. If we need to save off the PA, then=
 do
> >>> that when we set initial_boot_params.
> >>>
> >>> Rob
> >>
> >>
> >> initial_boot_params is set in early_init_dt_verify, called by early_in=
it_dt_scan.
> >> This is done in setup_machine_fdt in arm64 where the PA is available,
> >> but in other functions in other architectures, where the PA is not ava=
ilable.
> >
> > Doesn't __pa() work for all the other architectures? That's what your
> > patch indicates.
> >
>
> Yes, __pa() works for all other architectures.
>
> But we would need to add initial_boot_params_pa of type phys_addr_t
> as an argument for early_init_dt_scan, which is called by all other archs=
,
> and we technically cant use 0 as an invalid value.
>
> We could convert initial_boot_params_pa to void *, and pass NULL for all
> other archs. But again, I don't really think we should be changing the
> early_init_dt_scan(dt_virt) call in all other archs to
> early_init_dt_scan(dt_virt, NULL) just to save initial_boot_params_pa
> in arm64?
>
> >> So it makes it quite messy to set it in the same place as initial_boot=
_params.
> >> Its only needed for arm64 and making a change in all archs probably is=
nt a good idea?
> >>
> >> Any reason to not add a new function to make arch -> of/fdt call?
> >
> > Yes. It is the opposite direction I have reworked the interfaces to.
> > We don't want each arch calling various early DT functions at random
> > times and order. That's fragile when the DT functions make assumptions
> > about when they are called or what's been initialized already.
> >
> > Another option is to make arm64 copy the DT as some arches do.
> >
> > Rob
>
> Ah maybe I didn't understand this properly, but isnt early_init_dt_scan a=
n
> arch -> of/fdt interfaces. set_initial_boot_params_pa is a similar interf=
ace
> to early_init_dt_scan?

Yes, and I don't want more APIs if they can be avoided. When is
set_initial_boot_params_pa() supposed to be called? Is it before or
after early_init_dt_scan()? Can subsequent OF functions assume the PA
is valid? If an arch doesn't call set_initial_boot_params_pa() is
__pa() valid or did they just forget to call it? Requiring the PA to
be set at the same time as initial_boot_params avoids all those issues
with any period of time having the PA incorrect.

Rob

