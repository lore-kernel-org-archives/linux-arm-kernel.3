Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8932C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 11:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PV6adQRatt6DeZvVh8HfMkViGDvxGG2kZDUesd3HMZU=; b=LHMBWLm6kVguPdZB+ryfJETM8b
	OsZ744x2BjM/ihZuwO63aqzAKAoirg5V7I05TEuXZkXqwVvLSMovEMWi2Z3VlhkOmcLHMiTOmTIR9
	Tw2+VNo2D4rzafn6uFJ8cB/prAzAjR9z5jkgt+MC9jweafo097PoJdN/nuhsWARKrXMTy1/ZfoIFk
	wpaDpNUs0azIduvPmMGocmCcs1Rv3G/wBaw0MjQ3XTrt3CxzLLNuMQsLgvuFBqdg2WrVtCnt2rUxa
	8q+xldKK5o9Q5PGnDVPVOWUzrtGVMJzQzF4zHuS7VgMZZz8HM1d2IhHKvdJJX+AEHo5frWHeO3VRq
	DpXJh5Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tohAc-0000000Fsm5-3oSO;
	Sun, 02 Mar 2025 11:07:42 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toh96-0000000Fsdc-32UU;
	Sun, 02 Mar 2025 11:06:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B0C36611C2;
	Sun,  2 Mar 2025 11:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3993BC4CEE7;
	Sun,  2 Mar 2025 11:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740913567;
	bh=dFEmSgzocjSvRAOC0rSgdbowwNAjPIkt2fXcO2yivXw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V2WK9r5MIC7WuwVnLRgml0y0Q5B9sU1d82WnY8JOXecLdaeZjJcm4kmY7yFRKDc3Y
	 kO/Sa4MCO3e90MvlFV6Xn1XLFLWOTkDnuf04RsIaz2xzxu2SdqcViRpOtiLz2EA/gE
	 kKa4NEtHjL9/Herfmms6aXz0lpNtY9xb/gKM4ZKOoYOcE6ttvrHs04lguK3a3zvyV1
	 oy8NNpAx+XqsB0FJ6X8nvbrn2zcIeRMIVjtzmb7W3u+QNroGJt8GaM8Do1jJ+v3ofa
	 vTwyI3iMOhWQviad+e5GxMKcHLHbJvF28lRcWVWOP0/uiFDiRngV8vKLCevKeMOhpn
	 KLb2gCLX26LTw==
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2fe848040b1so7397254a91.3;
        Sun, 02 Mar 2025 03:06:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUk4pknjM3EO6tr4X1JHaudOcs7ps+ars5wDyFHZzenY0DZF3OCWfNmTmpJilbJTGvLVyGw8Nvb+VXZQtGgCael@lists.infradead.org, AJvYcCVEUdJ3Cp0dNUiEeshfH1M1J00vJ/tulDuue0LhedcEiCOURjkIH94pnwiV0MRnwtMr7u8AvtBvZgqVuoPXyrY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyTxZB/QrMYHgAqmrHNRt2MZ5i0RxSE+G9FHIDzyNqRyKBfbsa5
	CBc6QnneLu/mDeNbXfJsvCDklh+zm2LSsQN+Q3EvQXskZdsjOE1Bl26qh3rDLDNsabIMSyzKpVL
	vHm6w55EOPaNVh2FF0nBkcZp4GQ==
X-Google-Smtp-Source: AGHT+IFaakker1RvlwWBHNoAKzwywldrlnkjxsAGufL3nNbLGGTK04VQQJSQKHzYCBPUBZQAE9j/+vDYFuUUpAcGJ2o=
X-Received: by 2002:a17:90b:4b03:b0:2ee:b0b0:8e02 with SMTP id
 98e67ed59e1d1-2febabdee31mr14288048a91.28.1740913566738; Sun, 02 Mar 2025
 03:06:06 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com> <20250217154836.108895-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-6-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Mar 2025 19:06:53 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8BgMwzxa8N-LfwF2E0R0fp390aTc-w320DdeuOrUb=LQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jr8JxhruQU5SBFrhJlqRkkYTbn86_r90UvYcimeOPdrDui1RogsSo_EkOY
Message-ID: <CAAOTY_8BgMwzxa8N-LfwF2E0R0fp390aTc-w320DdeuOrUb=LQ@mail.gmail.com>
Subject: Re: [PATCH v7 05/43] drm/mediatek: mtk_dpi: Add checks for
 reg_h_fre_con existence
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
> In preparation for adding support for newer DPI instances which
> do support direct-pin but do not have any H_FRE_CON register,
> like the one found in MT8195 and MT8188, add a branch to check
> if the reg_h_fre_con variable was declared in the mtk_dpi_conf
> structure for the probed SoC DPI version.
>
> As a note, this is useful specifically only for cases in which
> the support_direct_pin variable is true, so mt8195-dpintf is
> not affected by any issue.

Applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 59c2e4f32a61..bb1a17f1384b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -431,12 +431,13 @@ static void mtk_dpi_config_swap_input(struct mtk_dp=
i *dpi, bool enable)
>
>  static void mtk_dpi_config_2n_h_fre(struct mtk_dpi *dpi)
>  {
> -       mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, H_FRE_2N, H_FRE_2N);
> +       if (dpi->conf->reg_h_fre_con)
> +               mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, H_FRE_2N, H_F=
RE_2N);
>  }
>
>  static void mtk_dpi_config_disable_edge(struct mtk_dpi *dpi)
>  {
> -       if (dpi->conf->edge_sel_en)
> +       if (dpi->conf->edge_sel_en && dpi->conf->reg_h_fre_con)
>                 mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0, EDGE_SEL_E=
N);
>  }
>
> --
> 2.48.1
>

