Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6166CC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 08:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KnuH9JNzZqkRfD81Q4WhVtoZdJkHzYHH48enGdGSTvg=; b=WC5ZB1s8gi6DNiE9G3lF1K/lXN
	6HGkbU6hvSWUvUy0p9DnfPPzIormeK4euYcnT+od67lY3LcVhIXSp3NxpBvR2aiSKuEENN0D4cvgt
	6m4qqbZgGXT6jD3H9wYKYHtV/xlavCGQtvKt9RMygsU456tFj/ok+ngA/lgvkEvUyA9HeN02dtVgV
	lW1n5+HcGAb9SpRAc3Ndfo0iDfadkiVLaa4SnULZDrhcYdu2muJGUMB1Tj5RkuZH+scejTVMG6qbB
	kuAx8FvUO1BWcAc5ZkR9PX7uC0CAP1zwj7zOjhCgKA8hDII0y5h0tcOouCSgRU4UwAUWnOwioqUH4
	42dhZnhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGeE-00000002ENl-21wu;
	Mon, 27 Jul 2026 08:25:18 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGeC-00000002EN5-2iGj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 08:25:17 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-664b1bab782so310870d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 01:25:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785140715; cv=none;
        d=google.com; s=arc-20260327;
        b=Ob+W/8PHjeiao8wjM3zxl9SG9kto3NVp6/bn9TNn9YbbPYZOmzUBefCm3BYAhGX1TV
         ebJBc3m7DdxS6Evk9gy3uyQdpoQ1WTLK3/zKTzp79Psc4rSBSTZBlaivvhKWNqWlJYYF
         rRiIuqZz4BJemSK60xJNlmQgO4c/YyAyd9ZjpRkqDk+9KXs/PNFRgsXSSmGt+2ZFFd72
         ekFynAUZji7qAjRbnYSnzG5nmh2WKFOxde53S8+KX3ZHHPmmV8j5+W6NRYLvs6RkxHhL
         +N/YSXptHfzodwjPzRalqtWr28aetZORSRQp30o01SLQju+dmS4/7Lc+7dbVCeQTHsp5
         NVuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KnuH9JNzZqkRfD81Q4WhVtoZdJkHzYHH48enGdGSTvg=;
        fh=Tf9oSpd9ZOukwpLVVO5ZwdOYhYXpYft/tV4Q3cEWs6o=;
        b=arKOBjkph4+XUj6XBnhsukceJC6+I5/wWRqh8JV49bkjAAzn7BmzYjSe6HDfnSVgCF
         ouuYY62tPnhOQS96gHlMwjtUMD5ZWvqtZW5NmwTq8+H+bR5THhmdbY87e5paJzhNaz4s
         GLqGdAqCHhjcP6/hqK/56518DsB9Ukf2Kw7W8XdthMkV5+/0j31QxVyu21m6bYo27CM5
         +xaN9UpsVsOrwuCBdZKGtxyNKubwqOzpDtpzEdMuPnfaGZ8saes0702MX8jhIYDMTOIu
         MTNL2qIz/DhP0zNLCLXptcOQ9rNcRAv83y4RlG7HDVgtNV/bjjeZcSNQ5q1dFSmtmh24
         OROA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785140715; x=1785745515; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KnuH9JNzZqkRfD81Q4WhVtoZdJkHzYHH48enGdGSTvg=;
        b=GhD4idsvIBJKo11tdMlqa7qyzKFmu/kgj+nBuEkr0VMi4TUyWmmkzY3GDNK4mGyIzm
         6gxkQZQTfH2X8gor6oeQ/KVQdFMjA7nDVFB0IV3CsyTwYxacqoAW+tYIoIchCJc5ufU+
         exJRnGCUBIgyeW5AOw7Q/dbKz+eFbKGVjM98+wTezVR893sguWVfASsM8MC3FVFWkn2B
         u8OPjafH7B09KFcxtirJiFs310nZk7HKWcQze0bzZvMj2oieK9XtNZZsOZgQNri8eR3d
         aMAOEHwx4/Ad1dedAZtsECU1y1ixp/tzf3Kg137ZThBR8iUIxxATKZ9U5Mq9ZQibZD0W
         C49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785140715; x=1785745515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KnuH9JNzZqkRfD81Q4WhVtoZdJkHzYHH48enGdGSTvg=;
        b=NJW4RBHAK6y0Bat8LEnHc+Q9VrHzGlbRXl8zCdNO3xO5awKPy9ry64egYN5Mo7q7F7
         laIBa1/DOpCFv5VkslXgc51jXxr2bvzIyxUYakbBd+egthxG4gHW/eqhtLWuc2JDVR4e
         dUOvOyu0x+KB2ZDDxREUfWY81CJ12m0Wmd0NFKavr5Ir3dMTtKzWVe+elDne2R5diXyz
         knyDgEOb7+U3ochShDmrHU13uH9fZUb/SK3O9Cf3QfR08wRmImBZ2XyYgdWJza/2QpN7
         iLJP4SgjU/ll8pVWcasqOWrgGdKVFy9NtRidxG9qZ4ItTRP7/xwBxBmNGJ5W+0AT/iBh
         SJ1g==
