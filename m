Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72717CFA44F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UN3F8w2GAqRlTo+DXk3As0JrjgXQdaTRiyfZ8AGylyQ=; b=DCgLxymEdP1oCxqeOhGUPg5AK+
	rYd8QCUMqNZPRppL/naeWZkFgeCFW8V4iArzhy/tyrvl+mdAL0F1+2w13GYLXvoYZ2KCwCTtVRZ/O
	+qomsZ2MfTfSMwnL7RmddtBpwBAkfFuOsjrUexaM+V0SWkQmi3q4UsNjrPblrOjsGkH8n6QcUfRJB
	v3yD3OeYtk90cd4HnSZPZEvyc/13tnbWFI1v0ulFiHwWx3VZ+aG1X/2uJNK+3A/aXmaLB0qvxuLhi
	uAxkyDlbvRFZNSzIKpnDP1OLoSNAn0enW2IpXAXVxgz1wsbHtg60PCvfKEN60odQtyO2D9SPGOA3X
	fsKjUZhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dvZ-0000000F5SU-3hMF;
	Wed, 23 Oct 2024 16:09:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3d77-0000000Ev0s-2AM3;
	Wed, 23 Oct 2024 15:17:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 06CB45C0505;
	Wed, 23 Oct 2024 15:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309CEC4CEC6;
	Wed, 23 Oct 2024 15:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729696652;
	bh=Y9lg95AOBx3IZcZyZeGwM2XaFHswE2uhvCfA6MfY39E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LolIzHaGBLQpJYEPCSMlz4zOflsLfvm459UKKZnqVLNnyDBSFjMiM5+4nDE7b09TY
	 W59UX8xhkcZDTNQjWnZ5g+qI+YpcFQID8DX6WScXw0xrkJnicvZOrqTAcyB+lP9mIB
	 1OyQUTcT3Pdh46IgiETAZSs01umGdWC07ZsiBv3zfRuqcW2lxDH46g5sIcCoEBwdRe
	 Rkrm+ABEdixbBQ+3FSFyy+FGkLb6xPZl0wl2lce9J+B30uHVQR6slXPzO3fzG3Ph9p
	 WJEpm284T6BJt+w1y5P4XXxGxxm5bhuWQwHxyd7I9kpVE/J7n5hWaqvr9ZTx9veeC/
	 WjzSLT1lKSMPw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb5638dd57so70591321fa.0;
        Wed, 23 Oct 2024 08:17:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUBiYz5fm8xhGtu8xLu6QyeLMi7DyhNF08TixMDDAUoBHrSsDQv9j8j26aHj6w+Jj2mjhpTw==@lists.infradead.org, AJvYcCWf42yWQElMw83N1fGfBVmpgOT9CbHNmP8Qa8xbBSQlC/cLvsbXtBpcQNyxhNoV34mxeBRo0uuLdwMs6r72s0Hpeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoIL/TXrAfGaPCAqSnPU0KU1axOeEuIAjMakrgI0XJAIuk0cR4
	Z7Rw+LBdQu52G79hv4O2rI5c6EXxSsXzqS6v/PkhwCE12rpm5EwHLcoHWKFdeHlbZ8vfsaeU6ze
	Xa+bQAR8O1o7MGYy8fQsc1s/r2Q==
X-Google-Smtp-Source: AGHT+IFO2flos8BmUbUaV2MIys/apvRsxd9oWb6MtoGL3InNud08UQCYJA2+z/ZVPUpl+CBNdQz4CESiW+WTCz4l5os=
X-Received: by 2002:a05:6512:2c05:b0:53b:1f90:576f with SMTP id
 2adb3069b0e04-53b1f905959mr889920e87.22.1729696650524; Wed, 23 Oct 2024
 08:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20241003113840.2972416-1-usamaarif642@gmail.com>
 <20241004000316.GA1910499-robh@kernel.org> <d3d90f10-1ccd-4557-843c-5b546d3b913c@gmail.com>
 <CAL_JsqJVEjPt9tHNr0uAGHQwGnUbZDZoe7kURp3Qx0ce1jv+vw@mail.gmail.com>
 <4b9456a3-47ea-4a00-92fe-131ccd80e550@gmail.com> <CAL_JsqLLxyhjrc-Aqg12mjUZHGGgw59=AJxPpOfh5uSST8hY0Q@mail.gmail.com>
 <1e117d65-b454-4d5c-b03a-c3ab3b078093@gmail.com>
