Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAA7C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 14:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDKLsX8Cl+sMXhcUQfjTf/hVYVMete4bvzDW9sD4b3M=; b=QdhMf+wHh0Sm4VOri6+2m6asso
	l0VLRzXFiymRg/9tBBNKD+fVpAJFvVFmEbZa68ZUNLFGnFsgppyAqVYtZGfg/3d1Yw2PrgaOqEsVo
	l4d/nKRI7f9dUIufsZVSxbRXVkbsaJF8grxFchaS4bov12ApNtaU0NoaW2GLIjznq6eZWJe2YOLMb
	vdDQHoXLKLYpkz24rgL8NTKeE2absA7wo5PCE55Ui1UhUeFZu82PXonft6UpeCJzfrtQPo0oQutCT
	6J1xrbkdKarX336wqfce/Hyk9WyV0TVRPoT3KurhYtzQybWOChRGQxyO8L98eLQimIdNVMHYXLEw9
	14sN6xwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tojtP-0000000G5qn-1JpH;
	Sun, 02 Mar 2025 14:02:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tojrr-0000000G5gi-1W2e;
	Sun, 02 Mar 2025 14:00:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5918C611C6;
	Sun,  2 Mar 2025 14:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95628C4CEEE;
	Sun,  2 Mar 2025 14:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740924029;
	bh=Av/PzBkOyruXRWKNi7XdeiMIEbdI1P2Bm67kdtg1gjg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=McIGGuoZ7gMk2Glgi+BCFR2gGNhEJVNnMtxtb7FuX2X0QS1okoEknf61jVDXoKwNn
	 0nXZNH4n0Hpw4bRx3eyjRFFcF7EgEfBpg4uKzmjNYeB0JZuRxWWmNW0flo+PSESd23
	 ztxe4Hw3qOelY7Gk8DnI5p1dH69WjRuOjVbGpmDty5zBYI/mFQEQzT2/F8qlZeyO+F
	 1ymkoVUztYhkV2Ji7jOVozFBNwTvJilnMIOVRltO/p5JsSVPOXsxop3m5J2AZp+US8
	 U1r5Igo4WtrAV+Nowb+QnB8neIzzYFnkX+l2S1ARK2cnpywKVgWZOf5RH2pGHc7vAs
	 KsWaqJKxxnP3w==
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2239c066347so9356605ad.2;
        Sun, 02 Mar 2025 06:00:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJP868cIP4JJYGLIOsYL5Nde7cxOw0mkXjDVO7WexuJQRIHrDIeKvlLuAqeBnd7vlcJD07jOuDE6PQj+V4QvY4@lists.infradead.org, AJvYcCXCyVyQrc9xfTv8wfh9fhzD4ZqIKOd6d6+yOhMHQaxcLLuH5xx2rH7IW8emVFrDERSJMFBiNXmL9ISBdxZ/CsQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqz+hDwBDL+zkXYgi/bVOqbQH/KF1zM/2xYrZ4wAWdyBR2dijy
	B3oJR/rV28l4EGTK1UFeRBi87hefZkgCbgOIanrNHzIMAwvG+eGqxvaN6wGIbBlXiF0/kiWTKxy
	7fncm9T3QKmEIEfe3rzcNZH3kZw==
X-Google-Smtp-Source: AGHT+IG1UW/aTlTM1yyIsxH6m8pGtzQb2LXGDtI6T8t/hEX8x0qb7qhCvRhbTMRAi2KttaGOcJDuH66GaQNNrad3F3Y=
X-Received: by 2002:a17:903:244d:b0:216:6901:d588 with SMTP id
 d9443c01a7336-22368f75980mr127122725ad.15.1740924028832; Sun, 02 Mar 2025
 06:00:28 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
 <20250217154836.108895-9-angelogioacchino.delregno@collabora.com> <CAAOTY_8kxxaj+jum6CkJGHKrpjiX_cNt4FT345yET8GWR2QSFA@mail.gmail.com>