X-Forwarded-Encrypted: i=1; AHgh+Rqo2AC55IrorB/1c+4phl4EyEdnR9JGKd/LzrwtfWoIncOAuITmt6fi7+3dEwDLwymc1D76ovn6Y+I8I68tgKAj@lists.infradead.org
X-Gm-Message-State: AOJu0YykKozd81Z+soJ92ocABUIwO9xFcxPirdPCx+zY7C1P0TUHET3+
	Dzj7CUsvxefchEHphDce7B+e8AkRBpFb+LsQTONj/omUmLH4kc74241ZNDPuDx54vQRvdcksUDQ
	fQOBdZLCfrHVB4gIQ/RUGowgWjJMx57g=
X-Gm-Gg: AR+sD10wFLMKogeQtaQ9ftXyz1Vy2S3dcsMGfhbiXJsK2iPUN88uZI2uyYFiyoLY6HA
	tVbwlQ/8WayDB+eIV+OsA7gQlUh9D72h6+wj/SpjtzHyvpNZcDeYzxH2e/4Y6LOQRNbT/LE5axt
	QzsoVhttRDsroidYMbRKIaY0BvjQnIJz8+cdJ1XRYuKaZjrALo+gvBK3/fPXUPdQ1QescRGkSYn
	Ykfy1vq7HiB5z7mY2/RylzubOuL6Aqdt0pmRR5fFSpV04+2/unVDrmgK2VJxfQulDrmkCdQ0hbD
	Im61r0WkyvAZVEFQEY/x
X-Received: by 2002:a05:690c:660c:b0:80c:80a2:9761 with SMTP id
 00721157ae682-81f69e5ced9mr23345447b3.6.1785140715181; Mon, 27 Jul 2026
 01:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com> <CAMhzubo-NJMro7+XbxD=MhSXiRp14chatDcn-=1Hsiak786uQw@mail.gmail.com>
In-Reply-To: <CAMhzubo-NJMro7+XbxD=MhSXiRp14chatDcn-=1Hsiak786uQw@mail.gmail.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Mon, 27 Jul 2026 10:25:02 +0200
X-Gm-Features: AUfX_my4MA58ugAK6hzdfyussxxhX0Ow06GltjruBbp1b6Mur8Y-LGUFlM4WYQo
Message-ID: <CAEWPSH754+Wq7W4CVKNqjuMZ22q_S79K-Tin9SXYw1RCYQwLwg@mail.gmail.com>
Subject: Re: [PATCH 0/4] media: rkvdec: Add VP9 support for VDPU381 variant
To: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Cc: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_012516_727661_88C3FBAA 
X-CRM114-Status: GOOD (  23.50  )
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

Orange Pi 5 Plus leg of the three-board run in the cover letter, as a
tag you can pick up. 7.0 base carrying this code, not a build of the
series as posted.

Tested-by: Igor Paunovic royalnet026@gmail.com


