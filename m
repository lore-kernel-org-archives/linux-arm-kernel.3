Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43BDC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 06:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPFx8UgUAY0xlIDn/x5aIYb1lovd1B9jsWSk1FiXXns=; b=jT5A7e8bf1nxTfmn92rT5sXrSl
	cZK/kn6teLAcPKqGJNGwO5tM66EE3wruh6x0uiXPfcHMnrtFgU6bL5q4i3UMmydp2lnc++7gaTMhA
	7utsxUyg1nTwoivRT7EZUovIVi6EvuPvbJtGbuJScs+F0kMUeC3vlMDgllbQWc3Ld4BrMUeAOGsA4
	YkyrQGbMsoIV50404a4FAmSO7pOxzNGa2nQDrNjfg/WtpNUN9KLNQER96sCkaJyXPD0ARzWPkBLyd
	DKgvyvipOMzjEN0PQsqqZSpHWMFapr0jKk5NlmcYVa/wm/gUCQ0xL3lEGA9j8U4bIJ9nB0ObDNbCk
	kjUXjAEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Ood-00000006Gpe-1KyQ;
	Wed, 09 Apr 2025 06:21:39 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Omq-00000006Gel-0BJJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 06:19:49 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-549967c72bcso7814252e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 23:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744179586; x=1744784386; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPFx8UgUAY0xlIDn/x5aIYb1lovd1B9jsWSk1FiXXns=;
        b=PIwlUrjzSMhEGxKh/QXu9XUbe6lwYmX/9oycvx94itGqXx7/LxWF+JDACHMeZPvlEQ
         tBthxITb2bDN6HeRWGwOV5a/Sl5FNAhsKgwib8OUJoproGv+m9zEZD8M5Xdmqr9FuRiN
         EPk/+nLCUNYhAPNPkPDyxWt+SKv14/EhERynE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744179586; x=1744784386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPFx8UgUAY0xlIDn/x5aIYb1lovd1B9jsWSk1FiXXns=;
        b=kNmUCBBCY+xqXsGPtP6JW4x+PaDrdLkBpAZFG4JkTWmdYf4TJLNcuOA61sD1LmS1LV
         bcQOdgHfK6NMWV4yLkoJy0P1K8LArbI5M1fmw04mEWFOFkgvxpHPzN0PH6Ph9I2CfyIR
         ktNfN9OEVyo7lsjEYQD/fyiF6a3qWU5IVz4LHHeGhPuXdZzPXXjmjHCqDk72yNKI1JqW
         6DNxHAWyg51aZBc4wrI7Q0OFzjfuPKIT3FAoFDm64i//4/qG95Qc9M/uLg7fFkKi0oWq
         E29fGorZ7TuB4NVUd6QBHnMZK1Us65a4igb/bScQAmjtGaY7SqCY8C6R56YUcd3FeGtX
         u7hw==
X-Forwarded-Encrypted: i=1; AJvYcCV0APbMofk7J2bR9SB+weA+BGBmpm0ovEZPgDfHLvYBw9hnHhvpFikEVsHKG5nD9o+u4ORvrGPOfmEP9FNHjHj+@lists.infradead.org
X-Gm-Message-State: AOJu0YzGcDP9X4wne+UB0/KMJT7HAhq17gVqfZFAAMhDL34HsoSczbz8
	PRPdgu0q7OepAJu0gidy3WATTeVd+zi3dz7iNEPI5hbQUMAMQpUvSFO8A4NOMx9X5VYMMNz+Y0X
	R27XP+ffZqtIdSsPWYI3yZRl47pfVMpLsmDKP
X-Gm-Gg: ASbGnct+jLWjX/BI3ymtyy7zJUPUvCnqQkrsYk3hZzQSc0htdKNYmycbOnXlEybp88U
	SljktgVuILCUg9mgZN6f8GhnH1/marhLY2VKCbZHhWx7Fbl33n+EVWLtsPrv1X24iZD6SEu+6oP
	vxzaUJVM+O9SPe2ogGXhylaQapU/Bj2/D7bdn56+x2w/kbBQeTCw==
X-Google-Smtp-Source: AGHT+IF6USYpAM9lg3k8+AOqxfZjq6iN1XgABgZ7lN+hrkpyKB/hsy6JujD3QodyEr1gyD8+wAk4r3Qa2Kqqw1r74QQ=
X-Received: by 2002:a05:6512:1103:b0:545:49d:5474 with SMTP id
 2adb3069b0e04-54c4370f307mr358171e87.20.1744179585702; Tue, 08 Apr 2025
 23:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250403110915.75322-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250403110915.75322-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 9 Apr 2025 14:19:34 +0800
