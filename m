Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B564C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tY6y2m6mRP/UJJ+mAovKHgHIAfizO2XUbqAv58WxDvY=; b=q9WZptNUmdy7k/w5mCbab+D/Xu
	U4Vacb0jC/yJ2v9Y6YWoDLWQ+H4Fhakl9+X8r3w3s9uHJXlXm6NQbeyqXAtGvZsUOUALgm7B1p8Mw
	kP/7WCO8cDDA2DDlKwx5Sc+3QhQqIr0qVK1W90NhrY6cAlpkYxNv1IAsIFNfsoAfSHPxnzZZ9Bl7s
	NagDIJz5/amcmzD/ZEiNYSyF6uYA2zjwFnTO7lQwRj/AHTSyqDty/SpOvc/GnWG6RJoT0hL92lNJ4
	lHkhSXhdOQEgxZ4L5JxzsUR/CvksA4jbGanjcqkM2B7XZEDc+lO795fDcjzZm5Z7YgBjztCttDfyw
	CBxJboCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrDc-00000007RLL-0kIr;
	Mon, 20 Jul 2026 16:51:52 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrDZ-00000007RKG-2VV6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:51:50 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c197e7e4e94so152987266b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:51:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784566308; cv=none;
        d=google.com; s=arc-20260327;
        b=QfYkjJf691XbSk2wRHnQ4BVxz4FB+ickXKlOThCuB9XNQrN7csQKxw4qDExKbnIxsD
         aMQgM+eK1nmEbu50dfskGg1gKnuFHT7eEJD7rlJLZRfWn8fTeeOt10dhJ1GSFtSmiFNv
         nydyKuOCHaqngi+PHBwopApe3M5tOgf8CvBa3cujSEsN0cNnp6cRtqbBcGK5PHQEHasD
         9mBCwn+chMrx3u0/ycpxzVJ/yYWI0P7dhZHymWSOP4j9m4mw9+RhK8tYxoBkLu755Y0E
         uSwCV2EtxM2jNOiTJ5GWgXPbH6ovtovt9oHDMes1+Ck8WF0fG81nndtyFGXx7l4aHCmE
         L2jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tY6y2m6mRP/UJJ+mAovKHgHIAfizO2XUbqAv58WxDvY=;
        fh=Z9Y8APkpGFNr7u+gHtJNeQel0k1cZv3u9uxm/rWpCRA=;
        b=bnZU1rvZQWUdu/w+PwHfnd9YOFd5IOCgA8mHfGOmn/n97mt8deeGUu3HfgGAhnV7R8
         4cmmNFblWFhuFS9RFhlss+sg3XZ8dv02KNEDMR5UKws1LKGB+IVv0o99n4GqJodAVJJD
         fRDIzvW4wIAZIc3ZR6Tw3tXkzy7VSGs0ipvWILf4Zbjo1MIinloN59TThv2Baq31l8xf
         /AuWtG4WR1LZ5bsfSamvWcinpJrs2QeGrhITWjve8EvLOJqbnq2WK5k+SBNLuKXpwyMd
         J8SxO3REPcrEpfMrvBxmEpMOUMVWVfFK5gv+zTMshbtp0BueB0+Wd8z4jg4Y5mfOzIp2
         6B7A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784566308; x=1785171108; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tY6y2m6mRP/UJJ+mAovKHgHIAfizO2XUbqAv58WxDvY=;
        b=OoEf5Q8eYT/sOIu5Rg/NGyicwrJYT0fz8TEny/y0WU7yioiWrEp+lP5JcLdxz1H/yv
         InCh8GuBKzjnzlevY8D1z5rmY96E9Kqh1RtzHhCb2FlYwrdNpRAgzoOl9pSCIsTQSNw+
         btzZ+KykeoFA/H5iauOrfo8YfuIenv8sGj/I1dJtSPFm1ZqxdypTQoW2FvAx5258tU9T
         huCotzUpetnx4uSt5OS5ZGt+oIXBhyuIGMEbWYprsosvwhWEuyIkDDIXBYbyrR5zYNUV
         8mptj8bdZBR/07hP4zXIaIJHCDiGqNlbax6nC9aWCHASxIFUki6mNqdU92cGPiSMrSDx
         7YeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784566308; x=1785171108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tY6y2m6mRP/UJJ+mAovKHgHIAfizO2XUbqAv58WxDvY=;
        b=An2yVnB0hfe0AuJ0LrDSWRuKl3QLjmcIwevOZvHKJbS7Jy9BHTflKJ9zoz4P1A7Agc
         +3wZxrIgSBYiqwD0JBiM+nDoET3bbSp0do9juK+zLwzw3Xc+cm9u3TU2nLAYOQVz1j1G
         jvN0KEpMmhRIBgwKQ+wEZeHjRuxVhBmrAcd3tv0olOF0ry0BI56rzsM0qu1CEiUcDHVR
         U/XtvP6S7d5oQdXFLxz0aBItTFdYoaWnIKI/Aev4Hrj589xpy7RqFI1eqUuOYWtnDpF/
         IzF31tjdB47wDkKN+JnxJrHCwTfz9tP9+nqbMlEQuxiFKPISQVuyp5Y/+oQQx0apeT04
         o42g==