In-Reply-To: <1e117d65-b454-4d5c-b03a-c3ab3b078093@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Oct 2024 10:17:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJhd0X+eCW6WgXUjCLb-dBqHN4_01vzRRLU07Wz5Q2tLw@mail.gmail.com>
Message-ID: <CAL_JsqJhd0X+eCW6WgXUjCLb-dBqHN4_01vzRRLU07Wz5Q2tLw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241023_081733_738188_3E7A53A3 
X-CRM114-Status: GOOD (  46.43  )
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

On Wed, Oct 23, 2024 at 9:43=E2=80=AFAM Usama Arif <usamaarif642@gmail.com>=
 wrote:
>
>
>
> On 23/10/2024 14:40, Rob Herring wrote:
> > On Mon, Oct 7, 2024 at 10:30=E2=80=AFAM Usama Arif <usamaarif642@gmail.=
com> wrote:
> >>
> >>
> >>
> >> On 07/10/2024 15:39, Rob Herring wrote:
> >>> On Mon, Oct 7, 2024 at 9:06=E2=80=AFAM Usama Arif <usamaarif642@gmail=
.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 04/10/2024 01:03, Rob Herring wrote:
> >>>>> On Thu, Oct 03, 2024 at 12:38:40PM +0100, Usama Arif wrote:
> >>>>>>  __pa() is only intended to be used for linear map addresses and u=
sing
> >>>>>> it for initial_boot_params which is in fixmap for arm64 will give =
an
> >>>>>> incorrect value. Hence stash the physical address when it is known=
 at
