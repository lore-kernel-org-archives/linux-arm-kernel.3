Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C773DC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 11:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZToIPO/7ok6Q3fZpmUuCsLm3jpHBPR/mAJDn3IqGQNI=; b=v/o35chpYxWHolKTSPlyWhqwN5
	vdd1wEHupu7SlGx2lsNIkxwahXNAAikYK65iav3ZULGQIRFuXWHaQqSWgAWOPQ7I+BaM6Zk1NPaL9
	GOjhqr9UVI6MdmVPktlED7QkDMKCPdMy6JQKR74VT+FXKJo3NA0+FsAznqYbhEOYjE9KFOXIW2o4g
	hlF1odgqXsZt7MQT4OeEFSbW9+BVQPaeyk/x8UXWwl4GMYL1sm/IbyWx+5PH7PWzjRX3H5qiCVky0
	5BF4XfWAEM9kme4XNOiefUS99ChuBO04Qz3IaVOQcqaMQO4XC3S+aPjJReJNFnuwjSW4RKKHGAOYS
	gQ8hzpIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tohIH-0000000Ftsg-2QCy;
	Sun, 02 Mar 2025 11:15:37 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tohGl-0000000Ftk7-25Jr;
	Sun, 02 Mar 2025 11:14:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8DCBB611B6;
	Sun,  2 Mar 2025 11:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC028C4CEE6;
	Sun,  2 Mar 2025 11:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740914041;
	bh=v/ma3IQHSnM+5ud0dShiwB+ncbp4M9rgz628up8ZOkA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p2PYUixk1Am9QalwwYyF2GaEFbCYaqRVuPbfG+n8JuQ59p/aG1I0T8htcVMF8hoUb
	 lPmDYHN/tiQbjOEbChNi4BbmFmqD4wxwaMW26lC+JiBPKs2fWqQLfdRSIDicix3Ouy
	 gPfC0KYV9i5g6r1oie50EYE/tu2V2RDj1JUChuafhKEIb0mQP+jiiRDFV8X6FvMU27
	 r/eJyCjoLdCPUGAPdNSxCIQ4hgRXyQhDcKb1DzEaWXFiBtLfXBc+TwE/t4BQM8HOTc
	 YJlaPJKB3YpBzGThPPK3aPqZcvDZo1roa92em+YvsqpRMOGc5a3hrmJ2pggQe4+ehO
	 fQyTqz7Dgardw==
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso6060158a91.0;
        Sun, 02 Mar 2025 03:14:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVaq4xSzE0/sIIvZLx8jHbVD5gbYKC9gYZVEeEMjJyUrFoYeskhfxNjZwRSOKVJb6tcyPtyARHi3YgY7ZZyjt8=@lists.infradead.org, AJvYcCXv++l6s/xL2eunGvRzldtCZPyBnCmDmetWkDIvC7pM9L24JbPwuVX9Myj8d6uzPLbK730mGbsRa7rA/64wt2Tk@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3oOaEyRyPqlvEtXOxJFatx7W6FlvfimAdVSbxgHT3mcElzZBT
	dNnUIBAXSuFT1EvX3KvTnBqyU93w7KQgcLiYr9Gx7oRuB0njlEsrFRboOVDmbs8fdBLSyR3TG0Z
	+NHxtMOGpBzPd7TUdgarXtQO5rA==
X-Google-Smtp-Source: AGHT+IGZksfSFwIbEcmNOhwDcGlaG+7/hc4R9GwB7WRzfYExI+bHgZUCSKMFME5+ViazM2T3gLoc2AcWZathoQG804E=
X-Received: by 2002:a17:90b:5550:b0:2fa:6793:e860 with SMTP id
 98e67ed59e1d1-2fea0c70b0emr22779361a91.0.1740914041329; Sun, 02 Mar 2025
 03:14:01 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com> <20250217154836.108895-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-7-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Mar 2025 19:14:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8ztRjpES-JVYeznG6ZjutYiifQSX3poyZoSqbqXYJ+aw@mail.gmail.com>
