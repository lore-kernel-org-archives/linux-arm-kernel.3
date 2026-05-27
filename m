Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4F0CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 07:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IN/lZ1MspSWqCEdebYjVtGecjRh9KxGFTFq6UHbS1Fc=; b=GYlMXz/1IZHmIvg2Uwv1uO0PwA
	8aVd44k2+DVeU7FJnStFcCh/gRgnMVh7PdL8i/GA+zLX6qUnud6JejwYGBOGGB1fdMhgIYt+if6CE
	6glY8gp7XSmwBLubBHEFByiF4U+H1m2BVEb26wA7T0NDhUQp13Vrdy9E8r24ATpnjH6e86bnsD3GS
	KpfoSZgCa8mwvAhHM0a/j3b8YbUND+Nc4ZtVVB9ULoQe+8PQNgn/kZeMn6KiKEfYJmkxCU+vWPC+N
	FZB9vAAtxgfXdHTsl41d6Hz4p5owpyVUhCVSYxNxWEnvey83QWStw2Km9VF6frpa/3zQyT/tPasNR
	ghNQ6eRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7AO-00000003McI-0PsB;
	Wed, 27 May 2026 05:50:56 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7AL-00000003Mbt-1SPn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 05:50:55 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-69d819c5a6aso3578655eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 22:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779861051; cv=none;
        d=google.com; s=arc-20240605;
        b=CaLQj52VMJGeKv2tmB1vZji56fZUj7H/KKgrzup3RUmQT18OI1spas9Fqbu5O/JC6e
         Vy3arYspO3LsPawgAta7ikZX71rrU3LfKLn3pj6jeJuYjNlC7UYqa0aoVXRm5BixgMzE
         H14hbTBMj965sKkYfgJqnCc5EJ14LKvF0rEct6rig9+ttTFwTpfBFR9W6EyootAADK/U
         9dvdU7hAYFDrgEnKAotiLmetX0lZJBlstTMJErU40PUzLdZ/jKe/55OGv9IftHL6bPaP
         M4Ae7d5YeoYV6zdznFW8UhtMtl7X+gxoS/lqOKLiruzPYfBa8omT2jk1kKOSGa507C+u
         tPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IN/lZ1MspSWqCEdebYjVtGecjRh9KxGFTFq6UHbS1Fc=;
        fh=quWCumD9lAM0oDzUH2nI23fdL4Ardz9HfF2oH/9Jma8=;
        b=XEaXhpF0Ta58OmnNVRAvXoqZHlSAcM5Fi4FYsRMWV+ppG8Tzq9Hu/L5qClfau4SmH2
         irYHqvATdLr3S8OPTm9v9GcS9/W90Q9WZL9kr8cornVlivcELqeA/gdstXGp8EC6v919
         yUU1GXdeCk9/g65vpTiKP1nss9Mr35m2TUv7bCIDWbxC6RAjMdIH7Mqml+xJuIAsgNwB
         O79tdf5OC5zr/zhUryP1hS4Y12SdQt5Xkzx78kF71hkBF6mn+WZI+KTWF4nlCjtFHjsk
         Us94a3IzqsPmT2FVOpn4NPgDgL9QCLiSsbYy87++JWUa+a8uH5LiQLu89CVH8s2GQzs7
         5fag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779861051; x=1780465851; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IN/lZ1MspSWqCEdebYjVtGecjRh9KxGFTFq6UHbS1Fc=;
        b=dJg+/oxrlhY/Lua9kcls0wtbTIeX5OMK0jeXsmitdCKxlJiI+oVSyT7cCZRSxar+s7
         2LsjPPSdVyMVnua5d7jzuioU0/btkKBbFdsTOFJS0k7DrNzAzu69pYr7flAsdBkEuNCH
         AdKfdZ8d7YKxpYPnWiDe4PZGcDxnPTf5cWeDtXFa/TCvCZ9ZsTQ6n2PmfxXrCkg/OQam
         pwa4iWq5mUMeMw6NcTgrUp8O8eoZ8dDPeVIliUSQqtVv9OeHzR7j5eH8aPFyfTZyvy3k
         MERuN9uFjmy2HQzf1evZ8xnLWPwPUMjZj6aD+PqoLmv3uOk6daL5x38iE2W2hdB3yX7r
         0CzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779861051; x=1780465851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IN/lZ1MspSWqCEdebYjVtGecjRh9KxGFTFq6UHbS1Fc=;
        b=eb+TwvoeukPv++ZpCWOX579IiAxM4v1Q5tEZ4NvVp/FmDp7FUWm7nucOJBXL7vEMrP
         YvSRPZSPw0d12BJEnFd9F8H2YBtXTxhZAsIobi94Hg76iAewOJLmh9fIb8NQita5v8Wz
         5ksDs/lGhp7YE7QlZTgaYVT8XqjcDdvOvGYhxIbSvbrhhKl1LwYX0iWNzCDXNmxTcsJC
         qw0sjP4c6bFcPipSN20ubJIAQh6W1uuaMkBvbo+7gNrj4+aIPiJbCOVH8lTQHdHG/GMH
         4wwZD/ZM2DSmpmq/iWM3BQrIlbl0ZTiSo7UoG2827mo1hagJEEuIvHDoNG9UszH2Feig
         6gxg==
X-Forwarded-Encrypted: i=1; AFNElJ+WdmjBza5omhG1sDTsompJf1pRCQa4Z9FW+xv1FLDtRbY7KSzY+dOuzokK3OJGdHhsao0505msmZvG9NeUVxKQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwZJWILiB2KDmTvFtFnTDQeeyrt80XrXdP7/GSPpjowqMR0Vqe0
	HoQuf+viNRulgbwO5gEKs/mw4ji+bd3oiaF1rkyjazI7SX1zN5pak8qBpUXYAupsh8+mW0L33pg
	e2QsQhMhManM5964Ey+pr0iUDa3WpyXA=
