Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A8AC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 09:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2JNszX6iZTEKfz+6ykvGTqM6KFlJFkA7aYcjD0/BdY=; b=C1a2cPzXqxyG/LGa/s6C3RoUm+
	AjdL88KyrEct8W4P8IBMYys1ljHUcFLgU/dBJUNWGNLaoRRwxxT2dpErXDKjZwYUskJ9wdMAbPbPv
	Olk/00vz6PErO9wB1c1qwMiTammZWL9hsC4JWVxzTIBIupvd0PZaNhtIIJRogi9k1B4C/S1miK8s/
	w/jB6qdp3525qpah47xmzo6TJ42MHfpXr0MEqm7YA4Fo2e8vHqtvoCKkd8gpaeBPWiMCo60W75gPZ
	AzYLIZZBuqzMBUh5bHktDw7O4ABYmxPOdS9sr8HB8J8kgvIdlWAGcRh6vCSfWj3k4jRl0c9ut/8ea
	luUe1VNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuaO-00000005iPs-1Fk7;
	Wed, 02 Apr 2025 09:40:40 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuY4-00000005i1v-2ClK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 09:38:17 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30613802a6bso65533691fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 02:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743586695; x=1744191495; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2JNszX6iZTEKfz+6ykvGTqM6KFlJFkA7aYcjD0/BdY=;
        b=MX7jFBsYFFmqKSfXE0dMfPAonivzCHj41g0Z9VT9DatObbBm7hWqJ8cGou6xneQSNe
         xo0EHgXzNSo1Lg92IbplQDvWt+Evnk75TwcZGGlNzu5/Irn8qT3UAUvuxTjJkiOobbUV
         NYPEMD7uYsy24mcDI8ZYc+TnacYt/RX80QF8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743586695; x=1744191495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2JNszX6iZTEKfz+6ykvGTqM6KFlJFkA7aYcjD0/BdY=;
        b=wWl/KSy7lplUeJBK8NmFvud45YZda58H8ML1Yw8/a7d74zGMvNaa797rkXeKuZVITG
         Tq0Z36zwvuWS66kXgC7I5XPUCCEzx3EstwrnVQpohFoteIZjpFusoAQ5irnqiwYz9jAK
         54uh3Ier25DqzkkZaKFBNaMaxWicyJLMmKWWIBEgi16lWCjSHUX7lPfU+9+b5VmTcgtR
         tfei3zCFXp3CXdU2TX+PiVF9FtCRXpTGWBkBqvrV6558Z/8K+S9EA5qVAxiQrCUR9h46
         K72wMBATKz+MhyGaeRW6jMyzjHC8q32DTZceOFermaa8kSdnlw2t6l7upXGGc9EYdNve
         ojEA==
X-Forwarded-Encrypted: i=1; AJvYcCVztQx6PgApSfl8OChymfZwX7xYRH1t7UTJIH5QAIArz45Z1N+S5A6B8hUGO+B3/B22DoAvp5BTIqHKcsYvSxu6@lists.infradead.org
X-Gm-Message-State: AOJu0YyFM/imzDSYHmwR4vosfwGMFKV2gf8FsL+rlO65SbpM8wdevu37
	Y2Gb2Vx/2sBgyc944TIIlW044r5EIXzxI9UNMW4FaexSAzZPOaFjLCgYYFtIrPRGU98muqHc1ww
	Lj7BHdihErUfA502NGfW4bIp1v7R2bv8HF/wx
X-Gm-Gg: ASbGncsuI7Tcd8EqGFGOW82NEXyHRzw7IWtSNlJ6BKShwMMlot8kjFqtFknoWIVbeU5
	leQXqgVLYddACaqTD0Qs/5m+eOQ70mAyVvialgbMWwONMnpWKncRlKkUaZeOG25GNpXZcaS3eR2
	0EiUkwY342WrBigWPeXcHxkimO7pW5Q47l+/tO/DN+IqAjaoHl0lnL4eXLsxoPYsI=
X-Google-Smtp-Source: AGHT+IExYrNEjA4pPxITL5Kgnipvtbv102T/YS0lH31Fsyobnp9W1LSzaQUExnLdiCH6E51BoFuI8ihy0vHN4Nlyq+I=
X-Received: by 2002:a2e:be0f:0:b0:30c:5c6:91e0 with SMTP id
 38308e7fff4ca-30de0231a0cmr50673981fa.2.1743586694676; Wed, 02 Apr 2025
 02:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com> <20250402083628.20111-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402083628.20111-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 17:38:03 +0800