X-Gm-Features: AQ5f1JqxhG4uqsABhT4weE72XZJ0MWxPfONUK4l6x3goUDKT1KHLjbb0-IMiCn0
Message-ID: <CAAOTY_8ztRjpES-JVYeznG6ZjutYiifQSX3poyZoSqbqXYJ+aw@mail.gmail.com>
Subject: Re: [PATCH v7 06/43] drm/mediatek: mtk_dpi: Move the input_2p_en bit
 to platform data
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
> In preparation for adding support for MT8195's HDMI reserved DPI
> instance, move the input_2p_en bit for DP_INTF to platform data.
>
> While at it, remove the input_2pixel member from platform data as
> having this bit implies that the 2pixel feature must be enabled.

Remember to run check patch, after fix check patch error, applied to
mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index bb1a17f1384b..9a6c0f75f764 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -135,14 +135,14 @@ struct mtk_dpi_factor {
>   * @is_ck_de_pol: Support CK/DE polarity.
>   * @swap_input_support: Support input swap function.
>   * @support_direct_pin: IP supports direct connection to dpi panels.
> - * @input_2pixel: Input pixel of dp_intf is 2 pixel per round, so enable=
 this
> - *               config to enable this feature.
>   * @dimension_mask: Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_=
PORCH
>   *                 (no shift).
>   * @hvsize_mask: Mask of HSIZE and VSIZE mask (no shift).
>   * @channel_swap_shift: Shift value of channel swap.
>   * @yuv422_en_bit: Enable bit of yuv422.
>   * @csc_enable_bit: Enable bit of CSC.
> + * @input_2p_en_bit: Enable bit for input two pixel per round feature.
> +                     If present, implies that the feature must be enable=
d.
>   * @pixels_per_iter: Quantity of transferred pixels per iteration.
>   * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs =
to be set in MMSYS.
>   */
> @@ -157,12 +157,12 @@ struct mtk_dpi_conf {
>         bool is_ck_de_pol;
>         bool swap_input_support;
>         bool support_direct_pin;
> -       bool input_2pixel;
>         u32 dimension_mask;
>         u32 hvsize_mask;
>         u32 channel_swap_shift;
>         u32 yuv422_en_bit;
>         u32 csc_enable_bit;
> +       u32 input_2p_en_bit;
>         u32 pixels_per_iter;
>         bool edge_cfg_in_mmsys;
>  };
> @@ -651,9 +651,9 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *d=
pi,
>                 mtk_dpi_dual_edge(dpi);
>                 mtk_dpi_config_disable_edge(dpi);
>         }
> -       if (dpi->conf->input_2pixel) {
> -               mtk_dpi_mask(dpi, DPI_CON, DPINTF_INPUT_2P_EN,
> -                            DPINTF_INPUT_2P_EN);
> +       if (dpi->conf->input_2p_en_bit) {
> +               mtk_dpi_mask(dpi, DPI_CON, dpi->conf->input_2p_en_bit,
> +                            dpi->conf->input_2p_en_bit);
>         }
>         mtk_dpi_sw_reset(dpi, false);
>
> @@ -1121,12 +1121,12 @@ static const struct mtk_dpi_conf mt8195_dpintf_co=
nf =3D {
>         .output_fmts =3D mt8195_output_fmts,
>         .num_output_fmts =3D ARRAY_SIZE(mt8195_output_fmts),
>         .pixels_per_iter =3D 4,
> -       .input_2pixel =3D true,
>         .dimension_mask =3D DPINTF_HPW_MASK,
>         .hvsize_mask =3D DPINTF_HSIZE_MASK,
>         .channel_swap_shift =3D DPINTF_CH_SWAP,
>         .yuv422_en_bit =3D DPINTF_YUV422_EN,
>         .csc_enable_bit =3D DPINTF_CSC_ENABLE,
> +       .input_2p_en_bit =3D DPINTF_INPUT_2P_EN,
>  };
>
>  static int mtk_dpi_probe(struct platform_device *pdev)
> --
> 2.48.1
>

