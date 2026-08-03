Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A22C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FzYIensEehg4AqZ63zYidEpWKUCxiiUHEFuqj6KSwoQ=; b=gehry0my2gGeXP
	w+DqGNbH0nt/nqZTcYMcWFWVwcI3PSQXHtyJHuWx0mNshQC4wWT+/yamuCepRIuilFDulLD3QTHl5
	U8NdYLUbzAI0dKuh4aqOORRx3Rb3P0OyYJB7iKeQAvypyMUV6cG+LxAqpD5BdcK+n4tHN9m+yLDXn
	pAghYZy3nf8jlkC5kXWZbGJ7muLXxXSIWpIocwGvr2Be+FUYbFyiomcaUW27/IcHwJsmStSbUlcDu
	Yugpah93dO992cSNclkLfJMiL6S9NuGGk0mXgMVr42TMDqi+yzD917dg7lvrJjCCUlyR6Zey+9Vw9
	O8aSzc1yKKWU1cxThg4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvdv-000000006Cb-0WyX;
	Mon, 03 Aug 2026 16:35:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvdt-000000006Bw-3WtP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:35:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 582DD43CEE
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 16:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380B11F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 16:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785774955;
	bh=FzYIensEehg4AqZ63zYidEpWKUCxiiUHEFuqj6KSwoQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=TLMm4TsSV3ywjoKPjQMCMskB5/3cN3u0ES2TuqR9lzQ40DCL4ct7oq+MAdRFTJIwb
	 CixM+flP07q0hi1TOAcGGEf21lE2ImOvNUjHGgBJQ7F8JIV4mn3n5BWhDX9WQ0aElA
	 ntjXgLqkub+fuDwJviyi4WJwonjbf1QFB0IWqi7NK74JFtQVGz0U/l0TUuTsZSUUKw
	 J8pSXB4xID4reTlQfLYno68AtS0M8mfz20uDBQhJnJblL/QrdBgpqt3XhVIpzKZtWu
	 LOe9wE1hZTluV7lXQ40sbhrDV8bQrUtaL1IyRcDFE2156SrQOM6+QG26ig6nThTcZV
	 q3x9VoHsQUHUg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39f75e1e9d9so26093551fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:35:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrrErMeJusocqd4lGU2ZaTdFZrKDuT3i5FFyMnBm4OU+9PmAvJ1N0RHPqxyYMEFZDYx9eNenJARg4ihLgERhA+j@lists.infradead.org
X-Gm-Message-State: AOJu0YzHJJtEiKLRTYIRHsXXQSNvzkp1Z2k23nCCLyG6BTSbm9eb/mEy
	xmKIb4ZzN906LJG1L7PqfIqEE0seNNN5yCD3L7tnyIamhyQA/xHpM4HhHO3IZTYy2YMlxiMpFnH
	Tz64GP7DY0WkMsXy9iMVOctm02erTARY=
X-Received: by 2002:a05:651c:a348:b0:39f:7feb:a07 with SMTP id
 38308e7fff4ca-39f863fde4cmr19415821fa.24.1785774953645; Mon, 03 Aug 2026
 09:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <c48ba85b9e4478d51afde4f36839fd1c1d363b23.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <c48ba85b9e4478d51afde4f36839fd1c1d363b23.1785772659.git.jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 00:35:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v67S+ZzKKg8uuMa2hwOV5Sd62vKCwUFFgZY6j5yAy6adfQ@mail.gmail.com>
X-Gm-Features: AUfX_mzh5MHTOP_BoCG6ZOvMRIrsBiiV2OmKYqiAQb1qTkbYX3vB0mzChVE8uZA
Message-ID: <CAGb2v67S+ZzKKg8uuMa2hwOV5Sd62vKCwUFFgZY6j5yAy6adfQ@mail.gmail.com>
Subject: Re: [PATCH 03/13] drm/sun4i: vi scaler: Restore opaque alpha in video modes
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
> The DE3 mixer initialization clears the entire mixer register space. This
> also clears VSU_GLOBAL_ALPHA, despite its hardware reset value being 0xff=
.
>
> The VI scaler uses Video Normal mode for subsampled YUV formats. In this
> mode, VSU_GLOBAL_ALPHA provides the scaler output alpha. Leaving the
> register at zero causes the scaler to produce fully transparent output.
>
> Set VSU_GLOBAL_ALPHA to 0xff whenever configuring a DE3 or newer VI
> scaler. The register is ignored in UI scaling mode.
>
> Fixes: c50519e6db4d ("drm/sun4i: Add basic support for DE3")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 2 ++
>  drivers/gpu/drm/sun4i/sun8i_vi_scaler.h | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/su=
n4i/sun8i_vi_scaler.c
> index d4412a62c2f0..a5cc99981006 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
> @@ -975,6 +975,8 @@ void sun8i_vi_scaler_setup(struct sun8i_layer *layer,
>
>                 regmap_write(layer->regs,
>                              SUN50I_SCALER_VSU_SCALE_MODE(base), val);
> +               regmap_write(layer->regs,
> +                            SUN50I_SCALER_VSU_GLB_ALPHA(base), 0xff);
>         }
>
>         regmap_write(layer->regs,
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h b/drivers/gpu/drm/su=
n4i/sun8i_vi_scaler.h
> index 245fe2f431c3..d89c0cbe188d 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
> @@ -36,6 +36,7 @@
>  #define SUN50I_SCALER_VSU_EDSCL_CTRL(base)             ((base) + 0x28)
>  #define SUN50I_SCALER_VSU_ANGLE_THR(base)              ((base) + 0x2c)
>  #define SUN8I_SCALER_VSU_OUTSIZE(base)         ((base) + 0x40)
> +#define SUN50I_SCALER_VSU_GLB_ALPHA(base)      ((base) + 0x44)
>  #define SUN8I_SCALER_VSU_YINSIZE(base)         ((base) + 0x80)
>  #define SUN8I_SCALER_VSU_YHSTEP(base)          ((base) + 0x88)
>  #define SUN8I_SCALER_VSU_YVSTEP(base)          ((base) + 0x8c)
> --
> 2.43.0
>

