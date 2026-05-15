Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE07BCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 14:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXP+iNJCHZbqWc4hXlcmm81+IGUZub0k8gEMQgHw71Y=; b=DszieohBWwR5RgiyLD2ArhPJ5w
	5sBiIrWd/XTHfrPiDe93MZMeNZPQjXazl+AO+jF98IJ58/QrC8cdQBaueXLuzNLxv3wfjKkk2D2Ia
	Q7vp/4j8lsviHJngI9ANTyFPMpZlKMrjuvv8/V6qmrBI7jccC8HEqS2WpXebw7HnrhAhce7aEQ0qo
	iVVIVq8xLnqeFs7NC1o0FSgoIXMwamNiK66EBOjSB0P6/ud489RzwHDUO2FbEmpCAvHyt1BQCFI43
	HIihrMM1h4GtzsTlYJ4oZdpMtNhUR6i07JciCXWna7TyHKFr/1WrDIz7flJze37tu5EfghfrvmbFl
	LW/7wOCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNt5J-00000008Vox-22YF;
	Fri, 15 May 2026 14:00:13 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNt5G-00000008Vnr-3d4N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 14:00:12 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-65c6a2158d3so8555211d50.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 07:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778853610; cv=none;
        d=google.com; s=arc-20240605;
        b=IDGIlDp52yqfaEGhapvq8HmaYwMSv71z+dOB687FDduWJmYvImOWNZkj8aQI+2eXF6
         j8zh3HxTvKAhimPOnubCJCgwUKiMVbqtxcLJ3MzSRfyFMj5FS3dwwpKdh4rv9WiOEbNG
         Oy9gUM0faK6swP3F9TXlE44hZXq1iUvtguidX/QCPoa3sQYnYfr0r+8EKwvl2K8Tvv8z
         Sw3T9UHrsUZ34dWNiwp4a2Wh09xK5IY/dHvhZufA9hePHwKXDHZJNYRn6xOlYHa3MyHf
         oiJ5dGHpRrhETsrWT083dd9/b3N+2+F52K7dkpA+Gx319o0MfjXHlViUdAlH/x76ENrf
         1Fyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GXP+iNJCHZbqWc4hXlcmm81+IGUZub0k8gEMQgHw71Y=;
        fh=fSoTTd1Y5Nx6YNSqKOy3LWKNH9gZbGyHCoEV8DVT+Xw=;
        b=fv6MfQ4GJhKEHBiDDOUXszF1efasl/rUzERQlkFbTHApc7bLektintahvDnAqRuaHz
         3Ku0uW5Xg0Zut+D0i+IBw8FBoccM4PjXSWrupVXz2v+axEp9/zgsLzWPdSAG/4EXHucO
         36eT94Ki9cp+AP9Cst+zYcra6O3ea3suA+kS9YyU6eKluCaY0wWu0DT/+rSGViuYa8X1
         9h7b/+n3Q1T2T4FaOY1svwbcrY21Z9i5BLGmga3hdyOpHI71sghn23BF957DZcQOPIgy
         yLFG6Wf7M29kSVcSAvjlX0hTUZK01jZYc1n2pI57kRx5VzGIlG/NNxOlWBHQhx6mPS06
         gvIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778853610; x=1779458410; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXP+iNJCHZbqWc4hXlcmm81+IGUZub0k8gEMQgHw71Y=;
        b=rUvE73nutkNvBotSsAyX+FDQD17zqVrQJkQ6jxpwkgGLr7LKqwswkwittt+mUlHAm2
         1g4ActJuNDJ3jashZZfZ+1QT9+5mGNYjGYWOmUudPrb9yxKp0gKipVXUbUprItnJX9Fv
         ECJepqWbNlBDenPtJZvVkhJhlsK1bqz2RBo1/LPOQOYlKaS7jXg2u4Xlf+bALkhlXNv1
         SFp0M6L3AeCO2r8yo+iBfGCWEIi0R+yiiKFhhVE3aNXvO/WR08pbOKgXJKKwrSBYQiI6
         J1hjnjwIn2SUxn6BEpKIYFpA0+tvYZEauacF8dwAPu42VR52EXrkyS24VxOo3IDMbSNV
         C5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778853610; x=1779458410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GXP+iNJCHZbqWc4hXlcmm81+IGUZub0k8gEMQgHw71Y=;
        b=qe6vCl3tR9XomsoNFREgrQV+mDep9zDmClSSpbT/RHga7fRhH9At3VWlKf8O58KKdf
         JAw6ETs9vHuyHYRfYAvN6TSL8kNl2EFP3X2g0coS5Pp0GfRQoFnuPxE0r5IYAfonYRYj
         HLga+rpLl/bS+FMeTjO5L+p0+8poqsPHCv3Oa7XAhHWCZVzZ2U9wZrwSCyLbU7OG3l/o
         p9zzhgTvsiAWCiBWxbmIY5ZpcCgfVYTaA/aXgs/ykJyzlUBSQwbiZGKuIXKYT2oCkNuR
         bAAxYkkg/Y/iPTiUFtMW7w1/wDKT8WMhP9Km2EIet4QG7mUDeIRP/AjgQ/WwVHesav3t
         HGnA==
