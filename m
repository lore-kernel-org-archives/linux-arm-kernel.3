Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65729C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 15:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PU/sixtY71LvEi4Fz6DQo24QLlRpV93TUetQH3mfBu0=; b=wmNZVWYpw7GCIg6lKdr2FBETmW
	Y4rXsJLvo3Q7Lbm71/2wrcgnHE06M0qCTnFoAk1+PgxjPhdvjdO500nCBvZirKcjngGT77c4epCTC
	HlPXTfGLDwEK4ronSJGZP+kGQgVkey3xhcDEehwLRniJmBgEmFBWsDyTxYZHqic/+E9dgRI9iE6IC
	SdIn1JCjiWCCnNOaVc9rXrMpXbZZEejhE5e3yg32YCK4gKKrwJyCNVg8gj4ojDL4hwNi87kjah3HD
	3Fn1qqfoW8DudasaO0ckvQtZ64HwF/pqgReCb84zEYqK2PVRUbSt8poJ91nYFiSPbPhF+n6efZvFm
	v6sH7N/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9QmN-00000006pWi-2YbC;
	Mon, 28 Apr 2025 15:52:23 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Qfe-00000006oJw-01oI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 15:45:28 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-70565ccf3bcso52198007b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 08:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745855124; x=1746459924; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PU/sixtY71LvEi4Fz6DQo24QLlRpV93TUetQH3mfBu0=;
        b=hDGWxTAKgoNHmssjd0ZblOP7iVduzYc9lactbLBWtt842FyFSKLFRNViZ6DA1BEluI
         QjLs3vVRwf9cAvRrS6gYydWXuiXOuBIpvPCUnhZEKZFc3M0I3zPxDvLGmzkSvJAC75og
         uJlMl7pMY93hOzaNWO6EMwyiZinEbke0Ykq7p0jAyd/+RNfE1PyEdIFHLaBTNE/mvoZG
         iUv8oosM9NfPRwPTeGbYWHW5CGTG9RpVu7oUgoI6aX1zKejz1anspvoVEbbjhhivA2s3
         d4VIUi/krwmNtoJfxfR2kUS1LFMwCl0T5ESmo4Dm4BxyGQUB7HgWhvT7AlGxW8WGTHDU
         ffaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745855124; x=1746459924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PU/sixtY71LvEi4Fz6DQo24QLlRpV93TUetQH3mfBu0=;
        b=sW7kyydBcb9eYzn6Uf9hV5Lfrm7YxJ2qWe/J3SSWe1IblZgiWTCS9XfxR29E7ttsur
         +cmES1Ua9wPD7i6Dmah77zDg1k0SPbKCvXUQXztjhA+SYLLQhbdwgbJT1zBOXE4Ba2J2
         p4V2zeV3Vjmk/+INl329Vi+zEiFS4EFKqhZucnbaTe42W6SNxjEoArupIVYkEvfiY5FV
         NUqwm3tQo0q6RK8q+sB2d6z5D/g7MjwOY5cxWvXVTXYeVitzD0f9lwazmmvURKyehzeX
         EscOgLAvsJvaOjTc9X+KCUEIfEm6Ddo/Y8arF4jHos+vEFctc+cdaQ3OF3C8LP1ufWOM
         A/sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSTlN8Z1sF4h0H1PuFbJR0vu7cNz/FpSpEqkD/qNeuSBR+Oo1hktuCIPVjCn+k5m6ALjMWlJaBBxpiXHkcVoRp@lists.infradead.org
X-Gm-Message-State: AOJu0YyWgasISytF6tbUt9W8Huh1eokJYvrOmr3S6iSmCACNgeBgepJ+
	F4OVsnBxsEJ0opWvFpeANWXXk+lMTvBWbhquXJ4tEIEZGY0mrHOPWiYzkPDmfRZkDF35f/c6vAX
	izaeAKZpVbrKM/weLcQ1RBjMM/Oz8LN50T83Uqg==
X-Gm-Gg: ASbGncufYrVK63Q+ElJXXX/ryncQXi0dLUgce/8kyaKjj9GfOjphGSTF90ymjNRRava
	ODfhNTxoNaj3PvGLpw/dUpr5WTxbNeRqyWYkr9p/OVhsie7vdtcuDGtnW/FeOgokQosNk1vjtl7
	2XqZVL8cTtqLJl1kCao8i9DdiXHA5HVle6CLO4L5VoXY+0W6Ppls5kdKUUgIjQkz0=
X-Google-Smtp-Source: AGHT+IEF9MSlc844cuGTIRN/jaSQKExcmjeU1UeJwf54mw2x30vI+iBpqqWrdgOqbrjU+FD8mBfkUxmgGRAbgf2Y+6M=
X-Received: by 2002:a05:6902:2701:b0:e72:d88e:7a9a with SMTP id
 3f1490d57ef6-e73500e777emr136870276.45.1745855124717; Mon, 28 Apr 2025
 08:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-27-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-27-8f91a404d86b@bootlin.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 28 Apr 2025 16:45:08 +0100
