Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18970E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 14:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sc+PTk3dnXzk8f2Rfp2lxO0rGakunW5l27sJNrkdw3Y=; b=Mkq9BeJzqDVg2Z4J4Omv9e2uv0
	6ezmerdbfnsmPVXCO9m10Dhk8jAexLVH2IEakCWCrUB2z2FiebDOQfqXAQp6uFSmnsXzE0tQoraBK
	a50qLB3XjcEmxTK3V02ql4ExyO84F92TcHJW2Ro8zla6uB7KOYCUOeBw/EbW+EqZ79iakJ8ycZf6K
	M+Lort8Qksm2c8zBkcx/AoG3TjXfjybAdVTHErph6q8uMh9SGBX0jijG9Kw/uNBOR3UWazp+bnDup
	6YLK++hva/S0uPgWB/jBIRbIy64YVjaAHEnr2534FLGk8ZXqGqDYYuLMlM7I07jhoqMfe7cNTg9Bk
	J9roHxdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSGqn-00000005MzV-2pA7;
	Mon, 30 Dec 2024 14:34:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSGpd-00000005MlJ-0AZa;
	Mon, 30 Dec 2024 14:33:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 994A5A40D14;
	Mon, 30 Dec 2024 14:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C3BC4CEDD;
	Mon, 30 Dec 2024 14:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735569199;
	bh=R35VRLJXr4JYJ30+MfVgVkVmGJ/WbWlBOrgUrptlRhU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nYMmYCTL2yeRC56h/V4Z9CefSTxmcXAgYNSoh5dFJHcll5clkjI+oJIWUnG3gVfF0
	 DZieLK+nEfGEaBolnqvixJX2BCFDnF5Nccz4ua6HjCg/djIpWaFY+/KkI3XjlPVrKP
	 /H3epGabMyL89yDmLi/YR4azvDTM1dgarh6NbKBQcmufg59zlDTp3NMQoY4zz2yU3l
	 C+e8tJePJBuVWNMZvP2UGDw0CzZMPqS+b7dU7ibM7oAM0F4t1N2k+oyxxLNdyHayg9
	 UhRjfZYgaF79ElEjsvEJX2VorN7fk3hF6vhqpxc5jU3Sgy3Zt2dMiBnczSfcZ5Q1p1
	 EpCoN1U/19owQ==
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ef72924e53so12210707a91.3;
        Mon, 30 Dec 2024 06:33:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVxPzXmkcsj2s/jcK0L6B1XBroBqljTN2Ek1ovRFODhDrjBk8aw2goyP2NBoSaoBXXfI173+UF0ECLAif55IdE=@lists.infradead.org, AJvYcCXbYJ611VYzw9WiAzD+J5E5gzG93mx8bYWD+NayDzaBrthjulG2fR2Enhg5iXuE8CY2J/At7oE1PYoxV8w0TJZz@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ3AhbO6M7CQ/dwPQOOSd0ICw9mnH39t38WqsNpKsrX3WFppIc
	+ZCWKl1I0iwRzMlmrI7o1+uD8l/8DwhceXycS1vFKMO0ApDUXom5a1ZhyU0Mvls2eFaRoZkARGx
	o9ROTpqYIRoTXkOm7YvqMPjNnjw==
X-Google-Smtp-Source: AGHT+IH7B7muMkJj9OMuXi095+9uf0FPQOA4FD0jAvXN0DGE00jaKOmLqRW/zMH0tsqzjz+nbK+8wcg5sPsba96GL8E=
X-Received: by 2002:a17:90a:d003:b0:2f2:a664:df1a with SMTP id
 98e67ed59e1d1-2f452debea5mr51806088a91.2.1735569199146; Mon, 30 Dec 2024
 06:33:19 -0800 (PST)
