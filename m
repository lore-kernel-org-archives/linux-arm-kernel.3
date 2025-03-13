Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC3AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 20:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VnjZC6vr5EXhWiQG8PDbTXzoInugv5bUtef8UzNIT4=; b=U6ku3+Xd9tkYnJao9SxPY6Gr1h
	qB7z8K9vZuAwYuRscxIrxIAxBylSjfKQeMVrEazc4COJxxrXYgUubl4pz1jacAEZxJ+NXORe5ofF7
	VO0MvU4Jureu30uvixuirUYpHbFNKB3K0Ksg+O8fUe2/13snWDtY5fxr4ADccKGhTfl87Q5zih/a5
	oZay35WlFtx7dbdV3p5+lRYJSOW/iJPywLpLk3V4JSsABsm7XBIDz5+Ui2npDXtfqlAvgclQu2IJ3
	tUbsG2a8S9McZ5zUBdD/XfhkXLWsebVWHKAk9Hen2DHb7hutg8mQZbjIkttGAf7ja6HPauwutOAnU
	b2ekw8xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tspQj-0000000CSy8-2AV7;
	Thu, 13 Mar 2025 20:45:25 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tspP3-0000000CSjW-1U5Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 20:43:42 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e5dcc411189so1298893276.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 13:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741898620; x=1742503420; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VnjZC6vr5EXhWiQG8PDbTXzoInugv5bUtef8UzNIT4=;
        b=lwaeCaLb9OnT/QkWVatCMNNZsT30NnO/4TIeFKrrdTQZ6topNvgLVLE2yhkQ3OBJQh
         J4IugHycinED49XFPIgS/xRnHGhqnLDcYpVPnD0B9v3LVPVXB/f04IhJBsxyybIfwG+l
         O8tmR2QcpPpC1aSuTXj7SnDmSUC1Etx5aOf7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741898620; x=1742503420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VnjZC6vr5EXhWiQG8PDbTXzoInugv5bUtef8UzNIT4=;
        b=rpTCpniBYae32h3gtWGR4bBIfOPMCrDl19phL9pMjRMkytO9nfWYgZ43SnI6v4UuKL
         AWoGkKMmnMMBKu2/fPxHZtwCBzfaROkf63hMb3X8mIDwatnQ96FsQ0giMs/lJzqULQL9
         vC1yTzxS7KHgEyOUS1dKk1XxPNGKe957VKyTNrKB5rrQzgjupPFh5O4c1x203oKiRJAR
         vZ07ayl5B4ykNoVWY73kWBX2Pzkcwi56fLxF2yHfT5rsyXoetsZ2A06kC89NKmlldzGK
         XAyKUx8r6I+ANZm3ca4XJc7x+gVIcOMCtrxHJLEfBJq1nqgfGofw/y8Li+oAM0AWMMC2
         hGZA==
X-Forwarded-Encrypted: i=1; AJvYcCUJEf0W+3+6cia1QU1LaPix9GyS+7PAIREhK9t/eYu8UQi7REofHbRI+N8WiDbTMgN96HO56DgRuDzFQ3zJfUV6@lists.infradead.org
X-Gm-Message-State: AOJu0YzHcS3Nd/gc/H1vsRSnU3TIcJQMW80Cil2X1IKE+FYgqJm5U4lo
	unmP79DM0Xd/DNhAOYGlxoyOyCmAIiknfNL3gw44OfYV5SKnvSh1bsDLgDi0Lg3bpKxLUteRzZt
	AMEFVds3r7MKSGuczJ14Doy4xpBHFsVhUtj63wg==
X-Gm-Gg: ASbGnctFQUUneX0oeUBkT0a47ov2ueUqAChBP7VKst4cyKjx1nSIvGd8WJNt4XdN07b
	dWyzs+fMCADyEtCpMFuhKXfYi8UDrugYZ4l/h9y4ULPdTLJxfu9btvM+itoFH7lDoKbAH3UzeuU
	4HDkMxvBuYMsf/9qbvq165ZnlCCisQWG+JQjtJosFeKFZG9Khw0/96djYdjg==
