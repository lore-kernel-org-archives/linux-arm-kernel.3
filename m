Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6BCCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 16:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qePdh68iZCKwosOGb2v44Bw68AogG3ERpVFmfA5qKo=; b=4iMzUBCfEzGENHp17lWPYUS6xK
	Me5SaIRZiw+XO8LotfeXJ/GRO80mHYGGKPcXbHrR3w0jaMz8YpYkb8S4OiR870pBCTUk+GoV2frs6
	8VIzUfkIPB64fV2wPgRW5sTiX74+AqmO4GnI9KzIXZdNMLaxF2Lsayagi1ZjZNf8MYFTBR7NI/fmn
	aQjAylP70UHjXwMpUAnojMZRcNarV9R5cRwBYntTvJaz+0kO0Vf9XhB3cKWK5+w+muC13JrJrFPs+
	1ng06PL+OEOu/4gcQJjZk9zIdQQDugv2UDVtlIWV5H1cIzdrt/a0yQ96+5vzuOdL+5bPYNqKmRxZf
	YbzW6TwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjL4-000000056Pr-2EBQ;
	Wed, 20 May 2026 16:00:06 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjKz-000000056Ms-2pYe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 16:00:05 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-651c366f7efso5297849d50.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 09:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779292800; cv=none;
        d=google.com; s=arc-20240605;
        b=E9b2YQgsgzluz9nrW+ry2+MYOIIByyhLsbFo+66nbtIfB4fYAR1ORg2LRaTDugJEoN
         2KhdhNlEJF3SwN0qsF+j+CTm4nkpf6kr+X98FFVpjEXKMTMGrDB9IhVAQcwlaelA0poI
         LoEQknKHczvUoECE93w7Gm4O+e6G+WRQuIBPPKonSMTqxqo0MapSZkfpLT2MxO02fcR3
         IZOD9x1rQ1S/h5bpU84eoYG7Xk2xfm+P+lY+QxWlRSJAe5SEdmKY/CQqrMIaOVGUhlgK
         RSTtI7XrPVfOZrDuOC6UANt/8X6f9TxfL3V715fTiJG5QouqJn/sgo1gBZj6M7wRwI73
         AJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/qePdh68iZCKwosOGb2v44Bw68AogG3ERpVFmfA5qKo=;
        fh=xGwawaVFg3Ilq2BjDSzZmHMpH1oeYDZ5qs8zSxFKbWQ=;
        b=gpY8Yaw01UHDJlG+PfBOGAeC59X0ePIPzMOb7KRf4DXXZxotlN5QHLCBjIEdhoqJCr
         BN0bxe6ttucABUKUMBEtaijkqNwxNSgiBeQ8KFfXjwbks15Fj5+8mbgoisxvOGZO+WzA
         brY+NCeoGSIYF4Tc2vUqgjkXbQvlTaTPNnBJvg7qiZPTkhpA322kQen9FlDqAgKZUWOB
         rcPV9pm5uFt1YQWx/JtLE8zUgnyBWLi7X8XYy8UpcB+nMeW2EPJuwq5TPTp5VdS7PCyW
         UJTU4/mahPIyugCyT/FCGPvCnh/oj7DYuH0jj9fGAT2hfDh/RDVrGGZGw30cWCKzkyJb
         S2FA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292800; x=1779897600; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/qePdh68iZCKwosOGb2v44Bw68AogG3ERpVFmfA5qKo=;
        b=XaLjUw6G9/86M4gFsx5OqpH5zTKmxvOapvIP5XItq4zwOe5EseRRnnEugOWHmUaobr
         rJoYGvfEXNZamgFzY+bx3tWoZgZBTGfkHU1n+ocDebuCmVaDEK+jWxtSgUt092C4MFkw
         SB/vzv7UDYzZny6C9WKQn0Hm1DYaO/v1jedwojXtgLfTTWYZCxwsg6Af0yOWKFPZDvSb
         GjNxb16UTfCkUDsSc1h69hDahjeyKTsGFO8M0WJ/Al2tGh/KfaPgmakNbuz9hwIslAvV
         TtQTyCefre8tzSb52mgIytihUuPGHANO+oefF4NgF1dFAWlHNs8zpQCMonA+Y5j9o72I
         IprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292800; x=1779897600;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qePdh68iZCKwosOGb2v44Bw68AogG3ERpVFmfA5qKo=;
        b=l+ilZRHL5NOuJQXGA5U2McLUjZ9h/34+AXLGoH1NXBaDiXf+13Kumt+ePWWbx5mLT2
         KdUbog1ULLu9G8JqOa0DgSBfuK0crSO+dAYnnMMxyiT5eJCD5rxMc32fieDVlsB3iZrb
         u5tQro8SSFuAXZcbiboWBgws1nCikRXYmDvjsG3kakK6tJhVVH5SF1S1syVTdHNtjHMY
         smpajuHCUxPT3/G9Nk7YYD67kFZIBlYEJ+w/xOA8CtKTe4TIYnUmri2iQyRqBGj9iQYY
         /XtHa8TKwT8bjVzTCkBeTfrXxE2xhylTMKe6b5XToeKp/3/7QNzs/3rUn1VQsaaiktOJ
         O7BA==
