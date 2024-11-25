Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664C9D58062
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 11:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vELmZ6h5/WR8FUIBqjgkR3JyDZpXfibSEKTzNXo0PKM=; b=kqvcQEpHiQbGH6Ev9dvaAs2F1n
	hRST8mI/Cb/lqSVr8Kg3JZ6C2EVb/LBSOjg/Jnjos0QMYfq9oHVsUOrO3UhX0MKoccmCKWqPhyKd0
	DoHsforf5IHRNaAmmTkJiRe/vx3AhoZyjO/CfgsW3r6XYk/KHuSSZC1OVpAT6Hwf+agYolWVdTM7v
	biklUf2bQsl7Ivp8ea0BSfiVcrSkFfNv5HqZSjlCy1YrdiVnz2VTeOJ8SRN4xWqdXIp8aHIIpVEiQ
	R7neunQPOy6Vg9NiZxnJgB763nGyG23189wklgKSzMXJIp9Wt8hhXpIqnRhdGdvI/Uty/zZHLnFzi
	7CnYLXAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWpD-00000007pnY-2ztR;
	Mon, 25 Nov 2024 11:00:15 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWoF-00000007pf2-18HK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 10:59:17 +0000
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 44687114016D;
	Mon, 25 Nov 2024 05:59:13 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 25 Nov 2024 05:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1732532353; x=1732618753; bh=vELmZ6h5/W
	R8FUIBqjgkR3JyDZpXfibSEKTzNXo0PKM=; b=c90JJLCI4edzPLg5dWJgRO/1My
	rr5WD58UrXkwPvFlInUY6ywDB18wobpLs0CjH83N7EcKI3qnCIU/ouVb9TS1IJ0b
	CxBLYptFjhEFIU4a8LjgK7C80Y2wcufJwlgdo3ubKUsrnQZA91EtIMSG9xp7+gcQ
	N8lwnxlPDLsBWqz2B0OOPF4Nv7JQYpv4bCJuzV/7NIu2DT+mEhwsNApIrxnKslYY
	zkkkH9rhSKZ0SjEwiuHFdIkWxXf6yEJtF7FBBAMIdbtgsf8GpBGLGItjxaYOpRyZ
	FmNPJ2Kc83ZJI3Y1oCLAejVfWI6NiaE+jE2WhomqTow1MbkHvK0l42fXp8Qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1732532353; x=1732618753; bh=vELmZ6h5/WR8FUIBqjgkR3JyDZpXfibSEKT
	zNXo0PKM=; b=A6/y35E4V3cGRS0rydyKwxi+NhHhDg3XeC58Aif/8V6US/eNFR+
	KczeAKb8eV+AgIEMAaYYLyqb/gsJ3APMTY7ffYlCE4GukfHPpCpuAiS0WjgCCGSL
	6PX0UAhbgiK4ZYq+KJctVShwr3FI3Z7N39JAyITd2zHewaOprGJV72RZryQ69Edk
	E4iHSmMpUiG9luVPHbLxB2krj7m5mhyRtXC4C9zM+ioA4UNIjCGal8HxXNMRBE59
	Jq5aFPf6U2LLmm2PW4TKNXf3bg6nkJtM8Di4psCVzMZStcIZAourjB/065oTtEKg
	5uhnroyftaoCp/ryYs/8JH+ozh4rogiFw6A==
X-ME-Sender: <xms:f1hEZ-uYNuQNznk4Q4BK-HRo5Eo6146u3vX_ALXgeGyG3Sgqrg6zSw>
    <xme:f1hEZzdaPEPSDFnCkNpPhff8z8pzRsC4Xfll-nd44gJBT3WXv1wTC1UKYM6wxASwv
    P0djAECJQC0fVUNmg>
X-ME-Received: <xmr:f1hEZ5wr1K239oOoWX1cRtKWTcVp5mu8gM6giT5O-ddmCauBevYx1WbnhiK5fH09Ty5QS5YOuP90O46ME4SszHjuNX_y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrgeehgddvudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtdfsredttdejnecu
    hfhrohhmpeetlhihshhsrgcutfhoshhsuceohhhisegrlhihshhsrgdrihhsqeenucggtf
    frrghtthgvrhhnpeeiueffhedutdfgvdfhheeghfffieetudetfedvleejkeefgfethfej
    leejvefgffenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhephhhisegrlhihshhsrgdrihhspdhn
    sggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhimh
    honhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgt
    ohhmpdhrtghpthhtohepfhhnkhhlrdhkvghrnhgvlhesghhmrghilhdrtghomhdprhgtph
    htthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopegtohhnohhrodgutheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhho
    sghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngh
    eslhhinhgrrhhordhorhhg