In-Reply-To: <CAAOTY_8kxxaj+jum6CkJGHKrpjiX_cNt4FT345yET8GWR2QSFA@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Mar 2025 22:01:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9tjf8xw8n9euVK1OH7LLopNYwx5qzLJpQyQ+sKfVH6og@mail.gmail.com>
X-Gm-Features: AQ5f1Jo2Tbkh_sgx6kIGT6QdCzyACy__75IjpU71fY-nThmkgmTkCzBPqTB7-MQ
Message-ID: <CAAOTY_9tjf8xw8n9euVK1OH7LLopNYwx5qzLJpQyQ+sKfVH6og@mail.gmail.com>
Subject: Re: [PATCH v7 08/43] drm/mediatek: mtk_dpi: Support AFIFO 1T1P output
 and conversion
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, p.zabel@pengutronix.de, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, ck.hu@mediatek.com, 
	jitao.shi@mediatek.com, jie.qiu@mediatek.com, junzhi.zhao@mediatek.com, 
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

Chun-Kuang Hu <chunkuang.hu@kernel.org> =E6=96=BC 2025=E5=B9=B43=E6=9C=882=
=E6=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=887:29=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Hi, Angelo:
>
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=
=96=BC
> 2025=E5=B9=B42=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=881=
1:49=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On some SoCs, like MT8195 and MT8188, the DPI's FIFO controller
> > (afifo) supports outputting either one or two pixels per round
> > regardless of the input being 1T1P or 1T2P.
> >
> > Add a `output_1pixel` member to struct mtk_dpi_conf which, if
> > set, will enable outputting one pixel per clock.
> >
> > In case the input is two pixel per clock (1T2P), the AFIFO HW
> > will automatically (and internally) convert it to 1T1P.
>
> Applied to mediatek-drm-next [1], thanks.
>
> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linu=
x.git/log/?h=3Dmediatek-drm-next

Fix build error then apply. Be care of patch quality.

Regards,
Chun-Kuang.

>
> Regards,
> Chun-Kuang.
>
> >
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/media=
tek/mtk_dpi.c
> > index 9f83e82437dd..e12dc73ed79c 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -147,6 +147,8 @@ struct mtk_dpi_factor {
> >   * @edge_cfg_in_mmsys: If the edge configuration for DPI's output need=
s to be set in MMSYS.
> >   * @clocked_by_hdmi: HDMI IP outputs clock to dpi_pixel_clk input cloc=
k, needed
> >   *                  for DPI registers access.
> > + * @output_1pixel: Enable outputting one pixel per round; if the input=
 is two pixel per
> > + *                 round, the DPI hardware will internally transform i=
t to 1T1P.
> >   */
> >  struct mtk_dpi_conf {
> >         const struct mtk_dpi_factor *dpi_factor;
> > @@ -168,6 +170,7 @@ struct mtk_dpi_conf {
> >         u32 pixels_per_iter;
> >         bool edge_cfg_in_mmsys;
> >         bool clocked_by_hdmi;
> > +       bool output_1pixel;
> >  };
> >
> >  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32=
 mask)
> > @@ -653,7 +656,13 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi=
 *dpi,
> >         if (dpi->conf->support_direct_pin) {
> >                 mtk_dpi_config_yc_map(dpi, dpi->yc_map);
> >                 mtk_dpi_config_2n_h_fre(dpi);
> > -               mtk_dpi_dual_edge(dpi);
> > +
> > +               /* DPI can connect to either an external bridge or the =
internal HDMI encoder */
> > +               if (dpi->conf->output_1pixel)
> > +                       mtk_dpi_mask(dpi, DPI_CON, DPI_OUTPUT_1T1P_EN, =
DPI_OUTPUT_1T1P_EN);
> > +               else
> > +                       mtk_dpi_dual_edge(dpi);
> > +
> >                 mtk_dpi_config_disable_edge(dpi);
> >         }
> >         if (dpi->conf->input_2p_en_bit) {
> > --
> > 2.48.1
> >

