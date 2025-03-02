Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B87C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 14:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQOW1xVGvImiSdw1Cr0gi7VJ1t7Dz4P0kRJAnbnJ7qk=; b=QkL4eTEMD05lYxYCMig0t6NTOR
	Fx7puRFLEyUgac3mhOQDNB273fX5F/TK0XeCxgo7Fmx3eM2enHgDbScUwJz10w6vbw7TvVAMhmA0P
	lXW5WwwWdg8GQU8szA8zmoWV0BQ6K8I6JBmH0H2nc5KxWWhHz45d1bcsyo9VdCBwqdNDo8+HDVAgJ
	RmCg/q8oNilpHnvvIlId/HYxm8C50kYExGsR3J90JFwugrlAlmCmaicMoL+1G5PQF8aJvhU2aDN8x
	2rZBvMI26FiiBx/w1f6fQrX8g5tOXLmj09+FeDEqW7cmUIXodl0hLC1+NtCzmk3o2vvFiQzne4Wtk
	sNj/YdWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tok6d-0000000G74q-46Fk;
	Sun, 02 Mar 2025 14:15:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tok54-0000000G6qH-2oKp;
	Sun, 02 Mar 2025 14:14:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1BF015C55E5;
	Sun,  2 Mar 2025 14:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B32C4AF09;
	Sun,  2 Mar 2025 14:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740924849;
	bh=WdlKpmRexuT7zbkUCRgj1AoIj6QM4UsY/EdnrXW+Z0U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i+u5QdaaJcjF5j/s1z0UDqw3JocXCdgiht9SIOlUr9Z1YILBGlsajNaq9kABdo5vc
	 LBD3mUn3Yv5WsECeXjjVpmxwmZL8VpKSS+ZAK21hXze8ZAcy0mVHopCVkvPUVgAvlx
	 XSW4KXhwLlemsKqRNZkRH7Jnwy5zpEK1392fhE4gZ6WF+NZWbTJAI1yxTu9rOxkwO3
	 TbdIeczqMpNKw1KX9D8QnSU91wNTia1fMKHWM26UHUdhwiZG5oRklU+n8ydRQT9SFp
	 QCAbgENkEaq6Lh7JN31G6dLO3gCKgnZvSEr9i5UNfAjaXmiGRwtfKHk2HdNVIThRFF
	 vUq0Z+iaRS39w==
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fee4d9c2efso1069471a91.3;
        Sun, 02 Mar 2025 06:14:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVFUcyOIaAgQRXriObXW2TRGQfULyN5a2Oz4AjMiyeEY7RAsmWM7IdlQbzmaQWMOOa9gqobELyteyoiTZqpLia0@lists.infradead.org, AJvYcCXjf2AUT9Eh3qB4IsZwNp9fCIoBSQOWGsj34OXj1nZe4wMRBLx0BRTkjalT6KzTchY5KdtJvnFgl0AlC3jp1TA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzwYtnLDRoEzd+s401neKkEXZUrXbJUGRg1ABIxLa1Qlr+aXvte
	bO1rXRQ+aTgGRGc7D2Z/D/tPas650GeUga+dU3VMUpbYoTM49LApFZAG9nzLxu3J/0xJ5VDO/kh
	p+StgCT0U3ul2713SpJrjQSpwww==
X-Google-Smtp-Source: AGHT+IH+o6hr+P3sa3dBHh740Chan5YgqcTPXM3Ru5+mE8zMm8NmTcfNE+d8G4tit9+DT2LsVyT+KjX9uVxNPTQldM0=
X-Received: by 2002:a17:90b:4acb:b0:2ee:e518:c1cb with SMTP id
 98e67ed59e1d1-2febab2ed94mr17009114a91.7.1740924848801; Sun, 02 Mar 2025
 06:14:08 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com> <20250217154836.108895-11-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-11-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Mar 2025 22:14:55 +0800
