Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545DCCD5BCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 05:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2duKumKePn4zoDG7Cxt1kGXnqGO0J1TlCgaAU7R0q8g=; b=1DzAAQH5KQ5O46ZyoSe23umDGP
	SM0yIBnV1OZgnMt24OLPhWP0do1HeuTJiGuLjpy/Y/+5y2Dy0etHdjm1ekizMaCT4Ib237+Rt6hZW
	GhLpZQEf6u0zRBm/Zh3BOxQti5apOE2zTPsO+rk6zHHWVrSz2wHdgfvSRICbMnYODkCRQidN2pVJA
	UyNtQb/rcP7zljbV62TZ+fn8q1Mg8aJH7Z1DilwNRqAsnNrVika5qE9dZf0ZADhM1aa2eh0O8ETHK
	9u88g6LmgHXGfpSRq6fsADxbslPencWhA2AqxBHeiH+hyQyswn+M0xD9JLQTJtHsFpruX2i3g4Z/I
	iE+OvkXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRkil-000000016kw-2BIf;
	Tue, 26 May 2026 05:52:55 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRkij-000000016kL-2Tbz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 05:52:55 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-65318dafbcbso10136392d50.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 22:52:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779774772; cv=none;
        d=google.com; s=arc-20240605;
        b=ZJY1d/+PGH2Oo565OuTV+RZ9pHfwQX9wp9Pstl25h/zN72mTn2CWJq/NZ94LhZasYP
         FTVVu22p8VOfA+uyTrOy3d3kgYWqHLPKGPv3aLUbrXs4mEcP1vh9Gfq0um+WQp1JmF3M
         JfqaSbLXVlvj3nFg19snvBWTuerlWEz67w8Wpkk4rhSYiZY3U9yWHZHX+BfY53+DgZl9
         XTOIohP8SULeDmrm6MQndO/mP6Lm6L2Y88MmfWr+9HUxh1jWFO4VF1NgVTxdwoF+cMTk
         HtqBiEMRTnIWSCR/OJrsxiEoBK3n6VKyye0Bux4l30napoaXdHBHZSgRZpcU25M51/UY
         lYPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2duKumKePn4zoDG7Cxt1kGXnqGO0J1TlCgaAU7R0q8g=;
        fh=GyzZHtzC2kCO6TlU6ZMNyz3BqvU8Pzy3q9GZ65a/f5I=;
        b=M49OBO/8veoMs/DdPFbiPA8JydVybOHe58hl9NmoR1F6+t8AvO3cc8EjC5rLUpYLb3
         5qKaPpfjlfIwJHxdvV+0OAH1dnmVJme9Q4TtUjf9+xnoBVYRl0d4J0vVTI4YhhMKLCz4
         yEDH37Gh37v+tkaaMqzcGnepl+SlutqT1lT7SgOBqif3C4/gfW5PLKlA6uUQDN6KVFha
         kB4VtwKxBLAZmSOzSTFlCxyTwH+BaarCdFfvX8tsXL6x9oJPzd0DhByeyICUL6gZ0E5h
         FiPV9rVqzDBo5mwHXPIQc9B49Nnu8YZphJD4b3Qbuyb6DRy/U53aE0AgqrN6bs3/eBtC
         j5eA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779774772; x=1780379572; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2duKumKePn4zoDG7Cxt1kGXnqGO0J1TlCgaAU7R0q8g=;
        b=Pz8rPTPNwpOMS0ooEPyMcm5cnGuJUrtUbEiwQ8AfzoPWpeEEV9yVOxNQ/LSAGVh0i/
         X5n3dAdL+pNSC4pTQKs0Bhrp1L8ASctSeevj3tdWEEZIYx0JwEbtvBVulC2m+Vvdji0W
         pwW6k1kanYLyuTl979+OjqGmaS79fEb+Cv5WWTPXyIx2kAPlss4pgjcrA/HXFtqt/jp3
         xcO2GlTe6F6VPyd/bD2XBQIB96ULRhLehDRbHmWbhc19AWbMqEMDmK0k+0wmxW6u9UmM
         txBAYtY/oassNlSRM0Jw2qf7oYd+j7hvi/uWQDxOLGYDi81udtIt9c2/cqWcgEpD4goE
         CyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779774772; x=1780379572;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2duKumKePn4zoDG7Cxt1kGXnqGO0J1TlCgaAU7R0q8g=;
        b=VjSoIvvZU4qbBcQhmcPQU5WkYUjZVtPKaqWwxnEEwzpZsp82OOnbTKSYE2erNPnbdG
         ECAjw0B1OBL9lng6Dh55vQn0ww4YrpVBBQ+ql2U2vcnTCXqzPWt8kxUPDS/aGp9v2XYI
         jrq7+rQsWQoKJ6Jl7Em21TKJQBth1TMBY2FUtROZTY4AE+PRqO1jxellCvbNiLZqm7NR
         DuIKamrkoMxBCh0cZ/3XYgDulRmnikZbtvKvdY+320Xo92AkCvgtTTJyl0YRDnNjB8BE
         TpihvUoPIPPPbCFuAsQuOo9z4/kqM0Zux0Zc+VLo4LHtHVCVPOnXjzByA7oMx24ALnEi
         DJog==
