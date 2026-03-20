Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A7F1099B2D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 18:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Onnst1Yk+/sF58VoWLFIxA1fIHkkY4f4Vk4kcTJKl0c=; b=K3b2ZXBqn8KdXw87ldzWXOOpOS
	L6OeWZJsmya6NHaBOZxUhRYTQTPcrVYGBYvhTDLl49rrSYfJuXiYqYMt2bdCqN3fF4oDekiPYu3e7
	4Kw2WPc0yAVxJ3VuFfNWzpKs6lNOkIC3+/MC2hBOnga8oCDStreUKYVQKskCQ1MAWCwc9DAwP4pVO
	non+LfATI95u1m7uGLD9cBTvOJrUrW7n4wsfXkS7Fxvj5EqkfLDKsXd7wLTmG3VQx8iUiUtims2M1
	egzUVuoBKVbauLGcOewHGwLCPb08osAcEDqa0FfxFF86hlelVP/LhPoDDLA3tkXZleSfr8Cvvli0s
	Mzws4ieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3eAj-0000000DLOp-4BD0;
	Fri, 20 Mar 2026 18:02:10 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3eAf-0000000DLNZ-2X3c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 18:02:08 +0000
Received: by mail-qt1-x842.google.com with SMTP id d75a77b69052e-50b266413fbso16605811cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 11:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774029724; x=1774634524; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Onnst1Yk+/sF58VoWLFIxA1fIHkkY4f4Vk4kcTJKl0c=;
        b=NUpn2+hhZ5aXYpuM2bLbTsBm28WAfdhBpS1ND3W5xIhztZMnk5IFHHYQGxf131WMt9
         8gdPTsFMW3AGA0mvRxLD2TG3cqJJzZcEbfO14AiF7haCdqxx0wpnQuaOqF3QwP3vMWTV
         f3dQxIzxVSvtaGQKNcMGmdLZWxaLVxNkZM9DX3qUDpvQ+SwY7r8F6p5Tjku3n75wcSzp
         8G3H8e/BZIYLXXbXsTRNI6jRaOexXMjTBzlvlx4BuyDmzRipKEFk7cSHhE28lC/iqG7z
         EE5hqqArMz7V/sHJLEHY+Ca1U89+bPbJT/vwm4cXOiTy+KhVEmT0ohaH7m+qWVKP8P4+
         mX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774029724; x=1774634524;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Onnst1Yk+/sF58VoWLFIxA1fIHkkY4f4Vk4kcTJKl0c=;
        b=DuBQbMPZ7Jd3PAIGH1fgjyEUuL2FjJ8Z/P0tghww+VqX7NAn/vb0vy78NN05A6f2i3
         NQYRVlzimZbqsrHxdg4S4Z106GF2ZuX0lE4L0AJWeTohGtOFbugBE6M2d9Uv/5i9S38K
         crJQVIIcNoqGf/d4HmrYFvsM/QQ9UwD08a4KPvcekg1mQlo1xp8q3uyNAicw+urJZwbR
         I4uvqLvf/QobVUsOitU3ahnK1hip7lQYyaCI93ZKi9YCHDgTtLYHAhMrN18aG/1ACkvb
         EGNSYUP/2U6X4nMPDr8M0/D/C2TvRYvf1saEWkzu4I4mnR9ay9XlV6lKJ2fhmh5JEDSu
         PX+w==
X-Forwarded-Encrypted: i=1; AJvYcCW8bDkorb0QwJezE0y35LRJoa33xgXBublumntgFg5jyttPPkYmd7fXL+5Z9hEjzWGOOWtW0S94JIT/If4/GLLI@lists.infradead.org
X-Gm-Message-State: AOJu0YyTLVDUWEG/amXOAD9S22dCuMNF4fY1ju8qz4A8J2BsdJyXDfkC
	8MmTI27wOmwhh/32g9yqhsPmuRvXzzcrG1GTY+Dggvkfb22TWd5Ezr8tVwSmtPvPdWU=
X-Gm-Gg: ATEYQzzyyXbRVjyRr402vdzF8Q9GBce2JMf3cYFytTopLywiikk/rhPCB/lRlxd2vg/
	jypMsgUNJ4nwNidDOfIN1S76vkzcPX5wlzuc1NnJaq+RuqoJWJzAn1stNStsVc61EhjO7dBAamC
	0amc6ldFl798f52Y467zqYWyo+IKnRZYoN4ef8yZpFn9gI1nhxy0iM+ld2VIVEwtRPBNDDG6/o1
	Qkp1k0JYwDb//Y6dCJU04ijFVgaR1rkgCoz2XVBUE+seSmLNnlagMHMBUWw9T7lD0ET4bE1mfYh
	oU9w6yFWIFXEq6S1CtmVCfOllq4XywxLGk6tZoBu8mPLLp3+vjxUpGDhSfy8Izjd8VjLMiHJLVz
	mk3kBasOQmIStwM5HQhBk9lw7mCpwDPTKSgGlg+Th4z3DpRurzQBsJtsEygBIBS/Qv1InsS2rDX
	IvnvQm7Ko2E/BBl7SYjzkI09As9JCa
