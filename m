Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B0CC98315
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 23:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7PeYGSEV+pCKpmP5h4ZswQhQtI60VPCBnNh4a2KURQg=; b=Od0uB6/Ot9rmgE92QqdN2bSAVJ
	EDlOccQ5ccZVyEzER24iJ7tckazj+BtTHFfIn+b4aJ/Gn1/rV0ObxPokJxmbk1uy6+bTBUIwTH3Nt
	VH9IEyZOJTzWzerBCL/oI4IqavY0XWvkPu14JTAWIzQtI9QUHDUebb1+T22JdebcB9AatsEluzhI0
	kEQaHRvteBBIyuMoyfXUVjCaKOrCVJiYTbGwGo1Mo/7Mqswx4RVCus/sQfGXBUgHb/hkeE/CVvkwL
	covR3X3KlEJQLu6sQomOB2xFkvKkfX8+aAkJTrs8iBF0IouSTzsCqqeuW/r7+FRUZeDprSIxif6zI
	T8MaIlGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhcMI-000000019vK-11m8;
	Sun, 18 Jan 2026 23:39:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhcMF-000000019un-48J0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 23:39:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D5E260010
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 23:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6333AC116D0
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 23:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768779538;
	bh=+vxkml/INomGVyZkkGO6Hqx4toau09AAIjsxs2+Q7rc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=noEdgNVrT6pVkwprb4ltXn5Jg6NAi0NXpnTws17lln9TPUsZ+QUNYyUi+c0W8BJ0F
	 9rAapkgXGAR/Jb7uLFAI0bkllKrfnOykgHLzi79gpaT4kjbojPVkXufHcHUCEMbiGn
	 LyVmjSn0ZFfnDkBh5Vu7CzBKBpaqDp9rm6ebK4PQQdf6LxhxS4Q2dbKUzsgeAsikoj
	 VDetUbLldqskmN5hrSKS2MhZpy7Sw1Y/Tu+GwSyz4RqIVbR2WI+Poe3fO+ZCVx16TP
	 zb57+e11J5c4tbSgy2jCdhIW4jsA38PHsfpkRhfH2imaBL9o+hMyHOUYvQJR95WAIh
	 SH4X2WRGyY9iA==
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1233b953bebso2466549c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 15:38:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVFJ5kAUC/hMRlwfP3dUiPjCmut0h7cmNmiDBvV0LTGyChRN881LLB1KSc0j6DkTumnpuW9rjsLj9sVtsAxrYKk@lists.infradead.org
X-Gm-Message-State: AOJu0YyM1nV3xLYAKvDe7Knt5tVVr+hI3rpQLVylNGe9PNpiFaxR3yH7
	M6l2Uf+IskpECbNaq6bl3PNPHuZn7OFKOrm3Jq8eNtpjgEIoCFWcQlnUCgq3AMYoyLuDENhCciM
	AbZxg43Qy+ZLxG6RXtEnmh2ULgV0+sw==
X-Received: by 2002:a05:7022:6984:b0:11b:9386:7ecd with SMTP id
 a92af1059eb24-1244a74e3c1mr7505842c88.42.1768779537763; Sun, 18 Jan 2026
 15:38:57 -0800 (PST)
MIME-Version: 1.0
References: <20260114092243.3914836-1-wenst@chromium.org>
In-Reply-To: <20260114092243.3914836-1-wenst@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 18 Jan 2026 23:38:37 +0000
X-Gmail-Original-Message-ID: <CAAOTY__4eBE9bmhe5vmDUpdny1BKfCWEhK_=8n-NWDzdrPLYog@mail.gmail.com>
X-Gm-Features: AZwV_QhVwsuXi4uDMwqFDraK5VDZQKOv7seycuWeLGpQl6fpPRNw1o9mQdzmUj0
Message-ID: <CAAOTY__4eBE9bmhe5vmDUpdny1BKfCWEhK_=8n-NWDzdrPLYog@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dpi: Find next bridge during probe
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org
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

Hi, Chen-yu:

Chen-Yu Tsai <wenst@chromium.org> =E6=96=BC 2026=E5=B9=B41=E6=9C=8814=E6=97=
=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=889:23=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Trying to find the next bridge and deferring probe in the bridge attach
> callback is much too late. At this point the driver has already finished
> probing and is now running the component bind code path. What's even
> worse is that in the specific case of the DSI host being the last
> component to be added as part of the dsi_host_attach callback, the code
> path that this is in:
>
>  -> devm_drm_of_get_bridge()
>     mtk_dpi_bridge_attach()
>     drm_bridge_attach()
>     mtk_dpi_bind()
>     ...
>     component_add()
>     mtk_dsi_host_attach()
>     anx7625_attach_dsi()
>     anx7625_link_bridge() - done_probing callback for of_dp_aux_populate_=
bus()
>     of_dp_aux_populate_bus()
>     anx7625_i2c_probe()
>
> _cannot_ return probe defer:
>
>     anx7625 4-0058: [drm:anx7625_bridge_attach] drm attach
>     mediatek-drm mediatek-drm.15.auto: bound 14014000.dsi (ops mtk_dsi_co=
mponent_ops)
>     mediatek-drm mediatek-drm.15.auto: error -EPROBE_DEFER: failed to att=
ach bridge /soc/dpi@14015000 to encoder TMDS-37
>     [drm:mtk_dsi_host_attach] *ERROR* failed to add dsi_host component: -=
517
>     anx7625 4-0058: [drm:anx7625_link_bridge] *ERROR* fail to attach dsi =
to host.
>     panel-simple-dp-aux aux-4-0058: DP AUX done_probing() can't defer
>     panel-simple-dp-aux aux-4-0058: probe with driver panel-simple-dp-aux=
 failed with error -22
>     anx7625 4-0058: [drm:anx7625_i2c_probe] probe done
>
> This results in the whole display driver failing to probe.
>
> Perhaps this was an attempt to mirror the structure in the DSI driver;
> but in the DSI driver the next bridge is retrieved in the DSI attach
> callback, not the bridge attach callback.
>
> Move the code finding the next bridge back to the probe function so that
> deferred probing works correctly. Also rework the fallback to the old OF
> graph endpoint numbering scheme so that deferred probing logs in both
> cases.
>
> This issue was found on an MT8183 Jacuzzi device with an extra patch
> enabling the DPI-based external display pipeline. Also tested on an
> MT8192 Hayato device with both DSI and DPI display pipelines enabled.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 4c932840db1d ("drm/mediatek: Implement OF graphs support for displ=
ay paths")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 61cab32e213a..53360b5d12ba 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -836,20 +836,6 @@ static int mtk_dpi_bridge_attach(struct drm_bridge *=
bridge,
>                                  enum drm_bridge_attach_flags flags)
>  {
>         struct mtk_dpi *dpi =3D bridge_to_dpi(bridge);
> -       int ret;
> -
> -       dpi->next_bridge =3D devm_drm_of_get_bridge(dpi->dev, dpi->dev->o=
f_node, 1, -1);
> -       if (IS_ERR(dpi->next_bridge)) {
> -               ret =3D PTR_ERR(dpi->next_bridge);
> -               if (ret =3D=3D -EPROBE_DEFER)
> -                       return ret;
> -
> -               /* Old devicetree has only one endpoint */
> -               dpi->next_bridge =3D devm_drm_of_get_bridge(dpi->dev, dpi=
->dev->of_node, 0, 0);
> -               if (IS_ERR(dpi->next_bridge))
> -                       return dev_err_probe(dpi->dev, PTR_ERR(dpi->next_=
bridge),
> -                                            "Failed to get bridge\n");
> -       }
>
>         return drm_bridge_attach(encoder, dpi->next_bridge,
>                                  &dpi->bridge, flags);
> @@ -1319,6 +1305,15 @@ static int mtk_dpi_probe(struct platform_device *p=
dev)
>         if (dpi->irq < 0)
>                 return dpi->irq;
>
> +       dpi->next_bridge =3D devm_drm_of_get_bridge(dpi->dev, dpi->dev->o=
f_node, 1, -1);
> +       if (IS_ERR(dpi->next_bridge) && PTR_ERR(dpi->next_bridge) =3D=3D =
-ENODEV) {
> +               /* Old devicetree has only one endpoint */
> +               dpi->next_bridge =3D devm_drm_of_get_bridge(dpi->dev, dpi=
->dev->of_node, 0, 0);
> +       }
> +       if (IS_ERR(dpi->next_bridge))
> +               return dev_err_probe(dpi->dev, PTR_ERR(dpi->next_bridge),
> +                                    "Failed to get bridge\n");
> +
>         platform_set_drvdata(pdev, dpi);
>
>         dpi->bridge.of_node =3D dev->of_node;
> --
> 2.52.0.457.g6b5491de43-goog
>