X-Forwarded-Encrypted: i=1; AFNElJ8HlSU4eDJ3Fw5gNQBgzB4Fu/RRKyFg3m3CWvxDQPI4rFIWnoJ2/u1qxuuR5LVqRTJ/UHZFfiSy9xDYl/eNeP+U@lists.infradead.org
X-Gm-Message-State: AOJu0YwC5kkQ0ZaWmInUdOm33W9Ozv8eVnrkaX7u49OsNB4GJ6ypN1L9
	03KDFPkWlonKk+hNbTtXSNydVDkp0UJK0QB8dnXYbww8z5a/HtdVXLU4d0eoChE2fZGh/4tqJX4
	0GtPWP7jowsjyPfVmOVreLRarxsBTFiE=
X-Gm-Gg: Acq92OHyzqL4t0O5XNyVLUpnd3n7hQs3U62/WTEpMMvYgA/XcZGDRmbQKKUqlab4cCO
	8mgCyVctC8bMO6M7abECvOQZPyhIVssJ8WBRej3soIbyMX9uox79Kw7scniRt6y6XlV8W1zxrv0
	5k+8W0GeXbgdlXy7LQLJl6bwG7446LRuKetMxyt826T0MYkOI8lQFYFd3hWF6bT3LKfzjNzgsXS
	Cj3MpTbffcOnSVNxi1mXnxysk8xXhWD2ofFlAV5jwJwY1cSZ87W5Hlk8TwvQRO3PgMJZsk19vIR
	55TUiiip
X-Received: by 2002:a05:690e:bcb:b0:65e:55bb:d5c4 with SMTP id
 956f58d0204a3-65e55bbfaefmr13936717d50.48.1779292799759; Wed, 20 May 2026
 08:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20260518130946eucas1p1a8e6673355aa1b2f7bb35f9070f289ce@eucas1p1.samsung.com>
 <20260518130929.1003652-1-lgs201920130244@gmail.com> <38f2ff7f-ee5b-44e8-972b-107b73dccd31@samsung.com>
In-Reply-To: <38f2ff7f-ee5b-44e8-972b-107b73dccd31@samsung.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 20 May 2026 23:59:45 +0800
X-Gm-Features: AVHnY4Idw_mAdZpVPyN7nF09r8RstUgNxjmwYh8BVbbirhp3GoFHnjEdp5i7LWg
Message-ID: <CANUHTR-RfWnoMRRAoDb6CPZsaiAYBLy61dd0P6TnKYgjNeBWpA@mail.gmail.com>
Subject: Re: [PATCH] media: s5p-mfc: avoid double free on video register failure
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_090001_729754_89D582D4 
X-CRM114-Status: GOOD (  28.07  )
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

