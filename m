Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73893C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 04:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=goRDbiInExYlg2FZrZ7REiNXbKoKaAvkFCx3YBMBwsw=; b=N64AaVtxqcC+fNsvQKKcnXFq+R
	VgiTSn0X7O8CJG2pAkikLt3zdZdx6txqRHfCDqhv4CFdPfHEJoruvD2zLNGh8oxbapyTr0iy0qR5r
	bsoq2xTulanZ1KG+x9fwafTQl5OHWA6zkBA4MkVvzKfFGiTXwfwBNupMVuMgo1ohvBGE7vrLjaQMx
	elmY4hNZCfkyhSAqyd+0Aev1nTfJ1WbSagIyUiP0p08dUxwm0TmWVVturjEnqllO/TWLcJwJYKlFM
	0kE5d5TbfApje3K931Klc9ewnY/2pez5CJ5OVa7q2StdBAEYWEzLMJuVWKJ5IiiMw4cul0+pmqBI4
	q6fnxTOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj9jw-0000000BmHF-1c9k;
	Tue, 05 Aug 2025 04:57:32 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj9dp-0000000BluT-0Bnj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 04:51:14 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-717b580ff2aso46551107b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 21:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754369471; x=1754974271; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goRDbiInExYlg2FZrZ7REiNXbKoKaAvkFCx3YBMBwsw=;
        b=Pm1Z8BA+kl4Y1B/RculMiEQ14Vdga8BvyroJ6cos7n1IfuIVbTwnWVns0kjE/aBXe8
         fRPP8gmzEYGNZPdUDypxFM0OXZcXhphp4jZMchxz4xGp7bhZb5SXbUxA2d70tt1LUrtj
         qME1beUbsrBwGlmTPqM+sX7S/0PAJo5kZYb9UXh6lsTVq1L4CH+qAII8N5aibNNffGZF
         5pEipZ9sryw3KuhrTnP69izQEs7HhJTZHnDWbVOLby33a9ALyrNRbUPDz173TUIl9GNF
         6FXcEzo7dE70HFvohFjtJXD1hhcgVXci4QG0GgA2z4WVNoKctjWkHdab+BbGi6uZi3Ac
         7Trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754369471; x=1754974271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goRDbiInExYlg2FZrZ7REiNXbKoKaAvkFCx3YBMBwsw=;
        b=hjfgiyzuQVkkjOrKaop14CTnvMKgc84QcBqE0+C++MhQHU7anaiBY1f4Uz6joJuIAQ
         ymLmXBUFAaYVeIeTOguptUmpIbuGxStWD+v9517YRwzgCvta7tnF74aqPkITf+jJi2aq
         xTgP4Xd5LHgc5adPP1WYbdODz+B611ylRY8KKgIRhlaB0zoo3WjmcCPb8W5tmfi7PCbR
         Qdi8lPdeQONTh+iZ7xhoIna84gkuH0K1dk2XtBrpx8/lZ4SWoSjvDNv21xhaiM0QexMU
         mwtizkIs7pwCMkz3gPwyPxzeXoRfAvixB3/SzQ0bISpsWZFRdSRmcgcIvUiWuXS8kv5o
         xl9g==
X-Forwarded-Encrypted: i=1; AJvYcCVCCnyyaYRo00fjHa9NbRv71gYfmPjI6Z4UzDz5zJoz96Av7ZY+7nDKV69SGoPyRUjkTol0n2gefNI0MmFbkFfn@lists.infradead.org
X-Gm-Message-State: AOJu0YynbsnnO+3Sp7t2Wv4BMKaqOIbdjT5Z70SR8puTj/xWNKGKh5Lr
	GaeMn7il/L1FeAVu6OWuWQyxAkDXZFDWhOwm3SdWdLjEDWMDPd7cbA1t86tUb+7MG2T4hjehrX3
	FfQbveLFNfiW/Tadg5UUl4eh3YQq5ekTBsz8v0aRh9yDAJFKNecMGWUE=
X-Gm-Gg: ASbGncsC5a9kVLcY27Iv5Y8nswuywl+seaYviYeGFb6qJSUSMWz8LVe95ZLmHsO/ivT
	t/MfEs2Rmu+crAOOhIBQsA8wMZqm/K82nBz0JVX0VyPcmfGRvvCrHYD6tnhI80KEoT4oBd7s+Eq
	HvQhnukYAm72oSwCLYQA2l/q/Jwy979shKaa4H8698lbZ6gBOjdt+dxRYZCUmVCiHjlkNGXmI/v
	9O1jw==
X-Google-Smtp-Source: AGHT+IHeQ9gjfgM8r8LCqDBzIZurZmcUaTL4L7HOV3CKVzHJvHoNvkFagl++11B+nx8hPTcRNP2NnteS7qwpSI1JFek=
X-Received: by 2002:a05:690c:14:b0:70e:7ae4:5a21 with SMTP id
 00721157ae682-71b7f0c56fbmr121732557b3.4.1754369471580; Mon, 04 Aug 2025
 21:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250724081337epcas2p31f594b6e9ab87e24c94f11dea4070956@epcas2p3.samsung.com>
 <20250724080854.3866566-1-sw617.shin@samsung.com> <20250724080854.3866566-4-sw617.shin@samsung.com>
 <CAPLW+4mo-Fw5+KmwHdZGAM4uNpOWL6QakTgP-wMSxR=+dMGqsQ@mail.gmail.com> <000b01dc05c0$a50f5f20$ef2e1d60$@samsung.com>