MIME-Version: 1.0
References: <20241025083036.8829-1-liankun.yang@mediatek.com> <20241025083036.8829-3-liankun.yang@mediatek.com>
In-Reply-To: <20241025083036.8829-3-liankun.yang@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 30 Dec 2024 22:33:50 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9R89cgXiM_JhJS88hk0Mc-pXGG9dCGUAyTak98mNSocg@mail.gmail.com>
Message-ID: <CAAOTY_9R89cgXiM_JhJS88hk0Mc-pXGG9dCGUAyTak98mNSocg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/mediatek: Fix mode valid issue for dp
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
X-CRM114-CacheID: sfid-20241230_063321_203882_1151CA83 
X-CRM114-Status: GOOD (  22.49  )
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
25=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:31=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Fix dp mode valid issue to avoid abnormal display of limit state.
>
> After DP passes link training, it can express the lane count of the
> current link status is good. Calculate the maximum bandwidth supported
> by DP using the current lane count.
>
> The color format will select the best one based on the bandwidth
> requirements of the current timing mode. If the current timing mode
> uses RGB and meets the DP link bandwidth requirements, RGB will be used.
>
> If the timing mode uses RGB but does not meet the DP link bandwidthi
> requirements, it will continue to check whether YUV422 meetsi
> the DP link bandwidth.
>
> FEC overhead is approximately 2.4% from DP 1.4a spec 2.2.1.4.2.
> The down-spread amplitude shall either be disabled (0.0%) or up
> to 0.5% from 1.4a 3.5.2.6. Add up to approximately 3% total overhead.
>
> Because rate is already divided by 10,
> mode->clock does not need to be multiplied by 10.

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
> Change in V2:
> - Adjust the writing style.
> - Add instructions.
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 613e1c842478..ae4807823a5c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2328,12 +2328,19 @@ mtk_dp_bridge_mode_valid(struct drm_bridge *bridg=
e,
>  {
>         struct mtk_dp *mtk_dp =3D mtk_dp_from_bridge(bridge);
>         u32 bpp =3D info->color_formats & DRM_COLOR_FORMAT_YCBCR422 ? 16 =
: 24;
> -       u32 rate =3D min_t(u32, drm_dp_max_link_rate(mtk_dp->rx_cap) *
> -                             drm_dp_max_lane_count(mtk_dp->rx_cap),
> -                        drm_dp_bw_code_to_link_rate(mtk_dp->max_linkrate=
) *
> -                        mtk_dp->max_lanes);
> +       u32 lane_count_min =3D mtk_dp->train_info.lane_count;
> +       u32 rate =3D drm_dp_bw_code_to_link_rate(mtk_dp->train_info.link_=
rate) *
> +                        lane_count_min;
>
> -       if (rate < mode->clock * bpp / 8)
> +       /*
> +        *FEC overhead is approximately 2.4% from DP 1.4a spec 2.2.1.4.2.
> +        *The down-spread amplitude shall either be disabled (0.0%) or up
> +        *to 0.5% from 1.4a 3.5.2.6. Add up to approximately 3% total ove=
rhead.
> +        *
> +        *Because rate is already divided by 10,
> +        *mode->clock does not need to be multiplied by 10
> +        */
> +       if ((rate * 97 / 100) < (mode->clock * bpp / 8))
>                 return MODE_CLOCK_HIGH;
>
>         return MODE_OK;
> @@ -2374,10 +2381,9 @@ static u32 *mtk_dp_bridge_atomic_get_input_bus_fmt=
s(struct drm_bridge *bridge,
>         struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
>         struct drm_display_info *display_info =3D
>                 &conn_state->connector->display_info;
> -       u32 rate =3D min_t(u32, drm_dp_max_link_rate(mtk_dp->rx_cap) *
> -                             drm_dp_max_lane_count(mtk_dp->rx_cap),
> -                        drm_dp_bw_code_to_link_rate(mtk_dp->max_linkrate=
) *
> -                        mtk_dp->max_lanes);
> +       u32 lane_count_min =3D mtk_dp->train_info.lane_count;
> +       u32 rate =3D drm_dp_bw_code_to_link_rate(mtk_dp->train_info.link_=
rate) *
> +                        lane_count_min;
>
>         *num_input_fmts =3D 0;
>
> @@ -2386,8 +2392,8 @@ static u32 *mtk_dp_bridge_atomic_get_input_bus_fmts=
(struct drm_bridge *bridge,
>          * datarate of YUV422 and sink device supports YUV422, we output =
YUV422
>          * format. Use this condition, we can support more resolution.
>          */
> -       if ((rate < (mode->clock * 24 / 8)) &&
> -           (rate > (mode->clock * 16 / 8)) &&
> +       if (((rate * 97 / 100) < (mode->clock * 24 / 8)) &&
> +           ((rate * 97 / 100) > (mode->clock * 16 / 8)) &&
>             (display_info->color_formats & DRM_COLOR_FORMAT_YCBCR422)) {
>                 input_fmts =3D kcalloc(1, sizeof(*input_fmts), GFP_KERNEL=
);
>                 if (!input_fmts)
> --
> 2.45.2
>

