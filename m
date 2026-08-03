Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFC1C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LqfMFvG39lKXqP4IY/jf6LMlXl3rblu3dHPXqWyDQ9c=; b=ZiCSEUN9OHIJiC
	E5re4IqQwS3j/wmMfcnX8YwT5XfVmakt2Vg8zv2/92rr4BDOpPALVBvUxxPM3uWmUdUxMF1/mBBIP
	Rn6ZDnw+Umjg/QmQabK8yxOGWpttP5O+dZAmUUoQTjA9hbdkZqMpwt1UipF3Xwt66zmgehh6GTIU3
	3qcJKm2EUyXAsSAZZxsx3jdIy8skKUZxdqFdxrHritsnUlVwYPmSg0Zvc061myxcZxbwMIUShAsR/
	lTi3uvyh8t6yykqdiok9wO3B++mLYDWZRNFmTSZNdhFaC0kEVbQ3GQKXMmhRhQhUbaT5cD4vAPpcY
	NWBwVuM7X0VfsBJjHLUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvrg-000000008xi-1ZMk;
	Mon, 03 Aug 2026 16:50:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvre-000000008xH-3s5U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:50:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 49DAD60AA5
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 16:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0130A1F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 16:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785775810;
	bh=LqfMFvG39lKXqP4IY/jf6LMlXl3rblu3dHPXqWyDQ9c=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=hdUPXNPY/9SP3Vv3rKoCrAAtD8WStLz446kNjM6+aUw9ePntJumoOKf2FBbGys/9n
	 GHBrdkICi5QyvVy7LODwOAs+I0jbDYQ2DcjbZAHtY/y41PKoSFCY22R6+bNQtGSz0T
	 BvedpgRT2vS8NCWk2ktqwPekn2Rqw1Y3AW/RnWgFFEiXOmOslQldxYCKyqRO7M5HoH
	 P8/VsN8QspQ+ieU8/6EKnYKozeh/dWNctfgI4nx3uc/jQcRJ6qIyFr7+gVuS3PizlD
	 X081J50C6V8vsTuSDanqF0Ty/MwgizLsEvfr+bYIR2jMs4/vfluHFNvHBzBitFisoR
	 v2xXcUVVhHbGQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39faaf1efd3so3543641fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:50:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqUke3rcreaDCEOLZfY/czdcE6ESatguseIutMBllMPPVu5X8ivIQmyGOl4eJtERDbfqtuJx12vgjnWxLqHaDmb@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0ajQwIpee7yBRvTzymhg7AQO1TLYXiBOsx1RS1OvdycMnUBpX
	q1OcaPAVKWQ9A4Tv2sBL2JPjiPBC4dyrKAY55lkFi/6KLuUrpz9wVzu+hUSgU8fqVoR4/uyPgmx
	fYVZuFArGRC8F9rKjqzQL6J3S7wMjxEo=
X-Received: by 2002:a05:651c:2109:b0:39f:80a1:26cb with SMTP id
 38308e7fff4ca-39f8618e025mr23124651fa.15.1785775808451; Mon, 03 Aug 2026
 09:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <871a3108086c15a483eef23301984c8d2254dfa7.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <871a3108086c15a483eef23301984c8d2254dfa7.1785772659.git.jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 00:49:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v65cakBH2F9UzFez7oaSR+FdaEE9jd8=EVwqYppEv+vT_A@mail.gmail.com>
X-Gm-Features: AUfX_myTSWk3Vhh1B8YIgS2HNj92bAoaOYw3A_kZOXp0hMmKDaNs9ozAJnm4yvY
Message-ID: <CAGb2v65cakBH2F9UzFez7oaSR+FdaEE9jd8=EVwqYppEv+vT_A@mail.gmail.com>
Subject: Re: [PATCH 06/13] drm/sun4i: tcon: Drop TCON TOP device reference
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> of_find_device_by_node() takes a device reference. Drop it after mux
> configuration succeeds.
>
> Fixes: 0305189afb32 ("drm/sun4i: tcon: Add support for R40 TCON")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

Though I'd probably rewrite it with

    struct platform_device *pdev __free(platform_device_put) =3D
            of_find_device_by_node();

and then all paths can just return instead of needing the goto.

> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/s=
un4i_tcon.c
> index ea7c90fef316..de2d66623f7a 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -1409,7 +1409,7 @@ static int sun8i_r40_tcon_tv_set_mux(struct sun4i_t=
con *tcon,
>  {
>         struct device_node *port, *remote;
>         struct platform_device *pdev;
> -       int id, ret;
> +       int id, ret =3D 0;
>
>         /* find TCON TOP platform device and TCON id */
>
> @@ -1432,21 +1432,20 @@ static int sun8i_r40_tcon_tv_set_mux(struct sun4i=
_tcon *tcon,
>         if (IS_ENABLED(CONFIG_DRM_SUN8I_TCON_TOP) &&
>             encoder->encoder_type =3D=3D DRM_MODE_ENCODER_TMDS) {
>                 ret =3D sun8i_tcon_top_set_hdmi_src(&pdev->dev, id);
> -               if (ret) {
> -                       put_device(&pdev->dev);
> -                       return ret;
> -               }
> +               if (ret)
> +                       goto out_put_device;
>         }
>
>         if (IS_ENABLED(CONFIG_DRM_SUN8I_TCON_TOP)) {
>                 ret =3D sun8i_tcon_top_de_config(&pdev->dev, tcon->id, id=
);
> -               if (ret) {
> -                       put_device(&pdev->dev);
> -                       return ret;
> -               }
> +               if (ret)
> +                       goto out_put_device;
>         }
>
> -       return 0;
> +out_put_device:
> +       put_device(&pdev->dev);
> +
> +       return ret;
>  }
>
>  static const struct sun4i_tcon_quirks sun4i_a10_quirks =3D {
> --
> 2.43.0
>
>

