Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4E6C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 19:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+/4tlr0h9hEyrtmdl97i2hXmMDYc5ZwvfzaLPb+KoGg=; b=qkX6wxD4TrndmqChFMCtQuKrtf
	VAzDbbHP12e0dpVhJdEkDsMmL9dFhJroWziMa2WexRjSpm4/ZiT6aMZIfUAfFNxpZ2x2O2dEHxT2R
	1F96KMLncGRg0G/Mf9n0stcfFBrex/f9igQEQVzM7VsG1t8d0UG7Bs1jeJ+OYd82onw+BaNWzswFp
	rPau4l5T45+8HN2WsetlZjZIn/3+R7QkNhuCbQUMyKvJMQdpjVRfKv3ezSsW4F0cH7pvFffDO9rHk
	gBNug/pXsmsLvh7ueDpgy8kV8YjraWSI8wSuN/QPX0y3YhrP8wroFTMUVpIhi4EpM5nKnGas1EBqe
	Snrazh8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVxw-00000009lb0-2nOb;
	Wed, 25 Jun 2025 19:39:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURr7-000000095PS-1b0L;
	Wed, 25 Jun 2025 15:16:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 525E05C55F6;
	Wed, 25 Jun 2025 15:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73492C4CEEA;
	Wed, 25 Jun 2025 15:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750864568;
	bh=9uiCx//aBaD0yGFQdVerDfD2PgBCP5+9oifVTXlFXYI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TkY2tMZ3PpuUyBYnhjn4aUhRen6PKOzLvqdf9sEQ2MwIeSuY+OeWjpUz2PKtzLDcz
	 B84x5fB6r7hubY0bv9YGtCoqxtdkIEWLmfxvtkr4mJFWPNCgpBEawz4PePI9B2rsew
	 Y/TVEsbzNYX88CF76bS+1UQtqUL7rhtZ95IrAMBDlOamfYc1LxzY1/K46E3gkcDhTM
	 agcKiFkTGBV/YYJVbNCFH9UiYh0Mem0GuCe0I+QL/I7wp0sPdyM7B1gT1p9MMKQu+h
	 5ct8o2FcCLTqx3nT4+VhEK6gcP/VA1NuCOu3nzYDSEc5w2pAi6w4YnSsaTBqcj3b3H
	 LGmbVz2tI4yIQ==
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3137c20213cso6905133a91.3;
        Wed, 25 Jun 2025 08:16:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXV2jtMLze5HHcmCY/BHPMpBxMfb1dNYLEmmO5VsRJ/1Ytkwjc0lpAzKFQcwhndcvVFKzC+8e3jIxlkr1x1A8o=@lists.infradead.org, AJvYcCXkTnuPSbbfgzDFJyUJ/dJ4mB4dVpnsQ5Lyi4mdl1vvIWFp9OMHPVqPWXAglSKd6Tankgt1D1bv2ItXAo9+vdjX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/v/D5zOF9qUw4md++A4pTE80fg3UgDSVck3yGzhq6wk724Xeu
	Dilc0n0JDOMsWnO4v8w1n/rhmkpQBLIt6/cStcIWceR4lIzcvx9XZDZggVM5+85krq2cPILI4lH
	W8+rwClUfleA6RdI+Qqii21wmzCDvyw==
X-Google-Smtp-Source: AGHT+IHtRKCKayH+Lzht6QxsgoVvjQ6oWe0lLgYe2Cl+JRUJ/z1lS3uwRu/T5Q4f9oAnyB42TUycr2B2CpGFTJDpP5w=
X-Received: by 2002:a17:90b:2b47:b0:313:f83a:e473 with SMTP id
 98e67ed59e1d1-315f25ed7e8mr5611684a91.15.1750864568023; Wed, 25 Jun 2025
 08:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-mtk_dpi-mt8195-fix-wrong-color-v1-1-47988101b798@collabora.com>
In-Reply-To: <20250606-mtk_dpi-mt8195-fix-wrong-color-v1-1-47988101b798@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 25 Jun 2025 23:17:13 +0800
X-Gmail-Original-Message-ID: <CAAOTY__=3Pb2Tsr87b5FWG_DrQNdfeDC5yAE2XFo+TiP7hO6BA@mail.gmail.com>
X-Gm-Features: AX0GCFsC1n-RCC-W67WMTwPw4kHzfcK5gDHEnXA5e3PZAISJh-AfZvkzSrkcFBc
Message-ID: <CAAOTY__=3Pb2Tsr87b5FWG_DrQNdfeDC5yAE2XFo+TiP7hO6BA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dpi: Reorder output formats on MT8195/88
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_081609_496450_CA9D5298 
X-CRM114-Status: GOOD (  15.47  )
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

Hi, Louis:

Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> =E6=96=BC 2025=E5=B9=
=B46=E6=9C=886=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:52=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> Reorder output format arrays in both MT8195 DPI and DP_INTF block
> configuration by decreasing preference order instead of alphanumeric
> one, as expected by the atomic_get_output_bus_fmts callback function
> of drm_bridge controls, so the RGB ones are used first during the
> bus format negotiation process.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 20fa6a8fc588 ("drm/mediatek: mtk_dpi: Allow additional output form=
ats on MT8195/88")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 6fb85bc6487a019cdcdb3770dc06a1deab8d5bda..a2fdceadf209f6d2166e7523b=
82ca18c82c7d435 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -1095,7 +1095,6 @@ static const u32 mt8183_output_fmts[] =3D {
>  };
>
>  static const u32 mt8195_dpi_output_fmts[] =3D {
> -       MEDIA_BUS_FMT_BGR888_1X24,
>         MEDIA_BUS_FMT_RGB888_1X24,
>         MEDIA_BUS_FMT_RGB888_2X12_LE,
>         MEDIA_BUS_FMT_RGB888_2X12_BE,
> @@ -1103,18 +1102,19 @@ static const u32 mt8195_dpi_output_fmts[] =3D {
>         MEDIA_BUS_FMT_YUYV8_1X16,
>         MEDIA_BUS_FMT_YUYV10_1X20,
>         MEDIA_BUS_FMT_YUYV12_1X24,
> +       MEDIA_BUS_FMT_BGR888_1X24,
>         MEDIA_BUS_FMT_YUV8_1X24,
>         MEDIA_BUS_FMT_YUV10_1X30,
>  };
>
>  static const u32 mt8195_dp_intf_output_fmts[] =3D {
> -       MEDIA_BUS_FMT_BGR888_1X24,
>         MEDIA_BUS_FMT_RGB888_1X24,
>         MEDIA_BUS_FMT_RGB888_2X12_LE,
>         MEDIA_BUS_FMT_RGB888_2X12_BE,
>         MEDIA_BUS_FMT_RGB101010_1X30,
>         MEDIA_BUS_FMT_YUYV8_1X16,
>         MEDIA_BUS_FMT_YUYV10_1X20,
> +       MEDIA_BUS_FMT_BGR888_1X24,
>         MEDIA_BUS_FMT_YUV8_1X24,
>         MEDIA_BUS_FMT_YUV10_1X30,
>  };
>
> ---
> base-commit: b3bded85d838336326ce78e394e7818445e11f20
> change-id: 20250606-mtk_dpi-mt8195-fix-wrong-color-5aab0f6d2d27
>
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>

