Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD85CCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4+l/kBzBrNkC5aEiK5Wkm6XphdChKEXaRLubUFLjrg=; b=Oc87xdxgXWnuzPm//Eed3z2vsM
	dapEjvFOLsn5+G/HCTNxByOSiAjSdB3COeY755TLeqXRvPqNpllc4tZhzEGtN5TXMHUWsi37Nd4Dg
	SmPx9ihVPTyxaYnP3h/rco3b5A24e0Q16EP0+5mIitijqKpH/5MW8WbkZ6gJKs7hc5YwIFDhEmreu
	06VEVDI2nGwmfcnDpcdMv9XV658V6Jv2WwFrW83wu2l6sGbCVEjwGBetoJuBLSnO6dw+erpiz1sKR
	CofiBGDDs4ee9spS/+5nmPpS9n3lfg4l9GisNt0YYiNaGytdm/41+APPtiT+Z9Ukrn+teUUJW5W66
	fd6H0i+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPUZ-00000003vjM-3hJy;
	Thu, 30 Oct 2025 10:02:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPUX-00000003vih-2Y1A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:02:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E545D43D1F
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 10:02:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B52C4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 10:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761818568;
	bh=r5xiql/CWLoKOljyLg2/QtrdaB9yqJsCMTZbhNIakUo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EIcPugs30KHp2oN6mGnWO5R5GzlIB6xW5eoCAJ4MOPlPLrSXwaLhXrJblMRprR9aE
	 QdVaoLFBWMtbOfqcgqdvWKf714XGEVo52AwmfsAF/XLBJRU1X0qCcgQLyB741xpYst
	 Bvb0sp/uiUa2FyqNtgKl+1uM/aw66NPNI7tTLaVi6UCZMGnqsqcqYKZfG//A479eCx
	 xWiWqbzK3qhlm1MghWY9R1/rlr6NwA0tOvxWWfqRQQ1hVhNWo+xtiT0HWLXUqvR2zd
	 BSTrIsQzM84Wior5sP8wqfA9xR4THb9jhUAzjW40ierljUBJaeh5lqS+llpF+9VwgS
	 VcDUrTyhMoS8Q==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3696f1d5102so6436461fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 03:02:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXKYVELRU9M45KgOcUwTC0JI8nO7Supcg1XqsijqNFXLV+UUDwMFA3IkOSFhSg3SHCG4yohA5D/UCwveFfB8Fqs@lists.infradead.org
X-Gm-Message-State: AOJu0YxTLTy5ENPWe9YEAicitDH1aF/j+fj1M9ras/WJSynDdAgD+Um7
	KDlcGvytY5ARZPGrQtSIpKsNdeTnDCGyYSy7GNCwxjZ+FIweij2MZdG24i49ljEtGHSilIme576
	9Z7S0Wa5UW5qe9B3rnWSEHQL0/ZBPHBo=
X-Google-Smtp-Source: AGHT+IEWtHRJgfzesZIicoiwBsGNiijy1Cz9bSwYEQl6Xwgwlj+lutUH1oxJWo6qzPvnRFAwdMfybG0k46nq2737U4E=
X-Received: by 2002:a05:651c:12c8:b0:372:9505:7256 with SMTP id
 38308e7fff4ca-37a05316e43mr17170601fa.30.1761818567165; Thu, 30 Oct 2025
 03:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251023082129.75612-1-maqianga@uniontech.com>
 <CAMj1kXHs3vC4TEWg1ogG=N8Dd5L0rkQ=qAFLWKiAA5yi_He3GA@mail.gmail.com>
 <10D9A93B0633E6BE+75720e07-b39d-452c-952e-41f8ab6aad94@uniontech.com>
 <CAMj1kXHQ6WQWfbkMP4JUk=nKwSt7CovY25RC4JA0ZM7vRWu6dA@mail.gmail.com>
 <9F7F632B7963434F+abad2548-a90d-4448-ae79-dd4bf637ee6e@uniontech.com>
 <CAMj1kXHu5ABgxKsc_gg1j=pWMz6DbWoqv=qAAjx-5CiSF2PAiQ@mail.gmail.com> <BD93A8DBE27154B0+22bf4a83-a850-4f78-8e0d-84cc93fe2715@uniontech.com>
