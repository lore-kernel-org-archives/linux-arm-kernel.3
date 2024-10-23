Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D4FCF538E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 14:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQHwV5GUQiINaYEphBy1X8iXxqhxNRcP6yQZrpsC0VQ=; b=j9g5Am06DNLruSZeVvo/cvODtG
	MLTWk3AKi9oQlct8f4qN+cdWmUu/48GdN0b5qZsBVDcanh6pSN4E32idzlr3XSDhsrswEB06KyngL
	hi3clIvU0gaAmHzS5dad5JXlUlXG48V5hC+XPJuqPIbrqC9kAzw8i7arE5ZrkUZlyO4e+ClvATzpA
	LcxfxB2x6ljyNnVvpPPgPvkxhchdA3ZX6LyW512y3Xi30haPsjPirjpdJLy+2Xn5RCcKbtAV0VqrE
	kipOiete1QQyS8y+PxoFVpXBHNf2ah+MI71biYXs9NCxp60UYrYjoREhnrpqtFq1x7rECeB+Rb78p
	7DZskYew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bzZ-0000000Edpu-1kmB;
	Wed, 23 Oct 2024 14:05:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3by1-0000000Ede1-2qoQ;
	Wed, 23 Oct 2024 14:04:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2DA965C5F47;
	Wed, 23 Oct 2024 14:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F7BDC4CEEF;
	Wed, 23 Oct 2024 14:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729692244;
	bh=3MPewIa2RjMP+i+zsFQ9KeXkrzNB/sGLihdu9ZgX1Xs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qdbkBEO03QRVYRTMpVXLWE71cKSwutRohJy5TwoxqVHO0wkbQW0YgPfaX29DAqor+
	 94w70E+QfzZ8tOiLhZfTmGiJXyMfqIA9WandhakNjKEstnVmIpxmGu2JbDDQdDkS/w
	 NWQ5ig4TJSBvkyDfxXkdP1g4/5AMAMuOW+QINcxLUcscOsXdpJ71ovHR+NONEqypC5
	 qgw07B94tMVCL2IjSWYlKY/0RtTHeZ/Be19Cfta+jos4swJIdpy6az0lvXq7d+OIrR
	 7twC2anxpXhsptQC9SoqaW0MPESbGAV3lm1ehUPtatYHeVZzrTS+E2Vi0mR8iuJp36
	 nvIMrFdhieGFQ==
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7eb00dc77f1so1296052a12.1;
        Wed, 23 Oct 2024 07:04:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRB6r4IiAMX28Z8jKTyVwOn3Hiyo46ezKDOBOIXMeHjpnpnqMMSVICTNiX6fjvisUu+j7omZbhEMFJ+e7aZzac@lists.infradead.org, AJvYcCXH+qnBV+XQRX4PqonkGRk37qP0o2B2tGwn9Ts1yikF2u7aBnjdsCuxm671FpgHkFI0Fn43O1vKAq8WWsGEm58=@lists.infradead.org
X-Gm-Message-State: AOJu0YwpVR7+Eu5q7hvQUiWojw708kSTnYQ1KAtvRZJOtrHKk/5pSrhA
	MLsEd05+cL/fK1c4uZBgc4yN65PGouKKUXEk7MKRNKsWDGfH8Wcx2h0zzDSQ9wm0uLrP5P+5Czb
	E1YciOpnLZDOHjF7EGNNENuoU2Q==
X-Google-Smtp-Source: AGHT+IF5Q62FJLxl3oE9wLeYU7rpvkWxnbOMZ2oAU54lobEqlwICxfdK2vspUXn7Guq+K/KROXh3ysDXrXOnjtvP2zM=
X-Received: by 2002:a05:6a21:2d8b:b0:1d9:3957:8c24 with SMTP id
 adf61e73a8af0-1d978b39ee6mr2739553637.21.1729692243502; Wed, 23 Oct 2024
 07:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240923132521.22785-1-liankun.yang@mediatek.com>