Hi Marek,

Thanks for your feedback.

On Wed, 20 May 2026 at 19:37, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> On 18.05.2026 15:09, Guangshuo Li wrote:
> > s5p_mfc_probe() allocates video_device instances for both the decoder
> > and encoder and releases them from the probe error paths if
> > video_register_device() fails.
> >
> > This can double free a video_device when __video_register_device()
> > reaches device_register() and that call fails:
> >
> >   video_register_device()
> >     -> __video_register_device()
> >        -> device_register() fails
> >           -> put_device(&vdev->dev)
> >              -> v4l2_device_release()
> >                 -> vdev->release(vdev)
> >                    -> video_device_release(vdev)
> >
> >   s5p_mfc_probe()
> >     -> err_dec_reg or err_enc_reg
> >        -> video_device_release(vdev)
> >
> > Use video_device_release_empty() while registering the decoder and encoder
> > video devices so that registration failure paths do not free them through
> > vdev->release(). s5p_mfc_probe() then releases each video_device exactly
> > once from its error path. Restore video_device_release() after successful
> > registration so the registered devices keep their normal lifetime
> > handling.
> >
> > This issue was found by a static analysis tool I am developing.
> >
> > Fixes: d0ce898c39bf ("[media] s5p-mfc: Replaced commas with semicolons")
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> Frankly speaking I don't like this dancing with video_device_release_empty() and
> video_device_release(). I would rather make video_device struct a part of device
> state and use common release function.
>
> > ---
> >  drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
> > index 32eb402d439c..75abb0a8b7a9 100644
> > --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
> > +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
> > @@ -1376,7 +1376,7 @@ static int s5p_mfc_probe(struct platform_device *pdev)
> >       }
> >       vfd->fops       = &s5p_mfc_fops;
> >       vfd->ioctl_ops  = get_dec_v4l2_ioctl_ops();
> > -     vfd->release    = video_device_release;
> > +     vfd->release    = video_device_release_empty;
> >       vfd->lock       = &dev->mfc_mutex;
> >       vfd->v4l2_dev   = &dev->v4l2_dev;
> >       vfd->vfl_dir    = VFL_DIR_M2M;
> > @@ -1395,7 +1395,7 @@ static int s5p_mfc_probe(struct platform_device *pdev)
> >       }
> >       vfd->fops       = &s5p_mfc_fops;
> >       vfd->ioctl_ops  = get_enc_v4l2_ioctl_ops();
> > -     vfd->release    = video_device_release;
> > +     vfd->release    = video_device_release_empty;
> >       vfd->lock       = &dev->mfc_mutex;
> >       vfd->v4l2_dev   = &dev->v4l2_dev;
> >       vfd->vfl_dir    = VFL_DIR_M2M;
> > @@ -1416,6 +1416,8 @@ static int s5p_mfc_probe(struct platform_device *pdev)
> >               v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
> >               goto err_dec_reg;
> >       }
> > +
> > +     dev->vfd_dec->release = video_device_release;
> >       v4l2_info(&dev->v4l2_dev,
> >                 "decoder registered as /dev/video%d\n", dev->vfd_dec->num);
> >
> > @@ -1424,6 +1426,8 @@ static int s5p_mfc_probe(struct platform_device *pdev)
> >               v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
> >               goto err_enc_reg;
> >       }
> > +
> > +     dev->vfd_enc->release = video_device_release;
> >       v4l2_info(&dev->v4l2_dev,
> >                 "encoder registered as /dev/video%d\n", dev->vfd_enc->num);
> >
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>

I agree that switching between video_device_release_empty() and
video_device_release() is not a good approach. After looking at this
again, I think the real issue should be fixed in the core error
handling path instead of working around it in the s5p-mfc driver.

Please ignore this patch. I will drop it and look into a proper core-side fix.

Thanks,
Guangshuo