X-Gm-Features: AQ5f1Jo5jbEeaCvlhXWHAtzwNK4wbBL1go7L3GIt1qsXbC424ywOaYMmnHcwKAY
Message-ID: <CAGXv+5E1qShE1LqgFL6rrgRzjwFUPoBqYdhO-sgNzmMqQsMS0Q@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] drm/mediatek: mtk_disp_ovl: Enable/disable
 interrupt on bind/unbind
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, nancy.lin@mediatek.com, 
	ck.hu@mediatek.com, djkurtz@chromium.org, littlecvr@chromium.org, 
	bibby.hsieh@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_023816_558423_321C39EA 
X-CRM114-Status: GOOD (  25.69  )
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

On Wed, Apr 2, 2025 at 4:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The OVL driver is installing an ISR in the probe function but, if
> the component is not bound yet, the interrupt handler may call the
> vblank_cb ahead of time (while probing other drivers) or too late
> (while removing other drivers), possibly accessing memory that it
> should not try to access by reusing stale pointers.
>
> In order to fix this, add a new `irq` member to struct mtk_disp_ovl
> and then set the NOAUTOEN flag to the irq before installing the ISR
> to manually call enable_irq() and disable_irq() in the bind and
> unbind callbacks respectively.
>
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT817=
3.")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index df82cea4bb79..1bff3a1273f6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -161,6 +161,7 @@ struct mtk_disp_ovl {
>         struct drm_crtc                 *crtc;
>         struct clk                      *clk;
>         void __iomem                    *regs;
> +       int                             irq;
>         struct cmdq_client_reg          cmdq_reg;
>         const struct mtk_disp_ovl_data  *data;
>         void                            (*vblank_cb)(void *data);
> @@ -587,12 +588,18 @@ void mtk_ovl_bgclr_in_off(struct device *dev)
>  static int mtk_disp_ovl_bind(struct device *dev, struct device *master,
>                              void *data)
>  {
> +       struct mtk_disp_ovl *priv =3D dev_get_drvdata(dev);
> +
> +       enable_irq(priv->irq);
>         return 0;
>  }
>
>  static void mtk_disp_ovl_unbind(struct device *dev, struct device *maste=
r,
>                                 void *data)
>  {
> +       struct mtk_disp_ovl *priv =3D dev_get_drvdata(dev);
> +
> +       disable_irq(priv->irq);
>  }
>
>  static const struct component_ops mtk_disp_ovl_component_ops =3D {
> @@ -605,16 +612,15 @@ static int mtk_disp_ovl_probe(struct platform_devic=
e *pdev)
>         struct device *dev =3D &pdev->dev;
>         struct mtk_disp_ovl *priv;
>         struct resource *res;
> -       int irq;
>         int ret;
>
>         priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>         if (!priv)
>                 return -ENOMEM;
>
> -       irq =3D platform_get_irq(pdev, 0);
> -       if (irq < 0)
> -               return irq;
> +       priv->irq =3D platform_get_irq(pdev, 0);
> +       if (priv->irq < 0)
> +               return priv->irq;
>
>         priv->clk =3D devm_clk_get(dev, NULL);
>         if (IS_ERR(priv->clk))
> @@ -635,10 +641,11 @@ static int mtk_disp_ovl_probe(struct platform_devic=
e *pdev)
>         priv->data =3D of_device_get_match_data(dev);
>         platform_set_drvdata(pdev, priv);
>
> -       ret =3D devm_request_irq(dev, irq, mtk_disp_ovl_irq_handler,
> +       irq_set_status_flags(priv->irq, IRQ_NOAUTOEN);
> +       ret =3D devm_request_irq(dev, priv->irq, mtk_disp_ovl_irq_handler=
,
>                                IRQF_TRIGGER_NONE, dev_name(dev), priv);

Use IRQF_NO_AUTOEN here? Also, IRQF_TRIGGER_NONE can be dropped.

Make sense otherwise.

ChenYu

>         if (ret < 0)
> -               return dev_err_probe(dev, ret, "Failed to request irq %d\=
n", irq);
> +               return dev_err_probe(dev, ret, "Failed to request irq %d\=
n", priv->irq);
>
>         pm_runtime_enable(dev);
>
> --
> 2.48.1
>