In-Reply-To: <20240923132521.22785-1-liankun.yang@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Oct 2024 22:04:24 +0800
X-Gmail-Original-Message-ID: <CAAOTY__3PvRUaU0a8E0X82yaTjYe8c5J6Uud5+SzMQhew+srgA@mail.gmail.com>
Message-ID: <CAAOTY__3PvRUaU0a8E0X82yaTjYe8c5J6Uud5+SzMQhew+srgA@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] drm/mediatek: Fix get efuse issue for MT8188 DPTX
To: Liankun Yang <liankun.yang@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com, 
	shuijing.li@mediatek.com, jitao.shi@mediatek.com, mac.shen@mediatek.com, 
	peng.liu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_070405_843868_36F0C2F4 
X-CRM114-Status: GOOD (  18.59  )
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

Liankun Yang <liankun.yang@mediatek.com> =E6=96=BC 2024=E5=B9=B49=E6=9C=882=
3=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=889:25=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Update efuse data for MT8188 displayport.
>
> The DP monitor can not display when DUT connected to USB-c to DP dongle.
> Analysis view is invalid DP efuse data.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 350c3fe907fb ("drm/mediatek: dp: Add support MT8188 dp/edp functio=
n")
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
> ---
> Changes in V5:
> - No change.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240905124041.=
3658-1-liankun.yang@mediatek.com/
>
> Changes in V4:
> - Remove excess newlines.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240903121028.=
20689-1-liankun.yang@mediatek.com/
>
> Changes in V3
> - Update change log position in commit message.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240902133736.=
16461-1-liankun.yang@mediatek.com/
>
> Changes in V2
> - Add Fixes tag.
> - Update the commit title.
> - Update the commit description.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240510061716.=
31103-1-liankun.yang@mediatek.com/
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 85 ++++++++++++++++++++++++++++++-
>  1 file changed, 84 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index d8796a904eca..f2bee617f063 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -145,6 +145,89 @@ struct mtk_dp_data {
>         u16 audio_m_div2_bit;
>  };
>
> +static const struct mtk_dp_efuse_fmt mt8188_dp_efuse_fmt[MTK_DP_CAL_MAX]=
 =3D {
> +       [MTK_DP_CAL_GLB_BIAS_TRIM] =3D {
> +               .idx =3D 0,
> +               .shift =3D 10,
> +               .mask =3D 0x1f,
> +               .min_val =3D 1,
> +               .max_val =3D 0x1e,
> +               .default_val =3D 0xf,
> +       },
> +       [MTK_DP_CAL_CLKTX_IMPSE] =3D {
> +               .idx =3D 0,
> +               .shift =3D 15,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_PMOS_0] =3D {
> +               .idx =3D 1,
> +               .shift =3D 0,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_PMOS_1] =3D {
> +               .idx =3D 1,
> +               .shift =3D 8,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_PMOS_2] =3D {
> +               .idx =3D 1,
> +               .shift =3D 16,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_PMOS_3] =3D {
> +               .idx =3D 1,
> +               .shift =3D 24,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_NMOS_0] =3D {
> +               .idx =3D 1,
> +               .shift =3D 4,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_NMOS_1] =3D {
> +               .idx =3D 1,
> +               .shift =3D 12,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_NMOS_2] =3D {
> +               .idx =3D 1,
> +               .shift =3D 20,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_NMOS_3] =3D {
> +               .idx =3D 1,
> +               .shift =3D 28,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +};
> +
>  static const struct mtk_dp_efuse_fmt mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX=
] =3D {
>         [MTK_DP_CAL_GLB_BIAS_TRIM] =3D {
>                 .idx =3D 3,
> @@ -2771,7 +2854,7 @@ static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_susp=
end, mtk_dp_resume);
>  static const struct mtk_dp_data mt8188_dp_data =3D {
>         .bridge_type =3D DRM_MODE_CONNECTOR_DisplayPort,
>         .smc_cmd =3D MTK_DP_SIP_ATF_VIDEO_UNMUTE,
> -       .efuse_fmt =3D mt8195_dp_efuse_fmt,
> +       .efuse_fmt =3D mt8188_dp_efuse_fmt,
>         .audio_supported =3D true,
>         .audio_pkt_in_hblank_area =3D true,
>         .audio_m_div2_bit =3D MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0=
_DIV_2,
> --
> 2.45.2
>

