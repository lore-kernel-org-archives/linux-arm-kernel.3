Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53C9C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 10:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6z8SNGAWbPtFx1cjvVtRebtMxEHnuUbliJJnBLpEBQ=; b=F9ch//nstyopye7/wDhc1AawGv
	z6fBEyzP+aadxUybJzwLwh+Z68M5Y4fmDZ9ZR8P0yIUqj5/pdQrn3VqN0ZWpPR++do//P+wV7ZOGZ
	EqUH0iGgX2B3KfWm46Jpa/0uhvbc9sjit/b61onXsx6NstrcpvMl76Tby/oMI/0yCxw6o6vUeea3v
	8d5ooSc8I9SvZsy57fNGrG6+OEj8D6dmpE0dltN2RSztGcyvp0BrbYySJWP7Kz40MdwNpihmUZ9vD
	RAGnoM9CJylGy1O/96906FXEgiRaDQvQDAw12sKq5rE0udiMeEJHG1N+PxOGmGptuchpo5WEQKl42
	q0OOF+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxH9-0000000AVny-1UYg;
	Fri, 28 Feb 2025 10:07:23 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnx8l-0000000ATXG-2hgc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 09:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740736723; x=1772272723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R6z8SNGAWbPtFx1cjvVtRebtMxEHnuUbliJJnBLpEBQ=;
  b=FJs7i5+7RFhEg4n7ayR+sVdadzVZFIUVc8sLNo6vhLJUcdupIJoW02/H
   foZJHaTuEjmoNDJ2WCM7H/A1ZslJQX/FnY/Gf/dRMOe9ZmwXO+dU+mTOw
   oGEgMPVaSudaJ6rTVY3DHNYKdEGcJDvEbfWP79xqdFKp2rgumkeiodaOw
   m0HjlZ8p8ZKwp46xeARzfNngq7Xushfu5TlgyG7kC4RTcLyQTCUr0JHL0
   dp4/keTYLBHLGjwl+aNP0eivvGIZACK+d9cVQFZNmvhqppkK7GfJ3DLjk
   cCxEy+V+CXrG2RiVqk+zoluwIX8lFYJuF3o6uNl1F+Iq6HlFCWcnc5/fk
   Q==;
X-CSE-ConnectionGUID: xE6yXvstTFm0gqqdqTCQMg==
X-CSE-MsgGUID: gUwUTOczSCiyYZXoY2pg6Q==
X-IronPort-AV: E=Sophos;i="6.13,322,1732575600"; 
   d="scan'208";a="42170542"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Feb 2025 10:58:41 +0100
X-CheckPoint: {67C188D0-2D-2895743E-CD1E7AB7}
X-MAIL-CPID: C994950F3C3B4C450EBA4E647F15245F_4
X-Control-Analysis: str=0001.0A00211B.67C188D2.0005,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AACD01688B1;
	Fri, 28 Feb 2025 10:58:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740736716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R6z8SNGAWbPtFx1cjvVtRebtMxEHnuUbliJJnBLpEBQ=;
	b=L5ZuJXustp8emNgt0u+lkzIHHqx8ZnNQLz4D3Z97r5lDnHurm3e0ouRN9W4Trljbi8/4jb
	rwyVFcqkZSzS5BmvDvsc/5LvOdJKVyFIdVBzUWZkc4Z3rm8cDPydzbKf/o5AIER4SqTIso
	8c+bYF7qDKfvcHHqWtOP/DiA/5sbPQnknCJ57xzfqewwBe3KXhY84iAzfptY/JcNeIl6zA
	VHX+eH6j0v016n51NCkEK3Lw8G+JkvTTGGCYWZNWNaNI+ylX2KYwXzyyQrXNqRZsBKgVSF
	uljFLINGhoUbFi9bEBVFHqVzgOHRUFe8FTLOOeHZcU5mpEzFLAc49cq8WXQ0SA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/9] reset: simple: Add support for Freescale i.MX95 GPU reset
Date: Fri, 28 Feb 2025 10:58:33 +0100
Message-ID: <2425297.NG923GbCHz@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250227170012.124768-3-marex@denx.de>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-3-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_015844_175939_FC1E48B7 
X-CRM114-Status: GOOD (  18.44  )
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

Hi Marek,

Am Donnerstag, 27. Februar 2025, 17:58:02 CET schrieb Marek Vasut:
> The instance of the GPU populated in Freescale i.MX95 does require
> release from reset by writing into a single GPUMIX block controller
> GPURESET register bit 0. Implement support for this reset register.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/reset/reset-simple.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
> index 2760678398308..1415a941fd6eb 100644
> --- a/drivers/reset/reset-simple.c
> +++ b/drivers/reset/reset-simple.c
> @@ -133,9 +133,17 @@ static const struct reset_simple_devdata reset_simpl=
e_active_low =3D {
>  	.status_active_low =3D true,
>  };
> =20
> +static const struct reset_simple_devdata reset_simple_fsl_imx95_gpu_blk_=
ctrl =3D {
> +	.reg_offset =3D 0x8,

Shouldn't you add ".nr_resets =3D 1"? Otherwise this will have 8 resets
(resource_size(res) * BITS_PER_BYTE).

On a side note: RM says this is a write-once register. Do we consider writi=
ng
this register again?
BTW: Would it be possible to disable it completely (until reset) by writing=
 1?

Best regards
Alexander

> +	.active_low =3D true,
> +	.status_active_low =3D true,
> +};
> +
>  static const struct of_device_id reset_simple_dt_ids[] =3D {
>  	{ .compatible =3D "altr,stratix10-rst-mgr",
>  		.data =3D &reset_simple_socfpga },
> +	{ .compatible =3D "fsl,imx95-gpu-blk-ctrl",
> +		.data =3D &reset_simple_fsl_imx95_gpu_blk_ctrl },
>  	{ .compatible =3D "st,stm32-rcc", },
>  	{ .compatible =3D "allwinner,sun6i-a31-clock-reset",
>  		.data =3D &reset_simple_active_low },
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



