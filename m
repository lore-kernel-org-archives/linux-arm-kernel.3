Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E56CC71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 05:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvdZlbFLOSBCY4Q+zQ5tbPvu2hRNVALGGd8gtRrbH20=; b=qyABjdl+8a8pJ4ReKE1eFDOrtY
	5uW35R1CSsPttBP9YShv9iaIeYaw45HfSU2yMNXE/ngn1ARYIFiWp7lxL7YIs4H7S4eKRgikRYLL3
	3nW2J/e7NISMQlxWChwVxNmGV/kt7H3Tm2edGbfYv2J8yYoLnOfUVUV7Op/PhNQZ7eUJyKj4MGu7d
	D8uQsU5FHApvMtK7TeTksbQ7ZbQAP2elR68RbE8EtntCZF5DW4RrLV85PCWHvziea+roFGEu+R/gN
	mUtcUkW+dk0HyhqmxoBgw+1c2+oqBVbhx0SlF1IJ8eIe1c0cv0tuim+m5tZND8cxUAFHA/xq6nztj
	RZXMpwyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ18e-00000004LiZ-3IW0;
	Tue, 08 Jul 2025 05:45:08 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ16I-00000004LPk-2wXV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 05:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751953362; x=1783489362;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dvdZlbFLOSBCY4Q+zQ5tbPvu2hRNVALGGd8gtRrbH20=;
  b=cKC+ymxQy8Zwfe6qakk+7YNaZS0C7N9simR8rQCHTpXlj0UqNSWwxuiH
   fy165arB4Brzkeh+yh3ZemY5eHHx+s/fXIn7OV8u0FNDQqqTznt3IR9rN
   6fmIWpBYOkKvGVhvWR475gqsQZb9aSerty+Pw5UFYmKrtwKWSsaq9rH1w
   AS0qTevy58edy3ZpwMfiVzZbtZjf2rmzM4ctYERJCeU36KQJR6L/3+3+y
   UF7FriUF/XkST0yEi7g8bN+QZy3O4mPFzdMlSWvyWd7h/vKm2iEjWssFi
   XoE+uHupCk4RhWQB9y2eI1NXvQMhJtd0IrRGqr9cGd0EOIN5ILB93Vk5F
   w==;
X-CSE-ConnectionGUID: Yty2a/IFR5uTPnZ2V+JqOQ==
X-CSE-MsgGUID: q/MyEStvROGTY0KNcv0DwA==
X-IronPort-AV: E=Sophos;i="6.16,296,1744063200"; 
   d="scan'208";a="45074462"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Jul 2025 07:42:37 +0200
X-CheckPoint: {686CAFCD-17-B791C630-E7A1546C}
X-MAIL-CPID: E002399BF6E21CDA14271D361A9972B7_2
X-Control-Analysis: str=0001.0A006399.686CAFF4.003D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C7F09165CE8;
	Tue,  8 Jul 2025 07:42:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751953353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dvdZlbFLOSBCY4Q+zQ5tbPvu2hRNVALGGd8gtRrbH20=;
	b=FA4FCOkggEqJexNoCfYbgVEUeqWSYLw17WBBOatPcWtuFupyU9vNDPsMu0P412fQnRKPJv
	N7Ua713dS9QyNVT3OVhjYeJ/BC6WDUQLfLze01bmtGRKH/dX55N4jzMyxbY5DRZDiLLaUV
	iIiAE8WK2ksuzqHFv1HkgNd1Tw42fTWWhIDELjqBNsUayRKttJeqBgVLNcYhyPyh/msNTQ
	/eNUJoV/TAJ8dsWK+V9nR+HclQBpb+8AoGDAQ1MOymKbKf631JAbksRto+6yfBQwESsP+I
	7/nEyxU0ayhJlRyv4N5XL6fZFXbdWY8jXhK2dB18OKxOIZO/D62FbtcAtusvBw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
Subject: Re: [PATCH 1/2] bus: imx-aipstz: allow creating pdevs for child buses
Date: Tue, 08 Jul 2025 07:42:31 +0200
Message-ID: <22762518.EfDdHjke4D@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250707234628.164151-2-laurentiumihalcea111@gmail.com>
References: <20250707234628.164151-1-laurentiumihalcea111@gmail.com>
 <20250707234628.164151-2-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_224243_224613_80F9972D 
X-CRM114-Status: GOOD (  22.86  )
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

Am Dienstag, 8. Juli 2025, 01:46:27 CEST schrieb Laurentiu Mihalcea:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>=20
> devm_of_platform_populate() passes a NULL as the bus OF match table
> to the underlying of_platform_populate(), meaning child bus devices
> of the AIPSTZ bridge will not have its children devices created. Since
> some SoCs (e.g. i.MX8MP) use this particular setup (e.g. SPBA bus, which
> is a child of AIPSTZ5 and has multiple child nodes), the driver needs to
> support it.
>=20
> Therefore, replace devm_of_platform_populate() with of_platform_populate()
> and pass a reference to the bus OF match table to it. For now, the only
> possible child buses are simple buses.
>=20
> Since the usage of devres is dropped, the complementary operation of
> of_platform_populate() needs to be called during the driver's removal.
>=20
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Fixes: 796cba2dd4d9 ("bus: add driver for IMX AIPSTZ bridge")
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Closes: https://lore.kernel.org/lkml/5029548.31r3eYUQgx@steina-w/#t

Thanks, with this SAI devices are probed again.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/bus/imx-aipstz.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/bus/imx-aipstz.c b/drivers/bus/imx-aipstz.c
> index 6610251f41c7..5fdf377f5d06 100644
> --- a/drivers/bus/imx-aipstz.c
> +++ b/drivers/bus/imx-aipstz.c
> @@ -26,6 +26,11 @@ static void imx_aipstz_apply_default(struct imx_aipstz=
_data *data)
>  	writel(data->default_cfg->mpr0, data->base + IMX_AIPSTZ_MPR0);
>  }
> =20
> +static const struct of_device_id imx_aipstz_match_table[] =3D {
> +	{ .compatible =3D "simple-bus", },
> +	{ }
> +};
> +
>  static int imx_aipstz_probe(struct platform_device *pdev)
>  {
>  	struct imx_aipstz_data *data;
> @@ -49,7 +54,13 @@ static int imx_aipstz_probe(struct platform_device *pd=
ev)
>  	pm_runtime_set_active(&pdev->dev);
>  	devm_pm_runtime_enable(&pdev->dev);
> =20
> -	return devm_of_platform_populate(&pdev->dev);
> +	return of_platform_populate(pdev->dev.of_node, imx_aipstz_match_table,
> +				    NULL, &pdev->dev);
> +}
> +
> +static void imx_aipstz_remove(struct platform_device *pdev)
> +{
> +	of_platform_depopulate(&pdev->dev);
>  }
> =20
>  static int imx_aipstz_runtime_resume(struct device *dev)
> @@ -83,6 +94,7 @@ MODULE_DEVICE_TABLE(of, imx_aipstz_of_ids);
> =20
>  static struct platform_driver imx_aipstz_of_driver =3D {
>  	.probe =3D imx_aipstz_probe,
> +	.remove =3D imx_aipstz_remove,
>  	.driver =3D {
>  		.name =3D "imx-aipstz",
>  		.of_match_table =3D imx_aipstz_of_ids,
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