X-Gm-Message-State: AOJu0YxrH49nwarAJjhX12vzckFhZP4U0XuogZvBpW+ISoEN7y2JbKGG
	nPIu9CNtMskDfIufwARUmP1q2QBWJ5uL+amQwrQKWjPckSupZqsPOmcLU2E2XKeEQRcGh7F0+oU
	beiBWxebczNsGtUbj+1EZTZKeEdeVDSik2fUI
X-Gm-Gg: Acq92OHeYPEXe0BDB1m1K5d4Pq21W/zfYGBafB0+8LpbCFEkPbxg5gndY7EvjRNbi4N
	udcXl8ukzTr3Q962fIZE6ICNyXfiPuMkfe4TDHXpuouUjcI9ibiW85ZRCHGR8qkhQgkvjVC1M5e
	0nvT286OLPD9pDGx0t7piaMMQTJCu40l/lP+1jjK1gvv3hJdCFSiZh/omnzOWRoX60tZewXzuva
	j0T6Z4ylDwEGTIYKcWn6pXoc760hXyiUyGTYA/bSTlqxn9F17FNWaQ/HaSXl1kISuC8JC+Ohc3R
	n8wQ0DEeBYkaOVM=
X-Received: by 2002:a05:690c:60c6:b0:7b8:f152:7545 with SMTP id
 00721157ae682-7c959b91611mr43397077b3.9.1778853609392; Fri, 15 May 2026
 07:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260514171304.2034930-1-ekffu200098@gmail.com> <CABFDxMHngr+cyjZdiJTZATh2D5jC=qO+92B1VVrr0w9TNtx6nw@mail.gmail.com>
In-Reply-To: <CABFDxMHngr+cyjZdiJTZATh2D5jC=qO+92B1VVrr0w9TNtx6nw@mail.gmail.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Fri, 15 May 2026 22:59:58 +0900
X-Gm-Features: AVHnY4KxTO6qvSBe_ecaSK1uVVo2LQahxtkC-2sLbaGIp0ivY25un_odaBzOmBI
Message-ID: <CABFDxMFYLY+ABT4rfnn6ipXwkqEafF+uTeYBfOOoyRKr7Bn1Aw@mail.gmail.com>
Subject: Re: [PATCH] arm64: mm: use u32 for FDT size in fixmap_remap_fdt()
To: catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_070010_931332_29AAA435 
X-CRM114-Status: GOOD (  29.46  )
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

