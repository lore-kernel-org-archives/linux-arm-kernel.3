Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C875FE7545C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gUckkQiMWDEV8Y/iNQuijq4dqvWtVuRxF13+jZ5SQ8=; b=hV9ymwZiBuNNpvH5Og3kPVD5su
	8i47W96/mnI9nGo5/8BMisCY7bD+hyJGZmVn7KCONhYo5d1Z4ymH4WOIXxKc9coaAVPRzS2c/FSbD
	tMym21B00L5E4YN4Gj5Jm8QTUK683Hjg6aWjSnY7dLmYieiIseAz09G33wkCARlgBxf8v5hwKQN/y
	Lqkp/vZ0YNZ5YJH4lv2bd5uRoiwsL2MfrTthCS5YBbiNYGej38iiTpxSuj1Oi86LQr8l976zUAUZ4
	KSvAQbv8BsGUrmrcPwv5Uo0C0QZdD96ryd3URkOM/wZqm+QWnzok3r+TWaa1TzNTzyshxu3/9ZOip
	6Nc4gNEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRJp-0000000HBb8-2LEt;
	Wed, 24 Dec 2025 16:02:34 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRJk-0000000HBXz-2ekV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 16:02:31 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-888bd3bd639so76365206d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 08:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766592147; x=1767196947; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0gUckkQiMWDEV8Y/iNQuijq4dqvWtVuRxF13+jZ5SQ8=;
        b=oExquNEm42zjsrxirxGVlOzcg0zDiKQGptqT3ad3ah0XNoLYcA5G8v9Vtw2UmCMwdl
         twPuyR4cuXvU+gZKkS6P/0uhegp7kmvcsygDJEBHd6bwKfD5mVyOHTkbO99OGTsxGxX6
         mmOxEpM1Cnri5HFGgsFdc2ON8CpD96fC4PobxET7RrzP/TXkYZWaCnht+CMsiazzU4rS
         czicgFUWuLBfxqIvLjmd1OF55QVsTl1rd5zntsvMX9ZxLio1xMLcb6ZhFIzGyVk0c+xq
         YqfwvuOk2eWMZb3JW7viqtY2i0lYMGH2VwJTNGeZ9CDXy8WDKyM+iyhFCbFwTcfBZk5U
         JJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766592147; x=1767196947;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gUckkQiMWDEV8Y/iNQuijq4dqvWtVuRxF13+jZ5SQ8=;
        b=bUanEkPE406yyVBfFHH/EsjsQNnS0GSC0S9b+59U+zrXNviS05Y8q2iLkYvq6SSSIk
         N8Z1pdR/294JOw8bPHYrW9gezB3UbiI/aobteyctgawv8la/fTKX5HPbqdhPXYjWmqSR
         nqC44Wu1xJjh1w90PejSVIWksIb6edcERbP+WEekeUKSpUKK3riq+hDGFQ8sROZCVZmj
         q2WjxGgYotmKa8lUKJ2eMxp9sCatGVgyt/n63pwjVSk+cbjdThaE1n9r8/sMonygNwHa
         IEQMilVf+1S7Akwmb9UVwxdgc+pjrg00ihnlQrC68wFdRsyhPlZycL0AdEv3umZXkNgc
         /zng==
X-Forwarded-Encrypted: i=1; AJvYcCXOMhFH8cs6ZKidMM4JkDw9OsoaH/OlMwytIIv6owfFH/SJKlnPMzrUzC0wnUWMOKuObYmzLWme+oLq9qaT0/Wn@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8qkchvfP0tlweWiUKVJt1zqLrrPwm1GKJ9tXANKmWrJ9CBINV
	KTJPwpFMVWo1iwREon6VfJQiiJ3LaILipqrxT2czKDAIU+XpEWLKq4iABpiXRrA6KUY=
