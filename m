Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C6BCD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 07:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T20GWQ7AAxX56WT8tx5xeyPGgn/3xota+hYuh6TNyvE=; b=d3cwYtAGQTxlNmKJOfBVfAt3VF
	EgR7Ey0r+/R6EXzdzIUvoBLRPS7ZNu9Xv9kMAD9os5baEiJ7ABOCBClQJPLc0E2zLjFQIY7emIJBF
	vd/05VIG6b/idAaA1mLPTSuc9ygjQYm6sGow2wrvurItsWQhAqbLKysWN/NuTDvocYGd5g7iG86SF
	mGiS3IaN9jZ0Ts5/mVf5RTtoHHd1HF9Yj944SHleNCRTijfkAn7mx3Qlk4zmM3kXLgcwKLXBN4lYz
	Pz1FpJQsUPpEBKT6Dr5Bq8rjdKO4bc5lPO0PCsdf260MKSTk1dGuLZ/4my3vPQVrJTLFN4A9fIOEm
	82d8LZZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVHU-00000005Gjh-18Gn;
	Thu, 28 May 2026 07:35:52 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVHR-00000005GiX-2Wp4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 07:35:50 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7e613b4f268so3570032a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 00:35:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779953748; cv=none;
        d=google.com; s=arc-20240605;
        b=h5e99T7BwkA2f2umI4YK3LBeM2qZy11p7Zjq7jnvYzHxbQNQY6bUhjs64hHbU4g2KV
         lEH62YPFR5C07W3rc666AgP8/L/p8K1g4tKx/Eh9P+X9Lv7TAm0Sl/Z+IJri8yr69obN
         8aSuz0M0oq0omDscdpGhNH9pcm6T2NUGP0D1CXndd/qFc8fc+LTlqW/221A/Cuso0otS
         9OS3YEKNTp16R6J2fK5aFL/1Qk4QtaMa46Ew2neJaAYvX0zi1MiOPhA1cxZh4oFvk6hX
         QBLXqedifZssZFz3ESvXzWNQpF4TzPDMXxpVxDbOA5G4VrfTeC5yJxS1ciPSY7F8fD/z
         yo9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T20GWQ7AAxX56WT8tx5xeyPGgn/3xota+hYuh6TNyvE=;
        fh=hDIvR5WvH4CnFC/Qd7hqstIARJV+BAv8FzAJ6LT1KmY=;
        b=O1/Nr3hoEy0FnNNQ//WwwsldSdHqU7xWfYjddaAM0n3ptiaUcymTkXdctf3POraD3P
         dQrPh8Cj7vip5zqNOnqQRJZDz4KhWT2gGr2SBQaBaIPnC81Wv21gcdXgKkK7QHi1D0xe
         iultZY3wdsdXrylFPIm18YQ4k+ChYQmXuB3+Hm6PO67vBh8C+6aW6e4zTvZpOMpx24z0
         J9uiIzefA1+QYgV9w1YTBLUjjvjQ4YYCND21KuEZmkhJrJ1Q//WBG/Fxui6A3sSA8sg2
         LfkVbgitCuthuvw9Eys09wwHBjvLHfpK7eT2GPo1OEWLnAH41iZJVIZB8eUNE613Tzxz
         0u4A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779953748; x=1780558548; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T20GWQ7AAxX56WT8tx5xeyPGgn/3xota+hYuh6TNyvE=;
        b=flmfrsXvVlOU6qyyDiepLhPMpXKyc1CigO3hq5aLB9Q7+9SNh8zsHMXEfldhc/qDuO
         BwdY+0svxrc4zfYBRXG4Q01QQHxhPfCycYb1K9F5OzAfD9XiPcezrp68yHSCemWqopDx
         tkeKk+4oa6EOF9f9udQ5UkSmauRgLmL3Nzfe4CfsTtkTQY94AXGtLTbU3rArcvsvXDum
         9s0BwajQUZYwc95/EmwlE+dIef610Pgeewu9zQrFMHAud78ZjCqdsUPzrbkxoca0qV+g
         I1oeTkRzc+6AjF1GbWlhG3IlYyoKJmC601TG1yx6QzRI9mAkR9G+6vUC+ro8ZwwQri7O
         gZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779953748; x=1780558548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T20GWQ7AAxX56WT8tx5xeyPGgn/3xota+hYuh6TNyvE=;
        b=T3eWkkafFE6TKQQ9gvFA0w/EI5VzWi0Ga2vE0XSfs0H6hWjCs3BBFk3dhK+adtk98p
         qFitCn2lfsVVikqF1qKaR8xV/Ncz95V4L2Q4B1dmmfUEUUApeqzIm/d7bpsUDCdW8aUB
         LAbb4TmsnHv0BUh1wLiRml0XKo0EcIjZHC7TioDjMWHRZRC9UGbZEqoQW9ZGCZJ3tRs/
         M9RA604fw6MQTaAzQfyXZTvhJCAh2/qXdUqX7JsTmBwhg2EORPQf2rrdLBblg7CBV4eM
         YCO1dtGGg8XVXAYdbcrXvrgryS7IHLwFgdaovB6tdo2SHYuqDSGmLvJmNSMk0HGmqnc6
         15Qg==