X-Gmail-Original-Message-ID: <CAAOTY__ZZCDDiqhUBscXL-kKkmw87Lv_DmuZT-9cO4BcrmG5Yg@mail.gmail.com>
X-Gm-Features: AQ5f1JoJDOgBq_baFGYqgnx57G6Wswfkq9a6palqCadMv_6q8_1eKi_Eiaca418
Message-ID: <CAAOTY__ZZCDDiqhUBscXL-kKkmw87Lv_DmuZT-9cO4BcrmG5Yg@mail.gmail.com>
Subject: Re: [PATCH v7 10/43] drm/mediatek: Add support for MT8195 Digital
 Parallel Interface
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
X-CRM114-CacheID: sfid-20250302_061410_817852_8B2F664E 
X-CRM114-Status: GOOD (  16.01  )
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
2025=E5=B9=B42=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:=
49=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add support for the DPI block found in the MT8195 and MT8188 SoCs.
> Inside of the SoC, this block is directly connected to the HDMI IP.

After fix conflicts, applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c      | 19 +++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  6 ++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  2 ++
>  3 files changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index ee952785866c..d066fbd6ffb6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -1139,6 +1139,24 @@ static const struct mtk_dpi_conf mt8192_conf =3D {
>         .csc_enable_bit =3D CSC_ENABLE,
>  };
>
> +static const struct mtk_dpi_conf mt8195_conf =3D {
> +       .max_clock_khz =3D 594000,
> +       .output_fmts =3D mt8183_output_fmts,
> +       .num_output_fmts =3D ARRAY_SIZE(mt8183_output_fmts),
> +       .pixels_per_iter =3D 1,
> +       .is_ck_de_pol =3D true,
> +       .swap_input_support =3D true,
> +       .support_direct_pin =3D true,
> +       .dimension_mask =3D HPW_MASK,
> +       .hvsize_mask =3D HSIZE_MASK,
> +       .channel_swap_shift =3D CH_SWAP,
> +       .yuv422_en_bit =3D YUV422_EN,
> +       .csc_enable_bit =3D CSC_ENABLE,
> +       .input_2p_en_bit =3D DPI_INPUT_2P_EN,
> +       .clocked_by_hdmi =3D true,
> +       .output_1pixel =3D true,
> +};
> +
>  static const struct mtk_dpi_conf mt8195_dpintf_conf =3D {
>         .dpi_factor =3D dpi_factor_mt8195_dp_intf,
>         .num_dpi_factor =3D ARRAY_SIZE(dpi_factor_mt8195_dp_intf),
> @@ -1242,6 +1260,7 @@ static const struct of_device_id mtk_dpi_of_ids[] =
=3D {
>         { .compatible =3D "mediatek,mt8188-dp-intf", .data =3D &mt8195_dp=
intf_conf },
>         { .compatible =3D "mediatek,mt8192-dpi", .data =3D &mt8192_conf }=
,
>         { .compatible =3D "mediatek,mt8195-dp-intf", .data =3D &mt8195_dp=
intf_conf },
> +       { .compatible =3D "mediatek,mt8195-dpi", .data =3D &mt8195_conf }=
,
>         { /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h b/drivers/gpu/drm/me=
diatek/mtk_dpi_regs.h
> index a0b1d18bbbf7..3c24d9e9f241 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> @@ -40,6 +40,12 @@
>  #define FAKE_DE_LEVEN                  BIT(21)
>  #define FAKE_DE_RODD                   BIT(22)
>  #define FAKE_DE_REVEN                  BIT(23)
> +
> +/* DPI_CON: DPI instances */
> +#define DPI_OUTPUT_1T1P_EN             BIT(24)
> +#define DPI_INPUT_2P_EN                        BIT(25)
> +
> +/* DPI_CON: DPINTF instances */
>  #define DPINTF_YUV422_EN               BIT(24)
>  #define DPINTF_CSC_ENABLE              BIT(26)
>  #define DPINTF_INPUT_2P_EN             BIT(29)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index f22ad2882697..772c3d0f5d14 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -810,6 +810,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[=
] =3D {
>           .data =3D (void *)MTK_DPI },
>         { .compatible =3D "mediatek,mt8195-dp-intf",
>           .data =3D (void *)MTK_DP_INTF },
> +       { .compatible =3D "mediatek,mt8195-dpi",
> +         .data =3D (void *)MTK_DPI },
>         { .compatible =3D "mediatek,mt2701-dsi",
>           .data =3D (void *)MTK_DSI },
>         { .compatible =3D "mediatek,mt8173-dsi",
> --
> 2.48.1
>