X-ME-Proxy: <xmx:f1hEZ5MlOGN19hlyUd3BEa0sl6JZKhiRrTFZMQsdhR7tKY4aPNFUcg>
    <xmx:f1hEZ-_VcQreC6h5MyaKrdMWkcixfgr2RXIxqaUtbz0g55wH56PWOw>
    <xmx:f1hEZxVt57Ookf_L75dzHov89-kkb8HWgqoRdtqVk5fwO_hvkorSwg>
    <xmx:f1hEZ3fhg70bw7tKd4GURNCwykSpp7d0JBaLG2EmdZ9FARNO1r2ZNA>
    <xmx:gVhEZxf-zRCGuZ1f4UXuN9F-523JqMDm9NRY8nlPLxSaEsStKrrwuBSd>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Nov 2024 05:59:11 -0500 (EST)
Received: by mbp.qyliss.net (Postfix, from userid 1000)
	id 2C51FAAE7; Mon, 25 Nov 2024 11:59:09 +0100 (CET)
Date: Mon, 25 Nov 2024 11:59:09 +0100
From: Alyssa Ross <hi@alyssa.is>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
Message-ID: <gu2ec3gb7q4zty4kmte43xwk7wjvcfzqjcs5x2jikwxjhuxeuo@xep7bkh3p77i>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7trqukwkfsltihs3"
Content-Disposition: inline
In-Reply-To: <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_025916_085920_C7207CF5 
X-CRM114-Status: GOOD (  16.75  )
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


--7trqukwkfsltihs3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
MIME-Version: 1.0

This still has the bug that I originally reported at:
https://github.com/AsahiLinux/linux/issues/258

On Sun, Nov 24, 2024 at 11:29:25PM +0100, Sasha Finkelstein via B4 Relay wr=
ote:
> +static int adp_probe(struct platform_device *pdev)
> +{
> +	struct adp_drv_private *adp;
> +	int err;
> +
> +	adp =3D devm_drm_dev_alloc(&pdev->dev, &adp_driver, struct adp_drv_priv=
ate, drm);
> +	if (IS_ERR(adp))
> +		return PTR_ERR(adp);

Here a child device of pdev->dev is created.  It is not a MIPI DSI
device.

> +
> +	spin_lock_init(&adp->irq_lock);
> +
> +	dev_set_drvdata(&pdev->dev, &adp->drm);
> +
> +	err =3D adp_parse_of(pdev, adp);
> +	if (err < 0)
> +		return err;
> +
> +	adp->dsi.dev =3D &pdev->dev;
> +	adp->dsi.ops =3D &adp_dsi_host_ops;
> +	err =3D mipi_dsi_host_register(&adp->dsi);

Here a MIPI DSI host is registered, with its device set to pdev->dev.
It is expected that the child devices of a DSI host device are all MIPI
DSI devices =E2=80=94 see mipi_dsi_host_unregister() and
mipi_dsi_remove_device_fn().

This means that, when mipi_dsi_host_unregister() is called, which it
will be as part of unloading adpdrm, it will try to find the MIPI DSI
device for adp using container_of() (via to_mipi_dsi_device()), but
there isn't one, so it interprets some other memory as a struct
mipi_dsi_device.

For me, this causes a null pointer dereference.

> +	if (err < 0)
> +		return err;
> +
> +	adp_disable_vblank(adp);
> +	writel(ADP_CTRL_FIFO_ON | ADP_CTRL_VBLANK_ON, adp->fe + ADP_CTRL);
> +
> +	err =3D adp_setup_mode_config(adp);
> +	if (err < 0)
> +		return err;
> +
> +	err =3D devm_request_irq(&pdev->dev, adp->fe_irq, adp_fe_irq, 0,
> +			       "adp-fe", adp);
> +	if (err)
> +		return err;
> +
> +	err =3D drm_dev_register(&adp->drm, 0);
> +	if (err)
> +		return err;
> +	return 0;
> +}


--7trqukwkfsltihs3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRV/neXydHjZma5XLJbRZGEIw/wogUCZ0RYcwAKCRBbRZGEIw/w
omiCAQDFbLv/V2AeCjaFrUuZNO0UNVfDsiju+X9BOieYsiXW6gEA6iIPEMmZ2ebP
a5lcHWKNnJQEBENr0ObRCau2mIuWXAQ=
=l7W4
-----END PGP SIGNATURE-----

--7trqukwkfsltihs3--