X-Gm-Gg: AY/fxX6kADqOr4hXLKlSR4OtpzPrPgJB/sVnl6i11XVPTuPfTVI8UPYBVMhj1506eOV
	mWLROD3TjrusCv9qgl6ao31qsWGUHj/b7PkDcPAwv1dUt1X+xKKMbuA27FThlPw2wnvF8tLmCOW
	s3ZBQzCxt0ItAL2737fonv5caUPFzaxZzacKQTZElWJOPofl6j2ryMJoux3SsE3KcUlTwuGIjEW
	ZutD/a3UVyOqg+Ay7Qc9HBgQ7lHLNOKn7BoPM6mR+sX348xNOu5o+3c3O4jrxsThek7jxwRXBOn
	kBYbO9S0JFU7I8ynMUv6qtm8TSvgcsxxHhULOKIDujm5LzSu9k6d7wG+6SucR99y939iaCm/Xjl
	EbYYQ9+Un8yrHw1Xua1VcPvJfldqv86x2CLKSMpkeb6XJF4m5zPz1PNDl2iG/hC91HMt+hn3x87
	3duFvrSOIBGu1ZWia51OQ6OgjHLmw=
X-Google-Smtp-Source: AGHT+IEFnLq7YYyKCpTAAkpCvsEwt+D1E176gm6ItJAQzHOJHeP7ZSAwy1foR72Go8Tw9D6I6jZcRA==
X-Received: by 2002:a05:6214:23c5:b0:88a:4c50:3be0 with SMTP id 6a1803df08f44-88c5001fe40mr330716406d6.6.1766592147399;
        Wed, 24 Dec 2025 08:02:27 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9623fdd8sm127755006d6.4.2025.12.24.08.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 08:02:26 -0800 (PST)
Message-ID: <8a026dd07133203789e91d0a1662c8b162842fe2.camel@ndufresne.ca>
Subject: Re: [PATCH v2 20/22] media: rockchip: rga: disable multi-core
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
Date: Wed, 24 Dec 2025 11:02:25 -0500
In-Reply-To: <20251203-spu-rga3-v2-20-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-20-989a67947f71@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-wJ3d6X1bJnPZfOqoogSs"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_080228_763028_FA5F1E53 
X-CRM114-Status: GOOD (  20.63  )
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


--=-wJ3d6X1bJnPZfOqoogSs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> Disable multi-core support in preparation of the RGA3 addition. The
> RK3588 SoC features two equal RGA3 cores. This allows scheduling of the
> work between both cores, which is not yet implemented. Until it is
> implemented avoid exposing both cores as independent video devices to
> prevent an ABI breakage when multi-core support is added.

Please add a Link: and reference to the Hantro patch from which is code is =
from.

>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 28 ++++++++++++++++++++=
++++++++
> =C2=A01 file changed, 28 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 3958e71b8987d..65686228b7300 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -660,6 +660,30 @@ static int rga_parse_dt(struct rockchip_rga *rga)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static int rga_disable_multicore(struct device *dev)
> +{
> +	const char *compatible;
> +	struct device_node *node;
> +	int ret;
> +
> +	/* Intentionally ignores the fallback strings */
> +	ret =3D of_property_read_string(dev->of_node, "compatible", &compatible=
);
> +	if (ret)
> +		return ret;
> +
> +	/* first compatible node found from the root node is considered the mai=
n core */
> +	node =3D of_find_compatible_node(NULL, NULL, compatible);
> +	if (!node)
> +		return -EINVAL; /* broken DT? */
> +
> +	if (dev->of_node !=3D node) {
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
> @@ -670,6 +694,10 @@ static int rga_probe(struct platform_device *pdev)
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

--=-wJ3d6X1bJnPZfOqoogSs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUwOkQAKCRDZQZRRKWBy
9DoNAP49R5fmbpOQZrG+CW5SIxPtxG/Kcyz9Q6Ni/IKBI6sVrAEAp1d03zsU2KxX
+bCR04gtVpJFE7vpqhXfYwfkx8nZrAo=
=R+Md
-----END PGP SIGNATURE-----

--=-wJ3d6X1bJnPZfOqoogSs--

