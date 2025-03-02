Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67126C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 11:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwG0yK1KSfWk5WyKJkIqXm5Uvn+uEhfN/zg427lzwcI=; b=VSqL0CXeyjg8V/ydO1sIvpc4Ik
	HDtNWfZIKOF9XAZgO8HLvMYhuiPrVYr3t7b/V+I7ul1SrniwjAd9ijP8I3IKy0NDVtm5OQ01Lf4Xm
	o4p9eOx+MCe8KVTElFdk7UuBEZA31nv9p7jepMy59CB0Nq2PhoVa1u1zAiaLOkQZP48Y2ZqKQpe2V
	82AYHJgMPxdfLBFyd+MgRySUqiG2H3fgW/1YnRKaVdtZJKEv2SZ+MCujEAiT9RfMiMy2GoWWCqh8P
	jNhBiwTTVpMBOwpsfy50Bau6g7683zV8Z71ZyxYaKbvc2Ih8GS8oaajvBMDEqdYR9nsZ2YdNlyF1Z
	cwkNC2ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tohRE-0000000FuPm-1jRD;
	Sun, 02 Mar 2025 11:24:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tohPg-0000000FuJc-0ZND;
	Sun, 02 Mar 2025 11:23:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6AFD35C5555;
	Sun,  2 Mar 2025 11:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE206C4CED6;
	Sun,  2 Mar 2025 11:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740914594;
	bh=88iTC3VCTOJkXkwpEcxod0WPhai7pUMfCO6THaRxiz0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=axgEFXztCbBzkgFhBxNNrjADAY/vCgsxrbfSnqt3lH0RClkOnk2lOB6RSjFLWJoNO
	 6TKB/wLXebt2e7HwhurZitPvf/Nm+JgOB3Kq82FhxfyDOnjFYPYuVWv9NyIScE7XJ4
	 TVWkV/BjkuU/6anf+9wDTJRK+VBLTkovprUuF3EC5eCgGv4eD/kGGjVbN1vKqL6/NY
	 PJuNg+IZsYXkTYLD1Dqsw8HAt1Az6j6RMiuHad1btAQKsFO6hXzZivYi66k+SkOZoa
	 G/d0WN0kdoRxiZ99jyjkBzGNiDrz1gcDfxdI1DgdM3VdJTK5izIkEV21FQqpSK0LJF
	 iJX22Cbop+yCQ==
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-223480ea43aso88617025ad.1;
        Sun, 02 Mar 2025 03:23:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV3aLeCu4lDH2HuBcWteyJWiglx+ixHv3AkRL0yLgE5UXm4LDUI0m3dGwCmHSTDmAlzf9lRQEo1+8EcKyWkxiVS@lists.infradead.org, AJvYcCVId9A6ag4f0CNvR37kHReJorG9VgCNChEIjE0pBqDBpn8mzmyzmK3Z1nWe57azYSaaQPNm81aSACyWC2jui08=@lists.infradead.org
X-Gm-Message-State: AOJu0YyN0YW/4ILvSSWSadE7w8YqdHaaiuiD+W0PP6+MrhIkXDC8hXFJ
	Z6U0tfJ+2t7bLCleYdglErPzlbmi0VYCNeEEkxtdidKOP25VVzmbsgc6md0Od4l4IDGmHk2bJHU
	/KyU7cuM7hyiEKXR8ZdGlQdPAVA==
X-Google-Smtp-Source: AGHT+IFpcs+J1xAyfK06/O6FF1+X82uEcHTSqmEDT4XqGI/sksYkVpLwFKzYZ1+KMrLF9RKJkiWsDGoNBEQOX9vfehk=
X-Received: by 2002:a17:902:dacf:b0:215:a179:14ca with SMTP id
 d9443c01a7336-22368f73284mr153333585ad.2.1740914594460; Sun, 02 Mar 2025
 03:23:14 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com> <20250217154836.108895-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-8-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Mar 2025 19:24:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8LmRTabeuwXnwDxxodiPRkRD4P9diCO=5CHrwtT4h2QA@mail.gmail.com>
