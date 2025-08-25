Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02320CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 06:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w14T58dmJuNVXMguB61ithau+MDzr8NmKFE7YbjkVFI=; b=icXjoZPRas6gaIrTVZhARYSACs
	rMwZYhgITWWbh7P95YfytGjFob/w2/6GSAIMjRA4gE/ae+OncJt+/dk+E0IJuAbgwrtacE8UnkNAk
	LiW3K8ydOFQmyVTruWstJeyncVvv26hTk3y7U7Dvdss9Fl00C+TZdWZPBtBCRF4XAy6LvjtRJCNYK
	9EX6K6gNDEBbPkm1eYdDLjtqWBYKp4x3KlXoglFhsHvCN+lvYa78iD5zrLGlX7awxw9eBGiY9h0EV
	5G9CajGfnY96mo4OpgwZGDBy1T1VaI8udXm8Q5ubhwkjOEtVfaYbtym+ar55gCHUib5WQYE3vD+zk
	/RCyjO4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqQzr-000000074A8-370t;
	Mon, 25 Aug 2025 06:48:03 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqQxF-000000073vv-1on0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 06:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756104321; x=1787640321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w14T58dmJuNVXMguB61ithau+MDzr8NmKFE7YbjkVFI=;
  b=By0bgJe0Gd1J+8YsZRtuHDKoKzrXUkuoLZ5PImwkS65LLgBPKu71AN4x
   BAXfJAW4xuTfQDSC8u3B5VQz2mdKiby/aY9nA8kiFEm6w0zVej0n/LnU+
   h4BN7qb6dbydPYnGjcBwfFGNc/AKT2JvYvjCOFuSFdoAvliWnGg9y4hlH
   ezfyKX35gYRNwo3cnY8Oh7lNQ439DmRXZAnciCjRm6kIrpavmMjfT7zCq
   SrOuY4IJ6iaN6onURtr0yFdwt0WgzoThyJJZx1yZ7mpKU1fM36b8xib+5
   u0CYWKl6AXsTuu9/qf71tezF4BvjWDRGVytYXAiLmPJ+9xzKNmuONmlsE
   Q==;
X-CSE-ConnectionGUID: zPl1VvF3QbWDnEldToc0KA==
X-CSE-MsgGUID: jSGX+Ye9RsO8KI0LyWrw/Q==
X-IronPort-AV: E=Sophos;i="6.17,312,1747692000"; 
   d="scan'208";a="45885019"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Aug 2025 08:45:17 +0200
X-CheckPoint: {68AC067D-37-AD8F5F64-F0EACAA5}
X-MAIL-CPID: FDCF9C2444F205DBF823452246599193_1
X-Control-Analysis: str=0001.0A002105.68AC067F.0078,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99E4D16626E;
	Mon, 25 Aug 2025 08:45:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756104313;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w14T58dmJuNVXMguB61ithau+MDzr8NmKFE7YbjkVFI=;
	b=sfw4f0GHkf4ifl0CpAfePvYuDpaoLhFTxn+RsEkSR6dxDx5HOqkibvhaQLjEGXOr/hxFXH
	A5zAt9AQav3vJW/auJThCKjj2mAxQPrK+V081dnTI0uTfdc5Ca8u8FMkbhlT5dNpvR9n8b
	wAZGOTYCZEEUAGF9B7Okrsw9vYNQeBKGOX9b+s1d0GYWXvsOrsj8hPr75AuPngv1bF7cAi
	r1Rs66xneE2oJlqdQ0oLJDLVV6G8h93Ny0W+QxnVX28Vc9E2DGXpdOXYxBS8XyG0FwoHLU
	k3/UJSmMvPq98AnNnC8raKpGaw2/bxUQ5TcYj20edpGwfiXOyWNe0wXnPRn9pA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] drm: lcdif: Use dev_err_probe()
Date: Mon, 25 Aug 2025 08:45:10 +0200
Message-ID: <4679558.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250429100919.1180404-1-alexander.stein@ew.tq-group.com>
References: <20250429100919.1180404-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_234521_967801_26F0991A 
X-CRM114-Status: GOOD (  13.79  )
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

Hi,

Am Dienstag, 29. April 2025, 12:09:18 CEST schrieb Alexander Stein:
> Use dev_err_probe() to add a reason for deferred probe. This can
> especially happen on lcdif3 which uses hdmi_tx_phy for 'pix' clock
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Gentle ping? Anyone picking this up? Or is there any other feedback?

Thanks and best regards
Alexander

> ---
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lc=
dif_drv.c
> index d5996efaf34bb..99e632d4a0e9b 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -164,15 +164,17 @@ static int lcdif_load(struct drm_device *drm)
> =20
>  	lcdif->clk =3D devm_clk_get(drm->dev, "pix");
>  	if (IS_ERR(lcdif->clk))
> -		return PTR_ERR(lcdif->clk);
> +		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk), "Failed to get pix=
 clock\n");
> =20
>  	lcdif->clk_axi =3D devm_clk_get(drm->dev, "axi");
>  	if (IS_ERR(lcdif->clk_axi))
> -		return PTR_ERR(lcdif->clk_axi);
> +		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_axi),
> +				     "Failed to get axi clock\n");
> =20
>  	lcdif->clk_disp_axi =3D devm_clk_get(drm->dev, "disp_axi");
>  	if (IS_ERR(lcdif->clk_disp_axi))
> -		return PTR_ERR(lcdif->clk_disp_axi);
> +		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_disp_axi),
> +				     "Failed to get disp_axi clock\n");
> =20
>  	platform_set_drvdata(pdev, drm);
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