In-Reply-To: <BD93A8DBE27154B0+22bf4a83-a850-4f78-8e0d-84cc93fe2715@uniontech.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 30 Oct 2025 11:02:34 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFUUCoE=gZ0kTMKx87qnJMU9J9skT75STTKjjakXb8kmw@mail.gmail.com>
X-Gm-Features: AWmQ_bmbipMpTfTSvyFPuGPK5qsmoZKz2m5xvqfsOsmZI7s9lak8SdW6KJRsPRA
Message-ID: <CAMj1kXFUUCoE=gZ0kTMKx87qnJMU9J9skT75STTKjjakXb8kmw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM/efi: Remove duplicate permission settings
To: Qiang Ma <maqianga@uniontech.com>
Cc: linux@armlinux.org.uk, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_030249_685589_9CDA83A8 
X-CRM114-Status: GOOD (  26.03  )
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

On Thu, 30 Oct 2025 at 08:37, Qiang Ma <maqianga@uniontech.com> wrote:
>
>
> =E5=9C=A8 2025/10/29 22:15, Ard Biesheuvel =E5=86=99=E9=81=93:
> > On Wed, 29 Oct 2025 at 10:55, Qiang Ma <maqianga@uniontech.com> wrote:
> >>
> >> =E5=9C=A8 2025/10/28 21:42, Ard Biesheuvel =E5=86=99=E9=81=93:
> >>> On Mon, 27 Oct 2025 at 04:46, Qiang Ma <maqianga@uniontech.com> wrote=
:
> >>>> =E5=9C=A8 2025/10/23 16:30, Ard Biesheuvel =E5=86=99=E9=81=93:
> >>>>> On Thu, 23 Oct 2025 at 10:22, Qiang Ma <maqianga@uniontech.com> wro=
te:
> >>>>>> In the efi_virtmap_init(), permission settings have been applied:
> >>>>>>
> >>>>>> static bool __init efi_virtmap_init(void)
> >>>>>> {
> >>>>>>            ...
> >>>>>>            for_each_efi_memory_desc(md)
> >>>>>>                    ...
> >>>>>>                    efi_create_mapping(&efi_mm, md);
> >>>>>>            ...
> >>>>>>            efi_memattr_apply_permissions(&efi_mm, efi_set_mapping_=
permissions);
> >>>>>>            ...
> >>>>>> }
> >>>>>>
> >>>>>> Therefore, there is no need to apply it again in the efi_create_ma=
pping().
> >>>>>>
> >>>>>> Fixes: 9fc68b717c24 ("ARM/efi: Apply strict permissions for UEFI R=
untime Services regions")
> >>>>>>
> >>>>>> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> >>>>> No, efi_memattr_apply_permissions() uses the /optional/ memory
> >>>>> attributes table, whereas efi_create_mapping() uses the permission
> >>>>> attributes in the EFI memory map. The memory attributes table is
> >>>>> optional, in which case any RO/XP attributes from the memory map
> >>>>> should be used.
> >>>>>
> >>>> I see.
> >>>>
> >>>> Then, can it be modified like this?
> >>> No
> >>>
> >>>> --- a/arch/arm/kernel/efi.c
> >>>> +++ b/arch/arm/kernel/efi.c
> >>>> @@ -65,16 +65,13 @@ int __init efi_create_mapping(struct mm_struct *=
mm,
> >>>> efi_memory_desc_t *md)
> >>>>                    desc.type =3D MT_MEMORY_RWX_NONCACHED;
> >>>>            else if (md->attribute & EFI_MEMORY_WC)
> >>>>                    desc.type =3D MT_DEVICE_WC;
> >>>> +       else if (md->attribute & (EFI_MEMORY_RO | EFI_MEMORY_XP))
> >>> This will be true for RO, XP or RO+XP.
> >>>
> >>>> +               desc.type =3D MT_MEMORY_RO;
> >>> This will apply RO permissions even to XP regions, which need to be w=
ritable.
> >>>
> >> Thanks for your review.
> >> I see.
> >>
> >> I can introduce a new type MT_MEMORY_RO_XP, to describe RO+XP,
> >> and then we can use the RO+XP attribute to implement memory mapping.
> >>
> > Why? The current code is working fine, no?
> >
> Yes, the current code is running normally.
>
> The reasons for the modification are as follows:
> I noticed that the arm64/RISC-V efi_create_mapping() always return 0,
> but in the code where efi_virtmap_init() calls it, it is as follows:
>
> ret =3D efi_create_mapping(&efi_mm, md);
> if (ret) {
>      pr_warn("  EFI remap %pa: failed to create mapping (%d)\n",
>          &phys, ret);
>      return false;
> }
>
> This return error print is unnecessary, so I want to remove it.

So what is preventing you from removing this from the RISC-V version?