X-Forwarded-Encrypted: i=1; AFNElJ+8UKutk1gGX2u+v+QFNweaEnQbpCNmIfp+Y1v1MiDU5iT/Ao00dFljfGhvUgI26iAToU6A5bOvWbh3tv99cRCU@lists.infradead.org
X-Gm-Message-State: AOJu0YzwY/H99qNp0AAW2znccSs3MB6F+xEnv+xlDGoBeEPYHY5rx/pk
	5ugvZ8QTXkNbXCjprVR0j4l+D2HNACRr+4OK95QKOLRn7YiBve/5hZ2rkuOnz4jFYLq+Ml3i3zJ
	4zKoXJWZRrNKuQbt4igp/RR96iind1fc=
X-Gm-Gg: Acq92OEnt8FveGTYzXLSrtXY5QWj9NaFk9gB7RJSH5XOcLK2anN1WAVK5V1ppMggEXJ
	46eXifwDcA64Yab39ZJuzwt1h52REu/RJ1/BUUI8tLNI3J01MirqGEj5bpDuTrOcIlY9LBAnShB
	xUY8jT3oFqOnT+qkdSCUeeMVCEpR/93AMwxHxgrwYRFTviCYHABagrvjwSvUJKFJ8Yi8pHEU57g
	b5qTEBvdmKruqFWEmfHB5APZHTv0ba4rXul0gSVw4D7TtY7TF38IjdLK0cmCar/5By5RRmZuy36
	ccMvCxJGjSed1/Ez99S4ubgVbR3gjNEDznGayaxbNN3QcAZYP/8a5nYiR7+SIDFKlUirD3ZsD3f
	J0Ys5
X-Received: by 2002:a05:6820:1f12:b0:696:72e9:f92e with SMTP id
 006d021491bc7-69dfa6b3709mr148717eaf.10.1779953748060; Thu, 28 May 2026
 00:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-16-paulk@sys-base.io>
In-Reply-To: <20260518102451.417971-16-paulk@sys-base.io>
From: arash golgol <arash.golgol@gmail.com>
Date: Thu, 28 May 2026 11:05:17 +0330
X-Gm-Features: AVHnY4IhmJJCXbj-tzl_ytWMhmyKPHjpmYamO2huuqsWLPnQ9-WnNbsuHTjiYbE
Message-ID: <CAMxPZkjhxJQ3ST6HrcwudkMzqwtvtVizng-PkiZd=xU4rrSxeA@mail.gmail.com>
Subject: Re: [PATCH 15/16] media: sun6i-isp: Add support for MC-centric format enumeration
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_003549_678687_2F1C36FC 
X-CRM114-Status: GOOD (  21.27  )
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

Hi Paul,

On Mon, May 18, 2026 at 2:02=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Just make sure the provided mbus code is supported and carry on with the
> existing implementation since the pixelformat is independent from the
> mbus code.
>
> The params video node only supports a single format and does not care
> about the mbus format, but we can still report MC-centric support.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c    | 9 ++++++++-
>  drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c | 3 ++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/=
drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> index 24e731bcabe9..372b9331bd6d 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> @@ -436,8 +436,14 @@ static int sun6i_isp_capture_querycap(struct file *f=
ile, void *priv,
>  static int sun6i_isp_capture_enum_fmt(struct file *file, void *priv,
>                                       struct v4l2_fmtdesc *fmtdesc)
>  {
> +       u32 mbus_code =3D fmtdesc->mbus_code;
>         u32 index =3D fmtdesc->index;
>
> +       if (mbus_code && !sun6i_isp_proc_format_find(mbus_code))
> +               return -EINVAL;
> +
> +       /* Capture format is independent from proc format. */
> +
>         if (index >=3D ARRAY_SIZE(sun6i_isp_capture_formats))
>                 return -EINVAL;
>
> @@ -697,7 +703,8 @@ int sun6i_isp_capture_setup(struct sun6i_isp_device *=
isp_dev)
>
>         strscpy(video_dev->name, SUN6I_ISP_CAPTURE_NAME,
>                 sizeof(video_dev->name));
> -       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STRE=
AMING;
> +       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STRE=
AMING |
> +                                V4L2_CAP_IO_MC;
>         video_dev->vfl_dir =3D VFL_DIR_RX;
>         video_dev->release =3D video_device_release_empty;
>         video_dev->fops =3D &sun6i_isp_capture_fops;
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/d=
rivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> index 0cc48e2bc8c6..2622e5a07817 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> @@ -531,7 +531,8 @@ int sun6i_isp_params_setup(struct sun6i_isp_device *i=
sp_dev)
>
>         strscpy(video_dev->name, SUN6I_ISP_PARAMS_NAME,
>                 sizeof(video_dev->name));
> -       video_dev->device_caps =3D V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAM=
ING;
> +       video_dev->device_caps =3D V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAM=
ING |
> +                                V4L2_CAP_IO_MC;
>         video_dev->vfl_dir =3D VFL_DIR_TX;
>         video_dev->release =3D video_device_release_empty;
>         video_dev->fops =3D &sun6i_isp_params_fops;
> --
> 2.54.0
>

Tested on a LicheePi Zero Dock (V3s) with the following pipeline:

ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-isp-proc ->
sun6i-isp-capture

I verified MC-centric format enumeration on the ISP capture node with
multiple mbus codes supported by sun6i-isp-proc.

Tested-by: Arash Golgol <arash.golgol@gmail.com>

--=20
Regards,
Arash Golgol