X-Forwarded-Encrypted: i=1; AHgh+RqzAgx0qjnd39HoUNgHP4bs4eo/RmP53SnYZGCI3VGKHHyKmp3WP7S7RehGT4pfXijWN9dX10V+cPreu4hSlPOu@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh4U71WVDKpJn1K4AYwVAnAWv7oYbVqtxHQsG19XiGV1gncsoI
	ji1qtCTKlxa48Yrj6CXqPQua5PgWR3zT1jGMLdmON0e2myKeXG95YPZym2crjCnD7k62TLU9GQ/
	LcGbCIzVfYnxDCXNti+fhku8Uxifilbb5YiY38nZP
X-Gm-Gg: AfdE7cnv2DW4EA4/jZWCXSJQBeCKcpMKbnqyWjQfBL7ZY7rr2wdwGNR6bfk7KAPYb6Q
	SzLD7h9qjSLvaPyVpe7bW0t1o/KRgOkMHz6onSgcaAknst7+foG9jSpAoUielzaaFxdoZpYnbmk
	86NAGMNfRqO3lQ7ilT18dv7tc2ltcHPrSpDgSgiwUPkljgyKwm40ZXtnYsdsgpT2aGSmpCwsEVe
	htW8DYS0GybeAjg0uEveZTd7MzFcXCRkaOPitwnPGo34rj6B6KNBGZjITMN84Zh44KbuftCi2lq
	I54Vvj0ZzSgZTUZdklUtNr6OPUjts7cwJlN4MMesTh1i+fKbtt+0J0FBfq8HaK7NP5V0qsC02u1
	K
X-Received: by 2002:a17:906:ef02:b0:c16:5e73:b3e3 with SMTP id
 a640c23a62f3a-c16b46b6f5fmr615505966b.7.1784566307098; Mon, 20 Jul 2026
 09:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260717141648.1007059-1-linux@yoavmoshe.com> <CAKwvOdkGYLWAR+5q+XaO6VZc3-sGEm0nX0MvXoJOghx7Gn1tRg@mail.gmail.com>
In-Reply-To: <CAKwvOdkGYLWAR+5q+XaO6VZc3-sGEm0nX0MvXoJOghx7Gn1tRg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 20 Jul 2026 09:51:35 -0700
X-Gm-Features: AUfX_myHGrPuTu_ujS6tW3mC0SHvE_GdWe_YqayLYt46d3sdd9_DfoxWORNfKQw
Message-ID: <CAKwvOdn5xgtqv9NvMew0yBnH5E0xQMLaX+Z=bX3L_a9_K5orHQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_095149_649892_EBF78F5F 
X-CRM114-Status: GOOD (  21.84  )
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

On Mon, Jul 20, 2026 at 9:49=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Jul 17, 2026 at 7:17=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com>=
 wrote:
> >
> > Relocated suspend code in OCRAM lacks compiler-generated CFI type
> > signatures. When CONFIG_CFI=3Dy is active, the indirect call to
> > imx6_suspend_in_ocram_fn triggers a strict CFI violation panic.
> >
> > Annotate imx6q_suspend_finish with __nocfi to bypass CFI checking
> > for this specific indirect call.
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Yo'av Moshe <linux@yoavmoshe.com>
>
> Thanks for the patch.
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Ah, looks like I'm reviewing v1, but there's already been a v2 and v3.
Disregard.

>
> > ---
> > Tested on a Kobo Clara HD (i.MX6SLL SoC) running postmarketOS edge.
> > Before this patch, suspending the device caused an immediate silent
> > hang requiring a hard-reboot. With this patch applied, suspend and
> > resume work successfully.
> >
> >  arch/arm/mach-imx/pm-imx6.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
> > index a671ca498..d9b0c1803 100644
> > --- a/arch/arm/mach-imx/pm-imx6.c
> > +++ b/arch/arm/mach-imx/pm-imx6.c
> > @@ -360,7 +360,7 @@ int imx6_set_lpm(enum mxc_cpu_pwr_mode mode)
> >         return 0;
> >  }
> >
> > -static int imx6q_suspend_finish(unsigned long val)
> > +static int __nocfi imx6q_suspend_finish(unsigned long val)
> >  {
> >         if (!imx6_suspend_in_ocram_fn) {
> >                 cpu_do_idle();
> > --
> > 2.55.0
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers

