Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A52C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 14:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubJM8MS7/gKS3ZsjfdQz7evp9hBJp3GB1TUeMn7GoGg=; b=vRKlPuNhydz2aerJPTq4IeePrB
	jpp2dH5rOUcUJR7mm4h9BtpAsmamiq4c2QhLW78Qsi6JMNNRXANHoI3AdwHmsOlY5G0yVwevCjxQ8
	TqWH37NoLTWB2BgC4TuH/Ia39N33IozBdfijs2K7Pe4oJkvp3fsJII24QHHE1pCMaeixzPcLpYXre
	Y6HlRQTjxAG7yQCSWeZ5RpuYsH519qq5R1XGNOCR3KnmmpJBFtHJYI/TSDu58PegE0ESKaY/7HGmu
	9HouQPI75A4WvO1FUIoxyEqny+7/iL9oDvNiDXXxCHCajIVAI0vE9tEb8Yq1HizCQRsLneB9+Otar
	zqJVd2tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6rrq-00000004QGu-0bDx;
	Mon, 21 Apr 2025 14:11:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6rpy-00000004Q5x-0xn4;
	Mon, 21 Apr 2025 14:09:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A7C82A4BCFC;
	Mon, 21 Apr 2025 14:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7371CC4CEE4;
	Mon, 21 Apr 2025 14:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745244568;
	bh=WYXRdWWnpgKTBUjE3p3Mz4j6ZPQ5w+kSpIXksD6tN68=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tKOto67RaYFfUzDqmXLJK8aJvIy6sKsvTmLnTsCMOs1O56tH9Vo7gIqyO4PVryOVx
	 CEyJ+toAkHjPasJBv0Z3DXpxfFqHrbFljL43OR4d6crPNgIMej7BUXfdTN9WGaeZAN
	 66LtIk5lebiXDOASN6aXc6yVX9HCcieeI/c0+urJtsyFl8MW75Tmkb344gDvsq2onb
	 /RlUMqZTyMiy5nWzFScGFVrrB65pBBJdefuMoEtDx/XAQB3Fqo5GhQmRH7/v0K+XE5
	 eU5M9RUToJ66L5zJz9u6nQkG+dTwd4P13vVRfpXEDEnDOMXDOYozSV6SYRg221jsi1
	 KBRyzu4ByURVg==
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b00e3c87713so3300873a12.2;
        Mon, 21 Apr 2025 07:09:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUcUvxZl9gLR3f+DfcT1PoLqf6AWOhWRBjoiAycX/d40Ubjz0W3zTPCMFxNdTUdM9l94V92TXSA5rC1eWFWJCuK@lists.infradead.org, AJvYcCXXET9vPbaBCObDLlQnpyb5v5FxjSDgCaOmNxqrlhpDdFVvuXN+dfRhR7fK9nBqTHjouB/iIS99YPFQiTZMCEo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmz3GydBoNheWUErDzqyiCcGd5RVKuuVFDjZ5+a0RzL8mj7RF9
	8y3A3eAX2Rx0hjxzkt3rhms1yP7OLvWa76LGvoB89YN/w7qxPMIn2bRjuj5UwuN2aYGgb90j2z8
	ltSthm3dW0man9M8JdFLl2eT1Wg==
X-Google-Smtp-Source: AGHT+IGS9uz21hRPGhlJ4UMeP7sf9taxpboldIRO54ve55gM+l4Zm966plB6VQpw/Y3RbDZK4VoWG7AVra1mhRruBl4=
X-Received: by 2002:a17:90b:248e:b0:309:cf0b:cb37 with SMTP id
 98e67ed59e1d1-309cf0bcb7amr532295a91.7.1745244568069; Mon, 21 Apr 2025
 07:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com> <20250415104321.51149-16-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250415104321.51149-16-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Apr 2025 22:10:25 +0800
X-Gmail-Original-Message-ID: <CAAOTY__Tvrx2vfss16jecTQsQU2oSjEmTGoFZZq5ZJZmgyypqg@mail.gmail.com>
X-Gm-Features: ATxdqUGktFaFTj-3L_NPDr-W-E9d8SqAjhcUgYMe9iV6oOSARNcqSrzlMtbkNXg
Message-ID: <CAAOTY__Tvrx2vfss16jecTQsQU2oSjEmTGoFZZq5ZJZmgyypqg@mail.gmail.com>
Subject: Re: [PATCH v9 15/23] drm/mediatek: mtk_hdmi: Improve
 mtk_hdmi_get_all_clk() flexibility
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, 
	jie.qiu@mediatek.com, junzhi.zhao@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com, 
	ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com, 
	jason-jh.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_070930_411175_91597482 
