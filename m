Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C488DCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 15:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulz194QmeBrMLCZK1rETilTzDBFqDAWZtZk/ROvnkfs=; b=PRZWdZZWJVFJDWQEeriNXb3meV
	dtMPTouuUGkmWImKPQ6J3D845TQCESig0BGV4c8FQ0X+4/BTD6i0SVnAq7gHQ717O9WJTF/pm73WU
	rXlgMcAlEbV7y6Hm99l098bVsy74vn87RmEBg2+rYej8fHhdmCjQIy10GFVoUhMPVEI9w6LX+ecgU
	uYJ56gBKi74BEASsE0mOXTQCdu2UJagNYETOUe4jAjUzO1TEwAXkoJUZBEQ+Jm0KDQ3n8I2vlCzgD
	e/ZbzWJq5TiYDYmMs+9Jir0Nav5YM03dLrMy/6NcqjRtC7m918Ym+EH/PsYDxS236ZXMM23hJ5RXE
	AAPizdrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNB45-000000030JA-462p;
	Wed, 13 May 2026 15:00:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNB43-000000030IC-40rl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 15:00:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 07E7E60128
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E85C2BCC7
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778684398;
	bh=b65Hj6vzoGQXDZXC2RU8pJ9mqehhTTIbmi7MEFwB91g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EcCxLE80HyAkiMQl9wnKaOyPCwvsa61x4UC91VHBTAPbnm8GFbgQ57yTZvw3Wp8s6
	 Rpc7y4M19BbqYjr2RiyVoqU+xBmBgJXnEZxmtuLa6S1Wm7UEHwvqwOON63FbNSox83
	 i7K/73sw8czbs7JgtopUuNUoZUSlbHbqWKgaxU29qrec1pk+ucW7KG4mGcNXdaXGVM
	 EwTEPsoRs4fOKtvtKBfoLK/fUNnLY28HE5cV7Wk4dpNoDF1FyUnA4KeqbsPcZZtK4S
	 7nlrcHFJgu/uYW5u6FElDT/k/H63bkM2OxSfPLeHNqAWwDvImeSakle+Bwq8jLN5G+
	 Y5G6YGyjbKUIA==
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1334825de43so2292273c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 07:59:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+7WoDbWw4SElw02EgL7Dq9/32cr/Vd8xdlufp/YS1kOZJMfTXbzT5va4aaxlWG9NXoGk/4cRYMgFz2zmDDUMZp@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8JwELm+4IQDQAjEQWcaksSil3b5W5PtDTzpCHDm5s5JzWyyDj
	9VGfXZeMKBT7LoPtLsE9tnckPbDbrps4MdGJmuUun4DNJx1N/lcP+LfaNWJKtvh8ZqsWMDxKsaj
	rtkvsZmXqp/Lzu5ccBGsuHlin4q9Xpg==
X-Received: by 2002:a05:7022:41a0:b0:132:1e79:9c55 with SMTP id
 a92af1059eb24-13436aa4a7amr2312761c88.31.1778684398054; Wed, 13 May 2026
 07:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260403-drm-mediatek-opencode-encoder-init-v1-1-7be86241b876@zohomail.in>
In-Reply-To: <20260403-drm-mediatek-opencode-encoder-init-v1-1-7be86241b876@zohomail.in>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 13 May 2026 14:59:45 +0000
X-Gmail-Original-Message-ID: <CAAOTY__a6R7CkNApwymRYFLOQ3LErTvWXNh0oOMS7d6iK5+nNQ@mail.gmail.com>
X-Gm-Features: AVHnY4Kxza9CuHOvMdkcK_8Vffimp1ycRH16uNep4anPkT7aEPEK318s88QDYsE
Message-ID: <CAAOTY__a6R7CkNApwymRYFLOQ3LErTvWXNh0oOMS7d6iK5+nNQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dpi: Open-code drm_simple_encoder_init()
To: shivamkalra98@zohomail.in
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi, Shivam:

Shivam Kalra via B4 Relay
<devnull+shivamkalra98.zohomail.in@kernel.org> =E6=96=BC 2026=E5=B9=B44=E6=
=9C=883=E6=97=A5=E9=80=B1=E4=BA=94
=E4=B8=8B=E5=8D=8812:00=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Shivam Kalra <shivamkalra98@zohomail.in>
>
> The helper drm_simple_encoder_init() is a trivial wrapper around
> drm_encoder_init() that only provides a static drm_encoder_funcs with
> .destroy set to drm_encoder_cleanup(). Open-code the initialization
> with a driver-specific instance of drm_encoder_funcs and remove the
> dependency on drm_simple_kms_helper.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Shivam Kalra <shivamkalra98@zohomail.in>
> ---
> Addresses the "Open-code drm_simple_encoder_init()" task from
> Documentation/gpu/todo.rst.
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 53360b5d12ba..5b83ca6aecb2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -25,8 +25,8 @@
>  #include <drm/drm_bridge_connector.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_encoder.h>
>  #include <drm/drm_of.h>
> -#include <drm/drm_simple_kms_helper.h>
>
>  #include "mtk_ddp_comp.h"
>  #include "mtk_disp_drv.h"
> @@ -993,6 +993,10 @@ static const struct drm_bridge_funcs mtk_dpi_bridge_=
funcs =3D {
>         .debugfs_init =3D mtk_dpi_debugfs_init,
>  };
>
> +static const struct drm_encoder_funcs mtk_dpi_encoder_funcs =3D {
> +       .destroy =3D drm_encoder_cleanup,
> +};
> +
>  void mtk_dpi_start(struct device *dev)
>  {
>         struct mtk_dpi *dpi =3D dev_get_drvdata(dev);
> @@ -1026,8 +1030,8 @@ static int mtk_dpi_bind(struct device *dev, struct =
device *master, void *data)
>         int ret;
>
>         dpi->mmsys_dev =3D priv->mmsys_dev;
> -       ret =3D drm_simple_encoder_init(drm_dev, &dpi->encoder,
> -                                     DRM_MODE_ENCODER_TMDS);
> +       ret =3D drm_encoder_init(drm_dev, &dpi->encoder, &mtk_dpi_encoder=
_funcs,
> +                              DRM_MODE_ENCODER_TMDS, NULL);
>         if (ret) {
>                 dev_err(dev, "Failed to initialize decoder: %d\n", ret);
>                 return ret;
>
> ---
> base-commit: 4b9c36c83b34f710da9573291404f6a2246251c1
> change-id: 20260403-drm-mediatek-opencode-encoder-init-36336e4c4ff3
>
> Best regards,
> --
> Shivam Kalra <shivamkalra98@zohomail.in>
>
>

