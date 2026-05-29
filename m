Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7906DCD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 07:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j149X8gXwUQ+5tkgK+g5qHkOUSrSS7YQiLSxtBB0NMw=; b=IZHUzMdAbgddWgZtPB9sjBO5Lz
	TtObf3Ywfco2EXupFXCbRAyBBsQ0C8N9zTzC6+xeSEozcNa4riIuFrCKC2Jik3ibnZ1b9Rf3NJ6Ql
	3WX0ibkd6yZduRV4t0VCDu+NxuY4W2JdzPdtdRkchTJOKbreEeFLG5vWbx8lPIJCYyPE+X3/SvSFC
	xoJPtFy17BKknhMTtEnn80K2nQczPq+DN4QFETEzAcS58d14IaZ1q2k/GKXtRJEKFHrbaSN3uj41D
	oves3UuQe6s26XyNSnc1QjwLi5Pbt3YvcdhsaEYa6P5EiGj3+/cnWx03GwoRTvqF2qs46iiY4VYc/
	RkTRfLZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrpc-00000006tZt-1mhq;
	Fri, 29 May 2026 07:40:36 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrpZ-00000006tZJ-3R95
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 07:40:34 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5aa4b131940so2927846e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 00:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780040432; cv=none;
        d=google.com; s=arc-20240605;
        b=LER9lMiG2182RLyHDXQlHGWV1pD3cK7nO2sbTIOY9YZimNA6A47Qa6jpKSb6nltLxw
         6MVcWTcg5Gx2aa71+aq4a3GxfyR+mfha7m+A212/YRTbmKyqFSU+4JjpSAN6bM3onihg
         0jNDhngu6uepNvfcNtVz4+rrsv9RjRSKrDjZJanL1C0EoTavc4z2VsoC9WpkgKvxLc4h
         NEX8DQBlf1Q78hLrd/JS468CtZPJyAJbleBtJ0U/8DGTze0oLddAOvOvJwJoCGV48e7y
         vHLuKD/NHFua30Yy+E6mTAEBcje4XznOaIJs7roObwt0QsC3znmDVggW/6tpA6yO24il
         j2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j149X8gXwUQ+5tkgK+g5qHkOUSrSS7YQiLSxtBB0NMw=;
        fh=hepJSU5evqCsx0VvMOJDlJIdGHgn3mgFqarrqysT9LE=;
        b=Io0qixjQm3q360q6nTNg5VrYr823b+bbskfKa2Cy8d/2UUOqOkuAQQF6dGMnLutFOx
         f6ddalOUw64QntVTCfktbDaMfbjifVZvT9fIfdgIL+JqU/TIBT7lsJK1UH2PuwJ+MF32
         K/ieh8Fnc6d0kjr2/ddU0WDdyG8hGf5a2fw5uhYegN3gMLyvxz/gobR5bxb0C7rIos1O
         w5r6Eb4fJTfH67roWSaBchEn9RzuQ3Zjc+YtHR8rMTiflutw7srude8K4Ktz5WK8sQ5r
         NH3i6R+f6S/SNNFZTjaqpgGaaes0sSH9d66WHqn/FMg+XzeNoPCxraVbvRDtHcI9Zrbq
         HkuQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780040432; x=1780645232; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j149X8gXwUQ+5tkgK+g5qHkOUSrSS7YQiLSxtBB0NMw=;
        b=pRbLfr4DXX0XoAJ7Mz+hjgdW8A9tpICC5xgKv/SFaWgeah8lWU3VEbdFEy9yLDsfpQ
         Z9AC+gAanoO0hD4lP8d0brfMqKPeQx5w2NXuphb79nJRq1zukQIl0SoFjzgG6XATnezE
         39NynjPrzoibGH6956u6BuplSZbi85Rp+K1+EVK6oq58crVLqvCl+tbHcJ9Z4JWn9OUO
         2bXYj8SBrs7tnPTllf/gkoqfmTFElur1iYwiMEdQL6PajiWlQs01b2CqxOHSF2xWh/j6
         F13wvdX6Di5GeR3LTanL4oSM5DOUypJZYUd4o2zHyU46VmiO3QmhUWDUYUQSTLJ8qe9E
         OB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040432; x=1780645232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j149X8gXwUQ+5tkgK+g5qHkOUSrSS7YQiLSxtBB0NMw=;
        b=CzeMm6r4j+YEdUZpm46qDChV0zkfBucIP5DYGTAAk99ngHJy3kov9lzJ7SxLPun+oZ
         IlaFaUuunuZkZf2KZracnsbMMRqdLAL7kXEZGlhlmkDnSrvILpiloIw0QZPbjo6w05FX
         YVTHe5fw5yldf3YU0t+1EuPb2ViTZNllhmJWUTWXDt3QGS9u0SnRtYTuINjKxPsEDo2c
         Ui6SA+PP7+dfGXwhAEKdJQuJW5mKsXqDXvS0ZCvctcxIWavjr3w8QAoJG/phfTb6gj4k
         UloqhgJBskBkS2yF4irbMEA+HAZcVJiukyyB3PdzYudjJhz/3S2teU5FuAh5FzLzDMmg
         22GQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ZUa2AGLHC3VQS6UGdG3bR/rZW0NFwAGGocwuIk7HHTi5wQ7/29sSq92McAx1AsusGEvBnUy7M5HHWajr5O5kG@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn4beaxGrHY2P3b9grlQzhX89wlWTzsJIffgY7o9Ir+daA8VsM
	P3Dn5dr0AHvXcUQRAeBQIHOv9DIxtk/ZwkBCYjoIVfkNofisNgoX1XL8rFbTpdtrFMfaSF0XXki
	Yvyv4VumcOn7UpZiEQvJNaY3zk98j6N/bSgM5