X-Gm-Gg: Acq92OHYEk/SWuaCdNwQiFFVuBkxfNT2mRAULLnpZ6ITLQZO5XKLhNBy77dOpQ8JXbC
	5EAFGegD8L54hJLKKRUCxMVYW4VapfY42f7lRIAtvacsHp7vqJzVoBuL6078yLs2z3AzidVOpmj
	99Cw9OVIAyMk9m0RbPES40FaYzJ9bSyGgwIKro6Lpy8UP3Xu5sXj6DE6amqPlUaFhTzvxv2erg5
	FliXpHDaxFcVIp32Y+/LR4TiWF54sweC0mB4i33m1KQywUdNyFoC7vbODZxnP6FC/d8NOWTs3z+
	jA14SN3luKamxAn1YLlCzfDncuGTaBAWDe6e5HS22RMV8bXuLDTiMKw+wdGCPBvOsGVOM6ml9Hg
	5iA==
X-Received: by 2002:a05:6820:8c6:b0:67d:e7c3:3c6c with SMTP id
 006d021491bc7-69d7ece5518mr11407499eaf.53.1779861051499; Tue, 26 May 2026
 22:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-11-paulk@sys-base.io>
In-Reply-To: <20260518102451.417971-11-paulk@sys-base.io>
From: arash golgol <arash.golgol@gmail.com>
Date: Wed, 27 May 2026 09:20:20 +0330
X-Gm-Features: AVHnY4KCcmkhN5ddeEl3UKGwn2lpmjAHGW1bfUh9bIDJK3bFLtCx7fk5EGqR9us
Message-ID: <CAMxPZkiKBFsPA5x6KpBajGqO5xqxD5AOd26j3uwqnQko1VzknQ@mail.gmail.com>
Subject: Re: [PATCH 10/16] media: sun6i-csi: Add support for MC-centric format enumeration
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
X-CRM114-CacheID: sfid-20260526_225053_398788_632AB00E 
X-CRM114-Status: GOOD (  25.35  )
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

On Mon, May 18, 2026 at 2:00=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Use the dedicated helper to check possible pixelformats against the
> provided mbus code in order to support MC-centric format enumeration.
>
> Note that multiple pixelformats may be returned for a given mbus code.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 38 +++++++++++++++++--
>  1 file changed, 34 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b=
/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> index a836fa7f081a..409c28621093 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -773,14 +773,43 @@ static int sun6i_csi_capture_querycap(struct file *=
file, void *priv,
>  static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
>                                       struct v4l2_fmtdesc *fmtdesc)
>  {
> +       const struct sun6i_csi_capture_format *capture_format;
> +       const struct sun6i_csi_bridge_format *bridge_format;
> +       u32 mbus_code =3D fmtdesc->mbus_code;
>         u32 index =3D fmtdesc->index;
> +       unsigned int index_valid =3D 0;
> +       unsigned int i;
> +
> +       /* Video-node-centric enumeration. */
> +       if (!mbus_code) {
> +               if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> +                       return -EINVAL;
> +
> +               fmtdesc->pixelformat =3D
> +                       sun6i_csi_capture_formats[index].pixelformat;
> +               return 0;
> +       }
>
> -       if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> +       bridge_format =3D sun6i_csi_bridge_format_find(mbus_code);
> +       if (!bridge_format)
>                 return -EINVAL;
>
> -       fmtdesc->pixelformat =3D sun6i_csi_capture_formats[index].pixelfo=
rmat;
> +       for (i =3D 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++) {
> +               capture_format =3D &sun6i_csi_capture_formats[i];
>
> -       return 0;
> +               if (!sun6i_csi_capture_format_check(capture_format,
> +                                                   bridge_format))
> +                       continue;
> +
> +               if (index_valid =3D=3D index) {
> +                       fmtdesc->pixelformat =3D capture_format->pixelfor=
mat;
> +                       return 0;
> +               }
> +
> +               index_valid++;
> +       }
> +
> +       return -EINVAL;
>  }
>
>  static int sun6i_csi_capture_enum_framesize(struct file *file, void *fh,
> @@ -1076,7 +1105,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device=
 *csi_dev)
>
>         strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
>                 sizeof(video_dev->name));
> -       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STRE=
AMING;
> +       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STRE=
AMING |
> +                                V4L2_CAP_IO_MC;
>         video_dev->vfl_dir =3D VFL_DIR_RX;
>         video_dev->release =3D video_device_release_empty;
>         video_dev->fops =3D &sun6i_csi_capture_fops;
> --
> 2.54.0
>

Tested on a LicheePi Zero Dock (V3s) with the following pipeline:

ov7670 -> sun6i-csi-bridge -> sun6i-csi-capture

I verified that mbus-code-based format enumeration works correctly
from userspace and that the reported capture formats change according
to the selected media bus format.

I could also successfully start streaming with several of the
enumerated capture formats (e.g. YUYV and BA81)

However, I could not fully validate actual format conversion behavior
(e.g. MEDIA_BUS_FMT_YUYV8_2X8 to NV12) because my OV7670 setup
currently has non-functional test patterns except for 'shifting-1'
mode.

Tested-by: Arash Golgol <arash.golgol@gmail.com>

PS:

While testing this patch I also noticed that
VIDIOC_SUBDEV_ENUM_MBUS_CODE reports duplicate entries for:
 - MEDIA_BUS_FMT_UYVY8_2X8
 - MEDIA_BUS_FMT_UYVY8_1X16
on sun6i-csi-bridge.

This appears to come from duplicate format entries being exposed by
the bridge driver.

--=20
Regards,
Arash Golgol