X-Gm-Features: ATxdqUGA8j7J3cMwwhvKkgHKxtLogzcNaUx9TtG6kN-tP3TulVKQHf_ux6bE6j8
Message-ID: <CAGXv+5G8kUg87+JzuCW5sZKHTBA3-CnwSFdrucn_k1rgcpJHOg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dp: Fix hdmi codec and phy driver unregistration
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
X-CRM114-CacheID: sfid-20250408_231948_207432_5FDD2901 
X-CRM114-Status: GOOD (  25.36  )
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

On Thu, Apr 3, 2025 at 7:09=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> During probe, this driver is registering two platform devices: one
> for the HDMI Codec driver and one for the DisplayPort PHY driver.
>
> In the probe function, none of the error cases are unregistering
> any of the two platform devices and this may cause registration
> of multiple instances of those in case this driver returns one or
> more probe deferral(s) in the "wrong" spots.
>
> In order to fix this, add devm actions to unregister those and
> remove the manual calls to platform_device_unregister in the
> mtk_dp_remove() function, as those would otherwise be redundant.
>
> Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
> Fixes: caf2ae486742 ("drm/mediatek: dp: Add support for embedded DisplayP=
ort aux-bus")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 3d4648d2e15f..3eb685a46d99 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2648,6 +2648,13 @@ static const struct hdmi_codec_ops mtk_dp_audio_co=
dec_ops =3D {
>         .hook_plugged_cb =3D mtk_dp_audio_hook_plugged_cb,
>  };
>
> +static void mtk_dp_unregister_pdevs(void *data)
> +{
> +       struct platform_device *ext_pdev =3D data;
> +
> +       platform_device_unregister(ext_pdev);
> +}
> +
>  static int mtk_dp_register_audio_driver(struct device *dev)
>  {
>         struct mtk_dp *mtk_dp =3D dev_get_drvdata(dev);
> @@ -2658,18 +2665,29 @@ static int mtk_dp_register_audio_driver(struct de=
vice *dev)
>                 .data =3D mtk_dp,
>                 .no_capture_mute =3D 1,
>         };
> +       int ret;
>
>         mtk_dp->audio_pdev =3D platform_device_register_data(dev,
>                                                            HDMI_CODEC_DRV=
_NAME,
>                                                            PLATFORM_DEVID=
_AUTO,
>                                                            &codec_data,
>                                                            sizeof(codec_d=
ata));
> -       return PTR_ERR_OR_ZERO(mtk_dp->audio_pdev);
> +       if (IS_ERR(mtk_dp->audio_pdev))
> +               return PTR_ERR(mtk_dp->audio_pdev);
> +
> +       ret =3D devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mt=
k_dp->phy_dev);

Wrong platform device given here. You want audio_pdev instead.


Having briefly looked at this driver, I think it needs more cleanup. :o


ChenYu

> +       if (ret) {
> +               platform_device_unregister(mtk_dp->audio_pdev);
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to add codec unregister devm=
 action");
> +       }
> +       return 0;
>  }
>
>  static int mtk_dp_register_phy(struct mtk_dp *mtk_dp)
>  {
>         struct device *dev =3D mtk_dp->dev;
> +       int ret;
>
>         mtk_dp->phy_dev =3D platform_device_register_data(dev, "mediatek-=
dp-phy",
>                                                         PLATFORM_DEVID_AU=
TO,
> @@ -2679,6 +2697,13 @@ static int mtk_dp_register_phy(struct mtk_dp *mtk_=
dp)
>                 return dev_err_probe(dev, PTR_ERR(mtk_dp->phy_dev),
>                                      "Failed to create device mediatek-dp=
-phy\n");
>
> +       ret =3D devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mt=
k_dp->phy_dev);
> +       if (ret) {
> +               platform_device_unregister(mtk_dp->phy_dev);
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to add phy unregister devm a=
ction");
> +       }
> +
>         mtk_dp_get_calibration_data(mtk_dp);
>
>         mtk_dp->phy =3D devm_phy_get(&mtk_dp->phy_dev->dev, "dp");
> @@ -2848,9 +2873,6 @@ static void mtk_dp_remove(struct platform_device *p=
dev)
>         pm_runtime_disable(&pdev->dev);
>         if (mtk_dp->data->bridge_type !=3D DRM_MODE_CONNECTOR_eDP)
>                 del_timer_sync(&mtk_dp->debounce_timer);
> -       platform_device_unregister(mtk_dp->phy_dev);
> -       if (mtk_dp->audio_pdev)
> -               platform_device_unregister(mtk_dp->audio_pdev);
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> --
> 2.48.1
>