X-Google-Smtp-Source: AGHT+IEEE4ZRBNeQADkkl6AKxkknaNJwbIuG665QnVzs56LBEdogUl2yhgopg+J6ZxgJ7v7x+mgi2noSX4lE2hICHLY=
X-Received: by 2002:a05:6902:284a:b0:e5d:b7d8:ad3b with SMTP id
 3f1490d57ef6-e63f6519314mr51690276.19.1741898615842; Thu, 13 Mar 2025
 13:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250313-mxsfb_probe-fix-rollback-on-error-v1-1-ad2fb79de4cb@bootlin.com>
 <468c6352-3301-4f0b-a2d4-d6a013417a0e@suse.de>
In-Reply-To: <468c6352-3301-4f0b-a2d4-d6a013417a0e@suse.de>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 13 Mar 2025 21:43:24 +0100
X-Gm-Features: AQ5f1JoTykMqff1C-O-bh1Cbl3u9Tnh0pBlLKwre0Ge4smXB9EbXTEwKnEK0dhM
Message-ID: <CABGWkvqtj+05sdOuXg1WO99VNm9qdFgcYWEGuUPPZPoHZa6Dew@mail.gmail.com>
Subject: Re: [PATCH] drm/mxsfb: fix missing rollback on failure in mxsfb_probe()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Marek Vasut <marex@denx.de>, 
	Stefan Agner <stefan@agner.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Michael Trimarchi <michael@amarulasolutions.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_134341_384970_173B5612 
X-CRM114-Status: GOOD (  30.21  )
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

Hi All,

On Thu, Mar 13, 2025 at 3:40=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 13.03.25 um 15:25 schrieb Luca Ceresoli:
> > When aperture_remove_all_conflicting_devices() fails, the current code
> > returns without going through the rollback actions at the end of the
> > function, thus the actions done by drm_dev_alloc() and mxsfb_load() are=
 not
> > undone.
> >
> > Fix by using a goto statament, as done for the previous and following e=
rror
> > conditions.
> >
> > Fixes: c8e7b185d45b ("drm/mxsfb: Remove generic DRM drivers in probe fu=
nction")
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> > The offending commit is not yet merged into master, and even less in a
> > released kernel, so this does not need to go through stable.
> > ---
> >   drivers/gpu/drm/mxsfb/mxsfb_drv.c | 7 ++++---
> >   1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/=
mxsfb_drv.c
> > index c183b1112bc4e9fe4f3b048a2b6e4c98d1d47cb3..b4273e678d26dbc3dee2014=
266d61470da4e8010 100644
> > --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > @@ -365,9 +365,10 @@ static int mxsfb_probe(struct platform_device *pde=
v)
> >        * located anywhere in RAM
> >        */
> >       ret =3D aperture_remove_all_conflicting_devices(mxsfb_driver.name=
);
> > -     if (ret)
> > -             return dev_err_probe(&pdev->dev, ret,
> > -                                  "can't kick out existing framebuffer=
s\n");
> > +     if (ret) {
> > +             dev_err_probe(&pdev->dev, ret, "can't kick out existing f=
ramebuffers\n");
> > +             goto err_unload;
> > +     }
>
> I must have missed that when I reviewed the patch. But this call should
> happen much earlier. right at the top of the probe function before
> drm_dev_alloc().

I had added the call to aperture_remove_all_conflicting_devices()
after mxsfb_load() to
keep the splash screen loaded by U-Boot. So, IMHO, it would be better
to add the
goto in case of an error rather than moving
aperture_remove_all_conflicting_devices()
to the beginning of the probe function.

Thanks and regards,
Dario

> Conflicting drivers need to be kicked out before
> setting up DRM. Could you please send a patch to move the call to the
> top? No extra cleanup would be required then.
>
> Best regards
> Thomas
>
> >
> >       ret =3D drm_dev_register(drm, 0);
> >       if (ret)
> >
> > ---
> > base-commit: f9f087d946266bc5da7c3a17bd8fd9d01969e3cf
> > change-id: 20250313-mxsfb_probe-fix-rollback-on-error-3074b9080f34
> >
> > Best regards,
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