On Fri, May 15, 2026 at 10:55=E2=80=AFPM Sang-Heon Jeon <ekffu200098@gmail.=
com> wrote:
>
> On Fri, May 15, 2026 at 2:13=E2=80=AFAM Sang-Heon Jeon <ekffu200098@gmail=
.com> wrote:
> >
> > fixmap_remap_fdt() uses a signed int for the FDT size, so a malformed
> > totalsize bigger than INT_MAX wrongly passes the MAX_FDT_SIZE check.
> > Then create_mapping_noalloc() is called with a huge size and triggers
> > a BUG_ON() in the MMU code, with no diagnostic about the malformed FDT.
> >
> > Change the FDT size from int to u32, which is the return type of
> > fdt_totalsize(). So a malformed totalsize no longer wrongly passes the
> > MAX_FDT_SIZE check, and setup_machine_fdt() prints a pr_crit
> > diagnostic for it, not a BUG_ON in the MMU code.
> >
> > Fixes: 61bd93ce801b ("arm64: use fixmap region for permanent FDT mappin=
g")
> > Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> > ---
> >  arch/arm64/include/asm/mmu.h | 2 +-
> >  arch/arm64/kernel/setup.c    | 4 ++--
> >  arch/arm64/mm/fixmap.c       | 4 ++--
> >  3 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.=
h
> > index 5e1211c540ab..a6b388ef4c3f 100644
> > --- a/arch/arm64/include/asm/mmu.h
> > +++ b/arch/arm64/include/asm/mmu.h
> > @@ -68,7 +68,7 @@ extern void create_mapping_noalloc(phys_addr_t phys, =
unsigned long virt,
> >  extern void create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
> >                                unsigned long virt, phys_addr_t size,
> >                                pgprot_t prot, bool page_mappings_only);
> > -extern void *fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t=
 prot);
> > +extern void *fixmap_remap_fdt(phys_addr_t dt_phys, u32 *size, pgprot_t=
 prot);
> >  extern void mark_linear_text_alias_ro(void);
> >  extern int split_kernel_leaf_mapping(unsigned long start, unsigned lon=
g end);
> >  extern void linear_map_maybe_split_to_ptes(void);
> > diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> > index 23c05dc7a8f2..7cabac0546dc 100644
> > --- a/arch/arm64/kernel/setup.c
> > +++ b/arch/arm64/kernel/setup.c
> > @@ -169,7 +169,7 @@ static void __init smp_build_mpidr_hash(void)
> >
> >  static void __init setup_machine_fdt(phys_addr_t dt_phys)
> >  {
> > -       int size =3D 0;
> > +       u32 size =3D 0;
> >         void *dt_virt =3D fixmap_remap_fdt(dt_phys, &size, PAGE_KERNEL)=
;
> >         const char *name;
> >
> > @@ -182,7 +182,7 @@ static void __init setup_machine_fdt(phys_addr_t dt=
_phys)
> >          */
> >         if (!early_init_dt_scan(dt_virt, dt_phys)) {
> >                 pr_crit("\n"
> > -                       "Error: invalid device tree blob: PA=3D%pa, VA=
=3D%px, size=3D%d bytes\n"
> > +                       "Error: invalid device tree blob: PA=3D%pa, VA=
=3D%px, size=3D%u bytes\n"
> >                         "The dtb must be 8-byte aligned and must not ex=
ceed 2 MB in size.\n"
> >                         "\nPlease check your bootloader.\n",
> >                         &dt_phys, dt_virt, size);
> > diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> > index c5c5425791da..c692e6ac2405 100644
> > --- a/arch/arm64/mm/fixmap.c
> > +++ b/arch/arm64/mm/fixmap.c
> > @@ -134,11 +134,11 @@ void __set_fixmap(enum fixed_addresses idx,
> >         }
> >  }
> >
> > -void *__init fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t=
 prot)
> > +void *__init fixmap_remap_fdt(phys_addr_t dt_phys, u32 *size, pgprot_t=
 prot)
> >  {
> >         const u64 dt_virt_base =3D __fix_to_virt(FIX_FDT);
> >         phys_addr_t dt_phys_base;
> > -       int offset;
> > +       u32 offset;
>
> Also sashiko found another issue with malformed total size. And I
> think that can be resolved by the following changes.

Add missing sashiko review link :
https://sashiko.dev/#/patchset/20260514171304.2034930-1-ekffu200098%40gmail=
.com

>         *size =3D fdt_totalsize(dt_virt);
>   +     if (*size < sizeof(struct fdt_header))
>   +             return NULL;
>
> Before sending a separate patch about malformed totalsize. First, I'd
> rather check reviewers' opinions.
>
> 1. Do we need to care about malformed totalsize? (including addressed
> by the current patch)
> 2. Does the above change need to be merged with the current patch or not?
>
> Looking forward to your feedback.
>
> Best Regards,
> Sang-Heon Jeon
>
> >         void *dt_virt;
> >
> >         /*
> > --
> > 2.43.0
> >