X-Gm-Gg: Acq92OGuynhU/4lKQ3yM/yjWQt/1CYFx5Xx6eOnu+xqjM9I3WNLrmbXYudJgedNavrO
	3AMUqdKDo3DNLnYhaGZ6Egozf5KvrvSz+u9CmY+7k+2KhNdUd/cjowT5H6exR8fv7jQIzJTAXcz
	HtkrKuZwfu/2+7lfZR8KW+SZp5h4ZvUndX8YDgODY8sn3lk8K4FvMHDi9tuFgxsP86J55lWUsp/
	cnutUNNVjR05HVxkZuwxN8xZvFQAxTcHEZ/I5D79cHgeh0YAa9jsS3wdoR65hP3cNkeulm1ZrF4
	+QtudwBFaLMsJ1Pc0VsXDO+f05cnO9uMMhGYn8+MeaC3h4SKkaHIVbNrQ/9mtST6E8+GDJGgQuL
	YXSQpyNuSTMVFfdsgt4wNwFDTQVg4/LeyH5f9kHDLOmPMdN6DN8tcwYQZx34XttafN1zJ
X-Received: by 2002:a05:6512:401d:b0:5a8:9986:8490 with SMTP id
 2adb3069b0e04-5aa5948ef29mr474317e87.20.1780040431328; Fri, 29 May 2026
 00:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260528203011.137338-1-rosenp@gmail.com> <038ae6be-03f7-4e6a-8c1e-70cbcf8424cb@kernel.org>
In-Reply-To: <038ae6be-03f7-4e6a-8c1e-70cbcf8424cb@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 29 May 2026 00:40:19 -0700
X-Gm-Features: AVHnY4LCY9FWvT2VC_UvRSAi9rf7pxOk0uNbrtkA8fVCsHKkI-e-ZKd_4cJZWfM
Message-ID: <CAKxU2N8jaG-WHeEpJs_NPKLdB9LP+cxDMhZN_bzX1gnBAhGUzw@mail.gmail.com>
Subject: Re: [PATCH] serial: mxs-auart: fix 64-bit cast in probe
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_004033_883547_75528AE5 
X-CRM114-Status: GOOD (  18.90  )
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

On Fri, May 29, 2026 at 12:37=E2=80=AFAM Jiri Slaby <jirislaby@kernel.org> =
wrote:
>
> On 28. 05. 26, 22:30, Rosen Penev wrote:
> > of_device_get_match_data() returns a pointer. Casting it directly to
> > enum truncates on 64-bit platforms. Cast to unsigned long instead.
>
> This is a misleading commit log. It still truncates during the assignment=
.
>
> > Fixes compilation with W=3D1.
>
> Fixes a warning, not compilation, right?
compilation. I believe -Werror is passed.
>
> > Assisted-by: Opencode:Big-pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >   drivers/tty/serial/mxs-auart.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-au=
art.c
> > index 697318dbb146..de97c0f74e7d 100644
> > --- a/drivers/tty/serial/mxs-auart.c
> > +++ b/drivers/tty/serial/mxs-auart.c
> > @@ -1598,7 +1598,7 @@ static int mxs_auart_probe(struct platform_device=
 *pdev)
> >               return -EINVAL;
> >       }
> >
> > -     s->devtype =3D (enum mxs_auart_type)of_device_get_match_data(&pde=
v->dev);
> > +     s->devtype =3D (unsigned long)of_device_get_match_data(&pdev->dev=
);
> >
> >       ret =3D mxs_get_clks(s, pdev);
> >       if (ret)
> > --
> > 2.54.0
> >
>
>
> --
> js
> suse labs