X-CRM114-Status: GOOD (  23.29  )
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

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2025=E5=B9=B44=E6=9C=8815=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:4=
4=E5=AF=AB=E9=81=93=EF=BC=9A
>
> In preparation for splitting common bits of this driver and for
> introducing a new version of the MediaTek HDMI Encoder IP, improve
> the flexibility of function mtk_hdmi_get_all_clk() by adding a
> pointer to the clock names array and size of it to its parameters.
>
> Also change the array of struct clock pointers in the mtk_hdmi
> structure to be dynamically allocated, and allocate it in probe.

Build error happen,

../drivers/gpu/drm/mediatek/mtk_hdmi.c: In function
\u2018mtk_hdmi_get_cec_dev\u2019:
../drivers/gpu/drm/mediatek/mtk_hdmi.c:1353:15: error: too few
arguments to function \u2018mtk_hdmi_get_all_clk\u2019
 1353 |         ret =3D mtk_hdmi_get_all_clk(hdmi, np);
      |               ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/mediatek/mtk_hdmi.c:1075:12: note: declared here
 1075 | static int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi, struct
device_node *np,
      |            ^~~~~~~~~~~~~~~~~~~~

I've apply some patches of this series to mediatek-drm-next [1], and
I've already fixed some build error.
I wonder how many error would happen in rest patches,
so please fix the build error in rest patches and resend patches.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index b4fbd2e60089..b17f8df145eb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -159,7 +159,7 @@ struct mtk_hdmi {
>         struct phy *phy;
>         struct device *cec_dev;
>         struct i2c_adapter *ddc_adpt;
> -       struct clk *clk[MTK_HDMI_CLK_COUNT];
> +       struct clk **clk;
>         struct drm_display_mode mode;
>         bool dvi_mode;
>         struct regmap *sys_regmap;
> @@ -1072,17 +1072,18 @@ static const char * const mtk_hdmi_clk_names[MTK_=
HDMI_CLK_COUNT] =3D {
>         [MTK_HDMI_CLK_AUD_SPDIF] =3D "spdif",
>  };
>
> -static int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi,
> -                               struct device_node *np)
> +static int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi, struct device_nod=
e *np,
> +                               const char * const *clock_names, size_t n=
um_clocks)
>  {
>         int i;
>
> -       for (i =3D 0; i < ARRAY_SIZE(mtk_hdmi_clk_names); i++) {
> -               hdmi->clk[i] =3D of_clk_get_by_name(np,
> -                                                 mtk_hdmi_clk_names[i]);
> +       for (i =3D 0; i < num_clocks; i++) {
> +               hdmi->clk[i] =3D of_clk_get_by_name(np, clock_names[i]);
> +
>                 if (IS_ERR(hdmi->clk[i]))
>                         return PTR_ERR(hdmi->clk[i]);
>         }
> +
>         return 0;
>  }
>
> @@ -1377,15 +1378,15 @@ static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *=
hdmi, struct device *dev, struc
>         return 0;
>  }
>
> -static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
> -                                  struct platform_device *pdev)
> +static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platfor=
m_device *pdev,
> +                                  const char * const *clk_names, size_t =
num_clocks)
>  {
>         struct device *dev =3D &pdev->dev;
>         struct device_node *np =3D dev->of_node;
>         struct device_node *remote, *i2c_np;
>         int ret;
>
> -       ret =3D mtk_hdmi_get_all_clk(hdmi, np);
> +       ret =3D mtk_hdmi_get_all_clk(hdmi, np, clk_names, num_clocks);
>         if (ret)
>                 return dev_err_probe(dev, ret, "Failed to get clocks\n");
>
> @@ -1634,6 +1635,7 @@ static int mtk_hdmi_probe(struct platform_device *p=
dev)
>  {
>         struct mtk_hdmi *hdmi;
>         struct device *dev =3D &pdev->dev;
> +       const int num_clocks =3D MTK_HDMI_CLK_COUNT;
>         int ret;
>
>         hdmi =3D devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> @@ -1643,7 +1645,11 @@ static int mtk_hdmi_probe(struct platform_device *=
pdev)
>         hdmi->dev =3D dev;
>         hdmi->conf =3D of_device_get_match_data(dev);
>
> -       ret =3D mtk_hdmi_dt_parse_pdata(hdmi, pdev);
> +       hdmi->clk =3D devm_kcalloc(dev, num_clocks, sizeof(*hdmi->clk), G=
FP_KERNEL);
> +       if (!hdmi->clk)
> +               return -ENOMEM;
> +
> +       ret =3D mtk_hdmi_dt_parse_pdata(hdmi, pdev, mtk_hdmi_clk_names, n=
um_clocks);
>         if (ret)
>                 return ret;
>
> --
> 2.49.0
>

