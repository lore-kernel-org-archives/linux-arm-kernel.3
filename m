Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9AEC021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 14:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLIy6CECexAieIsq+mzz/klmXdiOSgsGZ6XYGWPdny4=; b=uY45+6RB4IR561kmy4kbfD8fJX
	/kaODNRwtEVsQioOlMn1hr3pIbGdsQF1ctkNCc/tZso9yidKmJDfliwx45vSV6InFOAleF1DVdeCw
	7IP39gwMbWH9J3tVPRrnB4xtexlFdayR9jggbMdMnY5dig7FqNE77Qk7X5T9C4CN8w7iUZye4o6Ay
	ABeo2Zo5o9og3UVO4rHWEVevM7rHp079UC3CHmhXHRJyMJfNMHnO68eXlWgsI6u9v3ZSZIke6cRiB
	zrvfPQR7Cf69r+ph2ICFdTkVwe40Cy2QsDbXhAxujrvYCysnjodezFJ/nmTcZPVcvFwfAWK4u2aAe
	fBvTL51w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkzi-0000000DGhj-1CWg;
	Wed, 19 Feb 2025 14:24:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkyD-0000000DG5e-3B13;
	Wed, 19 Feb 2025 14:22:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B674D5C5A33;
	Wed, 19 Feb 2025 14:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB7DC4CEEC;
	Wed, 19 Feb 2025 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739974956;
	bh=reh2ru3wGs4xpgkwhP9irvC0VjoDeR95OIEbA777fUo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Rm8Lp1ml+GLe9LpjM4u789wk9VDrcRCHCwOx5d1y1OyHKpQWu1SkSPWkLEj/iHM8K
	 DhtqHwrVw9g5PBRsYAc09f/9PVPYCl78tlWVq7n12KDwO3oQyvj1K8udCXPVo2Xumc
	 WRIok7A9Y6AeZRRgvrlNJLUoawaTA1/5LH7n1EYvbOBZtCPEyVuoampbIn2/R5dtDs
	 /VPI3NwDIqO3E2udYGT8Q9n3e+vb42vS1fle+5mIAwLqbK7Vg3fAxONZsxm2T01Gfn
	 gdIWBWtvVcBDtWRVhKRneSEyttJX26itrB7o/cTI44gZJt94az8kEgvd9i25Bu9C8E
	 ErfCOx1KUGaQg==
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2fa48404207so13620162a91.1;
        Wed, 19 Feb 2025 06:22:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUvVwE+9zK7DKIY70192MX5ERzh7A3xSBIsLjCEBgBQCeWOPImfXmd/qRy/mG6fbr/RDp4D44Qq7vbpT8Up3D4=@lists.infradead.org, AJvYcCXLjxvwjrRZmlT8dXRcGmYb9WJ1p6YJS8GCM2c+zyXc0nrNPqg8SSv8dbEqLhqE5QIFZIhk2Q4Cn4IhkogRUvID@lists.infradead.org
X-Gm-Message-State: AOJu0YzdKwEMI4MK/+uI++Yk0a9svrVzyTxG1Klzkpo/iDnbI78iufEP
	lY24JHeKM8N/j0dosMDeMxjRTdg6rOIxoiF1PL+dPewtmczKpwIP8aSu7hX/E/jmOyvQOdluoHn
	qjD+6XkJlS5EG9q2fNH6+N9ILjg==
X-Google-Smtp-Source: AGHT+IFcqF5yaXmkd1Kkc/nRemVogPJJE5Ke5gvEz4B9RO5EGqWKjgjJjYnTiJJa8/Cdthu+CTDKxzr7KsWY9zI/Ph4=
X-Received: by 2002:a17:90b:39cc:b0:2fa:229f:d03a with SMTP id
 98e67ed59e1d1-2fc4104056emr23304153a91.26.1739974955900; Wed, 19 Feb 2025
 06:22:35 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com> <20250217154836.108895-25-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-25-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 19 Feb 2025 22:23:20 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8qu6QeV=KJypYm=25PSGJD=jaMK6tMa2gWAoEF-mgPGg@mail.gmail.com>
X-Gm-Features: AWEUYZm6NK2d9V3p_Lp0cN8OApA1MPTl0H47EFaINMxZJFCgqd5UGa_xL6LrvNY
Message-ID: <CAAOTY_8qu6QeV=KJypYm=25PSGJD=jaMK6tMa2gWAoEF-mgPGg@mail.gmail.com>
Subject: Re: [PATCH v7 24/43] drm/mediatek: mtk_hdmi: Move vendor/product
 strings to drm_bridge
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
X-CRM114-CacheID: sfid-20250219_062237_907964_2CE07221 
X-CRM114-Status: GOOD (  16.72  )
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
> Move the vendor and product strings to the appropriate entries
> of struct drm_bridge and use that in mtk_hdmi_setup_spd_infoframe
> instead of having the same as function parameters.
>
> While at it, also beautify the strings, setting them to read
> "MediaTek On-Chip HDMI".

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index e9f2f15e98fa..4bf19574463d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -952,15 +952,14 @@ static int mtk_hdmi_setup_avi_infoframe(struct mtk_=
hdmi *hdmi,
>         return 0;
>  }
>
> -static int mtk_hdmi_setup_spd_infoframe(struct mtk_hdmi *hdmi,
> -                                       const char *vendor,
> -                                       const char *product)
> +static int mtk_hdmi_setup_spd_infoframe(struct mtk_hdmi *hdmi)
>  {
> +       struct drm_bridge *bridge =3D &hdmi->bridge;
>         struct hdmi_spd_infoframe frame;
>         u8 buffer[HDMI_INFOFRAME_HEADER_SIZE + HDMI_SPD_INFOFRAME_SIZE];
>         ssize_t err;
>
> -       err =3D hdmi_spd_infoframe_init(&frame, vendor, product);
> +       err =3D hdmi_spd_infoframe_init(&frame, bridge->vendor, bridge->p=
roduct);
>         if (err < 0) {
>                 dev_err(hdmi->dev, "Failed to initialize SPD infoframe: %=
zd\n",
>                         err);
> @@ -1328,7 +1327,7 @@ static void mtk_hdmi_send_infoframe(struct mtk_hdmi=
 *hdmi,
>  {
>         mtk_hdmi_setup_audio_infoframe(hdmi);
>         mtk_hdmi_setup_avi_infoframe(hdmi, mode);
> -       mtk_hdmi_setup_spd_infoframe(hdmi, "mediatek", "On-chip HDMI");
> +       mtk_hdmi_setup_spd_infoframe(hdmi);
>         if (mode->flags & DRM_MODE_FLAG_3D_MASK)
>                 mtk_hdmi_setup_vendor_specific_infoframe(hdmi, mode);
>  }
> @@ -1707,6 +1706,8 @@ static int mtk_hdmi_probe(struct platform_device *p=
dev)
>         hdmi->bridge.ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
>                          | DRM_BRIDGE_OP_HPD;
>         hdmi->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
> +       hdmi->bridge.vendor =3D "MediaTek";
> +       hdmi->bridge.product =3D "On-Chip HDMI";
>         drm_bridge_add(&hdmi->bridge);
>
>         ret =3D mtk_hdmi_clk_enable_audio(hdmi);
> --
> 2.48.1
>

