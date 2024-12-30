Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB5BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 14:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0X+s/45KTRTqmsGeRQypC3YA/qsxI+0yvVaz+yHtKvA=; b=SlVYoVsq3BQtQd7JLQEup6fjfG
	amtsaB9U0zH7fe3gYhhCi6KMcX1wrA9ws1M5o8H2CqcT94RYcvsdcFHCqiLZUsFoYeW7GcI4GOQyc
	c9O5mZIaMbBcY7sd10kxbR6ARiLKu0Wt0RUQA1MK6N2hjUozHFDJmL+b68wDu9FYCn7YyKFHb+HPn
	lVOnH6KvH/lNcz/mYDRIdFM2lku0rV7T5bAORUzDKIXmSN9ZlECZqx4iixNhjZ8Y4vXh7qwmqAIST
	ylO1wHClOvRfHG0BsClr6de4PiWYUJC9r+kprcDK7U/QhFcXUABQTAnMthbZKbyRBNIvfdJAsDLEh
	KXBDozmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSGak-00000005Ktb-1yCj;
	Mon, 30 Dec 2024 14:17:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSGZc-00000005Km6-0tug;
	Mon, 30 Dec 2024 14:16:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 192EF5C5B13;
	Mon, 30 Dec 2024 14:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281EFC4CEE1;
	Mon, 30 Dec 2024 14:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735568207;
	bh=zMel9og/teRYkYQgE3auw7VYAfFToz8pv8OyAdYM6Vc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=couHbG+cc12NySKm/DaR6Ywy17VZbuufrot3nS4vCPMLMdiz05h8XQ9G0GERyJbnP
	 QiW3K9ouiUDlSjUw9nskMeLbqS4UqCF3WPei9G+qLIafd6nwmTlT92R0Zv5IQwXaVo
	 /5KXJQ//6A/rX8DABtFB4DRxkh09AcQYtXUsKYHv3MeIVotjCf0XIIvSOscQVAfUYm
	 pcUYVKGrGynfo0termfhTXwwTDh74C+EQKkLbQx+ggr0MdGrzr4PtwVOVasv4l2ZA2
	 xN3+mqq5cUzW744HtbFEOzM6TZp+iUxZZDNFDqSIsnmR71fqKgGo/CWRuHgywoDEV5
	 2CdB31gFLkNqQ==
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so9335951a91.3;
        Mon, 30 Dec 2024 06:16:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVhuKGMZrY0XrB3Y1IS9+8oSDFWHEUlw6pnwd8AtA8543vR82U7Sztk0fIk2oJNR8jyaBjgke0gimqOXRhdStw=@lists.infradead.org, AJvYcCWkYpLEXIbhfXtJ7M3sExfLIvWo8pm/8LQl7yAfMlrxJNqG/LZcQyDp9LqosVWrwHg5/k4F6xlzDABSv5m2xu0F@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9GTdTlQLt5sDHaoCBfv1EvUGE/qTB0VyQp65q1iu93t/4b38j
	6Do4sBgQW/DkMbG77JYmEooq/ApJODf81oceU1DXMx3Z8CPJ3IUIqB0Is6fND7C6qlKcKR6bGI4
	YumelNN9K0gzh6NebgQyT3pMi0w==
X-Google-Smtp-Source: AGHT+IHowbYDO6MzZoxKYBdpJQizCGbMvec0FMWr41jNazuXAPv1UNUBAqhQ7YhM003grWBzgeCVH3eRmuQNBazSRto=
X-Received: by 2002:a17:90b:270d:b0:2ee:48bf:7dc3 with SMTP id
 98e67ed59e1d1-2f452e1606amr56816645a91.15.1735568206567; Mon, 30 Dec 2024
 06:16:46 -0800 (PST)
MIME-Version: 1.0
References: <20241025083036.8829-1-liankun.yang@mediatek.com> <20241025083036.8829-2-liankun.yang@mediatek.com>
In-Reply-To: <20241025083036.8829-2-liankun.yang@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 30 Dec 2024 22:17:18 +0800
X-Gmail-Original-Message-ID: <CAAOTY__iZiyCpaKO-P6EHxg8GaJxmN-xguQ4Ny+HO7SiK6EaBg@mail.gmail.com>
Message-ID: <CAAOTY__iZiyCpaKO-P6EHxg8GaJxmN-xguQ4Ny+HO7SiK6EaBg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/mediatek: Fix YCbCr422 color format issue for DP
To: Liankun Yang <liankun.yang@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com, 
	dmitry.osipenko@collabora.com, msp@baylibre.com, rex-bc.chen@mediatek.com, 
	granquet@baylibre.com, peng.liu@mediatek.com, jitao.shi@mediatek.com, 
	mac.shen@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_061648_340606_2D01629D 
X-CRM114-Status: GOOD (  16.63  )
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

Hi, Liankun:

Liankun Yang <liankun.yang@mediatek.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=88=
25=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:32=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Setting up misc0 for Pixel Encoding Format.
>
> According to the definition of YCbCr in spec 1.2a Table 2-96,
> 0x1 << 1 should be written to the register.
>
> Use switch case to distinguish RGB, YCbCr422,
> and unsupported color formats.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort drive=
r")
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
> ---
> Change in V2
> - Modify the value written to the register
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240510021810.=
19302-1-liankun.yang@mediatek.com/
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index f0f6f402994a..613e1c842478 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -460,18 +460,16 @@ static int mtk_dp_set_color_format(struct mtk_dp *m=
tk_dp,
>                                    enum dp_pixelformat color_format)
>  {
>         u32 val;
> -
> -       /* update MISC0 */
> -       mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3034,
> -                          color_format << DP_TEST_COLOR_FORMAT_SHIFT,
> -                          DP_TEST_COLOR_FORMAT_MASK);
> +       u32 misc0_color;
>
>         switch (color_format) {
>         case DP_PIXELFORMAT_YUV422:
>                 val =3D PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR422;
> +               misc0_color =3D DP_COLOR_FORMAT_YCbCr422;
>                 break;
>         case DP_PIXELFORMAT_RGB:
>                 val =3D PIXEL_ENCODE_FORMAT_DP_ENC0_P0_RGB;
> +               misc0_color =3D DP_COLOR_FORMAT_RGB;
>                 break;
>         default:
>                 drm_warn(mtk_dp->drm_dev, "Unsupported color format: %d\n=
",
> @@ -479,6 +477,11 @@ static int mtk_dp_set_color_format(struct mtk_dp *mt=
k_dp,
>                 return -EINVAL;
>         }
>
> +       /* update MISC0 */
> +       mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3034,
> +                          misc0_color,
> +                          DP_TEST_COLOR_FORMAT_MASK);
> +
>         mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C,
>                            val, PIXEL_ENCODE_FORMAT_DP_ENC0_P0_MASK);
>         return 0;
> --
> 2.45.2
>