X-Forwarded-Encrypted: i=1; AFNElJ+w7jAvs9EsFVy/Fipubyj0p6SaZHBX5xpjv63VdMqy9J2gOGrh+LlGn6yrXp0nLAs+MxIEx2Z2rqF6TJSzSBqh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/1ewPjzeIeEOzyNRkyiuYqIS0kfToSn3/eAHiiP2aRzwWIAje
	V42SddL2c9FQEVot88V2c0eFf9Jym5ls75N22qnr83WJ/8+VMdbOouarinTgKKjRdzHjH3ynSR/
	a9myIba/ut2yh0g476De1Z6Z9CpztJK3TFanW
X-Gm-Gg: Acq92OEQpm20GbazkjBmroOfM+pEu2fCLNFskbu3oMa6rWfcpHjPq9W6Xr59mJigH5x
	deLmSsZDKq9U7GCFemNcmpaa46fNfW/ltYitHG8CTAJ6QrCumhnmajYr2FunZsr/tuHqeNHHlzF
	CmOb2hekw9e3ocQVm7acb1vlmdr1eWodq/WQ3ebX1wqvv6lKN/3bKPyjWymS9w32wlf1RVJ1EGG
	CYvE2uYJoKQBuVbheUcIMvxAs1slzhDcW+ClpaBFpqG4zOA1BMGco+Ui0sRyZyvFmpyImRNyPFU
	kOJtZgl1pbbz
X-Received: by 2002:a05:690e:11cc:b0:651:be68:77e3 with SMTP id
 956f58d0204a3-65ec98a2a85mr17519833d50.31.1779774771987; Mon, 25 May 2026
 22:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260518130259.1001956-1-lgs201920130244@gmail.com> <824d2c59-d355-4f8c-a602-bc08e49d52e1@nxp.com>
In-Reply-To: <824d2c59-d355-4f8c-a602-bc08e49d52e1@nxp.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 26 May 2026 13:52:41 +0800
X-Gm-Features: AVHnY4KKr9sNKWxiy0Iphg81sV9b0GYog6HfF4iC0Ir_KdVPm-LnQZBI08OEfrU
Message-ID: <CANUHTR-_bAft05ycvb77QP2ck5PNpFcT1nmDQ6WMhe-rD42gmg@mail.gmail.com>
Subject: Re: [PATCH] media: imx-jpeg: avoid double free on video register failure
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Hans Verkuil <hverkuil@kernel.org>, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_225253_745598_FB29A9FC 
X-CRM114-Status: GOOD (  32.67  )
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

Hi Mirela,

On Mon, 25 May 2026 at 21:57, Mirela Rabulea <mirela.rabulea@nxp.com> wrote:
>
> > [You don't often get email from lgs201920130244@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
> >
> >
> > mxc_jpeg_probe() allocates a video_device with video_device_alloc() and
> > releases it from the err_vdev_register error path if
> > video_register_device() fails.
> >
> > This can double free the video_device when __video_register_device()
> > reaches device_register() and that call fails:
> >
> >    video_register_device()
> >      -> __video_register_device()
> >         -> device_register() fails
> >            -> put_device(&vdev->dev)
> >               -> v4l2_device_release()
> >                  -> vdev->release(vdev)
> >                     -> video_device_release(vdev)
> >
> >    mxc_jpeg_probe()
> >      -> err_vdev_register
> >         -> video_device_release(jpeg->dec_vdev)
> >
> > Use video_device_release_empty() while registering the device so that
> > registration failure paths do not free jpeg->dec_vdev through
> > vdev->release(). mxc_jpeg_probe() then releases jpeg->dec_vdev exactly
> > once from err_vdev_register. Restore video_device_release() after
> > successful registration so the registered device keeps its normal lifetime
> > handling.
> >
> > This issue was found by a static analysis tool I am developing.
> >
> > Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>
> Hi Guangshuo,
>
> sorry for the late response, so I assume this patch will be dropped in
> favor of a fix in v4l2-core, as per discussions here?:
>
> https://lore.kernel.org/linux-media/20260519090819.1041314-1-lgs201920130244@gmail.com/
>
> Thanks,
>
> Mirela
>
> > ---
> >   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > index b442dcba02e7..fe8a373576ef 100644
> > --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > @@ -2943,7 +2943,7 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
> >          jpeg->dec_vdev->fops = &mxc_jpeg_fops;
> >          jpeg->dec_vdev->ioctl_ops = &mxc_jpeg_ioctl_ops;
> >          jpeg->dec_vdev->minor = -1;
> > -       jpeg->dec_vdev->release = video_device_release;
> > +       jpeg->dec_vdev->release = video_device_release_empty;
> >          jpeg->dec_vdev->lock = &jpeg->lock; /* lock for ioctl serialization */
> >          jpeg->dec_vdev->v4l2_dev = &jpeg->v4l2_dev;
> >          jpeg->dec_vdev->vfl_dir = VFL_DIR_M2M;
> > @@ -2962,6 +2962,8 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
> >                  dev_err(dev, "failed to register video device\n");
> >                  goto err_vdev_register;
> >          }
> > +       jpeg->dec_vdev->release = video_device_release;
> > +
> >          if (mode == MXC_JPEG_ENCODE)
> >                  v4l2_info(&jpeg->v4l2_dev,
> >                            "encoder device registered as /dev/video%d (%d,%d)\n",
> > --
> > 2.43.0
> >
Yes, you are right. Please drop this patch.

As discussed in the related thread, this issue should be fixed in
v4l2-core instead of handling it in the imx-jpeg driver.

Thanks for checking.

Best regards,
Guangshuo

