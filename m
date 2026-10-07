Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4C1CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 05:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvX6CzIo0lUP4hTcnMKg9GH46W029kkAuFQl56PR8ug=; b=rTceJs6IpYkOvaA8D1D9/BJ+20
	gWvBs2GHgY0o6ObQ0UQatiGTKADjllNl1L/EvhQhk8+UpWffpp8Ics+E9Ofdg2hXsmjHGPtB0U8ni
	cbQc1SrQkWq5/vX6p0IkfTxt9MpDlM3VBgrYzNAv88+ppI1QHjurh/oqGSwVPKJtPyXcqzaUFVpOU
	HIbb/1vN9QXjeLCor+U4VQSBqsIjlr8Gd2KOKQm9aw9Bj0c0/0nty2EU8YZLAYDWVVocEprl+hqet
	O9Kqup4Ob6hapM2LbXuQ8LdmjuHks+qtDx7loyJcGl7rD+5mVuGMZMveC8Gp1erJPZFLlyULLW3UX
	IsvHlWqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEKg7-00000001k2u-3FLq;
	Wed, 07 Oct 2026 05:58:59 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEKg5-00000001k2Z-1dvv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 05:58:58 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2d6d28aa26cso18774845ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 22:58:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791352736; cv=none;
        d=google.com; s=arc-20260327;
        b=kXlVDbU7qh3Pvcbvk5/844dYq1gWMt4kfRAYa8zYOURHiWqKccaMLT4eYGFtf/VIhL
         U1ojOeMBIBDJIA+FuRgaWaFQqexUdW+o6ZIv+gl4zcY0VOjK4I9SscVonUTu+83Bkn9v
         05fGEjcV6j8YCAadiq/jxVvxKPYVJpd976MHgdKezbKMPzcI8AHGs1vwmohGnHoRSPoW
         VWAGHBTovD8/WvhxqXMbkVrbww5R0gbfWluLthHPprQ0G0YkxgSNnbCTDME1A6ITalgS
         jzTnZBnOAUCBu8GvE1HxUmX6HMHmzfQLbLaAz5FklOr9b/blfwEsJGK6ef9wIRya6X9z
         t7QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fvX6CzIo0lUP4hTcnMKg9GH46W029kkAuFQl56PR8ug=;
        fh=zdarLg9p2SL877X9wgilohYu48hj0mi9cyoISf7gkmc=;
        b=e+U8jVaG9HGo0gnJX1gGxJ+d2dSZE55aacds11D3nON+bVvV3F/1SZxkUCMrL7vG1T
         V7m2Z2YQLKtU24On539Gm+dBVe4AuoulRgIJP9/8rK3TYaexYAFVjG0ePYa6k1m/epUf
         ztI3ie3lqpXZr0YkM/IR5iVx53ZByd/a1KcucIFhN2Qpp0Zjv9Uv6LjHcGkFwShRjhJY
         RXd9+0dGv8btM/ASmL8BygxUBE1y7wCapHsqHZQR9ijN5BrkyKD4h/W62AkLMoPBXcGo
         d7gNDEmDnNWumJ47JqsWAFwRhpHUTECFJJv/7xFkd6RcPMU2CfSidNZLXxOw41/H9neb
         l1Fg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791352736; x=1791957536; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fvX6CzIo0lUP4hTcnMKg9GH46W029kkAuFQl56PR8ug=;
        b=Dq/POekEnKXZTqPBvK/0r3TKw8HI4r8UPCetTj3mHZ8iBIZpHYfkFGX0HIKbxKQSE2
         kUZyUnwxa0SrjWUcK4mMv9KKUOhKLNFIiHneHhoKq7CnRQ/V6DdScp+1FUw/bk1+WrKA
         FaXdA9U2FWD9Tdy+ve/GLRujdMr5WOFxeUbceLrZTWpXeqcYxeCHhfCpQ5n1TX7myWM7
         +cBhYEysjj6eBsk1Hw8MPvD+cQaeHzNcN5fpDQtSRk0ZEOoUD97vJ6KP2oxQQr9pX+VR
         /5/oVb3CCu3wdrSYCAVRcUv2egN9hUK+hB1iWrsD0P+1ng/SSFI66t5ycIsy7i6KJTMh
         ZdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791352736; x=1791957536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvX6CzIo0lUP4hTcnMKg9GH46W029kkAuFQl56PR8ug=;
        b=0SxmUDsx/qOINcOXf+dth9DMPmi6Yv7j6FvgmXrc2kimcuaYiaJ3kke+1DgncfSFyV
         y293XhRDN1MwBcLIPQQnqnuC1aXaPNkzJJGGwyvZchi80eTuOf4NcL7oZYdjEQ5x5hTM
         KT0vH9dy0x6N9DHulYQk/Viy30YGS0J9OKZPmHLn+fLFT4z6/URP5BqWxjTpgzHvHl16
         Lae6U0HitBBX5bUA/S0pn2Nn5VvDZ3dNidi4OhiGNTvF2/LoNlp/ej0AXCFUHSoPC9Hc
         xHmgMIPIcGtu7DocdUNuiSfOVRZOFtWD794TM/8ERvrQSj6vsdqiyNgn2XsWjcfXTfLO
         yQLg==