On Mon, Jul 27, 2026 at 8:44=E2=80=AFAM Francesco Saverio Pavone
<pavone.lawyer@gmail.com> wrote:
>
> Rock 5B+ leg of the three-board run in the cover letter, as a tag you can
> pick up. 7.1 base carrying this code, not a build of the series as posted=
.
>
> Francesco Saverio Pavone <pavone.lawyer@gmail.com>
>
>
> Il giorno dom 26 lug 2026 alle ore 22:28 Venkata Atchuta Bheemeswara
> Sarma Darbha <vdarbha0473@gmail.com> ha scritto:
> >
> > Hi All,
> > This patch series adds the initial VP9 support for VDPU381 present in r=
k3588.
> >
> > VDPU381 supports VP9 Profile 0 and Profile 2 up to 7680x4320@30fps.
> >
> > Tested with fluster (suite : VP9-TEST-VECTORS, decoder: GStreamer-VP9-V=
4L2SL-Gst1.0).
> > The 224/305 score has been reproduced independently on three RK3588 boa=
rds
> > across three kernel bases: Orange Pi 5 Pro (RK3588S, 7.2.0-rc3),
> > Orange Pi 5 Plus (RK3588, 7.0) and Radxa Rock 5B+ (RK3588, 7.1).
> >
> > Most of the remaining failures fall into a few known categories:
> >
> > - All vp90-2-02-size-*.webm variants where either dimension is
> >   smaller than 64 pixels fail because the hardware does not support
> >   frames smaller than 64x64:
> >   vp90-2-02-size-08x08.webm, vp90-2-02-size-08x10.webm,
> >   vp90-2-02-size-08x16.webm, vp90-2-02-size-08x18.webm,
> >   vp90-2-02-size-08x32.webm, vp90-2-02-size-08x34.webm,
> >   vp90-2-02-size-08x64.webm, vp90-2-02-size-08x66.webm,
> >   vp90-2-02-size-10x08.webm, vp90-2-02-size-10x10.webm,
> >   vp90-2-02-size-10x16.webm, vp90-2-02-size-10x18.webm,
> >   vp90-2-02-size-10x32.webm, vp90-2-02-size-10x34.webm,
> >   vp90-2-02-size-10x64.webm, vp90-2-02-size-10x66.webm,
> >   vp90-2-02-size-16x08.webm, vp90-2-02-size-16x10.webm,
> >   vp90-2-02-size-16x16.webm, vp90-2-02-size-16x18.webm,
> >   vp90-2-02-size-16x32.webm, vp90-2-02-size-16x34.webm,
> >   vp90-2-02-size-16x64.webm, vp90-2-02-size-16x66.webm,
> >   vp90-2-02-size-18x08.webm, vp90-2-02-size-18x10.webm,
> >   vp90-2-02-size-18x18.webm, vp90-2-02-size-18x32.webm,
> >   vp90-2-02-size-18x34.webm, vp90-2-02-size-18x64.webm,
> >   vp90-2-02-size-18x66.webm, vp90-2-02-size-32x08.webm,
> >   vp90-2-02-size-32x10.webm, vp90-2-02-size-32x18.webm,
> >   vp90-2-02-size-32x34.webm, vp90-2-02-size-32x66.webm,
> >   vp90-2-02-size-34x08.webm, vp90-2-02-size-34x10.webm,
> >   vp90-2-02-size-34x16.webm, vp90-2-02-size-34x34.webm,
> >   vp90-2-02-size-34x64.webm, vp90-2-02-size-34x66.webm,
> >   vp90-2-02-size-64x08.webm, vp90-2-02-size-64x10.webm,
> >   vp90-2-02-size-66x08.webm, vp90-2-02-size-66x10.webm.
> >
> > - vp90-2-05-resize.ivf, vp90-2-18-resize.ivf and all
> >   vp90-2-21-resize_inter_*.webm variants fail. These streams change
> >   resolution mid-stream on a non-keyframe, and a reference frame
> >   from before the resize ends up unavailable by the time it's
> >   needed again. This is being actively looked into:
> >   vp90-2-05-resize.ivf, vp90-2-18-resize.ivf,
> >   vp90-2-21-resize_inter_1280x720_5_1-2.webm,
> >   vp90-2-21-resize_inter_1280x720_5_3-4.webm,
> >   vp90-2-21-resize_inter_1280x720_7_1-2.webm,
> >   vp90-2-21-resize_inter_1280x720_7_3-4.webm,
> >   vp90-2-21-resize_inter_1920x1080_5_1-2.webm,
> >   vp90-2-21-resize_inter_1920x1080_5_3-4.webm,
> >   vp90-2-21-resize_inter_1920x1080_7_1-2.webm,
> >   vp90-2-21-resize_inter_1920x1080_7_3-4.webm,
> >   vp90-2-21-resize_inter_320x180_5_1-2.webm,
> >   vp90-2-21-resize_inter_320x180_5_3-4.webm,
> >   vp90-2-21-resize_inter_320x180_7_1-2.webm,
> >   vp90-2-21-resize_inter_320x180_7_3-4.webm,
> >   vp90-2-21-resize_inter_320x240_5_1-2.webm,
> >   vp90-2-21-resize_inter_320x240_5_3-4.webm,
> >   vp90-2-21-resize_inter_320x240_7_1-2.webm,
> >   vp90-2-21-resize_inter_320x240_7_3-4.webm,
> >   vp90-2-21-resize_inter_640x360_5_1-2.webm,
> >   vp90-2-21-resize_inter_640x360_5_3-4.webm,
> >   vp90-2-21-resize_inter_640x360_7_1-2.webm,
> >   vp90-2-21-resize_inter_640x360_7_3-4.webm,
> >   vp90-2-21-resize_inter_640x480_5_1-2.webm,
> >   vp90-2-21-resize_inter_640x480_5_3-4.webm,
> >   vp90-2-21-resize_inter_640x480_7_1-2.webm,
> >   vp90-2-21-resize_inter_640x480_7_3-4.webm.
> >
> > - vp90-2-09-aq2.webm,
> >   vp90-2-09-lf_deltas.webm,
> >   vp90-2-15-segkey_adpq.webm,
> >   vp90-2-19-skip-01.webm,
> >   vp90-2-19-skip-02.webm,
> >   vp90-2-19-skip.webm,  vp90-2-22-svc_1280x720_3.ivf,
> >   are still failing and not yet root-caused.
> >
> > - vp91-2-04-yuv422.webm
> >   vp91-2-04-yuv444.webm
> >   fail because the hardware does not support the format these
> >   streams use (4:2:2/4:4:4), only 4:2:0.
> >
> > The base vdpu381 VP9 driver support was introduced by me. Profile 2 sup=
port
> > was added by Igor Paunovic. Francesco Saverio Pavone fixed bugs in
> > the segmentation map size calculation and in the altref vertical
> > scale factor. Igor Paunovic also fixed a decoded-frame stride bug, alig=
ning
> > bytesperline to 64 bytes in rkvdec_fill_decoded_pixfmt().
> >
> > ---
> > Igor Paunovic (1):
> >       media: rkvdec: align bytesperline to 64 bytes in rkvdec_fill_deco=
ded_pixfmt()
> >
> > Venkata Atchuta Bheemeswara Sarma Darbha (3):
> >       media: rkvdec: vp9: Changing get_ref_buf function name to get_ref=
_buf_vp9
> >       media: rkvdec: Move vp9 functions to common file
> >       media: rkvdec: Add VP9 support for VDPU381 variant
> >
> >  drivers/media/platform/rockchip/rkvdec/Makefile    |    2 +
> >  .../platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h |  234 +++++
> >  .../platform/rockchip/rkvdec/rkvdec-vdpu381-vp9.c  | 1067 ++++++++++++=
++++++++
> >  .../platform/rockchip/rkvdec/rkvdec-vp9-common.c   |   65 ++
> >  .../platform/rockchip/rkvdec/rkvdec-vp9-common.h   |   92 ++
> >  .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    |  121 +--
> >  drivers/media/platform/rockchip/rkvdec/rkvdec.c    |   73 +-
> >  drivers/media/platform/rockchip/rkvdec/rkvdec.h    |    1 +
> >  8 files changed, 1537 insertions(+), 118 deletions(-)
> > ---
> > base-commit: 1229e2e57a5c2980ccd457b9b53ea0eed5a22ab3
> > change-id: 20260726-b4-add-rkvdec2-vp9-vdpu381-3d1bd8fca4f5
> >
> > Best regards,
> > --
> > Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
> >