X-Gm-Features: AQ5f1JqaQEl0KFCViPa_ifgKV1VqZysAJMdPHTFuV6fAg_m9uoS6AEjQCuQA1_8
Message-ID: <CAAOTY_8LmRTabeuwXnwDxxodiPRkRD4P9diCO=5CHrwtT4h2QA@mail.gmail.com>
Subject: Re: [PATCH v7 07/43] drm/mediatek: mtk_dpi: Add support for DPI input
 clock from HDMI
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
X-CRM114-CacheID: sfid-20250302_032316_292707_ABF5FD09 
X-CRM114-Status: GOOD (  23.03  )
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
> On some SoCs, like MT8195 and MT8188, the DPI instance that is
> reserved to the HDMI Transmitter uses a different clock topology.
>
> In this case, the DPI is clocked by the HDMI IP, and this outputs
> its clock to the MM input of dpi_pixel_clk, which is essential to
> enable register access to the DPI IP.
>
> Add a `clocked_by_hdmi` member to struct mtk_dpi_conf, and check
> it to avoid enabling the DPI clocks in the mediatek-drm internal
> .start() callback (and avoid disabing in the .stop() component
> callback): this will make sure that the clock configuration
> sequence is respected during display pipeline setup by following
> the bridge ops between DPI and HDMI, where the HDMI driver is
> expected to enable the clocks in the bridge's pre_enable(), and
> DPI in the enable() cb.

After fix conflicts, applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 9a6c0f75f764..9f83e82437dd 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -145,6 +145,8 @@ struct mtk_dpi_factor {
>                       If present, implies that the feature must be enable=
d.
>   * @pixels_per_iter: Quantity of transferred pixels per iteration.
>   * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs =
to be set in MMSYS.
> + * @clocked_by_hdmi: HDMI IP outputs clock to dpi_pixel_clk input clock,=
 needed
> + *                  for DPI registers access.
>   */
>  struct mtk_dpi_conf {
>         const struct mtk_dpi_factor *dpi_factor;
> @@ -165,6 +167,7 @@ struct mtk_dpi_conf {
>         u32 input_2p_en_bit;
>         u32 pixels_per_iter;
>         bool edge_cfg_in_mmsys;
> +       bool clocked_by_hdmi;
>  };
>
>  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 m=
ask)
> @@ -585,7 +588,9 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *d=
pi,
>         struct videomode vm =3D { 0 };
>
>         drm_display_mode_to_videomode(mode, &vm);
> -       mtk_dpi_set_pixel_clk(dpi, &vm, mode->clock);
> +
> +       if (!dpi->conf->clocked_by_hdmi)
> +               mtk_dpi_set_pixel_clk(dpi, &vm, mode->clock);
>
>         dpi_pol.ck_pol =3D MTK_DPI_POLARITY_FALLING;
>         dpi_pol.de_pol =3D MTK_DPI_POLARITY_RISING;
> @@ -920,14 +925,16 @@ void mtk_dpi_start(struct device *dev)
>  {
>         struct mtk_dpi *dpi =3D dev_get_drvdata(dev);
>
> -       mtk_dpi_power_on(dpi);
> +       if (!dpi->conf->clocked_by_hdmi)
> +               mtk_dpi_power_on(dpi);
>  }
>
>  void mtk_dpi_stop(struct device *dev)
>  {
>         struct mtk_dpi *dpi =3D dev_get_drvdata(dev);
>
> -       mtk_dpi_power_off(dpi);
> +       if (!dpi->conf->clocked_by_hdmi)
> +               mtk_dpi_power_off(dpi);
>  }
>
>  unsigned int mtk_dpi_encoder_index(struct device *dev)
> --
> 2.48.1
>