X-Forwarded-Encrypted: i=1; AKwUvByjuWRmvlZh6TUKBEFhMdASCFCqs5UH7Z5PJXmS9WjNYPKuuLMRTQa2AzmC1MWa+tIeyACF//gEup4fz4aiPsZn@lists.infradead.org
X-Gm-Message-State: AFq9FYLGSWl73/382TzZ/VqvuAOINmDhe5uIZEieqNfDjEeIlb7pRvHP
	LFMIuZ/Ka5TMWLujq3SeTp7P+1mNmd03xanqTnHvow/VqS3i8x4m/mgoyS77p7Qg/dWWgq7qVw6
	/l7hRW5z487hpsMv9oIB4OOe3Y1gWdv4=
X-Gm-Gg: AYBFou0PTKOG+5GJeLjFFtDIAZImXRAx3sEnVcWhcKd9d2G6gqghWqo2fcBi6Id+Zve
	ya3x1lES9L/e1+kzwZbKHp/IcxaOWoXiqa00iAxPIOOGxorQkQ/5VzDnMoa+nYIq1TrNvfX0Tkt
	skdPfAP6m79ev0OF2nPCQedMcF7pjEtrFGWWj3YI38JHN+YcIZR/hYpY1Rxoo/Jw8eIFPqCalH5
	QVD0GqRXt1cGPK1dPDkyX9wlA+6lsma3oiPf2xSsYnRT+DrbMTXU5/pKdEBNYRAGnO3GBdr+nqu
	aehvAu+1vk/NFQe82VTNQqC3SZxdRLVjneEI/K+yf6jnm0bTkvTySMAOme8gJRrY0yV9Ur0=
X-Received: by 2002:a17:903:2c0f:b0:2e1:2ce5:677a with SMTP id
 d9443c01a7336-2e6003b5d0emr12356995ad.16.1791352736407; Tue, 06 Oct 2026
 22:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20261006210313.43163-1-pmazzini@gmail.com> <20261007012337.6765eae7@ryzen.lan>
In-Reply-To: <20261007012337.6765eae7@ryzen.lan>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Wed, 7 Oct 2026 06:58:40 +0100
X-Gm-Features: AclHuK9so5s6SVHKBrMxWd9wydw_PDXudCltTNho_5K9L0MuDF1LhfNqIbWLxW0
Message-ID: <CAAxh=jvd=dR4anQ9P=f=NtUePTfXY0SSR6PXxc8VvDcjP+ni2g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: dt: do not accumulate npins across probe attempts
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_225857_463175_F21E5795 
X-CRM114-Status: GOOD (  23.98  )
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

Yes, that's simpler, thanks. Will do that in v2.

On Wed, Oct 7, 2026 at 12:23=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Tue,  6 Oct 2026 22:03:13 +0100
> Pablo Mazzini <pmazzini@gmail.com> wrote:
>
> Hi Pablo,
>
> > init_pins_table() adds to npins in the driver's static descriptor, so
> > after a probe deferral the count doubles and the next probe fails with
> > "pin 0 already registered". Count into a local instead.
>
> Can't we just initialise desc->npins to 0, at the beginning of
> init_pins_table? I think Sashiko suggested that even...
>
> Cheers,
> Andre
>
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >  drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl=
/sunxi/pinctrl-sunxi-dt.c
> > index 50a16f3bd131..1c1888394cf1 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> > @@ -75,7 +75,7 @@ static struct sunxi_desc_pin *init_pins_table(struct =
device *dev,
> >                                             struct sunxi_pinctrl_desc *=
desc)
> >  {
> >       struct sunxi_desc_pin *pins, *cur_pin;
> > -     int name_size =3D 0;
> > +     int name_size =3D 0, npins =3D 0;
> >       int port_base =3D desc->pin_base / PINS_PER_BANK;
> >       char *pin_names, *cur_name;
> >       int i, j;
> > @@ -85,7 +85,7 @@ static struct sunxi_desc_pin *init_pins_table(struct =
device *dev,
> >        * Also work out how much memory we need to store all the pin nam=
es.
> >        */
> >       for (i =3D 0; i < SUNXI_PINCTRL_MAX_BANKS; i++) {
> > -             desc->npins +=3D pins_per_bank[i];
> > +             npins +=3D pins_per_bank[i];
> >               if (pins_per_bank[i] < 10) {
> >                       /* 4 bytes for "PXy\0" */
> >                       name_size +=3D pins_per_bank[i] * 4;
> > @@ -98,12 +98,14 @@ static struct sunxi_desc_pin *init_pins_table(struc=
t device *dev,
> >               }
> >       }
> >
> > -     if (desc->npins =3D=3D 0) {
> > +     if (npins =3D=3D 0) {
> >               dev_err(dev, "no ports defined\n");
> >               return ERR_PTR(-EINVAL);
> >       }
> >
> > -     pins =3D devm_kcalloc(dev, desc->npins, sizeof(*pins), GFP_KERNEL=
);
> > +     desc->npins =3D npins;
> > +
> > +     pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> >       if (!pins)
> >               return ERR_PTR(-ENOMEM);
> >
>