> >>>>>> boot time and use it at kexec time instead of converting the virtu=
al
> >>>>>> address using __pa().
> >>>>>>
> >>>>>> Reported-by: Breno Leitao <leitao@debian.org>
> >>>>>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> >>>>>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> >>>>>> Fixes: ac10be5cdbfa ("arm64: Use common of_kexec_alloc_and_setup_f=
dt()")
> >>>>>> ---
> >>>>>>  arch/arm64/kernel/setup.c | 8 ++++++++
> >>>>>>  drivers/of/fdt.c          | 6 ++++++
> >>>>>>  drivers/of/kexec.c        | 8 ++++++--
> >>>>>>  include/linux/of_fdt.h    | 2 ++
> >>>>>>  4 files changed, 22 insertions(+), 2 deletions(-)
> >>>>>>
> >>>>>> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> >>>>>> index b22d28ec8028..a4d96f5e2e05 100644
> >>>>>> --- a/arch/arm64/kernel/setup.c
> >>>>>> +++ b/arch/arm64/kernel/setup.c
> >>>>>> @@ -194,6 +194,14 @@ static void __init setup_machine_fdt(phys_add=
r_t dt_phys)
> >>>>>>      /* Early fixups are done, map the FDT as read-only now */
> >>>>>>      fixmap_remap_fdt(dt_phys, &size, PAGE_KERNEL_RO);
> >>>>>>
> >>>>>> +    /*
> >>>>>> +     * Save dt_phys address so that it can be used later for kexe=
c. This
> >>>>>> +     * is done as __pa() is only intended to be used for linear m=
ap addresses
> >>>>>> +     * and using it for initial_boot_params which is in fixmap wi=
ll give an
> >>>>>> +     * incorrect value.
> >>>>>> +     */
> >>>>>> +    set_initial_boot_params_pa(dt_phys);
> >>>>>
> >>>>> No new arch->dt functions please. If we need to save off the PA, th=
en do
> >>>>> that when we set initial_boot_params.
> >>>>>
> >>>>> Rob
> >>>>
> >>>>
> >>>> initial_boot_params is set in early_init_dt_verify, called by early_=
init_dt_scan.
> >>>> This is done in setup_machine_fdt in arm64 where the PA is available=
,
> >>>> but in other functions in other architectures, where the PA is not a=
vailable.
> >>>
> >>> Doesn't __pa() work for all the other architectures? That's what your
> >>> patch indicates.
> >>>
> >>
> >> Yes, __pa() works for all other architectures.
> >>
> >> But we would need to add initial_boot_params_pa of type phys_addr_t
> >> as an argument for early_init_dt_scan, which is called by all other ar=
chs,
> >> and we technically cant use 0 as an invalid value.
> >>
> >> We could convert initial_boot_params_pa to void *, and pass NULL for a=
ll
> >> other archs. But again, I don't really think we should be changing the
> >> early_init_dt_scan(dt_virt) call in all other archs to
> >> early_init_dt_scan(dt_virt, NULL) just to save initial_boot_params_pa
> >> in arm64?
> >>
> >>>> So it makes it quite messy to set it in the same place as initial_bo=
ot_params.
> >>>> Its only needed for arm64 and making a change in all archs probably =
isnt a good idea?
> >>>>
> >>>> Any reason to not add a new function to make arch -> of/fdt call?
> >>>
> >>> Yes. It is the opposite direction I have reworked the interfaces to.
> >>> We don't want each arch calling various early DT functions at random
> >>> times and order. That's fragile when the DT functions make assumption=
s
> >>> about when they are called or what's been initialized already.
> >>>
> >>> Another option is to make arm64 copy the DT as some arches do.
> >>>
> >>> Rob
> >>
> >> Ah maybe I didn't understand this properly, but isnt early_init_dt_sca=
n an
> >> arch -> of/fdt interfaces. set_initial_boot_params_pa is a similar int=
erface
> >> to early_init_dt_scan?
> >
> > Yes, and I don't want more APIs if they can be avoided. When is
> > set_initial_boot_params_pa() supposed to be called? Is it before or
> > after early_init_dt_scan()?
>
> Its only needed in arm64, and can be either before or after, as long as i=
ts
> somewhere in setup_machine_fdt, where dt_phys is available.

Maybe only arm64 today. What happens when riscv decides they too want
to support the DT anywhere in memory including outside the linear
address map and then they need the same thing.

> > Can subsequent OF functions assume the PA
> > is valid?
>
> After set_initial_boot_params_pa has been called, yes.

How do I know it has been called? Do I have to go wade thru every arch
to see? You could document the requirement to be immediately after
early_init_dt_scan(), but then how do you enforce that? You can't
unless you design the interface to just avoid the problem in the first
place.

> > If an arch doesn't call set_initial_boot_params_pa() is
> > __pa() valid or did they just forget to call it?
>
> Only arm64 seems to do the fixmap as discussed in
> https://lore.kernel.org/all/1ea5538f-7e96-4034-9af9-e2d5fd72e069@gmail.co=
m/,
> so __pa should work in others.
>
> Requiring the PA to
> > be set at the same time as initial_boot_params avoids all those issues
> > with any period of time having the PA incorrect.
> >
>
> Are you recommending I send a patch which changes all archs to call
> early_init_dt_scan(dt_virt, NULL)?
> or maybe early_init_dt_scan(dt_virt, __pa(dt_virt))?
> and arm to call early_init_dt_scan(dt_virt, dt_phys).

I believe that's what I suggested already, so yes. Whether NULL or
__pa(dt_virt))? __pa() would be better because then the arch has to
think about whether that is right or not.

> Happy to do send a v2 with that if its the way forward, although I feel
> set_initial_boot_params_pa() in just one arch might be better than
> changing this for all archs.

We don't work around kernel APIs if they don't meet changing needs. We
change them.

Rob