In-Reply-To: <000b01dc05c0$a50f5f20$ef2e1d60$@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 4 Aug 2025 23:51:00 -0500
X-Gm-Features: Ac12FXxJPNFLaHj5nje0A_AcDG6Ll1OXb556rCVkvn6Yb_8cbt1jdRu-9Ss-iOU
Message-ID: <CAPLW+4=sJM4UwsqfC8t=swzhGU=BdRn3T6GjJje0unZSgNg-ng@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] watchdog: s3c2410_wdt: Increase max timeout value
 of watchdog
To: sw617.shin@samsung.com
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, khwan.seo@samsung.com, dongil01.park@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_215113_125687_DDE65F74 
X-CRM114-Status: GOOD (  29.16  )
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

On Mon, Aug 4, 2025 at 11:23=E2=80=AFPM <sw617.shin@samsung.com> wrote:
>
> On Saturday, August 2, 2025 at 1:37 PM Sam Protsenko <semen.protsenko@lin=
aro.org> wrote:
> > Not a strong point, but I'd break this patch into two:
> >   1. Add 32-bit counter feature (without enabling it in exynosautov920
> > implementation)
> >   2. Enable 32-bit counter feature in exynosautov920
> >
>
> I'll break this patch into two in the next patch set.
>
> > >  #define S3C2410_WTCNT_MAXCNT   0xffff
> >
> > Suggest renaming this to S3C2410_WTCNT_MAXCNT_16, to emphasize the fact
> > this value is for 16-bit counters. And for consistency with the below o=
ne.
> >
> > > +#define S3C2410_WTCNT_MAXCNT_32        0xffffffff
> > >
>
> I'll rename this to S3C2410_WTCNT_MAXCNT_16 in the next patch set.
>
> > > + * %QUIRK_HAS_32BIT_MAXCNT: WTDAT and WTCNT are 32-bit registers.
> > > + With these
> >
> > Why not name it like QUIRK_HAS_32BIT_CNT or QUIRK_HAS_32BIT_COUNTER?
> > As I understand, the quirk means that the chip has 32-bit counter, so M=
AX
> > bit is not really needed?
> >
> > > + * 32-bit registers, larger values to be set, which means that large=
r
> > > + timeouts
> >
> > Spelling: "to be set" -> "will be set" (or "have to be set").
>
> I'll modify this in the next patch set.
>
> > > +       unsigned int            max_cnt;
> >
> > Maybe make it u32? It definitely refers to a 32-bit register value, so
> > will be more explicit that way. Not a strong opinion though.
> >
>
> I'll change this to u32 in the next patch set.
>
> > >  };
> > >
> > >  static const struct s3c2410_wdt_variant drv_data_s3c2410 =3D {
> > > @@ -349,7 +356,7 @@ static const struct s3c2410_wdt_variant
> > drv_data_exynosautov920_cl0 =3D {
> > >         .cnt_en_bit =3D 8,
> > >         .quirks =3D QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET=
 |
> > >                   QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> > > -                 QUIRK_HAS_DBGACK_BIT,
> > > +                 QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
> > >  };
> > >
> > >  static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 =
=3D {
> > > @@ -362,7 +369,7 @@ static const struct s3c2410_wdt_variant
> > drv_data_exynosautov920_cl1 =3D {
> > >         .cnt_en_bit =3D 8,
> > >         .quirks =3D QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET=
 |
> > >                   QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> > > -                 QUIRK_HAS_DBGACK_BIT,
> > > +                 QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
> >
> > Yeah, I think it would be easier to review and handle further if this
> > exynosautov920 enablement is extracted into a separate patch.
> >
>
> I'll break this patch into two in the next patch set.
>
> > >
> > > -       if (count >=3D 0x10000) {
> > > -               divisor =3D DIV_ROUND_UP(count, 0xffff);
> > > +       if (count > wdt->max_cnt) {
> >
> > wdt->max_cnt + 1?
> >
>
> Yes, 0x10000 represented 'wdt->max_cnt + 1.'
> Would you like to suggest any revisions?
>

Ah, sorry, I didn't notice you also changed >=3D to just >. All well and
good, no change is needed here!

> > > +       wdt->max_cnt =3D S3C2410_WTCNT_MAXCNT;
> > > +       if ((wdt->drv_data->quirks & QUIRK_HAS_32BIT_MAXCNT))
> >
> > Double braces don't seem to be needed.
> >
> > > +               wdt->max_cnt =3D S3C2410_WTCNT_MAXCNT_32;
> > > +
> >
> > Style (minor nitpick): this block can be more explicit, i.e.:
> >
> >        if ((wdt->drv_data->quirks & QUIRK_HAS_32BIT_MAXCNT))
> >                wdt->max_cnt =3D S3C2410_WTCNT_MAXCNT_32;
> >        else
> >                wdt->max_cnt =3D S3C2410_WTCNT_MAXCNT;
> >
>
> I'll fix these in the next patch set.
>
>
>

