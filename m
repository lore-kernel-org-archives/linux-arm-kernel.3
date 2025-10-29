Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCB8CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOYBV/0JJc5FbtxbKTwPEcWdu6C4LWylG4Y8AM+Oomc=; b=al7Lr1QhPcWDDFfnFPGAqHCAaQ
	+CsV8LtmYBtEWJ2L/dCBaI+oCYxtiZ0gqLpnEz/LAWeXIkQ6nFh6SbERJG5NintyA6RqMW2ZVnR6i
	OJsU3JzosiF/jdwcOvTJZo266IgnIukK5exdTQFN0KrpHtEP7e63td+/ohNdB1WUOYcNB9/KtjcYR
	EJpTY3SISVQtZxEdGC6bbxl9APrDC4K03VkBX/4eCJ4+28lX5ouY7qOzLJ+U2XTpB/WhRiLZ5yPPI
	wLXjzUpGQjMQao18m6sW59RJY6oB9DYfPG4Wx+WPBedldc6CfCH8V//8Nim6FZJSqNehfWZp/Cv7C
	/NbL2rAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6yG-00000001XGm-04zt;
	Wed, 29 Oct 2025 14:16:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6yD-00000001XFq-2qDg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 14:16:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 636A548262
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 14:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4260CC116B1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 14:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761747372;
	bh=8p5qzn5lsjro6ecyrajsLYnqkz4JpIKQTGIKLB0bxno=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OJjMxP6IwoKCGacSgRL4QW2fdPx5GViCAibFG1eB4z0jhcV6B1aC7o0RtzfSDLeBh
	 TX82KVkgDRpsJdUM1tBUkYZGznNwBxIoJe9zgWqYjbLFrdYZP2MOpQqINGllnvUsMB
	 aMdxJoGaDM7SU1H4/cekAaZtxXv9wsKmm2SzaLChIuu1J9zAxx72B8BBD+29ypnWoe
	 inH443ETBqX+uBW/KhdROcbY/dGwOywYFt6MaxM8GxaRQ/mXVE27Rr7aphwJxMXp35
	 UY+Mdhwl5OVhQ1LXuAGOfJb+lrgphfIVKt0bHXC8rJTkAiqMzx1kUoqnaaDDsqbsvh
	 HLk03LeXC/dzQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57e8e67aa3eso1640737e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:16:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXPwbUMRjaSpmteyiEUh896mFzlrZ5L1Wf2OOi3T+8wvZZzXn0EGaCtlDb3c2APOSH+qGir6ZJG50Ot3C5ktAL4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4sR813P9AaQ4+xJ2Fn2au0Hlgc9XqQifGyo33RO8r6HmDQN8h
	EnCwuqbLfnIJKevMqMffZyJknL8uZv3VABtYIS3RtdHi3D5bZyBA86oAimSghkPyaUAstWvWv25
	QvBqsXdqLpfeRFTG38eLpAGqdNjRZ/UY=
X-Google-Smtp-Source: AGHT+IEzWgdNj4Bs2eCcMWiSr9KjTK5w+8iRiC5xWh9ohGIX6Rk16IJVlTtZlJ9iC+OCfdlfG1EIrEfOnjygVEO23AI=
X-Received: by 2002:a05:6512:110e:b0:592:f098:f38a with SMTP id
 2adb3069b0e04-59412cb34a6mr1099049e87.20.1761747370603; Wed, 29 Oct 2025
 07:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20251023082129.75612-1-maqianga@uniontech.com>
 <CAMj1kXHs3vC4TEWg1ogG=N8Dd5L0rkQ=qAFLWKiAA5yi_He3GA@mail.gmail.com>
 <10D9A93B0633E6BE+75720e07-b39d-452c-952e-41f8ab6aad94@uniontech.com>
 <CAMj1kXHQ6WQWfbkMP4JUk=nKwSt7CovY25RC4JA0ZM7vRWu6dA@mail.gmail.com> <9F7F632B7963434F+abad2548-a90d-4448-ae79-dd4bf637ee6e@uniontech.com>
In-Reply-To: <9F7F632B7963434F+abad2548-a90d-4448-ae79-dd4bf637ee6e@uniontech.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 29 Oct 2025 15:15:59 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHu5ABgxKsc_gg1j=pWMz6DbWoqv=qAAjx-5CiSF2PAiQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkPBgz5qsoTj4IvJC_wLSrwQLJE6QkYE7qxmwFvIEBZJRA3qMEx45Je13s
Message-ID: <CAMj1kXHu5ABgxKsc_gg1j=pWMz6DbWoqv=qAAjx-5CiSF2PAiQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM/efi: Remove duplicate permission settings
To: Qiang Ma <maqianga@uniontech.com>
Cc: linux@armlinux.org.uk, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_071613_753892_E3F26456 
X-CRM114-Status: GOOD (  22.19  )
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

On Wed, 29 Oct 2025 at 10:55, Qiang Ma <maqianga@uniontech.com> wrote:
>
>
> =E5=9C=A8 2025/10/28 21:42, Ard Biesheuvel =E5=86=99=E9=81=93:
> > On Mon, 27 Oct 2025 at 04:46, Qiang Ma <maqianga@uniontech.com> wrote:
> >>
> >> =E5=9C=A8 2025/10/23 16:30, Ard Biesheuvel =E5=86=99=E9=81=93:
> >>> On Thu, 23 Oct 2025 at 10:22, Qiang Ma <maqianga@uniontech.com> wrote=
:
> >>>> In the efi_virtmap_init(), permission settings have been applied:
> >>>>
> >>>> static bool __init efi_virtmap_init(void)
> >>>> {
> >>>>           ...
> >>>>           for_each_efi_memory_desc(md)
> >>>>                   ...
> >>>>                   efi_create_mapping(&efi_mm, md);
> >>>>           ...
> >>>>           efi_memattr_apply_permissions(&efi_mm, efi_set_mapping_per=
missions);
> >>>>           ...
> >>>> }
> >>>>
> >>>> Therefore, there is no need to apply it again in the efi_create_mapp=
ing().
> >>>>
> >>>> Fixes: 9fc68b717c24 ("ARM/efi: Apply strict permissions for UEFI Run=
time Services regions")
> >>>>
> >>>> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> >>> No, efi_memattr_apply_permissions() uses the /optional/ memory
> >>> attributes table, whereas efi_create_mapping() uses the permission
> >>> attributes in the EFI memory map. The memory attributes table is
> >>> optional, in which case any RO/XP attributes from the memory map
> >>> should be used.
> >>>
> >> I see.
> >>
> >> Then, can it be modified like this?
> > No
> >
> >> --- a/arch/arm/kernel/efi.c
> >> +++ b/arch/arm/kernel/efi.c
> >> @@ -65,16 +65,13 @@ int __init efi_create_mapping(struct mm_struct *mm=
,
> >> efi_memory_desc_t *md)
> >>                   desc.type =3D MT_MEMORY_RWX_NONCACHED;
> >>           else if (md->attribute & EFI_MEMORY_WC)
> >>                   desc.type =3D MT_DEVICE_WC;
> >> +       else if (md->attribute & (EFI_MEMORY_RO | EFI_MEMORY_XP))
> > This will be true for RO, XP or RO+XP.
> >
> >> +               desc.type =3D MT_MEMORY_RO;
> > This will apply RO permissions even to XP regions, which need to be wri=
table.
> >
> Thanks for your review.
> I see.
>
> I can introduce a new type MT_MEMORY_RO_XP, to describe RO+XP,
> and then we can use the RO+XP attribute to implement memory mapping.
>

Why? The current code is working fine, no?

