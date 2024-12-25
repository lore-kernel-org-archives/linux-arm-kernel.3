Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CED9E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 13:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPpGlD5XWnggnt2MTyXziNmroDbM7UgJ5b+ZiUp3otQ=; b=FFNqapHFYnf5pwOLqtrWYvp+7Z
	tF12+bsttURi5PNHAkm2Zu0V1+P1hd4swZTOIB7HQqnEDXjQRp4WIog3n9R+KY8OQGtz2YOJ5hibb
	ESY1Yn8MllMil1BKJxguy/HIL3OZjEf/wCmENkWDUTeaZkLFpKK+dkBhgOG/3i1KvsNKp1gMUZaOG
	VXkJf9exxdi3qRiv7lvioJDGWXsM07H3WWlW7g2kxojXecOdZ9emxbNl9fPi7kaWlCsdu2gr2CdMQ
	grf8oa3Ty+1ySE53fsdV0EdH+qyR1LmgWc3v3f1vlBFDS76GdjgtM6hhbyzdbQjuqeZgqdseoo/AZ
	6QFXjuFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQRVD-0000000DrLA-2be4;
	Wed, 25 Dec 2024 13:32:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQRU1-0000000DrFX-2KQP;
	Wed, 25 Dec 2024 13:31:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5AB4A5C5C57;
	Wed, 25 Dec 2024 13:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83EDAC4CED7;
	Wed, 25 Dec 2024 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735133488;
	bh=OgqqX+lTvRboKaPgE6eQ6OjOpOsQrtzv/dr+HjHyqpQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lkiK3PMUVPIq/5GhJ011cFCXZr/DkzkF9G2hv1r+LRdxrZXKEPEJO8HN6bK3WTJOI
	 i0zlTfUoJTBEIGWMVpvXGvNLkplpCddspt5wyBdCHJSfZrVTVZaV/D0aYVLhUndVeU
	 HLZHQTSXm2XoDPcKK3DWSNHo+yYwt3YR/Ic+4x/Pt+Mlz0Gj+5RLwOfZucwVfCVEwS
	 DT4Lpna4/fNXa25BsWb3mRn6LjAlUm9/XY8YqAL6K75PAAekkh0Ya3sG3taVrYWSJt
	 pdaIVlW+Vn12wz5AgXMo7GIIRjP3MYdQeCQOf1nwkU+HF3frR6Yyltlxv7qi5VcA+p
	 4F3VpihmPHqWA==
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso6333640a91.0;
        Wed, 25 Dec 2024 05:31:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWI0uZqAEApz0Zh1yU4xY7TbgRov4iceErC4BBCWxZeXRuj6fWfpc4pzgxZKo6lJAQKzRT5A3KQ2ebQCuq3qv4=@lists.infradead.org, AJvYcCWVxKPGB41CxpyPQ3wlHjdgY08txvqzg0TDhSHoRkdtGwAmJmbfR8JAgirPtY4qOYtD26MBO5xaq6uso/kxwqCW@lists.infradead.org
X-Gm-Message-State: AOJu0YwGzJu7PxtaLqWm8MQL7wrthm57x3D2M9YIAKiBnIkSTjc1j3/y
	quYgBrFXQ32uhG67/J5oLrOGO5dZu8krMN80uEzV6TlhKCzUVvbAaxonuuZx6snmVfp310unI9H
	nPuDXuX+wPH2pfhUxytHm/JbDzA==
X-Google-Smtp-Source: AGHT+IFjj5jLYnjM8STERl/xOhWv/K+zpDyfBlAfUpu18zlAIKlD62TX8OT29AP4UAQj6CvJ00PaXEonxrkWtDpMq5s=
X-Received: by 2002:a17:90b:2f0e:b0:2f4:4003:f3d4 with SMTP id
 98e67ed59e1d1-2f452ee5e54mr31287625a91.30.1735133488062; Wed, 25 Dec 2024
 05:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20241118025126.30808-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20241118025126.30808-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 25 Dec 2024 21:31:59 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-GvQL7ROZ_P5kT0xCYB9iLnHe4L69ay_RDj4sjbGkwoQ@mail.gmail.com>
Message-ID: <CAAOTY_-GvQL7ROZ_P5kT0xCYB9iLnHe4L69ay_RDj4sjbGkwoQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Add support for 180-degree rotation in the
 display driver
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Fei Shao <fshao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_053129_682679_BB8C33EE 
X-CRM114-Status: GOOD (  19.86  )
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

Hi, Jason:

Jason-JH.Lin <jason-jh.lin@mediatek.com> =E6=96=BC 2024=E5=B9=B411=E6=9C=88=
18=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8810:51=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> mediatek-drm driver reported the capability of 180-degree rotation by
> adding `DRM_MODE_ROTATE_180` to the plane property, as flip-x combined
> with flip-y equals a 180-degree rotation. However, we did not handle
> the rotation property in the driver and lead to rotation issues.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 74608d8feefd ("drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation pro=
perty")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index e0c0bb01f65a..cc825c4f2e09 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -472,6 +472,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigne=
d int idx,
>         unsigned int hdr_pitch =3D pending->hdr_pitch;
>         unsigned int fmt =3D pending->format;
>         unsigned int offset =3D (pending->y << 16) | pending->x;
> +       unsigned int rotation =3D pending->rotation;
>         unsigned int src_size =3D (pending->height << 16) | pending->widt=
h;
>         unsigned int blend_mode =3D state->base.pixel_blend_mode;
>         unsigned int ignore_pixel_alpha =3D 0;
> @@ -513,12 +514,19 @@ void mtk_ovl_layer_config(struct device *dev, unsig=
ned int idx,
>                         ignore_pixel_alpha =3D OVL_CONST_BLEND;
>         }
>
> -       if (pending->rotation & DRM_MODE_REFLECT_Y) {
> +       /*
> +        * Treat rotate 180 as flip x + flip y, and XOR the original rota=
tion value
> +        * to flip x + flip y to support both in the same time.
> +        */
> +       if (rotation & DRM_MODE_ROTATE_180)
> +               rotation ^=3D DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
> +
> +       if (rotation & DRM_MODE_REFLECT_Y) {
>                 con |=3D OVL_CON_VIRT_FLIP;
>                 addr +=3D (pending->height - 1) * pending->pitch;
>         }
>
> -       if (pending->rotation & DRM_MODE_REFLECT_X) {
> +       if (rotation & DRM_MODE_REFLECT_X) {
>                 con |=3D OVL_CON_HORZ_FLIP;
>                 addr +=3D pending->pitch - 1;
>         }
> --
> 2.43.0
>