X-Received: by 2002:a05:622a:258c:b0:50b:277f:3c46 with SMTP id d75a77b69052e-50b375f0215mr59663181cf.69.1774029724099;
        Fri, 20 Mar 2026 11:02:04 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e80cb9sm25129221cf.25.2026.03.20.11.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:02:03 -0700 (PDT)
Message-ID: <42883104d21844b34959945e9af161c92644bd81.camel@ndufresne.ca>
Subject: Re: [PATCH v3 25/27] media: rockchip: rga: disable multi-core
 support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Fri, 20 Mar 2026 14:01:59 -0400
In-Reply-To: <20260127-spu-rga3-v3-25-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-25-77b273067beb@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-z2my5z6cvzeWllcl7dyY"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_110205_882032_9FAB2488 
X-CRM114-Status: GOOD (  26.57  )
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


--=-z2my5z6cvzeWllcl7dyY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Disable multi-core support in preparation of the RGA3 addition. The
> RK3588 SoC features two equal RGA3 cores. This allows scheduling of the
> work between both cores, which is not yet implemented. Until it is
> implemented avoid exposing both cores as independent video devices to
> prevent an ABI breakage when multi-core support is added.
>=20
> This patch is copied from the Hantro driver patch to disable multi core
> support by Sebastian Reichel. See
> commit ccdeb8d57f7f ("media: hantro: Disable multicore support")
>=20
> Link: https://lore.kernel.org/all/20240618183816.77597-4-sebastian.reiche=
l@collabora.com/
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 47 ++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 47 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 43644995c152e..e45b9c853d659 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -708,6 +708,49 @@ static int rga_parse_dt(struct rockchip_rga *rga)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +/*
> + * Some SoCs, like RK3588 have multiple identical RGA3 cores, but the
> + * kernel is currently missing support for multi-core handling. Exposing
> + * separate devices for each core to userspace is bad, since that does
> + * not allow scheduling tasks properly (and creates ABI). With this work=
around
> + * the driver will only probe for the first core and early exit for the =
other
> + * cores. Once the driver gains multi-core support, the same technique
> + * for detecting the main core can be used to cluster all cores together=
.
> + */
> +static int rga_disable_multicore(struct device *dev)
> +{
> +	struct device_node *node =3D NULL;
> +	const char *compatible;
> +	bool is_main_core;
> +	int ret;
> +
> +	/* Intentionally ignores the fallback strings */
> +	ret =3D of_property_read_string(dev->of_node, "compatible", &compatible=
);
> +	if (ret)
> +		return ret;
> +
> +	/* The first compatible and available node found is considered the main=
 core */
> +	do {
> +		node =3D of_find_compatible_node(node, NULL, compatible);
> +		if (of_device_is_available(node))
> +			break;
> +	} while (node);
> +
> +	if (!node)
> +		return -EINVAL;
> +
> +	is_main_core =3D (dev->of_node =3D=3D node);
> +
> +	of_node_put(node);
> +
> +	if (!is_main_core) {
> +		dev_info(dev, "missing multi-core support, ignoring this instance\n");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> =C2=A0static int rga_probe(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga;
> @@ -718,6 +761,10 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0	if (!pdev->dev.of_node)
> =C2=A0		return -ENODEV;
> =C2=A0
> +	ret =3D rga_disable_multicore(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> =C2=A0	rga =3D devm_kzalloc(&pdev->dev, sizeof(*rga), GFP_KERNEL);
> =C2=A0	if (!rga)
> =C2=A0		return -ENOMEM;

--=-z2my5z6cvzeWllcl7dyY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2LmAAKCRDZQZRRKWBy
9MZsAQCqTBzD03pb+ti7XEpzLUwzJaRWq1EGrE7Yap2Xjv5SlQEAq+a51F+Itk6Y
QK1DHm1sCQVkk8iD50vTHHHekOqdxwk=
=poHg
-----END PGP SIGNATURE-----

--=-z2my5z6cvzeWllcl7dyY--