X-Gm-Features: ATxdqUF8zRJ18UCRRqpYogjOFDok1I-AvafpDPPJcxH-STXodhofR9H1CLM8tQg
Message-ID: <CAPY8ntDwK0DZ6sThryDRBUgjTb+muNHtRNp+LohTs6+FWeB5TQ@mail.gmail.com>
Subject: Re: [PATCH v2 27/34] drm/vc4: convert to devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_084526_050025_DCC41BBF 
X-CRM114-Status: GOOD (  22.32  )
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

On Thu, 24 Apr 2025 at 20:01, Luca Ceresoli <luca.ceresoli@bootlin.com> wro=
te:
>
> This is the new API for allocating DRM bridges.
>
> This driver already implements refcounting of the struct vc4_dsi, which
> embeds struct drm_bridge. Now this is a duplicate of the refcounting
> implemented by the DRM bridge core, so convert the vc4_dsi_get/put() call=
s
> into drm_bridge_get/put() calls and get rid of the driver-specific
> refcounting implementation.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Thanks.

> ---
>
> Cc: "Ma=C3=ADra Canal" <mcanal@igalia.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
>
> Changed in v2:
> - fix error code checking
> ---
>  drivers/gpu/drm/vc4/vc4_dsi.c | 34 +++++-----------------------------
>  1 file changed, 5 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.=
c
> index efc6f6078b026764c59cfb2a33b28a88b7018c3a..458e5d9879645f18bcbcaeeb7=
1b5f1038f9581da 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -552,8 +552,6 @@ struct vc4_dsi {
>         struct vc4_encoder encoder;
>         struct mipi_dsi_host dsi_host;
>
> -       struct kref kref;
> -
>         struct platform_device *pdev;
>
>         struct drm_bridge *out_bridge;
> @@ -1622,29 +1620,11 @@ static void vc4_dsi_dma_chan_release(void *ptr)
>         dsi->reg_dma_chan =3D NULL;
>  }
>
> -static void vc4_dsi_release(struct kref *kref)
> -{
> -       struct vc4_dsi *dsi =3D
> -               container_of(kref, struct vc4_dsi, kref);
> -
> -       kfree(dsi);
> -}
> -
> -static void vc4_dsi_get(struct vc4_dsi *dsi)
> -{
> -       kref_get(&dsi->kref);
> -}
> -
> -static void vc4_dsi_put(struct vc4_dsi *dsi)
> -{
> -       kref_put(&dsi->kref, &vc4_dsi_release);
> -}
> -
>  static void vc4_dsi_release_action(struct drm_device *drm, void *ptr)
>  {
>         struct vc4_dsi *dsi =3D ptr;
>
> -       vc4_dsi_put(dsi);
> +       drm_bridge_put(&dsi->bridge);
>  }
>
>  static int vc4_dsi_bind(struct device *dev, struct device *master, void =
*data)
> @@ -1655,7 +1635,7 @@ static int vc4_dsi_bind(struct device *dev, struct =
device *master, void *data)
>         struct drm_encoder *encoder =3D &dsi->encoder.base;
>         int ret;
>
> -       vc4_dsi_get(dsi);
> +       drm_bridge_get(&dsi->bridge);
>
>         ret =3D drmm_add_action_or_reset(drm, vc4_dsi_release_action, dsi=
);
>         if (ret)
> @@ -1810,15 +1790,12 @@ static int vc4_dsi_dev_probe(struct platform_devi=
ce *pdev)
>         struct device *dev =3D &pdev->dev;
>         struct vc4_dsi *dsi;
>
> -       dsi =3D kzalloc(sizeof(*dsi), GFP_KERNEL);
> -       if (!dsi)
> -               return -ENOMEM;
> +       dsi =3D devm_drm_bridge_alloc(&pdev->dev, struct vc4_dsi, bridge,=
 &vc4_dsi_bridge_funcs);
> +       if (IS_ERR(dsi))
> +               return PTR_ERR(dsi);
>         dev_set_drvdata(dev, dsi);
>
> -       kref_init(&dsi->kref);
> -
>         dsi->pdev =3D pdev;
> -       dsi->bridge.funcs =3D &vc4_dsi_bridge_funcs;
>  #ifdef CONFIG_OF
>         dsi->bridge.of_node =3D dev->of_node;
>  #endif
> @@ -1836,7 +1813,6 @@ static void vc4_dsi_dev_remove(struct platform_devi=
ce *pdev)
>         struct vc4_dsi *dsi =3D dev_get_drvdata(dev);
>
>         mipi_dsi_host_unregister(&dsi->dsi_host);
> -       vc4_dsi_put(dsi);
>  }
>
>  struct platform_driver vc4_dsi_driver =3D {
>
> --
> 2.49.0
>

