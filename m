Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C5DC36014
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 10:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0D56V4bGfpX/TU9e5gmFluYXKUdNZrEsrQeh3MS0+Bo=; b=ZWiVSbpM94/+VQdfohulncyTgq
	XBDusQ14ZXGkTtcK/K0vxxbMzDSjtTbkGo2v/qNuj9NRdOR2h/48kBaIHMyU15avtsKkoAweyRIhx
	maHIQ6le2Rqg8fPGOk/NNf5o4uNj6WYF5zY/W/apNOoxdINKFVy6OQP2z97e+by+CgYKejYDRDJIw
	Ef8h6P9/YDcSwp2+R7rRFFn2mAODmJegWiPcE4riatrIcZqP6oOlE4YFBytxeSG0aj19RVhshSMBD
	rrdRZPWAQPxf5eUqX1VHzuyt6+4EwpDdRbZJS8rQq6BWVvnGB5s3g/O2CQmjMhpV1LwADRisv5erz
	94WWo8GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvDB-00000005meA-0k3k;
	Wed, 02 Apr 2025 10:20:45 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvBP-00000005mFY-1np4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 10:18:57 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-30332dfc820so11472911a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 03:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743589135; x=1744193935; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D56V4bGfpX/TU9e5gmFluYXKUdNZrEsrQeh3MS0+Bo=;
        b=Tzm+KDXj/3/Oq57fbby9HWzTdGybfxZHCnkE89CaFYTUFFAaI/ecIv59bJEX+Yl6FU
         2Nt689i+zpCbNLhiD/+HI5mt+lAcGHCzh2POmQn7NXpR3wM8Yem63BAwAhv4cRLRH9He
         LtL6R2aBxmmywohr/KxcVuGroNxq67/ffN4DI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743589135; x=1744193935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0D56V4bGfpX/TU9e5gmFluYXKUdNZrEsrQeh3MS0+Bo=;
        b=d39NYIQoXQzXc+T8H/VlulfFPuTofT8l7qvwZwrUOgxtwcnaI35xpd2AnNGhML0bTp
         vMkiNkpoOBt21ZFDv6cEsJ8PqMC25Cv/REOBuCURPWTG5TmgvoxNsH4eG9FrfXBhgHmW
         JcWZnEPoGyO1gHv9vNRhS91NJq5v6n0vD0lEBXJBJ4Z3AmhotC99gvgVfvqQZWbs68vu
         /FU4xzV2wNaUDUIO9HPQ7gEv4UwYsBSZ9LtDeDXv0XCVDc9WPceQY0+DzbmGot83+ROY
         dhLiFfg/+HQk+3SUGL9YHcTA1nnODMkDSNbK6ZhMjTfqb7PWnpXfZ4InS0X+Q1ZEtOsB
         iaCw==
X-Forwarded-Encrypted: i=1; AJvYcCWhE7Q0Dz64TPTaj2PJuKL93n2YIoayXjgjiiRJsnT7mSU8ACkpgzPklb/Dpgsh+AFSBn7pHuWC2ElLyd2azl3Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8tp1Cevr0JnZg//H/VdJs4/qG00Dw+1dVcMf1UFbhP0foyGTx
	7pqFXTAJYfF1oUl8mVXzOFsKuPyOj1bboGkU/aUcuHYnxxJ0jg4SD8TCUI94ZGh3YwM3T/3lMW/
	IzhvSubHrszO91TbHm7EJKWUIkY/UlIdB0F4s
X-Gm-Gg: ASbGncsWOj4XtjQvfqdFKq2KecFfmsgp7hxZXgzSkcX0aDf2m2kTlaQnr7aadGy0bfc
	Ul+zAHoQ8/8auPR2/opmgB5wrhjrMaQ+PmQ8pK5Kch8xJwi3k+g4hn7YGXIBsoLmciSUpE/ZY6F
	c/Ebe27vcQuzhiLcD/6DzLVTFDlPsTPbcw1f6YeRZVZ4XMDW7LMCwQ
X-Google-Smtp-Source: AGHT+IGQrnkGyKn8dVTSUjKIJxy2/wcmbcJv3W5smbWJ2t/E7cpQH6SMGOxQZ5dG0vuNvno9IYMLbv3UhEax8FtatNA=
X-Received: by 2002:a17:90a:c88b:b0:2ff:7c2d:6ff3 with SMTP id
 98e67ed59e1d1-3056ef48b43mr2719742a91.35.1743589134726; Wed, 02 Apr 2025
 03:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com> <20250402083628.20111-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402083628.20111-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 18:18:41 +0800
X-Gm-Features: AQ5f1Jr3BoD2em-LznhL9zgkOSxDEEueTpI7DlFY2HYoRHnyStO_tGh8xaXUAvA
Message-ID: <CAGXv+5GsoHN5mVe_kEP+oAzxa9HqgfhoiDqvO3xiQurFrvQ3qA@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] drm/mediatek: Fix kobject put for component sub-drivers
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
X-CRM114-CacheID: sfid-20250402_031855_471832_6705E773 
X-CRM114-Status: GOOD (  22.45  )
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
> In function mtk_drm_get_all_priv(), this driver is incrementing

              ^ mtk_drm_get_all_drm_priv()

> the refcount for the sub-drivers of mediatek-drm with a call to
> device_find_child() when taking a reference to all of those child
> devices.

Looking closer, that function is also missing a platform_device_put()
to match of_find_device_by_node().

> When the component bind fails multiple times this results in a
> refcount_t overflow, as the reference count is never decremented:
> fix that by adding a call to put_device() for all of the mmsys
> devices in a loop, in error cases of mtk_drm_bind() and in the
> mtk_drm_unbind() callback.
>
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi =
mmsys support")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index a8fbccb50c74..6b31df587507 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -676,6 +676,10 @@ static int mtk_drm_bind(struct device *dev)
>         for (i =3D 0; i < private->data->mmsys_dev_num; i++)
>                 private->all_drm_private[i]->drm =3D NULL;
>  err_put_dev:
> +       for (i =3D 0; i < private->data->mmsys_dev_num; i++) {
> +               /* For device_find_child in mtk_drm_get_all_priv() */
> +               put_device(private->all_drm_private[i]->dev);
> +       }
>         put_device(private->mutex_dev);
>         return ret;
>  }
> @@ -683,6 +687,7 @@ static int mtk_drm_bind(struct device *dev)
>  static void mtk_drm_unbind(struct device *dev)
>  {
>         struct mtk_drm_private *private =3D dev_get_drvdata(dev);
> +       int i;
>
>         /* for multi mmsys dev, unregister drm dev in mmsys master */
>         if (private->drm_master) {
> @@ -690,6 +695,10 @@ static void mtk_drm_unbind(struct device *dev)
>                 mtk_drm_kms_deinit(private->drm);
>                 drm_dev_put(private->drm);
>
> +               for (i =3D 0; i < private->data->mmsys_dev_num; i++) {

Just FYI you can also declare the int within the for statement.

ChenYu

> +                       /* For device_find_child in mtk_drm_get_all_priv(=
) */
> +                       put_device(private->all_drm_private[i]->dev);
> +               }
>                 put_device(private->mutex_dev);
>         }
>         private->mtk_drm_bound =3D false;
> --
> 2.48.1
>

